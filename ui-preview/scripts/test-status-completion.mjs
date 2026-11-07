import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import ts from 'typescript';
const cache = new Map();
function url(file) {
  if (cache.has(file)) return cache.get(file);
  let source = fs.readFileSync(file, 'utf8');
  if (file.endsWith('.json')) source = 'export default ' + source;
  else
    source = ts
      .transpileModule(source, {
        compilerOptions: {
          target: ts.ScriptTarget.ES2022,
          module: ts.ModuleKind.ESNext,
        },
      })
      .outputText.replace(
        /from ['"](\.\/[^'"]+)['"]/g,
        (_, name) =>
          'from ' +
          JSON.stringify(
            url(
              path.resolve(
                path.dirname(file),
                name + (path.extname(name) ? '' : '.ts'),
              ),
            ),
          ),
      );
  const result =
    'data:text/javascript;base64,' + Buffer.from(source).toString('base64');
  cache.set(file, result);
  return result;
}
const root = path.resolve('app');
const p = await import(url(path.join(root, 'current-status-policy.ts')));
const l = await import(url(path.join(root, 'current-status-placement.ts')));
const r = await import(url(path.join(root, 'current-status-recovery.ts')));
const plans = await import(url(path.join(root, 'current-status-plans.ts')));
const fixture = {
  ls_augment_systemui_master: '1',
  ls_augment_statusbar_clock_custom: '1',
  ls_augment_statusbar_height_dp: '40',
  ls_augment_statusbar_connectivity_group: '1',
  ls_augment_rm_signal_dual: '1',
  ls_augment_rm_privacy_hide: '1',
  ls_augment_rm_statusbar_hide: '1',
  ls_augment_statusbar_artwork_v1: 'old artwork',
  ls_augment_statusbar_fonts_v1: 'old fonts',
  ls_augment_notification_summary_enabled: '1',
  ls_augment_notification_summary_asset: 'old summary image',
  'status:assets:preview-v1': 'old asset plan',
  'status:cpu:on': '1',
  'status:notifications:zone': '1',
  'prototype:display-order:bluetooth': '7',
  'prototype:icon-size:bluetooth': '24',
  'prototype:status:layout-backup': 'old backup',
  'prototype:visibility:keyguard:bluetooth': 'hide',
  'prototype:spacing:control:notifications:top': '8',
  ls_augment_rm_notification_stack: '1',
  ls_augment_launcher_grid: 'unchanged',
  'ui:theme': 'unchanged',
};
const fixtureBefore = structuredClone(fixture);
const factory = plans.resetStatusValues(fixture, fixture);
assert.deepEqual(
  fixture,
  fixtureBefore,
  'reset does not mutate the current values',
);
for (const key of [
  'ls_augment_systemui_master',
  'ls_augment_statusbar_clock_custom',
  'ls_augment_rm_signal_dual',
  'ls_augment_rm_privacy_hide',
  'ls_augment_rm_statusbar_hide',
  'ls_augment_notification_summary_enabled',
  'status:cpu:on',
])
  assert.equal(factory[key], '0', key);
for (const key of [
  'status:assets:preview-v1',
  'prototype:display-order:bluetooth',
  'prototype:icon-size:bluetooth',
  'prototype:status:layout-backup',
  'prototype:visibility:keyguard:bluetooth',
  'prototype:spacing:control:notifications:top',
])
  assert.equal(factory[key], undefined, key);
for (const key of [
  'ls_augment_statusbar_artwork_v1',
  'ls_augment_statusbar_fonts_v1',
  'ls_augment_notification_summary_asset',
])
  assert.equal(factory[key], '');
