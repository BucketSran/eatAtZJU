export const serviceModeOptions = ['都可以', '堂食', '外卖'] as const
export const mealPeriodOptions = ['早餐', '中餐', '下午茶', '晚餐', '夜宵'] as const
export const campusOptions = ['紫金港', '玉泉', '西溪', '华家池', '之江', '海宁'] as const

export type CampusOption = (typeof campusOptions)[number]

export const campusCenters: Record<CampusOption, { latitude: number; longitude: number; dataStatus: 'ready' | 'collecting' }> = {
  紫金港: { latitude: 30.302761, longitude: 120.081964, dataStatus: 'ready' },
  玉泉: { latitude: 30.263801, longitude: 120.123563, dataStatus: 'ready' },
  西溪: { latitude: 30.275303, longitude: 120.142375, dataStatus: 'ready' },
  华家池: { latitude: 30.269386, longitude: 120.196807, dataStatus: 'collecting' },
  之江: { latitude: 30.191619, longitude: 120.12779, dataStatus: 'collecting' },
  海宁: { latitude: 30.512801, longitude: 120.681777, dataStatus: 'collecting' }
}

export const quickRandomTags = ['正餐', '近', '校内', '非食堂', '外卖', '堂食', '一人食', '聚餐', '夜宵', '面食', '下饭', '实惠', '辣', '不辣', '饮品'] as const
export const quickRandomExclusiveGroups = [
  ['辣', '不辣'],
  ['外卖', '堂食'],
  ['食堂', '非食堂']
] as const

export const scenarioTagGroups = [
  {
    title: '这顿饭的场景',
    hint: '同一层可以重合，多选越具体越好',
    tags: ['一人食', '聚餐', '赶课快吃', '自习后', '约会拍照', '运动后', '懒得出校']
  }
] as const

export const hardFilterGroups = [
  {
    key: 'distanceLabel',
    title: '距离',
    hint: '这是硬条件，直接影响候选范围',
    options: ['不限', '10分钟内', '20分钟内', '远一点也行']
  },
  {
    key: 'spiceLevel',
    title: '辣度',
    hint: '冲突项放在同一组，只能选一个',
    options: ['不限', '辣', '不辣']
  },
  {
    key: 'loadLevel',
    title: '饮食负担',
    hint: '轻一点还是吃爽一点',
    options: ['不限', '轻负担', '大份', '快乐碳水']
  }
] as const

export const dietaryConstraintTags = ['清真友好'] as const

export const preferenceTagGroups = [
  {
    title: '常用决策',
    hint: '高频选择优先放这里，适合快速建立推荐画像',
    tags: ['近', '实惠', '一人食', '聚餐', '夜宵', '下饭'],
    maxVisible: 6
  },
  {
    title: '口味与体感',
    hint: '这些标签可以叠加，比如“暖胃 + 面食”',
    tags: ['暖胃', '面食', '小吃', '清爽', '快餐', '拍照'],
    maxVisible: 6
  },
  {
    title: '饮品甜点',
    hint: '避免奶茶咖啡和正餐偏好混在一排',
    tags: ['咖啡', '甜品', '奶茶'],
    maxVisible: 6
  },
  {
    title: '品类与排雷',
    hint: '食堂/非食堂是互斥项；其余用于排序加权',
    tags: ['烧烤', '火锅', '食堂', '非食堂', '异国料理', '清真友好'],
    maxVisible: 6
  }
] as const

export const preferenceExclusiveGroups = [
  ['食堂', '非食堂']
] as const

