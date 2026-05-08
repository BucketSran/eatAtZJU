# CloudBase Mini Program Setup

日期：2026-05-08

这份指南用于把当前微信小程序骨架接到 CloudBase 云函数，并通过云函数读取 Supabase 唯一数据库。

## 1. 开通云开发

1. 打开微信开发者工具。
2. 导入当前项目根目录。
3. 使用真实小程序 AppID，不要使用 `touristappid`。
4. 点击工具栏的 `云开发`。
5. 创建云开发环境，记录环境 ID。

创建后可能需要等待几分钟，云 API 才能正常调用。

## 2. 确认本地云函数目录

项目已经配置：

```json
"cloudfunctionRoot": "cloudfunctions/"
```

云函数目录：

```text
cloudfunctions/eatAtZjuApi
```

当前已创建的 CloudBase 环境：

```text
cloud1-d0g7zbgtef433dbce
```

仓库内已有 CLI 配置：

```text
cloudbaserc.json
```

## 3. 部署云函数

### 使用 CLI 部署

如果本机已登录 CloudBase CLI，可以运行：

```bash
npx -p @cloudbase/cli@3.3.2 cloudbase fn deploy eatAtZjuApi --deployMode zip --force
```

如果需要重新登录：

```bash
npx -p @cloudbase/cli@3.3.2 cloudbase login --flow web
```

### 使用微信开发者工具部署

在微信开发者工具左侧找到：

```text
cloudfunctions/eatAtZjuApi
```

右键选择：

```text
上传并部署：云端安装依赖
```

当前函数没有 npm 依赖，但使用这个选项最省心。

## 4. 配置环境变量

进入云开发控制台：

```text
云函数 -> eatAtZjuApi -> 函数配置 -> 环境变量
```

添加：

```text
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=你的 Supabase service role 或 secret key
```

只读 POC 也可以临时添加：

```text
SUPABASE_ANON_KEY=你的 Supabase anon 或 publishable key
```

安全要求：

- `SUPABASE_SERVICE_ROLE_KEY` 只能在云函数环境变量里。
- 不要写入小程序前端代码。
- 不要提交到 GitHub。
- 不要放到截图、issue 或公开文档。

当前远端 `eatAtZjuApi` 云函数已经通过 CLI 部署，并已配置上述环境变量。后续如果重建环境或换 Supabase 项目，再按本节重新配置。

## 5. 测试云函数

### 使用 CLI 测试

```bash
npx -p @cloudbase/cli@3.3.2 cloudbase fn invoke eatAtZjuApi \
  -e cloud1-d0g7zbgtef433dbce \
  -d '{"action":"ping"}' \
  --json

npx -p @cloudbase/cli@3.3.2 cloudbase fn invoke eatAtZjuApi \
  -e cloud1-d0g7zbgtef433dbce \
  -d '{"action":"listRestaurants","query":{"tag":"全部","preferences":"近,实惠,辣"}}' \
  --json
```

当前已验证：

```text
ping -> ok
listRestaurants -> source=supabase
getRestaurantDetail(r001) -> 返回餐厅、菜品、评论
getTodayRecommendation(random) -> 返回随机餐厅
```

### 使用控制台测试

在微信开发者工具的云开发控制台测试：

```json
{
  "action": "ping"
}
```

期望：

```json
{
  "ok": true,
  "openId": "..."
}
```

继续测试：

```json
{
  "action": "listRestaurants",
  "query": {
    "tag": "全部",
    "preferences": "近,实惠,辣"
  }
}
```

期望：

```json
{
  "ok": true,
  "source": "supabase",
  "restaurants": []
}
```

`restaurants` 应该有 60 条左右。

## 6. 小程序页面验证

当前小程序页面已经改成：

```text
优先调用 CloudBase 云函数
失败时自动回退本地 seed
```

因此即使云函数环境变量没配好，页面也不会白屏，但控制台会看到 fallback warning。

验收路径：

1. 首页能展示餐厅列表。
2. 首页点击随机一餐能返回餐厅。
3. 发现地图能展示 marker。
4. 餐厅详情能展示菜品和评论。
5. 控制台没有持续的 `cloud_function_error`。

## 7. 常见问题

| 问题 | 可能原因 | 处理方式 |
| --- | --- | --- |
| `cloud init error` | 云环境刚开通或 AppID 不匹配 | 等待几分钟，确认真实 AppID 和云环境 |
| `cloud_not_ready` | `wx.cloud.init` 未成功 | 确认微信开发者工具已开通云开发 |
| `supabase_not_configured` | 云函数没有 Supabase env | 配置 `SUPABASE_URL` 和 key 后重新部署 |
| `Supabase REST 401` | key 填错或权限不对 | 检查 Supabase key，不要带多余空格 |
| 页面能打开但一直用本地数据 | 云函数调用失败后 fallback | 看开发者工具 console 的 warning |

## 8. 下一步

只读 POC 通过后，再进入：

1. 微信 openid 写入 `identity_links`。
2. 小程序收藏同步。
3. 小程序 UGC 提交。
4. 内容安全和审核联动。
