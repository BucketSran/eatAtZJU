const restaurants = [
  {
    id: 'r001',
    name: '青芝坞·小院川味',
    area: '青芝坞',
    distance: 1.8,
    walkMinutes: 22,
    cuisine: '川湘菜',
    price: 46,
    rating: 4.7,
    studentScore: 96,
    checkins: 328,
    latitude: 30.2749,
    longitude: 120.1238,
    coverIcon: '辣',
    coverColor: '#d95f35',
    tags: ['辣', '聚餐', '下饭', '人均50内'],
    suitedFor: ['晚餐聚餐', '想吃辣', '三五好友'],
    reason: '学生评价集中在“锅气足、分量稳、晚饭不踩雷”，适合约饭和改善伙食。',
    menu: [
      { name: '招牌小炒黄牛肉', price: 48, heat: 98 },
      { name: '酸辣鸡杂', price: 36, heat: 88 },
      { name: '砂锅米饭', price: 5, heat: 76 }
    ],
    comments: [
      { user: '紫金港饭搭子', text: '辣度可以备注，米饭很香，四个人点三个菜刚刚好。', rating: 5 },
      { user: '赶DDL的研一', text: '高峰要等位，但翻台快。', rating: 4 }
    ]
  },
  {
    id: 'r002',
    name: '港湾家常菜',
    area: '紫金港北门',
    distance: 0.7,
    walkMinutes: 9,
    cuisine: '家常菜',
    price: 28,
    rating: 4.5,
    studentScore: 91,
    checkins: 412,
    latitude: 30.3124,
    longitude: 120.0921,
    coverIcon: '饭',
    coverColor: '#f0aa38',
    tags: ['近', '实惠', '快餐', '人均30内'],
    suitedFor: ['下课即吃', '预算友好', '单人吃饭'],
    reason: '距离近、出餐快，是“今天不想思考”的安全牌。',
    menu: [
      { name: '番茄牛腩饭', price: 26, heat: 93 },
      { name: '青椒肉丝盖饭', price: 18, heat: 84 },
      { name: '小碗汤', price: 4, heat: 62 }
    ],
    comments: [
      { user: '十分钟吃完', text: '性价比稳定，适合赶课。', rating: 5 },
      { user: '不吃香菜', text: '口味偏家常，重口党可能觉得淡。', rating: 4 }
    ]
  },
  {
    id: 'r003',
    name: '留学生食堂风味档',
    area: '校内',
    distance: 0.4,
    walkMinutes: 6,
    cuisine: '融合简餐',
    price: 24,
    rating: 4.4,
    studentScore: 88,
    checkins: 285,
    latitude: 30.3088,
    longitude: 120.0865,
    coverIcon: '校',
    coverColor: '#4f8b65',
    tags: ['校内', '实惠', '清真友好', '人均30内'],
    suitedFor: ['课间午餐', '多人拼桌', '轻负担'],
    reason: '校内可达，价格友好，风味档选择比普通窗口更有记忆点。',
    menu: [
      { name: '咖喱鸡饭', price: 18, heat: 89 },
      { name: '孜然牛肉拌面', price: 22, heat: 83 },
      { name: '酸奶碗', price: 12, heat: 71 }
    ],
    comments: [
      { user: '玉泉路过', text: '比想象中丰富，咖喱饭很稳。', rating: 4 },
      { user: '早八幸存者', text: '中午排队略长，建议错峰。', rating: 4 }
    ]
  },
  {
    id: 'r004',
    name: '龙湖天街·一碗热汤面',
    area: '西溪天街',
    distance: 2.3,
    walkMinutes: 29,
    cuisine: '面馆',
    price: 33,
    rating: 4.6,
    studentScore: 89,
    checkins: 194,
    latitude: 30.2965,
    longitude: 120.1012,
    coverIcon: '面',
    coverColor: '#6d8fbd',
    tags: ['面食', '暖胃', '一人食', '人均40内'],
    suitedFor: ['雨天热汤', '独自觅食', '轻聚餐'],
    reason: '汤头清爽、座位舒服，适合一个人慢慢吃完再回去写作业。',
    menu: [
      { name: '番茄肥牛面', price: 35, heat: 92 },
      { name: '雪菜笋丝面', price: 24, heat: 73 },
      { name: '卤蛋', price: 4, heat: 66 }
    ],
    comments: [
      { user: '爱喝汤', text: '番茄汤底很舒服，冬天尤其加分。', rating: 5 },
      { user: '小份就够', text: '商场价，但环境比路边店好。', rating: 4 }
    ]
  },
  {
    id: 'r005',
    name: '西园夜市·炸串铺',
    area: '西园',
    distance: 1.1,
    walkMinutes: 15,
    cuisine: '小吃夜宵',
    price: 22,
    rating: 4.3,
    studentScore: 86,
    checkins: 506,
    latitude: 30.3029,
    longitude: 120.0774,
    coverIcon: '串',
    coverColor: '#b85834',
    tags: ['夜宵', '小吃', '实惠', '快乐碳水'],
    suitedFor: ['夜跑后', '组队加餐', '嘴馋'],
    reason: '打卡量很高，学生评价的关键词是“热闹、便宜、快乐”。',
    menu: [
      { name: '炸鸡柳', price: 12, heat: 94 },
      { name: '年糕串', price: 4, heat: 91 },
      { name: '掌中宝', price: 16, heat: 79 }
    ],
    comments: [
      { user: '今晚不减脂', text: '快乐是真的，罪恶感也是真的。', rating: 5 },
      { user: '夜宵观察员', text: '建议两三个人拼，不然容易点多。', rating: 4 }
    ]
  },
  {
    id: 'r006',
    name: '慢吞吞咖喱屋',
    area: '申花',
    distance: 2.0,
    walkMinutes: 25,
    cuisine: '日式简餐',
    price: 39,
    rating: 4.8,
    studentScore: 94,
    checkins: 236,
    latitude: 30.3204,
    longitude: 120.1042,
    coverIcon: '咖',
    coverColor: '#8c6338',
    tags: ['不辣', '一人食', '拍照', '人均50内'],
    suitedFor: ['独处放空', '不想吃辣', '拍照打卡'],
    reason: '环境安静、咖喱浓郁，适合想暂时逃离食堂宇宙的一餐。',
    menu: [
      { name: '炸猪排咖喱饭', price: 42, heat: 96 },
      { name: '溏心蛋牛肉咖喱', price: 38, heat: 87 },
      { name: '柚子苏打', price: 16, heat: 74 }
    ],
    comments: [
      { user: '咖喱信徒', text: '猪排脆，咖喱很厚，适合慢慢吃。', rating: 5 },
      { user: '论文卡住了', text: '一个人坐窗边挺治愈。', rating: 5 }
    ]
  }
]

const tasteTags = ['全部', '近', '实惠', '辣', '不辣', '夜宵', '一人食', '聚餐', '校内', '面食']

const priceRanges = [
  { label: '不限', min: 0, max: 999 },
  { label: '30以内', min: 0, max: 30 },
  { label: '30-50', min: 30, max: 50 },
  { label: '50+', min: 50, max: 999 }
]

module.exports = {
  restaurants,
  tasteTags,
  priceRanges
}
