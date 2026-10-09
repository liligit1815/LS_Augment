import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import { createRequire } from 'node:module';
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import ts from 'typescript';

const require = createRequire(import.meta.url);
const cache = new Map(), switches = new Map(), toggles = new Map();
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
const changes = [], destinations = [], dialogs = [];
function render(route, values = {}, expanded = {}) {
  switches.clear(); toggles.clear();
  const model = { values,
    set: (name, value) => { values[name] = value; changes.push([name, value]); },
    go: (route) => destinations.push(route),
    dialog: (...args) => dialogs.push(args),
    back() {}, tell() {}, close() {},
  };
  const group = resolveGroup(route);
  const content = group ? React.createElement(CurrentApplicationSection, group) : React.createElement(CurrentEditor, { route });
  return renderToStaticMarkup(React.createElement(CurrentContext.Provider, { value: model },
    React.createElement(PresentationContext.Provider, { value: { route, state: expanded, set() {} } }, content)));
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
console.log('PASS: four third-level groups embed editors and retain sibling features; Extra Dim matches the tile switch; launcher shared gate retains per-space images/names through off/on; freeform uses one shared card with four shared controls and in-page pickers.');
