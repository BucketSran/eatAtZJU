export type PresetAvatar = {
  color: string
  id: string
  label: string
  text: string
}

export const presetAvatars: PresetAvatar[] = [
  { id: 'rice', label: '饭团侠', text: '饭', color: '#f0aa38' },
  { id: 'duck', label: '浴场小鸭', text: '鸭', color: '#4d9a8d' },
  { id: 'frog', label: '湖边蛙', text: '蛙', color: '#5aa37c' },
  { id: 'noodle', label: '面霸', text: '面', color: '#6d8fbd' },
  { id: 'chili', label: '辣椒人', text: '辣', color: '#c84b35' },
  { id: 'sleepy', label: '早八魂', text: '困', color: '#8c6338' }
]

export function getPresetAvatar(id?: string) {
  return presetAvatars.find((avatar) => avatar.id === id) ?? presetAvatars[0]
}
