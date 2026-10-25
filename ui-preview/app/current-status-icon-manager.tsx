'use client';
import { useState, type ReactNode } from 'react';
import {
  Wifi,
  Signal,
  Bluetooth,
  BatteryFull,
  Bell,
  Shield,
  Fan,
  Circle,
  ChevronRight,
} from 'lucide-react';
import icons from './current-status-icons.json';
import { PlacementEditor } from './current-status-placement-editor';
import {
  Button,
  Card,
  CurrentContext,
  Range,
  useModel,
  identity,
} from './current-ui';
import { NativeFold, NativeSelect } from './current-native-controls';
import {
  hasBoundary,
  hiddenReason,
  resolveSpacing,
  spacingAxes,
  spacingKey,
  spacingMode,
  spacingModeKey,
  surfaceKey,
  visibilityKey,
  visibilityMode,
  connectivityCoverage,
  managedByConnectivity,
} from './current-status-policy';

export const surfaces: [string, string][] = [
  ['all', '共享方案'],
  ['status', '桌面／应用'],
  ['keyguard', '锁屏'],
  ['notification', '通知中心'],
  ['control', '控制中心'],
];
export function ScopePicker() {
  return (
    <NativeSelect
      name={surfaceKey}
      title="显示位置"
      choices={surfaces}
      initial="all"
    />
  );
}
export function IconGlyph({ id, size = 22 }: { id: string; size?: number }) {
  const Icon = id.includes('wifi')
    ? Wifi
    : id.includes('mobile') || id === 'dual_signal'
      ? Signal
      : id.includes('bluetooth')
        ? Bluetooth
        : id.includes('battery') || id === 'connectivity'
          ? BatteryFull
          : id.includes('fan') || id === 'liquid_cooling'
            ? Fan
            : id.includes('privacy') || id === 'vpn'
              ? Shield
              : ['alarm_clock', 'zen', 'notifications'].includes(id)
                ? Bell
                : Circle;
  return <Icon size={size} aria-hidden="true" />;
}
export function SpacingEditor({
  id,
  title = '图标间距',
  showScope = true,
}: {
  id: string;
  title?: string;
  showScope?: boolean;
}) {
  const m = useModel(),
    scope = m.values[surfaceKey] || 'all';
  const mode = spacingMode(m.values, scope, id),
    edge = resolveSpacing(m.values, scope, id);
  const gapX = Math.max(0, 10 + edge[0] + edge[2]),
    gapY = Math.max(0, 8 + edge[1] + edge[3]);
  const limited =
    gapX !== 10 + edge[0] + edge[2] || gapY !== 8 + edge[1] + edge[3];
  const localValues = {
    ...m.values,
    [spacingModeKey(scope, id)]: mode,
    ...Object.fromEntries(
      spacingAxes.map((a, i) => [spacingKey(scope, id, a), String(edge[i])]),
    ),
  };
  const edit = (key: string, value: string) => {
    if (key === spacingModeKey(scope, id) && value === 'custom')
      spacingAxes.forEach((a, i) =>
        m.set(
          spacingKey(scope, id, a),
          m.values[spacingKey(scope, id, a)] ?? String(edge[i]),
        ),
      );
    m.set(key, value);
  };
  return (
    <NativeFold title={title}>
      {showScope && <ScopePicker />}
      <CurrentContext.Provider value={{ ...m, values: localValues, set: edit }}>
        <NativeSelect
          name={spacingModeKey(scope, id)}
          title="间距规则"
          choices={[
            [
              'inherit',
              scope === 'all'
                ? id === 'system-default' || id === 'notifications'
                  ? '遵循原厂'
                  : '继承系统图标默认间距'
                : '继承共享方案',
            ],
            ['custom', '单独调整'],
            ['native', '使用原厂间距'],
          ]}
        />
        <div
          className="sd-spacing-sample"
          aria-label="图标间距示例"
          data-horizontal-gap={gapX}
          data-row-gap={gapY}
          style={{ rowGap: gapY }}
        >
          {[0, 1].map((row) => (
            <div key={row} style={{ gap: gapX }}>
              {[0, 1, 2].map((index) => (
                <IconGlyph
                  key={index}
                  id={
                    id === 'system-default'
                      ? ['wifi', 'bluetooth', 'alarm_clock'][index]
                      : id
                  }
                />
              ))}
            </div>
          ))}
        </div>
        <p className="c-native-note" role="status">
          示例水平距离 {gapX} dp · 上下距离 {gapY} dp
          {limited ? '；已达到示例防重叠边界，保存值保留。' : '。'}
        </p>
        {mode === 'custom' &&
          spacingAxes.map((axis, i) => (
            <Range
              key={axis}
              name={spacingKey(scope, id, axis)}
              title={
                ['起始间距', '顶部间距', '末尾间距', '底部间距'][i] + '（dp）'
              }
              min={-12}
              max={24}
            />
          ))}
        <p className="c-native-note">
          负值更紧凑，0 沿用原厂，正值增加距离。起始与末尾随文字方向镜像。范围
          −12～24 dp 为原型试调；手机端的负值与防重叠规则待实现。
        </p>
        <div className="sd-actions">
          <Button
            secondary
            onClick={() => m.set(spacingModeKey(scope, id), 'inherit')}
          >
            {scope === 'all' ? '恢复默认间距' : '恢复继承'}
          </Button>
          <Button
            secondary
            onClick={() => m.set(spacingModeKey(scope, id), 'native')}
          >
            使用原厂间距
          </Button>
        </div>
      </CurrentContext.Provider>
    </NativeFold>
  );
}
function DirectoryRow({ id }: { id: string }) {
  const m = useModel(),
    icon = icons.find((i) => i.id === id)!;
  const children = icons.filter(
    (i) => i.id.startsWith(id + '.') && !managedByConnectivity(m.values, i.id),
  );
  const reason = hiddenReason(m.values, m.values[surfaceKey] || 'all', id);
  return (
    <button
      className="sd-icon-row"
      {...identity('route:status_icon/' + id, icon.title)}
      onClick={() => m.go('status_icon/' + id)}
    >
      <IconGlyph id={id} />
      <span>
        <strong>{icon.title}</strong>
        <small>
          {reason || '遵循系统显示条件'}
          {children.length ? ` · ${children.length} 个子元素` : ''}
        </small>
      </span>
      <ChevronRight size={16} />
    </button>
  );
}
export function IconDirectory({
  general,
  editors,
}: {
  general?: ReactNode;
  editors?: ReactNode;
}) {
  const m = useModel();
  const [query, setQuery] = useState('');
  const available = icons.filter(
    (i) => i.id !== 'connectivity' && !managedByConnectivity(m.values, i.id),
  );
  const coverage = connectivityCoverage(m.values);
  const roots = available.filter(
    (i) => !available.some((parent) => i.id.startsWith(parent.id + '.')),
  );
  const categories = [...new Set(roots.map((i) => i.group))];
  const found = available.filter((i) =>
    (i.title + ' ' + i.id).toLowerCase().includes(query.trim().toLowerCase()),
  );
  return (
    <>
      {general}
      {editors}
      <Card>
        <ScopePicker />
        <label
          className="sd-search"
          {...identity('status-icon-search', '搜索系统图标')}
        >
          <span>搜索图标或子元素</span>
          <input
            type="search"
            aria-label="搜索系统图标"
            placeholder="例如：闹钟、漫游、风扇"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
        </label>
        <p className="c-native-note">
          当前可配置 {available.length}{' '}
          个图标及子元素。图标仅在系统原本满足显示条件时出现。
        </p>
        {coverage.active && (
          <>
            <p className="c-native-note" role="status">
              三合一已接管：
              {[...coverage.owners]
                .filter((id) => !['mobile_data', 'dual_signal'].includes(id))
                .map((id) =>
                  id === 'battery_text'
                    ? '电量文字'
                    : icons.find((i) => i.id === id)?.title || id,
                )
                .join('、')}
              。对应项目已从本目录收起，原配置保留；修改三合一内容或关闭后自动恢复。
            </p>
            {coverage.contents.some((c) => c === 'data' || c === 'other') && (
              <p className="c-native-note">
                当前示例上网卡：卡{' '}
                {m.values['prototype:connectivity-data-slot'] || '1'}
                ；手机端应跟随实际上网卡变化。
              </p>
            )}
            <Button secondary onClick={() => m.go('status_battery')}>
              调整三合一显示内容
            </Button>
          </>
        )}
      </Card>
      {query.trim() ? (
        <Card>
          <p className="c-native-note">找到 {found.length} 项</p>
          {!found.length && (
            <p className="c-native-note">
              没有匹配的可配置图标；已由三合一接管的项目在三合一图标中调整。
            </p>
          )}
          {found.map((i) => (
            <DirectoryRow key={i.id} id={i.id} />
          ))}
        </Card>
      ) : (
        categories.map((group) => (
          <Card key={group}>
            <NativeFold title={group}>
              {roots
                .filter((i) => i.group === group)
                .map((i) => (
                  <DirectoryRow key={i.id} id={i.id} />
                ))}
            </NativeFold>
          </Card>
        ))
      )}
    </>
  );
}
export function IconVisibility({ id }: { id: string }) {
  const m = useModel(),
    scope = m.values[surfaceKey] || 'all',
    mode = visibilityMode(m.values, scope, id);
  const reason = hiddenReason(m.values, scope, id);
  return (
    <>
      <ScopePicker />
      <CurrentContext.Provider
        value={{
          ...m,
          values: { ...m.values, [visibilityKey(scope, id)]: mode },
        }}
      >
        <NativeSelect
          name={visibilityKey(scope, id)}
          title="显示规则"
          choices={[
            ['inherit', scope === 'all' ? '遵循原厂' : '继承共享方案'],
            ['hide', '额外隐藏'],
            ['native', '遵循原厂显示条件'],
          ]}
          help="只能额外隐藏，不强制显示当前没有活动状态的图标。具体位置可继承共享规则或恢复原厂显示条件。"
        />
      </CurrentContext.Provider>
      <p className="c-native-note" role="status">
        {reason || '当前规则允许显示；实际出现仍取决于连接、服务和系统状态。'}
      </p>
      {reason && mode !== 'hide' && (
        <Button
          secondary
          onClick={() => {
            if (reason.includes('共享')) m.set(surfaceKey, 'all');
            else if (reason.includes('所属'))
              m.go('status_icon/' + id.split('.')[0]);
            else
              m.go(
                reason.includes('网络') ? 'status_network' : 'status_behavior',
              );
          }}
        >
          查看影响显示的规则
        </Button>
      )}
    </>
  );
}
export function IconDetails({
  id,
  settings,
}: {
  id: string;
  settings?: ReactNode;
}) {
  const m = useModel(),
    icon = icons.find((i) => i.id === id)!;
  const scope = m.values[surfaceKey] || 'all';
  const children = icons.filter((i) => i.id.startsWith(id + '.'));
  const target =
    id === 'battery' || id.startsWith('battery.') || id === 'connectivity'
      ? 'status_native_battery'
      : id.includes('wifi') ||
          id.startsWith('mobile') ||
          id === 'dual_signal' ||
          id === 'hotspot'
        ? 'status_network'
        : '';
  const restore = () =>
    m.dialog(
      '恢复' + icon.title + '的显示与间距',
      <>
        <p>只恢复当前显示位置的显示规则与间距。素材、字体及其他图标保留。</p>
        <footer>
          <button onClick={m.close}>取消</button>
          <button
            onClick={() => {
              m.set(visibilityKey(scope, id), 'inherit');
              m.set(spacingModeKey(scope, id), 'inherit');
              m.close();
            }}
          >
            恢复
          </button>
        </footer>
      </>,
    );
  return (
    <>
      <Card>
        <IconVisibility id={id} />
        {managedByConnectivity(m.values, id) && (
          <p className="c-native-note">
            此元素由三合一展示。这里与三合一页面共用显示和边距配置；独立样式在解除接管后恢复。
          </p>
        )}
      </Card>
      <Card>
        <NativeFold title="位置与顺序">
          <PlacementEditor id={id} />
        </NativeFold>
        {hasBoundary(id) ? (
          <SpacingEditor id={id} showScope={false} />
        ) : (
          <NativeFold title="图标间距">
            <p className="c-native-note">
              此对象没有独立的布局边界，跟随所属图标。素材内部偏移可在素材编辑器调整。
            </p>
            {id.includes('.') && !id.startsWith('privacy.') && (
              <Button onClick={() => m.go('status_icon/' + id.split('.')[0])}>
                调整所属图标间距
              </Button>
            )}
          </NativeFold>
        )}
        {id === 'bluetooth' && (
          <NativeFold title="蓝牙样式">
            <NativeSelect
              name="ls_augment_statusbar_bluetooth_style"
              title="蓝牙图标样式"
              choices={['原厂', '圆角方形', '圆形']}
            />
            <div className="sd-style-sample">
              <span
                data-style={
                  m.values.ls_augment_statusbar_bluetooth_style || '0'
                }
              >
                <IconGlyph id="bluetooth" size={16} />
                68%
              </span>
              <small>连接设备时的样式示例</small>
            </div>
          </NativeFold>
        )}
        {id === 'vpn' && (
          <NativeFold title="VPN 样式">
            <NativeSelect
              name="ls_augment_statusbar_vpn_style"
              title="VPN 图标样式"
              choices={['原厂', '自定义']}
            />
            <div className="sd-style-sample">
              <IconGlyph id="vpn" />
              {m.values.ls_augment_statusbar_vpn_style === '1' ? 'VPN' : '原厂'}
              <small>样式示例</small>
            </div>
          </NativeFold>
        )}
        {settings}
      </Card>
      {children.length > 0 && (
        <Card>
          <NativeFold title="子元素">
            {children.map((child) => (
              <DirectoryRow key={child.id} id={child.id} />
            ))}
          </NativeFold>
        </Card>
      )}
      <Card>
        {target && (
          <Button secondary onClick={() => m.go(target)}>
            打开
            {target === 'status_native_battery' ? '原生电池图标' : '网速与网络'}
            设置
          </Button>
        )}
        <Button
          onClick={() => {
            m.set('prototype:asset-surface', scope);
            m.go('asset/' + id);
          }}
        >
          编辑此图标素材
        </Button>
        <p className="c-native-note">
          {icon.states.length} 种状态 · 整图／背景／前景；素材编辑保留草稿保护。
        </p>
        <Button secondary onClick={restore}>
          恢复此图标显示与间距
        </Button>
      </Card>
    </>
  );
}
