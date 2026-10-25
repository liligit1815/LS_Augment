/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
'use client';
import { useEffect, useId, useRef, useState, type ReactNode } from 'react';
import { EyeOff, ChevronDown, Image as ImageIcon, AppWindow } from 'lucide-react';
import {
  Card,
  FeatureTitle,
  Button,
  Toggle,
  Range,
  Field,
  useModel,
  useDisclosure,
} from './current-ui';
import data from './current-editor-data.json';
import catalog from './current-catalog.json';
import { NativeSelect } from './current-native-controls';
import { CurrentHealth } from './current-health';
import { LatestStatusEditor } from './current-status-editor';
import { runtimeState } from './current-runtime';
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
  rapid_compatibility: '兼容性测试',
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
  hide: '四大皆空',
  hide_apps: '应用隐藏',
  automation: '自动隐藏',
  tile: '快捷磁贴',
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
function EditorSection({
  embedded = false,
  children,
}: {
  embedded?: boolean;
  children: ReactNode;
}) {
  return embedded ? <div className="c-feature">{children}</div> : <Card>{children}</Card>;
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
  if (route === 'status_layout') return <LatestStatusEditor />;
  if (route === 'launcher_custom') return <LauncherEditor embedded={embedded} />;
  if (route === 'shoulder') return <Shoulder embedded={embedded} />;
  if (route === 'rapid_compatibility') return <RapidCompatibility />;
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
      <EditorSection embedded={embedded}>
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
      </EditorSection>
    );
  if (route === 'freeform')
    return (
      <Card className="c-feature-group d-setting-group" label="小窗增强">
        <div className="c-feature">{feature('FREEFORM_GAME_LOGIN','登录跳转以小窗打开','所有应用跳转登录授权页面时使用小窗。')}</div>
        <div className="c-feature">{feature('FREEFORM_EXTERNAL_APPS','打开第三方应用以小窗打开','从前台应用跳转其他第三方应用时使用小窗。')}</div>
        <div className="c-feature">
          {feature(
            'FREEFORM_UNLIMITED',
            '解除小窗数量上限',
            '允许同时创建并最小化超过三个自由窗口。',
          )}
        </div>
        <div className="c-feature">
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
        </div>
      </Card>
    );
  if (route === 'audio_gain')
    return (
      <EditorSection embedded={embedded}>
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
      </EditorSection>
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
        <EditorSection embedded={embedded}>
          {feature(
            'SUPER_MIRROR_LOW_MODE',
            '性能模式超分',
            '允许其他性能模式开启超分辨率。',
          )}
        </EditorSection>
        <EditorSection embedded={embedded}>
          {feature(
            'SUPER_MIRROR_DIABLO_COEXIST',
            '超分与破坏神共存',
            '允许同时启用超分和破坏神模式。',
          )}
        </EditorSection>
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
      <EditorSection embedded={embedded}>
        {feature(
          'ALLOW_SIGNATURE_MISMATCH',
          '允许安装签名不一致的应用',
          help +
            '\n开启后，覆盖安装的 APK 可能读取原应用的数据。请仅安装来源可信的 APK。',
        )}
      </EditorSection>
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
  return <p className="c-note">此页面不可用。</p>;
}

