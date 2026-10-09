import catalog from './current-catalog.json';
import editor from './current-editor-data.json';
import device from './current-device.json';
import { runtimeState } from './current-runtime';

type Event = { time: string; action: string; key?: string; value?: string };
const events: Event[] = [];
const privateKey = /token|password|secret|credential|account|cookie|authorization|health.*bind|image|picture|avatar|font.*data/i;
export function safeLogValue(key: string, value: string) {
  if (privateKey.test(key) || /^(data:|https?:\/\/|content:|file:)/.test(value)) return '[已隐去]';
  return value.length > 512 ? `[长内容已省略，${value.length} 字符]` : value;
}
export function recordEvent(action: string, key?: string, value?: string) {
  events.push({ time: new Date().toISOString(), action, key,
    value: value === undefined ? undefined : safeLogValue(key || '', value) });
  if (events.length > 200) events.shift();
}
export function buildLog(values: Record<string, string>, now = new Date().toISOString()) {
  const runtime = runtimeState(values);
  const definitions = editor.defaults as Record<string, {key: string; default: unknown}>;
  const options = new Map(catalog.options.map(o => [o.key, o]));
  const switches = new Map<string, string>();
  for (const o of catalog.options) if (o.kind === 'BOOLEAN') switches.set(o.key, o.title);
  for (const [name, d] of Object.entries(definitions)) {
    if (typeof d.default === 'boolean') switches.set(d.key, options.get(d.key)?.title || name);
  }
  const enabled = [...switches].filter(([key]) => values[key] === '1' || values[key] === 'true');
  const settings = Object.entries(values).filter(([key]) => !key.startsWith('prototype:') && !key.startsWith('ui:'));
  const lines = [
    '红魔Duo · 问题排查日志', `exported_at=${now}`, 'format_version=1',
    'source=web_prototype; 权限为示例状态，非手机实时检测', '',
    '[设备与版本 · 手机只读快照]', `captured_at=${device.capturedAt}`,
    `model=${device.model}`, `system_version=${device.systemVersion}`,
    `android_version=${device.androidVersion}`, `sdk=${device.sdk}`,
    `module_version=${device.moduleVersion}`, `build_type=${device.buildType}`,
    '', '[权限与加载状态 · 所选原型场景]',
    `lsp_injected=${runtime.lsp}`, `root_granted=${runtime.root}`, `status=${runtime.id}`,
    `suggestion=${runtime.message}`, 'actual_hook_execution=NOT_COLLECTED',
    '', '[配置开启的功能 · 不等同于真机生效]', `count=${enabled.length}`,
    ...enabled.map(([key,title])=>`${title} | ${key}=${values[key]}`),
    '', '[配置快照 · 敏感内容已隐去]',
    ...settings.sort(([a],[b])=>a.localeCompare(b)).map(([key,value])=>`${options.get(key)?.title || key} | ${key}=${safeLogValue(key,value)}`),
    '', '[作用域清单 · 推荐范围，非实际勾选证据]',
    ...catalog.targets.map(t=>`${t.title}: ${t.packages.join(', ')}`),
    '', '[最近网页操作 · 当前会话最多 200 条]',
    ...(events.length ? events.map(e=>JSON.stringify(e)) : ['NO_RECORDED_EVENTS']),
    '', '[错误与采集完整性]',
    'phone_logcat=NOT_COLLECTED', 'lsposed_logs=NOT_COLLECTED',
    'hook_install_and_hits=NOT_COLLECTED', 'phone_exception_stacks=NOT_COLLECTED',
    '说明：缺少上述真机证据时，不能据此认定 Hook 已生效或推断具体崩溃原因。',
    '真机日志需记录时间、进程/PID、模块版本、配置版本、Hook 安装/命中/执行结果、异常类型和完整堆栈。',
  ];
  return lines.join('\n') + '\n';
}
export function downloadLog(values: Record<string, string>) {
  recordEvent('log_export');
  const iframe = document.createElement('iframe');
  iframe.name = 'duo-log-' + Date.now(); iframe.hidden = true;
  const form = document.createElement('form');
  form.method = 'POST'; form.action = '/api/log-export'; form.target = iframe.name; form.hidden = true;
  const input = document.createElement('input'); input.type = 'hidden'; input.name = 'log'; input.value = buildLog(values);
  form.appendChild(input); document.body.appendChild(iframe); document.body.appendChild(form); form.submit();
  setTimeout(() => { iframe.remove(); form.remove(); }, 30_000);
}
