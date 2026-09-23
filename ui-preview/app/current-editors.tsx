/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
'use client';
import { useEffect, useRef, useState, type ReactNode } from 'react';
import { EyeOff, ChevronDown, Image as ImageIcon } from 'lucide-react';
import {
  Card,
  FeatureTitle,
  LinkCard,
  Button,
  Toggle,
  Range,
  Field,
  useModel,
} from './current-ui';
import data from './current-editor-data.json';
import catalog from './current-catalog.json';
import { CurrentHealth } from './current-health';
import { CurrentStatusPreview } from './current-status-preview';
const definitions = data.defaults as Record<
  string,
  { key: string; default: unknown }
>;
export const k = (name: string) => definitions[name]?.key || name;
export const editorDefaults = Object.fromEntries(
  Object.values(definitions).map((d) => [
    d.key,
    typeof d.default === 'boolean'
      ? d.default
        ? '1'
        : '0'
      : String(d.default),
  ]),
);
export const editorTitles: Record<string, string> = {
  shoulder: '全应用肩键',
  ai_trigger: 'AI 触发器',
  fan_control: '风扇控制',
  combo_speed: '一键连招速度',
  freeform: '小窗增强',
  audio_gain: '音量增强',
  battery: '电池与循环次数',
  super_resolution: '超分破坏神',
  diablo_coexist: '超分与破坏神',
  double_app: '扩展应用双开',
  beautify: '主题无限期试用',
  signature_install: '签名不一致安装',
  store_download: '应用商店同时下载',
  mi_health: '步数修改',
  status_layout: '状态栏',
  launcher_custom: 'APP图标名称编辑',
  hide: '消失吧APP',
  hide_apps: '应用隐藏',
  automation: '自动隐藏',
  tile: '快捷磁贴',
  diagnostics: '运行诊断',
  detailed_diagnostics: '运行诊断',
};
function Feature({
  name,
  title,
  help,
  children,
}: {
  name: string;
  title: string;
  help?: string;
  children?: ReactNode;
}) {
  return (
    <Toggle
      name={k(name)}
      title={title}
      help={help || title + '的功能设置。关闭后恢复原有行为。'}
    >
      {children}
    </Toggle>
  );
}
function R({
  name,
  title,
  min,
  max,
  step = 1,
  suffix = '',
}: {
  name: string;
  title: string;
  min: number;
  max: number;
  step?: number;
  suffix?: string;
}) {
  return (
    <Range
      name={k(name)}
      title={title}
      min={min}
      max={max}
      step={step}
      initial={Number(editorDefaults[k(name)] || 0)}
      suffix={suffix}
    />
  );
}
const appList = [
  { name: '微信', pkg: 'com.tencent.mm' },
  { name: 'QQ', pkg: 'com.tencent.mobileqq' },
  { name: '哔哩哔哩', pkg: 'tv.danmaku.bili' },
  { name: '浏览器', pkg: 'cn.nubia.browser' },
  { name: '小米运动健康', pkg: 'com.mi.health' },
  { name: '相册', pkg: 'com.android.gallery3d' },
];
function AppPicker({
  multiple = false,
  chosen = [],
  finish,
}: {
  multiple?: boolean;
  chosen?: string[];
  finish: (apps: string[]) => void;
}) {
  const [q, search] = useState(''),
    [selection, select] = useState(chosen);
  const m = useModel();
  return (
    <>
      <input
        className="c-picker-search"
        aria-label="搜索名称或包名"
        placeholder="搜索名称或包名"
        value={q}
        onChange={(e) => search(e.target.value)}
      />
      {appList
        .filter((a) => (a.name + a.pkg).toLowerCase().includes(q.toLowerCase()))
        .map((a) => (
          <label className="c-check c-app-picker-row" key={a.pkg}>
            <input
              type={multiple ? 'checkbox' : 'radio'}
              name="app-picker"
              checked={selection.includes(a.pkg)}
              onChange={(e) => {
                if (multiple)
                  select(
                    e.target.checked
                      ? [...selection, a.pkg]
                      : selection.filter((x) => x !== a.pkg),
                  );
                else {
                  finish([a.pkg]);
                  m.close();
                }
              }}
            />
            <span>
              {a.name}
              <small>{a.pkg}</small>
            </span>
          </label>
        ))}
      <footer>
        {multiple && <button onClick={() => select([])}>清空选择</button>}
        <button onClick={m.close}>取消</button>
        {multiple && (
          <button
            onClick={() => {
              finish(selection);
              m.close();
            }}
          >
            确定
          </button>
        )}
      </footer>
    </>
  );
}
export function CurrentEditor({
  route,
  embedded = false,
}: {
  route: string;
  embedded?: boolean;
}) {
  const m = useModel();
  const feature = (
    name: string,
    title: string,
    help?: string,
    children?: ReactNode,
  ) => (
    <Feature name={name} title={title} help={help}>
      {children}
    </Feature>
  );
  const help = catalog.targets
    .flatMap((t) => t.entries)
    .find((e) => e.route === route)?.help;
  if (route === 'mi_health') return <CurrentHealth />;
  if (route === 'status_layout') return <StatusEditor embedded={embedded} />;
  if (route === 'launcher_custom') return <LauncherEditor />;
  if (route === 'shoulder') return <Shoulder />;
  if (route === 'fan_control') return <FanEditor />;
  if (['hide', 'hide_apps', 'automation', 'tile'].includes(route))
    return <HideEditor route={route} />;
  if (route === 'ai_trigger')
    return (
      <Card>
        {feature(
          'AI_TRIGGER_ENABLED',
          'AI 触发器极速响应',
          help,
          <>
            {[
              ['AI_TRIGGER_TEMPLATE_SCAN_MS', '模板扫描间隔（ms）', 80, 2000],
              ['AI_TRIGGER_CLICK_MS', '点击队列间隔（ms）', 10, 500],
              ['AI_TRIGGER_COOLDOWN_MS', '策略冷却（ms）', 50, 2000],
              ['AI_TRIGGER_YOLO_SCAN_MS', 'YOLO 扫描间隔（ms）', 150, 1500],
            ].map(([name, title, min, max]) => (
              <R
                key={name}
                name={String(name)}
                title={String(title)}
                min={Number(min)}
                max={Number(max)}
                suffix=" ms"
              />
            ))}
          </>,
        )}
      </Card>
    );
  if (route === 'combo_speed')
    return (
      <Card>
        {feature(
          'COMBO_SPEED_ENABLED',
          '一键连招速度',
          help,
          <R
            name="COMBO_SPEED_RATE"
            title="播放倍率（×）"
            min={1}
            max={10}
            suffix=" 倍"
          />,
        )}
      </Card>
    );
  if (route === 'freeform')
    return (
      <>
        <Card>
          {feature(
            'FREEFORM_UNLIMITED',
            '解除小窗数量上限',
            '允许同时创建并最小化超过三个自由窗口。',
          )}
        </Card>
        <Card>
          {feature(
            'FREEFORM_ALL_APPS',
            '全应用支持小窗',
            '普通应用可使用小窗；系统关键界面保持原厂保护。',
            <Button
              onClick={() =>
                m.dialog(
                  '遵循原厂小窗应用',
                  <AppPicker
                    multiple
                    chosen={(m.values[k('FREEFORM_EXCLUDED_APPS')] || '').split(
                      ',',
                    )}
                    finish={(apps) =>
                      m.set(k('FREEFORM_EXCLUDED_APPS'), apps.join(','))
                    }
                  />,
                )
              }
            >
              遵循原厂小窗应用（
              {
                (m.values[k('FREEFORM_EXCLUDED_APPS')] || '')
                  .split(',')
                  .filter(Boolean).length
              }{' '}
              个）
            </Button>,
          )}
        </Card>
      </>
    );
  if (route === 'audio_gain')
    return (
      <Card>
        {feature(
          'AUDIO_GAIN_ENABLED',
          '超过 100% 的音量',
          help,
          <>
            <R
              name="AUDIO_GAIN_STEP"
              title="每次按键增加的百分比"
              min={1}
              max={20}
              suffix="%"
            />
            {['扬声器', '有线 / USB 耳机', '蓝牙音频'].map((name, i) => (
              <Card key={name} label={name}>
                <FeatureTitle
                  title={name}
                  help="100% 为原厂上限，实际可用增益取决于当前播放通道。"
                />
                {['媒体', '铃声', '闹钟'].map((s, j) => (
                  <Range
                    key={s}
                    name={'audio:' + i + ':' + j}
                    title={s + '上限（%）'}
                    min={100}
                    max={300}
                    step={5}
                    initial={100}
                  />
                ))}
              </Card>
            ))}
          </>,
        )}
      </Card>
    );
  if (route === 'battery')
    return (
      <>
        <Card>
          {feature('BATTERY_DISABLE_AGE_REDUCTION', '持续关闭按循环降压', help)}
        </Card>
        <Card>
          <details className="c-data-disclosure">
            <summary>
              查看实际电池数据
              <ChevronDown size={18} />
            </summary>
            {[
              ['系统电量计完整循环', '171 次'],
              ['原厂最近历史记录', '171 次'],
              ['厂商独立累计字段', '1222'],
              ['当前满充估计', '7347 mAh'],
              ['设计容量', '8000 mAh'],
              ['容量估计比', '91.8%'],
              ['按循环降压配置', '原厂已启用'],
            ].map(([a, b]) => (
              <div className="c-key-value" key={a}>
                <span>{a}</span>
                <span>{b}</span>
              </div>
            ))}
            <FeatureTitle
              title="关于容量"
              help="容量估计比不代表其余容量被锁定。此功能只关闭已识别的按循环降压策略，不修改循环次数、不修复电池老化，温度、电流、电压保护仍然保留。"
            />
          </details>
        </Card>
      </>
    );
  if (route === 'super_resolution' || route === 'diablo_coexist')
    return (
      <>
        <Card>
          {feature(
            'SUPER_MIRROR_LOW_MODE',
            '性能模式超分',
            '允许其他性能模式开启超分辨率。',
          )}
        </Card>
        <Card>
          {feature(
            'SUPER_MIRROR_DIABLO_COEXIST',
            '超分与破坏神共存',
            '允许同时启用超分和破坏神模式。',
          )}
        </Card>
      </>
    );
  if (route === 'double_app')
    return (
      <Card>
        {feature('DOUBLE_ANY_APP', '扩展第三方 App 双开候选', help)}
        <hr />
        {feature(
          'DOUBLE_LOW_MEMORY',
          '移除低内存限制',
          '解除双开功能的低内存限制。',
        )}
      </Card>
    );
  if (route === 'beautify')
    return (
      <Card>{feature('BEAUTIFY_UNLIMITED_TRIAL', '无限期试用', help)}</Card>
    );
  if (route === 'signature_install')
    return (
      <Card>
        {feature(
          'ALLOW_SIGNATURE_MISMATCH',
          '允许安装签名不一致的应用',
          help +
            '\n开启后，覆盖安装的 APK 可能读取原应用的数据。请仅安装来源可信的 APK。',
        )}
      </Card>
    );
  if (route === 'store_download')
    return (
      <Card>
        {feature(
          'STORE_DOWNLOAD_ENABLED',
          '解除同时下载数量限制',
          help,
          <R
            name="STORE_DOWNLOAD_COUNT"
            title="允许同时下载数量"
            min={1}
            max={50}
          />,
        )}
      </Card>
    );
  return (
    <>
      <Card>
        <FeatureTitle
          title="详细诊断"
          help="按需记录对应功能的详细调用信息。"
        />
        {feature(
          'SHOULDER_DIAGNOSTICS',
          '肩键详细诊断',
          '记录肩键调用和连点运行信息。',
        )}
        {feature(
          'AI_TRIGGER_DIAGNOSTICS',
          'AI 触发器详细诊断',
          '记录模板、YOLO、扫描与点击执行信息。',
        )}
      </Card>
      <Card>
        <FeatureTitle
          title="日志"
          help="收集设备与模块信息、Hook 接入状态、运行结果和错误。"
        />
        <Button
          onClick={() => {
            const b = new Blob(
              [
                'LS_Augment 网页原型 · 诊断示例\n版本 test20288\n' +
                  JSON.stringify(m.values, null, 2),
              ],
              { type: 'text/plain' },
            );
            const u = URL.createObjectURL(b),
              a = document.createElement('a');
            a.href = u;
            a.download = 'LS_Augment-prototype-logs.txt';
            a.click();
            setTimeout(() => URL.revokeObjectURL(u), 1000);
            m.tell('已导出网页诊断示例');
          }}
        >
          导出日志
        </Button>
        <p className="c-note">
          导出设备与模块信息、Hook
          接入状态、最近运行结果和错误。开启详细诊断后，一并包含对应功能的调用过程，帮助排查是否成功接入、是否触发及实际执行情况。
        </p>
        <p className="c-note">
          排查时先开启对应详细诊断，按页面右上角重启作用域，复现问题后再导出。
        </p>
      </Card>
    </>
  );
}
function Shoulder() {
  const m = useModel(),
    [stage, setStage] = useState(0),
    [testVisible, showTest] = useState(false);
  const passed = m.values['prototype:rapid-compatible'] === '1';
  return (
    <>
      <Card>
        <Feature
          name="SHOULDER_ENABLED"
          title="全应用肩键"
          help="对加入游戏空间的所有应用开放肩键使用"
        />
        <hr />
        <Toggle
          name={k('TGK_RAPID_FIRE_ENABLED')}
          title="极速连点"
          help="通过当前设备的兼容性测试后，开启此功能以配置实体肩键连点频率。"
          disabled={!passed}
        >
          <R
            name="TGK_RAPID_FIRE_COUNT"
            title="点击频率"
            min={10}
            max={50}
            suffix=" 次/秒"
          />
        </Toggle>
        {!passed && (
          <Button
            onClick={() => {
              showTest(true);
              setStage(0);
            }}
          >
            兼容性测试
          </Button>
        )}
      </Card>
      {testVisible && !passed && (
        <Card>
          <FeatureTitle
            title="极速连点兼容性测试"
            help="自动核验系统、调用链和原生库，再按左、右肩键分别记录实体码、中上层码与系统码。网页使用演示输入。"
          />
          <p className="c-note">
            {
              [
                '预检完成，等待开始左肩键测试。',
                '等待左肩键输入。',
                '左肩键已识别，等待右肩键输入。',
                '左右肩键已识别，准备稳定性验证。',
                '稳定性验证通过。通过测试只解锁开关，不会自动开启极速连点。',
              ][stage]
            }
          </p>
          <div className="c-buttons">
            {stage < 4 && (
              <Button
                onClick={() => {
                  if (stage === 3) m.set('prototype:rapid-compatible', '1');
                  setStage((n) => n + 1);
                }}
              >
                {
                  [
                    '开始测试左肩键',
                    '模拟按下左肩键',
                    '模拟按下右肩键',
                    '开始稳定性验证',
                  ][stage]
                }
              </Button>
            )}
            <Button onClick={() => showTest(false)}>
              {stage === 4 ? '完成' : '取消测试'}
            </Button>
          </div>
        </Card>
      )}
    </>
  );
}
function FanMeasurement() {
  const m = useModel(),
    [stage, setStage] = useState(0);
  useEffect(() => {
    if (stage < 1 || stage > 5) return;
    const t = setTimeout(() => {
      if (stage === 5) {
        m.set('prototype:fan-measured', '1');
        m.set('prototype:fan-measured-at', new Date().toLocaleString('zh-CN'));
      }
      setStage(stage + 1);
    }, 650);
    return () => clearTimeout(t);
  }, [stage, m]);
  return (
    <>
      <p>
        {stage === 0
          ? '请先打开原厂风扇。检测约 1 分钟，完成后恢复原档位；关闭风扇或取消即可停止。'
          : stage === 6
            ? '检测完成，已恢复原厂档位。结果已显示在页面。'
            : '正在检测第 ' +
              stage +
              ' / 5 档，采样 3 / 5。取消将停止并恢复原档位。'}
      </p>
      <p className="c-note">网页模拟检测进度。</p>
      <footer>
        <button onClick={m.close}>{stage === 6 ? '完成' : '取消'}</button>
        {stage === 0 && <button onClick={() => setStage(1)}>开始检测</button>}
      </footer>
    </>
  );
}
function FanEditor() {
  const m = useModel(),
    measured = m.values['prototype:fan-measured'] === '1';
  return (
    <>
      <Card>
        <Feature
          name="FAN_FIXED_ENABLED"
          title="固定风扇转速"
          help="跟随原厂风扇开关，匹配最接近的实测档位；不会自行启动风扇。"
        >
          {measured ? (
            <R
              name="FAN_TARGET_RPM"
              title="目标转速 RPM"
              min={4680}
              max={20680}
              suffix=" RPM"
            />
          ) : (
            <div className="c-range">
              <FeatureTitle
                title="目标转速 RPM"
                help="需先测量本机转速，再匹配最接近的实测档位。"
              />
              <small>请先测量本机各档转速</small>
              <input
                aria-label="目标转速 RPM"
                type="range"
                min={500}
                max={500}
                value={500}
                disabled
              />
            </div>
          )}
        </Feature>
      </Card>
      <Card>
        <Feature
          name="FAN_UNLOCK_MAX"
          title="解除原厂极限转速限制"
          help="允许使用已验证驱动的第 5 档；跟随原厂极速模式，不自行启动风扇。"
        />
      </Card>
      <Card>
        <FeatureTitle
          title="本机转速测量"
          help="依次检测 1～5 档，完成后恢复原厂档位。结果用于选择固定转速。"
        />
        <p className="c-fan-summary">
          {'红魔 11 Pro / 11S Pro 官方标称：24,000 RPM\n已验证驱动最高档：5（同时调用原厂最高性能模式）\n' +
            (measured
              ? '最近测量：' +
                m.values['prototype:fan-measured-at'] +
                '（网页示例）\n最高档稳定转速：20680 RPM\n本轮最高反馈：20760 RPM\n' +
                [4680, 9160, 13325, 16880, 20680]
                  .map((rpm, i) => i + 1 + ' 档：' + rpm + ' RPM')
                  .join('\n')
              : '本机实测：尚未测量')}
        </p>
        <Button
          onClick={() => m.dialog('检测本机风扇转速', <FanMeasurement />)}
        >
          检测本机风扇转速
        </Button>
      </Card>
    </>
  );
}
function LayoutGate({
  embedded,
  children,
}: {
  embedded: boolean;
  children: ReactNode;
}) {
  return embedded ? (
    <>{children}</>
  ) : (
    <Feature
      name="SYSTEMUI_MASTER"
      title="启用状态栏增强"
      help="启用本页配置的状态栏布局。"
    >
      {children}
    </Feature>
  );
}
function StatusEditor({ embedded = false }: { embedded?: boolean }) {
  const m = useModel(),
    [tab, setTab] = useState('布局');
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
    ],
    labels = [
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
  const defZones = [2, 2, 8, 8, 1, 1, 4, 7, 7, 5];
  const val = (key: string, d: string) =>
    key === k('STATUSBAR_NETWORK_DISPLAY') &&
    ![1, 2, 3, 4].includes(Number(m.values[key]))
      ? m.values[k('STATUSBAR_NETWORK_TWO_ROWS')] === '0'
        ? '3'
        : '4'
      : (m.values[key] ?? d);
  const dual = (id: string) =>
    id === 'clock'
      ? val(k('STATUSBAR_CLOCK_ROWS'), '2') === '2'
      : id === 'network'
        ? val(k('STATUSBAR_NETWORK_DISPLAY'), '4') === '4'
        : id === 'notifications'
          ? val(k('STATUSBAR_NOTIFICATION_TWO_ROWS'), '1') === '1'
          : id === 'system_icons' &&
            val(k('STATUSBAR_SYSTEM_TWO_ROWS'), '1') === '1';
  const reset = () => {
    Object.keys(m.values)
      .filter((key) => key.includes('statusbar'))
      .forEach((key) => m.set(key, editorDefaults[key] || ''));
    m.set(k('SYSTEMUI_MASTER'), '0');
    ids.forEach((id, i) => {
      m.set('status:' + id + ':on', i < 4 ? '1' : '0');
      m.set('status:' + id + ':zone', String(defZones[i]));
      m.set('status:' + id + ':size', String(i < 4 ? 13 : 9));
      m.set('status:' + id + ':order', String(i));
    });
    m.tell('状态栏已恢复默认');
  };
  const component = (id: string) => {
    const i = ids.indexOf(id),
      name = labels[i],
      paired = dual(id),
      zone = Number(val('status:' + id + ':zone', String(defZones[i])));
    return (
      <Card key={id}>
        <Toggle
          name={'status:' + id + ':on'}
          initial={i < 4 ? '1' : '0'}
          title={name}
          help={'设置' + name + '在状态栏中的显示区域、大小及区内顺序。'}
        >
          {id === 'clock' && (
            <label className="c-choice">
              <span>显示排数</span>
              <select
                aria-label="显示排数"
                value={val(k('STATUSBAR_CLOCK_ROWS'), '2')}
                onChange={(e) => {
                  m.set(k('STATUSBAR_CLOCK_ROWS'), e.target.value);
                  if (e.target.value === '2')
                    m.set(
                      'status:clock:zone',
                      String(Math.floor(zone / 3) * 3 + 2),
                    );
                }}
              >
                <option value="1">单排</option>
                <option value="2">双排</option>
              </select>
            </label>
          )}
          {id === 'network' && (
            <label className="c-choice">
              <span>显示方式</span>
              <select
                aria-label="网速显示方式"
                value={val(k('STATUSBAR_NETWORK_DISPLAY'), '4')}
                onChange={(e) =>
                  m.set(k('STATUSBAR_NETWORK_DISPLAY'), e.target.value)
                }
              >
                {[
                  '单排仅上传网速',
                  '单排仅下载网速',
                  '单排上行/下行',
                  '双排上行/下行',
                ].map((n, i) => (
                  <option key={n} value={i + 1}>
                    {n}
                  </option>
                ))}
              </select>
            </label>
          )}
          {['notifications', 'system_icons'].includes(id) && (
            <Toggle
              name={k(
                id === 'notifications'
                  ? 'STATUSBAR_NOTIFICATION_TWO_ROWS'
                  : 'STATUSBAR_SYSTEM_TWO_ROWS',
              )}
              initial="1"
              title={name + '分两排'}
            />
          )}
          <label className="c-choice">
            <span>显示区域</span>
            <select
              aria-label={name + '显示区域'}
              value={paired ? Math.floor(zone / 3) * 3 + 2 : zone}
              onChange={(e) => m.set('status:' + id + ':zone', e.target.value)}
            >
              {(paired ? [2, 5, 8] : [0, 1, 2, 3, 4, 5, 6, 7, 8]).map(
                (v, i) => (
                  <option key={v} value={v}>
                    {paired
                      ? [
                          '左侧（上下两排）',
                          '中间（上下两排）',
                          '右侧（上下两排）',
                        ][i]
                      : zones[v]}
                  </option>
                ),
              )}
            </select>
          </label>
          <Range
            name={'status:' + id + ':size'}
            title={name + '大小'}
            min={6}
            max={32}
            initial={i < 4 ? 13 : 9}
          />
          <Range
            name={'status:' + id + ':order'}
            title="区内顺序"
            min={0}
            max={20}
            initial={i}
          />
        </Toggle>
      </Card>
    );
  };
  return (
    <>
      <div className="c-status-fixed">
        <CurrentStatusPreview values={m.values} />
        <div className="c-tabs" role="tablist" aria-label="状态栏配置分类">
          {['布局', '时钟', '硬件 / 网速', '图标'].map((t) => (
            <button
              key={t}
              role="tab"
              aria-selected={tab === t}
              onClick={() => {
                setTab(t);
                const scroll = document.querySelector('.c-status-scroll');
                if (scroll) scroll.scrollTop = 0;
              }}
            >
              {t}
            </button>
          ))}
        </div>
      </div>
      <div className="c-status-fields" role="tabpanel" aria-label={tab}>
        {tab === '布局' ? (
          <Card>
            <LayoutGate embedded={embedded}>
              {[
                ['STATUSBAR_HEIGHT_DP', '状态栏高度（0 跟随系统）', 80],
                ['STATUSBAR_LEFT_MARGIN_DP', '左侧留白', 40],
                ['STATUSBAR_RIGHT_MARGIN_DP', '右侧留白', 40],
                ['STATUSBAR_TOP_MARGIN_DP', '顶部留白', 12],
                ['STATUSBAR_BOTTOM_MARGIN_DP', '底部留白', 12],
                ['STATUSBAR_DUAL_ROW_GAP_DP', '两排间距', 8],
              ].map(([name, title, max]) => (
                <R
                  key={name}
                  name={String(name)}
                  title={String(title)}
                  min={0}
                  max={Number(max)}
                />
              ))}
            </LayoutGate>
          </Card>
        ) : tab === '时钟' ? (
          <>
            {component('clock')}
            <Card>
              <Feature
                name="STATUSBAR_CLOCK_CUSTOM"
                title="自定义时钟文字"
                help="开启后使用自定义格式，可设置时间、星期、农历及时段。"
              >
                <div className="c-buttons">
                  {['单行', '双行'].map((s, i) => (
                    <Button
                      key={s}
                      onClick={() => {
                        m.set(k('STATUSBAR_CLOCK_ROWS'), String(i + 1));
                        m.set(k('STATUSBAR_CLOCK_PATTERN'), 'HH:mm');
                        m.set(
                          k('STATUSBAR_CLOCK_PATTERN_SECOND'),
                          i ? 'MM/dd E' : '',
                        );
                      }}
                    >
                      {s}
                    </Button>
                  ))}
                </div>
                <Field
                  name={k('STATUSBAR_CLOCK_PATTERN')}
                  title="第一行格式，例如 HH:mm"
                />
                <Field
                  name={k('STATUSBAR_CLOCK_PATTERN_SECOND')}
                  title="第二行格式，留空为单行"
                />
                <FeatureTitle
                  title="时间格式说明"
                  help="HH：24小时；hh：12小时。固定文字使用单引号。N 农历月，NN 月干支，NNN 完整农历日期，NNNN 日期与节气，e 农历日，Y 干支年，A 生肖，t 节气，I 时辰地支，II 时干支，aa 中文时段。"
                />
                {[
                  ['STATUSBAR_CLOCK_24H', '默认使用 24 小时制'],
                  ['STATUSBAR_CLOCK_SECONDS', '默认显示秒'],
                  ['STATUSBAR_CLOCK_PERIOD', '默认显示时段'],
                  ['STATUSBAR_CLOCK_WEEK', '默认显示星期'],
                ].map(([n, t]) => (
                  <Feature key={n} name={n} title={t} />
                ))}
                <details>
                  <summary>
                    <FeatureTitle
                      title="字体与排版"
                      help="调整字体、字号、间距和对齐；关闭自定义时钟后恢复原厂字体。"
                    />
                  </summary>
                  <Field
                    name={k('STATUSBAR_CLOCK_FONT_FAMILY')}
                    title="字体名称（sans-serif / serif / monospace）"
                    initial="sans-serif"
                    maxLength={40}
                  />
                  {[
                    [
                      'STATUSBAR_CLOCK_SIZE_SP',
                      '单独字号 sp（0 使用上方大小）',
                      0,
                      40,
                    ],
                    ['STATUSBAR_CLOCK_WEIGHT', '字重（100–900）', 100, 900],
                    [
                      'STATUSBAR_CLOCK_LETTER_SPACING',
                      '字间距（-0.20 至 1.00）',
                      -0.2,
                      1,
                    ],
                    [
                      'STATUSBAR_CLOCK_LINE_SPACING_DP',
                      '两行额外间距 dp（0–32）',
                      0,
                      32,
                    ],
                    [
                      'STATUSBAR_CLOCK_WIDTH_DP',
                      '固定宽度 dp（0 自动）',
                      0,
                      240,
                    ],
                  ].map(([n, t, min, max]) => (
                    <Field
                      key={n}
                      name={k(String(n))}
                      title={String(t)}
                      type="number"
                      min={+min}
                      max={+max}
                      initial={editorDefaults[k(String(n))]}
                      decimal={[
                        'STATUSBAR_CLOCK_SIZE_SP',
                        'STATUSBAR_CLOCK_LETTER_SPACING',
                        'STATUSBAR_CLOCK_LINE_SPACING_DP',
                      ].includes(String(n))}
                    />
                  ))}
                  <label className="c-choice">
                    <span>文字对齐</span>
                    <select
                      aria-label="文字对齐"
                      value={
                        m.values[k('STATUSBAR_CLOCK_TEXT_ALIGN')] || 'center'
                      }
                      onChange={(e) =>
                        m.set(k('STATUSBAR_CLOCK_TEXT_ALIGN'), e.target.value)
                      }
                    >
                      <option value="left">靠左</option>
                      <option value="center">居中</option>
                      <option value="right">靠右</option>
                    </select>
                  </label>
                  <p className="c-note">
                    单独字号大于 0
                    时优先使用；拖动上方大小后重新跟随，空间不足时仍会缩小。
                  </p>
                </details>
              </Feature>
            </Card>
          </>
        ) : tab === '硬件 / 网速' ? (
          <>
            <p className="c-note">
              CPU、GPU、电池可分别开关并分别设置区域、大小与顺序。
            </p>
            {ids.slice(4).map(component)}
          </>
        ) : (
          <>
            <p className="c-note">
              双排图标统一使用状态栏的上下两排，可选择左侧、中间或右侧；间距跟随布局页设置。
            </p>
            {ids.slice(1, 4).map(component)}
            <R
              name="STATUSBAR_NOTIFICATION_MAX"
              title="通知数量（0 跟随系统）"
              min={0}
              max={20}
            />
          </>
        )}
        <Button onClick={reset}>恢复默认</Button>
      </div>
    </>
  );
}
function LauncherEditor() {
  const m = useModel(),
    [space, setSpace] = useState('0'),
    [app, setApp] = useState(''),
    [name, setName] = useState(''),
    [picture, setPicture] = useState(''),
    file = useRef<HTMLInputElement>(null);
  const id = 'launcher:' + space + ':' + app;
  return (
    <>
      <p className="c-note">先选择空间和应用，再修改名称或图标。</p>
      <Card>
        <FeatureTitle
          title="用户空间"
          help="每个用户空间分别保存应用名称和图标。"
        />
        <select
          className="c-picker-search"
          aria-label="用户空间"
          value={space}
          onChange={(e) => {
            setSpace(e.target.value);
            setApp('');
            setName('');
            setPicture('');
          }}
        >
          <option value="0">机主 · 空间 0</option>
          <option value="999">Mix11 · 空间 999</option>
        </select>
        <Button
          onClick={() =>
            m.dialog(
              '选择要修改的应用',
              <AppPicker
                finish={(apps) => {
                  setApp(apps[0]);
                  const key = 'launcher:' + space + ':' + apps[0];
                  setName(m.values[key + ':name'] || '');
                  setPicture(m.values[key + ':picture'] || '');
                }}
              />,
            )
          }
        >
          选择应用
        </Button>
      </Card>
      <Card>
        <FeatureTitle title="应用图标" help="选择图片并裁剪后自动保存。" />
        <button
          className="c-picture"
          aria-label="选择应用图标"
          onClick={() => (app ? file.current?.click() : m.tell('请先选择应用'))}
        >
          {picture ? (
            <img src={picture} alt="应用图标" />
          ) : (
            <ImageIcon size={56} />
          )}
        </button>
        <p className="c-note">
          {app
            ? appList.find((a) => a.pkg === app)?.name + '\n' + app
            : '尚未选择应用'}
        </p>
        <input
          hidden
          ref={file}
          type="file"
          accept="image/*"
          onChange={(e) => {
            const f = e.target.files?.[0];
            if (!f) return;
            if (f.size > 4_000_000) {
              m.tell('请选择小于4MB的图片');
              return;
            }
            const r = new FileReader();
            r.onload = () =>
              m.dialog(
                '裁剪图片',
                <CropImage
                  image={typeof r.result === 'string' ? r.result : ''}
                  save={(src) => {
                    setPicture(src);
                    m.set(id + ':picture', src);
                    m.close();
                  }}
                />,
              );
            r.readAsDataURL(f);
            e.target.value = '';
          }}
        />
        <FeatureTitle title="应用名称" help="名称留空即可恢复原名。" />
        <input
          className="c-picker-search"
          aria-label="自定义名称"
          placeholder="自定义名称，留空恢复原名"
          value={name}
          maxLength={80}
          disabled={!app}
          onChange={(e) => {
            setName(e.target.value);
            m.set(id + ':name', e.target.value);
          }}
        />
        <Button
          onClick={() => {
            setPicture('');
            if (app) m.set(id + ':picture', '');
          }}
        >
          恢复原图标
        </Button>
      </Card>
    </>
  );
}
function CropImage({
  image,
  save,
}: {
  image: string;
  save: (s: string) => void;
}) {
  const [zoom, setZoom] = useState(1),
    [offset, setOffset] = useState({ x: 0, y: 0 }),
    drag = useRef<{ x: number; y: number } | null>(null),
    img = useRef<HTMLImageElement>(null);
  return (
    <>
      <p>拖动图片调整位置，缩放后使用这张图片。</p>
      <div
        className="c-crop"
        onPointerDown={(e) => {
          drag.current = { x: e.clientX - offset.x, y: e.clientY - offset.y };
          e.currentTarget.setPointerCapture(e.pointerId);
        }}
        onPointerMove={(e) => {
          if (drag.current)
            setOffset({
              x: e.clientX - drag.current.x,
              y: e.clientY - drag.current.y,
            });
        }}
        onPointerUp={() => (drag.current = null)}
      >
        <img
          ref={img}
          src={image}
          draggable={false}
          alt="裁剪预览"
          style={{
            transform: `translate(${offset.x}px,${offset.y}px) scale(${zoom})`,
          }}
        />
      </div>
      <label className="c-range">
        缩放
        <input
          aria-label="图片缩放"
          type="range"
          min={1}
          max={8}
          step={0.01}
          value={zoom}
          onChange={(e) => setZoom(+e.target.value)}
        />
      </label>
      <Button
        onClick={() => {
          const c = document.createElement('canvas');
          c.width = c.height = 512;
          const x = c.getContext('2d')!,
            im = img.current!,
            base = Math.max(260 / im.naturalWidth, 260 / im.naturalHeight);
          x.fillStyle = 'white';
          x.fillRect(0, 0, 512, 512);
          x.translate(
            256 + (offset.x * 512) / 260,
            256 + (offset.y * 512) / 260,
          );
          x.scale((base * zoom * 512) / 260, (base * zoom * 512) / 260);
          x.drawImage(im, -im.naturalWidth / 2, -im.naturalHeight / 2);
          save(c.toDataURL('image/png'));
        }}
      >
        使用这张图片
      </Button>
      <CancelCrop />
    </>
  );
}
function HideEditor({ route }: { route: string }) {
  const m = useModel(),
    [space, setSpace] = useState('0'),
    [expanded, expand] = useState(false),
    [query, setQuery] = useState(''),
    [sort, setSort] = useState(false),
    file = useRef<HTMLInputElement>(null);
  const selected = (m.values['hide:' + space + ':apps'] || '')
    .split(',')
    .filter(Boolean);
  const simulate = (hide: boolean) => {
    ['0', '999'].forEach((s) =>
      (m.values['hide:' + s + ':apps'] || '')
        .split(',')
        .filter(Boolean)
        .forEach((pkg) =>
          m.set('hide:' + s + ':state:' + pkg, hide ? '1' : '0'),
        ),
    );
    m.tell('原型演示：已' + (hide ? '隐藏' : '显示') + '所有已配置应用');
  };
  if (route === 'hide')
    return (
      <>
        {[
          ['应用管理', '按空间选择应用，管理隐藏与恢复。', 'hide_apps'],
          ['自动隐藏', '设置锁屏后自动隐藏应用。', 'automation'],
          ['快捷磁贴', '从快捷设置切换应用隐藏状态。', 'tile'],
        ].map(([title, help, r]) => (
          <LinkCard key={r} title={title} help={help} route={r} />
        ))}
      </>
    );
  if (route === 'automation')
    return (
      <Card>
        <Feature
          name="AUTOMATION_ENABLED"
          title="启用锁屏自动隐藏"
          help="由LSPosed监听，当锁屏时自动隐藏指定应用"
        >
          <Toggle
            name="hide:all-spaces"
            title="处理所有已配置空间"
            help="关闭时只处理当前正在使用的空间。"
          />
        </Feature>
      </Card>
    );
  if (route === 'tile')
    return (
      <Card>
        <FeatureTitle
          title="快捷设置磁贴"
          help="点击磁贴切换隐藏状态；混合或异常状态优先恢复全部显示。"
        />
        <FeatureTitle title="磁贴图片" help="图片选择并裁剪后立即保存。" />
        <button
          className="c-picture"
          aria-label="磁贴图片"
          onClick={() => file.current?.click()}
        >
          {m.values['tile:picture'] ? (
            <img src={m.values['tile:picture']} alt="磁贴图片" />
          ) : (
            <EyeOff size={52} />
          )}
        </button>
        <input
          ref={file}
          type="file"
          hidden
          accept="image/*"
          onChange={(e) => {
            const f = e.target.files?.[0];
            if (!f) return;
            const r = new FileReader();
            r.onload = () =>
              m.dialog(
                '裁剪图片',
                <CropImage
                  image={typeof r.result === 'string' ? r.result : ''}
                  save={(s) => {
                    m.set('tile:picture', s);
                    m.close();
                  }}
                />,
              );
            r.readAsDataURL(f);
            e.target.value = '';
          }}
        />
        <div className="c-buttons">
          <Button onClick={() => file.current?.click()}>选择图片</Button>
          <Button onClick={() => m.set('tile:picture', '')}>
            恢复默认图片
          </Button>
        </div>
        <Field
          name={k('TILE_LABEL')}
          title="磁贴名称"
          initial="LS_Augment"
          maxLength={30}
        />
        <Field
          name={k('TILE_DESCRIPTION')}
          title="磁贴说明"
          initial="应用隐藏"
          maxLength={60}
        />
        <Button
          onClick={() =>
            m.dialog(
              '添加快捷设置磁贴',
              <>
                <p>
                  {m.values[k('TILE_LABEL')] || 'LS_Augment'}
                  {'\n'}
                  {m.values[k('TILE_DESCRIPTION')] || '应用隐藏'}
                </p>
                <footer>
                  <button onClick={m.close}>取消</button>
                  <button
                    onClick={() => {
                      m.close();
                      m.tell('原型演示：LS_Augment 磁贴已添加');
                    }}
                  >
                    添加
                  </button>
                </footer>
              </>,
            )
          }
        >
          添加到快捷设置
        </Button>
      </Card>
    );
  return (
    <>
      <Card>
        <Feature
          name="HIDE_MASTER"
          title="启用隐藏管理"
          help="关闭不会自动恢复现有隐藏状态。"
        >
          <Card>
            <FeatureTitle title="选择空间" help="每个空间分别保存应用清单。" />
            <div className="c-buttons">
              {[
                ['0', '机主 · 空间 0'],
                ['999', 'Mix11 · 空间 999'],
              ].map(([n, s]) => (
                <Button
                  key={n}
                  onClick={() => {
                    setSpace(n);
                    expand(false);
                    setQuery('');
                  }}
                >
                  {space === n ? '✓ ' : ''}
                  {s}
                </Button>
              ))}
            </div>
            <p className="c-note">当前空间 {space} · 已核验</p>
          </Card>
          <Card>
            <FeatureTitle
              title="立即操作"
              help="使用所有空间中已保存的目标进行隐藏或显示。"
            />
            <div className="c-buttons">
              <Button
                onClick={() =>
                  m.dialog(
                    '隐藏全部',
                    <>
                      <p>将停止并隐藏所有空间中的已保存目标。</p>
                      <footer>
                        <button onClick={m.close}>取消</button>
                        <button
                          onClick={() => {
                            simulate(true);
                            m.close();
                          }}
                        >
                          继续
                        </button>
                      </footer>
                    </>,
                  )
                }
              >
                全部隐藏
              </Button>
              <Button onClick={() => simulate(false)}>全部显示</Button>
            </div>
          </Card>
          <Card>
            <FeatureTitle
              title="选择应用"
              help="只支持用户安装的应用；已勾选项显示在列表最前面。"
            />
            <p className="c-note">
              空间 {space} · 可选 {appList.length} 个 · 已勾选 {selected.length}{' '}
              个
            </p>
            <Button onClick={() => expand(!expanded)}>
              {expanded ? '收起应用列表' : '管理应用（' + appList.length + '）'}
            </Button>
            {expanded && (
              <>
                <input
                  className="c-picker-search"
                  aria-label="搜索名称或包名"
                  placeholder="搜索名称或包名"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                />
                <Button onClick={() => setSort(!sort)}>
                  {sort ? '按安装时间排序' : '按名称排序'}
                </Button>
                {[...appList]
                  .filter((a) =>
                    (a.name + a.pkg)
                      .toLowerCase()
                      .includes(query.toLowerCase()),
                  )
                  .sort(
                    (a, b) =>
                      Number(selected.includes(b.pkg)) -
                        Number(selected.includes(a.pkg)) ||
                      (sort
                        ? b.pkg.localeCompare(a.pkg)
                        : a.name.localeCompare(b.name, 'zh')),
                  )
                  .map((a) => (
                    <div className="c-app-picker-row" key={a.pkg}>
                      <label className="c-check">
                        <input
                          type="checkbox"
                          checked={selected.includes(a.pkg)}
                          onChange={(e) =>
                            m.set(
                              'hide:' + space + ':apps',
                              (e.target.checked
                                ? [...selected, a.pkg]
                                : selected.filter((x) => x !== a.pkg)
                              ).join(','),
                            )
                          }
                        />
                        <span>
                          {a.name}
                          <small>{a.pkg} · 第三方</small>
                          <small>
                            {m.values['hide:' + space + ':state:' + a.pkg] ===
                            '1'
                              ? '已隐藏'
                              : '已显示'}
                          </small>
                        </span>
                      </label>
                      {selected.includes(a.pkg) && (
                        <div className="c-buttons">
                          <Button
                            onClick={() =>
                              m.set('hide:' + space + ':state:' + a.pkg, '1')
                            }
                          >
                            隐藏
                          </Button>
                          <Button
                            onClick={() =>
                              m.set('hide:' + space + ':state:' + a.pkg, '0')
                            }
                          >
                            显示
                          </Button>
                        </div>
                      )}
                    </div>
                  ))}
              </>
            )}
          </Card>
        </Feature>
      </Card>
      <Card>
        <FeatureTitle
          title="恢复应用"
          help="恢复全部已选应用，不删除应用数据。"
        />
        <Button
          onClick={() =>
            m.dialog(
              '紧急恢复',
              <>
                <p>将显示全部已配置目标，不会删除应用数据。</p>
                <footer>
                  <button onClick={m.close}>取消</button>
                  <button
                    onClick={() => {
                      simulate(false);
                      m.close();
                    }}
                  >
                    继续
                  </button>
                </footer>
              </>,
            )
          }
        >
          紧急恢复
        </Button>
      </Card>
    </>
  );
}

function CancelCrop() {
  const m = useModel();
  return (
    <footer>
      <button onClick={m.close}>取消</button>
    </footer>
  );
}
