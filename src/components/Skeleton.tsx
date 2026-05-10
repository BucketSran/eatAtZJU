type SkeletonListProps = {
  count?: number
}

export function SkeletonList({ count = 3 }: SkeletonListProps) {
  return (
    <div className="skeleton-list" aria-label="正在加载内容">
      {Array.from({ length: count }, (_, index) => (
        <div className="skeleton-card" key={index}>
          <span className="skeleton-mark" />
          <div className="skeleton-lines">
            <span />
            <span />
            <span />
          </div>
        </div>
      ))}
    </div>
  )
}
