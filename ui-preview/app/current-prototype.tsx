/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
/* eslint-disable react/react-compiler -- This prototype synchronizes browser storage, scroll restoration and native-style drafts without the React compiler. */
'use client';
import {
  useEffect,
  useLayoutEffect,
  useRef,
  useState,
  type ReactNode,
} from 'react';
import {
  Home,
  SlidersHorizontal,
  Info,
  Search,
  ChevronRight,
  LayoutGrid,
  MessageSquare,
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
  KeyRound,
  Wifi,
  Bluetooth,
  BatteryFull,
  BellOff,
} from 'lucide-react';
import catalog from './current-catalog.json';
import {
  CurrentContext,
  Card,
  LinkCard,
  Toggle,
  Button,
  Header,
  Modal,
  identity,
} from './current-ui';
import { CurrentApplication } from './current-application';
import { CurrentMaintenance } from './current-maintenance';
import { CurrentBackground } from './current-background';
import { CurrentEditor, editorTitles, editorDefaults } from './current-editors';
import {
  CurrentSettingsPage,
  settingTitles,
  LegalContent,
} from './current-settings';
import './current.css';
import { restoreSettings } from './current-backup';
const targets = catalog.targets;
const main = ['home', 'settings', 'about'];
const concealedRoutes = new Set(['hide', 'hide_apps', 'automation', 'tile']);
const icons = [
  Settings,
  Smartphone,
  Settings,
  AppWindow,
  Gamepad2,
  Scan,
  Fan,
  Palette,
  Copy,
  Download,
  Archive,
  Download,
  Wind,
  CloudSun,
  Nfc,
  Folder,
  Shield,
  Camera,
];
const aliases: Record<string, string> = {
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
  system: 'target-system',
  tools: 'settings',
};
const defaults = {
  ...editorDefaults,
  ...Object.fromEntries(catalog.options.map((o) => [o.key, o.defaultValue])),
};
const appIcons: Record<string, string> = {
  system: 'app-system',
  systemui: 'systemui',
  settings: 'settings',
  launcher: 'launcher',
  game: 'game',
  theme: 'theme',
  store: 'store',
  health: 'health',
  weather: 'weather',
};
const STORAGE = 'ls-augment-current-prototype-20288';
export default function CurrentPrototype() {
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
    [aboutY, setAboutY] = useState(0),
    [unlocked, setUnlocked] = useState(false),
    [aboutSpacer, setAboutSpacer] = useState(416);
  const scroller = useRef<HTMLDivElement>(null),
    positions = useRef<Record<string, number>>({}),
    last = useRef('home'),
    parents = useRef<Record<string, string>>({}),
    pendingQuery = useRef(''),
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
          setValues({ ...defaults, ...data });
      }
    } catch {
      setSaveError(true);
    }
    setLoaded(true);
    const change = () => {
      const h = decodeURIComponent(location.hash.slice(1));
      const next = aliases[h] || h || 'home';
      if (concealedRoutes.has(next) && !entryUnlocked.current) {
        history.replaceState(null, '', '#home');
        setRoute('home');
      } else setRoute(next);
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
    const visibility = () => { if (document.visibilityState === 'hidden') lockEntry(); };
    document.addEventListener('visibilitychange', visibility);
    window.addEventListener('pagehide', lockEntry);
    const resize = () =>
      setScale(
        Math.min(
          (innerWidth - 24) / (1216 / 3.25),
          (innerHeight - 56) / (2688 / 3.25),
          1.16,
        ),
      );
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
      setAboutY(scroller.current.scrollTop);
    }
    last.current = route;
    if (route.startsWith('target-') && pendingQuery.current) {
      const q = pendingQuery.current.toLowerCase();
      pendingQuery.current = '';
      requestAnimationFrame(() => {
        const candidates = Array.from(
          scroller.current?.querySelectorAll<HTMLElement>('[data-ui-label]') ||
            [],
        );
        const item = candidates.find((e) =>
          (e.dataset.uiLabel || '').toLowerCase().includes(q),
        );
        if (item && scroller.current)
          scroller.current.scrollTop = item.offsetTop - 10;
      });
    }
  }, [route]);
  useLayoutEffect(() => {
    if (route !== 'about' || !scroller.current) return;
    const area = scroller.current;
    const measure = () => {
      const card = area.querySelector<HTMLElement>('.c-device');
      if (card)
        setAboutSpacer(
          Math.max(389, area.clientHeight - 96 - 10 - card.offsetHeight - 15),
        );
    };
    measure();
    void document.fonts.ready.then(measure);
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
    next = aliases[next] || next;
    if (concealedRoutes.has(next) && !entryUnlocked.current) return;
    parents.current[next] = route;
    setModal(null);
    if (next !== route) location.hash = next;
  };
  const back = () => {
    let parent = parents.current[route];
    if (!parent) {
      const owner = targets.find((t) =>
        t.entries.some((e) => e.route === route),
      );
      parent = route.startsWith('target-')
        ? 'home'
        : owner
          ? 'target-' + owner.id
          : settingTitles[route]
            ? 'settings'
            : 'home';
    }
    if (scroller.current) positions.current[route] = scroller.current.scrollTop;
    setModal(null);
    location.hash = parent;
  };
  const model = {
    values,
    set: (key: string, value: string) =>
      setValues((v) => ({ ...v, [key]: value })),
    go,
    back,
    tell,
    dialog: (title: string, body: ReactNode) => setModal({ title, body }),
    close: () => setModal(null),
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
  const restart = () =>
    model.dialog(
      '重启作用域',
      <Restart
        scope={
          target?.restartScope ||
          ([
            'shoulder',
            'ai_trigger',
            'fan_control',
            'combo_speed',
            'super_resolution',
            'diablo_coexist',
            'diagnostics',
            'detailed_diagnostics',
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
    pendingQuery.current = query.trim();
    go('target-' + t.id);
  };
  const matching = targets.flatMap((t, i) => {
    const q = query.trim().toLowerCase();
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
  let content: ReactNode;
  if (route === 'home')
    content = (
      <>
        <div className="c-brand-line">LS_Augment</div>
        <p className="c-home-tagline">让红魔更顺手</p>
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
        <div className="c-list-heading">
          <strong>{query ? '搜索结果' : '应用配置'}</strong>
          <span>{matching.length} 个应用</span>
        </div>
        <div className="c-app-list">
          {matching.map(({ t, i, copy }) => {
            const Icon = icons[i];
            return (
              <button
                key={t.id}
                className="c-card c-app-row"
                {...identity('HookAppCatalog:' + t.id, t.title)}
                onClick={() => openTarget(t)}
              >
                {appIcons[t.id] ? (
                  <img
                    className="c-app-icon"
                    src={'/current/' + appIcons[t.id] + '.png'}
                    alt=""
                  />
                ) : (
                  <span className="c-app-icon c-library-icon">
                    <Icon size={31} />
                  </span>
                )}
                <span className="c-app-copy">
                  <strong>{t.title}</strong>
                  <span>{copy}</span>
                  <small>{t.packageName}</small>
                </span>
                <ChevronRight size={15} />
              </button>
            );
          })}
        </div>
        {matching.length === 0 && (
          <p className="c-empty">
            没有找到相关应用或功能
            <br />
            试试“时钟”“音量”或“桌面”
          </p>
        )}
        {unlocked && !query && (
          <LinkCard
            title="消失吧APP"
            help="应用管理、自动隐藏与快捷磁贴"
            route="hide"
          />
        )}
      </>
    );
  else if (route === 'settings')
    content = (
      <>
        <div className="c-brand-line">LS_Augment</div>
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
            help="显示或隐藏 LS_Augment 的桌面入口。隐藏后仍可从 LSPosed 管理器的模块设置进入。"
          />
        </Card>
        <h3 className="c-group">配置与维护</h3>
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
        <div className="c-about-spacer" style={{ height: aboutSpacer }} />
        <Card
          className="c-device"
          path="ModuleAbout:about-device-card"
          label="当前设备"
        >
          <h3>当前设备</h3>
          <h2>MIX11</h2>
          {[
            ['设备型号', 'NX809J'],
            ['安卓版本', '16'],
            ['系统版本', 'RedMagicOS11.5.7MR1'],
            ['桌面版本', '系统桌面 · 16.0.010.000.2604151532'],
          ].map(([a, b]) => (
            <div key={a} {...identity('device-info:' + a, a)}
              role={a === '系统版本' ? 'button' : undefined}
              tabIndex={a === '系统版本' ? 0 : undefined}
              onClick={a === '系统版本' ? systemVersionTap : undefined}
              onKeyDown={a === '系统版本' ? (event) => {
                if ((event.key === 'Enter' || event.key === ' ') && !event.repeat) {
                  event.preventDefault(); systemVersionTap();
                }
              } : undefined}
            >
              <small>{a}</small>
              <p>{b}</p>
            </div>
          ))}
        </Card>
        <Card
          className="c-developer"
          path="ModuleAbout:about-developer-profile"
          label="开发者"
        >
          <h3>开发者</h3>
          <a
            href="https://github.com/liligit1815/LS_Augment"
            target="_blank"
            rel="noreferrer"
          >
            <img src="/current/avatar_liligit1815.jpg" alt="liligit1815" />
            <span>
              <strong>liligit1815</strong>
              <small>问题反馈、版本查询，请点击前往 GitHub</small>
            </span>
            <ChevronRight size={18} />
          </a>
        </Card>
        <LinkCard
          title="贡献者"
          summary="感谢为项目提供帮助的个人与团队"
          route="contributors"
        />
        <LinkCard
          title="支持"
          summary="您可以在此处捐赠以支持我们。"
          route="support"
        />
        <Card className="c-legal">
          <LinkCard
            title="用户协议"
            summary="使用前了解功能边界与注意事项"
            route="terms"
          />
          <LinkCard
            title="隐私政策"
            summary="了解本地信息、权限与数据管理"
            route="privacy"
          />
        </Card>
      </>
    );
  else if (target) {
    content = <CurrentApplication target={target} />;
  } else if (settingTitles[route])
    content = (
      <CurrentSettingsPage
        route={route}
        reset={() => setValues({ ...defaults })}
        restore={(settings) =>
          setValues((current) => restoreSettings(current, settings, defaults))
        }
      />
    );
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
      settingTitles[route] ||
      editorTitles[route] ||
      'LS_Augment';
  return (
    <CurrentContext.Provider value={model}>
      <main className="c-stage">
        <div className="c-caption">
          test20289 · 界面标注原型 ·{' '}
          {saveError ? '保存失败，请导出备份' : '示例状态，操作自动保存'}
        </div>
        <div
          className="c-phone"
          data-testid="device-screen"
          data-route={route}
          style={{ zoom: scale }}
        >
          <CurrentBackground
            opacity={route === 'about' ? Math.max(0, 1 - aboutY / 389) : 1}
          />
          <div className="c-system-bar" aria-hidden="true">
            <span>17:51</span>
            <span className="c-system-notices">
              <MessageSquare size={11} />
              <Info size={11} />
            </span>
            <span className="c-system-right">
              <KeyRound />
              <Bluetooth />
              <BellOff />
              <small>
                0.03
                <br />
                KB/s
              </small>
              <Wifi />
              <BatteryFull />
            </span>
          </div>
          {!isMain && (
            <Header
              title={title}
              restart={
                target ||
                (editorTitles[route] &&
                  !['hide', 'launcher_custom'].includes(route))
                  ? restart
                  : undefined
              }
            />
          )}
          <div
            ref={scroller}
            className={
              'c-scroll ' +
              (isMain ? 'c-main-scroll ' : '') +
              (route === 'about' ? 'c-about-scroll' : '') +
              (target ? ' c-target-scroll' : '') +
              (route === 'status_layout' ? ' c-status-scroll' : '')
            }
            onScroll={(e) => {
              positions.current[route] = e.currentTarget.scrollTop;
              if (route === 'about') setAboutY(e.currentTarget.scrollTop);
            }}
            key={route}
          >
            {content}
          </div>
          {route === 'about' && (
            <>
              <div
                className="c-about-hero"
                onWheel={(e) => {
                  if (scroller.current) scroller.current.scrollTop += e.deltaY;
                }}
              >
                <div
                  aria-hidden={aboutY >= 230}
                  style={{
                    opacity: Math.min(1, Math.max(0, 1 - (aboutY - 190) / 40)),
                    transform: `scale(${1 - 0.1 * Math.min(1, Math.max(0, (aboutY - 190) / 40))})`,
                    visibility: aboutY >= 230 ? 'hidden' : undefined,
                  }}
                >
                  <div>
                    <img src="/current/boat.png" alt="" />
                  </div>
                  <h1>LS_Augment</h1>
                </div>
                <div
                  className="c-version"
                  aria-hidden={aboutY >= 190}
                  style={{
                    opacity: Math.max(0, 1 - aboutY / 190),
                    transform: `scale(${1 - 0.1 * Math.min(1, Math.max(0, aboutY / 389))})`,
                    visibility: aboutY >= 190 ? 'hidden' : undefined,
                  }}
                >
                  2.0.0-alpha1-test20289 | debug
                </div>
              </div>
              <div
                className="c-about-title"
                aria-hidden={aboutY < 230}
                style={{ opacity: aboutY >= 230 ? 1 : 0 }}
              >
                关于
              </div>
            </>
          )}
          {isMain && (
            <nav className="c-bottom-nav" aria-label="主导航">
              {[
                ['home', '主页', Home],
                ['settings', '设置', SlidersHorizontal],
                ['about', '关于', Info],
              ].map(([r, label, Icon]) => {
                const I = Icon as typeof Home;
                return (
                  <button
                    key={String(r)}
                    aria-current={route === r ? 'page' : undefined}
                    onClick={() => go(String(r))}
                    {...identity('SettingsActivity:tab-' + r, String(label))}
                  >
                    <I size={22} />
                    <span>{String(label)}</span>
                  </button>
                );
              })}
            </nav>
          )}
          <div className="c-gesture" aria-hidden="true" />
          {toast && <output className="c-toast">{toast}</output>}
          {modal && (
            <Modal title={modal.title} onClose={model.close}>
              {modal.body}
            </Modal>
          )}
        </div>
      </main>
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
