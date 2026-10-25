/** Browser proposal only. New row / negative-spacing rules never write to a phone. */
export const rowModeKey = 'prototype:status:rows';
export const surfaceKey = 'prototype:status:surface';
export const hintIds =
  'privacy.camera,privacy.microphone,privacy.projection,privacy.location,vpn,screen_record,cast,connected_display,location,sensors_off,zen,mute,volume,alarm_clock,bluetooth,headset,nfc,hotspot,airplane,data_saver,managed_profile,rotate,tty,cooling_fan,liquid_cooling,refresh_rate'.split(
    ',',
  );
export const spacingAxes = ['start', 'top', 'end', 'bottom'] as const;
export type Values = Record<string, string>;
// Unlock owns the custom cap; eight samples, or four under native rules.
export function notificationSampleCount(v: Values) {
  if (v.ls_augment_statusbar_notification_unlimited !== '1') return 4;
  const limit = Number(v.ls_augment_statusbar_notification_max || 0);
  return Number.isFinite(limit) && limit > 0
    ? Math.min(8, Math.floor(limit))
    : 8;
}
/** Prototype ownership follows selected content; runtime SIM identity is a sample. */
export function connectivityCoverage(v: Values) {
  const active =
    v.ls_augment_statusbar_connectivity_group === '1' &&
    v.ls_augment_statusbar_position_size_only !== '1' &&
    v.ls_augment_systemui_master !== '0';
  const contents = ['upper', 'middle', 'lower'].map(
    (slot, i) =>
      v[`ls_augment_statusbar_connectivity_${slot}_content`] ||
      ['wifi', 'battery', 'dual'][i],
  );
  const data =
    v['prototype:connectivity-data-slot'] === '2' ? 'mobile2' : 'mobile1';
  const other = data === 'mobile1' ? 'mobile2' : 'mobile1';
  const owners = new Set<string>();
  if (active) {
    owners.add('battery'); // The outer ring always displays battery level.
    if (contents.includes('battery')) owners.add('battery_text');
    if (contents.includes('wifi')) owners.add('wifi');
    if (contents.includes('dual'))
      ['mobile1', 'mobile2', 'mobile_data', 'dual_signal'].forEach((id) =>
        owners.add(id),
      );
    if (contents.includes('data')) {
      owners.add(data);
      owners.add('mobile_data');
    }
    if (contents.includes('other')) owners.add(other);
    if (owners.has('mobile1') || owners.has('mobile2'))
      owners.add('dual_signal');
  }
  return { active, contents, owners };
}
export function managedByConnectivity(v: Values, id: string) {
  const { owners, contents } = connectivityCoverage(v);
  if (owners.has(id)) return true;
  const [owner, part] = id.split('.');
  if (!owners.has(owner)) return false;
  if (owner === 'battery')
    return (
      ['shell', 'fill'].includes(part) ||
      (contents.includes('battery') && ['charging', 'bypass'].includes(part))
    );
  // Only the signal strength is replaced. Activity, type, roaming and HD
  // remain separate elements and must keep their configuration entry.
  return part === 'signal';
}
export const batchHideKey = 'prototype:status:batch-hide';
export function batchHideEnabled(v: Values) {
  return (
    (v[batchHideKey] ?? (v.ls_augment_rm_hidden_icon_slots ? '1' : '0')) === '1'
  );
}
export const spacingKey = (surface: string, id: string, axis: string) =>
  `prototype:spacing:${surface}:${id}:${axis}`;
export const spacingModeKey = (surface: string, id: string) =>
  `prototype:spacing-mode:${surface}:${id}`;
export function spacingMode(v: Values, surface: string, id: string) {
  return (
    v[spacingModeKey(surface, id)] ||
    (spacingAxes.some((a) => v[spacingKey(surface, id, a)] !== undefined)
      ? 'custom'
      : 'inherit')
  );
}
export function resolveSpacing(
  v: Values,
  surface: string,
  id: string,
): number[] {
  const read = (scope: string, name: string): number[] | undefined => {
    const mode = spacingMode(v, scope, name);
    if (mode === 'native') return [0, 0, 0, 0];
    if (mode === 'custom')
      return spacingAxes.map((a) => Number(v[spacingKey(scope, name, a)] || 0));
  };
  return (
    read(surface, id) ||
    (surface !== 'all' ? read('all', id) : undefined) ||
    (id !== 'notifications' && id !== 'system-default'
      ? read(surface, 'system-default') || read('all', 'system-default')
      : undefined) || [0, 0, 0, 0]
  );
}
export function hasBoundary(id: string) {
  if (id === 'notifications' || id === 'system-default' || id === 'privacy.dot')
    return true;
  if (['mobile_data', 'dual_signal', 'system_activity'].includes(id))
    return false;
  if (!id.includes('.')) return true;
  if (
    [
      'privacy.camera',
      'privacy.microphone',
      'privacy.location',
      'privacy.projection',
    ].includes(id)
  )
    return true;
  const [owner, part] = id.split('.');
  return ['wifi', 'secondary_wifi'].includes(owner)
    ? ['signal', 'activity_inout'].includes(part)
    : ['mobile1', 'mobile2'].includes(owner) &&
        ['signal', 'type', 'activity_inout', 'roaming', 'volte'].includes(part);
}
export const visibilityKey = (surface: string, id: string) =>
  `prototype:visibility:${surface}:${id}`;
