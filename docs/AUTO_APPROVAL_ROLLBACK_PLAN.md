# Auto Approval and Rollback Plan

日期：2026-05-08

## 目标

在减少人工审核成本的同时，避免 UGC 污染正式餐厅、菜品和评论数据。核心原则：

- 自动审批只能处理低风险、可撤销的变更。
- 写正式表前必须记录 before/after 快照。
- 任何自动或人工变更都必须能从审计日志回滚。
- 自动审批初期只做“分流”，不要直接信任所有提交。

## 当前已实现的安全网

- `audit_logs` 保存 `before_data` 和 `after_data`。
- `/api/admin/audit-logs` 支持管理员读取审计日志。
- `/api/admin/audit-logs` 支持按审计日志回滚：
  - `before_data` 存在：恢复旧快照。
  - `before_data` 为空：删除此次新增记录。
  - 回滚本身会再写一条 `action=rollback` 审计日志。
- `/admin` 页面提供“读取审计日志”和“回滚”按钮。

## 自动审批分级

| 类型 | 初期策略 | 原因 |
| --- | --- | --- |
| 信息纠错 `correction` | 可自动分流，不自动写正式表 | 需要比对原字段，避免恶意改地址/价格 |
| 评论 `review` | 校园邮箱已验证 + 文本短 + 无敏感词时可自动批准 | 评论可回滚为 rejected，风险相对可控 |
| 打卡 `checkin` | 后续可自动通过 | 需要先接图片/定位安全规则 |
| 菜品 `dish` | 只生成草稿，人工确认后发布 | 菜品价格和归属容易错 |
| 餐厅 `restaurant` | 不自动发布，只生成候选/草稿 | 新实体污染和重复实体风险最高 |

## 自动审批候选条件

用户必须满足：

- `user_trust.campus_email_verified = true`
- `user_trust.credit_score >= 60`
- 最近无被拒绝/回滚记录
- 单日提交次数低于限额

内容必须满足：

- payload 是结构化对象。
- 必填字段完整。
- 文本长度在限制内。
- 不包含明显垃圾词、外链广告、联系方式。
- 新实体不与现有餐厅高相似重复。

## 回滚规则

- 自动审批写入正式表前，必须先读取目标行作为 `before_data`。
- 写入成功后，必须把新行作为 `after_data` 写入 `audit_logs`。
- 回滚时按 `audit_logs` 快照恢复。
- 对 `restaurants` / `dishes` / `reviews` 的自动创建，回滚会删除新记录。
- 对已有记录更新，回滚会恢复旧快照。
- 回滚后必须写新的 `rollback` 审计日志，不能直接修改旧审计日志。

## 下一步实现建议

1. 把 `/contribute` 表单结构化，避免 payload 只有标题和长文本。
2. 新增 `api/_shared/moderationRules.cjs`，输出 `manual_review | auto_approve_candidate | reject_candidate`。
3. 先只对 `review` 类型实现自动批准，并写入 `reviews`。
4. 自动批准前后都写 `audit_logs`。
5. `/admin` 增加按 action、target_table、submitter 筛选审计日志。
6. 增加每日限频和敏感词规则。

## 红队边界

当前回滚 API 是通用能力，必须保持管理员权限保护。任何未来自动审批代码都不能绕过审计日志直接写正式表。
