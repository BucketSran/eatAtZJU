import type { Restaurant } from '../types'

export type MapProvider = 'amap' | 'baidu' | 'apple'

export type MapNavigationLink = {
  href: string
  label: string
  provider: MapProvider
}

function encode(value: string) {
  return encodeURIComponent(value)
}

function gcj02ToBd09(latitude: number, longitude: number) {
  const xPi = (Math.PI * 3000) / 180
  const z = Math.sqrt(longitude * longitude + latitude * latitude) + 0.00002 * Math.sin(latitude * xPi)
  const theta = Math.atan2(latitude, longitude) + 0.000003 * Math.cos(longitude * xPi)
  return {
    latitude: z * Math.sin(theta) + 0.006,
    longitude: z * Math.cos(theta) + 0.0065
  }
}

function buildAmapUrl(restaurant: Restaurant) {
  const destination = `${restaurant.longitude},${restaurant.latitude},${encode(restaurant.name)}`
  return `https://uri.amap.com/navigation?to=${destination}&mode=walk&policy=1&coordinate=gaode&callnative=1&src=eatAtZJU`
}

function buildBaiduUrl(restaurant: Restaurant) {
  const bd09 = gcj02ToBd09(restaurant.latitude, restaurant.longitude)
  const params = new URLSearchParams({
    destination: `latlng:${bd09.latitude.toFixed(6)},${bd09.longitude.toFixed(6)}|name:${restaurant.name}`,
    mode: 'walking',
    region: '杭州',
    output: 'html',
    src: 'eatAtZJU'
  })
  return `https://api.map.baidu.com/direction?${params.toString()}`
}

function buildAppleUrl(restaurant: Restaurant) {
  const params = new URLSearchParams({
    daddr: `${restaurant.latitude},${restaurant.longitude}`,
    q: restaurant.name,
    dirflg: 'w'
  })
  return `https://maps.apple.com/?${params.toString()}`
}

export function getMapNavigationLinks(restaurant: Restaurant): MapNavigationLink[] {
  return [
    {
      provider: 'amap',
      label: '高德地图',
      href: buildAmapUrl(restaurant)
    },
    {
      provider: 'baidu',
      label: '百度地图',
      href: buildBaiduUrl(restaurant)
    },
    {
      provider: 'apple',
      label: '苹果地图',
      href: buildAppleUrl(restaurant)
    }
  ]
}
