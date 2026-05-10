import { normalizeGroupedTags, toggleGroupedTag } from '../constants/restaurantTaxonomy'

export type TagGroup = {
  hint?: string
  maxVisible?: number
  tags: readonly string[]
  title: string
}

type TagGroupSelectorProps = {
  className?: string
  exclusiveGroups?: readonly (readonly string[])[]
  groups: readonly TagGroup[]
  onChange: (tags: string[]) => void
  selectedTags: string[]
}

function renderTagButton(tag: string, active: boolean, onClick: () => void) {
  return (
    <button key={tag} className={`chip ${active ? 'active' : ''}`} type="button" aria-pressed={active} onClick={onClick}>
      {tag}
    </button>
  )
}

export function TagGroupSelector({ className = '', exclusiveGroups, groups, onChange, selectedTags }: TagGroupSelectorProps) {
  const normalizedSelectedTags = normalizeGroupedTags(selectedTags, exclusiveGroups)

  function toggleTag(tag: string) {
    onChange(toggleGroupedTag(normalizedSelectedTags, tag, exclusiveGroups))
  }

  return (
    <div className={`tag-group-selector ${className}`.trim()}>
      {normalizedSelectedTags.length ? (
        <div className="selected-tag-summary" aria-label="已选择标签">
          <span>已选</span>
          {normalizedSelectedTags.map((tag) => renderTagButton(tag, true, () => toggleTag(tag)))}
        </div>
      ) : null}

      {groups.map((group) => {
        const maxVisible = group.maxVisible ?? 6
        const visibleTags = group.tags.slice(0, maxVisible)
        const hiddenTags = group.tags.slice(maxVisible)
        const hiddenSelectedCount = hiddenTags.filter((tag) => normalizedSelectedTags.includes(tag)).length

        return (
          <section className="tag-group-card" key={group.title}>
            <div className="tag-group-head">
              <div>
                <strong>{group.title}</strong>
                {group.hint ? <p>{group.hint}</p> : null}
              </div>
              {hiddenSelectedCount ? <span>{hiddenSelectedCount} 个更多项已选</span> : null}
            </div>
            <div className="chip-row" aria-label={group.title}>
              {visibleTags.map((tag) => renderTagButton(tag, normalizedSelectedTags.includes(tag), () => toggleTag(tag)))}
            </div>
            {hiddenTags.length ? (
              <details className="tag-group-more">
                <summary>展开更多 {hiddenTags.length} 个</summary>
                <div className="chip-row" aria-label={`${group.title}更多标签`}>
                  {hiddenTags.map((tag) => renderTagButton(tag, normalizedSelectedTags.includes(tag), () => toggleTag(tag)))}
                </div>
              </details>
            ) : null}
          </section>
        )
      })}
    </div>
  )
}
