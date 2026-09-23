/* eslint-disable react/react-compiler -- This prototype synchronizes browser storage, scroll restoration and native-style drafts without the React compiler. */
'use client';

import { useEffect, useRef, useState } from 'react';
import { Button, Card, FeatureTitle, identity } from './current-ui';

type CompatibilityRoute = 'framework' | 'version' | 'launcher_compatibility';
type CheckState = 'match' | 'needs-verification' | 'unavailable' | 'mismatch';
type CheckItem = {
  id: string;
  title: string;
  state: CheckState;
  summary: string;
  detail: string;
};
type SoftwareSample = {
  packageName: string;
  title: string;
  baseline?: readonly [version: string, code: number];
  observed?: readonly [version: string, code: number];
};

const MODULE_VERSION = '2.0.0-alpha1-test20288';
const FINGERPRINT =
  'REDMAGIC/NX809J/NX809J:16/BQ2A.250705.001-BP2A.250605.031.A3/20260423.111548:user/release-keys';
const ORIGINAL_LAUNCHER = '16.0.010.000.2604151532';
const MODIFIED_LAUNCHER = '26.9.260.908.2609081608';

// Observed states below are transcribed from 80-help-framework.png and
// 81-help-version.png. A replay is never a live framework or device check.
const FRAMEWORK_ITEMS: readonly CheckItem[] = [
  {
    id: 'framework-connection',
    title: '框架连接',
    state: 'match',
    summary: '框架服务已连接',
    detail: 'LSPosed 2.2.0（7854）',
  },
  {
    id: 'framework-api',
    title: '框架 API',
    state: 'match',
    summary: '满足模块声明的最低 API',
    detail:
      '框架报告 API：102\n当前安装包要求：Modern libxposed API 102 起；目标 API 102\nAPI 版本满足要求不等于 Hook 已在目标进程中生效。',
  },
  {
    id: 'module-loading',
    title: '当前模块加载',
    state: 'unavailable',
    summary: '当前加载状态未知',
    detail: `当前模块：${MODULE_VERSION}\n当前框架服务暂不提供进程加载检查。已连接、API满足要求或作用域已勾选均不能证明当前版本已经加载。`,
  },
];

const SYSTEM_ITEMS: readonly CheckItem[] = [
  {
    id: 'device-system',
    title: '设备与系统',
    state: 'match',
    summary: '与已记录系统基准一致',
    detail:
      '品牌：REDMAGIC · nubia\n型号：NX809J\n系统版本：RedMagicOS11.5.7MR1\nAndroid：16（API 36）\n安全补丁：2026-07-05\n项目基准：NX809J · RedMagicOS11.5.7MR1 · Android API 36\n系统标识一致不代表全部功能已通过本次检查。',
  },
  {
    id: 'system-build',
    title: '系统构建',
    state: 'match',
    summary: '构建指纹与基准一致',
    detail: `当前：${FINGERPRINT}\n基准：${FINGERPRINT}`,
  },
  {
    id: 'runtime-architecture',
    title: '运行架构',
    state: 'match',
    summary: '提供 arm64 运行环境',
    detail:
      '当前架构：arm64-v8a\n极速连点等原生功能使用 arm64 库；架构匹配仍需对应功能专项验证。',
  },
];