function Shoulder({ embedded = false }: { embedded?: boolean }) {
  const m = useModel();
  const passed = m.values['prototype:rapid-compatible'] === '1';
  return (
    <>
      <EditorSection embedded={embedded}>
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
          beforeEnable={() => {
            if (passed) return true;
            m.tell('请先进入兼容性测试');
            m.go('rapid_compatibility');
            return false;
          }}
        >
          <R
            name="TGK_RAPID_FIRE_COUNT"
            title="点击频率"
            min={10}
            max={50}
            suffix=" 次/秒"
          />
        </Toggle>
      </EditorSection>
    </>
  );
}
function RapidCompatibility() {
  const m = useModel(),
    [stage, setStage] = useState(
      m.values['prototype:rapid-compatible'] === '1' ? 5 : 0,
    );
  return (
    <Card>
      <p className="c-note">
        {
          [
            '请先开始兼容性测试，再按提示验证左、右实体肩键。网页使用演示输入。',
            '预检完成，等待开始左肩键测试。',
            '等待左肩键输入。',
            '左肩键已识别，等待右肩键输入。',
            '左右肩键已识别，准备稳定性验证。',
            '稳定性验证通过。通过测试只解锁开关，不会自动开启极速连点。',
          ][stage]
        }
      </p>
      <div className="c-buttons">
        {stage < 5 && (
          <Button
            onClick={() => {
              if (stage === 4) m.set('prototype:rapid-compatible', '1');
              setStage((n) => n + 1);
            }}
          >
            {
              [
                '开始兼容性测试',
                '开始测试左肩键',
                '模拟按下左肩键',
                '模拟按下右肩键',
                '开始稳定性验证',
              ][stage]
            }
          </Button>
        )}
        <Button onClick={() => m.go('group/game/shoulder')}>
          {stage === 5 ? '完成' : stage === 0 ? '返回' : '取消测试'}
        </Button>
      </div>
    </Card>
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
    measured = m.values['prototype:fan-measured'] === '1',
    fixedLevel = m.values[k('FAN_FIXED_LEVEL')];
  useEffect(() => {
    const level = Number(fixedLevel ?? '1');
    if (!Number.isInteger(level) || level < 1 || level > 5) {
      m.set(k('FAN_FIXED_LEVEL'), '1');
    }
  }, [fixedLevel, m]);
  return (
    <>
      <Card className="c-fan-controls" path="fan:controls" label="风扇控制设置">
        <Feature
          name="FAN_FIXED_ENABLED"
          title="固定风扇转速"
          help={"开启后直接选择一至五档，风扇开启时按所选硬件档位固定，不依赖转速测量，也不受原厂智能／极速模式选择影响。\n\n在模块设置内，风扇关闭时也可保存档位，但不会自行启动。开启“散热风扇磁贴增强”并打开原厂风扇后，也可长按控制中心风扇磁贴设置固定档位。"}
        >
          <NativeSelect
            name={k('FAN_FIXED_LEVEL')}
            title="固定档位"
            choices={[
              ['1', '一档'],
              ['2', '二档'],
              ['3', '三档'],
              ['4', '四档'],
              ['5', '五档'],
            ]}
            initial="1"
            presentation="buttons"
          />
        </Feature>
        <hr />
        <Feature
          name="FAN_TILE_ENHANCEMENT_ENABLED"
          title="散热风扇磁贴增强"
          help={"开启增强并打开原厂风扇后，长按控制中心的散热风扇磁贴，原厂详情面板中会出现“固定转速”，可选择一至五档并查看实际档位与转速。风扇关闭时保留原厂提示，先打开风扇后再调节。\n\n此开关只控制磁贴增强，开启时不会自动启动风扇或启用固定转速。关闭增强后恢复原厂长按面板，已保存的固定转速设置由其自身开关控制。当前仅支持已验证定速档位的 NX809J。"}
        />
      </Card>
      <Card>
        <FeatureTitle
          title="本机转速测量"
          help={"先打开原厂风扇，再开始检测。约一分钟内依次测量一至五档，保存各档稳定转速和最高反馈，仅用于查看本机各档实测表现，不参与固定档位控制。完成后恢复原档位。\n\n取消、关闭风扇或切换原厂模式会停止检测；系统或固件变化后可重新测量。NX769J 的定速档位尚未验证，暂不执行逐档测量。"}
        />
        <p className="c-fan-summary">
          {'已验证定速档位：1～5\n' +
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
function LauncherEditor({ embedded = false }: { embedded?: boolean }) {
  const m = useModel(),
    [space, setSpace] = useState('0'),
    [app, setApp] = useState(''),
    [name, setName] = useState(''),
    [picture, setPicture] = useState(''),
    file = useRef<HTMLInputElement>(null);
  const id = 'launcher:' + space + ':' + app;
  const hasOverrides = Object.entries(m.values).some(([key, value]) =>
    key.startsWith('launcher:') && (key.endsWith(':name') || key.endsWith(':picture')) && !!value);
  return (
    <EditorSection embedded={embedded}>
      <Toggle
        name="prototype:launcher-enabled"
        title="自定义应用图标与名称"
        initial={hasOverrides ? '1' : '0'}
        help="按用户空间选择应用。关闭时恢复原厂名称和图标，再次开启恢复之前保存的修改。"
      >
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
      </Toggle>
    </EditorSection>
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
    [space, setSpace] = useState('all'),
    [query, setQuery] = useState(''),
    [filter, setFilter] = useState('configured'),
    [sort, setSort] = useState('name'),
    file = useRef<HTMLInputElement>(null);
  const [appsExpanded, expandApps] = useDisclosure('hide:apps');
  const appsBodyId = useId();
  const master = m.values[k('HIDE_MASTER')] === '1';
  const runtime = runtimeState(m.values);
  const spaces = space === 'all' ? ['0', '999'] : [space];
  const spaceName = (id: string) =>
    id === '0' ? '机主 · 空间 0' : 'Mix11 · 空间 999';
  const rangeName = space === 'all' ? '全部空间' : spaceName(space);
  const selected = (id: string) =>
    (m.values['hide:' + id + ':apps'] || '').split(',').filter(Boolean);
  const rows = spaces.flatMap((id) => {
    const configured = selected(id);
    // Keep configured packages visible even when absent from the sample inventory.
    const inventory = [
      ...appList,
      ...configured
        .filter((pkg) => !appList.some((a) => a.pkg === pkg))
        .map((pkg) => ({ name: pkg.split('.').pop() || pkg, pkg })),
    ];
    return inventory.map((app, index) => ({
      ...app,
      space: id,
      installedOrder: index,
      configured: configured.includes(app.pkg),
      hidden: m.values['hide:' + id + ':state:' + app.pkg] === '1',
    }));
  });
  const targets = rows.filter((app) => app.configured);
  const visibleRows = rows
    .filter(
      (app) =>
        filter === 'all' || (filter === 'hidden' ? app.hidden : app.configured),
    )
    .filter((app) =>
      (app.name + app.pkg + spaceName(app.space))
        .toLowerCase()
        .includes(query.trim().toLowerCase()),
    )
    .sort(
      (a, b) =>
        (sort === 'installed'
          ? b.installedOrder - a.installedOrder
          : a.name.localeCompare(b.name, 'zh')) ||
        a.space.localeCompare(b.space),
    );
  const changeSelection = (id: string, pkg: string, on: boolean) => {
    const current = selected(id);
    m.set(
      'hide:' + id + ':apps',
      (on
        ? [...new Set([...current, pkg])]
        : current.filter((p) => p !== pkg)
      ).join(','),
    );
    if (!on) m.tell('原型演示：已移出名单，应用当前状态保持不变');
  };
  const requireMaster = () => {
    if (master) return true;
    m.tell('请先开启应用隐藏');
    return false;
  };
  const requireRoot = () => {
    if (runtime.root) return true;
    m.tell('原型演示：ROOT 未授权，请检查状态预览并重新授权');
    return false;
  };
  const requireAutomation = () => {
    if (!requireMaster() || !requireRoot()) return false;
    if (!runtime.lsp) {
      m.tell('请检查 LSP 作用域并重启手机');
      return false;
    }
    if (!['0', '999'].some((id) => selected(id).length)) {
      m.tell('请先选择要自动隐藏的应用');
      return false;
    }
    if (runtime.id === 'update-pending') {
      m.tell('锁屏监听尚未加载当前版本，请重启手机');
      return false;
    }
    return true;
  };
  const setAppState = (
    app: (typeof rows)[number],
    hidden: boolean,
    confirmed = false,
  ) => {
    if ((hidden && !requireMaster()) || !requireRoot()) return;
    if (!confirmed) {
      m.dialog(
        hidden ? '隐藏应用' : '显示应用',
        <>
          <p>
            {app.name} · {spaceName(app.space)}
          </p>
          <p className="c-note">{app.pkg}</p>
          <p className="c-note">
            {hidden ? '将停止并隐藏此应用' : '将显示此应用'}，应用数据保留。
          </p>
          <footer>
            <button onClick={m.close}>取消</button>
            <button
              onClick={() => {
                setAppState(app, hidden, true);
                m.close();
              }}
            >
              {hidden ? '隐藏' : '显示'}
            </button>
          </footer>
        </>,
      );
      return;
    }
    m.set('hide:' + app.space + ':state:' + app.pkg, hidden ? '1' : '0');
    m.tell(
      '原型演示：已' +
        (hidden ? '隐藏' : '显示') +
        app.name +
        '（' +
        spaceName(app.space) +
        '）',
    );
  };
  const batch = (hidden: boolean) => {
    if (!targets.length || (hidden && !requireMaster()) || !requireRoot())
      return;
    m.dialog(
      hidden ? '隐藏本范围' : '显示本范围',
      <>
        <p>
          {rangeName} · 已保存 {targets.length} 个应用
        </p>
        <p className="c-note">
          {hidden ? '将停止并隐藏' : '将显示'}
          本范围的全部已保存应用。搜索与筛选不会改变操作范围；应用数据保留。
        </p>
        <footer>
          <button onClick={m.close}>取消</button>
          <button
            onClick={() => {
              targets.forEach((app) =>
                m.set(
                  'hide:' + app.space + ':state:' + app.pkg,
                  hidden ? '1' : '0',
                ),
              );
              m.close();
              m.tell(
                '原型演示：已' +
                  (hidden ? '隐藏' : '显示') +
                  rangeName +
                  '的 ' +
                  targets.length +
                  ' 个已保存应用',
              );
            }}
          >
            {hidden ? '隐藏' : '显示'} {targets.length} 个应用
          </button>
        </footer>
      </>,
    );
  };
  const appDetails = (app: (typeof rows)[number]) =>
    m.dialog(
      app.name,
      <>
        <p>{app.pkg}</p>
        <p className="c-note">
          {spaceName(app.space)} · {app.hidden ? '已隐藏' : '已显示'} ·{' '}
          {app.configured ? '已加入名单' : '未加入名单'}
        </p>
        <p className="c-note">移出名单只更改配置，不会自动显示已隐藏的应用。</p>
        <footer>
          <button onClick={m.close}>取消</button>
          {app.hidden && (
            <button
              onClick={() => {
                setAppState(app, false);
              }}
            >
              显示应用
            </button>
          )}
          <button
            onClick={() => {
              changeSelection(app.space, app.pkg, !app.configured);
              m.close();
            }}
          >
            {app.configured ? '移出名单' : '加入名单'}
          </button>
        </footer>
      </>,
    );
  const automation = (
    <Toggle
      name={k('AUTOMATION_ENABLED')}
      title="锁屏自动隐藏"
      help="系统由亮到灭时隐藏已配置应用，解锁不自动显示。开启前需启用应用隐藏。"
      beforeEnable={requireAutomation}
      summary={
        !master
          ? '已暂停：应用隐藏未开启'
          : !runtime.root || !runtime.lsp
            ? '已暂停：' + runtime.message
            : undefined
      }
    >
      <Toggle
        name="hide:all-spaces"
        title="处理所有已配置空间"
        help="关闭时只处理当前正在使用的空间。"
      />
    </Toggle>
  );
  const tile = (
    <>
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
        <Button secondary onClick={() => m.set('tile:picture', '')}>
          恢复默认图片
        </Button>
      </div>
      <Field
        name={k('TILE_LABEL')}
        title="磁贴名称"
        initial="红魔Duo"
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
                {m.values[k('TILE_LABEL')] || '红魔Duo'}
                {'\n'}
                {m.values[k('TILE_DESCRIPTION')] || '应用隐藏'}
              </p>
              <footer>
                <button onClick={m.close}>取消</button>
                <button
                  onClick={() => {
                    m.close();
                    m.tell('原型演示：红魔Duo 磁贴已添加');
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
    </>
  );
  // Historical routes remain usable; the current entry exposes all operations in one page.
  if (route === 'automation')
    return <Card className="c-feature-group">{automation}</Card>;
  if (route === 'tile') return <Card>{tile}</Card>;
  return (
    <div
      className="c-hide-page"
      data-native-path="editor:hide"
      data-ui-label="四大皆空"
    >
      <Card className="c-feature-group" label="应用隐藏">
        <Toggle
          name={k('HIDE_MASTER')}
          title="应用隐藏"
          help="需要 ROOT 授权。允许手动、锁屏或磁贴隐藏名单中的应用。关闭不恢复现有隐藏；显示应用始终可用。"
          beforeEnable={requireRoot}
        />
      </Card>
      <Card
        className="c-hide-manager"
        path="section:hide_apps"
        label="应用名单"
      >
        <button
          className="c-native-fold-head c-hide-list-head"
          aria-label={(appsExpanded ? '收起' : '展开') + '应用名单'}
          aria-expanded={appsExpanded}
          aria-controls={appsBodyId}
          data-native-path="fold:hide:apps"
          data-ui-label="应用名单展开"
          onClick={() => expandApps(!appsExpanded)}
        >
          <strong>应用名单</strong>
          <small className="c-hide-count" aria-live="polite">
            配置 {targets.length} · 隐藏{' '}
            {rows.filter((app) => app.hidden).length}
          </small>
          <span className="c-disclosure-slot" aria-hidden="true">
            <ChevronDown
              size={18}
              style={{ transform: appsExpanded ? 'rotate(180deg)' : undefined }}
            />
          </span>
        </button>
        <div
          className="c-hide-scope c-native-select"
          data-native-path="hide:space"
          data-ui-label="空间范围"
        >
          <select
            aria-label="空间范围"
            value={space}
            onChange={(e) => setSpace(e.target.value)}
          >
            <option value="all">全部空间</option>
            <option value="0">机主 · 空间 0</option>
            <option value="999">Mix11 · 空间 999</option>
          </select>
          <Button
            secondary
            onClick={() => {
              if (requireRoot()) m.tell('原型演示：已刷新应用列表与状态');
            }}
          >
            刷新
          </Button>
        </div>
        <div className="c-buttons c-hide-batch">
          <Button
            disabled={!master || !runtime.root || !targets.length}
            onClick={() => batch(true)}
          >
            隐藏本范围
          </Button>
          <Button
            secondary
            disabled={!targets.length}
            onClick={() => batch(false)}
          >
            显示本范围
          </Button>
          <Button
            secondary
            onClick={() => {
              setQuery('');
              setFilter('all');
              expandApps(true);
            }}
          >
            选择应用
          </Button>
        </div>
        <div
          id={appsBodyId}
          className="d-disclosure-body c-hide-list-body"
          hidden={!appsExpanded}
        >
          <input
            className="c-picker-search c-hide-search"
            aria-label="搜索名称或包名"
            placeholder="搜索应用名称或包名"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
          <fieldset
            className="c-hide-filters c-native-select-buttons"
            aria-label="应用筛选"
          >
            {[
              ['configured', '已配置'],
              ['hidden', '已隐藏'],
              ['all', '全部应用'],
            ].map(([value, title]) => (
              <button
                className={'c-button' + (filter === value ? '' : ' secondary')}
                key={value}
                aria-pressed={filter === value}
                data-native-path={'hide:filter:' + value}
                data-ui-label={title}
                onClick={() => setFilter(value)}
              >
                {title}
              </button>
            ))}
          </fieldset>
          <div className="c-hide-sort c-native-select">
            <span>排序</span>
            <select
              aria-label="应用排序"
              value={sort}
              onChange={(e) => setSort(e.target.value)}
            >
              <option value="name">按应用名称</option>
              <option value="installed">按安装时间</option>
            </select>
          </div>
          <div
            className="c-hide-list"
            data-native-path="hide:app-list"
            data-ui-label="应用列表"
          >
            {visibleRows.map((app) => (
              <div
                className="c-hide-app"
                key={app.space + ':' + app.pkg}
                data-native-path={'hide:' + app.space + ':' + app.pkg}
                data-ui-label={app.name + ' · ' + spaceName(app.space)}
              >
                {filter === 'all' && (
                  <label className="c-hide-check">
                    <input
                      type="checkbox"
                      aria-label={
                        (app.configured ? '移出名单：' : '加入名单：') +
                        app.name +
                        ' · ' +
                        spaceName(app.space)
                      }
                      checked={app.configured}
                      onChange={(e) =>
                        changeSelection(app.space, app.pkg, e.target.checked)
                      }
                    />
                  </label>
                )}
                <button
                  className="c-hide-app-details"
                  aria-label={'管理' + app.name + ' · ' + spaceName(app.space)}
                  onClick={() => appDetails(app)}
                >
                  <AppWindow
                    className="c-hide-app-icon"
                    size={28}
                    aria-hidden="true"
                  />
                  <span className="c-hide-app-copy">
                    <strong>{app.name}</strong>
                    <small>{app.pkg}</small>
                    <small>
                      {spaceName(app.space)} ·{' '}
                      <span className={app.hidden ? 'c-hide-state-hidden' : ''}>
                        {app.hidden ? '已隐藏' : '已显示'}
                      </span>
                    </small>
                  </span>
                </button>
                {app.configured && filter !== 'all' && (
                  <Button
                    secondary={app.hidden}
                    disabled={!app.hidden && (!master || !runtime.root)}
                    onClick={() => setAppState(app, !app.hidden)}
                  >
                    {app.hidden ? '显示' : '隐藏'}
                  </Button>
                )}
              </div>
            ))}
            {!visibleRows.length && (
              <div className="c-hide-empty">
                <p>
                  {query.trim()
                    ? '没有匹配的应用'
                    : filter === 'hidden'
                      ? '本范围没有已隐藏应用'
                      : filter === 'configured'
                        ? '本范围尚未配置应用'
                        : '本范围暂无可用应用'}
                </p>
                <p className="c-note">
                  {query.trim()
                    ? '更换关键词，或清空搜索查看名单。'
                    : '切换“全部应用”勾选要管理的应用。'}
                </p>
                <Button
                  secondary
                  onClick={() => {
                    setQuery('');
                    setFilter('all');
                  }}
                >
                  查看全部应用
                </Button>
              </div>
            )}
          </div>
        </div>
      </Card>
      <section
        className="c-application-section"
        data-native-path="section:hide_automation"
        data-ui-label="自动与快捷操作"
      >
        <h3 className="c-section-heading">自动与快捷操作</h3>
        <Card className="c-feature-group" label="自动与快捷操作">
          <div className="c-feature">{automation}</div>
          <div className="c-feature">
            <Toggle
              name={k('TILE_ENABLED')}
              initial={editorDefaults[k('TILE_ENABLED')]}
              title="快捷磁贴"
              help="点击磁贴切换已保存名单的隐藏状态；混合状态优先显示全部。关闭后保留面板磁贴，但不操作应用。"
              beforeEnable={requireRoot}
              summary={
                !master
                  ? '已暂停：应用隐藏未开启'
                  : !runtime.root
                    ? '已暂停：ROOT 未授权'
                    : undefined
              }
            >
              {tile}
            </Toggle>
          </div>
        </Card>
      </section>
    </div>
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
