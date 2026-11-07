'use client';
import { createContext, useContext, useState, type ReactNode } from 'react';
import {
  ArrowLeft,
  ChevronRight,
  Search,
  RefreshCw,
  SlidersHorizontal,
  Shield,
  Bell,
  Palette,
  Activity,
  CircleHelp,
} from 'lucide-react';
import {
  Card,
  Button,
  Toggle,
  Range,
  CurrentContext,
  useModel,
  identity,
} from './current-ui';
import { NativeFold, NativeSelect } from './current-native-controls';
import { CurrentStatusPreview } from './current-status-preview';
import { useStatusAssetDraft } from './current-status-assets';
import { IconGlyph, surfaces } from './current-status-icon-manager';
import { PlacementEditor } from './current-status-placement-editor';
import { componentNames, placementRoute } from './current-status-placement';
import {
  rowModeKey,
  layoutIsSingle,
  hiddenReason,
  managedByConnectivity,
  hasBoundary,
} from './current-status-policy';
import icons from './current-status-icons.json';
import {
  statusPresets,
  presetChanges,
  type StatusPreset,
} from './current-status-plans';
import './current-status-workspace.css';

const k = (name: string) => 'ls_augment_statusbar_' + name;
const PresetContext = createContext<{
  preset?: StatusPreset;
  select: (preset?: StatusPreset) => void;
}>({ select: () => {} });
export function StatusPresetProvider({ children }: { children: ReactNode }) {
  const [preset, select] = useState<StatusPreset>();
  return (
    <PresetContext.Provider value={{ preset, select }}>
      {children}
    </PresetContext.Provider>
  );
}
export const workspaceTabs = [
  { route: 'status_layout', title: '状态栏属性', icon: SlidersHorizontal },
  { route: 'status_icons', title: '系统图标', icon: Shield },
  { route: 'status_notifications', title: '通知图标', icon: Bell },
  { route: 'status_assets', title: '图标素材与字体', icon: Palette },
];
export function workspaceGroup(route: string) {
  if (route === 'status_assets' || route.startsWith('asset/'))
    return 'status_assets';
  if (route === 'status_notifications') return route;
  if (
    ['status_layout', 'status_arrangement', 'status_behavior'].includes(route)
  )
    return 'status_layout';
  return 'status_icons';
}
export function StatusWorkspace({
  route,
  children,
}: {
  route: string;
  children: ReactNode;
}) {
  const m = useModel(),
    assets = useStatusAssetDraft();
  const { preset, select: selectPreset } = useContext(PresetContext);
  const previewValues = preset
    ? { ...m.values, ...presetChanges(preset) }
    : m.values;
  const group = workspaceGroup(route);
  const compact = m.values['prototype:status:preview-collapsed'] === '1';
  const setCompact = (value: boolean) =>
    m.set('prototype:status:preview-collapsed', value ? '1' : '0');
  const detail = !workspaceTabs.some((tab) => tab.route === route);
  return (
    <div
      className="sw-workspace sd-page sd-editor"
      {...identity('StatusBarSettingsActivity:workspace', '状态栏四分组编辑器')}
    >
      <div className="sw-pinned">
        <Card className="sw-preview-card" label="共用状态栏预览">
          <div className="sw-preview-heading">
            <strong>
              状态栏预览
              <small>
                示例 ·{' '}
                {previewValues.ls_augment_systemui_master === '0' ||
                layoutIsSingle(previewValues)
                  ? '单排'
                  : '双排'}
              </small>
            </strong>
            <button
              className="sw-preview-collapse"
              aria-label="切换预览场景"
              onClick={() =>
                m.dialog(
                  '预览场景',
                  <>
                    <p>各组共用此场景；切换保留各位置的独立方案。</p>
                    {surfaces.map(([id, title]) => (
                      <Button
                        key={id}
                        secondary
                        onClick={() => {
                          m.set('prototype:status:surface', id);
                          m.close();
                        }}
                      >
                        {title}
                      </Button>
                    ))}
                  </>,
                )
              }
            >
              {
                surfaces.find(
                  ([id]) =>
                    id === (m.values['prototype:status:surface'] || 'all'),
                )?.[1]
              }
            </button>
            <button
              className="sw-icon-button"
              aria-label="预览说明"
              onClick={() =>
                m.dialog(
                  '共用状态栏预览',
                  <>
                    <p>
                      四组使用同一份配置。切换分组和图标详情保留位置、显隐、大小、间距与素材草稿。
                    </p>
                    <p>
                      此处使用示例图标和硬件数据；实际图标、可用空间及能力须由手机端采集。预览拥挤时会缩小内容，保存值不变。
                    </p>
                    <p>
                      素材整图和内置角色字体参与共用预览。分层素材、文件字体及所有系统状态仍以原有素材详情预览为准。
                    </p>
                    <footer>
                      <button onClick={m.close}>知道了</button>
                    </footer>
                  </>,
                )
              }
            >
              <CircleHelp size={17} />
            </button>
            <button
              className="sw-preview-collapse"
              onClick={() => setCompact(!compact)}
              aria-expanded={!compact}
            >
              {compact ? '展开' : '收起'}
            </button>
          </div>
          {!compact && (
            <div className="sd-preview sw-shared-preview">
              <CurrentStatusPreview
                individual
                values={previewValues}
                assets={assets.draft}
                onSelect={(id) => {
                  m.set('prototype:placement:focus', id);
                  if (metrics.includes(id)) m.set('prototype:metric:focus', id);
                  m.go(placementRoute(m.values, id));
                }}
              />
            </div>
          )}
          {assets.dirty && (
            <output className="sw-draft">包含未应用的素材与字体草稿</output>
          )}
          {preset && (
            <div className="sw-preset-preview">
              <output>预览：{preset.title} · 尚未应用</output>
              <div className="sw-plan-actions">
                <Button secondary onClick={() => selectPreset(undefined)}>
                  取消预览
                </Button>
                <Button
                  onClick={() => {
                    Object.entries(presetChanges(preset)).forEach(
                      ([key, value]) => m.set(key, value),
                    );
                    selectPreset(undefined);
                    m.tell('已应用' + preset.title + '，可继续调整状态栏属性');
                  }}
                >
                  应用方案
                </Button>
              </div>
            </div>
          )}
        </Card>
        <nav className="c-tabs sw-tabs" aria-label="状态栏配置分组">
          {workspaceTabs.map(({ route: to, title }) => (
            <button
              key={to}
              aria-current={group === to ? 'page' : undefined}
              aria-pressed={group === to}
              onClick={() => m.go(to)}
              {...identity('status-group:' + to, title)}
            >
              <span>{title}</span>
            </button>
          ))}
        </nav>
      </div>
      <div className="sw-panel" data-group={group}>
        {detail && (
          <button className="sw-back" onClick={() => m.go(group)}>
            <ArrowLeft size={17} />
            返回{workspaceTabs.find((t) => t.route === group)?.title}
          </button>
        )}
        {children}
      </div>
    </div>
  );
}

