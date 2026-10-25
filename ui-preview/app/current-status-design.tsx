/* eslint-disable nextjs/no-img-element -- User-selected images are local prototype data URLs. */
'use client';
import { useRef, useState, type ReactNode } from 'react';
import {
  ChevronRight,
  Clock,
  Wifi,
  BatteryFull,
  Shield,
  Activity,
  LayoutGrid,
  Hand,
  Bell,
  Palette,
} from 'lucide-react';
import {
  Card,
  Toggle,
  Range,
  Field,
  Button,
  CurrentContext,
  useModel,
  identity,
  type Option,
} from './current-ui';
import { NativeFold, NativeSelect } from './current-native-controls';
import { OptionInput } from './current-feature-input';
import { CurrentStatusPreview } from './current-status-preview';
import { NotificationEditor } from './current-notification-editor';
import inventory from './current-status-inventory.json';
import icons from './current-status-icons.json';
import {
  statusDesignGroups,
  statusOptionRoute,
} from './current-status-navigation';
import './current-status-design.css';
import {
  IconDirectory,
  IconDetails,
  SpacingEditor,
  IconVisibility,
} from './current-status-icon-manager';
import {
  hintIds,
  rowModeKey,
  layoutIsSingle,
  connectivityCoverage,
  managedByConnectivity,
  batchHideKey,
  batchHideEnabled,
  hasBoundary,
} from './current-status-policy';

import {
  PlacementEditor,
  PlacementList,
} from './current-status-placement-editor';
import { placementRoute } from './current-status-placement';
import {
  layoutBackupKey,
  layoutSnapshot,
  restoreLayoutChanges,
  resetEditorChanges,
  arrangeIndividualChanges,
} from './current-status-recovery';
import { ClockFormatHelp } from './current-clock-format-help';

const k = (name: string) => 'ls_augment_statusbar_' + name;
const rm = (name: string) => 'ls_augment_rm_' + name;
const componentIds = [
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
const componentTitles = [
  '时钟',
  '通知图标',
  '系统图标',
  '电池图标',
  'CPU 温度',
  'GPU 温度',
  '电池温度',
  '电流',
  '功率',
  '网速',
];
const zoneCodes = ['L1', 'L2', 'LS', 'C1', 'C2', 'CS', 'R1', 'R2', 'RS'];
const item = (id: string, field: string) => `status:${id}:${field}`;
const nativeOptions = inventory as Option[];
const optionByKey = Object.fromEntries(
  nativeOptions.map((option) => [option.key, option]),
);
const branchKeys: Record<string, string[]> = {
  [rm('signal_dual')]: [rm('signal_dual_style')],
  [rm('clock_milliseconds_refresh')]: [rm('clock_refresh_ms')],
  [rm('network_custom')]: nativeOptions
    .filter((o) =>
      /network_(hide_below|digits|unit|per_second|width)/.test(o.key),
    )
    .map((o) => o.key),
  [rm('metrics_custom')]: nativeOptions
    .filter((o) =>
      /metrics_(hide_units|charging_only)|metric_(prefix|width)/.test(o.key),
    )
    .map((o) => o.key),
  [rm('battery_colors')]: nativeOptions
    .filter((o) => /battery_color_\d|battery_charging_color/.test(o.key))
    .map((o) => o.key),
  [rm('battery_text_colors')]: nativeOptions
    .filter((o) =>
      /battery_text_color_\d|battery_text_charging_color/.test(o.key),
    )
    .map((o) => o.key),
  [k('hint_priority')]: [k('hint_limit'), k('hint_order')],
};
const childKeys = new Set(Object.values(branchKeys).flat());
const routeIcons: Record<string, typeof Clock> = {
  status_arrangement: LayoutGrid,
  status_behavior: Hand,
  status_clock: Clock,
  status_network: Wifi,
  status_battery: BatteryFull,
  status_icons: Shield,
  status_metrics: Activity,
  status_notifications: Bell,
  status_assets: Palette,
};

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="d-application-section">
      <h3 className="c-group">{title}</h3>
      {children}
    </section>
  );
}
function Entry({
  route,
  title,
  summary,
}: {
  route: string;
  title: string;
  summary: string;
}) {
  const m = useModel(),
    Icon = routeIcons[route] || LayoutGrid;
  return (
    <button
      className="d-preference-link"
      aria-label={title}
      onClick={() => m.go(route)}
      {...identity('route:' + route, title)}
    >
      <span className="d-preference-line">
        <span className="c-setting-icon">
          <Icon size={22} />
        </span>
        <span className="d-preference-copy">
          <strong>{title}</strong>
          <small>{summary}</small>
        </span>
        <ChevronRight size={18} />
      </span>
    </button>
  );
}
function Num({
  name,
  title,
  min,
  max,
  initial = 0,
  step = 1,
}: {
  name: string;
  title: string;
  min: number;
  max: number;
  initial?: number;
  step?: number;
}) {
  return (
    <Range
      name={name}
      title={title}
      min={min}
      max={max}
      initial={initial}
      step={step}
    />
  );
}
function Choice({
  name,
  title,
  choices,
  initial = '0',
}: {
  name: string;
  title: string;
  choices: string[] | string[][];
  initial?: string;
}) {
  return (
    <NativeSelect
      name={name}
      title={title}
      choices={choices as string[] | [string, string][]}
      initial={initial}
    />
  );
}

