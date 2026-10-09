'use client';
import {
  ChevronRight,
  Smartphone,
  Wifi,
  BatteryFull,
  Check,
  Sun,
  LayoutGrid,
  Volume2,
  Gamepad2,
  Fan,
  Palette,
  AppWindow,
  Power,
  Moon,
  Usb,
  Shield,
  Clock,
  AudioLines,
  Download,
  HeartPulse,
  Layers,
  Fingerprint,
  Bell,
} from 'lucide-react';
import catalog from './current-catalog.json';
import {
  Card,
  Toggle,
  LinkCard,
  Button,
  useModel,
  identity,
} from './current-ui';
import { CurrentEditor, editorTitles } from './current-editors';
import { FeatureRow } from './current-feature-row';
import { NativeFold } from './current-native-controls';
import { CurrentLauncherLayout } from './current-launcher-layout';
import {
  applicationSections,
  sectionDestination,
  sectionSummary,
  activeFeatureCount,
  usesEmbeddedEditors,
  type ApplicationSection,
  type ApplicationTarget,
} from './current-hierarchy';

const sectionIcons: Record<string, typeof LayoutGrid> = {
  statusbar: Smartphone,
  status_resources: Palette,
  freeform: AppWindow,
  audio: Volume2,
  system: Shield,
  connections: Wifi,
  installer: Download,
  quicksettings: LayoutGrid,
  quicksettings_more: Sun,
  primary_interaction: Power,
  lockscreen: Moon,
  aod: Clock,
  volume_panel: Volume2,
  interaction: Layers,
  usb: Usb,
  launcher_grid: LayoutGrid,
  launcher: AppWindow,
  dock_glass: Layers,
  cleanup: Layers,
  desktop_clock: Clock,
  recents: Layers,
  shoulder: Gamepad2,
  combo: Gamepad2,
  performance: Gamepad2,
  ai: Smartphone,
  fan: Fan,
  theme: Palette,
  collab_theme: Palette,
  collab_fingerprint: Fingerprint,
  collab_charging: BatteryFull,
  collab_audio: AudioLines,
  health: HeartPulse,
  display_time: Clock,
  developer: Usb,
  download: Download,
  double: Layers,
  'update-link': Download,
  update: Download,
  weather: Sun,
  nfc: Smartphone,
  mtp: Usb,
  default_apps: Shield,
  capture: Smartphone,
  plugins: Layers,
  game_capture: Bell,
};
function SectionLink({
  section,
  target,
}: {
  section: ApplicationSection;
  target: ApplicationTarget;
}) {
  const m = useModel(),
    Icon = sectionIcons[section.id] || Layers;
  const active = activeFeatureCount(section, m.values),
    isStatus = section.id === 'statusbar';
  return (
    <button
      className={'d-preference-link' + (isStatus ? ' d-status-entry' : '')}
      aria-label={section.title}
      onClick={() => m.go(sectionDestination(target, section))}
      {...identity(
        'HookAppCatalog:' + target.id + '/' + section.id,
        section.title,
      )}
    >
      <span className="d-preference-line">
        <span className="c-setting-icon">
          <Icon size={22} />
        </span>
        <span className="d-preference-copy">
          <span className="d-preference-title">
            <strong>{section.title}</strong>
            {!isStatus && active > 0 ? (
              <span className="d-row-state">
                <Check size={12} />已设置 {active} 项
              </span>
            ) : null}
          </span>
          <small>{sectionSummary(section, target)}</small>
        </span>
        <ChevronRight size={18} />
      </span>
    </button>
  );
}
export function CurrentApplication({ target }: { target: ApplicationTarget }) {
  const sections = applicationSections(target);
  return (
    <div className="d-application">
      {sections.length === 1 && sections[0].entries.length === 0 ? (
        <CurrentApplicationSection target={target} section={sections[0]} />
      ) : (
        <Card
          className="d-preference-group"
          label={target.title + '功能分组'}
        >
          {sections.map((section) => (
            <SectionLink key={section.id} section={section} target={target} />
          ))}
        </Card>
      )}
    </div>
  );
}
function SectionFeatures({
  section,
  target,
}: {
  section: ApplicationSection;
  target: ApplicationTarget;
}) {
  return (
    <>
      {target.id === 'launcher' && section.id === 'launcher_grid' && (
        <CurrentLauncherLayout />
      )}
      {section.features.map((f, index, all) => {
        if (target.id === 'launcher' && f.id === 'launcher:launcher_grid')
          return null;
        if (
          f.objectGroup &&
          all.findIndex((x) => x.objectGroup === f.objectGroup) !== index
        )
          return null;
        return (
          <div
            className="c-feature"
            key={f.id}
            {...identity(
              'config:' + (f.toggleKey || f.parameterKeys[0]),
              f.title,
            )}
          >
            {f.objectGroup ? (
              <NativeFold title={f.objectGroup}>
                {all
                  .filter((x) => x.objectGroup === f.objectGroup)
                  .map((x) => (
                    <FeatureRow key={x.id} feature={x} />
                  ))}
              </NativeFold>
            ) : (
              <FeatureRow feature={f} />
            )}
          </div>
        );
      })}
    </>
  );
}
export function CurrentApplicationSection({
  target,
  section,
}: {
  target: ApplicationTarget;
  section: ApplicationSection;
}) {
  const m = useModel();
  const inlineEditors = usesEmbeddedEditors(target.id, section);
  return (
    <div className="d-section-page">
      {!inlineEditors && section.entries.length > 0 && (
        <Card className="d-preference-group" label="专用编辑器">
          {section.entries.map((route) => {
            const entry = target.entries.find((e) => e.route === route),
              Icon = sectionIcons[section.id] || Layers;
            return (
              <LinkCard
                key={route}
                route={route}
                title={
                  route === 'extra_dim'
                    ? '极暗与快捷磁贴'
                    : route === 'status_assets'
                      ? '素材与字体'
                      : entry?.title || editorTitles[route] || route
                }
                summary={
                  route === 'extra_dim'
                    ? '调整画面亮度与磁贴入口'
                    : route === 'status_assets'
                      ? sectionSummary(section, target)
                      : entry?.summary || '设置此功能'
                }
                icon={<Icon size={22} />}
              />
            );
          })}
        </Card>
      )}
      {(section.features.length > 0 || (inlineEditors && section.entries.length > 0)) && (
        <Card
          className="c-feature-group d-setting-group"
          label={section.title}
          path={'HookAppCatalog:' + target.id + '/' + section.id}
        >
          {inlineEditors && section.entries.map((route) => (
            route === 'extra_dim' ? <ExtraDimEditor key={route} embedded /> :
              <CurrentEditor key={route} route={route} embedded />
          ))}
          <SectionFeatures section={section} target={target} />
        </Card>
      )}
      {target.id === 'settings' && section.id === 'developer' && (
        <Card className="c-feature-group d-setting-group">
          {catalog.deviceSettings.map((o) => (
            <div className="c-feature" key={o.key}>
              <Toggle name={'device:' + o.key} title={o.title} help={o.help} />
            </div>
          ))}
          <Button onClick={() => m.tell('原型演示：打开系统开发者设置')}>
            打开系统开发者设置
          </Button>
        </Card>
      )}
      {target.id === 'theme' && section.id === 'collab_audio' && (
        <Card>
          <p className="d-page-description">
            选择本地音频作为联名资源，原厂音频选项继续保留。
          </p>
          <Button
            onClick={() =>
              m.dialog(
                '导入联名音频',
                <>
                  <p>请选择本地音频。</p>
                  <input
                    type="file"
                    accept="audio/*"
                    aria-label="选择联名音频"
                    onChange={(e) => {
                      const file = e.target.files?.[0];
                      if (file) {
                        m.close();
                        m.tell('已选择：' + file.name);
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
            选择音频
          </Button>
        </Card>
      )}
      {target.id === 'update' && section.id === 'update-link' && (
        <Card>
          <p className="d-page-description">
            尚未提取到更新链接。系统更新准备安装时会生成地址。
          </p>
          <Button onClick={() => m.tell('原型示例：尚未提取到更新链接')}>
            刷新链接
          </Button>
        </Card>
      )}
    </div>
  );
}
export function ExtraDimEditor({ embedded = false }: { embedded?: boolean }) {
  const content = <Toggle
    name="prototype:extra-dim-tile"
    title="极暗"
    help="开启后将极暗磁贴加入控制中心，关闭后移除磁贴。点击磁贴开关极暗，长按调节强度。"
  />;
  return embedded ? <div className="c-feature">{content}</div> : <Card>{content}</Card>;
}
