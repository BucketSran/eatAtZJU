# 食在浙大 eatAtZJU

浙大学生专属的校园美食发现与分享平台 MVP。当前版本是微信小程序原生项目，先用本地 mock 数据跑通核心体验：发现餐厅、筛选搜索、地图点位、详情页、收藏、偏好推荐和随机吃什么。

## 当前已实现

- 首页：学生口碑推荐、关键词搜索、口味/预算筛选、随机一餐
- 发现：地图展示紫金港周边餐厅点位，点击 marker 后列表置顶
- 详情：餐厅评分、人均、步行时间、热门菜品、学生短评
- 收藏：本地收藏夹，收藏状态同步到列表和详情页
- 我的：口味偏好配置，影响推荐排序
- 推荐：基于评分、学生可信分、距离、打卡量、偏好标签的规则打分

## 如何运行

1. 打开微信开发者工具。
2. 选择“导入项目”。
3. 项目目录选择当前目录 `eatAtZJU`。
4. AppID 可先使用测试号或项目里的 `touristappid`。
5. 编译运行。

## 项目结构

```text
app.js / app.json / app.wxss      小程序入口与全局样式
components/restaurant-card/       餐厅卡片组件
data/restaurants.js               MVP mock 餐厅数据
services/restaurantService.js      餐厅查询、收藏装饰、地图 marker 服务
utils/recommend.js                规则推荐与筛选逻辑
utils/storage.js                  本地收藏和偏好存储
pages/home/                       首页推荐和筛选
pages/map/                        地图发现页
pages/restaurant/                 餐厅详情页
pages/favorites/                  收藏页
pages/profile/                    我的/偏好页
docs/TECHNICAL_PLAN.md            后续云开发和产品路线
docs/WORKPLAN.md                  当前迭代工作清单
```

## 推荐逻辑

当前推荐分数由这些信号组成：

- 餐厅评分 `rating`
- 学生可信分 `studentScore`
- 距离校区远近 `distance`
- 打卡量 `checkins`
- 用户偏好标签命中数

后续可以把 `utils/recommend.js` 的规则迁移到云函数，或加入好友推荐、时间段、预算历史等信号。
