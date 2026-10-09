/** Stateless download of the current prototype snapshot. Does not query a device. */
export async function POST(request: Request) {
  const body = await request.text();
  if (body.length > 4_000_000) return new Response('日志过大', {status:413});
  const log = new URLSearchParams(body).get('log');
  if (!log?.startsWith('红魔Duo · 问题排查日志')) return new Response('日志格式不正确', {status:400});
  return new Response(log, {headers:{
    'Content-Type':'text/plain; charset=utf-8',
    'Content-Disposition':'attachment; filename="RedMagicDuo-log.txt"',
    'Cache-Control':'no-store', 'X-Content-Type-Options':'nosniff',
  }});
}