function PriorityOrder() {
  const m = useModel();
  const all = hintIds;
  const order = [
    ...new Set([
      ...(m.values[k('hint_order')] || '')
        .split(',')
        .filter((id) => all.includes(id)),
      ...all,
    ]),
  ];
  return (
    <div className="sd-order-list" aria-label="系统提示保留顺序">
      <Button
        secondary
        onClick={() => {
          m.set(k('hint_order'), '');
          m.set(k('hint_limit'), '0');
          m.tell('已恢复默认优先级与数量');
        }}
      >
        恢复默认优先级与数量
      </Button>
      {order.map((id, index) => (
        <div key={id}>
          <span>{icons.find((icon) => icon.id === id)?.title || id}</span>
          <button
            disabled={index === 0}
            aria-label={
              (icons.find((icon) => icon.id === id)?.title || id) + '提高优先级'
            }
            onClick={() => {
              const next = [...order];
              [next[index - 1], next[index]] = [next[index], next[index - 1]];
              m.set(k('hint_order'), next.join(','));
            }}
          >
            上移
          </button>
          <button
            disabled={index === order.length - 1}
            aria-label={
              (icons.find((icon) => icon.id === id)?.title || id) + '降低优先级'
            }
            onClick={() => {
              const next = [...order];
              [next[index + 1], next[index]] = [next[index], next[index + 1]];
              m.set(k('hint_order'), next.join(','));
            }}
          >
            下移
          </button>
        </div>
      ))}
    </div>
  );
}
function NativeOption({ option }: { option: Option }) {
  const m = useModel(),
    imageRequest = useRef(0);
  if (option.key === k('icon_spacing_v1'))
    return <SpacingEditor id="system-default" title="系统图标默认间距" />;
  if (option.key === k('hint_order')) return <PriorityOrder />;
  if (option.key === rm('hidden_icon_slots'))
    return (
      <NativeFold title="其他隐藏图标">
        <OptionInput option={option} />
      </NativeFold>
    );
  if (option.key === 'ls_augment_notification_summary_asset')
    return (
      <label className="c-button c-upload">
        选择汇总图片
        <input
          type="file"
          accept="image/png,image/jpeg,image/webp,image/gif"
          aria-label="选择汇总图片"
          onChange={(e) => {
            const file = e.target.files?.[0];
            e.target.value = '';
            if (!file) return;
            const request = ++imageRequest.current;
            const fail = (message: string) => {
              if (request === imageRequest.current) m.tell(message);
            };
            if (file.size > 2 * 1024 * 1024) {
              fail('原型图片请控制在 2 MiB 以内，已保留原图片。');
              return;
            }
            const reader = new FileReader();
            reader.onerror = () =>
              fail('读取图片失败，已保留原图片，请重新选择。');
            reader.onload = async () => {
              if (typeof reader.result !== 'string') {
                fail('读取图片失败，已保留原图片，请重新选择。');
                return;
              }
              const source = reader.result;
              try {
                const image = new Image();
                image.src = source;
                await image.decode();
                if (!image.naturalWidth || !image.naturalHeight)
                  throw new Error('Empty image');
                if (request === imageRequest.current) m.set(option.key, source);
              } catch {
                fail(
                  '图片无法解码，已保留原图片。请选择有效的 PNG、JPEG、WebP 或 GIF 图片。',
                );
              }
            };
            reader.readAsDataURL(file);
          }}
        />
      </label>
    );
  const children = branchKeys[option.key];
  if (children)
    return (
      <Toggle
        name={option.key}
        title={option.title}
        initial={option.defaultValue}
        disabled={
          m.values[k('position_size_only')] === '1' &&
          [
            rm('network_custom'),
            rm('metrics_custom'),
            rm('clock_milliseconds_refresh'),
          ].includes(option.key)
        }
        help={option.help}
        beforeEnable={
          option.key === rm('signal_dual')
            ? () => {
                if (
                  connectivityCoverage(m.values).active &&
                  connectivityCoverage(m.values).contents.some((c) =>
                    ['dual', 'data', 'other'].includes(c),
                  )
                ) {
                  m.tell(
                    '请先在三合一中移除信号内容或关闭三合一，再开启双排信号',
                  );
                  return false;
                }
                return true;
              }
            : undefined
        }
      >
        {children.map((key) => (
          <NativeOption key={key} option={optionByKey[key]} />
        ))}
      </Toggle>
    );
  return <OptionInput option={option} />;
}
function NativeOptions({
  route,
  except = [],
}: {
  route: string;
  except?: string[];
}) {
  return (
    <>
      {nativeOptions
        .filter(
          (option) =>
            statusOptionRoute(option.key) === route &&
            !childKeys.has(option.key) &&
            !except.includes(option.key),
        )
        .map((option) => (
          <NativeOption key={option.key} option={option} />
        ))}
    </>
  );
}

function Summary() {
  const m = useModel(),
    base = 'ls_augment_notification_summary_',
    mode = m.values[base + 'mode'] || '0',
    asset = m.values[base + 'asset'] || '',
    [failedAsset, setFailedAsset] = useState('');
  const imageFailed = !!asset && failedAsset === asset;
  return (
    <Toggle
      name={base + 'enabled'}
      title="通知汇总"
      help="有通知时用符号、短文字或图片代替通知图标；无通知时消失。只影响桌面与应用顶部，原通知保留。图片不可用时恢复通知图标，关闭功能后保留已选样式与内容。"
    >
      <Choice
        name={base + 'mode'}
        title="汇总样式"
        choices={['符号', '文字', '图片']}
      />
      {mode === '0' && (
        <Field name={base + 'symbol'} title="符号" initial="♥" maxLength={12} />
      )}
      {mode === '1' && (
        <Field
          name={base + 'text'}
          title="短文字"
          help="最多 12 个字符；空间不足时显示省略号，保存的完整文字保留。"
          initial="有新通知"
          maxLength={12}
        />
      )}
      {mode === '2' && <NativeOption option={optionByKey[base + 'asset']} />}
      <Range
        name={base + 'size'}
        title="内容大小（dp）"
        help="调整符号、文字或图片的显示大小，范围为 8～40 dp；实际显示受状态栏高度与可用宽度限制，不改变通知图标大小。"
        min={8}
        max={40}
        initial={18}
      />
      <div
        className="sd-summary-sample"
        aria-label="通知汇总示例"
        style={{ fontSize: Number(m.values[base + 'size'] || 18) }}
      >
        {mode === '2' ? (
          asset && !imageFailed ? (
            <img
              key={asset}
              src={asset}
              alt="汇总图片示例"
              onError={() => setFailedAsset(asset)}
              style={{
                width: Number(m.values[base + 'size'] || 18),
                height: Number(m.values[base + 'size'] || 18),
              }}
            />
          ) : (
            <span className="sd-summary-content c-native-note">
              {imageFailed ? '图片不可用，将显示原通知图标' : '尚未选择图片'}
            </span>
          )
        ) : (
          <span
            className="sd-summary-content"
            title={
              mode === '1'
                ? m.values[base + 'text'] || '有新通知'
                : m.values[base + 'symbol'] || '♥'
            }
          >
            {mode === '1'
              ? m.values[base + 'text'] || '有新通知'
              : m.values[base + 'symbol'] || '♥'}
          </span>
        )}
        <small>有通知时的示例</small>
      </div>
      {mode === '2' && imageFailed && (
        <output className="c-native-note">
          已保存的图片无法显示，通知区域将恢复原通知图标。原图片数据保留，请重新选择有效图片。
        </output>
      )}
    </Toggle>
  );
}

