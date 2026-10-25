import assert from 'node:assert/strict';
import fs from 'node:fs';
import ts from 'typescript';
const source = fs.readFileSync(
  new URL('../app/current-status-policy.ts', import.meta.url),
  'utf8',
);
const js = ts.transpileModule(source, {
  compilerOptions: {
    target: ts.ScriptTarget.ES2022,
    module: ts.ModuleKind.ESNext,
  },
}).outputText;
const p = await import(
  'data:text/javascript;base64,' + Buffer.from(js).toString('base64')
);
const notificationSettings = {
  ls_augment_statusbar_notification_unlimited: '0',
  ls_augment_statusbar_notification_max: '2',
};
assert.equal(
  p.notificationSampleCount(notificationSettings),
  4,
  'unlock off follows native rules and preserves the custom cap',
);
assert.equal(
  p.notificationSampleCount({
    ...notificationSettings,
    ls_augment_statusbar_notification_unlimited: '1',
  }),
  2,
  'unlock on applies its saved custom cap',
);
assert.equal(
  p.notificationSampleCount(notificationSettings),
  4,
  'switching unlock off restores native rules',
);
assert.equal(
  p.notificationSampleCount({ ls_augment_statusbar_notification_max: '0' }),
  4,
  'zero follows the native-count fixture',
);
assert.equal(
  p.notificationSampleCount({
    ls_augment_statusbar_notification_unlimited: '1',
    ls_augment_statusbar_notification_max: '20',
  }),
  8,
  'a cap cannot create missing notifications',
);
assert.equal(
  p.notificationSampleCount({
    ls_augment_statusbar_notification_unlimited: '1',
    ls_augment_statusbar_notification_max: '0',
  }),
  8,
  'zero applies no extra cap while enabled',
);
const circle = { ls_augment_statusbar_connectivity_group: '1' };
for (const id of [
  'wifi',
  'wifi.signal',
  'battery',
  'battery_text',
  'mobile1',
  'mobile2',
  'mobile_data',
])
  assert(
    p.managedByConnectivity(circle, id),
    id + ' is covered by default contents',
  );
for (const id of [
  'secondary_wifi',
  'bluetooth',
  'bluetooth.battery',
  'nfc',
  'privacy.dot',
  'wifi.standard',
  'wifi.activity_inout',
  'mobile1.type',
  'mobile2.volte',
])
  assert(!p.managedByConnectivity(circle, id), id + ' remains independent');
const partial = {
  ...circle,
  ls_augment_statusbar_connectivity_upper_content: 'none',
  ls_augment_statusbar_connectivity_middle_content: 'none',
  ls_augment_statusbar_connectivity_lower_content: 'data',
};
assert(p.managedByConnectivity(partial, 'mobile1'));
assert(
  p.managedByConnectivity(partial, 'dual_signal'),
  'the combined dual-signal icon pauses when one of its cards is taken over',
);
assert(!p.managedByConnectivity(partial, 'mobile2'));
assert(!p.managedByConnectivity(partial, 'wifi'));
assert(!p.managedByConnectivity(partial, 'battery_text'));
assert(
  p.managedByConnectivity(partial, 'battery'),
  'outer ring still owns battery',
);
assert(
  p.managedByConnectivity(
    { ...partial, 'prototype:connectivity-data-slot': '2' },
    'mobile2',
  ),
);
assert(
  !p.managedByConnectivity(
    { ...partial, 'prototype:connectivity-data-slot': '2' },
    'mobile1',
  ),
);
const other = {
  ...partial,
  ls_augment_statusbar_connectivity_lower_content: 'other',
};
assert(p.managedByConnectivity(other, 'mobile2'));
assert(!p.managedByConnectivity(other, 'mobile_data'));
for (const override of [
  { ls_augment_statusbar_connectivity_group: '0' },
  { ls_augment_statusbar_position_size_only: '1' },
  { ls_augment_systemui_master: '0' },
])
  assert.equal(
    p.connectivityCoverage({ ...circle, ...override }).owners.size,
    0,
  );
const restore = {
  ...circle,
  ls_augment_statusbar_native_battery_enabled: '1',
  ls_augment_rm_signal_dual: '1',
};
assert.equal(p.effectiveStatusValues(restore).ls_augment_rm_signal_dual, '0');
assert.equal(
  p.effectiveStatusValues({
    ...restore,
    ls_augment_statusbar_connectivity_group: '0',
  }).ls_augment_rm_signal_dual,
  '1',
);
assert.equal(restore.ls_augment_statusbar_native_battery_enabled, '1');
const saved = {
  [p.rowModeKey]: '1',
  'status:clock:zone': '1',
  'status:cpu:on': '1',
  ls_augment_statusbar_clock_custom: '1',
  ls_augment_statusbar_clock_rows: '2',
  ls_augment_statusbar_clock_pattern_second: 'MM/dd E',
  ls_augment_statusbar_system_two_rows: '1',
  ls_augment_statusbar_notification_two_rows: '1',
  ls_augment_statusbar_network_display: '4',
  ls_augment_statusbar_connectivity_group: '1',
  ls_augment_rm_signal_dual: '1',
};
const before = structuredClone(saved),
  single = p.effectiveStatusValues(saved);
