import type { ReactNode } from 'react'
import { GlassCard } from './GlassCard'

type EmptyStateProps = {
  action?: ReactNode
  eyebrow?: string
  title: string
  description: string
}

export function EmptyState({ action, eyebrow = 'EMPTY STATE', title, description }: EmptyStateProps) {
  return (
    <GlassCard className="empty-state-card">
      <p className="eyebrow">{eyebrow}</p>
      <h2>{title}</h2>
      <p>{description}</p>
      {action ? <div className="hero-actions compact-actions">{action}</div> : null}
    </GlassCard>
  )
}
