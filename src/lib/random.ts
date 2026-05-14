export function getRandomIndex(length: number) {
  if (!Number.isFinite(length) || length <= 0) return 0
  const max = Math.floor(length)
  const cryptoApi = globalThis.crypto
  if (cryptoApi?.getRandomValues) {
    const bucket = new Uint32Array(1)
    cryptoApi.getRandomValues(bucket)
    return bucket[0] % max
  }
  return Math.floor(Math.random() * max)
}

export function getRandomToken() {
  const cryptoApi = globalThis.crypto
  if (cryptoApi?.randomUUID) return cryptoApi.randomUUID()
  return `${Date.now().toString(36)}-${Math.random().toString(36).slice(2)}`
}
