import assert from 'node:assert/strict';
import fs from 'node:fs';
import { overrideIsActive, overrideUpdates } from '../app/current-feature-state.ts';

const read = (name) => JSON.parse(fs.readFileSync(new URL('../app/' + name, import.meta.url), 'utf8'));
const catalog = read('current-catalog.json'), grouping = read('current-feature-groups.json');
const expected = catalog.targets.flatMap((t) => t.sections.flatMap((s) => s.options.map((o) => o.key)));
const actual = [], features = [];
function walk(list) {
  for (const f of list) {
    actual.push(...f.optionKeys); features.push(f);
    assert.equal(f.hasConfiguration, f.parameterKeys.length > 0 || f.features.length > 0, f.title);
    assert(!f.parameterKeys.includes(f.toggleKey), f.title);
    if (f.toggleKey) assert(f.optionKeys.includes(f.toggleKey), f.title);
    walk(f.features);
  }
}
for (const t of grouping.targets) {
  assert(catalog.targets.some((c) => c.id === t.id));
  for (const s of t.sections) walk(s.features);
}
assert.equal(actual.length, 199);
assert.equal(new Set(actual).size, 199);
assert.deepEqual([...actual].sort(), [...expected].sort());
const wifi = features.find((f) => f.toggleKey?.includes('wifi_country_enabled'));
assert(wifi && wifi.parameterKeys.some((k) => k.endsWith('wifi_country')));
const ota = features.find((f) => f.toggleKey?.endsWith('ota_spoof_enabled'));
assert.equal(ota.features.length, 9);
assert(ota.features.every((f) => f.toggleKey && f.parameterKeys.length === 1));
assert.equal(overrideIsActive({scale:'1'}, {scale:'1.0'}, 'number'), false);
assert.equal(overrideIsActive({alpha:'100.0'}, {alpha:'100'}, 'number'), false);
assert.equal(overrideIsActive({alpha:'50'}, {alpha:'100'}, 'number'), true);
let state = {font:'custom.ttf', alpha:'65'};
const defaults = {font:'', alpha:'100'};
state = {...state, ...overrideUpdates('sample', '0', state, defaults)};
assert.equal(state.font, ''); assert.equal(state.alpha, '100');
state = {...state, ...overrideUpdates('sample', '1', state, defaults)};
assert.equal(state.font, 'custom.ttf'); assert.equal(state.alpha, '65');
// Deliberately returning to the default is also a choice that must survive a toggle cycle.
state.alpha = '100';
state = {...state, ...overrideUpdates('sample', '0', state, defaults)};
state = {...state, ...overrideUpdates('sample', '1', state, defaults)};
assert.equal(state.alpha, '100');
console.log('PASS: 199 unique options; recursive Wi-Fi/OTA ownership; numeric off values; saved configuration survives disable/enable.');