assert.equal(single.ls_augment_statusbar_clock_rows, '1');
assert.equal(single['status:clock:zone'], '2');
assert.equal(single.ls_augment_statusbar_network_display, '3');
assert.deepEqual(
  saved,
  before,
  'changing effective rows must never destroy saved rows or format',
);
const dual = p.effectiveStatusValues({ ...saved, [p.rowModeKey]: '2' });
assert.equal(dual['status:clock:zone'], '1');
assert.equal(dual.ls_augment_statusbar_clock_rows, '2');
assert.equal(dual.ls_augment_statusbar_clock_pattern_second, 'MM/dd E');
const paused = p.effectiveStatusValues({
  ...saved,
  ls_augment_statusbar_position_size_only: '1',
});
assert.equal(paused['status:cpu:on'], '0');
assert.equal(paused.ls_augment_statusbar_connectivity_group, '0');
assert.equal(
  paused.ls_augment_rm_signal_dual,
  '1',
  'dual signal is independent of position-only mode',
);
const edges = {
  [p.spacingModeKey('all', 'system-default')]: 'custom',
  [p.spacingKey('all', 'system-default', 'start')]: '-3',
  [p.spacingModeKey('all', 'wifi')]: 'custom',
  [p.spacingKey('all', 'wifi', 'end')]: '-4',
};
assert.deepEqual(
  p.resolveSpacing(edges, 'keyguard', 'bluetooth'),
  [-3, 0, 0, 0],
);
assert.deepEqual(p.resolveSpacing(edges, 'keyguard', 'wifi'), [0, 0, -4, 0]);
edges[p.spacingModeKey('keyguard', 'wifi')] = 'native';
assert.deepEqual(p.resolveSpacing(edges, 'keyguard', 'wifi'), [0, 0, 0, 0]);
edges[p.spacingModeKey('keyguard', 'wifi')] = 'inherit';
assert.deepEqual(
  p.resolveSpacing(edges, 'keyguard', 'wifi'),
  [0, 0, -4, 0],
  'restoring inheritance must restore shared negative spacing',
);
assert.deepEqual(
  p.resolveSpacing(edges, 'keyguard', 'notifications'),
  [0, 0, 0, 0],
  'system defaults must not change notification spacing',
);
const visibility = {
  [p.visibilityKey('all', 'wifi')]: 'hide',
  [p.visibilityKey('keyguard', 'wifi')]: 'native',
};
assert.equal(p.hiddenReason(visibility, 'keyguard', 'wifi'), '');
assert.equal(
  p.hiddenReason(visibility, 'status', 'wifi.signal'),
  '所属图标已隐藏',
);
assert.equal(
  p.hiddenReason(
    {
      'status:assets:preview-v1': JSON.stringify({
        visibility: { 'keyguard|bluetooth': true },
      }),
    },
    'keyguard',
    'bluetooth',
  ),
  '此位置已隐藏',
);
const icons = JSON.parse(
  fs.readFileSync(
    new URL('../app/current-status-icons.json', import.meta.url),
    'utf8',
  ),
);
assert.equal(icons.length, 81);
assert.equal(new Set(icons.map((i) => i.id)).size, 81);
const roots = icons.filter(
  (i) => !icons.some((parent) => i.id.startsWith(parent.id + '.')),
);
const reachable = new Set(
  roots.flatMap((i) => [
    i.id,
    ...icons
      .filter((child) => child.id.startsWith(i.id + '.'))
      .map((child) => child.id),
  ]),
);
assert.equal(
  reachable.size,
  81,
  'every item must be reachable through a category or its parent',
);
assert.equal(p.hintIds.length, 26);
assert(p.hintIds.every((id) => icons.some((i) => i.id === id)));
assert(p.hasBoundary('notifications'));
assert(p.hasBoundary('mobile1.type'));
assert(!p.hasBoundary('mobile_data'));
assert(!p.hasBoundary('battery.shell'));
console.log(
  'PASS: row restoration, compatibility pause, negative spacing inheritance, visibility migration, 81 reachable icons, 26 priorities.',
);
