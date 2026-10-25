/* eslint-disable nextjs/no-img-element -- User-picked artwork stays local to the prototype. */
/* eslint-disable react/react-compiler -- The workspace keeps an explicit transaction across routes. */
'use client';
import {
  createContext,
  useContext,
  useEffect,
  useState,
  useRef,
  useCallback,
  type ReactNode,
} from 'react';
import {
  Wifi,
  Signal,
  Bluetooth,
  BatteryFull,
  Bell,
  Shield,
  Fan,
  Circle,
  Search,
  ChevronRight,
  ImagePlus,
} from 'lucide-react';
import icons from './current-status-icons.json';
import { Button, Card, useModel } from './current-ui';
import { LayoutNumber } from './current-status-sheet';
import { NativeFold } from './current-native-controls';
export const ASSETS_KEY = 'status:assets:preview-v1';
type Binding = {
  image: string;
  name: string;
  scale: number;
  x: number;
  y: number;
  opacity: number;
  mirror: boolean;
  originalColor?: boolean;
};
type AssetPlan = {
  bindings: Record<string, Binding>;
  fonts: Record<string, string>;
  visibility: Record<string, boolean>;
};
const empty = (): AssetPlan => ({ bindings: {}, fonts: {}, visibility: {} });
const parse = (raw: string): AssetPlan => {
  try {
    const p = JSON.parse(raw);
    return p?.bindings && p?.fonts ? {...p, visibility: p.visibility || {}} : empty();
  } catch {
    return empty();
  }
};
const Context = createContext<{
  draft: AssetPlan;
  dirty: boolean;
  update: (next: AssetPlan | ((current: AssetPlan) => AssetPlan)) => void;
  apply: () => void;
  discard: () => void;
  undo: () => void;
  canUndo: boolean;
  redo: () => void;
  canRedo: boolean;
}>(null!);
export function AssetWorkspaceProvider({ children }: { children: ReactNode }) {
  const m = useModel(),
    raw = m.values[ASSETS_KEY] || '';
  const [draft, setDraft] = useState(() => parse(raw)),
    [saved, setSaved] = useState(() => parse(raw)),
    [history, setHistory] = useState<AssetPlan[]>([]),
    [future, setFuture] = useState<AssetPlan[]>([]);
  const latestDraft = useRef(draft);
  useEffect(() => {
    const next = parse(raw);
    setSaved(next);
    setDraft(next);
    latestDraft.current = next;
    setHistory([]);
    setFuture([]);
  }, [raw]);
  const dirty = JSON.stringify(saved) !== JSON.stringify(draft);
  const update = (next: AssetPlan | ((current: AssetPlan) => AssetPlan)) => {
    const current = latestDraft.current;
    const resolved = typeof next === 'function' ? next(current) : next;
    setHistory((h) => [...h.slice(-19), current]);
    setFuture([]);
    latestDraft.current = resolved;
    setDraft(resolved);
  };
  const apply = useCallback(() => {
    m.set(ASSETS_KEY, JSON.stringify(draft));
    setSaved(draft);
    m.tell('已应用到网页状态栏方案');
  }, [m, draft]);
  const discard = useCallback(() => {
    latestDraft.current = saved;
    setDraft(saved);
    setHistory([]);
    setFuture([]);
  }, [saved]);
  useEffect(() => {
    m.registerNavigationGuard?.((next) => {
      if (!dirty || next === 'status_assets' || next.startsWith('asset/'))
        return true;
      m.dialog(
        '素材草稿尚未应用',
        <>
          <p>本次素材与字体修改仍在草稿中。</p>
          <footer>
            <button onClick={m.close}>继续编辑</button>
            <button
              onClick={() => {
                discard();
                m.registerNavigationGuard?.();
                m.close();
                m.go(next);
              }}
            >
              放弃草稿
            </button>
            <button
              onClick={() => {
                apply();
                m.registerNavigationGuard?.();
                m.close();
                m.go(next);
              }}
            >
              应用并返回
            </button>
          </footer>
        </>,
      );
      return false;
    });
    return () => m.registerNavigationGuard?.();
  }, [dirty, draft, saved, m, discard, apply]);
  return (
    <Context.Provider
      value={{
        draft,
        dirty,
        update,
        apply,
        discard,
        undo: () => {
          setFuture([...future, draft]);
          latestDraft.current = history.at(-1)!;
          setDraft(history.at(-1)!);
          setHistory(history.slice(0, -1));
        },
        canUndo: history.length > 0,
        redo: () => {
          setHistory([...history, draft]);
          latestDraft.current = future.at(-1)!;
          setDraft(future.at(-1)!);
          setFuture(future.slice(0, -1));
        },
        canRedo: future.length > 0,
      }}
    >
      {children}
    </Context.Provider>
  );
}
const stateLabel = (state: string) =>
  (
    ({
      default: '默认／其余状态',
      connected: '已连接',
      disconnected: '未连接',
      charging: '充电中',
      bypass: '旁路充电',
      power_save: '省电模式',
      active: '运行中',
      no_internet: '无互联网',
    }) as Record<string, string>
  )[state] ||
  (state.startsWith('level')
    ? '强度 ' + state.slice(5)
    : state.startsWith('battery')
      ? '电量 ' + state.slice(7).replace('_', '–') + '%'
      : state);
