import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import { createRequire } from 'node:module';
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import ts from 'typescript';

const require = createRequire(import.meta.url);
const cache = new Map(), switches = new Map(), toggles = new Map(), buttons = [];
function load(file) {
  file = path.resolve(file);
  if (file.endsWith('.css')) return {};
  if (!path.extname(file)) file = ['.tsx', '.ts', '.json'].map((suffix) => file + suffix).find(fs.existsSync);
  if (file.endsWith('.json')) return JSON.parse(fs.readFileSync(file, 'utf8'));
  if (cache.has(file)) return cache.get(file).exports;
  const mod = { exports: {} };
  cache.set(file, mod);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2022,
      jsx: ts.JsxEmit.ReactJSX, esModuleInterop: true },
  }).outputText;
  vm.runInNewContext(compiled, {
    module: mod, exports: mod.exports, Date, Set,
    require: (name) => {
      if (name === './current-health') return { CurrentHealth: () => null };
      if (name === './current-status-editor') return { LatestStatusEditor: () => null };
      if (name === 'react/jsx-runtime') {
        const runtime = require(name);
        const collect = (fn) => (type, props, key) => {
          if (type === 'button' && props?.role === 'switch') switches.set(props['aria-label'], props);
          if (type === 'button') buttons.push(props);
          return fn(type, props, key);
        };
        return { ...runtime, jsx: collect(runtime.jsx), jsxs: collect(runtime.jsxs) };
      }
      const value = name.startsWith('.') ? load(path.resolve(path.dirname(file), name)) : require(name);
      if (name === './current-ui' && file.endsWith('current-editors.tsx')) {
        return { ...value, Toggle: (props) => {
          toggles.set(props.title, props);
          return React.createElement(value.Toggle, props);
        } };
      }
      return value;
    },
  }, { filename: file });
  return mod.exports;
}
const { CurrentEditor, k } = load('app/current-editors.tsx');
const { CurrentApplicationSection } = load('app/current-application.tsx');
const { CurrentContext, PresentationContext } = load('app/current-ui.tsx');
const { resolveGroup } = load('app/current-hierarchy.ts');
const changes = [], destinations = [], dialogs = [], messages = [], presentationWrites = [];
function render(route, values = {}, expanded = {}) {
  switches.clear(); toggles.clear(); buttons.length = 0;
  const model = { values,
    set: (name, value) => { values[name] = value; changes.push([name, value]); },
    go: (route) => destinations.push(route),
    dialog: (...args) => dialogs.push(args),
    back() {}, tell(message) { messages.push(message); }, close() {},
  };
  const group = resolveGroup(route);
  const content = group ? React.createElement(CurrentApplicationSection, group) : React.createElement(CurrentEditor, { route });
  return renderToStaticMarkup(React.createElement(CurrentContext.Provider, { value: model },
    React.createElement(PresentationContext.Provider, { value: { route, state: expanded, set(key, value) { expanded[key] = value; presentationWrites.push([key, value]); } } }, content)));
}

const groups = {
  'group/launcher/launcher': '自定义应用图标与名称',
  'group/systemui/quicksettings_more': '极暗',
  'group/system/audio': '超过 100% 的音量',
  'group/system/installer': '允许安装签名不一致的应用',
};
for (const [route, title] of Object.entries(groups)) {
  const html = render(route);
  assert(html.startsWith('<div class="d-section-page"><section class="c-card c-feature-group d-setting-group"'));
  assert(!html.includes('data-ui-label="专用编辑器"'));
  assert(!html.includes('class="c-link '), 'the third-level group must contain settings rather than editor navigation');
  assert(switches.has(title), route + ' must render its editor in the group');
  assert.equal(switches.get(title)['aria-checked'], false);
  assert.equal(switches.get(title).disabled, false);
  const { section } = resolveGroup(route);
  for (const feature of section.features) assert(html.includes(feature.title), feature.title + ' must remain in its group');
}
const dim = render('group/systemui/quicksettings_more');
assert(!dim.includes('极暗强度') && !dim.includes('添加极暗磁贴') && !dim.includes('d-save-note'));
switches.get('极暗').onClick();
assert.deepEqual(changes.pop(), ['prototype:extra-dim-tile', '1']);

const launcherRoute = 'group/launcher/launcher', gate = 'prototype:launcher-enabled';
const launcherValues = { 'launcher:0:com.tencent.mm:name': '自定义微信',
  'launcher:0:com.tencent.mm:picture': 'data:image/png;base64,aGVsbG8=', [gate]: '1' };
const retained = { ...launcherValues };
const opened = render(launcherRoute, launcherValues, { [launcherRoute + ':toggle:' + gate]: true });
assert(opened.includes('aria-label="用户空间"'));
assert(opened.includes('选择应用') && opened.includes('aria-label="选择应用图标"'));
assert(opened.includes('aria-label="自定义名称"') && opened.includes('恢复原图标'));
assert(!opened.match(/<div[^>]*class="c-fold-body"[^>]*>/)[0].includes('hidden'));
switches.get('自定义应用图标与名称').onClick();
assert.equal(launcherValues[gate], '0');
for (const [key, value] of Object.entries(retained)) if (key !== gate) assert.equal(launcherValues[key], value);
const disabled = render(launcherRoute, launcherValues, { [launcherRoute + ':toggle:' + gate]: true });
assert(disabled.match(/<div[^>]*class="c-fold-body"[^>]*>/)[0].includes('hidden'));
switches.get('自定义应用图标与名称').onClick();
assert.equal(launcherValues[gate], '1');
for (const [key, value] of Object.entries(retained)) assert.equal(launcherValues[key], value);