function Overview() {
  return (
    <div className="sd-page sd-overview">
      {statusDesignGroups.map((group, index) => (
        <Section title={group.title} key={group.title}>
          <Card className="d-preference-group" label={group.title}>
            {index === 0 && (
              <Toggle
                name="ls_augment_systemui_master"
                title="启用状态栏自定义"
                help="控制状态栏布局与组件配置，关闭保留参数；独立的原生功能遵循各自开关。"
              />
            )}
            {group.entries.map((entry) => (
              <Entry key={entry.route} {...entry} />
            ))}
          </Card>
        </Section>
      ))}
    </div>
  );
}
function ComponentSize({
  id,
  circle = false,
}: {
  id: string;
  circle?: boolean;
}) {
  const m = useModel(),
    at = componentIds.indexOf(id);
  const title = circle ? '三合一大小' : componentTitles[at] + '大小';
  const name = circle ? k('connectivity_size_dp') : item(id, 'size');
  const initial = circle ? 26 : at < 4 ? 13 : 9;
  return (
    <NativeFold
      title={title}
      help="调整当前对象的显示大小；整体位置、排列顺序与组件之间的距离在状态栏布局中统一设置。"
    >
      <Range
        name={name}
        title={title + '（dp）'}
        min={circle ? 18 : 6}
        max={circle ? 40 : 32}
        initial={initial}
      />
      <Button secondary onClick={() => m.set(name, String(initial))}>
        恢复{title}
      </Button>
    </NativeFold>
  );
}
function LayoutPositions() {
  const m = useModel();
  return (
    <Section title="图标位置与顺序">
      <Card>
        <NativeFold
          title="通知图标位置与顺序"
          help="通知作为整体移动和排序，内部应用顺序遵循系统。"
        >
          <PlacementEditor id="notifications" />
        </NativeFold>
        <NativeFold
          title="系统图标位置与顺序"
          help="逐个配置系统图标的位置和顺序；通知作为一个整体，可与系统图标一起排序。"
        >
          <PlacementList />
        </NativeFold>
        <NativeFold
          title="整理系统图标位置"
          help="整理各系统图标与时钟、电池、网速和指标；保留通知位置、各项大小与显隐。可恢复方案前。"
        >
          <Button
            onClick={() => {
              m.set(layoutBackupKey, layoutSnapshot(m.values));
              Object.entries(arrangeIndividualChanges(m.values)).forEach(
                ([key, value]) => m.set(key, value),
              );
              m.tell('已整理系统图标，通知位置保留');
            }}
          >
            自动排列系统图标
          </Button>
        </NativeFold>
      </Card>
    </Section>
  );
}
function RowRule({ title }: { title: string }) {
  const m = useModel(),
    single = layoutIsSingle(m.values),
    paused = m.values[k('position_size_only')] === '1';
  return (
    <p className="c-native-note">
      {paused
        ? '仅调整位置和大小已开启：自定义内容、系统／通知双排和三合一暂停，保留配置；双排信号独立。'
        : single
          ? '整栏当前为单排：本对象的双排设置暂不参与显示，切回双排自动恢复。'
          : title === '系统图标分两排'
            ? '默认双排只安排未单独指定行位置的图标；单项行位置优先。整栏切回单排时暂停双排显示，原配置保留。'
            : title +
              '只控制对象内部排版；双排时使用所在侧的两行，行间距沿用状态栏布局。'}
    </p>
  );
}
function Component({ id, children }: { id: string; children?: ReactNode }) {
  const m = useModel(),
    paused =
      m.values[k('position_size_only')] === '1' &&
      ['cpu', 'gpu', 'battery_temp', 'current', 'power'].includes(id);
  return (
    <Toggle
      name={item(id, 'on')}
      title={'显示' + componentTitles[componentIds.indexOf(id)]}
      initial={componentIds.indexOf(id) < 4 ? '1' : '0'}
      disabled={paused}
      help="关闭后保留位置、大小和显示参数。"
    >
      <ComponentSize id={id} />
      {id !== 'system_icons' && (
        <NativeFold title="位置与顺序">
          <PlacementEditor id={id} />
        </NativeFold>
      )}
      {children}
    </Toggle>
  );
}
function Preview() {
  const m = useModel();
  return (
    <div className="sd-preview">
      <small>布局示例 · 点击对象打开对应设置</small>
      <CurrentStatusPreview
        individual
        values={m.values}
        onSelect={(id) => m.go(placementRoute(m.values, id))}
      />
      {Number(m.values[k('dual_row_gap_dp')] || 0) < 0 && (
        <p className="c-native-note">
          已保存负行间距；示例上下行共享横向空间，当前按 0 dp 防止重叠。
        </p>
      )}
      <p className="c-native-note">
        示例空间不足时会等比例缩小；实际挖孔、字号与可用空间需在手机端核验。
      </p>
    </div>
  );
}
const arrangedZones = [0, 0, 6, 8, 1, 1, 1, 7, 7, 7];
function Arrangement() {
  const m = useModel(),
    [draft, setDraft] = useState<Record<string, string> | null>(null),
    [preset, setPreset] = useState('');
  const presetChanges = (index: number) => {
    const changes: Record<string, string> = {
      ls_augment_systemui_master: '1',
      [k('position_size_only')]: '0',
      [rowModeKey]: index === 0 ? '1' : '2',
      [rm('signal_dual')]: '0',
      [rm('statusbar_hide')]: '0',
      [k('native_battery_enabled')]: '0',
      [k('clock_rows')]: index === 1 ? '2' : '1',
      [k('clock_custom')]: index ? '1' : '0',
      [k('clock_pattern')]: 'HH:mm',
      [k('clock_pattern_second')]: index === 1 ? 'MM/dd E' : '',
      [k('connectivity_group')]: index ? '1' : '0',
      [k('connectivity_size_dp')]: '26',
      [k('notification_hide')]: '0',
      [k('notification_two_rows')]: '0',
      [k('system_two_rows')]: '0',
      [k('network_display')]: '3',
      [k('dual_row_gap_dp')]: '2',
    };
    if (index === 0) {
      changes[k('bluetooth_style')] = '0';
      changes[k('vpn_style')] = '0';
    }
    [
      'height_dp',
      'left_margin_dp',
      'right_margin_dp',
      'top_margin_dp',
      'bottom_margin_dp',
      'clock_size_sp',
      'clock_width_dp',
    ].forEach((name) => (changes[k(name)] = '0'));
    componentIds.forEach((id, at) => {
      changes[item(id, 'on')] =
        at < 4 || index === 2 || (index === 1 && id === 'network') ? '1' : '0';
      changes[item(id, 'zone')] = String(
        index === 0
          ? at < 2
            ? 2
            : 8
          : id === 'clock' && index === 1
            ? 2
            : arrangedZones[at],
      );
      changes[item(id, 'size')] = String(at < 4 ? 11 : 9);
      changes[item(id, 'order')] = String(
        [0, 10, 0, 90, 20, 30, 40, 10, 20, 30][at],
      );
    });
    for (const name of Object.keys(m.values)) {
      if (name.startsWith('prototype:icon-position:')) changes[name] = '';
    }
    return changes;
  };
  const apply = () => {
    m.set(layoutBackupKey, layoutSnapshot(m.values));
    Object.entries(draft || {}).forEach(([key, value]) => m.set(key, value));
    setDraft(null);
    m.tell('已应用到网页原型');
  };
  return (
    <>
      <Section title="布局方案">
        <Card>
          <Preview />
          <div className="sd-presets">
            {['原生简洁', '双排信息', '性能监控'].map((title, index) => (
              <Button
                key={title}
                onClick={() => {
                  setPreset(title);
                  setDraft(presetChanges(index));
                }}
              >
                {title}
              </Button>
            ))}
          </div>
          {draft && (
            <div className="sd-preset-draft">
              <strong>{preset} · 预览中</strong>
              <p className="c-native-note">
                应用将替换组件位置、大小、显示开关、排数和时钟／电池样式；素材、字体文件与逐图标间距保留。
              </p>
              <CurrentStatusPreview
                individual
                values={{ ...m.values, ...draft }}
              />
              <div className="sd-actions">
                <Button secondary onClick={() => setDraft(null)}>
                  取消
                </Button>
                <Button onClick={apply}>应用此预设</Button>
              </div>
            </div>
          )}
          <Button
            secondary
            onClick={() =>
              m.dialog(
                '恢复状态栏空间',
                <>
                  <p>
                    只恢复整栏单双排、四周留白、高度和行间距；各组件位置、大小、显隐、素材和字体保留。
                  </p>
                  <footer>
                    <button onClick={m.close}>取消</button>
                    <button
                      onClick={() => {
                        m.set(rowModeKey, 'system');
                        [
                          'height_dp',
                          'left_margin_dp',
                          'right_margin_dp',
                          'top_margin_dp',
                          'bottom_margin_dp',
                          'dual_row_gap_dp',
                        ].forEach((name) => m.set(k(name), '0'));
                        m.close();
                      }}
                    >
                      恢复
                    </button>
                  </footer>
                </>,
              )
            }
          >
            恢复状态栏空间
          </Button>
          <Toggle
            name={k('position_size_only')}
            title="仅调整位置和大小"
            help="保留原生行数和字体；暂停自定义时钟、双排通知与系统图标、硬件指标及自定义网速，配置保留；双排信号仍独立控制。"
          />
        </Card>
      </Section>
      <LayoutPositions />
      <Section title="恢复与撤回">
        <RecoveryActions />
      </Section>
      <Section title="行数与留白">
        <Card>
          <fieldset
            className="sd-fieldset"
            disabled={m.values[k('position_size_only')] === '1'}
          >
            <Choice
              name={rowModeKey}
              title="状态栏布局行数"
              choices={[
                ['system', '跟随系统'],
                ['1', '单排'],
                ['2', '双排'],
              ]}
              initial="2"
            />
          </fieldset>
          <p className="c-native-note">
            整栏行数是原型新增规则。切换只影响当前排版，保留所有对象的双排配置；跟随系统在此示例中按单排显示。
          </p>
          <NativeFold title="状态栏高度与四周留白">
            {[
              ['height_dp', '状态栏高度（0 原厂，负数减小）', -32, 96],
              ['left_margin_dp', '左侧留白（dp）', 0, 64],
              ['right_margin_dp', '右侧留白（dp）', 0, 64],
              ['top_margin_dp', '顶部留白（dp）', 0, 64],
              ['bottom_margin_dp', '底部留白（dp）', 0, 64],
            ].map(([name, title, min, max]) => (
              <Num
                key={String(name)}
                name={k(String(name))}
                title={String(title)}
                min={Number(min)}
                max={Number(max)}
              />
            ))}
          </NativeFold>
          {m.values[rowModeKey] === '2' &&
            m.values[k('position_size_only')] !== '1' && (
              <NativeFold
                title="两排间距"
                help="仅在双排布局下生效。负值让两排靠近，正值拉开；切换到单排或跟随系统后保留保存值，切回双排恢复。发生碰撞时示例保留最小安全距离，保存值不变。"
              >
                <Num
                  name={k('dual_row_gap_dp')}
                  title="两排间距（dp）"
                  min={-8}
                  max={64}
                />
              </NativeFold>
            )}
        </Card>
      </Section>
    </>
  );
}

