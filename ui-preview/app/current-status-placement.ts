import icons from './current-status-icons.json';
import {
  connectivityCoverage,
  managedByConnectivity,
  layoutIsSingle,
  type Values,
} from './current-status-policy';

export const componentNames: Record<string, string> = {
  clock: '时钟',
  notifications: '通知图标',
  battery: '电池',
  cpu: 'CPU 温度',
  gpu: 'GPU 温度',
  battery_temp: '电池温度',
  current: '电流',
  power: '功率',
  network: '网速',
};
export const placementZones = [
  '左上',
  '左下',
  '左侧跨两排',
  '中上',
  '中下',
  '中间跨两排',
  '右上',
  '右下',
  '右侧跨两排',
];
export const placementKey = (id: string, field: string) =>
  (id in componentNames ? 'status:' : 'prototype:icon-position:') +
  id +
  ':' +
  field;
export const defaultZone = (id: string) =>
  ({
    clock: 2,
    notifications: 2,
    battery: 8,
    cpu: 1,
    gpu: 1,
    battery_temp: 4,
    current: 7,
    power: 7,
    network: 5,
  })[id] ?? 8;
export function placementOwner(v: Values, id: string): string {
  if (id === 'connectivity' || managedByConnectivity(v, id)) return 'battery';
  if (id === 'mobile_data' || id.startsWith('mobile_data.'))
    return placementOwner(
      v,
      id.replace(
        'mobile_data',
        v['prototype:connectivity-data-slot'] === '2' ? 'mobile2' : 'mobile1',
      ),
    );
  const root = id.split('.')[0];
  if (
    ['mobile1', 'mobile2'].includes(root) &&
    v.ls_augment_rm_signal_dual === '1' &&
    !connectivityCoverage(v).active
  )
    return 'dual_signal';
  if (id.includes('.') && root !== 'privacy') {
    if (managedByConnectivity(v, root)) {
      if (id.includes('.activity_')) return root + '.activity_inout';
      return id;
    }
    return root;
  }
  return id;
}
export function placementItems(v: Values) {
  const result = Object.entries(componentNames).map(([id, title]) => ({
    id,
    title:
      id === 'battery' && connectivityCoverage(v).active ? '三合一图标' : title,
  }));
  for (const icon of icons) {
    if (
      icon.id === 'connectivity' ||
      icon.id in componentNames ||
      managedByConnectivity(v, icon.id)
    )
      continue;
    if (placementOwner(v, icon.id) !== icon.id) continue;
    result.push({ id: icon.id, title: icon.title });
  }
  return result;
}
export function readPlacement(v: Values, id: string) {
  const ordinary = !(id in componentNames);
  const zone = Number(
    v[placementKey(id, 'zone')] ||
      (ordinary ? v['status:system_icons:zone'] : undefined) ||
      defaultZone(id),
  );
  const order = Number(
    v[placementKey(id, 'order')] ||
      (ordinary
        ? Number(v['status:system_icons:order'] || 2) +
          icons.findIndex((i) => i.id === id) / 100
        : Object.keys(componentNames).indexOf(id)),
  );
  return { zone, order };
}
export function effectiveZone(v: Values, id: string) {
  const zone = readPlacement(v, id).zone;
  return layoutIsSingle(v) || v.ls_augment_statusbar_position_size_only === '1'
    ? Math.floor(zone / 3) * 3 + 2
    : zone;
}
export function placementPeers(
  v: Values,
  id: string,
  zone = readPlacement(v, id).zone,
) {
  return placementItems(v)
    .filter(
      (i) =>
        Math.floor(readPlacement(v, i.id).zone / 3) === Math.floor(zone / 3),
    )
    .sort(
      (a, b) => readPlacement(v, a.id).order - readPlacement(v, b.id).order,
    );
}
/** Move relative to another item; normalize order without losing saved rows. */
export function movePlacement(
  v: Values,
  id: string,
  zone: number,
  before = '',
): Values {
  const peers = placementPeers(v, id, zone)
    .filter((i) => i.id !== id)
    .map((i) => i.id);
  const index = peers.indexOf(before);
  peers.splice(index < 0 ? peers.length : index, 0, id);
  return {
    [placementKey(id, 'zone')]: String(zone),
    ...Object.fromEntries(
      peers.map((item, i) => [placementKey(item, 'order'), String(i)]),
    ),
  };
}
export function placementRoute(v: Values, id: string) {
  if (id === 'notifications') return 'status_notifications';
  if (id === 'battery' && connectivityCoverage(v).active)
    return 'status_battery';
  if (id === 'clock' || id === 'network') return 'status_' + id;
  if (['cpu', 'gpu', 'battery_temp', 'current', 'power'].includes(id))
    return 'status_metrics';
  return 'status_icon/' + id;
}