// Order is HookTargetRegistry.packages(), excluding system. Baselines are
// from the packaged redmagic-baseline.json. Baseline values must never be
// silently treated as observed versions. Only the two evidenced snapshots
// below have observed values; other package observations stay unknown.
const SOFTWARE_SAMPLES: readonly SoftwareSample[] = [
  {
    packageName: 'com.android.settings',
    title: '设置',
    baseline: ['16.0.000.2604151632', 160000],
    observed: ['16.0.000.2604151632', 160000],
  },
  {
    packageName: 'com.android.systemui',
    title: '系统界面',
    baseline: ['16.0.000.101.2604151744', 160000],
  },
  {
    packageName: 'com.zte.beautify',
    title: '主题',
    baseline: ['16.1.000.000.2604151530', 161000],
  },
  { packageName: 'com.zte.beautifyadapter', title: 'com.zte.beautifyadapter' },
  { packageName: 'com.zte.cn.doubleapp', title: '应用双开' },
  { packageName: 'com.zte.recommend', title: 'com.zte.recommend' },
  {
    packageName: 'cn.nubia.gamelauncher',
    title: '游戏空间',
    baseline: ['16.5.000.000.2604151714', 261],
  },
  {
    packageName: 'cn.nubia.gameassist',
    title: '游戏助手',
    baseline: ['17.0.000.2604152046', 17260414],
  },
  { packageName: 'cn.nubia.gamelab', title: 'cn.nubia.gamelab' },
  { packageName: 'cn.nubia.fan', title: '散热风扇' },
  { packageName: 'com.mi.health', title: '小米运动健康' },
  { packageName: 'cn.nubia.neostore', title: '应用中心' },
  {
    packageName: 'com.zte.mifavor.launcher',
    title: '系统桌面',
    baseline: [MODIFIED_LAUNCHER, 260000],
    observed: [ORIGINAL_LAUNCHER, 160000],
  },
  { packageName: 'cn.nubia.gamehelperline', title: 'cn.nubia.gamehelperline' },
  {
    packageName: 'cn.nubia.gamehelpmodule',
    title: 'cn.nubia.gamehelpmodule',
    baseline: ['155.00.00.2604151638', 3],
  },
  {
    packageName: 'com.zte.game.plugintrigger',
    title: 'AI 触发器',
    baseline: ['160.00.00.2604140905', 16000],
  },
  {
    packageName: 'com.android.packageinstaller',
    title: '软件包安装程序',
    baseline: ['16.0.000.000.2604150851', 160000],
  },
  {
    packageName: 'com.zte.zdm',
    title: '系统更新',
    baseline: ['WNJ.REDMAGIC.FOTA.16.0.000.000.2604151545', 160000],
  },
  {
    packageName: 'com.zte.mifavor.weather',
    title: '天气',
    baseline: ['16.0.000.000.2604151545', 604],
  },
  {
    packageName: 'cn.zte.gamefloat',
    title: '游戏悬浮',
    baseline: ['2.5.0001.2604151542', 250001],
  },
  {
    packageName: 'cn.nubia.gamehighlights',
    title: '红魔时刻',
    baseline: ['160.00.000.2604140906', 216000000],
  },
  {
    packageName: 'com.android.permissioncontroller',
    title: '权限控制器',
    baseline: ['16.0.000.000.2604131527', 1600000000],
  },
  { packageName: 'com.android.nfc', title: 'NFC 服务', baseline: ['16', 36] },
  {
    packageName: 'cn.nubia.filebrowser',
    title: 'FileBrowser',
    baseline: ['13.0.000.000', 130000],
  },
  {
    packageName: 'com.android.ztescreenshot',
    title: '截屏录屏',
    baseline: ['16.0.000.000.2604151512', 160000],
  },
];

const SOFTWARE_ITEMS: readonly CheckItem[] = SOFTWARE_SAMPLES.map((sample) => {
  const expected = sample.baseline
    ? `记录基准：${sample.baseline[0]}（${sample.baseline[1]}）`
    : '记录基准：本版本未收录该应用的版本样本';
  if (!sample.observed) {
    return {
      id: sample.packageName,
      title: sample.title,
      state: 'unavailable',
      summary: '当前版本未记录 · 状态未知',
      detail: `${sample.packageName}\n当前版本：网页示例未收录\n${expected}\n此处仅展示记录基准，不能据此判断本机安装状态或适配结果。`,
    };
  }
  const current = `当前版本：${sample.observed[0]}（${sample.observed[1]}）`;
  const matches =
    sample.baseline?.[0] === sample.observed[0] &&
    sample.baseline?.[1] === sample.observed[1];
  const launcher = sample.packageName === 'com.zte.mifavor.launcher';
  return {
    id: sample.packageName,
    title: sample.title,
    state: matches ? 'match' : 'needs-verification',
    summary: matches
      ? '版本与基准一致 · 功能需实测'
      : launcher
        ? '已识别原厂桌面版本 · 仍需专项验证'
        : '版本不同 · 适配需要验证',
    detail:
      `${sample.packageName}\n${current}\n${expected}` +
      (launcher
        ? `\n原厂桌面另有记录：${ORIGINAL_LAUNCHER}（160000）。本页仅比较版本；原厂签名和关键权限可返回帮助，打开“修改版桌面兼容性”检查。`
        : ''),
  };
});

