/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
/* eslint-disable react/react-compiler -- This prototype synchronizes browser storage, scroll restoration and native-style drafts without the React compiler. */
'use client';
import {
  useEffect,
  useLayoutEffect,
  useRef,
  useState,
  useCallback,
  type ReactNode,
} from 'react';
import {
  ScanLine,
  Search,
  ChevronRight,
  LayoutGrid,
  Scan,
  Archive,
  Settings,
  Smartphone,
  Gamepad2,
  Fan,
  Palette,
  Copy,
  Download,
  CloudSun,
  Nfc,
  Folder,
  Shield,
  Camera,
  AppWindow,
  Wind,
  Users,
  Heart,
  FileText,
} from 'lucide-react';
import catalog from './current-catalog.json';
import assetIcons from './current-asset-icons.json';
import device from './current-device.json';
import themeIcons from './current-theme-icons.json';
import { navigationTargets } from './current-navigation';
import { runtimeState } from './current-runtime';
import { recordEvent } from './current-log';
import native from './current-native-data.json';
import { latestSample } from './current-native-controls';
import { CurrentSystemChrome } from './current-system-chrome';
import { CurrentGlassDock } from './current-glass-dock';
import {
  CurrentContext,
  Card,
  Toggle,
  Button,
  Header,
  Modal,
  identity,
  PresentationContext,
} from './current-ui';
import {
  CurrentApplication,
  CurrentApplicationSection,
  ExtraDimEditor,
} from './current-application';
import { canonicalParent, resolveGroup, resolveDestination, navigationLevel, singleChildRoute } from './current-hierarchy';
import { DetailBreadcrumb } from './current-detail-navigation';
import { CurrentStatusCanvas } from './current-status-canvas';
import {
  AssetWorkspaceProvider,
  CurrentStatusAssets,
} from './current-status-assets';
import { CurrentMaintenance } from './current-maintenance';
import { CurrentBackground } from './current-background';
import { CurrentEditor, editorTitles, editorDefaults } from './current-editors';
import {
  CurrentSettingsPage,
  settingTitles,
  LegalContent,
} from './current-settings';
import './current.css';
import './ice-glass.css';
import './primary-pages.css';
import './current-detail.css';
import { normalizeFanSettings, restoreSettings } from './current-backup';
import { launcherGridDefaults } from './current-launcher-layout';
const targets = navigationTargets;
const main = ['home', 'settings', 'about'];
function DuoOutline({ size = 24 }: { size?: number }) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.7"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d="M6.5 2.5C12.8 3.8 18.7 9.5 20.3 16.6L12.5 18.1C13.1 12.7 10.1 6.6 6.5 2.5Z M9.7 8.5C10.6 12.3 11.1 15.6 10.7 18.6L3.5 20.3C7.1 16.6 9.3 12.8 9.7 8.5Z M2.5 21.6L22 17.4L17.5 22.2C17.1 22.7 16.3 22.8 15.3 22.8H7.7C5.7 22.8 3.8 22.4 2.5 21.6Z" />
    </svg>
  );
}
const concealedRoutes = new Set(['hide', 'hide_apps', 'automation', 'tile']);
const icons: Record<string, typeof Settings> = {
  system: Settings,
  systemui: Smartphone,
  settings: Settings,
  launcher: AppWindow,
  game: Gamepad2,
  ai_trigger: Scan,
  fan: Fan,
  theme: Palette,
  collab: Palette,
  doubleapp: Copy,
  store: Download,
  installer: Archive,
  update: Download,
  health: Wind,
  weather: CloudSun,
  nfc: Nfc,
  files: Folder,
  permissions: Shield,
  screenshot: Camera,
};
const aliases: Record<string, string> = {
  'target-collab': 'target-theme',
  'home-unlocked': 'home',
  'status-layout': 'status_layout',
  'status-clock': 'status_layout',
  'status-hardware': 'status_layout',
  'status-icons': 'status_layout',
  health: 'mi_health',
  launcher: 'launcher_custom',
  'hide-menu': 'hide',
  'hide-auto': 'automation',
  'hide-tile': 'tile',
  apps: 'home',
  game: 'target-game',
  'rm:game': 'target-game',
  system: 'target-system',
  tools: 'settings',
  config_transfer: 'settings',
};
const defaults = {
  ...launcherGridDefaults,
  ...native.allDefaults,
  ...editorDefaults,
  ...Object.fromEntries(catalog.options.map((o) => [o.key, o.defaultValue])),
  ...latestSample,
};
// Device PackageManager supplies current themed icons. Collaboration is a feature group.
const appIcons: Record<string, string> = Object.fromEntries(
  Object.entries(themeIcons)
    .filter(([id]) => id !== 'collab')
    .map(([id, icon]) => [id, icon.file]),
);
appIcons.health = '/current/health.png'; // Not installed on the attached phone; keep its bundled application icon.
const STORAGE = 'redmagic-duo-primary-prototype-20260930';
export default function CurrentPrototype() {
  const [sampleRevision, setSampleRevision] = useState(0);
  const [presentation, setPresentation] = useState<Record<string, boolean>>({});
  const setPresentationValue = useCallback(
    (key: string, value: boolean) =>
      setPresentation((v) => (v[key] === value ? v : { ...v, [key]: value })),
    [],
  );
  const navigationGuard = useRef<((route: string) => boolean) | undefined>(
    undefined,
  );
  const approvedNavigation = useRef<string | undefined>(undefined);
  const registerNavigationGuard = useCallback(
    (guard?: (route: string) => boolean) => {
      navigationGuard.current = guard;
    },
    [],
  );
  const [route, setRoute] = useState('home'),
    [query, setQuery] = useState(''),
    [values, setValues] = useState<Record<string, string>>({ ...defaults }),
    [loaded, setLoaded] = useState(false),
    [saveError, setSaveError] = useState(false),
    [modal, setModal] = useState<{ title: string; body: ReactNode } | null>(
      null,
    ),
    [toast, setToast] = useState(''),
    [scale, setScale] = useState(1),
    [unlocked, setUnlocked] = useState(false);
  const scroller = useRef<HTMLDivElement>(null),
    positions = useRef<Record<string, number>>({}),
    last = useRef('home'),
    parents = useRef<Record<string, string>>({}),
    tap = useRef({ count: 0, time: 0 }),
    entryUnlocked = useRef(false),
    toastTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const tell = (message: string) => {
    setToast(message);
    if (toastTimer.current) clearTimeout(toastTimer.current);
    toastTimer.current = setTimeout(() => setToast(''), 2600);
  };
  useEffect(() => {
    try {
      const saved = localStorage.getItem(STORAGE);
      if (saved) {
        const data = JSON.parse(saved);
        if (data && typeof data === 'object' && !Array.isArray(data))
          setValues(normalizeFanSettings({ ...defaults, ...data }));
      }
    } catch {
      setSaveError(true);
    }
    setLoaded(true);
    const change = () => {
      const h = decodeURIComponent(location.hash.slice(1));
      const next = resolveDestination(aliases[h] || h || 'home');
      if (concealedRoutes.has(next) && !entryUnlocked.current) {
        history.replaceState(null, '', '#home');
        setRoute('home');
      } else {
        const approved = approvedNavigation.current === next;
        approvedNavigation.current = undefined;
        if (
          next !== last.current &&
          !approved &&
          navigationGuard.current &&
          !navigationGuard.current(next)
        ) {
          history.replaceState(null, '', '#' + last.current);
          return;
        }
        if (h !== next) history.replaceState(null, '', '#' + next);
        setRoute(next);
      }
      setModal(null);
    };
    change();
    window.addEventListener('hashchange', change);
    const lockEntry = () => {
      entryUnlocked.current = false;
      setUnlocked(false);
      tap.current = { count: 0, time: 0 };
      change();
    };
    const visibility = () => {
      if (document.visibilityState === 'hidden') lockEntry();
    };
    document.addEventListener('visibilitychange', visibility);
    window.addEventListener('pagehide', lockEntry);
    const resize = () =>
      setScale(Math.min((innerWidth - 24) / 390, (innerHeight - 56) / 904, 1));
    resize();
    window.addEventListener('resize', resize);
    return () => {
      window.removeEventListener('hashchange', change);
      document.removeEventListener('visibilitychange', visibility);
      window.removeEventListener('pagehide', lockEntry);
      window.removeEventListener('resize', resize);
      if (toastTimer.current) clearTimeout(toastTimer.current);
    };
  }, []);
  useEffect(() => {
    const onError = (event: ErrorEvent) =>
      recordEvent(
        'browser_error',
        event.filename,
        event.error?.stack || event.message,
      );
    const onRejection = (event: PromiseRejectionEvent) =>
      recordEvent('unhandled_rejection', 'promise', String(event.reason));
    window.addEventListener('error', onError);
    window.addEventListener('unhandledrejection', onRejection);
    recordEvent('prototype_open');
    return () => {
      window.removeEventListener('error', onError);
      window.removeEventListener('unhandledrejection', onRejection);
    };
  }, []);
  useEffect(() => {
    if (!loaded) return;
    try {
      localStorage.setItem(STORAGE, JSON.stringify(values));
      setSaveError(false);
    } catch {
      setSaveError(true);
    }
  }, [values, loaded]);
  useLayoutEffect(() => {
    if (scroller.current) {
      scroller.current.scrollTop = positions.current[route] || 0;
    }
    last.current = route;
  }, [route]);
  useEffect(() => {
    setQuery('');
  }, [route]);
  const go = (next: string) => {
    if (next === 'terms' || next === 'privacy') {
      setModal({
        title: next === 'terms' ? '用户协议' : '隐私政策',
        body: (
          <>
            <LegalContent kind={next} />
            <footer>
              <button onClick={() => setModal(null)}>关闭</button>
            </footer>
          </>
        ),
      });
      return;
    }
    if (scroller.current) positions.current[route] = scroller.current.scrollTop;
    next = resolveDestination(aliases[next] || next);
    if (concealedRoutes.has(next) && !entryUnlocked.current) return;
    if (next === route) return;
    if (navigationGuard.current && !navigationGuard.current(next)) return;
    approvedNavigation.current = next;
    // Canonical parents cannot be overwritten by upward breadcrumb navigation.
    parents.current[next] =
      canonicalParent(next) === 'home' && !next.startsWith('target-')
        ? route
        : canonicalParent(next);
    setModal(null);
    if (next !== route) location.hash = next;
  };
  const back = () => {
    let parent =
      resolveGroup(route) || route === 'extra_dim'
        ? canonicalParent(route)
        : parents.current[route];
    if (!parent || singleChildRoute(parent)) {
      parent = canonicalParent(route);
    }
    if (scroller.current) positions.current[route] = scroller.current.scrollTop;
    if (navigationGuard.current && !navigationGuard.current(parent)) return;
    approvedNavigation.current = parent;
    setModal(null);
    location.hash = parent;
  };
  const model = {
    values,
    set: (key: string, value: string) => {
      recordEvent('setting_changed', key, value);
      setValues((v) => ({ ...v, [key]: value }));
    },
    go,
    back,
    tell,
    dialog: (title: string, body: ReactNode) => setModal({ title, body }),
    close: () => setModal(null),
    registerNavigationGuard,
  };
  const systemVersionTap = () => {
    if (route !== 'about') return;
    const now = Date.now();
    tap.current = {
      count: now - tap.current.time > 2000 ? 1 : tap.current.count + 1,
      time: now,
    };
    if (tap.current.count >= 7) {
      entryUnlocked.current = true;
      setUnlocked(true);
      tap.current.count = 0;
      tell('完整功能已开放');
    }
  };
  const target = targets.find((t) => 'target-' + t.id === route);
  const group = resolveGroup(route);
  const editorOwner = targets.find((t) =>
    t.entries.some((e) => e.route === route),
  );
  const pageOwner = target || group?.target || editorOwner;
  const restart = () =>
    model.dialog(
      '重启作用域',
      <Restart
        scope={
          pageOwner?.restartScope ||
          ([
            'shoulder',
            'rapid_compatibility',
            'ai_trigger',
            'fan_control',
            'combo_speed',
            'super_resolution',
            'diablo_coexist',
          ].includes(route)
            ? 'games'
            : route === 'status_layout'
              ? 'systemui'
              : ['freeform', 'audio_gain', 'signature_install'].includes(route)
                ? 'device'
                : ['hide_apps', 'automation', 'tile', 'battery'].includes(route)
                  ? 'settings'
                  : 'apps')
        }
        done={() => {
          model.close();
          tell('原型演示：作用域已重启');
        }}
        close={model.close}
      />,
    );
  const openTarget = (t: (typeof targets)[number]) => {
    setQuery('');
    go('target-' + t.id);
  };
  const matching = targets.flatMap((t, i) => {
    const q = query.trim().toLowerCase();
    if (
      q &&
      t.id === 'launcher' &&
      '自定义桌面布局 网格 行数 列数 n×n nxn'.includes(q)
    )
      return [{ t, i, copy: '包含：自定义桌面布局' }];
    if (
      q &&
      t.id === 'systemui' &&
      '状态栏表格 excel 单元格 行高 列宽'.includes(q)
    )
      return [{ t, i, copy: '包含：状态栏表格编辑' }];
    if (
      !q ||
      [t.title, t.summary, ...t.packages].join(' ').toLowerCase().includes(q)
    )
      return [{ t, i, copy: t.summary }];
    const o = t.sections
      .flatMap((s) => s.options)
      .find((o) => (o.title + o.summary).toLowerCase().includes(q));
    const e = t.entries.find((e) =>
      (e.title + e.summary).toLowerCase().includes(q),
    );
    return o || e ? [{ t, i, copy: '包含：' + (o || e)!.title }] : [];
  });
  const runtime = runtimeState(values);
  const brandHeading = (
    <div className="p-home-heading">
      <h1 className="c-brand-line">红魔Duo</h1>
      <span>让红魔更顺手</span>
    </div>
  );
  let content: ReactNode;
  if (route === 'home')
    content = (
      <>
        {brandHeading}
        <div
          className="c-card c-search"
          {...identity('SettingsActivity.search', '搜索应用或功能')}
        >
          <Search size={20} />
          <input
            aria-label="搜索应用或功能"
            placeholder="搜索应用或功能"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
          />
          {query && <button onClick={() => setQuery('')}>清除</button>}
        </div>
        {matching.length > 0 && (
          <div className="c-app-list">
            {matching.map(({ t }) => {
              const Icon = icons[t.id] || AppWindow;
              return (
                <button
                  key={t.id}
                  className="c-card c-app-row"
                  {...identity('HookAppCatalog:' + t.id, t.title)}
                  onClick={() => openTarget(t)}
                >
                  {appIcons[t.id] ? (
                    <img className="c-app-icon" src={appIcons[t.id]} alt="" />
                  ) : (
                    <span className="c-app-icon c-library-icon">
                      <Icon size={31} />
                    </span>
                  )}
                  <span className="c-app-copy">
                    <strong>{t.title}</strong>
                  </span>
                  <ChevronRight size={15} />
                </button>
              );
            })}
            {unlocked && !query && (
              <button
                className="c-card c-app-row"
                {...identity('route:hide', '四大皆空')}
                title="应用管理、自动隐藏与快捷磁贴"
                onClick={() => go('hide')}
              >
                <img className="c-app-icon" src="/current/boat.png" alt="" />
                <span className="c-app-copy">
                  <strong>四大皆空</strong>
                </span>
                <ChevronRight size={15} />
              </button>
            )}
          </div>
        )}
        {matching.length === 0 && (
          <p className="c-empty">
            没有找到相关应用或功能
            <br />
            试试“时钟”“音量”或“桌面”
          </p>
        )}
      </>
    );
  else if (route === 'settings')
    content = (
      <>
        {brandHeading}
        <section
          className={'c-card p-runtime p-runtime--' + runtime.tone}
          aria-label="模块状态"
          data-state={runtime.id}
          {...identity('SettingsActivity:module-runtime-card', '模块状态')}
        >
          <img
            className="p-runtime-art"
            src="/current/module-status.png"
            alt=""
          />
          <div className="p-runtime-copy">
            <strong>模块状态</strong>
            <small>{runtime.summary}</small>
            <p>{runtime.message}</p>
          </div>
        </section>
        <h3 className="c-group">模块设置</h3>
        <Card
          className="c-launcher-setting"
          path="SettingsActivity:settings-launcher-icon-switch"
          label="桌面图标"
        >
          <span className="c-setting-icon">
            <LayoutGrid size={22} />
          </span>
          <Toggle
            name="launcher-icon"
            title="桌面图标"
            initial="1"
            help="显示或隐藏红魔Duo的桌面入口。隐藏后仍可从 LSPosed 管理器的模块设置进入。"
          />
        </Card>
        <Card
          className="c-launcher-setting"
          path="SettingsActivity:settings-angular-cards-switch"
          label="棱角卡片"
        >
          <span className="c-setting-icon">
            <ScanLine size={22} />
          </span>
          <Toggle
            name="ls_augment_appearance_angular_cards"
            title="棱角卡片"
            initial="1"
            help="开启时使用小圆角棱角卡片，关闭时使用圆角卡片。立即应用于模块所有页面。"
          />
        </Card>
        <h3 className="c-group">配置管理</h3>
        <CurrentMaintenance
          reset={() => setValues({ ...defaults })}
          restore={(settings) =>
            setValues((current) => restoreSettings(current, settings, defaults))
          }
        />
      </>
    );
  else if (route === 'about')
    content = (
      <>
        {brandHeading}
        <Card
          className="c-device"
          path="ModuleAbout:about-device-card"
          label="当前设备"
        >
          <h3>当前设备</h3>

          {[
            ['设备型号', device.model],
            ['系统版本', device.systemVersion],
            ['Android 版本', device.androidVersion],
          ].map(([label, value]) =>
            label === '系统版本' ? (
              <button
                key={label}
                className="p-device-row"
                onClick={systemVersionTap}
                aria-label={'系统版本 ' + value}
              >
                <span>{label}</span>
                <small>{value}</small>
              </button>
            ) : (
              <div key={label} className="p-device-row">
                <span>{label}</span>
                <small>{value}</small>
              </div>
            ),
          )}
        </Card>
        <Card className="p-about-links">
          <a
            className="p-about-row"
            href="https://github.com/liligit1815/LS_Augment"
            target="_blank"
            rel="noreferrer"
          >
            <img src="/current/avatar_liligit1815.jpg" alt="" />
            <strong>开发者</strong>
            <small>liligit1815</small>
            <ChevronRight size={17} />
          </a>
          <button className="p-about-row" onClick={() => go('contributors')}>
            <Users size={23} />
            <strong>贡献者</strong>
            <ChevronRight size={17} />
          </button>
          <button className="p-about-row" onClick={() => go('support')}>
            <Heart size={23} />
            <strong>支持</strong>
            <ChevronRight size={17} />
          </button>
        </Card>
        <Card className="p-about-links">
          <button className="p-about-row" onClick={() => go('terms')}>
            <FileText size={23} />
            <strong>用户协议</strong>
            <ChevronRight size={17} />
          </button>
          <button className="p-about-row" onClick={() => go('privacy')}>
            <Shield size={23} />
            <strong>隐私政策</strong>
            <ChevronRight size={17} />
          </button>
        </Card>
      </>
    );
  else if (target) {
    content = <CurrentApplication target={target} />;
  } else if (group) {
    content = (
      <CurrentApplicationSection
        target={group.target}
        section={group.section}
      />
    );
  } else if (route === 'extra_dim') {
    content = <ExtraDimEditor />;
  } else if (route === 'status_canvas') {
    content = <CurrentStatusCanvas />;
  } else if (route === 'status_assets' || route.startsWith('asset/')) {
    content = (
      <CurrentStatusAssets
        key={route}
        id={route.startsWith('asset/') ? route.slice(6) : undefined}
      />
    );
  } else if (settingTitles[route])
    content = <CurrentSettingsPage route={route} />;
  else if (editorTitles[route]) content = <CurrentEditor route={route} />;
  else
    content = (
      <>
        <p>未找到此页面</p>
        <Button onClick={() => go('home')}>返回主页</Button>
      </>
    );
  const isMain = main.includes(route),
    title =
      target?.title ||
      group?.section.title ||
      (route === 'extra_dim' ? '极暗与快捷磁贴' : '') ||
      (route === 'status_canvas' ? '工作表画布' : '') ||
      (route === 'status_assets'
        ? '素材与字体'
        : route.startsWith('asset/')
          ? (assetIcons.find((icon) => 'asset/' + icon.id === route)?.title ||
              '图标') + '素材'
          : '') ||
      settingTitles[route] ||
      editorTitles[route] ||
      'LS_Augment';
  return (
    <CurrentContext.Provider value={model}>
      <PresentationContext.Provider
        value={{ route, state: presentation, set: setPresentationValue }}
      >
        <AssetWorkspaceProvider>
          <main className="c-stage">
            <div className="c-caption">
              红魔Duo · 可交互原型 ·{' '}
              {saveError
                ? '保存失败，请导出备份'
                : '示例数据 · 操作仅保存在网页'}
              <label className="p-scene-control">
                状态预览{' '}
                <select
                  aria-label="状态预览"
                  value={runtime.id}
                  onChange={(e) =>
                    model.set('prototype:runtime-state', e.target.value)
                  }
                >
                  <option value="ready">LSP + ROOT</option>
                  <option value="lsp-only">仅 LSP</option>
                  <option value="root-only">仅 ROOT</option>
                  <option value="missing">均未就绪</option>
                  <option value="update-pending">旧版 LSP + ROOT</option>
                </select>
              </label>
              <button
                className="c-restore-sample"
                onClick={() => {
                  setValues({ ...defaults });
                  setQuery('');
                  setSampleRevision((revision) => revision + 1);
                  positions.current = {};
                  setPresentation({});
                  setModal(null);
                  tell('已还原示例状态');
                }}
              >
                还原示例
              </button>
            </div>
            <div
              className="p-device-frame"
              style={{ width: 390 * scale, height: 904 * scale }}
            >
              <div
                className="c-phone"
                data-testid="device-screen"
                data-route={route}
                data-level={navigationLevel(route)}
                data-angular-cards={
                  (values.ls_augment_appearance_angular_cards ?? '1') === '1'
                }
                style={{
                  transform: `scale(${scale})`,
                  transformOrigin: 'top left',
                }}
              >
                <CurrentBackground opacity={1} />
                <div
                  className="c-system-bar c-latest-system-bar"
                  aria-hidden="true"
                >
                  <CurrentSystemChrome />
                </div>
                {!isMain && (
                  <Header
                    title={title}
                    restart={
                      pageOwner ||
                      route === 'extra_dim' ||
                      (editorTitles[route] &&
                        !['hide', 'launcher_custom'].includes(route))
                        ? restart
                        : undefined
                    }
                  />
                )}
                {!isMain && (
                  <div className="d-page-path"><DetailBreadcrumb route={route} /></div>
                )}
                <div
                  ref={scroller}
                  className={
                    'c-scroll ' +
                    (isMain ? 'c-main-scroll ' : '') +
                    (route === 'home' ? 'c-home-scroll ' : '') +
                    (route === 'settings' ? 'c-module-scroll ' : '') +
                    (route === 'about' ? 'c-about-scroll' : '') +
                    (target ? ' c-target-scroll' : '') +
                    (route === 'status_layout' ? ' c-status-scroll' : '')
                  }
                  onScroll={(e) => {
                    positions.current[route] = e.currentTarget.scrollTop;
                  }}
                  key={route + ':' + sampleRevision}
                >
                  {content}
                </div>
                {isMain && (
                  <CurrentGlassDock
                    route={route}
                    go={go}
                    moduleIcon={DuoOutline}
                  />
                )}
                <div className="c-gesture" aria-hidden="true" />
                {toast && <output className="c-toast">{toast}</output>}
                {modal && (
                  <Modal title={modal.title} onClose={model.close}>
                    {modal.body}
                  </Modal>
                )}
              </div>
            </div>
          </main>
        </AssetWorkspaceProvider>
      </PresentationContext.Provider>
    </CurrentContext.Provider>
  );
}
function Restart({
  scope,
  done,
  close,
}: {
  scope: string;
  done: () => void;
  close: () => void;
}) {
  const scopes = ['settings', 'systemui', 'device', 'apps', 'games', 'all'],
    [selected, select] = useState(Math.max(0, scopes.indexOf(scope)));
  return (
    <>
      {[
        '隐藏列表（系统设置）',
        '状态栏（SystemUI）',
        '系统核心与连接（重启手机）',
        '应用增强（安装兼容、双开与主题商店）',
        '游戏增强（游戏空间与风扇）',
        '全部作用域（重启手机）',
      ].map((label, i) => (
        <label className="c-radio" key={label}>
          <input
            type="radio"
            name="restart"
            checked={selected === i}
            onChange={() => select(i)}
          />
          {label}
        </label>
      ))}
      <footer>
        <button onClick={close}>取消</button>
        <button onClick={done}>立即重启</button>
      </footer>
    </>
  );
}
