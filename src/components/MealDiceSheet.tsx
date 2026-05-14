import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { getMapNavigationLinks } from '../lib/mapLinks'
import { getRandomIndex, getRandomToken } from '../lib/random'
import { getRestaurantDisplay, getRestaurantScore } from '../lib/restaurantDisplay'
import { showToast } from '../lib/toast'
import { describeApiSource, listRestaurantsRemote } from '../services/restaurantService'
import type { RecommendationContext, RestaurantFilters, RestaurantSummary } from '../types'
import { BottomSheet } from './BottomSheet'

type DiceOption = {
  id: string
  label: string
  restaurant?: RestaurantSummary
  source: 'custom' | 'system'
  subtitle: string
}

type MealDiceSheetProps = {
  context: RecommendationContext
  filters: RestaurantFilters
  open: boolean
  summary: string
  onClose: () => void
}

const MAX_DICE_FACES = 6

function buildRestaurantOption(restaurant: RestaurantSummary): DiceOption {
  return {
    id: `restaurant:${restaurant.id}`,
    label: restaurant.name,
    restaurant,
    source: 'system',
    subtitle: `${restaurant.area} · ¥${restaurant.price}/人 · 推荐 ${getRestaurantScore(restaurant)}`
  }
}

function getShortLabel(label: string) {
  const trimmed = label.trim()
  return trimmed.length > 4 ? `${trimmed.slice(0, 4)}` : trimmed
}

function getDiceFaceLabel(index: number, option?: DiceOption) {
  return option ? getShortLabel(option.label) : `${index + 1}`
}

function pickSystemFaces(restaurants: RestaurantSummary[], customLabels: Set<string>) {
  return restaurants
    .map((restaurant) => ({
      option: buildRestaurantOption(restaurant),
      seed: getRandomIndex(10_000)
    }))
    .filter(({ option }) => !customLabels.has(option.label))
    .sort((left, right) => left.seed - right.seed)
    .map(({ option }) => option)
}

