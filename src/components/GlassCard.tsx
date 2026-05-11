import type { PropsWithChildren } from 'react'

type GlassCardProps = PropsWithChildren<{
  className?: string
  id?: string
}>

export function GlassCard({ children, className = '', id }: GlassCardProps) {
  return <section className={`glass-card ${className}`.trim()} id={id}>{children}</section>
}
