import schema from './current-editor-data.json';
import inventory from './current-status-inventory.json';
import { type Values, rowModeKey } from './current-status-policy';
import {
  placementItems,
  placementKey,
  defaultZone,
  componentNames,
} from './current-status-placement';
export const layoutBackupKey = 'prototype:status:layout-backup';
const nativeKeys = new Set(inventory.map((o) => o.key));
const excluded = /artwork|fonts_v1|visibility|icon_spacing|hint_/;
const editorKey = (key: string) =>
  key.startsWith('ls_augment_statusbar_') && !excluded.test(key);
export const recoveryKey = (key: string) =>
  editorKey(key) ||
  nativeKeys.has(key) ||
  key === 'ls_augment_systemui_master' ||
  /^status:[^:]+:(on|zone|size|order)$/.test(key) ||
  key === rowModeKey ||
  key.startsWith('prototype:icon-position:') ||
  key.startsWith('prototype:component-gap:');
export function layoutSnapshot(v: Values) {
  return JSON.stringify(
    Object.fromEntries(Object.entries(v).filter(([key]) => recoveryKey(key))),
  );
}
export function restoreLayoutChanges(v: Values): Values | null {
  try {
    const saved = JSON.parse(v[layoutBackupKey] || 'null');
    if (!saved || typeof saved !== 'object' || Array.isArray(saved))
      return null;
    return Object.fromEntries(
      [...new Set([...Object.keys(v), ...Object.keys(saved)])]
        .filter(recoveryKey)
        .map((key) => [key, typeof saved[key] === 'string' ? saved[key] : '']),
    );
  } catch {
    return null;
  }
}
export function resetEditorChanges(v: Values): Values {
  const out: Values = Object.fromEntries(
    Object.values(schema.defaults)
      .filter((o) => editorKey(o.key))
      .map((o) => [o.key, o.default]),
  );
  for (const id of Object.keys(componentNames).concat('system_icons')) {
    const base = ['clock', 'notifications', 'system_icons', 'battery'].includes(
      id,
    );
    out[`status:${id}:on`] = base ? '1' : '0';
    out[`status:${id}:size`] = base ? '13' : '9';
    out[`status:${id}:zone`] = String(defaultZone(id));
    out[`status:${id}:order`] = String(
      Object.keys(componentNames).indexOf(id) + 1,
    );
  }
  for (const key of Object.keys(v))
    if (
      key.startsWith('prototype:icon-position:') ||
      key.startsWith('prototype:component-gap:')
    )
      out[key] = '';
  out[rowModeKey] = 'system';
  out.ls_augment_statusbar_dual_row_gap_dp = '0';
  return out;
}
export function arrangeIndividualChanges(v: Values): Values {
  return Object.fromEntries(
    placementItems(v)
      .filter((i) => i.id !== 'notifications')
      .flatMap((i, index) => [
        [
          placementKey(i.id, 'zone'),
          String(
            i.id === 'clock'
              ? 0
              : ['cpu', 'gpu', 'battery_temp'].includes(i.id)
                ? 1
                : ['current', 'power', 'network'].includes(i.id)
                  ? 7
                  : 8,
          ),
        ],
        [placementKey(i.id, 'order'), String(index)],
      ]),
  );
}
