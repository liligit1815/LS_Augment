import schema from './current-editor-data.json';
import inventory from './current-status-inventory.json';
import { rowModeKey, type Values } from './current-status-policy';

const k = (name: string) => 'ls_augment_statusbar_' + name;
const properties = (rows: string, gap: string): Values => ({
  [rowModeKey]: rows,
  [k('height_dp')]: '0',
  [k('top_margin_dp')]: '0',
  [k('bottom_margin_dp')]: '0',
  [k('left_margin_dp')]: '0',
  [k('right_margin_dp')]: '0',
  [k('dual_row_gap_dp')]: gap,
});
export const statusPresets = [
  {
    id: 'single',
    title: '简洁单排',
    description: '单排显示，原厂高度，四边留白与行间距为 0。',
    values: properties('1', '0'),
  },
  {
    id: 'double',
    title: '常规双排',
    description: '双排显示，原厂高度，四边留白为 0，两排间距为 2 dp。',
    values: properties('2', '2'),
  },
];
export type StatusPreset = (typeof statusPresets)[number];
export const presetChanges = (preset: StatusPreset): Values => ({
  ...preset.values,
  ls_augment_systemui_master: '1',
});

const nativeDefaults: Values = {
  ...Object.fromEntries(
    Object.values(schema.defaults).map((o) => [o.key, o.default]),
  ),
  ...Object.fromEntries(inventory.map((o) => [o.key, o.defaultValue])),
};
const nativeKeys = new Set(inventory.map((o) => o.key));
const prototypePrefixes = [
  'prototype:status:',
  'prototype:icon-position:',
  'prototype:icon-size:',
  'prototype:display-order:',
  'prototype:component-gap:',
  'prototype:spacing:',
  'prototype:spacing-mode:',
  'prototype:visibility:',
  'prototype:placement:',
  'prototype:metric:',
  'prototype:catalog:',
];
const prototypeKeys = new Set([
  'prototype:asset-surface',
  'prototype:notification-spacing-surface',
  'prototype:notification-sample',
  'prototype:connectivity-data-slot',
  'prototype:status-sheet',
]);
export const isStatusConfigurationKey = (key: string) =>
  key === 'ls_augment_systemui_master' ||
  key.startsWith('ls_augment_statusbar_') ||
  key.startsWith('ls_augment_notification_summary_') ||
  nativeKeys.has(key) ||
  key.startsWith('status:') ||
  prototypePrefixes.some((prefix) => key.startsWith(prefix)) ||
  prototypeKeys.has(key);

/** Clear this workspace atomically; unrelated module settings are preserved.
 * Explicit neutral defaults prevent the initial demo fixture returning on reload.
 */
export function resetStatusValues(
  current: Values,
  initial: Values = {},
): Values {
  const next = Object.fromEntries(
    Object.entries(current).filter(([key]) => !isStatusConfigurationKey(key)),
  );
  for (const key of new Set([
    ...Object.keys(initial),
    ...Object.keys(nativeDefaults),
    ...Object.keys(current),
  ])) {
    if (isStatusConfigurationKey(key) && key.startsWith('ls_augment_'))
      next[key] = nativeDefaults[key] ?? '';
  }
  const ids = [
    'clock',
    'notifications',
    'system_icons',
    'battery',
    'cpu',
    'gpu',
    'battery_temp',
    'current',
    'power',
    'network',
  ];
  ids.forEach((id, index) => {
    next[`status:${id}:on`] = index < 4 ? '1' : '0';
    next[`status:${id}:zone`] = index < 2 ? '2' : '8';
    next[`status:${id}:size`] = index < 4 ? '13' : '9';
    next[`status:${id}:order`] = String(index);
  });
  return {
    ...next,
    ...properties('1', '0'),
    ls_augment_systemui_master: '0',
    [k('native_battery_enabled')]: '0',
    [k('clock_rows')]: '1',
    [k('system_two_rows')]: '0',
    [k('notification_two_rows')]: '0',
    [k('network_two_rows')]: '0',
  };
}
