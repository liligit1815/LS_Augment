import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import { createRequire } from 'node:module';
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import ts from 'typescript';

const require = createRequire(import.meta.url);
const cache = new Map();
const toggles = new Map();
function load(file) {
  file = path.resolve(file);
  if (!path.extname(file)) {
    file = ['.tsx', '.ts', '.json'].map((suffix) => file + suffix).find(fs.existsSync);
  }
  if (file.endsWith('.json')) return JSON.parse(fs.readFileSync(file, 'utf8'));
  if (cache.has(file)) return cache.get(file).exports;
  const mod = { exports: {} };
  cache.set(file, mod);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      target: ts.ScriptTarget.ES2022,
      jsx: ts.JsxEmit.ReactJSX,
      esModuleInterop: true,
    },
  }).outputText;
  vm.runInNewContext(compiled, {
    module: mod, exports: mod.exports, Date, Set,
    require: (name) => {
      if (name === './current-health') return { CurrentHealth: () => null };
      if (name === './current-status-editor') return { LatestStatusEditor: () => null };
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
const { CurrentContext, PresentationContext } = load('app/current-ui.tsx');
const rapidKey = k('TGK_RAPID_FIRE_ENABLED');
const changes = [], messages = [], destinations = [];
function render(route, compatible, enabled = '0', expanded = false) {
  toggles.clear();
  const model = {
    values: { 'prototype:rapid-compatible': compatible, [rapidKey]: enabled },
    set: (...args) => changes.push(args),
    go: (next) => destinations.push(next),
    tell: (message) => messages.push(message),
    back() {}, dialog() {}, close() {},
  };
  return renderToStaticMarkup(React.createElement(CurrentContext.Provider, { value: model },
    React.createElement(PresentationContext.Provider, {
      value: { route, state: { [route + ':toggle:' + rapidKey]: expanded }, set() {} },
    }, React.createElement(CurrentEditor, { route }))));
}

for (const compatible of ['0', '1']) {
  const html = render('shoulder', compatible);
  assert.equal((html.match(/role="switch"/g) || []).length, 2);
  assert(!html.includes('c-component-summary'));
  assert(!html.includes('class="c-note"'));
  assert(!html.includes('class="c-button"'), 'no compatibility action remains on the shoulder page');
  const switchTag = html.match(/<button[^>]*role="switch"[^>]*aria-label="极速连点"[^>]*>/)[0];
  assert(switchTag.includes('aria-checked="false"'));
  assert(!switchTag.includes('disabled'), 'a pending test must be reachable by the switch');
  assert.equal(toggles.get('极速连点').beforeEnable(), compatible === '1');
}
assert.deepEqual(destinations, ['rapid_compatibility']);
assert.deepEqual(messages, ['请先进入兼容性测试']);
assert.deepEqual(changes, [], 'checking compatibility cannot enable rapid fire');

const pending = render('rapid_compatibility', '0');
assert(pending.includes('开始兼容性测试'));
assert(!pending.includes('开始测试左肩键'));
assert(!pending.includes('预检完成'));
assert.deepEqual(changes, [], 'opening the test page must not start or pass the test');
const passed = render('rapid_compatibility', '1');
assert(passed.includes('稳定性验证通过'));
assert(passed.includes('不会自动开启极速连点'));
assert(!passed.includes('开始兼容性测试'));
assert.deepEqual(changes, [], 'viewing a passed test must not enable rapid fire');
const returned = render('shoulder', '0');
assert(returned.includes('aria-label="极速连点" aria-checked="false"'));
const enabled = render('shoulder', '1', '1', true);
assert(enabled.includes('aria-label="极速连点" aria-checked="true"'));
assert(enabled.includes('点击频率'));
assert(!enabled.match(/<div[^>]*class="c-fold-body"[^>]*>/)[0].includes('hidden'));
console.log('PASS: shared shoulder/rapid controls; no inline descriptions or test actions; token gate navigates with prompt without enabling; test opens idle; passed test never auto-enables; return stays off; enabled frequency uses the existing disclosure.');