export function StatusProperties({ behavior }: { behavior: ReactNode }) {
  const m = useModel(),
    enabled = m.values.ls_augment_systemui_master !== '0';
  const assets = useStatusAssetDraft();
  const { preset, select } = useContext(PresetContext);
  return (
    <>
      <Card>
        <Toggle
          name="ls_augment_systemui_master"
          title="启用状态栏自定义"
          initial="1"
          help="关闭保留布局与图标配置；独立原生功能仍遵循各自开关。"
        />
      </Card>
      {!enabled && (
        <output className="c-native-note">
          状态栏自定义已关闭，可选择预设方案或重新开启。
        </output>
      )}
      <Card>
        <NativeFold
          title="预设方案"
          help="选择后在顶部预览，点击应用方案后保存。仅替换排数、高度、四边留白和双排间距，并开启状态栏自定义；保留图标、通知、素材与字体设置。"
        >
          <CurrentContext.Provider
            value={{
              ...m,
              values: { ...m.values, 'preset:selection': preset?.id || '' },
              set: (key, value) => {
                if (key === 'preset:selection') {
                  select(statusPresets.find((p) => p.id === value));
                  m.set('prototype:status:preview-collapsed', '0');
                } else m.set(key, value);
              },
            }}
          >
            <NativeSelect
              name="preset:selection"
              title="选择方案"
              presentation="buttons"
              choices={statusPresets.map((p): [string, string] => [
                p.id,
                p.title,
              ])}
              help="点选方案只预览，不会立即替换当前配置。"
            />
          </CurrentContext.Provider>
          <p className="c-native-note">
            {preset?.description || '选择方案后，在顶部共用预览中查看效果。'}
          </p>
          <p className="c-native-note">
            应用会开启状态栏自定义，仅替换排数、高度、四边留白和双排间距。
          </p>
        </NativeFold>
      </Card>
      <fieldset className="sd-fieldset" disabled={!enabled || !!preset}>
        <Card>
          <NativeSelect
            name={rowModeKey}
            title="状态栏排数"
            initial="2"
            choices={[
              ['1', '单排'],
              ['2', '双排'],
            ]}
            help="切回单排只暂停第二排，原有行位置与双排配置保留。"
          />
          <NativeFold
            title="高度与四边留白"
            help="高度 0 使用原厂，负值相对原厂减小，正值指定高度。留白影响整栏，图标自身间距在各图标内设置。"
          >
            <Range
              name={k('height_dp')}
              title="状态栏高度"
              min={-32}
              max={96}
              suffix=" dp"
            />
            {['top', 'bottom', 'left', 'right'].map((edge, i) => (
              <Range
                key={edge}
                name={k(edge + '_margin_dp')}
                title={['上侧留白', '下侧留白', '左侧留白', '右侧留白'][i]}
                min={0}
                max={64}
                suffix=" dp"
              />
            ))}
          </NativeFold>
          {!layoutIsSingle(m.values) && (
            <NativeFold
              title="双排间距"
              help="全栏双排共用。单排时暂停并记住数值；负间距可能重叠，示例按安全距离显示。"
            >
              <Range
                name={k('dual_row_gap_dp')}
                title="上下两排间距"
                min={-8}
                max={64}
                suffix=" dp"
              />
            </NativeFold>
          )}
        </Card>
      </fieldset>
      <h3 className="c-group">更多设置</h3>
      <Card>
        <NativeFold
          title="显示与交互"
          help="保留原有内容显隐、双击锁屏与挖孔黑圈。"
        >
          {behavior}
        </NativeFold>
      </Card>
      {m.values[k('position_size_only')] === '1' && (
        <Card>
          <Toggle
            name={k('position_size_only')}
            title="仅调整位置和大小（旧方案）"
            help="当前旧方案已开启，暂停自定义内容与双排；关闭后可使用完整四组配置。关闭后新入口不再展示，原值不被静默修改。"
          />
        </Card>
      )}
      <Card label="重置状态栏配置">
        <Button
          secondary
          onClick={() =>
            m.dialog(
              '重置状态栏配置',
              <>
                <p>将清除状态栏四个分组的全部自定义配置，恢复原厂样式：</p>
                <ul>
                  <li>排数、高度、留白、行间距与显示交互设置</li>
                  <li>系统图标、三合一、硬件指标与通知图标设置</li>
                  <li>所有显示位置的图标素材与字体，包含未应用草稿</li>
                </ul>
                <p>
                  重置后关闭状态栏自定义，并清除素材编辑的撤销记录。其它模块设置不受影响。
                </p>
                <footer>
                  <button onClick={m.close}>取消</button>
                  <button
                    onClick={() => {
                      m.resetStatusConfiguration?.();
                      assets.clear();
                      select(undefined);
                      m.close();
                      m.tell('已重置网页状态栏配置，恢复原厂样式示意');
                    }}
                  >
                    确认重置
                  </button>
                </footer>
              </>,
            )
          }
        >
          重置状态栏配置
        </Button>
        <p className="c-native-note">清除四个分组的全部配置，恢复原厂样式。</p>
      </Card>
    </>
  );
}