function ClockEditor() {
  const m = useModel();
  return (
    <>
      <Card>
        <Preview />
        <Component id="clock" />
        <RowRule title="时钟行数" />
        <Toggle
          name={k('clock_custom')}
          title="自定义时钟"
          disabled={m.values[k('position_size_only')] === '1'}
          help="关闭恢复原厂时钟，保留自定义格式和排版。"
        >
          <fieldset className="sd-fieldset" disabled={layoutIsSingle(m.values)}>
            <Choice
              name={k('clock_rows')}
              title="显示排数"
              choices={[
                ['1', '单排'],
                ['2', '上下两排'],
              ]}
              initial="2"
            />
          </fieldset>
          <Field
            name={k('clock_pattern')}
            title="第一行时钟格式"
            initial="HH:mm"
          />
          {m.values[k('clock_rows')] === '2' && (
            <Field name={k('clock_pattern_second')} title="第二行时钟格式" />
          )}
          <NativeFold title="格式留空时的默认显示">
            {['24h', 'seconds', 'period', 'week'].map((name, index) => (
              <Toggle
                key={name}
                name={k('clock_' + name)}
                title={
                  ['使用 24 小时制', '显示秒', '显示时段', '显示星期'][index]
                }
              />
            ))}
          </NativeFold>
          <NativeFold title="完整时间格式与示例">
            <ClockFormatHelp />
          </NativeFold>
          <NativeFold title="文字样式">
            <Field
              name={k('clock_font_family')}
              title="系统字体名称"
              initial="sans-serif"
            />
            <Num
              name={k('clock_size_sp')}
              title="单独字号（sp，0 跟随组件）"
              min={0}
              max={40}
              step={0.01}
            />
            <Num
              name={k('clock_weight')}
              title="字重"
              min={100}
              max={900}
              initial={400}
            />
            <Num
              name={k('clock_letter_spacing')}
              title="字间距"
              min={-0.2}
              max={1}
              step={0.01}
            />
            <Num
              name={k('clock_width_dp')}
              title="固定宽度（dp，0 自动）"
              min={0}
              max={240}
            />
            <Choice
              name={k('clock_text_align')}
              title="文字对齐"
              choices={['left', 'center', 'right'].map((value, i) => [
                value,
                ['靠左', '居中', '靠右'][i],
              ])}
              initial="center"
            />
          </NativeFold>
        </Toggle>
        <NativeOptions route="status_clock" />
      </Card>
      <Card className="d-preference-group">
        <Entry
          route="status_assets"
          title="时钟字体文件"
          summary="在图标素材与字体中管理，支持分位置继承"
        />
      </Card>
    </>
  );
}
function NetworkEditor() {
  return (
    <>
      <Card>
        <Preview />
        <RowRule title="网速上下行" />
        <Component id="network">
          <Choice
            name={k('network_display')}
            title="网速显示方式"
            choices={[
              '原生网速',
              '仅上传',
              '仅下载',
              '上传与下载合并',
              '上传与下载上下两排',
            ]}
          />
          <Field
            name={k('network_upload_mark')}
            title="上传前缀"
            initial="↑"
            maxLength={16}
          />
          <Field
            name={k('network_download_mark')}
            title="下载前缀"
            initial="↓"
            maxLength={16}
          />
          <Num
            name={k('native_network_size_sp')}
            title="原生网速字号（sp，0 跟随系统）"
            min={0}
            max={32}
          />
        </Component>
      </Card>
      <Card>
        <Entry
          route="status_icons"
          title="网络图标目录与间距"
          summary="Wi-Fi、双卡信号、附属元素及其他连接图标"
        />
        <NativeFold title="图标显示与网络设置">
          <NativeOptions route="status_network" />
        </NativeFold>
      </Card>
    </>
  );
}
function MetricsEditor() {
  return (
    <>
      <Card>
        <Preview />
        <RowRule title="实时指标" />
        <p className="c-native-note">
          这里使用示例数据；手机数据不可用时显示“—”。当前不提供未经实现的采样间隔配置。
        </p>
        {componentIds.slice(4, 9).map((id, index) => (
          <Component id={id} key={id}>
            <Choice
              name={k(id + '_decimals')}
              title="小数位数"
              choices={['0 位（整数）', '1 位', '2 位', '3 位']}
              initial={index === 2 || index === 4 ? '1' : '0'}
            />
          </Component>
        ))}
      </Card>
      <Card>
        <NativeOptions route="status_metrics" />
      </Card>
    </>
  );
}
function Transform({ slot, title }: { slot: string; title: string }) {
  const m = useModel();
  return (
    <NativeFold title={title}>
      {['x', 'y', 'scale'].map((axis, index) => (
        <Num
          key={axis}
          name={k('connectivity_' + slot + '_' + axis)}
          title={
            ['左右移动（直径 %）', '上下移动（直径 %）', '大小（%）'][index]
          }
          min={index === 2 ? 50 : -100}
          max={index === 2 ? 300 : 100}
          initial={index === 2 ? 100 : 0}
        />
      ))}
      <Button
        secondary
        onClick={() =>
          ['x', 'y', 'scale'].forEach((axis) =>
            m.set(
              k('connectivity_' + slot + '_' + axis),
              axis === 'scale' ? '100' : '0',
            ),
          )
        }
      >
        恢复默认位置和大小
      </Button>
    </NativeFold>
  );
}
function NativeBatteryEditor() {
  const m = useModel();
  if (connectivityCoverage(m.values).active)
    return (
      <Card>
        <p className="c-native-note">
          电池外观已由三合一圆环接管，原生样式参数保留。关闭三合一后恢复此配置入口。
        </p>
        <Button onClick={() => m.go('status_battery')}>前往三合一图标</Button>
      </Card>
    );
  return (
    <>
      <Card>
        <Component id="battery" />
        <Toggle
          name={k('native_battery_enabled')}
          title="原生电池图标"
          initial="1"
          help="开启后使用已保存的原生电池样式。关闭恢复默认外观，参数保留。"
        >
          <NativeOptions
            route="status_native_battery"
            except={[rm('battery_colors'), rm('battery_text_colors')]}
          />
        </Toggle>
      </Card>
      <Card>
        <NativeOption option={optionByKey[rm('battery_colors')]} />
      </Card>
    </>
  );
}
function BatteryTextEditor() {
  const m = useModel();
  if (managedByConnectivity(m.values, 'battery_text'))
    return (
      <Card>
        <p className="c-native-note">
          电量文字已由三合一内部区域展示，独立配置保留。
        </p>
        <Button onClick={() => m.go('status_battery')}>前往三合一图标</Button>
      </Card>
    );
  return (
    <Card>
      <p className="c-native-note">
        三合一未显示电量数字时，此处保留原生电量文字设置。文字出现仍遵循系统显示条件。
      </p>
      <NativeOption option={optionByKey[rm('battery_hide_percent')]} />
      <Button secondary onClick={() => m.go('status_assets')}>
        设置电量文字字体
      </Button>
    </Card>
  );
}
function BatteryEditor() {
  const m = useModel();
  return (
    <>
      <Card>
        <Preview />
        <p className="c-native-note">
          开启后由圆环展示电量，内部三个区域按所选内容接管对应图标。未接管的图标仍可在图标管理中配置；关闭后恢复目录，所有原配置保留。
        </p>
        {m.values[k('position_size_only')] === '1' && (
          <p className="c-native-note">
            仅调整位置和大小已开启，三合一暂不生效，配置保留。
          </p>
        )}
      </Card>
      <Card>
        <Toggle
          name={k('connectivity_group')}
          title="启用三合一图标"
          disabled={m.values[k('position_size_only')] === '1'}
          help="圆环接管电池外观；Wi-Fi、电量文字、双卡／流量卡／另一张卡信号按内部区域所选内容接管。图标管理只列出未接管的图标。原生电池样式暂停；选择信号内容时双排信号也暂停，原配置和开关保留，解除接管后恢复。仅调整位置和大小模式会暂停三合一。"
        >
          <Toggle
            name="status:battery:on"
            title="显示三合一图标"
            initial="1"
            help="控制三合一整体显隐，隐藏不改变已选择内容的配置归属。"
          />
          <ComponentSize id="battery" circle />
          <NativeFold title="位置与顺序">
            <PlacementEditor id="battery" />
          </NativeFold>
          <NativeFold
            title="显示位置与边距"
            help="三合一整体与已接管元素的规则在这里配置；不清除原独立图标设置。未接管的附属元素仍在图标管理。"
          >
            <NativeFold title="三合一整体">
              <IconVisibility id="connectivity" />
              <SpacingEditor id="connectivity" showScope={false} />
            </NativeFold>
            {connectivityCoverage(m.values).contents.includes('battery') && (
              <NativeFold title="电量数字显示与边距">
                <IconVisibility id="battery_text" />
                <SpacingEditor id="battery_text" showScope={false} />
              </NativeFold>
            )}
            {icons
              .filter((i) => managedByConnectivity(m.values, i.id))
              .map((i) => (
                <NativeFold key={i.id} title={i.title + '显示与边距'}>
                  <IconVisibility id={i.id} />
                  {hasBoundary(i.id) ? (
                    <SpacingEditor id={i.id} showScope={false} />
                  ) : (
                    <p className="c-native-note">
                      此元素跟随所属区域；位置与缩放使用对应区域或充电标志的配置。
                    </p>
                  )}
                </NativeFold>
              ))}
            <Button secondary onClick={() => m.go('status_network')}>
              共用网络显示规则
            </Button>
          </NativeFold>
          {['upper', 'middle', 'lower'].map((slot, index) => (
            <NativeFold
              key={slot}
              title={['内部上方', '内部中间', '内部下方'][index]}
            >
              <Choice
                name={k('connectivity_' + slot + '_content')}
                title={['上方显示内容', '中间显示内容', '下方显示内容'][index]}
                choices={[
                  'battery',
                  'wifi',
                  'dual',
                  'data',
                  'other',
                  'none',
                ].map((value, i) => [
                  value,
                  [
                    '电量数字',
                    'Wi-Fi',
                    '双卡信号',
                    '流量卡信号',
                    '另一张卡信号',
                    '不显示',
                  ][i],
                ])}
                initial={['wifi', 'battery', 'dual'][index]}
              />
              <Transform slot={slot} title="位置与大小" />
            </NativeFold>
          ))}
          {connectivityCoverage(m.values).contents.some(
            (c) => c === 'data' || c === 'other',
          ) && (
            <NativeFold
              title="三合一示例状态"
              help="网页使用示例 SIM 状态验证接管关系，手机端应跟随实际上网卡自动更新。此处不更改手机上网卡。"
            >
              <NativeSelect
                name="prototype:connectivity-data-slot"
                title="示例上网卡"
                initial="1"
                choices={[
                  ['1', '卡 1'],
                  ['2', '卡 2'],
                ]}
              />
            </NativeFold>
          )}
          <Transform slot="charge" title="普通充电 · 闪电" />
          <Transform slot="bypass" title="旁路充电 · 插头" />
          <NativeFold title="圆环与充电标志">
            <Num
              name={k('connectivity_ring_percent')}
              title="圆环粗细（直径 %）"
              min={3}
              max={10}
              initial={6}
            />
            <Num
              name={k('connectivity_inactive_percent')}
              title="未点亮部分不透明度（%）"
              min={10}
              max={65}
              initial={28}
            />
            <Toggle
              name={k('connectivity_colors')}
              title="圆环充电与低电量着色"
              initial="1"
            />
            <OptionInput
              option={{
                key: k('connectivity_plug_color'),
                title: '闪电与插头颜色',
                kind: 'COLOR',
                defaultValue: '#FF34C759',
                minimum: 0,
                maximum: 0,
                choices: [],
                summary: '',
                help: '普通充电与旁路充电标志共用的颜色。',
              }}
            />
          </NativeFold>
          <NativeOption option={optionByKey[rm('battery_colors')]} />
          <NativeOption option={optionByKey[rm('battery_text_colors')]} />
        </Toggle>
      </Card>
    </>
  );
}
function BatchHiddenIcons() {
  const m = useModel(),
    [query, setQuery] = useState('');
  const selected = (m.values[rm('hidden_icon_slots')] || '')
    .split(',')
    .filter(Boolean);
  const entries = [
    ...icons.map((i) => ({ id: i.id, title: i.title })),
    ...selected
      .filter((id) => !icons.some((i) => i.id === id))
      .map((id) => ({ id, title: id + '（已有规则）' })),
  ];
  const found = entries.filter((i) =>
    (i.title + ' ' + i.id).toLowerCase().includes(query.toLowerCase()),
  );
  return (
    <CurrentContext.Provider
      value={{
        ...m,
        values: {
          ...m.values,
          [batchHideKey]: batchHideEnabled(m.values) ? '1' : '0',
        },
      }}
    >
      <Toggle
        name={batchHideKey}
        title="批量隐藏系统图标"
        help="在共享范围额外隐藏勾选项，不关闭相应服务。关闭保留全部选择并暂停本批规则；其他逐图标和系统隐藏规则仍独立生效。"
      >
        <p className="c-native-note">
          已选择 {selected.length} 项；子元素跟随所属图标的隐藏规则。
        </p>
        <label className="sd-search">
          查找图标
          <input
            type="search"
            aria-label="查找批量隐藏图标"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
        </label>
        <div className="sd-actions">
          <Button
            secondary
            onClick={() =>
              m.set(
                rm('hidden_icon_slots'),
                [...new Set([...selected, ...found.map((i) => i.id)])].join(
                  ',',
                ),
              )
            }
          >
            选择搜索结果
          </Button>
          <Button
            secondary
            onClick={() =>
              m.set(
                rm('hidden_icon_slots'),
                selected
                  .filter((id) => !found.some((i) => i.id === id))
                  .join(','),
              )
            }
          >
            取消搜索结果
          </Button>
        </div>
        {found.map((i) => (
          <label className="sd-hide-choice" key={i.id}>
            <input
              type="checkbox"
              checked={selected.includes(i.id)}
              onChange={(e) =>
                m.set(
                  rm('hidden_icon_slots'),
                  (e.target.checked
                    ? [...selected, i.id]
                    : selected.filter((id) => id !== i.id)
                  ).join(','),
                )
              }
            />
            <span>{i.title}</span>
          </label>
        ))}
        {!found.length && <p className="c-native-note">没有匹配图标。</p>}
      </Toggle>
    </CurrentContext.Provider>
  );
}
function RecoveryActions() {
  const m = useModel();
  const confirm = (restore: boolean) =>
    m.dialog(
      restore ? '恢复方案前' : '恢复整个状态栏编辑器默认配置',
      <>
        <p>
          {restore
            ? '恢复最近一次预设、自动整理或整体重置前的编辑器配置，包括此后的手动调整。'
            : '重置布局、逐图标位置、时钟、指标和原有组件样式。素材、字体、逐图标显隐与边距，以及独立原生功能开关保留。可用“恢复方案前”撤回。'}
        </p>
        <footer>
          <button onClick={m.close}>取消</button>
          <button
            onClick={() => {
              const changes = restore
                ? restoreLayoutChanges(m.values)
                : resetEditorChanges(m.values);
              if (!changes) {
                m.tell('没有可恢复的方案');
                m.close();
                return;
              }
              if (!restore) m.set(layoutBackupKey, layoutSnapshot(m.values));
              m.set('prototype:status:restoring', '1');
              Object.entries(changes).forEach(([key, value]) =>
                m.set(key, value),
              );
              m.set('prototype:status:restoring', '0');
              if (restore) m.set(layoutBackupKey, '');
              m.close();
              m.tell(restore ? '已恢复方案前配置' : '已恢复编辑器默认配置');
            }}
          >
            确认恢复
          </button>
        </footer>
      </>,
    );
  return (
    <Card>
      <Button
        secondary
        disabled={!restoreLayoutChanges(m.values)}
        onClick={() => confirm(true)}
      >
        恢复方案前
      </Button>
      <NativeFold title="恢复默认配置">
        <Button secondary onClick={() => confirm(false)}>
          恢复整个状态栏编辑器默认配置
        </Button>
      </NativeFold>
    </Card>
  );
}
function SystemDisplayRules() {
  const m = useModel();
  return (
    <Card>
      <Toggle
        name="status:system_icons:on"
        title="显示系统图标"
        initial="1"
        help="控制系统图标组显隐。关闭保留大小、间距、排布与逐图标设置；时钟、电池和指标各自控制。"
      />
      <NativeFold
        title="系统显示规则"
        help="控制系统隐藏限制、隐私提示及已有隐藏清单。逐图标的显示规则仍在图标管理中设置。"
      >
        <NativeOptions
          route="status_icons"
          except={[
            k('icon_spacing_v1'),
            k('hint_priority'),
            rm('hidden_icon_slots'),
          ]}
        />
        <BatchHiddenIcons />
      </NativeFold>
      <NativeOption option={optionByKey[k('hint_priority')]} />
    </Card>
  );
}
function IconManagement() {
  const m = useModel();
  const blocked =
    layoutIsSingle(m.values) || m.values[k('position_size_only')] === '1';
  return (
    <IconDirectory
      general={
        <Card>
          <NativeFold
            title="系统图标通用配置"
            help="设置系统图标通用大小、默认单双排与默认间距。单项行位置和独立间距优先；每个图标的位置与顺序在状态栏布局中调整。"
          >
            <ComponentSize id="system_icons" />
            <Toggle
              name={k('system_two_rows')}
              title="系统图标分两排"
              disabled={blocked}
            />
            <RowRule title="系统图标分两排" />
            <SpacingEditor id="system-default" title="系统图标默认间距" />
            <Button secondary onClick={() => m.go('status_behavior')}>
              前往显示与交互调整系统显示规则
            </Button>
          </NativeFold>
        </Card>
      }
      editors={
        <Card>
          <Entry
            route="status_clock"
            title="时钟"
            summary="日期、秒与毫秒、单双排和文字样式"
          />
          <Entry
            route="status_network"
            title="网速与网络设置"
            summary="网速、未接管的网络图标及双排信号"
          />
          <Entry
            route="status_metrics"
            title="硬件数据实时指标"
            summary="CPU / GPU 温度、电池温度、电流与功率"
          />
          {!managedByConnectivity(m.values, 'battery_text') && (
            <Entry
              route="status_battery_text"
              title="电量文字"
              summary="百分号、按电量着色与字体"
            />
          )}
        </Card>
      }
    />
  );
}
function NotificationsEditor() {
  return (
    <NotificationEditor
      summary={<Summary />}
      native={<NativeOption option={optionByKey[rm('notification_native')]} />}
    />
  );
}

