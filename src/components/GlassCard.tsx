import type { HTMLAttributes, PropsWithChildren } from 'react'

type GlassCardProps = PropsWithChildren<HTMLAttributes<HTMLElement> & {
  className?: string
}>

export function GlassCard({ children, className = '', ...props }: GlassCardProps) {
  return <section className={`glass-card ${className}`.trim()} {...props}>{children}</section>
}
