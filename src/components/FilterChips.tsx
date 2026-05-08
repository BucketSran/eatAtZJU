type FilterChipsProps = {
  items: string[]
  active: string
  onChange: (item: string) => void
}

export function FilterChips({ items, active, onChange }: FilterChipsProps) {
  return (
    <div className="chip-row" aria-label="筛选标签">
      {items.map((item) => (
        <button key={item} className={`chip ${active === item ? 'active' : ''}`} type="button" onClick={() => onChange(item)}>
          {item}
        </button>
      ))}
    </div>
  )
}