export function StatusDesignPage({ route }: { route: string }) {
  const parent = useModel();
  const values: Record<string, string> = {
    ...Object.fromEntries(
      nativeOptions.map((option) => [option.key, option.defaultValue]),
    ),
    [rowModeKey]: '2',
    ...Object.fromEntries(
      componentIds.flatMap((id, i) => [
        [item(id, 'on'), i < 4 ? '1' : '0'],
        [item(id, 'zone'), String([2, 2, 8, 8, 1, 1, 4, 7, 7, 5][i])],
        [item(id, 'size'), String(i < 4 ? 13 : 9)],
        [item(id, 'order'), String(i)],
      ]),
    ),
    ...parent.values,
  };
  if (values[k('notification_hide')] === '1')
    values[item('notifications', 'on')] = '0';
  const pending = { ...values };
  const model = {
    ...parent,
    values,
    set(key: string, value: string) {
      pending[key] = value;
      parent.set(key, value);
      if (key === item('notifications', 'on'))
        parent.set(k('notification_hide'), value === '1' ? '0' : '1');
      if (key === k('connectivity_group') && value === '1') {
        parent.tell('三合一已按所选内容接管图标；原配置保留。');
      }
      if (
        key === k('native_battery_enabled') &&
        value === '1' &&
        pending['prototype:status:restoring'] !== '1'
      ) {
        parent.set(k('connectivity_group'), '0');
        parent.tell('已使用原生电池；三合一配置保留。');
      }
      if (
        key.startsWith('status:') &&
        /^status:[^:]+:(on|zone|size|order)$/.test(key)
      ) {
        const next = pending;
        const serialized =
          'SG2;' +
          componentIds
            .map((id, index) =>
              [
                id,
                zoneCodes[
                  Number(
                    next[item(id, 'zone')] ??
                      [2, 2, 8, 8, 1, 1, 4, 7, 7, 5][index],
                  )
                ],
                next[item(id, 'order')] ?? index,
                next[item(id, 'size')] || (index < 4 ? 13 : 9),
                next[item(id, 'on')] ?? (index < 4 ? '1' : '0'),
              ].join(','),
            )
            .join(';');
        parent.set(k('grid_v2'), serialized);
      }
    },
  };
  const iconId = route.startsWith('status_icon/') ? route.slice(12) : '';
  const label = iconId
    ? '图标设置'
    : (
        {
          status_behavior: '显示与交互',
          status_clock: '时钟设置',
          status_network: '网络与信号设置',
          status_battery: '三合一图标',
          status_native_battery: '原生电池图标',
          status_battery_text: '电量文字',
          status_icons: '图标管理',
          status_system_arrangement: '图标管理',
          status_metrics: '实时指标设置',
          status_notifications: '通知图标设置',
        } as Record<string, string>
      )[route];
  return (
    <CurrentContext.Provider value={model}>
      {route === 'status_layout' ? (
        <Overview />
      ) : route === 'status_arrangement' ? (
        <div className="sd-page sd-editor">
          <Arrangement />
        </div>
      ) : (
        <div className="sd-page sd-editor">
          <Section title={label}>
            {values.ls_augment_systemui_master === '0' && (
              <p className="c-native-note">
                状态栏自定义已关闭，布局与组件配置保留；独立原生功能遵循各自开关。
              </p>
            )}
            {iconId ? (
              <IconDetails id={iconId} />
            ) : route === 'status_behavior' ? (
              <>
                <Card>
                  <NativeOptions route={route} />
                </Card>
                <SystemDisplayRules />
              </>
            ) : route === 'status_clock' ? (
              <ClockEditor />
            ) : route === 'status_network' ? (
              <NetworkEditor />
            ) : route === 'status_metrics' ? (
              <MetricsEditor />
            ) : route === 'status_battery' ? (
              <BatteryEditor />
            ) : route === 'status_native_battery' ? (
              <NativeBatteryEditor />
            ) : route === 'status_battery_text' ? (
              <BatteryTextEditor />
            ) : route === 'status_icons' ||
              route === 'status_system_arrangement' ? (
              <IconManagement />
            ) : (
              <NotificationsEditor />
            )}
          </Section>
        </div>
      )}
    </CurrentContext.Provider>
  );
}