function IconSample({ id }: { id: string }) {
  const Icon = id.includes('wifi')
    ? Wifi
    : id.includes('mobile') || id === 'dual_signal'
      ? Signal
      : id.includes('bluetooth')
        ? Bluetooth
        : id.includes('battery') || id === 'connectivity'
          ? BatteryFull
          : id.includes('fan')
            ? Fan
            : id.includes('privacy')
              ? Shield
              : id === 'alarm_clock' || id === 'zen'
                ? Bell
                : Circle;
  return <Icon size={23} aria-hidden="true" />;
}
function DraftActions() {
  const a = useContext(Context);
  return (
    <div className="d-draft-actions">
      <span>{a.dirty ? '有未应用的草稿' : '当前方案已保存'}</span>
      <button disabled={!a.canUndo} onClick={a.undo}>
        撤销
      </button>
      <button disabled={!a.canRedo} onClick={a.redo}>重做</button>
      <button disabled={!a.dirty} onClick={a.apply}>
        应用到状态栏
      </button>
    </div>
  );
}
const roles = [
  ['global', '统一字体'],
  ['clock', '时钟'],
  ['network', '网速'],
  ['metrics', '实时指标'],
  ['battery', '电量数字'],
  ['bluetooth', '蓝牙电量'],
  ['other', '其他状态栏文字'],
];
const sampleVisible = new Set([
  'wifi',
  'mobile1',
  'mobile2',
  'bluetooth',
  'bluetooth.battery',
  'battery',
  'connectivity',
  'cooling_fan',
]);
function ExportSelection() {
  const m = useModel(),
    a = useContext(Context);
  const entries = [
    ...Object.entries(a.draft.bindings).map(([key, b]) => ({
      key,
      label: b.name,
    })),
    ...Object.entries(a.draft.fonts)
      .filter(([, font]) => font.startsWith('file:'))
      .map(([key, font]) => ({
        key: 'font:' + key,
        label:
          (roles.find(([role]) => role === key)?.[1] || '字体') +
          ' · ' +
          font.slice(5),
      })),
  ];
  const [selected, setSelected] = useState(entries.map(({ key }) => key));
  return (
    <>
      <p>
        选择本次分享的图标状态与字体。网页展示导出范围，ZIP 文件由手机端生成。
      </p>
      {entries.length ? (
        entries.map(({ key, label }) => (
          <label className="c-check" key={key}>
            <input
              type="checkbox"
              checked={selected.includes(key)}
              onChange={(e) =>
                setSelected((current) =>
                  e.target.checked
                    ? [...current, key]
                    : current.filter((id) => id !== key),
                )
              }
            />
            {label}
          </label>
        ))
      ) : (
        <p className="d-empty">
          暂无可分享的本地素材。先在图标详情或字体页选择文件。
        </p>
      )}
      <p className="d-save-note">
        已选择 {selected.length} 项 · 布局和显隐规则不随素材包导出。
      </p>
      <footer>
        <button onClick={m.close}>返回素材管理</button>
        <button
          disabled={!selected.length}
          onClick={() =>
            m.tell(
              '导出范围已确认：' +
                selected.length +
                '项；网页原型不生成原生ZIP',
            )
          }
        >
          确认导出范围
        </button>
      </footer>
    </>
  );
}
function previewFont(font?: string) {
  return !font ||
    font === 'inherit' ||
    font === 'native' ||
    font.startsWith('file:')
    ? 'inherit'
    : font;
}
export function CurrentStatusAssets({ id }: { id?: string }) {
  const m = useModel(),
    a = useContext(Context);
  const [tab, setTab] = useState('icons'),
    [query, setQuery] = useState(''),
    [filter, setFilter] = useState('all');
  const position = m.values['prototype:asset-surface'] || 'all';
  const surfacePrefix = position === 'all' ? '' : position + '|';
  const resolveFont = (role: string) => [a.draft.fonts[surfacePrefix + role], a.draft.fonts[surfacePrefix + 'global'], a.draft.fonts[role], a.draft.fonts.global].find(value => value && value !== 'inherit');
  const surfacePicker = <label className="c-layout-select sd-asset-surface">显示位置<select aria-label="素材与字体显示位置" value={position} onChange={e => m.set('prototype:asset-surface', e.target.value)}>{[['all','共享方案'],['status','桌面／应用'],['keyguard','锁屏'],['notification','通知中心'],['control','控制中心']].map(([value,title]) => <option key={value} value={value}>{title}</option>)}</select></label>;
  const [state, setState] = useState('default'),
    [layer, setLayer] = useState('whole'),
    [error, setError] = useState('');
  const icon = icons.find((icon) => icon.id === id),
    bindingKey = surfacePrefix + (id || '') + ':' + state + ':' + layer;
  const ownBinding = a.draft.bindings[bindingKey];
  const binding =
    ownBinding ||
    (state !== 'default'
      ? a.draft.bindings[surfacePrefix + (id || '') + ':default:' + layer]
      : undefined) || a.draft.bindings[(id || '') + ':' + state + ':' + layer] || a.draft.bindings[(id || '') + ':default:' + layer];
  const patch = (next: Partial<Binding>) => {
    if (binding)
      a.update({
        ...a.draft,
        bindings: {
          ...a.draft.bindings,
          [bindingKey]: { ...binding, ...next },
        },
      });
  };
  const upload = (file?: File) => {
    if (!file) return;
    if (
      !['image/png', 'image/jpeg', 'image/webp', 'image/gif'].includes(
        file.type,
      ) ||
      file.size > 200000
    ) {
      setError('原型图片请使用200 KB以内的PNG、JPG、WebP或GIF。');
      return;
    }
    const destination = bindingKey;
    const reader = new FileReader();
    reader.onload = () => {
      if (typeof reader.result !== 'string') return;
      const image = reader.result;
      a.update((current) => ({
        ...current,
        bindings: {
          ...current.bindings,
          [destination]: {
            image,
            name: file.name,
            scale: 100,
            x: 0,
            y: 0,
            opacity: 100,
            mirror: false,
          },
        },
      }));
      setError('');
    };
    reader.readAsDataURL(file);
  };
  if (id && !icon) return <p className="d-empty">未找到此图标。</p>;
  if (icon)
    return (
      <>
        <p className="d-page-description">
          {icon.group} · 按图标、状态与图层配置
        </p>
        <DraftActions />
        {surfacePicker}
        <Card>
          <div className="d-asset-preview" aria-label="图标外观草稿预览">
            {binding ? (
              <img
                src={binding.image}
                alt={binding.name}
                style={{
                  transform: `translate(${binding.x}px,${binding.y}px) scale(${binding.scale / 100}) scaleX(${binding.mirror ? -1 : 1})`,
                  opacity: binding.opacity / 100,
                  filter: binding.originalColor ? undefined : 'grayscale(1)',
                }}
              />
            ) : (
              <IconSample id={icon.id} />
            )}
          </div>
          <p className="d-save-note">
            图样示意 · {stateLabel(state)} ·{' '}
            {layer === 'whole'
              ? '整图'
              : layer === 'background'
                ? '背景层'
                : '前景层'}
          </p>
        </Card>
        <Card>
          <div className="c-layout-fields">
            <label className="c-layout-select">
              显示状态
              <select
                aria-label="图标显示状态"
                value={state}
                onChange={(e) => setState(e.target.value)}
              >
                {icon.states.map((s) => (
                  <option key={s} value={s}>
                    {stateLabel(s)}
                  </option>
                ))}
              </select>
            </label>
            <label className="c-layout-select">
              素材图层
              <select
                aria-label="素材图层"
                value={layer}
                onChange={(e) => setLayer(e.target.value)}
              >
                {icon.layers.map((l) => (
                  <option key={l} value={l}>
                    {l === 'whole'
                      ? '整图'
                      : l === 'background'
                        ? '背景层'
                        : '前景层'}
                  </option>
                ))}
              </select>
            </label>
          </div>
          <p className="d-save-note">
            未单独设置的状态继承默认素材，具体位置继承共享方案。
          </p>
          <label className="c-layout-select">本地素材<select aria-label="复用本地素材" value="" onChange={e => {const source = a.draft.bindings[e.target.value]; if (source) a.update({...a.draft, bindings:{...a.draft.bindings, [bindingKey]:{...source}}});}}><option value="">选择已有图片或动画</option>{Object.entries(a.draft.bindings).map(([key,b]) => <option key={key} value={key}>{b.name}</option>)}</select></label>
          <label className="c-button c-upload">
            <ImagePlus size={16} />
            {binding ? '更换素材' : '选择图片或动画'}
            <input
              aria-label="选择图标素材"
              type="file"
              accept="image/png,image/jpeg,image/webp,image/gif"
              onChange={(e) => upload(e.target.files?.[0])}
            />
          </label>
          {binding && (
            <>
              <p className="d-save-note">
                {binding.name}
                {!ownBinding ? ' · 跟随默认素材' : ''}
              </p>
              <NativeFold title="素材缩放、位置与透明度">
                <div className="c-layout-fields">
                  {(['scale', 'x', 'y', 'opacity'] as const).map((key, i) => (
                    <LayoutNumber
                      key={key}
                      title={
                        ['缩放百分比', '左右偏移（dp）', '上下偏移（dp）', '不透明度百分比'][
                          i
                        ]
                      }
                      min={i === 0 ? 10 : i === 3 ? 0 : -64}
                      max={i === 0 ? 400 : i === 3 ? 100 : 64}
                      value={binding[key]}
                      onChange={(value) => patch({ [key]: value })}
                    />
                  ))}
                </div>
                <label className="c-check">
                  <input
                    type="checkbox"
                    checked={binding.mirror}
                    onChange={(e) => patch({ mirror: e.target.checked })}
                  />
                  水平镜像
                </label>
                <label className="c-check"><input type="checkbox" checked={!!binding.originalColor} onChange={e => patch({originalColor:e.target.checked})}/>保留素材原色</label>
              </NativeFold>
              <Button
                secondary
                disabled={!ownBinding}
                onClick={() => {
                  const next = { ...a.draft.bindings };
                  delete next[bindingKey];
                  a.update({ ...a.draft, bindings: next });
                }}
              >
                清除当前位置状态图层
              </Button>
            </>
          )}
          {error && (
            <p className="c-layout-error" role="alert">
              {error}
            </p>
          )}
        </Card>
        <Card>
          <NativeFold title="图标显示与间距"><p className="c-native-note">显示规则和布局间距已归入图标管理；此处的偏移只改变素材内部位置。</p><Button onClick={()=>{m.set('prototype:status:surface',position);m.go('status_icon/'+id);}}>打开此图标设置</Button></NativeFold>
          <Button secondary onClick={() => {const next=Object.fromEntries(Object.entries(a.draft.bindings).filter(([key]) => !key.split('|').at(-1)!.startsWith(id + ':'))); a.update({...a.draft,bindings:next});}}>清除此图标全部状态素材</Button>
        </Card>
      </>
    );
  const matched = icons.filter(
    (i) =>
      (i.title + ' ' + i.id + ' ' + i.group)
        .toLowerCase()
        .includes(query.toLowerCase()) &&
      (filter === 'all' ||
        (filter === 'custom' &&
          Object.keys(a.draft.bindings).some((key) =>
            key.startsWith(surfacePrefix + i.id + ':'),
          )) ||
        (filter === 'visible' && sampleVisible.has(i.id)) ||
        (filter === 'hidden' && !sampleVisible.has(i.id))),
  );
  return (
    <>
      <p className="d-page-description">
        识别系统图标、设置不同状态的素材与字体，预览后统一应用。
      </p>
      <DraftActions />
      {surfacePicker}
      <div className="d-assets-tabs" role="tablist" aria-label="素材管理分类">
        {[
          ['icons', '图标总览'],
          ['fonts', '字体'],
          ['library', '导入与分享'],
        ].map(([key, title]) => (
          <button
            key={key}
            role="tab"
            aria-selected={tab === key}
            onClick={() => setTab(key)}
          >
            {title}
          </button>
        ))}
      </div>
      {tab === 'icons' && (
        <>
          <div className="d-local-search">
            <Search size={17} />
            <input
              aria-label="搜索系统图标"
              placeholder="搜索图标名称或分类"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
          </div>
          <div className="c-layout-fields">
            <label className="c-layout-select">
              筛选
              <select
                aria-label="图标筛选"
                value={filter}
                onChange={(e) => setFilter(e.target.value)}
              >
                <option value="all">全部图标</option>
                <option value="visible">正在显示（示例）</option>
                <option value="hidden">当前未显示（示例）</option>
                <option value="custom">已自定义</option>
              </select>
            </label>
          </div>
          <p className="d-save-note">
            {matched.length} 项 · 显示状态为示例
          </p>
          <Card className="d-preference-group">
            {matched.map((i) => (
              <button
                key={i.id}
                className="d-preference-link"
                aria-label={i.title}
                onClick={() => m.go('asset/' + i.id)}
              >
                <span className="d-preference-line">
                  <span className="c-setting-icon">
                    <IconSample id={i.id} />
                  </span>
                  <span className="d-preference-copy">
                    <strong>{i.title}</strong>
                    <small>
                      {i.group} · {i.states.length} 种状态
                    </small>
                  </span>
                  <ChevronRight size={17} />
                </span>
              </button>
            ))}
            {!matched.length && <p className="d-empty">没有符合条件的图标。</p>}
          </Card>
        </>
      )}
      {tab === 'fonts' && (
        <Card className="d-font-group">
          <p className="d-save-note">
            统一字体作为默认，单独设置的角色可以跟随统一字体或明确使用原厂字体。
          </p>
          {roles.map(([key, title]) => (
            <div key={key} className="d-font-row">
              <strong>{title}</strong>
              <select
                aria-label={title + '选择'}
                value={a.draft.fonts[surfacePrefix + key] || 'inherit'}
                onChange={(e) =>
                  a.update({
                    ...a.draft,
                    fonts: { ...a.draft.fonts, [surfacePrefix + key]: e.target.value },
                  })
                }
              >
                <option value="inherit">
                  {key === 'global' ? position === 'all' ? '默认（原厂字体）' : '继承共享字体' : position === 'all' ? '跟随统一字体' : '继承共享与统一字体'}
                </option>
                <option value="native">原厂字体</option>
                <option value="sans-serif">无衬线</option>
                <option value="serif">衬线</option>
                <option value="monospace">等宽</option>
                {a.draft.fonts[surfacePrefix + key]?.startsWith('file:') && (
                  <option value={a.draft.fonts[surfacePrefix + key]}>
                    {a.draft.fonts[surfacePrefix + key].slice(5)}
                  </option>
                )}
              </select>
              <span
                className="d-font-sample"
                style={{
                  fontFamily: previewFont(resolveFont(key)),
                }}
              >
                12:34 · 128 KB/s · 88%
              </span>
              <label className="d-font-import">
                选择文件
                <input
                  type="file"
                  accept=".ttf,.otf,.ttc"
                  aria-label={'导入' + title}
                  onChange={(e) => {
                    const file = e.target.files?.[0];
                    if (file && file.size <= 4 * 1024 * 1024)
                      a.update({
                        ...a.draft,
                        fonts: { ...a.draft.fonts, [surfacePrefix + key]: 'file:' + file.name },
                      });
                    else m.tell('请选择4 MiB以内的字体文件');
                  }}
                />
              </label>
              <button className="d-font-import" disabled={!a.draft.fonts[surfacePrefix + key]} onClick={() => {const next={...a.draft.fonts}; delete next[surfacePrefix + key]; a.update({...a.draft,fonts:next});}}>移除覆盖</button>
            </div>
          ))}
          <p className="d-save-note">
            原型展示字体选择与继承关系；手机端校验与实际字形以原生实现为准。
          </p>
        </Card>
      )}
      {tab === 'library' && (
        <>
          <Card>
            <h3 className="d-inspector-title">素材包</h3>
            <Button
              onClick={() =>
                m.dialog(
                  '导入素材包',
                  <>
                    <p>
                      手机端流程：选择 ZIP → 检查包名、作者、许可和资源 →
                      载入草稿 → 应用。网页仅演示文件选择。
                    </p>
                    <input
                      type="file"
                      accept=".zip"
                      aria-label="选择素材包"
                      onChange={(e) => {
                        const file = e.target.files?.[0];
                        if (file) {
                          m.close();
                          m.tell('已选择 ' + file.name + '；原型未执行ZIP导入');
                        }
                      }}
                    />
                    <footer>
                      <button onClick={m.close}>取消</button>
                    </footer>
                  </>,
                )
              }
            >
              选择社区素材包
            </Button>
            <p className="d-save-note">
              只替换包内涉及的图标状态与字体角色，其余设置保留。
            </p>
            <Button
              secondary
              onClick={() => m.dialog('选择分享的素材', <ExportSelection />)}
            >
              选择导出内容
            </Button>
          </Card>
          <Card>
            <h3 className="d-inspector-title">本地素材</h3>
            {Object.entries(a.draft.bindings).map(([key, b]) => (
              <p key={key} className="d-save-note">
                {b.name} · {key}
              </p>
            ))}
            {!Object.keys(a.draft.bindings).length && (
              <p className="d-page-description">
                尚未选择图片。先在图标详情中导入素材。
              </p>
            )}
            <Button
              secondary
              onClick={() =>
                m.dialog(
                  '恢复素材与字体默认',
                  <>
                    <p>
                      清空素材与字体草稿，布局和隐藏规则保留。应用前可撤销。
                    </p>
                    <footer>
                      <button onClick={m.close}>取消</button>
                      <button
                        onClick={() => {
                          a.update(empty());
                          m.close();
                        }}
                      >
                        恢复草稿默认
                      </button>
                    </footer>
                  </>,
                )
              }
            >
              恢复素材与字体默认
            </Button>
          </Card>
          <Card>
            <a
              className="d-external-link"
              href="https://github.com/liligit1815/RedMagicDuo-Assets"
              target="_blank"
              rel="noreferrer"
            >
              打开社区素材仓库
              <ChevronRight size={16} />
            </a>
            <p className="d-save-note">
              手机端可按图标与字体角色选择导出
              ZIP，并在浏览器中提交投稿；导入和导出均不自动上传。
            </p>
          </Card>
        </>
      )}
    </>
  );
}
