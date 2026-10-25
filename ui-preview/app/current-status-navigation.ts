import icons from './current-status-icons.json';
/** Prototype proposal only. These destinations do not change Android navigation. */
export const statusDesignGroups = [
  {
    title: '状态栏布局与交互',
    entries: [
      {
        route: 'status_arrangement',
        title: '状态栏布局',
        summary: '布局方案、图标位置与顺序、单双排与留白',
      },
      {
        route: 'status_behavior',
        title: '显示与交互',
        summary: '内容显隐、系统显示规则、双击锁屏与挖孔黑圈',
      },
    ],
  },
  {
    title: '系统图标',
    entries: [
      {
        route: 'status_battery',
        title: '三合一图标',
        summary: '圆环、内部内容、大小、充电标志与颜色',
      },
      {
        route: 'status_icons',
        title: '图标管理',
        summary: '可配置图标、时钟、网速、硬件指标与间距',
      },
    ],
  },
  {
    title: '通知图标',
    entries: [
      {
        route: 'status_notifications',
        title: '通知图标设置',
        summary: '显隐、单双排、数量、大小、边距与通知样式',
      },
    ],
  },
  {
    title: '图标素材与字体',
    entries: [
      {
        route: 'status_assets',
        title: '图标素材与字体',
        summary: '共享与分位置方案、状态素材和角色字体',
      },
    ],
  },
];
export const statusDesignTitles: Record<string, string> = Object.fromEntries(
  statusDesignGroups.flatMap((group) =>
    group.entries.map((entry) => [entry.route, entry.title]),
  ),
);
statusDesignTitles.status_layout = '状态栏自定义';
Object.assign(statusDesignTitles, {
  status_clock: '时钟',
  status_network: '网速与网络设置',
  status_metrics: '硬件数据实时指标',
  status_native_battery: '原生电池图标',
  status_battery_text: '电量文字',
  status_system_arrangement: '图标管理',
});
icons.forEach((icon) => {
  statusDesignTitles['status_icon/' + icon.id] = icon.title;
});
export const isStatusDesignRoute = (route: string) =>
  !!statusDesignTitles[route] && route !== 'status_assets';

export function statusOptionRoute(key: string): string {
  if (key.includes('notification')) return 'status_notifications';
  if (/metric/.test(key)) return 'status_metrics';
  if (/battery/.test(key)) return 'status_native_battery';
  if (/clock|restore_font/.test(key)) return 'status_clock';
  if (
    /network|signal_dual|hide_wifi|hide_mobile|hide_hd|hide_sim|hide_hotspot/.test(
      key,
    )
  )
    return 'status_network';
  if (/double_tap|statusbar_hide|cutout/.test(key)) return 'status_behavior';
  return 'status_icons';
}
