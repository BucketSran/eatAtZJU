const { execFile } = require('child_process')
const dns = require('dns').promises

const DEFAULT_TARGETS = [
  'https://eat-at-zju.vercel.app',
  'https://eat.bucketsran.fun',
  'https://eat-at-zju.vercel.app/api/restaurants?limit=1',
  'https://thzyquhyeefiztcwgaph.supabase.co/auth/v1/health'
]

function runCurl(url, familyFlag) {
  return new Promise((resolve) => {
    const args = [
      familyFlag,
      '-L',
      '--connect-timeout',
      '8',
      '--max-time',
      '20',
      '-s',
      '-o',
      '/tmp/eat-at-zju-network-check.out',
      '-w',
      '%{http_code} %{time_connect} %{time_appconnect} %{time_total} %{remote_ip}',
      url
    ]

    execFile('curl', args, { timeout: 25000 }, (error, stdout, stderr) => {
      if (error) {
        resolve({
          ok: false,
          error: stderr.trim() || error.message
        })
        return
      }

      const [status, connect, tls, total, remoteIp] = stdout.trim().split(/\s+/)
      resolve({
        ok: Number(status) >= 200 && Number(status) < 500,
        status: Number(status),
        connectSeconds: Number(connect),
        tlsSeconds: Number(tls),
        totalSeconds: Number(total),
        remoteIp
      })
    })
  })
}

async function resolveHost(hostname) {
  const result = { hostname, a: [], aaaa: [], cname: [] }
  try {
    result.a = await dns.resolve4(hostname)
  } catch {}
  try {
    result.aaaa = await dns.resolve6(hostname)
  } catch {}
  try {
    result.cname = await dns.resolveCname(hostname)
  } catch {}
  return result
}

async function checkTarget(url) {
  const parsed = new URL(url)
  return {
    url,
    dns: await resolveHost(parsed.hostname),
    ipv4: await runCurl(url, '-4'),
    ipv6: await runCurl(url, '-6')
  }
}

function summarize(results) {
  const blocked = results.filter((item) => !item.ipv4.ok && !item.ipv6.ok)
  const supabase = results.find((item) => item.url.includes('supabase.co'))
  const vercel = results.filter((item) => item.url.includes('vercel.app') || item.url.includes('bucketsran.fun'))

  const notes = []
  if (blocked.length) {
    notes.push('存在完全不可达目标，优先怀疑校园网出口、DNS 污染、IPv6 路由或目标云服务被策略限制。')
  }
  if (vercel.some((item) => !item.ipv4.ok && item.ipv6.ok)) notes.push('Vercel IPv4 不稳但 IPv6 可达，建议排查校园网 IPv4 出口。')
  if (vercel.some((item) => item.ipv4.ok && !item.ipv6.ok)) notes.push('Vercel IPv6 不稳但 IPv4 可达，建议浏览器临时关闭 IPv6 或使用 IPv4-only 网络验证。')
  if (supabase && !supabase.ipv4.ok && !supabase.ipv6.ok) notes.push('Supabase 不可达时，网页直连 Supabase Auth/Storage 会失败，需要国内 API 网关或微信云开发中转。')
  if (!notes.length) notes.push('当前网络下核心目标可达；如果校园 WiFi 仍失败，问题可能在浏览器 DNS 缓存、认证网关、代理设置或特定时间段出口拥塞。')
  return notes
}

async function main() {
  const targets = process.argv.slice(2).length ? process.argv.slice(2) : DEFAULT_TARGETS
  const results = []
  for (const target of targets) {
    results.push(await checkTarget(target))
  }

  console.log(JSON.stringify({
    checkedAt: new Date().toISOString(),
    targets: results,
    summary: summarize(results)
  }, null, 2))
}

main().catch((error) => {
  console.error(error.message)
  process.exit(1)
})