export function visibilityMode(v: Values, surface: string, id: string): string {
  if (v[visibilityKey(surface, id)]) return v[visibilityKey(surface, id)];
  try {
    const legacy =
      JSON.parse(v['status:assets:preview-v1'] || '{}').visibility || {};
    const key = (surface === 'all' ? '' : surface + '|') + id;
    if (Object.hasOwn(legacy, key)) return legacy[key] ? 'hide' : 'native';
  } catch {
    /* No saved resource plan. */
  }
  return 'inherit';
}
export function hiddenReason(v: Values, surface: string, id: string): string {
  const mode = visibilityMode(v, surface, id);
  if (mode === 'hide') return '此位置已隐藏';
  if (
    mode === 'inherit' &&
    surface !== 'all' &&
    visibilityMode(v, 'all', id) === 'hide'
  )
    return '继承共享隐藏规则';
  const owner = id.split('.')[0];
  if (owner !== id && owner !== 'privacy' && hiddenReason(v, surface, owner))
    return '所属图标已隐藏';
  if (
    batchHideEnabled(v) &&
    (v.ls_augment_rm_hidden_icon_slots || '').split(',').includes(id)
  )
    return '已有隐藏清单规则';
  if (id.startsWith('privacy.') && v.ls_augment_rm_privacy_hide === '1')
    return '隐私提示隐藏已开启';
  const specific: Record<string, string> = {
    mobile1: 'hide_sim1',
    mobile2: 'hide_sim2',
    'wifi.standard': 'hide_wifi_standard',
    'secondary_wifi.standard': 'hide_wifi_standard',
  };
  const gate =
    specific[id] ||
    (id.includes('wifi.activity')
      ? 'hide_wifi_activity'
      : /^mobile[12]\.activity/.test(id)
        ? 'hide_mobile_activity'
        : /^mobile[12]\.type/.test(id)
          ? 'hide_mobile_type'
          : '');
  if (gate && v['ls_augment_rm_' + gate] === '1')
    return '网络图标隐藏规则已开启';
  const scopeKey = id.includes('wifi')
    ? 'hide_wifi_scope'
    : id.startsWith('mobile')
      ? 'hide_mobile_scope'
      : id === 'hotspot'
        ? 'hide_hotspot_scope'
        : '';
  const scope = v['ls_augment_rm_' + scopeKey];
  if (
    scopeKey &&
    (scope === '6' ||
      (
        {
          status: ['1'],
          keyguard: ['2'],
          notification: ['3'],
          control: ['4', '5'],
        } as Record<string, string[]>
      )[surface]?.includes(scope))
  )
    return '此显示位置的网络隐藏规则已开启';
  return '';
}
export function layoutIsSingle(v: Values) {
  return ['1', 'system'].includes(v[rowModeKey]);
}
export function effectiveStatusValues(saved: Values): Values {
  const v = { ...saved };
  if (v.ls_augment_systemui_master === '0') {
    for (const id of [
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
    ]) {
      v[`status:${id}:on`] = [
        'clock',
        'notifications',
        'system_icons',
        'battery',
      ].includes(id)
        ? '1'
        : '0';
      v[`status:${id}:zone`] = ['clock', 'notifications'].includes(id)
        ? '2'
        : '8';
      v[`status:${id}:size`] = '13';
    }
    v[rowModeKey] = 'system';
    v.ls_augment_statusbar_clock_custom = '0';
    v.ls_augment_statusbar_connectivity_group = '0';
  }
  const positionOnly = v.ls_augment_statusbar_position_size_only === '1';
  if (positionOnly) {
    v.ls_augment_statusbar_clock_custom = '0';
    v.ls_augment_statusbar_connectivity_group = '0';
    v.ls_augment_statusbar_network_display = '0';
    for (const id of ['cpu', 'gpu', 'battery_temp', 'current', 'power'])
      v[`status:${id}:on`] = '0';
  }
  const coverage = connectivityCoverage(v);
  if (coverage.active) {
    v.ls_augment_statusbar_native_battery_enabled = '0';
    if (
      coverage.contents.some((content) =>
        ['dual', 'data', 'other'].includes(content),
      )
    )
      v.ls_augment_rm_signal_dual = '0';
  }
  if (layoutIsSingle(v) || positionOnly) {
    v.ls_augment_statusbar_clock_rows = '1';
    v.ls_augment_statusbar_notification_two_rows = '0';
    v.ls_augment_statusbar_system_two_rows = '0';
    v.ls_augment_statusbar_network_two_rows = '0';
    if (v.ls_augment_statusbar_network_display === '4')
      v.ls_augment_statusbar_network_display = '3';
    for (const [key, value] of Object.entries(v))
      if (/^status:[^:]+:zone$/.test(key))
        v[key] = String(Math.floor(Number(value) / 3) * 3 + 2);
  }
  if (v.ls_augment_statusbar_notification_hide === '1')
    v['status:notifications:on'] = '0';
  if (v['prototype:notification-sample'] === 'none')
    v['status:notifications:on'] = '0';
  if (v.ls_augment_rm_statusbar_hide === '1')
    for (const key of Object.keys(v))
      if (/^status:.*:on$/.test(key)) v[key] = '0';
  return v;
}
