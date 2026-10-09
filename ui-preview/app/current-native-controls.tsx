'use client';
import { IceIcon } from './current-ui';
import { useId, type ReactNode } from 'react';
import { ChevronDown } from 'lucide-react';
import { FeatureTitle, useModel, useDisclosure } from './current-ui';

export function NativeFold({
  title,
  children,
}: {
  title: string;
  children: ReactNode;
}) {
  const [open, setOpen] = useDisclosure('fold:' + title), bodyId = useId();
  return (
    <div
      className="c-native-fold"
      data-native-path={'fold:' + title}
      data-ui-label={title}
    >
      <button
        className="c-native-fold-head"
        aria-label={(open ? '收起' : '展开') + title}
        aria-expanded={open}
        aria-controls={bodyId}
        onClick={() => setOpen(!open)}
      >
        <IceIcon title={title}/><strong>{title}</strong>
        <span className="c-disclosure-slot" aria-hidden="true">
          <ChevronDown
            size={18}
            style={{ transform: open ? 'rotate(180deg)' : undefined }}
          />
        </span>
      </button>
      <div id={bodyId} className="d-disclosure-body" hidden={!open}>{children}</div>
    </div>
  );
}
export function NativeSelect({
  name,
  title,
  choices,
  initial = '0',
  presentation = 'select',
}: {
  name: string;
  title: string;
  choices: string[] | [string, string][];
  initial?: string;
  presentation?: 'select' | 'buttons';
}) {
  const m = useModel();
  const selected = m.values[name] ?? initial;
  const options = choices.map((x, i) =>
    Array.isArray(x) ? x : [String(i), x],
  );
  return (
    <div
      className="c-native-select"
      data-native-path={'config:' + name}
      data-ui-label={title}
    >
      <FeatureTitle
        title={title}
        help={'选择' + title + '，修改后自动保存。'}
      />
      {presentation === 'buttons' ? (
        <fieldset className="c-native-select-buttons" aria-label={title}>
          {options.map(([value, label]) => (
            <button
              key={value}
              type="button"
              className="c-button"
              aria-pressed={selected === value}
              onClick={() => m.set(name, value)}
            >
              {label}
            </button>
          ))}
        </fieldset>
      ) : <select
        aria-label={title}
        value={selected}
        onChange={(e) => m.set(name, e.target.value)}
      >
        {options.map(([value, label]) => (
          <option
            key={value}
            value={value}
          >
            {label}
          </option>
        ))}
      </select>}
    </div>
  );
}
// Reproducible visual fixture from the connected test20378 device; browser-only.
export const latestSample: Record<string, string> = {
  ls_augment_systemui_master: '1',
  ls_augment_rm_power_reboot_modes: '1',
  ls_augment_rm_notification_stack: '1',
  ls_augment_rm_hide_mobile_activity: '1',
  ls_augment_rm_hide_mobile_type: '1',
  ls_augment_rm_hide_hd_small: '1',
  ls_augment_rm_hide_hd_large: '1',
  ls_augment_statusbar_clock_custom: '1',
  ls_augment_statusbar_clock_rows: '2',
  ls_augment_statusbar_clock_pattern: 'HH:mmIIE',
  ls_augment_statusbar_clock_pattern_second: 'MM.dd/Ne',
  ls_augment_statusbar_clock_size_sp: '0',
  ls_augment_statusbar_connectivity_group: '1',
  ls_augment_statusbar_connectivity_size_dp: '28',
  ls_augment_statusbar_native_battery_enabled: '0',
  ls_augment_statusbar_notification_two_rows: '0',
  ls_augment_statusbar_system_two_rows: '0',
  ls_augment_statusbar_network_display: '4',
  ls_augment_statusbar_connectivity_upper_content: 'wifi',
  ls_augment_statusbar_connectivity_middle_content: 'battery',
  ...Object.fromEntries(
    [
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
    ].flatMap((id, i) => [
      ['status:' + id + ':on', '1'],
      ['status:' + id + ':zone', String([2, 0, 6, 8, 1, 1, 1, 7, 7, 8][i])],
      ['status:' + id + ':size', String([10, 12, 12, 28, 10, 10, 10, 10, 10, 10][i])],
      [
        'status:' + id + ':order',
        String([0, 10, 0, 90, 20, 40, 30, 10, 20, 30][i]),
      ],
    ]),
  ),
};
