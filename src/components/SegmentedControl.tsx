type SegmentedControlProps<T extends string> = {
  label: string
  options: Array<{ label: string; value: T }>
  value: T
  onChange: (value: T) => void
}

export function SegmentedControl<T extends string>({ label, options, value, onChange }: SegmentedControlProps<T>) {
  return (
    <div className="segmented-group" aria-label={label}>
      {options.map((option) => (
        <button key={option.value} className={`segment ${value === option.value ? 'active' : ''}`} type="button" onClick={() => onChange(option.value)}>
          {option.label}
        </button>
      ))}
    </div>
  )
}
