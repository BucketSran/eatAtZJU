import { useEffect, useRef, type ReactNode } from 'react'

type BottomSheetProps = {
  children: ReactNode
  description?: string
  open: boolean
  title: string
  onClose: () => void
}

export function BottomSheet({ children, description, open, title, onClose }: BottomSheetProps) {
  const panelRef = useRef<HTMLDivElement | null>(null)

  useEffect(() => {
    if (!open) return undefined
    const previousOverflow = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    document.body.classList.add('has-open-sheet')
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKeyDown)
    requestAnimationFrame(() => panelRef.current?.focus())
    return () => {
      document.body.style.overflow = previousOverflow
      document.body.classList.remove('has-open-sheet')
      window.removeEventListener('keydown', onKeyDown)
    }
  }, [onClose, open])

  if (!open) return null

  return (
    <div className="bottom-sheet-backdrop" role="presentation" onClick={onClose}>
      <section className="bottom-sheet" role="dialog" aria-modal="true" aria-labelledby="bottom-sheet-title" ref={panelRef} tabIndex={-1} onClick={(event) => event.stopPropagation()}>
        <div className="bottom-sheet-handle" aria-hidden="true" />
        <div className="bottom-sheet-header">
          <div>
            <p className="eyebrow">FILTERS</p>
            <h2 id="bottom-sheet-title">{title}</h2>
            {description ? <p>{description}</p> : null}
          </div>
          <button className="text-button" type="button" onClick={onClose}>关闭</button>
        </div>
        <div className="bottom-sheet-content">{children}</div>
      </section>
    </div>
  )
}
