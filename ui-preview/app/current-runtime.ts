export type RuntimeId = 'ready' | 'lsp-only' | 'root-only' | 'missing' | 'update-pending';

export function runtimeState(values: Record<string, string>) {
  const requested = values['prototype:runtime-state'];
  const id: RuntimeId = ['ready', 'lsp-only', 'root-only', 'missing', 'update-pending'].includes(requested)
    ? requested as RuntimeId : 'ready';
  const lsp = id === 'ready' || id === 'lsp-only' || id === 'update-pending';
  const root = id === 'ready' || id === 'root-only' || id === 'update-pending';
  return {
    id, lsp, root,
    tone: id==='update-pending'?'yellow':lsp && root ? 'blue' : lsp || root ? 'yellow' : 'red',
    summary: `LSP ${id==='update-pending'?'已注入（旧版本）':lsp ? '已注入' : '未注入'} · ROOT ${root ? '已授权' : '未授权'}`,
    message: id==='update-pending'?'请重启手机以启用当前版本':lsp && root ? '模块已就绪' : lsp ? '请授予 ROOT 权限' : root
      ? '请检查 LSP 作用域并重启手机'
      : '请检查 LSP 作用域及 ROOT 权限，并重启手机',
  };
}