// 82-help-launcher.png records an unverified certificate, not a successful
// installation check. Keep that exact result instead of inferring success
// from the matching model and launcher version.
const LAUNCHER_RESULT = `兼容性未验证，请勿直接安装\n\n机型：NX809J\n系统：RedMagicOS11.5.7MR1\nAndroid：16\n当前桌面：${ORIGINAL_LAUNCHER}（160000）\n\n当前桌面不是已记录的原厂签名，无法据此确认原厂底包；已安装修改版也属于此情况。`;
const LAUNCHER_INTRO =
  '安装本项目修改版桌面前，先检查本机环境。检测不会安装应用或修改系统。';
const LAUNCHER_FOOTNOTE =
  '检测仅针对当前项目底包。版本不同或结果未验证时，请勿直接覆盖安装；保留原厂桌面及布局备份。签名覆盖开关只解决安装签名检查，不能解决系统不兼容。';

function localTime(time: number): string {
  const date = new Date(time);
  const pad = (n: number) => String(n).padStart(2, '0');
  return `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()} ${pad(date.getHours())}:${pad(date.getMinutes())}:${pad(date.getSeconds())}`;
}

function ResultGroup({
  title,
  items,
}: {
  title: string;
  items: readonly CheckItem[];
}) {
  return (
    <section className="c-compatibility-group" aria-label={title}>
      <h2>{title}</h2>
      {items.map((item) => (
        <Card
          key={item.id}
          className="c-compatibility-result"
          label={item.title}
          path={`CompatibilityDetailsActivity:result:${item.id}`}
        >
          <h3>{item.title}</h3>
          <p
            className={`c-compatibility-summary c-compatibility-state-${item.state}`}
          >
            {item.summary}
          </p>
          <p
            className="c-compatibility-detail"
            {...identity(
              `CompatibilityDetailsActivity:detail:${item.id}`,
              `${item.title}检查详情`,
            )}
          >
            {item.detail}
          </p>
        </Card>
      ))}
    </section>
  );
}

