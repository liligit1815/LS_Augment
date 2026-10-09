import catalog from './current-catalog.json';
import groups from './current-feature-groups.json';
import editorData from './current-editor-data.json';
import { navigationTargets } from './current-navigation';
import type { Feature } from './current-feature-row';

export type ApplicationTarget = (typeof navigationTargets)[number];
export type ApplicationSection = {
  id: string;
  title: string;
  features: Feature[];
  entries: string[];
};
const entrySections: Record<string, string> = {
  freeform: 'freeform',
  audio_gain: 'audio',
  signature_install: 'installer',
  status_layout: 'statusbar',
  launcher_custom: 'launcher',
  shoulder: 'shoulder',
  combo_speed: 'combo',
  super_resolution: 'performance',
  ai_trigger: 'ai',
  fan_control: 'fan',
  beautify: 'theme',
  double_app: 'double',
  store_download: 'download',
  mi_health: 'health',
};
const inlineEntryFeatures: Record<string, (keyof typeof editorData.defaults)[]> = {
  shoulder: ['SHOULDER_ENABLED', 'TGK_RAPID_FIRE_ENABLED'],
  combo_speed: ['COMBO_SPEED_ENABLED'],
  super_resolution: ['SUPER_MIRROR_LOW_MODE', 'SUPER_MIRROR_DIABLO_COEXIST'],
  audio_gain: ['AUDIO_GAIN_ENABLED'],
  signature_install: ['ALLOW_SIGNATURE_MISMATCH'],
};
const embeddedEditorRoutes: Record<string, string> = {
  launcher_custom: 'group/launcher/launcher',
  extra_dim: 'group/systemui/quicksettings_more',
  audio_gain: 'group/system/audio',
  signature_install: 'group/system/installer',
};
export function usesEmbeddedEditors(targetId: string, section: ApplicationSection): boolean {
  return targetId === 'game' || section.entries.some((route) => !!embeddedEditorRoutes[route]);
}
function gameSectionRoute(route: string): string | undefined {
  const legacySection = route === 'diablo_coexist' ? 'performance' : entrySections[route];
  if (['shoulder', 'combo_speed', 'super_resolution', 'diablo_coexist'].includes(route))
    return groupRoute('game', legacySection);
  const [, owner, section, ...extra] = route.split('/');
  if (route.startsWith('group/') && owner === 'game' && extra.length &&
      ['shoulder', 'combo', 'performance', 'plugins', 'game_capture'].includes(section))
    return groupRoute('game', section);
}
const sectionTitles: Record<string, string> = {
  freeform: '小窗与多任务',
  audio: '音量与声音',
  installer: '应用安装规则',
  statusbar: '状态栏自定义',
  launcher_grid: '桌面布局',
  launcher: '应用图标与名称',
  status_resources: '状态栏素材与字体',
  shoulder: '肩键与极速连点',
  combo: '一键连招',
  performance: '性能与超分',
  ai: '识别与触发',
  fan: '转速与模式',
  theme: '主题下载与使用',
  collab_theme: '联名主题',
  lockscreen: '锁屏显示',
  double: '应用双开',
  download: '下载管理',
  health: '步数与每日计划',
  primary_interaction: '电源与返回手势',
  quicksettings: '控制中心',
  quicksettings_more: '控制中心其他设置',
  collab_audio: '联名音频',
  developer: '开发者设置',
  'update-link': '更新链接',
};
const sectionCopy: Record<string, string> = {
  statusbar: '表格布局、时钟、通知、硬件网速、图标与电池',
  status_resources: '图标总览、分状态素材、统一字体与分享包',
  freeform: '小窗数量、应用范围与跨应用跳转',
  audio: '音量档数、增益与按键规则',
  quicksettings: '玻璃材质、通知堆叠、面板内容与亮度',
  quicksettings_more: '面板行列、运营商、搜索按钮与极暗磁贴',
  primary_interaction: '高级重启与左右侧返回外观',
  launcher_grid: '行列、常用预设与桌面排列预览',
  launcher: '按用户空间修改图标、名称与页面',
  shoulder: '全应用肩键、双侧兼容测试与连点方案',
  combo: '调整连招播放速度与应用资格',
  performance: '超分、破坏神模式与适用范围',
  health: '绑定账户、步数倍速、随机计划与每日上限',
  fan: '硬件档位、转速测量与风扇控制',
  ai: '模板扫描、点击节拍与策略冷却',
  theme: '主题试用与资源下载',
  collab_audio: '选择本机音频并导入联名资源',
  developer: 'USB 调试与原厂开发者开关',
  'update-link': '查看系统更新准备安装时提取的地址',
};

