# Supabase OTP Email Template

日期：2026-05-08

为避免浙大邮箱点击 `*.supabase.co/auth/v1/verify` 外链时被校园邮箱系统拦截，线上登录改为“复制 6 位验证码到站内登录”。

## 需要配置的位置

Supabase Dashboard:

```text
Authentication -> Email Templates -> Magic Link
```

把 Magic Link 模板改成包含 `{{ .Token }}` 的验证码邮件。邮件里可以保留链接作为备用，但主路径应该提示用户复制验证码。

## 推荐 Subject

```text
食在浙大登录验证码：{{ .Token }}
```

## 推荐 Body

```html
<h2>食在浙大登录验证码</h2>

<p>你的验证码是：</p>

<p style="font-size: 28px; font-weight: 700; letter-spacing: 6px; margin: 24px 0;">
  {{ .Token }}
</p>

<p>请回到食在浙大页面，在邮箱验证码输入框中填写这 6 位数字完成登录。</p>

<p>如果你没有请求登录，可以忽略这封邮件。</p>

<hr />

<p style="color: #666; font-size: 13px;">
备用登录链接：<a href="{{ .ConfirmationURL }}">{{ .ConfirmationURL }}</a>
</p>
```

## 为什么这样做

Supabase 默认 magic link 会先跳到项目的 `*.supabase.co/auth/v1/verify`，部分校园邮箱或国内网络会提示外链风险或无法打开。验证码登录只需要用户复制邮件里的 6 位数字，不依赖打开 Supabase 外链。

官方依据：Supabase Email Templates 支持 `{{ .Token }}`，它是可替代 `{{ .ConfirmationURL }}` 的 OTP。Supabase 的 OTP 长度需在 `Authentication -> Providers -> Email` 中设置为 `6`，否则邮件可能发出 8 位验证码而前端无法验证。