assert.equal(factory.ls_augment_rm_notification_stack, '1');
assert.equal(factory.ls_augment_launcher_grid, 'unchanged');
assert.equal(factory['ui:theme'], 'unchanged');
assert.equal(factory[p.rowModeKey], '1');
assert.deepEqual(
  plans.resetStatusValues(factory, fixture),
  factory,
  'reset is idempotent',
);
// The browser rehydrates built-in initial values; they must not restore the old demo customization.
const initial = {
  ls_augment_statusbar_clock_custom: '1',
  'status:cpu:on': '1',
  ls_augment_rm_hide_mobile_type: '1',
};
const reloaded = { ...initial, ...plans.resetStatusValues(fixture, initial) };
assert.equal(reloaded['status:cpu:on'], '0');
assert.equal(reloaded.ls_augment_statusbar_clock_custom, '0');
assert.equal(reloaded.ls_augment_rm_hide_mobile_type, '0');
assert.deepEqual(
  plans.statusPresets.map((preset) => preset.title),
  ['简洁单排', '常规双排'],
);
for (const preset of plans.statusPresets) {
  const applied = { ...fixture, ...plans.presetChanges(preset) };
  assert.equal(applied.ls_augment_systemui_master, '1');
  assert.equal(applied[p.rowModeKey], preset.id === 'single' ? '1' : '2');
  assert.equal(
    applied['status:assets:preview-v1'],
    fixture['status:assets:preview-v1'],
  );
  assert.equal(applied['status:notifications:zone'], '1');
  assert.equal(applied['prototype:display-order:bluetooth'], '7');
  assert.equal(applied.ls_augment_statusbar_connectivity_group, '1');
}
let v = {
  [p.rowModeKey]: '2',
  ls_augment_systemui_master: '1',
  'status:notifications:zone': '0',
  'status:notifications:order': '3',
};
const original = structuredClone(v);
// Numeric order changes only the chosen item and survives visibility / zone changes.
const numeric = { ...v, [l.numericOrderKey('bluetooth')]: '7' };
assert.equal(l.readPlacement(numeric, 'bluetooth').order, 7);
assert.equal(
  l.readPlacement(numeric, 'notifications').order,
  l.readPlacement(v, 'notifications').order,
);
assert.equal(
  l.readPlacement(
    { ...numeric, [l.placementKey('bluetooth', 'zone')]: '6' },
    'bluetooth',
  ).order,
  7,
);
assert.equal(
  l.readPlacement(
    { ...numeric, ls_augment_rm_hidden_icon_slots: 'bluetooth' },
    'bluetooth',
  ).order,
  7,
);
const tie = [
  { id: 'wifi', order: 7 },
  { id: 'bluetooth', order: 7 },
];
assert.deepEqual(
  [...tie].reverse().sort(l.comparePlacementOrder),
  tie.sort(l.comparePlacementOrder),
);
assert.equal(
  l.readPlacement(
    { ...v, [l.numericOrderKey('bluetooth')]: '1000' },
    'bluetooth',
  ).order,
  l.readPlacement(v, 'bluetooth').order,
);
v = { ...v, ...l.movePlacement(v, 'bluetooth', 0, 'notifications') };
assert.equal(l.readPlacement(v, 'bluetooth').zone, 0);
assert(
  l.readPlacement(v, 'bluetooth').order <
    l.readPlacement(v, 'notifications').order,
);
assert.equal(original['status:notifications:order'], '3');
v[l.placementKey('bluetooth', 'zone')] = '1';
assert.equal(l.effectiveZone({ ...v, [p.rowModeKey]: '1' }, 'bluetooth'), 2);
assert.equal(
  l.effectiveZone(v, 'bluetooth'),
  1,
  'switching back restores saved row',
);
assert.equal(l.placementOwner(v, 'bluetooth.battery'), 'bluetooth');
const beforeArrange = { ...v };
const arranged = { ...v, ...r.arrangeIndividualChanges(v) };
assert.equal(
  arranged['status:notifications:zone'],
  v['status:notifications:zone'],
);
assert.equal(
  arranged['status:notifications:order'],
  v['status:notifications:order'],
);
const undo = {
  ...arranged,
  [r.layoutBackupKey]: r.layoutSnapshot(beforeArrange),
};
Object.assign(undo, r.restoreLayoutChanges(undo));
assert.deepEqual(
  l.readPlacement(undo, 'bluetooth'),
  l.readPlacement(beforeArrange, 'bluetooth'),
);
const circle = { ...v, ls_augment_statusbar_connectivity_group: '1' };
assert(!l.placementItems(circle).some((i) => i.id === 'wifi'));
assert(l.placementItems(circle).some((i) => i.id === 'wifi.standard'));
assert(l.placementItems(circle).some((i) => i.id === 'mobile1.type'));
assert.equal(l.placementOwner(circle, 'wifi.signal'), 'battery');
assert.equal(
  l.placementOwner(
    { ...circle, ls_augment_statusbar_connectivity_group: '0' },
    'wifi.signal',
  ),
  'wifi',
);
const catalog = JSON.parse(
  fs.readFileSync(path.join(root, 'current-status-icons.json'), 'utf8'),
);
for (const state of [
  v,
  circle,
  { ...circle, ls_augment_statusbar_connectivity_middle_content: 'none' },
  { ...v, ls_augment_rm_signal_dual: '1' },
]) {
  const ids = new Set(l.placementItems(state).map((i) => i.id));
  for (const icon of catalog)
    assert(
      ids.has(l.placementOwner(state, icon.id)),
      icon.id + ' has a reachable placement owner',
    );
}
let hidden = { ls_augment_rm_hidden_icon_slots: 'bluetooth,alarm_clock' };
assert.equal(
  p.batchHideEnabled(hidden),
  true,
  'old selections migrate enabled',
);
assert(p.hiddenReason(hidden, 'status', 'bluetooth'));
hidden[p.batchHideKey] = '0';
assert.equal(p.hiddenReason(hidden, 'status', 'bluetooth'), '');
assert.equal(hidden.ls_augment_rm_hidden_icon_slots, 'bluetooth,alarm_clock');
hidden[p.batchHideKey] = '1';
assert(p.hiddenReason(hidden, 'status', 'bluetooth'));
const withIndependent = {
  ...v,
  ls_augment_rm_privacy_hide: '1',
  'status:assets:preview-v1': 'asset-fixture',
  [p.spacingKey('all', 'bluetooth', 'end')]: '-4',
};
const reset = { ...withIndependent, ...r.resetEditorChanges(withIndependent) };
assert.equal(reset.ls_augment_rm_privacy_hide, '1');
assert.equal(reset['status:assets:preview-v1'], 'asset-fixture');
assert.equal(reset[p.spacingKey('all', 'bluetooth', 'end')], '-4');
assert.equal(l.readPlacement(reset, 'bluetooth').zone, 8);
assert.equal(reset[p.rowModeKey], 'system');
assert.equal(r.restoreLayoutChanges({ [r.layoutBackupKey]: 'invalid' }), null);
console.log(
  'PASS: individual ordering, shared child placement, saved rows, ownership, batch-hide retention, scoped reset and layout undo.',
);
