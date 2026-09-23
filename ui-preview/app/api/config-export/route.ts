/** Stateless download response for embedded browsers that do not download blob: URLs. */
export async function POST(request: Request) {
  const body = await request.text();
  if (body.length > 24_000_000)
    return new Response('配置文件过大', { status: 413 });
  try {
    const data = JSON.parse(
      new URLSearchParams(body).get('configuration') || '',
    );
    if (
      data?.format !== 'LS_Augment.UIPrototype' ||
      ![1, 2].includes(data.version) ||
      (data.version === 1 && !data.status) ||
      !data.settings ||
      typeof data.settings !== 'object' ||
      Array.isArray(data.settings) ||
      (data.version === 2 &&
        !Object.values(data.settings).every(
          (value) => typeof value === 'string',
        ))
    )
      return new Response('配置格式不正确', { status: 400 });
    return new Response(JSON.stringify(data, null, 2), {
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Content-Disposition': 'attachment; filename="LS_Augment-config.json"',
        'Cache-Control': 'no-store',
        'X-Content-Type-Options': 'nosniff',
      },
    });
  } catch {
    return new Response('配置格式不正确', { status: 400 });
  }
}
