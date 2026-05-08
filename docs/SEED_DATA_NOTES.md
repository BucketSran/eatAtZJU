# Seed Data Notes

日期：2026-05-08

## 当前规模

- 餐厅：60 家
- 菜品：180 道
- 评论：120 条

## 数据性质

当前 `seed/*.json` 是 demo seed，用于产品演示、筛选/推荐算法验证和 Supabase 迁移测试。它不是公开发布用的真实学生评价库。

为避免版权和隐私风险，当前 seed 不直接复制论坛、小红书、微信群、点评平台或学生个人发布内容。餐厅名、短评和推荐理由按产品场景做了演示化整理。

## 上线前替换要求

开放真实用户或公开宣传前，需要：

- 明确每条真实数据来源和授权状态。
- 图片、昵称、原文评论不得未经授权搬运。
- 学生提交内容进入 `submissions` 审核队列。
- 真实评论只展示 `approved` 状态。
- 至少覆盖主要区域、预算段和常见场景。

## 验证命令

更新 seed 后运行：

```bash
npm run seed:sql:write
npm run check
npm run build
EXPECT_API_SOURCE=seed npm run smoke:api
```
