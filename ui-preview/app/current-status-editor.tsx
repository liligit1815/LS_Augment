'use client';
import {
  createContext,
  useContext,
  useRef,
  useState,
  type ReactNode,
} from 'react';
import native from './current-native-data.json';
import {
  Card,
  Toggle,
  Range,
  Field,
  FeatureTitle,
  CurrentContext,
  useModel,
  LinkCard,
} from './current-ui';
import { CanvasPreview } from './current-status-canvas';
import { NativeFold, NativeSelect } from './current-native-controls';
import { FeatureRow } from './current-feature-row';
import { CurrentStatusPreview } from './current-status-preview';
import { StatusSheetEditor } from './current-status-sheet';
import {
  SHEET_KEY,
  SHEET_MODE,
  sheetEnabled,
  seedSheet,
  readSheet,
  readabilityIssues,
  worseningReadability,
} from './current-status-sheet-model';
import { statusExtent } from './current-status-content';

const prefix = 'ls_augment_statusbar_';
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
const names = [
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
const zones = [
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
const zoneCodes = ['L1', 'L2', 'LS', 'C1', 'C2', 'CS', 'R1', 'R2', 'RS'];
const tabs = ['布局', '时钟', '通知', '硬件网速', '图标', '电池'];
const defaults = native.allDefaults as Record<string, string>;
const related = native.groups
  .find((t) => t.id === 'systemui')!
  .sections.find((s) => s.id === 'statusbar')!.features;
const k = (s: string) => prefix + s;
const item = (id: string, field: string) => 'status:' + id + ':' + field;
const label = (id: string) => names[ids.indexOf(id)];
const SelectionContext = createContext({ id: '', sequence: 0 });

function Related({ area }: { area: string }) {
  return (
    <div className="c-status-related">
      {related
        .filter((f) => f.destination === area)
        .map((f) => (
          <FeatureRow key={f.id} feature={f} />
        ))}
    </div>
  );
}
function NumberControl({
  name,
  title,
  min,
  max,
}: {
  name: string;
  title: string;
  min: number;
  max: number;
}) {
  return (
    <Range
      name={k(name)}
      title={title}
      min={min}
      max={max}
      initial={Number(defaults[k(name)] || 0)}
    />
  );
}
function ClockConfiguration() {
  const m = useModel();
  return (
    <Toggle name={k('clock_custom')} title="自定义时钟文字">
      <NativeFold title="高级：自定义时间格式">
        <Field name={k('clock_pattern')} title="第一行格式，例如 HH:mm" />
        {m.values[k('clock_rows')] === '2' && (
          <Field
            name={k('clock_pattern_second')}
            title="第二行格式，例如 MM/dd E"
          />
        )}
        <FeatureTitle
          title="时间格式说明"
          help="HH 为 24 小时、hh 为 12 小时；固定文字用单引号。N 农历月、NN 农历月干支、NNN 完整农历日期、NNNN 日期与节气、e 农历日、Y 干支年、A 生肖、t 节气；I 时辰地支、II 时干支、aa 中文时段。"
        />
      </NativeFold>
      {['24h', 'seconds', 'period', 'week'].map((suffix, i) => (
        <Toggle
          key={suffix}
          name={k('clock_' + suffix)}
          title={
            [
              '默认使用 24 小时制',
              '默认显示秒',
              '默认显示时段',
              '默认显示星期',
            ][i]
          }
        />
      ))}
      <NativeFold title="高级：字体与排版">
        <Field
          name={k('clock_font_family')}
          title="字体名称（sans-serif / serif / monospace）"
        />
        {!sheetEnabled(m.values) && (
          <>
            <Field
              name={k('clock_size_sp')}
              title="单独字号 sp（0 使用上方大小）"
              type="number"
              min={0}
              max={40}
              decimal
            />
            <p className="c-native-note">
              单独字号大于 0
              时优先使用；拖动上方大小会重新跟随布局。空间不足时仍会缩小以避免重叠。
            </p>
          </>
        )}
        <Field
          name={k('clock_weight')}
          title="字重（100–900）"
          type="number"
          min={100}
          max={900}
        />
        <Field
          name={k('clock_letter_spacing')}
          title="字间距（-0.20 至 1.00）"
          type="number"
          decimal
          min={-0.2}
          max={1}
        />
        {!sheetEnabled(m.values) && (
          <>
            <p className="c-native-note">
              双排时钟与硬件信息使用同一排对齐；两排间距统一在布局分类中调整。
            </p>
            <Field
              name={k('clock_width_dp')}
              title="固定宽度 dp（0 自动）"
              type="number"
              min={0}
              max={240}
            />
            <NativeSelect
              name={k('clock_text_align')}
              title="文字对齐"
              choices={
                ['left', 'center', 'right'].map((v, i) => [
                  v,
                  ['靠左', '居中', '靠右'][i],
                ]) as [string, string][]
              }
              initial="center"
            />
          </>
        )}
      </NativeFold>
    </Toggle>
  );
}

function OrderDialog({
  list,
  apply,
}: {
  list: string[];
  apply: (v: string[]) => void;
}) {
  const [order, setOrder] = useState(list),
    drag = useRef('');
  const m = useModel();
  const move = (id: string, delta: number) => {
    const next = [...order],
      i = next.indexOf(id),
      j = i + delta;
    if (j < 0 || j >= next.length) return;
    [next[i], next[j]] = [next[j], next[i]];
    setOrder(next);
  };
  return (
    <>
      <p className="c-native-note">拖动条目调整顺序，也可使用上下移动按钮。</p>
      {order.map((id, i) => (
        <div
          className="c-order-dialog-row"
          key={id}
          draggable
          onDragStart={() => {
            drag.current = id;
          }}
          onDragOver={(e) => e.preventDefault()}
          onDrop={() => {
            const next = order.filter((x) => x !== drag.current);
            next.splice(i, 0, drag.current);
            setOrder(next);
          }}
        >
          <span>☰　{label(id)}</span>
          <button
            aria-label={label(id) + '上移'}
            disabled={i === 0}
            onClick={() => move(id, -1)}
          >
            ↑
          </button>
          <button
            aria-label={label(id) + '下移'}
            disabled={i === order.length - 1}
            onClick={() => move(id, 1)}
          >
            ↓
          </button>
        </div>
      ))}
      <footer>
        <button onClick={m.close}>取消</button>
        <button
          onClick={() => {
            apply(order);
            m.close();
          }}
        >
          应用顺序
        </button>
      </footer>
    </>
  );
}

function ComponentSettings({
  id,
  circle = false,
}: {
  id: string;
  circle?: boolean;
}) {
  const m = useModel(),
    v = m.values,
    position = !sheetEnabled(v) && v[k('position_size_only')] === '1';
  const paired =
    position ||
    circle ||
    (id === 'clock' && v[k('clock_rows')] === '2') ||
    (id === 'network' && v[k('network_display')] === '4') ||
    (id === 'notifications' && v[k('notification_two_rows')] === '1') ||
    (id === 'system_icons' && v[k('system_two_rows')] === '1');
  const zone = Number(v[item(id, 'zone')] || 0),
    side = Math.floor(zone / 3);
  const list = ids
    .filter(
      (x) =>
        Math.floor(Number(v[item(x, 'zone')] || 0) / 3) === side &&
        (x === id || v[item(x, 'on')] === '1'),
    )
    .sort((a, b) => Number(v[item(a, 'order')]) - Number(v[item(b, 'order')]));
  const apply = (next: string[]) =>
    next.forEach((x, i) => m.set(item(x, 'order'), String(i)));
  const move = (delta: number) => {
    const next = [...list],
      i = next.indexOf(id),
      j = i + delta;
    if (j < 0 || j >= next.length) return;
    [next[i], next[j]] = [next[j], next[i]];
    apply(next);
  };
  const model = {
    ...m,
    values: { ...v, [item(id, 'zone')]: String(paired ? side * 3 + 2 : zone) },
  };
  return (
    <>
      {!position && id === 'clock' && (
        <NativeSelect
          name={k('clock_rows')}
          title="显示排数"
          choices={[
            ['1', '单排'],
            ['2', '双排'],
          ]}
          initial="2"
        />
      )}
      {!position && id === 'notifications' && (
        <Toggle name={k('notification_two_rows')} title="通知图标分两排" />
      )}
      {!position && id === 'system_icons' && (
        <Toggle name={k('system_two_rows')} title="系统图标分两排" />
      )}
      {!position && id === 'network' && (
        <>
          <NumberControl
            name="native_network_size_sp"
            title="原生网速字号（0 跟随系统图标）"
            min={0}
            max={32}
          />
          <NativeSelect
            name={k('network_display')}
            title="显示方式"
            choices={[
              ['1', '仅显示上行'],
              ['2', '仅显示下行'],
              ['3', '上下行同时显示（单排）'],
              ['4', '上下行同时显示（双排）'],
            ]}
            initial="4"
          />
          <Field
            name={k('network_upload_mark')}
            title="上行标志（留空不显示）"
          />
          <Field
            name={k('network_download_mark')}
            title="下行标志（留空不显示）"
          />
        </>
      )}
      {sheetEnabled(v) && (
        <p className="c-native-note">
          位置、大小与间距在「布局」表格中逐格调整；此处设置内容样式。
        </p>
      )}
      {!sheetEnabled(v) && (
        <>
          <CurrentContext.Provider value={model}>
            <NativeSelect
              name={item(id, 'zone')}
              title="显示区域"
              choices={
                paired
                  ? ([2, 5, 8].map((z, i) => [
                      String(z),
                      ['左侧', '中间', '右侧'][i] +
                        (position || circle ? '' : '（上下两排）'),
                    ]) as [string, string][])
                  : (zones.map((z, i) => [String(i), z]) as [string, string][])
              }
            />
          </CurrentContext.Provider>
          <Range
            name={circle ? k('connectivity_size_dp') : item(id, 'size')}
            title={circle ? '圆形组件大小（dp）' : '大小（dp）'}
            min={circle ? 18 : 6}
            max={circle ? 40 : 32}
            initial={circle ? 26 : 13}
          />
          <p className="c-native-note c-order-summary">
            同侧顺序：
            {list
              .map((x) =>
                x === 'battery' && v[k('connectivity_group')] === '1'
                  ? '三合一'
                  : label(x),
              )
              .join(' → ')}
          </p>
          <div className="c-native-actions">
            <button
              disabled={list.indexOf(id) === 0}
              onClick={() => move(-1)}
              aria-label={label(id) + '前移'}
            >
              前移
            </button>
            <button
              disabled={list.indexOf(id) === list.length - 1}
              onClick={() => move(1)}
              aria-label={label(id) + '后移'}
            >
              后移
            </button>
            <button
              onClick={() =>
                m.dialog(
                  '调整同侧显示顺序',
                  <OrderDialog list={list} apply={apply} />,
                )
              }
            >
              拖动排序
            </button>
          </div>
        </>
      )}
      {circle && (
        <NativeFold title="高级设置：三合一图标">
          <ConnectivitySettings />
        </NativeFold>
      )}
      {!position &&
        ['cpu', 'gpu', 'battery_temp', 'current', 'power'].includes(id) && (
          <NativeFold title="高级：小数精度">
            <NativeSelect
              name={k(id + '_decimals')}
              title="保留小数位数"
              choices={['0 位（整数）', '1 位小数', '2 位小数', '3 位小数']}
            />
          </NativeFold>
        )}
      {!position && id === 'network' && <Related area="network" />}
      {!position && id === 'clock' && <ClockConfiguration />}
    </>
  );
}

function StatusComponent({ id }: { id: string }) {
  const m = useModel(),
    v = m.values,
    on = v[item(id, 'on')] === '1',
    size = v[item(id, 'size')] || '13',
    zone = Number(v[item(id, 'zone')] || 0);
  const selection = useContext(SelectionContext);
  return (
    <Card
      className="c-status-component"
      path={'StatusBarEditor.component:' + id}
      label={label(id)}
    >
      {sheetEnabled(v) || v[k('position_size_only')] === '1' ? (
        <>
          <FeatureTitle title={label(id)} />
          <ComponentSettings id={id} />
        </>
      ) : (
        <Toggle
          name={item(id, 'on')}
          title={label(id)}
          accessibleWhileOff
          reveal={selection.id === id ? selection.sequence : 0}
          summary={`${on ? '已开启' : '未开启'} · ${zones[zone]} · ${size} dp`}
          help="可独立设置此组件的位置、大小和同侧显示顺序。关闭后保留配置。"
        >
          <ComponentSettings id={id} />
        </Toggle>
      )}
    </Card>
  );
}

function Transform({ slot, title }: { slot: string; title: string }) {
  const m = useModel();
  return (
    <>
      {['x', 'y', 'scale'].map((axis, i) => (
        <NumberControl
          key={axis}
          name={'connectivity_' + slot + '_' + axis}
          title={
            title + ['左右移动（直径 %）', '上下移动（直径 %）', '大小（%）'][i]
          }
          min={i === 2 ? 50 : -100}
          max={i === 2 ? 300 : 100}
        />
      ))}
      <button
        className="c-button"
        onClick={() =>
          ['x', 'y', 'scale'].forEach((a) =>
            m.set(
              k('connectivity_' + slot + '_' + a),
              a === 'scale' ? '100' : '0',
            ),
          )
        }
      >
        恢复{title}默认位置和大小
      </button>
    </>
  );
}
function ConnectivitySettings() {
  return (
    <>
      <p className="c-native-note">
        三个内部区域分别设置，互不影响。位置以图标直径为单位：左右负数向左、正数向右；上下负数向上、正数向下。0
        为原有位置。
      </p>
      <NativeSelect
        name="ui:charging-preview"
        title="预览充电状态"
        choices={['预览：未充电', '预览：普通充电', '预览：旁路充电']}
      />
      {['upper', 'middle', 'lower'].map((slot, i) => (
        <NativeFold key={slot} title={['内部上方', '内部', '内部下方'][i]}>
          <NativeSelect
            name={k('connectivity_' + slot + '_content')}
            title="显示内容"
            choices={
              ['battery', 'wifi', 'dual', 'data', 'other', 'none'].map(
                (x, j) => [
                  x,
                  [
                    '电量数字',
                    'Wi-Fi',
                    '双卡信号',
                    '仅流量卡信号',
                    '仅另一张卡信号',
                    '不显示',
                  ][j],
                ],
              ) as [string, string][]
            }
          />
          <Transform slot={slot} title={['内部上方', '内部', '内部下方'][i]} />
        </NativeFold>
      ))}
      {['charge', 'bypass'].map((slot, i) => (
        <NativeFold
          key={slot}
          title={i === 0 ? '普通充电 · 闪电' : '旁路充电 · 插头'}
        >
          <p className="c-native-note">
            默认显示在电量数字右侧，并随电量数字移动和缩放。在此基础上，可单独移动和缩放此标志，不影响数字或另一种充电状态。
          </p>
          <Transform
            slot={slot}
            title={i === 0 ? '普通充电 · 闪电' : '旁路充电 · 插头'}
          />
        </NativeFold>
      ))}
      <NativeFold title="圆环与颜色">
        {related
          .filter((f) =>
            /battery_(colors|text_colors)$/.test(f.toggleKey || ''),
          )
          .map((f) => (
            <FeatureRow feature={f} key={f.id} />
          ))}
        <Field
          name={k('connectivity_plug_color')}
          title="充电标志颜色（#AARRGGBB）"
        />
        <NumberControl
          name="connectivity_ring_percent"
          title="电量弧粗细（占组件直径 %）"
          min={3}
          max={10}
        />
        <NumberControl
          name="connectivity_inactive_percent"
          title="未点亮部分不透明度（%）"
          min={10}
          max={65}
        />
        <Toggle name={k('connectivity_colors')} title="圆环充电与低电量着色" />
      </NativeFold>
      <p className="c-native-note">
        大小可调至
        50%–300%。移动或放大后可能重叠，超出组件边界的部分可能被裁切，请结合顶部预览调整。
      </p>
    </>
  );
}

function Battery() {
  const m = useModel(),
    position =
      !sheetEnabled(m.values) && m.values[k('position_size_only')] === '1';
  const selection = useContext(SelectionContext);
  const model = {
    ...m,
    values: {
      ...m.values,
      ...(position
        ? { [k('connectivity_group')]: '0', [k('native_battery_enabled')]: '1' }
        : {}),
    },
    set(key: string, value: string) {
      m.set(key, value);
    },
  };
  return (
    <CurrentContext.Provider value={model}>
      <Card
        className="c-status-component c-battery-component"
        path="StatusBarEditor.component:battery"
      >
        <Toggle
          name={k('connectivity_group')}
          title="三合一图形图标"
          disabled={position}
          reveal={selection.id === 'battery' ? selection.sequence : 0}
          help="将电量、Wi-Fi 和信号合并为圆形组件。开启时自动关闭原生电池图标。"
        >
          <FeatureTitle
            title="三合一图标配置"
            help="调整三合一图标整体的大小和位置，高级设置可分别调整三个内部区域。"
          />
          <ComponentSettings id="battery" circle />
        </Toggle>
      </Card>
      <Card className="c-status-component c-battery-component">
        <Toggle
          name={k('native_battery_enabled')}
          title="原生电池图标"
          switchDisabled={position}
          reveal={selection.id === 'battery' ? selection.sequence : 0}
          help="开启时自动关闭三合一。两项都关闭时恢复默认电池外观与布局，配置均保留。"
        >
          {position ? (
            <ComponentSettings id="battery" />
          ) : (
            <>
              <Toggle
                name={item('battery', 'on')}
                title="显示电池图标"
                accessibleWhileOff
              >
                <ComponentSettings id="battery" />
              </Toggle>
              <Related area="battery" />
            </>
          )}
        </Toggle>
      </Card>
    </CurrentContext.Provider>
  );
}

function presetValues(values: Record<string, string>) {
  const result = { ...values };
  const grid = values[k('grid_v2')];
  if (grid)
    grid
      .split(';')
      .slice(1)
      .forEach((s) => {
        const [id, zone, order, size, on] = s.split(',');
        if (!ids.includes(id)) return;
        result[item(id, 'zone')] = String(zoneCodes.indexOf(zone));
        result[item(id, 'order')] = order;
        result[item(id, 'size')] = size;
        result[item(id, 'on')] = on;
      });
  return result;
}

export function LatestStatusEditor() {
  const parent = useModel(),
    [tab, setTab] = useState(0),
    [undo, setUndo] = useState<Record<string, string> | null>(null),
    [draft, setDraft] = useState<Record<string, string> | null>(null),
    [preset, setPreset] = useState('');
  const [sheetSelection, setSheetSelection] = useState({ row: 0, col: 0 });
  const scroll = useRef<HTMLDivElement>(null),
    positions = useRef<number[]>([0, 0, 0, 0, 0, 0]);
  const [selection, select] = useState({ id: '', sequence: 0 });
  const m = {
    ...parent,
    values: draft || parent.values,
    set(key: string, value: string) {
      const before = draft || parent.values;
      const changes: Record<string, string> = { [key]: value };
      if (value === '1' && key === k('connectivity_group'))
        changes[k('native_battery_enabled')] = '0';
      if (value === '1' && key === k('native_battery_enabled'))
        changes[k('connectivity_group')] = '0';
      if (before['status:layout-compatibility'] === 'legacy' && sheetEnabled(before) && key.startsWith(prefix)) {
        const current = readSheet(before, (c) => statusExtent(c, before)).sheet;
        const after = { ...before, ...changes };
        const error = worseningReadability(
          readabilityIssues(current, before, (c) => statusExtent(c, before)),
          readabilityIssues(current, after, (c) => statusExtent(c, after)),
          true,
        );
        if (error) {
          parent.tell(error);
          return;
        }
        // Freeze initial slot geometry before a style edit changes its sample dimensions.
        if (!before[SHEET_KEY]) {
          if (draft)
            setDraft((prev) => ({
              ...prev!,
              [SHEET_KEY]: JSON.stringify(current),
            }));
          else parent.set(SHEET_KEY, JSON.stringify(current));
        }
      }
      if (draft) setDraft((prev) => ({ ...prev!, ...changes }));
      else
        Object.entries(changes).forEach(([name, next]) =>
          parent.set(name, next),
        );
    },
  };
  const v = m.values,
    position = !sheetEnabled(v) && v[k('position_size_only')] === '1',
    master = v['ls_augment_systemui_master'] === '1';
  const sheetMode = sheetEnabled(v);
  const changeTab = (i: number) => {
    if (scroll.current) positions.current[tab] = scroll.current.scrollTop;
    setTab(i);
    requestAnimationFrame(() => {
      if (scroll.current) scroll.current.scrollTop = positions.current[i];
    });
  };
  const snapshot = () => ({
    'status:canvas:v2': '',
    [SHEET_KEY]: '',
    [SHEET_MODE]: 'sheet',
    ...Object.fromEntries(
      Object.entries(parent.values).filter(
        ([key]) =>
          key.includes('statusbar') ||
          key.startsWith('status:') ||
          key === 'ls_augment_systemui_master',
      ),
    ),
  });
  const save = (values: Record<string, string>) =>
    Object.entries(values).forEach(([key, value]) => parent.set(key, value));
  const confirm = (title: string, body: string, action: () => void) =>
    parent.dialog(
      title,
      <>
        <p className="c-help-copy">{body}</p>
        <footer>
          <button onClick={parent.close}>取消</button>
          <button
            onClick={() => {
              action();
              parent.close();
            }}
          >
            确定
          </button>
        </footer>
      </>,
    );
  const arrange = () => {
    setUndo(snapshot());
    if (sheetMode) {
      const next = seedSheet(v, (c) => statusExtent(c, v));
      parent.set('status:canvas:v2', '');
      parent.set(SHEET_KEY, JSON.stringify(next));
      setSheetSelection({ row: 0, col: 0 });
      parent.tell('已按区域配置重新生成表格，可恢复整理前配置');
      return;
    }
    ids.forEach((id, i) => {
      const zone = [0, 0, 6, 8, 1, 1, 1, 7, 7, 7][i];
      parent.set(
        item(id, 'zone'),
        String(
          Number(v[item(id, 'zone')]) % 3 === 2
            ? Math.floor(zone / 3) * 3 + 2
            : zone,
        ),
      );
      parent.set(
        item(id, 'order'),
        String([0, 10, 0, 90, 20, 30, 40, 10, 20, 30][i]),
      );
    });
    parent.set(k('dual_row_gap_dp'), '2');
    parent.tell('已整理位置并设置安全行距，可恢复整理前配置');
  };
  const selectComponent = (id: string) => {
    select((s) => ({ id, sequence: s.sequence + 1 }));
    changeTab(
      id === 'clock'
        ? 1
        : id === 'notifications'
          ? 2
          : id === 'system_icons'
            ? 4
            : id === 'battery'
              ? 5
              : 3,
    );
    requestAnimationFrame(() => {
      const area = scroll.current,
        target = area?.querySelector<HTMLElement>(
          '[data-native-path="StatusBarEditor.component:' + id + '"]',
        );
      if (area && target)
        area.scrollTop +=
          (target.getBoundingClientRect().top -
            area.getBoundingClientRect().top) /
          (area.getBoundingClientRect().height / area.clientHeight);
    });
  };
  const reset = () =>
    confirm(
      '恢复状态栏默认配置',
      '将重置此编辑器的布局、时钟、硬件与图标配置。原厂独立功能开关不变；可用上方撤销按钮恢复。',
      () => {
        setUndo(snapshot());
        parent.set(SHEET_KEY, '');
        parent.set('status:canvas:v2', '');
        parent.set(SHEET_MODE, 'sheet');
        setSheetSelection({ row: 0, col: 0 });
        save(
          Object.fromEntries(
            Object.entries(defaults).filter(([key]) => key.startsWith(prefix)),
          ),
        );
        ids.forEach((id, i) => {
          parent.set(item(id, 'on'), i < 4 ? '1' : '0');
          parent.set(
            item(id, 'zone'),
            String([2, 2, 8, 8, 1, 1, 4, 7, 7, 5][i]),
          );
          parent.set(item(id, 'size'), String(i < 4 ? 13 : 9));
          parent.set(item(id, 'order'), String(i));
        });
      },
    );
  const choosePreset = () =>
    parent.dialog(
      '选择预设 · 先预览再应用',
      <>
        {native.presets.map((p) => (
          <button
            className="c-preset-choice"
            key={p.name}
            onClick={() => {
              setPreset(p.name);
              const next = { ...parent.values, ...presetValues(p.values as Record<string,string>) };
              next['status:canvas:v2'] = '';
              next[SHEET_KEY] = JSON.stringify(
                seedSheet(next, (c) => statusExtent(c, next)),
              );
              setDraft(next);
              parent.close();
            }}
          >
            <strong>{p.name}</strong>
            <small>{p.description}</small>
          </button>
        ))}
        <footer>
          <button onClick={parent.close}>取消</button>
        </footer>
      </>,
    );
  const panes: ReactNode[] = [
    <div key="layout" className="c-layout-pane">
      <div className="c-sheet-mode">
        <NativeSelect
          name={SHEET_MODE}
          title="布局方式"
          initial="sheet"
          choices={[
            ['sheet', '表格布局 · 逐格自定义'],
            ['regions', '区域布局 · 原有配置'],
          ]}
        />
      </div>
      {sheetMode ? (
        <><LinkCard route="status_canvas" title="工作表画布" summary="扩展行列、合并单元格、平移缩放与输出预览"/>
        <NativeFold title="兼容：旧版表格配置"><StatusSheetEditor
          selection={sheetSelection}
          onSelect={(row, col) => setSheetSelection({ row, col })}
        /></NativeFold></>
      ) : (
        <>
          <Toggle
            name={k('position_size_only')}
            title="仅调整位置和大小"
            help="保留原生组件外观，仅调整位置和大小，暂停硬件信息和自定义网速。"
          />
          <p className="c-native-note">
            先选择预设或自动整理；需要精调时再展开下方高级设置。
          </p>
          <NativeFold title="高级：高度、留白与两排间距">
            {[
              ['height_dp', '状态栏高度（0 原厂，负数减小）', -32, 96],
              ['left_margin_dp', '左侧留白', 0, 40],
              ['right_margin_dp', '右侧留白', 0, 40],
              ['top_margin_dp', '顶部留白', 0, 12],
              ['bottom_margin_dp', '底部留白', 0, 12],
              ['dual_row_gap_dp', '两排间距', -8, 8],
            ]
              .filter(([name]) => !position || name !== 'dual_row_gap_dp')
              .map(([name, title, min, max]) => (
                <NumberControl
                  key={String(name)}
                  name={String(name)}
                  title={String(title)}
                  min={Number(min)}
                  max={Number(max)}
                />
              ))}
          </NativeFold>
        </>
      )}
      <Related area="layout" />
      <button className="c-button c-reset-status" onClick={reset}>
        恢复整个状态栏编辑器默认配置
      </button>
    </div>,
    <div key="clock">
      <StatusComponent id="clock" />
      <Related area="clock" />
    </div>,
    <div key="notifications">
      <StatusComponent id="notifications" />
      {!position && (
        <NumberControl
          name="notification_max"
          title="最多显示通知数（0 跟随系统）"
          min={0}
          max={20}
        />
      )}
      <Related area="notifications" />
    </div>,
    <div key="metrics">
      {position ? (
        <p className="c-native-note">
          当前仅调整原生组件的位置和大小。硬件信息和自定义网速已暂停，原有设置保留。
        </p>
      ) : (
        <>
          <StatusComponent id="network" />
          <p className="c-native-note">
            CPU、GPU、电池温度、电流和功率可分别设置位置、大小、顺序与小数位数。
          </p>
          {['cpu', 'gpu', 'battery_temp', 'current', 'power'].map((id) => (
            <StatusComponent id={id} key={id} />
          ))}
          <Related area="metrics" />
        </>
      )}
    </div>,
    <div key="icons">
      <p className="c-native-note">
        {position
          ? '保留原生行数、字体、图标样式和显示状态；通知图标与系统图标均按整组移动和缩放。'
          : '双排图标统一使用状态栏的上下两排，可选择左侧、中间或右侧；间距跟随布局页设置。'}
      </p>
      <StatusComponent id="system_icons" />
      <NativeSelect name="ls_augment_statusbar_bluetooth_style" title="蓝牙图标样式" choices={['原厂','小米 · 胶囊电量','圆环 · 电量百分比']}/>
      <Related area="icons" />
    </div>,
    <Battery key="battery" />,
  ];
  return (
    <CurrentContext.Provider value={m}>
      <SelectionContext.Provider value={selection}>
        <div className="c-native-status">
          <div className="c-status-master">
            <Toggle
              name="ls_augment_systemui_master"
              title="启用自定义状态栏"
              disabled={!!draft}
              help="开启后使用本页配置的布局。修改后自动保存。"
            />
          </div>
          <button className="d-inline-entry" onClick={()=>parent.go('status_assets')}>图标总览、素材与字体</button>
          <div className="c-native-status-top">
            <p className="c-preview-hint">
              示例预览 · 点选内容可编辑，也可使用下方分类
            </p>
            {sheetMode ? (
              <button className="d-canvas-preview-hit" aria-label="打开工作表画布" onClick={()=>parent.go('status_canvas')}><CanvasPreview values={v}/></button>
            ) : (
              <CurrentStatusPreview values={v} onSelect={selectComponent} />
            )}
            <p className="c-preview-feedback">
              {sheetMode
                ? '表格预览 · 示例读数 · 修改自动保存到浏览器'
                : '自动避让已保护交叠区域 · 原间距配置保留'}
            </p>
            <div className="c-native-actions">
              <button disabled={!!draft || !master} onClick={arrange}>
                {sheetMode ? '从区域配置重建' : '自动整理'}
              </button>
              <button disabled={!!draft || !master} onClick={choosePreset}>
                选择预设
              </button>
              <button
                disabled={!undo || !!draft}
                onClick={() =>
                  confirm(
                    '恢复方案前配置',
                    '恢复到最近一次整理、预设或整体重置前的状态栏编辑器配置，包括之后的手动调整。',
                    () => {
                      save(undo!);
                      setUndo(null);
                    },
                  )
                }
              >
                恢复方案前
              </button>
            </div>
            {draft && (
              <div className="c-preset-banner">
                <p>正在预览：{preset}</p>
                <div className="c-native-actions">
                  <button
                    onClick={() => {
                      if (sheetMode && draft['status:layout-compatibility'] === 'legacy') {
                        const sheet = readSheet(draft, (c) =>
                          statusExtent(c, draft),
                        ).sheet;
                        const problem = readabilityIssues(sheet, draft, (c) =>
                          statusExtent(c, draft),
                        )[0];
                        if (problem) {
                          parent.tell('该预设需要调整：' + problem.message);
                          return;
                        }
                      }
                      setUndo(snapshot());
                      save(draft);
                      setDraft(null);
                    }}
                  >
                    使用此预设
                  </button>
                  <button onClick={() => setDraft(null)}>取消预览</button>
                </div>
              </div>
            )}
            <div
              className="c-native-tabs"
              role="tablist"
              aria-label="状态栏分类"
            >
              {tabs.map((title, i) => (
                <button
                  key={title}
                  role="tab"
                  aria-selected={tab === i}
                  aria-controls={'status-pane-' + i}
                  onClick={() => changeTab(i)}
                >
                  {title}
                </button>
              ))}
            </div>
          </div>
          <div
            ref={scroll}
            className="c-native-config"
            style={{ opacity: master ? 1 : 0.45 }}
          >
            {draft ? (
              <>
                <h3>正在预览：{preset}</h3>
                <p className="c-native-note">
                  顶部为示例效果，手机尚未应用此预设。选择“使用此预设”后保存；取消或离开页面会恢复预览前的设置。
                </p>
              </>
            ) : (
              panes.map((pane, i) => (
                <div
                  key={i}
                  id={'status-pane-' + i}
                  role="tabpanel"
                  aria-label={tabs[i]}
                  hidden={tab !== i}
                  inert={!master}
                >
                  {pane}
                </div>
              ))
            )}
          </div>
        </div>
      </SelectionContext.Provider>
    </CurrentContext.Provider>
  );
}