const freeform = render('freeform');
assert(freeform.startsWith('<section class="c-card c-feature-group d-setting-group"'));
assert.equal((freeform.match(/class="c-card /g) || []).length, 1);
assert.equal((freeform.match(/class="c-feature"/g) || []).length, 4);
assert.equal((freeform.match(/role="switch"/g) || []).length, 4);
for (const title of ['游戏登录跳转以小窗打开', '全应用支持小窗']) {
  assert(toggles.get(title).children, title + ' retains its in-page app picker');
}
assert.equal(toggles.get('解除小窗数量上限').children, undefined);
assert.equal(toggles.get('打开第三方应用以小窗打开').children, undefined);
assert.deepEqual(destinations, [], 'editing must not navigate to another page');
assert.deepEqual(dialogs, [], 'rendering must not open a picker');
assert.equal(k('AUDIO_GAIN_ENABLED'), 'ls_augment_audio_gain_enabled');

const hideValues = { [k('HIDE_MASTER')]: '1', [k('TILE_ENABLED')]: '1',
  'hide:0:apps': 'com.tencent.mm,com.tencent.mobileqq', 'hide:0:state:com.tencent.mm': '1' };
const hideFoldKey = 'hide:hide:apps', tileFoldKey = 'hide:toggle:' + k('TILE_ENABLED');
const hideExpanded = { [hideFoldKey]: false, [tileFoldKey]: false };
const buttonText = (button) => Array.isArray(button.children) ? button.children.flat(Infinity).join('') : button.children;
const action = (title) => buttons.find(button => buttonText(button) === title);
const hideHtml = render('hide', hideValues, hideExpanded);
assert(!hideHtml.includes('运行条件') && !hideHtml.includes('hide:environment'));
assert(!hideHtml.includes('<h3 class="c-section-heading">应用名单</h3>'));
assert(hideHtml.match(/class="d-disclosure-body c-hide-list-body"[^>]*>/)[0].includes('hidden'));
for (const title of ['刷新', '隐藏本范围', '显示本范围', '选择应用']) {
  assert(action(title), title + ' remains available with the list collapsed');
  assert(hideHtml.indexOf('data-ui-label="' + title + '"') < hideHtml.indexOf('c-hide-list-body'));
}
action('选择应用').onClick();
assert.deepEqual(presentationWrites.pop(), [hideFoldKey, true]);
render('hide', hideValues, hideExpanded);
const retainedHide = { ...hideValues };
buttons.find(button => button['aria-label'] === '收起应用名单').onClick();
assert.deepEqual(presentationWrites.pop(), [hideFoldKey, false]);
assert.deepEqual(hideValues, retainedHide, 'collapsing cannot change the saved list or master');
render('hide', hideValues, hideExpanded);
action('刷新').onClick();
assert.equal(hideExpanded[hideFoldKey], false, 'refresh cannot reopen the list');
hideExpanded[tileFoldKey] = true;
render('hide', hideValues, hideExpanded);
buttons.find(button => button['aria-label'] === '收起快捷磁贴配置').onClick();
assert.deepEqual(presentationWrites.pop(), [tileFoldKey, false]);
hideValues['hide:all-spaces'] = '1';
render('hide', hideValues, hideExpanded);
assert.equal(buttons.find(button => button['aria-label'] === '展开快捷磁贴配置')['aria-expanded'], false);
assert.equal(hideValues[k('TILE_ENABLED')], '1', 'collapsing tile settings leaves the feature enabled');
for (const mode of ['lsp-only', 'root-only', 'missing']) {
  const candidate = { ...hideValues, 'prototype:runtime-state': mode, [k('AUTOMATION_ENABLED')]: '0' };
  render('hide', candidate, hideExpanded);
  switches.get('锁屏自动隐藏').onClick();
  assert.equal(candidate[k('AUTOMATION_ENABLED')], '0', mode + ' still fails a real prerequisite');
}
const oldRuntime = { ...hideValues, 'prototype:runtime-state': 'update-pending', [k('AUTOMATION_ENABLED')]: '0' };
render('hide', oldRuntime, hideExpanded);
switches.get('锁屏自动隐藏').onClick();
assert.equal(oldRuntime[k('AUTOMATION_ENABLED')], '0', 'a listener from the previous version cannot enable automatic hiding');
assert(messages.some(message => message.includes('锁屏监听尚未加载当前版本，请重启手机')));
const readyRuntime = { ...hideValues, 'prototype:runtime-state': 'ready', [k('AUTOMATION_ENABLED')]: '0' };
render('hide', readyRuntime, hideExpanded);
switches.get('锁屏自动隐藏').onClick();
assert.equal(readyRuntime[k('AUTOMATION_ENABLED')], '1', 'the current ready listener can enable with Root, framework, master and configured targets');
const emptyHide = { ...hideValues, 'hide:0:apps': '', [k('AUTOMATION_ENABLED')]: '0' };
render('hide', emptyHide, hideExpanded);
switches.get('锁屏自动隐藏').onClick();
assert.equal(emptyHide[k('AUTOMATION_ENABLED')], '0', 'automatic hiding needs a configured list');
console.log('PASS: hidden-app list defaults collapsed with persistent scope/actions, explicit choose/expand and stable collapse; tile collapse survives other settings; automatic-hide requires the current ready listener and real prerequisites.');
console.log('PASS: four third-level groups embed editors and retain sibling features; Extra Dim matches the tile switch; launcher shared gate retains per-space images/names through off/on; freeform uses one shared card with four shared controls and in-page pickers.');