export function MealDiceSheet({ context, filters, open, summary, onClose }: MealDiceSheetProps) {
  const rollTimeoutRef = useRef<number | null>(null)
  const [emptyFaceDrafts, setEmptyFaceDrafts] = useState<Record<number, string>>({})
  const [dataSource, setDataSource] = useState('等待生成候选面')
  const [candidateReloadKey, setCandidateReloadKey] = useState(0)
  const [faceNumber, setFaceNumber] = useState(1)
  const [rollKey, setRollKey] = useState(0)
  const [isLoadingCandidates, setIsLoadingCandidates] = useState(false)
  const [isRolling, setIsRolling] = useState(false)
  const [options, setOptions] = useState<DiceOption[]>([])
  const [result, setResult] = useState<DiceOption | null>(null)
  const activeOptions = useMemo(() => options.slice(0, MAX_DICE_FACES), [options])
  const emptyFaceCount = MAX_DICE_FACES - activeOptions.length
  const selectedVisual = result?.restaurant ? getRestaurantDisplay(result.restaurant) : null
  const navigationLink = result?.restaurant ? getMapNavigationLinks(result.restaurant)[0] : null

  useEffect(() => {
    if (!open) return undefined
    const controller = new AbortController()
    setIsLoadingCandidates(true)
    listRestaurantsRemote({ ...filters, sort: 'recommended' }, context, controller.signal)
      .then((response) => {
        setOptions((currentOptions) => {
          const customOptions = currentOptions.filter((option) => option.source === 'custom')
          const customLabels = new Set(customOptions.map((option) => option.label))
          const systemOptions = pickSystemFaces(response.data, customLabels)
          const nextOptions = [
            ...customOptions,
            ...systemOptions.filter((option) => !customLabels.has(option.label))
          ].slice(0, MAX_DICE_FACES)
          return nextOptions
        })
        setDataSource(describeApiSource(response.source, response.fallbackReason))
      })
      .catch((error: unknown) => {
        if (error instanceof DOMException && error.name === 'AbortError') return
        setDataSource('候选面加载失败，可以先手动加入餐厅。')
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoadingCandidates(false)
      })

    return () => controller.abort()
  }, [candidateReloadKey, context, filters, open])

  useEffect(() => {
    if (!open && rollTimeoutRef.current) {
      window.clearTimeout(rollTimeoutRef.current)
      rollTimeoutRef.current = null
      setIsRolling(false)
    }
  }, [open])

  useEffect(() => {
    return () => {
      if (rollTimeoutRef.current) window.clearTimeout(rollTimeoutRef.current)
    }
  }, [])

  function updateEmptyFaceDraft(faceIndex: number, value: string) {
    setEmptyFaceDrafts((drafts) => ({
      ...drafts,
      [faceIndex]: value
    }))
  }

  function addCustomOptionFromLabel(rawLabel: string, faceIndex: number) {
    if (isRolling) return
    const label = rawLabel.trim()
    if (!label) {
      showToast('先在空面里写一个候选餐厅或菜名。', 'info')
      return
    }
    if (activeOptions.length >= MAX_DICE_FACES) {
      showToast('骰子已经满 6 面，先删掉一个再加。', 'info')
      return
    }
    if (activeOptions.some((option) => option.label === label)) {
      showToast('这个选项已经在骰子上了。', 'info')
      return
    }
    const customOption: DiceOption = {
      id: `custom:${getRandomToken()}`,
      label,
      source: 'custom',
      subtitle: '你手动加入的候选项'
    }
    setOptions((currentOptions) => [
      ...currentOptions,
      customOption
    ].slice(0, MAX_DICE_FACES))
    setEmptyFaceDrafts((drafts) => {
      const nextDrafts = { ...drafts }
      delete nextDrafts[faceIndex]
      return nextDrafts
    })
    showToast(`已加入：${label}`, 'success')
  }

  function removeOption(optionId: string) {
    if (isRolling) return
    setOptions((currentOptions) => currentOptions.filter((option) => option.id !== optionId))
    setResult((currentResult) => (currentResult?.id === optionId ? null : currentResult))
  }

  function rollDice() {
    if (!activeOptions.length) {
      showToast('骰子还没有候选面，先加一个选项。', 'info')
      return
    }
    if (rollTimeoutRef.current) window.clearTimeout(rollTimeoutRef.current)
    const nextIndex = getRandomIndex(activeOptions.length)
    setIsRolling(true)
    setRollKey((currentKey) => currentKey + 1)
    setResult(null)
    setFaceNumber((nextIndex % MAX_DICE_FACES) + 1)
    rollTimeoutRef.current = window.setTimeout(() => {
      const nextResult = activeOptions[nextIndex]
      setResult(nextResult)
      setIsRolling(false)
      showToast(`骰子决定：${nextResult.label}`, 'success')
    }, 950)
  }

  function refillSystemFaces() {
    if (isRolling) return
    setOptions((currentOptions) => currentOptions.filter((option) => option.source === 'custom'))
    setResult(null)
    setDataSource('正在重新装填系统候选面…')
    setCandidateReloadKey((currentKey) => currentKey + 1)
  }

  return (
    <BottomSheet
      open={open}
      title="饭局骰子"
      description={`把纠结交给 6 面骰。当前边界：${summary || '还没有需求边界'}。`}
      onClose={onClose}
    >
      <div className="meal-dice-panel">
        <section className="meal-dice-stage" aria-live="polite">
          <div
            key={rollKey}
            className={`dice-cube face-result-${faceNumber} ${isRolling ? 'rolling' : ''}`}
            aria-label={`当前骰子面 ${faceNumber}`}
          >
            {Array.from({ length: MAX_DICE_FACES }, (_, index) => (
              <span key={index} className={`dice-face face-${index + 1}`}>
                {getDiceFaceLabel(index, activeOptions[index])}
              </span>
            ))}
          </div>
          <div className="meal-dice-copy">
            <p className="eyebrow">DICE MODE</p>
            <h3>{result ? result.label : isRolling ? '骰子正在转…' : '6 面同权，摇到谁就吃谁'}</h3>
            <p>{result ? result.subtitle : `${activeOptions.length} 个候选面${emptyFaceCount ? `，还可以再加 ${emptyFaceCount} 个` : '，骰子已装满'}。`}</p>
            <div className="meal-dice-actions">
              <button className="primary-action" type="button" disabled={isRolling || isLoadingCandidates || !activeOptions.length} onClick={rollDice}>
                {isRolling ? '旋转中…' : '投骰子'}
              </button>
              <button className="secondary-action" type="button" disabled={isLoadingCandidates} onClick={refillSystemFaces}>
                保留自定义，换推荐
              </button>
            </div>
            <p className="helper-text subtle-helper">{isLoadingCandidates ? '正在装填当前推荐候选面…' : dataSource}</p>
          </div>
        </section>

        <section className="dice-face-list" aria-label="骰子候选面">
          {Array.from({ length: MAX_DICE_FACES }, (_, index) => {
            const option = activeOptions[index]
            if (option) {
              return (
                <article className={`dice-option ${result?.id === option.id ? 'winner' : ''}`} key={option.id}>
                  <span>{index + 1}</span>
                  <div>
                    <strong>{option.label}</strong>
                    <small>{option.subtitle}</small>
                  </div>
                  <button type="button" aria-label={`移除 ${option.label}`} disabled={isRolling} onClick={() => removeOption(option.id)}>
                    ×
                  </button>
                </article>
              )
            }

            const draft = emptyFaceDrafts[index] ?? ''
            return (
              <article className="dice-option empty editable" key={`empty-${index}`}>
                <span>{index + 1}</span>
                <div className="dice-empty-editor">
                  <input
                    aria-label={`第 ${index + 1} 面候选餐厅或菜名`}
                    type="text"
                    autoComplete="off"
                    inputMode="text"
                    placeholder="直接输入候选"
                    value={draft}
                    onChange={(event) => updateEmptyFaceDraft(index, event.target.value)}
                    onKeyDown={(event) => {
                      if (event.key !== 'Enter') return
                      event.preventDefault()
                      addCustomOptionFromLabel(draft, index)
                    }}
                  />
                  <small>回车或点 + 加到这一轮。</small>
                </div>
                <button className="dice-empty-add" type="button" aria-label={`加入第 ${index + 1} 面候选`} disabled={isRolling || !draft.trim()} onClick={() => addCustomOptionFromLabel(draft, index)}>
                  +
                </button>
              </article>
            )
          })}
        </section>

        {result ? (
          <section className="dice-result-card" aria-live="polite">
            {result.restaurant && selectedVisual ? (
              <div className={`dice-result-mark ${selectedVisual.tone}`} aria-hidden="true">
                {selectedVisual.coverIcon}
              </div>
            ) : (
              <div className="dice-result-mark custom" aria-hidden="true">骰</div>
            )}
            <div>
              <span>{result.source === 'system' ? '推荐池候选' : '自定义候选'}</span>
              <h3>{result.label}</h3>
              <p>{result.restaurant ? `${result.restaurant.area} · ${result.restaurant.cuisine} · ¥${result.restaurant.price}/人` : '这是你手动加入的选项，可以直接拿去群里定饭局。'}</p>
              <div className="meal-dice-actions">
                {result.restaurant ? (
                  <Link className="primary-action" to={`/restaurants/${result.restaurant.id}`} onClick={onClose}>
                    看详情
                  </Link>
                ) : null}
                {navigationLink ? (
                  <a className="secondary-action" href={navigationLink.href} target="_blank" rel="noreferrer">
                    去导航
                  </a>
                ) : null}
                <button className="secondary-action" type="button" onClick={rollDice}>
                  不服，再投
                </button>
              </div>
            </div>
          </section>
        ) : null}
      </div>
    </BottomSheet>
  )
}
