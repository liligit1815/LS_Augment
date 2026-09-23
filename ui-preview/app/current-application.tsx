'use client';
import type { ReactNode } from 'react';
import catalog from './current-catalog.json';
import groups from './current-feature-groups.json';
import editorData from './current-editor-data.json';
import { Card, Toggle, LinkCard, useModel, type Option } from './current-ui';
import { CurrentEditor } from './current-editors';
import { OptionInput, ValueGate } from './current-feature-input';

type Feature = {
  id: string;
  title: string;
  toggleKey: string | null;
  parameterKeys: string[];
  features: Feature[];
  activation: { noOpValue: string; comparison: string };
  hasConfiguration: boolean;
};
type Group = { id: string; title: string; features: Feature[] };
type Target = (typeof catalog.targets)[number];
const optionMap = Object.fromEntries(
  catalog.options.map((o) => [o.key, o]),
) as Record<string, Option>;
const entrySection: Record<string, string> = {
  freeform: 'freeform',
  audio_gain: 'audio',
  battery: 'battery',
  signature_install: 'installer',
  status_layout: 'statusbar',
  launcher_custom: 'launcher',
  shoulder: 'shoulder',
  combo_speed: 'combo',
  super_resolution: 'performance',
  ai_trigger: 'ai',
  fan_control: 'fan',
  beautify: 'theme',
  double_app: 'double',
  store_download: 'download',
  mi_health: 'health',
};
const sectionTitles: Record<string, string> = {
  freeform: '小窗与多任务',
  audio: '音量增强与规则',
  battery: '电池',
  installer: '应用安装规则',
  statusbar: '状态栏',
  launcher: '桌面与应用图标',
  shoulder: '肩键',
  combo: '连招',
  performance: '性能与超分',
  ai: 'AI 触发器',
  fan: '风扇',
  theme: '主题',
  double: '应用双开',
  download: '下载管理',
  health: '步数与每日计划',
};

function FeatureRow({ feature: f }: { feature: Feature }) {
  const toggle = f.toggleKey ? optionMap[f.toggleKey] : undefined;
  const body = f.hasConfiguration ? (
    <>
      {f.parameterKeys.map((key) => (
        <OptionInput key={key} option={optionMap[key]} />
      ))}
      {f.features.map((feature) => (
        <div className="c-sub-feature" key={feature.id}>
          <FeatureRow feature={feature} />
        </div>
      ))}
    </>
  ) : undefined;
  if (toggle)
    return (
      <Toggle
        name={toggle.key}
        title={f.title}
        help={toggle.help}
        initial={toggle.defaultValue}
      >
        {body}
      </Toggle>
    );
  const parameter = optionMap[f.parameterKeys[0]];
  return (
    <ValueGate
      name={f.id}
      title={f.title}
      help={parameter.help}
      defaults={{ [parameter.key]: f.activation.noOpValue }}
      comparison={f.activation.comparison}
    >
      {body}
    </ValueGate>
  );
}

function InlineEditor({ route }: { route: string }) {
  const m = useModel();
  if (route === 'status_layout')
    return (
      <Toggle
        name={editorData.defaults.SYSTEMUI_MASTER.key}
        title="状态栏布局与实时预览"
        help="开启后自定义状态栏布局、时钟、硬件信息及图标显示。"
      >
        <CurrentEditor route={route} embedded />
      </Toggle>
    );
  if (route === 'launcher_custom') {
    const defaults = Object.fromEntries(
      Object.keys(m.values)
        .filter((key) => key.startsWith('launcher:'))
        .map((key) => [key, '']),
    );
    return (
      <ValueGate
        name="launcher_custom"
        title="自定义应用图标与名称"
        help="按用户空间选择应用，修改后自动保存。"
        defaults={defaults}
      >
        <CurrentEditor route={route} embedded />
      </ValueGate>
    );
  }
  return <CurrentEditor route={route} embedded />;
}

export function CurrentApplication({ target }: { target: Target }) {
  const m = useModel();
  const source = groups.targets.find((t) => t.id === target.id);
  const sections = (source?.sections || []).map((s) => ({
    ...s,
    entries: [] as string[],
  }));
  for (const entry of target.entries) {
    if (entry.route === 'launcher_compatibility') continue; // Available from Settings > diagnostics.
    const id = entrySection[entry.route] || entry.route;
    let section = sections.find((s) => s.id === id);
    if (!section) {
      section = {
        id,
        title: sectionTitles[id] || entry.title,
        features: [],
        entries: [],
      };
      sections.push(section);
    }
    section.entries.push(entry.route);
  }
  const priorities: Record<string, string[]> = {
    system: [
      'freeform',
      'system',
      'audio',
      'battery',
      'connections',
      'installer',
    ],
  };
  const order = priorities[target.id];
  if (order) sections.sort((a, b) => order.indexOf(a.id) - order.indexOf(b.id));
  const section = (id: string, title: string, children: ReactNode) => (
    <div key={id} className="c-application-section">
      <h3 className="c-section-heading" id={'section-' + id}>
        {title}
      </h3>
      <Card
        className="c-feature-group"
        path={'HookAppCatalog:' + target.id + '/' + id}
        label={title}
      >
        {children}
      </Card>
    </div>
  );
  return (
    <>
      {sections.map((s) =>
        section(
          s.id,
          sectionTitles[s.id] || s.title,
          <>
            {s.entries.map((route) => (
              <div
                className="c-feature c-inline-editor"
                key={route}
                data-editor={route}
                data-native-path={'editor:' + route}
              >
                <InlineEditor route={route} />
              </div>
            ))}
            {(s as Group).features.map((f) => (
              <div
                className="c-feature"
                key={f.id}
                data-native-path={
                  'config:' + (f.toggleKey || f.parameterKeys[0])
                }
                data-ui-label={f.title}
              >
                <FeatureRow feature={f} />
              </div>
            ))}
          </>,
        ),
      )}
      {target.id === 'settings' &&
        section(
          'developer',
          '开发者设置',
          <>
            {catalog.deviceSettings.map((o) => (
              <div className="c-feature" key={o.key}>
                <Toggle
                  name={'device:' + o.key}
                  title={o.title}
                  help={o.help}
                />
              </div>
            ))}
            <LinkCard
              title="打开系统开发者设置"
              onClick={() => m.tell('原型演示：打开系统开发者设置')}
            />
          </>,
        )}
      {target.id === 'update' &&
        section(
          'update-link',
          '更新链接',
          <LinkCard
            title="查看已提取的更新链接"
            help="系统更新应用准备安装时提取的更新地址。"
            onClick={() =>
              m.tell('尚未提取到链接；更新应用准备安装时才会产生。')
            }
          />,
        )}
    </>
  );
}
