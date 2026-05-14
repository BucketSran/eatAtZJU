export type AMapMapInstance = {
  add: (markers: AMapMarkerInstance[]) => void
  destroy: () => void
  getZoom?: () => number
  remove: (markers: AMapMarkerInstance[]) => void
  resize?: () => void
  setCenter: (position: [number, number]) => void
  setFeatures?: (features: string[]) => void
  setFitView: (markers?: AMapMarkerInstance[]) => void
  setMapStyle?: (style: string) => void
  setZoom?: (zoom: number) => void
  zoomIn?: () => void
  zoomOut?: () => void
}

export type AMapMarkerInstance = {
  getPosition: () => unknown
  on: (event: 'click', callback: () => void) => void
}

type AMapInfoWindowInstance = {
  open: (map: AMapMapInstance, position: unknown) => void
  setContent: (content: string) => void
}

type AMapNamespace = {
  InfoWindow: new (options: Record<string, unknown>) => AMapInfoWindowInstance
  Map: new (container: HTMLElement, options: Record<string, unknown>) => AMapMapInstance
  Marker: new (options: Record<string, unknown>) => AMapMarkerInstance
  Pixel: new (x: number, y: number) => unknown
}

declare global {
  interface Window {
    AMap?: AMapNamespace
    _AMapSecurityConfig?: {
      securityJsCode?: string
    }
  }
}

let amapPromise: Promise<AMapNamespace> | null = null

export function getAmapConfig() {
  return {
    key: import.meta.env.VITE_AMAP_JS_KEY || '',
    securityCode: import.meta.env.VITE_AMAP_SECURITY_CODE || ''
  }
}

export function loadAmap() {
  if (typeof window === 'undefined') return Promise.reject(new Error('AMap can only load in the browser'))
  if (window.AMap) return Promise.resolve(window.AMap)
  if (amapPromise) return amapPromise

  const { key, securityCode } = getAmapConfig()
  if (!key) return Promise.reject(new Error('Missing VITE_AMAP_JS_KEY'))

  if (securityCode) {
    window._AMapSecurityConfig = {
      securityJsCode: securityCode
    }
  }

  amapPromise = new Promise<AMapNamespace>((resolve, reject) => {
    const existing = document.querySelector<HTMLScriptElement>('script[data-eat-at-zju-amap="1"]')
    if (existing) {
      existing.addEventListener('load', () => (window.AMap ? resolve(window.AMap) : reject(new Error('AMap loaded without namespace'))), { once: true })
      existing.addEventListener('error', () => reject(new Error('Failed to load AMap script')), { once: true })
      return
    }

    const script = document.createElement('script')
    script.async = true
    script.defer = true
    script.dataset.eatAtZjuAmap = '1'
    script.src = `https://webapi.amap.com/maps?v=2.0&key=${encodeURIComponent(key)}`
    script.addEventListener('load', () => (window.AMap ? resolve(window.AMap) : reject(new Error('AMap loaded without namespace'))), { once: true })
    script.addEventListener('error', () => reject(new Error('Failed to load AMap script')), { once: true })
    document.head.appendChild(script)
  })

  return amapPromise
}