/** Source features keep their owners; only presentation and navigation change. */
export function applicationSections(
  target: ApplicationTarget,
): ApplicationSection[] {
  const sections: ApplicationSection[] = groups.targets
    .filter(
      (t) => t.id === target.id || (target.id === 'theme' && t.id === 'collab'),
    )
    .flatMap<{ id: string; title: string; features: Feature[] }>((t) =>
      t.id === 'systemui' ? t.sections.filter(section => !['lockscreen', 'aod'].includes(section.id)) : t.sections,
    )
    .map((s) => ({
      id: s.id,
      title: sectionTitles[s.id] || s.title,
      features:
        target.id === 'systemui' && s.id === 'statusbar'
          ? []
          : ([...s.features] as Feature[]),
      entries: [],
    }));
  if (target.id === 'theme') {
    for (const section of groups.targets.find(t => t.id === 'systemui')?.sections || []) {
      if (!['lockscreen', 'aod'].includes(section.id)) continue;
      sections.push({id: section.id, title: sectionTitles[section.id] || section.title,
        features: [...section.features] as Feature[], entries: []});
    }
  }
  for (const entry of target.entries) {
    if (entry.route === 'launcher_compatibility') continue;
    const id = entrySections[entry.route] || entry.route;
    let section = sections.find((s) => s.id === id);
    if (!section) {
      section = {
        id,
        title: sectionTitles[id] || entry.title,
        features: [],
        entries: [],
      };
      sections.push(section);
    }
    section.entries.push(entry.route);
  }
  if (target.id === 'systemui') {
    sections.push({
      id: 'status_resources',
      title: sectionTitles.status_resources,
      features: [],
      entries: ['status_assets'],
    });
    const center = sections.find((s) => s.id === 'quicksettings'),
      glass = sections.find((s) => s.id === 'glass');
    if (center && glass) {
      center.features.unshift(...glass.features);
      sections.splice(sections.indexOf(glass), 1);
    }
    const interaction: ApplicationSection = {
      id: 'primary_interaction',
      title: sectionTitles.primary_interaction,
      features: [],
      entries: [],
    };
    for (const id of ['power', 'gestures']) {
      const section = sections.find((s) => s.id === id);
      if (section) {
        interaction.features.push(...section.features);
        sections.splice(sections.indexOf(section), 1);
      }
    }
    sections.push(interaction);
    if (center) {
      const more = center.features.filter(
        (f) =>
          ![
            'systemui:liquid_glass',
            'systemui:notification_stack',
            'systemui:full_brightness',
            'systemui:qs_brightness_percent',
          ].includes(f.id) &&
          f.objectGroup !== '面板日期、天气与时钟',
      );
      center.features = center.features.filter((f) => !more.includes(f));
      sections.push({
        id: 'quicksettings_more',
        title: sectionTitles.quicksettings_more,
        features: more,
        entries: ['extra_dim'],
      });
    }
  }
  if (target.id === 'settings')
    sections.push({
      id: 'developer',
      title: sectionTitles.developer,
      features: [],
      entries: [],
    });
  if (target.id === 'theme')
    sections.push({
      id: 'collab_audio',
      title: sectionTitles.collab_audio,
      features: [],
      entries: [],
    });
  if (target.id === 'update')
    sections.push({
      id: 'update-link',
      title: sectionTitles['update-link'],
      features: [],
      entries: [],
    });
  const order: Record<string, string[]> = {
    systemui: [
      'statusbar',
      'status_resources',
      'quicksettings',
      'primary_interaction',
      'lockscreen',
      'aod',
      'quicksettings_more',
      'volume_panel',
      'interaction',
      'usb',
    ],
    system: ['freeform', 'system', 'audio', 'connections', 'installer'],
    launcher: [
      'launcher_grid',
      'launcher',
      'dock_glass',
      'cleanup',
      'desktop_clock',
      'recents',
    ],
    theme: [
      'theme',
      'collab_theme',
      'collab_fingerprint',
      'collab_charging',
      'lockscreen',
      'aod',
      'collab_audio',
    ],
  };
  const rank = (id: string) => {
    const index = order[target.id]?.indexOf(id) ?? -1;
    return index < 0 ? 99 : index;
  };
  return sections.sort((a, b) => rank(a.id) - rank(b.id));
}
export const groupRoute = (target: string, section: string) =>
  `group/${target}/${section}`;
