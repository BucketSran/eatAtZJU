import { useEffect, useRef, useState } from 'react'
import { TOAST_EVENT, type ToastPayload, type ToastTone } from '../lib/toast'

type ToastState = {
  id: number
  message: string
  tone: ToastTone
}

export function ToastHost() {
  const [toast, setToast] = useState<ToastState | null>(null)
  const timerRef = useRef<number | null>(null)

  useEffect(() => {
    const onToast = (event: Event) => {
      const payload = (event as CustomEvent<ToastPayload>).detail
      if (!payload?.message) return
      if (timerRef.current) window.clearTimeout(timerRef.current)
      setToast({ id: Date.now(), message: payload.message, tone: payload.tone || 'info' })
      timerRef.current = window.setTimeout(() => setToast(null), 2600)
    }

    window.addEventListener(TOAST_EVENT, onToast)
    return () => {
      window.removeEventListener(TOAST_EVENT, onToast)
      if (timerRef.current) window.clearTimeout(timerRef.current)
    }
  }, [])

  return (
    <div className="toast-region" aria-live="polite" aria-atomic="true">
      {toast ? <div className={`toast-card ${toast.tone}`} key={toast.id}>{toast.message}</div> : null}
    </div>
  )
}