const metrics = ['cpu', 'gpu', 'battery_temp', 'current', 'power'];
const observed = new Set([
  'clock',
  'wifi',
  'wifi.signal',
  'mobile1',
  'mobile1.signal',
  'battery',
  'bluetooth',
  'alarm_clock',
  'network',
]);
const directory = [
  ...Object.entries(componentNames)
    .filter(
      ([id]) => id !== 'notifications' && !icons.some((icon) => icon.id === id),
    )
    .map(([id, title]) => ({
      id,
      title,
      group: metrics.includes(id) ? '硬件指标' : '文字与数据',
    })),
  ...icons,
];
export function SystemCatalog({
  general,
  combined,
}: {
  general: ReactNode;
  combined: ReactNode;
}) {
  const m = useModel(),
    [revision, setRevision] = useState(0);
  const query = m.values['prototype:catalog:query'] || '';
  const filter = m.values['prototype:catalog:filter'] || 'all';
  const setQuery = (value: string) => m.set('prototype:catalog:query', value);
  const setFilter = (value: string) => m.set('prototype:catalog:filter', value);
  const found = directory
    .filter((icon) =>
      (icon.title + ' ' + icon.id)
        .toLowerCase()
        .includes(query.toLowerCase().trim()),
    )
    .filter(
      (icon) =>
        filter === 'all' ||
        (filter === 'metrics'
          ? metrics.includes(icon.id)
          : filter === 'observed'
            ? observed.has(icon.id)
            : !observed.has(icon.id) && !metrics.includes(icon.id)),
    );
  const open = (id: string) => {
    m.set('prototype:placement:focus', id);
    if (metrics.includes(id)) {
      m.set('prototype:metric:focus', id);
      m.go('status_metrics');
    } else
      m.go(
        id === 'connectivity' ? 'status_battery' : placementRoute(m.values, id),
      );
  };
  return (
    <>
      <Card className="sw-catalog" label="系统图标设置">
        <NativeFold title="通用设置">{general}</NativeFold>
        <NativeFold title="三合一图标">{combined}</NativeFold>
        <NativeFold
          title="系统图标目录"
          help="集中搜索、筛选和配置系统图标与硬件指标。此目录使用示例数据，未扫描当前手机。"
        >
          <Card className="sw-directory-tools">
            <div className="sw-directory-heading">
              <strong>示例目录 · {directory.length} 项</strong>
              <button
                className="sw-icon-button"
                aria-label="重新检索（演示）"
                onClick={() => {
                  setRevision(revision + 1);
                  m.tell('示例目录已重新载入，现有配置保留');
                }}
              >
                <RefreshCw size={18} />
              </button>
            </div>
            <output className="c-native-note">
              非本机扫描
              {revision ? ` · 已刷新 ${revision} 次` : ''}
            </output>
            <label className="sw-search">
              <Search size={18} />
              <input
                type="search"
                aria-label="搜索系统图标"
                placeholder="搜索名称或标识，如蓝牙、电流"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
              />
            </label>
            <div className="c-tabs sw-filters" aria-label="目录筛选">
              {[
                ['all', '全部'],
                ['observed', '已发现'],
                ['dormant', '暂未出现'],
                ['metrics', '硬件指标'],
              ].map(([id, title]) => (
                <button
                  key={id}
                  aria-pressed={filter === id}
                  onClick={() => setFilter(id)}
                >
                  {title}
                </button>
              ))}
            </div>
          </Card>
          <div className="sw-result-heading">
            <span>{filter === 'metrics' ? '硬件指标' : '图标与子元素'}</span>
            <small>{found.length} 项</small>
          </div>
          <Card className="sw-directory-list">
            {found.map((icon) => {
              const metric = metrics.includes(icon.id);
              const unavailable = icon.id === 'gpu';
              const reason = hiddenReason(
                m.values,
                m.values['prototype:status:surface'] || 'all',
                icon.id,
              );
              return (
                <button
                  key={icon.id}
                  className="sd-icon-row"
                  onClick={() => open(icon.id)}
                  {...identity('runtime-icon:' + icon.id, icon.title)}
                >
                  {metric ? <Activity size={22} /> : <IconGlyph id={icon.id} />}
                  <span>
                    <strong>{icon.title}</strong>
                    <small>
                      {unavailable
                        ? '示例：未找到温度读数 · 配置保留'
                        : managedByConnectivity(m.values, icon.id)
                          ? '由三合一显示 · 原配置保留'
                          : metric
                            ? '硬件读数 · 示例'
                            : observed.has(icon.id)
                              ? '已发现 · 示例'
                              : '暂未出现 · 可预配置'}
                      {reason ? ' · 已隐藏' : ''}
                    </small>
                  </span>
                  <ChevronRight size={16} />
                </button>
              );
            })}
            {!found.length && (
              <p className="c-native-note">没有匹配项，试试名称或系统标识。</p>
            )}
          </Card>
          <Card>
            <NativeFold title="未识别图标如何处理">
              <p className="c-native-note">
                手机端发现新的系统标识时追加到目录，保留原始名称。只有确认独立边界与绘制能力后才开放大小、间距和移动；未识别结构继续原生显示，不提供无效开关。
              </p>
            </NativeFold>
          </Card>
        </NativeFold>
      </Card>
    </>
  );
}

export function NotificationPosition() {
  return (
    <Card>
      <NativeFold
        title="通知区域位置与顺序"
        help="以整个通知区域为单位调整左、中、右位置及顺序；应用通知内部排序继续跟随系统。"
      >
        <PlacementEditor id="notifications" />
      </NativeFold>
    </Card>
  );
}
export function IndividualSize({ id }: { id: string }) {
  const m = useModel();
  const child = id.includes('.');
  const key =
    id in componentNames
      ? 'status:' + id + ':size'
      : 'prototype:icon-size:' + id;
  return !child && id !== 'connectivity' && hasBoundary(id) ? (
    <Card>
      <NativeFold
        title="图标大小"
        help="原型新增的逐图标尺寸。手机端仅对具有独立布局边界的图标开放；子元素跟随所属图标。"
      >
        <Range
          name={key}
          title="图标大小"
          min={6}
          max={32}
          initial={Number(m.values['status:system_icons:size'] || 13)}
          suffix=" dp"
        />
        <Button secondary onClick={() => m.set(key, '')}>
          恢复默认大小
        </Button>
      </NativeFold>
    </Card>
  ) : null;
}