/** A single navigation child is opened directly; functional settings stay visible. */
export function singleChildRoute(route: string): string | undefined {
  if (route === 'group/systemui/lockscreen') return 'group/theme/lockscreen';
  if (route === 'group/systemui/aod') return 'group/theme/aod';
  if (embeddedEditorRoutes[route]) return embeddedEditorRoutes[route];
  const gameRoute = gameSectionRoute(route);
  if (gameRoute) return gameRoute;
  const target = navigationTargets.find((t) => 'target-' + t.id === route);
  if (target) {
    const sections = applicationSections(target);
    if (sections.length === 1)
      return groupRoute(target.id, sections[0].id);
  }
  const group = resolveGroup(route);
  if (group && !usesEmbeddedEditors(group.target.id, group.section) && group.section.features.length === 0 && group.section.entries.length === 1)
    return group.section.entries[0];
}
export function resolveDestination(route: string): string {
  const visited = new Set<string>();
  let next = route;
  while (!visited.has(next)) {
    visited.add(next);
    const child = singleChildRoute(next);
    if (!child) return next;
    next = child;
  }
  return route;
}
export function sectionDestination(
  target: ApplicationTarget,
  section: ApplicationSection,
): string {
  return resolveDestination(groupRoute(target.id, section.id));
}
export function resolveGroup(route: string) {
  const [kind, owner, id, ...extra] = route.split('/');
  if (kind !== 'group' || extra.length) return undefined;
  const target = navigationTargets.find((t) => t.id === owner);
  const section =
    target && applicationSections(target).find((s) => s.id === id);
  return target && section ? { target, section } : undefined;
}
export function sectionSummary(
  section: ApplicationSection,
  target: ApplicationTarget,
) {
  return (
    sectionCopy[section.id] ||
    section.features
      .slice(0, 3)
      .map((f) => f.objectGroup || f.title)
      .filter((s, i, all) => all.indexOf(s) === i)
      .join('、') ||
    target.summary
  );
}
export function sectionSettingKeys(section: ApplicationSection): string[] {
  const walk = (f: Feature): string[] => [
    ...(f.toggleKey ? [f.toggleKey] : []),
    ...f.parameterKeys,
    ...f.features.flatMap(walk),
  ];
  return section.features.flatMap(walk);
}
export function activeFeatureCount(
  section: ApplicationSection,
  values: Record<string, string>,
): number {
  const walk = (f: Feature): number => {
    const option = catalog.options.find(
      (o) => o.key === (f.toggleKey || f.parameterKeys[0]),
    );
    const value =
      values[option?.key || ''] ??
      option?.defaultValue ??
      f.activation.noOpValue;
    const active = f.toggleKey
      ? value === '1'
      : f.activation.comparison === 'number'
        ? Number(value) !== Number(f.activation.noOpValue)
        : value !== f.activation.noOpValue;
    return active ? 1 + f.features.reduce((n, child) => n + walk(child), 0) : 0;
  };
  const editors = section.entries.flatMap((route) => inlineEntryFeatures[route] || []);
  const launcherActive = section.entries.includes('launcher_custom') &&
    (values['prototype:launcher-enabled'] ?? (Object.entries(values).some(([key, value]) =>
      key.startsWith('launcher:') && (key.endsWith(':name') || key.endsWith(':picture')) && !!value) ? '1' : '0')) === '1';
  const extraDimActive = section.entries.includes('extra_dim') && values['prototype:extra-dim-tile'] === '1';
  return Number(launcherActive) + Number(extraDimActive) + section.features.reduce((n, f) => n + walk(f), 0) + editors.reduce((count, name) => {
    const option = editorData.defaults[name];
    return count + ((values[option.key] ?? String(option.default)) === '1' ? 1 : 0);
  }, 0);
}
function immediateParent(route: string): string {
  if (embeddedEditorRoutes[route]) return 'target-' + embeddedEditorRoutes[route].split('/')[1];
  if (route === 'rapid_compatibility') return groupRoute('game', 'shoulder');
  if (gameSectionRoute(route)) return 'target-game';
  if (route === 'status_canvas') return 'status_layout';
  if (route.startsWith('asset/')) return 'status_assets';
  const group = resolveGroup(route);
  if (group) return 'target-' + group.target.id;
  if (route.startsWith('target-')) return 'home';
  if (route === 'extra_dim')
    return groupRoute('systemui', 'quicksettings_more');
  for (const target of navigationTargets) {
    const sections = applicationSections(target),
      owner = sections.find((s) => s.entries.includes(route));
    if (owner)
      return owner.id === 'statusbar'
        ? 'target-' + target.id
        : groupRoute(target.id, owner.id);
  }
  return ['support', 'contributors'].includes(route)
    ? 'about'
    : route === 'scope'
      ? 'settings'
      : 'home';
}
/** Breadcrumbs and Back omit the same grouping pages that navigation skips. */
export function canonicalParent(route: string): string {
  if (['group/systemui/lockscreen', 'group/systemui/aod'].includes(route))
    route = resolveDestination(route);
  let parent = immediateParent(route);
  const visited = new Set<string>([route]);
  while (!visited.has(parent) && singleChildRoute(parent)) {
    visited.add(parent);
    parent = immediateParent(parent);
  }
  return parent;
}
export function navigationLevel(route: string): number {
  let level = 1, parent = resolveDestination(route);
  const visited = new Set<string>();
  while (!['home', 'settings', 'about'].includes(parent) && !visited.has(parent)) {
    visited.add(parent);
    level++;
    parent = canonicalParent(parent);
  }
  return level;
}
export const effectCopy: Record<string, string> = {
  device: '修改自动保存；按功能提示重启设备后生效。',
  systemui: '修改自动保存；首次安装或更新后重启系统界面。',
  launcher: '修改自动保存；布局和图标设置按提示重启系统桌面。',
  games: '修改自动保存；按功能提示重新打开游戏或游戏助手。',
  settings: '修改自动保存；原厂设置按对应功能提示生效。',
  apps: '修改自动保存；按对应功能提示重新打开相关应用。',
};
export const capabilityNotes: Record<string, string[]> = {
  system: [
    '小窗跳转已接入系统框架，王者荣耀微信登录已有用户确认；其他登录 SDK 与完整回传仍需逐项验证。',
    '小窗、安装和硬件能力受 ROM 与应用自身实现影响；参数可配置不等于当前设备已验证。',
  ],
  systemui: [
    '蓝牙电量样式已有 NX809J 昼夜模式截图及实时耳机电量证据。',
    '状态栏表格、素材、双排信号均有实际实现；不同 ROM 的裁切、布局和最终显示仍需核对。',
    '控制中心玻璃与侧滑返回已实现候选路径，最终光学表现和手势兼容仍需设备验收。',
  ],
  launcher: [
    '3–12 行列已接入真实桌面；小组件无法完整放入目标网格时保留当前布局。',
    '关闭自定义布局按首次启用前的原厂行列恢复；原型恢复操作只影响浏览器示例。',
    'Dock 玻璃、页面管理及清理动画有实现，具体 ROM 的最终表现需分别验证。',
  ],
  game: [
    '极速连点需先完成左、右肩键兼容测试；保存方案不代表测试通过。',
    '全应用资格不替代原厂应用开关；应用仍需按原厂方式启用。',
  ],
  fan: [
    '硬件档位和控制路径已实现；RPM 匹配必须先完成本机测量。',
    '网页中的转速和检测过程为示例，不证明当前手机的测量结果。',
  ],
  health: [
    '步数倍速与随机计划需先绑定当前登录账户，后台计划还受应用后台运行条件影响。',
    '关闭功能保留参数；已写入的步数不会因关闭而撤回。',
  ],
  theme: [
    '主题、指纹、充电动画与音频资源具有实际入口；最终可用性依赖原厂主题和联名组件。',
  ],
};