/** Content-only page: the parent owns the native header, scroll view and Back. */
export function CurrentCompatibility({ route }: { route: string }) {
  const [loading, setLoading] = useState(true);
  const [checkedAt, setCheckedAt] = useState<number | null>(null);
  const [hasResults, setHasResults] = useState(false);
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const request = useRef(0);

  function replay() {
    if (timer.current !== null) clearTimeout(timer.current);
    const current = ++request.current;
    setLoading(true);
    timer.current = setTimeout(() => {
      if (current !== request.current) return;
      timer.current = null;
      setCheckedAt(Date.now());
      setHasResults(true);
      setLoading(false);
    }, 360);
  }

  useEffect(() => {
    setHasResults(false);
    setCheckedAt(null);
    replay();
    return () => {
      request.current += 1;
      if (timer.current !== null) clearTimeout(timer.current);
      timer.current = null;
    };
  }, [route]);

  if (!['framework', 'version', 'launcher_compatibility'].includes(route))
    return null;
  const page = route as CompatibilityRoute;
  const isFramework = page === 'framework';
  const isLauncher = page === 'launcher_compatibility';

  return (
    <div
      className="c-compatibility"
      data-example="read-only-reference-replay"
      {...identity(
        `compatibility-section:${page}`,
        isLauncher
          ? '修改版桌面兼容性'
          : isFramework
            ? '框架兼容性'
            : '当前版本兼容性',
      )}
    >
      <style>{`
      .c-compatibility{margin:-2px -6px 0 10px;color:#14233a;line-height:1.16}
      .c-compatibility p{margin:0;white-space:pre-wrap;overflow-wrap:anywhere}
      .c-compatibility .c-compatibility-intro{padding:12px;margin-bottom:0}
      .c-compatibility .c-compatibility-intro-copy{font-size:12px;color:#64748b;margin-top:6px}
      .c-compatibility-refresh{margin:8px 0 0;padding:0;min-width:0;border:0}
      .c-compatibility-refresh>.c-button{width:100%;min-height:48px;margin:0;font-size:12.5px}
      .c-compatibility-refresh:disabled>.c-button{cursor:default;opacity:.55}
      .c-compatibility .c-compatibility-time{margin-top:6px;color:#64748b;font-size:11.5px}
      .c-compatibility .c-compatibility-example{display:block;color:#64748b;font-size:11px;line-height:1.25;margin-top:5px}
      .c-compatibility-results{margin-top:8px}
      .c-compatibility-group>h2{font-size:13px;font-weight:700;line-height:1.16;margin:8px 0}
      .c-compatibility .c-compatibility-result{padding:12px;margin:0 0 8px}
      .c-compatibility-result>h3{font-size:12.5px;font-weight:700;line-height:1.16;margin:0;overflow-wrap:anywhere}
      .c-compatibility .c-compatibility-summary{font-size:12px;font-weight:700;margin-top:5px}
      .c-compatibility-state-match{color:#0d9777}
      .c-compatibility-state-mismatch{color:#be3440}
      .c-compatibility-state-needs-verification,.c-compatibility-state-unavailable{color:#9d6300}
      .c-compatibility .c-compatibility-detail{font-size:11.5px;color:#64748b;margin-top:6px;user-select:text;-webkit-user-select:text;cursor:text}
      .c-compatibility .c-compatibility-launcher-copy{font-size:12px;color:#64748b;line-height:1.16}
      .c-compatibility .c-compatibility-launcher-result{padding:12px;margin:8px 0}
      .c-compatibility .c-compatibility-launcher-result>p{font-size:13px;line-height:1.16;user-select:text;-webkit-user-select:text;cursor:text}
      .c-compatibility .c-compatibility-launcher-refresh{margin:0}
      .c-compatibility .c-compatibility-launcher-refresh>.c-button{min-height:44px}
    `}</style>

      {isLauncher ? (
        <>
          <p className="c-compatibility-launcher-copy">{LAUNCHER_INTRO}</p>
          <Card
            className="c-compatibility-launcher-result"
            label="桌面兼容性检测结果"
            path="LauncherCompatibilityActivity:result"
          >
            <p aria-live="polite" aria-busy={loading}>
              {loading ? '正在检测…' : LAUNCHER_RESULT}
            </p>
          </Card>
          <fieldset
            className="c-compatibility-refresh c-compatibility-launcher-refresh"
            disabled={loading}
            {...identity('LauncherCompatibilityActivity:refresh', '重新检测')}
          >
            <Button onClick={replay}>重新检测</Button>
          </fieldset>
          <p className="c-compatibility-launcher-copy">{LAUNCHER_FOOTNOTE}</p>
        </>
      ) : (
        <>
          <Card
            className="c-compatibility-intro"
            label="只读检查"
            path={`CompatibilityDetailsActivity:intro:${page}`}
          >
            <FeatureTitle
              title="只读检查"
              help={
                isFramework
                  ? '读取框架连接、版本、API 和可用的当前进程加载证据。已连接或作用域已勾选不等于当前模块已加载。刷新不会申请 Root、写入作用域、启用功能或重启设备。'
                  : '读取本机系统与目标应用版本，并与当前模块随安装包收录的基准核对。已安装、版本相同都不能证明实际功能已经适配。刷新不会改变配置。'
              }
            />
            <p className="c-compatibility-intro-copy">
              {isFramework
                ? '连接、API 与加载状态分别核对。'
                : `当前模块：${MODULE_VERSION}\n系统与软件版本分别核对。`}
            </p>
          </Card>
          <fieldset
            className="c-compatibility-refresh"
            disabled={loading}
            {...identity('compatibility-refresh', '刷新检查')}
          >
            <Button onClick={replay}>
              {loading ? '正在检查…' : '刷新检查'}
            </Button>
          </fieldset>
          <p className="c-compatibility-time" aria-live="polite">
            {checkedAt === null
              ? '正在读取当前环境…'
              : `检查时间：${localTime(checkedAt)}`}
          </p>
          <div
            className="c-compatibility-results"
            aria-busy={loading}
            {...identity('compatibility-results', '兼容性检查结果')}
          >
            {hasResults &&
              (isFramework ? (
                <ResultGroup title="框架兼容性" items={FRAMEWORK_ITEMS} />
              ) : (
                <>
                  <ResultGroup title="系统兼容性" items={SYSTEM_ITEMS} />
                  <ResultGroup title="软件适配情况" items={SOFTWARE_ITEMS} />
                </>
              ))}
          </div>
        </>
      )}
    </div>
  );
}