export const taxonomyTagMap: Record<string, string[]> = {
  都可以: [],
  堂食: ['校内', '食堂', '聚餐', '下饭', '拍照', '暖胃', '清真友好', '烧烤', '火锅', '异国料理'],
  外卖: ['快餐', '一人食', '实惠', '人均30内', '轻负担', '奶茶', '咖啡', '甜品'],
  早餐: ['暖胃', '面食', '校内', '近', '清真友好'],
  中餐: ['午餐快吃', '课间午餐', '赶课午餐', '快餐', '实惠', '一人食', '校内', '人均30内'],
  下午茶: ['下午自习', '咖啡', '甜品', '奶茶', '拍照', '轻负担', '嘴馋'],
  晚餐: ['晚饭快吃', '晚饭改善', '晚餐聚餐', '聚餐', '下饭', '辣', '火锅', '烧烤', '人均50内'],
  夜宵: ['夜宵', '夜宵改善', '晚归加餐', '小吃', '烧烤', '火锅', '奶茶', '暖胃'],
  正餐: ['正餐', '中餐简餐', '校内食堂', '快餐小吃', '面食粉面', '烧烤烤肉', '火锅麻辣烫', '下饭'],
  饮品: ['饮品', '茶饮', '咖啡', '甜品烘焙', '奶茶', '甜品'],
  近: ['近', '校内', '懒得出校'],
  校内: ['校内', '食堂', '校内食堂', '懒得出校'],
  一人食: ['一人食', '一个人', '单人吃饭', '独自觅食'],
  聚餐: ['聚餐', '多人拼桌', '多人约饭', '四人聚餐'],
  赶课快吃: ['赶课午餐', '赶课午饭', '课间午餐', '快速解决', '快餐'],
  自习后: ['晚自习前', '下午自习', '晚课后'],
  约会拍照: ['拍照', '拍照打卡', '轻约会'],
  运动后: ['健身后', '夜跑后', '轻负担'],
  懒得出校: ['懒得出校', '校内', '近'],
  辣: ['辣', '微辣', '想吃辣'],
  不辣: ['不辣', '不想吃辣', '清淡晚饭'],
  轻负担: ['轻负担', '不想太油', '清爽', '健身后'],
  大份: ['大份', '想吃大份', '大份下饭'],
  快乐碳水: ['快乐碳水', '面食', '小吃'],
  清真友好: ['清真友好'],
  暖胃: ['暖胃', '雨天热汤', '雨天热饭'],
  下饭: ['下饭', '大份下饭'],
  面食: ['面食', '粉', '面'],
  小吃: ['小吃', '夜宵'],
  拍照: ['拍照', '拍照打卡'],
  清爽: ['清爽', '清爽午餐', '清爽汤粉'],
  快餐: ['快餐', '快速解决'],
  实惠: ['实惠', '预算友好', '人均30内'],
  咖啡: ['咖啡'],
  甜品: ['甜品'],
  奶茶: ['奶茶', '茶饮'],
  烧烤: ['烧烤'],
  火锅: ['火锅', '麻辣烫'],
  食堂: ['食堂', '校内食堂'],
  非食堂: ['非食堂'],
  异国料理: ['异国料理', '异国简餐']
}

export function parseTagsParam(value: string | null) {
  return (value ?? '')
    .split(',')
    .map((tag) => tag.trim())
    .filter((tag) => tag && tag !== '全部')
}

export function toggleMultiTag(currentTags: string[], tag: string) {
  return currentTags.includes(tag) ? currentTags.filter((currentTag) => currentTag !== tag) : [...currentTags, tag]
}

export function toggleGroupedTag(currentTags: string[], tag: string, exclusiveGroups: readonly (readonly string[])[] = preferenceExclusiveGroups) {
  if (currentTags.includes(tag)) return currentTags.filter((currentTag) => currentTag !== tag)
  const exclusiveGroup = exclusiveGroups.find((group) => group.includes(tag))
  const nextTags = exclusiveGroup ? currentTags.filter((currentTag) => !exclusiveGroup.includes(currentTag)) : currentTags
  return [...nextTags, tag]
}

export function normalizeGroupedTags(tags: string[], exclusiveGroups: readonly (readonly string[])[] = preferenceExclusiveGroups) {
  return tags.reduce<string[]>((currentTags, tag) => {
    if (currentTags.includes(tag)) return currentTags
    const exclusiveGroup = exclusiveGroups.find((group) => group.includes(tag))
    if (!exclusiveGroup) return [...currentTags, tag]
    return [...currentTags.filter((currentTag) => !exclusiveGroup.includes(currentTag)), tag]
  }, [])
}

export function getCurrentMealPeriod(date = new Date()) {
  const hour = date.getHours()
  if (hour < 10) return '早餐'
  if (hour < 14) return '中餐'
  if (hour < 17) return '下午茶'
  if (hour < 21) return '晚餐'
  return '夜宵'
}

export function collectFilterTags(filters: {
  scenarioTags?: string[]
  dietaryTags?: string[]
  preferenceTags?: string[]
  spiceLevel?: string
  loadLevel?: string
  tags?: string[]
}) {
  return [
    ...(filters.scenarioTags ?? []),
    ...(filters.dietaryTags ?? []),
    ...(filters.preferenceTags ?? []),
    ...(filters.spiceLevel && filters.spiceLevel !== '不限' ? [filters.spiceLevel] : []),
    ...(filters.loadLevel && filters.loadLevel !== '不限' ? [filters.loadLevel] : []),
    ...(filters.tags ?? [])
  ].filter((tag, index, allTags) => tag && tag !== '全部' && allTags.indexOf(tag) === index)
}

export function collectHardFilterTags(filters: {
  scenarioTags?: string[]
  dietaryTags?: string[]
  spiceLevel?: string
  loadLevel?: string
  tags?: string[]
}) {
  return [
    ...(filters.scenarioTags ?? []),
    ...(filters.dietaryTags ?? []),
    ...(filters.spiceLevel && filters.spiceLevel !== '不限' ? [filters.spiceLevel] : []),
    ...(filters.loadLevel && filters.loadLevel !== '不限' ? [filters.loadLevel] : []),
    ...(filters.tags ?? [])
  ].filter((tag, index, allTags) => tag && tag !== '全部' && allTags.indexOf(tag) === index)
}
