export type ToastTone = 'info' | 'success' | 'error'

export type ToastPayload = {
  message: string
  tone?: ToastTone
}

export const TOAST_EVENT = 'eatAtZju:toast'

export function showToast(message: string, tone: ToastTone = 'info') {
  if (typeof window === 'undefined') return
  window.dispatchEvent(new CustomEvent<ToastPayload>(TOAST_EVENT, { detail: { message, tone } }))
}
