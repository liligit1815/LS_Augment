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
    module: mod,
    exports: mod.exports,
    Date,
    Set,
    require: (name) => {
      // These unrelated editors are not rendered by the fan route.
      if (name === './current-health') return { CurrentHealth: () => null };
      if (name === './current-status-editor') return { LatestStatusEditor: () => null };
      return name.startsWith('.') ? load(path.resolve(path.dirname(file), name)) : require(name);
    },
  }, { filename: file });
  return mod.exports;
}

const { CurrentEditor, k } = load('app/current-editors.tsx');
const { CurrentContext, PresentationContext } = load('app/current-ui.tsx');
const { NativeSelect } = load('app/current-native-controls.tsx');
const fixedKey = k('FAN_FIXED_ENABLED');
const tileKey = k('FAN_TILE_ENHANCEMENT_ENABLED');
const levelKey = k('FAN_FIXED_LEVEL');
function render(body, values, expanded = false) {
  const model = { values, set() {}, go() {}, back() {}, tell() {}, dialog() {}, close() {} };
  return renderToStaticMarkup(React.createElement(CurrentContext.Provider, { value: model },
    React.createElement(PresentationContext.Provider, {
      value: { route: 'fan_control', state: { ['fan_control:toggle:' + fixedKey]: expanded }, set() {} },
    }, body)));
}

for (const fixed of ['0', '1']) {
  for (const tile of ['0', '1']) {
    for (const expanded of [false, true]) {
      const html = render(React.createElement(CurrentEditor, { route: 'fan_control' }), {
        [fixedKey]: fixed, [tileKey]: tile, [levelKey]: '3',
      }, expanded);
      const cards = html.match(/<section\b[\s\S]*?<\/section>/g);
      assert.equal(cards.length, 2);
      assert(cards[0].includes('class="c-card c-fan-controls"'));
      const [fixedPart, tilePart] = cards[0].split('<hr/>');
      assert(fixedPart.includes('data-native-path="config:' + fixedKey + '"'));
      assert(!fixedPart.includes('data-native-path="config:' + tileKey + '"'));
      assert(tilePart.includes('data-native-path="config:' + tileKey + '"'));
      assert(!/\shidden=/.test(tilePart), 'tile must stay visible when fixed is closed');
      for (const [title, value] of [['固定风扇转速', fixed], ['散热风扇磁贴增强', tile]]) {
        const switchTag = cards[0].match(new RegExp('<button[^>]*role="switch"[^>]*aria-label="' + title + '"[^>]*>'))[0];
        assert(switchTag.includes('aria-checked="' + (value === '1') + '"'));
      }
      const foldTag = fixedPart.match(/<div[^>]*class="c-fold-body"[^>]*>/)[0];
      assert.equal(/\bhidden=/.test(foldTag), !(fixed === '1' && expanded));
      assert(cards[1].includes('本机转速测量'));
      assert(!cards[1].includes('散热风扇磁贴增强'));
    }
  }
}
for (const level of ['1', '2', '3', '4', '5']) {
  const html = render(React.createElement(CurrentEditor, { route: 'fan_control' }), {
    [fixedKey]: '1', [tileKey]: '0', [levelKey]: level,
  }, true);
  const choices = html.match(/<button[^>]*class="c-button"[^>]*aria-pressed[^>]*>[\s\S]*?<\/button>/g);
  assert.equal(choices.length, 5);
  assert.equal(choices.filter((tag) => tag.includes('aria-pressed="true"')).length, 1);
  assert(choices[Number(level) - 1].includes('aria-pressed="true"'));
}
const dropdown = render(React.createElement(NativeSelect, {
  name: 'unchanged:choice', title: '既有下拉', choices: [['1', '一'], ['2', '二']], initial: '2',
}), {});
assert(dropdown.includes('<select'));
assert(!dropdown.includes('class="c-native-select-buttons"'));
assert(dropdown.includes('<option value="2" selected="">'));
console.log('PASS: fan controls share one card; tile stays independent and visible in 8 fixed/tile/fold states; five numbered choices; default NativeSelect remains a dropdown.');
