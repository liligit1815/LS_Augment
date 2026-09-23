/* eslint-disable react/react-compiler -- Drafts retain invalid edits without replacing the last saved value. */
'use client';
import { useEffect, useId, useState, type ReactNode } from 'react';
import {
  CurrentContext,
  FeatureTitle,
  Toggle,
  identity,
  useModel,
  type Option,
} from './current-ui';
import { validText } from './current-validation';
import { overrideIsActive, overrideUpdates } from './current-feature-state';

export function validOption(o: Option, value: string) {
  if (o.kind === 'INTEGER')
    return /^-?\d+$/.test(value) && +value >= o.minimum && +value <= o.maximum;
  if (o.kind === 'DECIMAL')
    return (
      value.trim() !== '' &&
      Number.isFinite(+value) &&
      +value >= o.minimum &&
      +value <= o.maximum
    );
  if (o.kind === 'COLOR') return /^#(?:[\da-f]{6}|[\da-f]{8})$/i.test(value);
  return validText(o.key, value, o.maximum || 65536);
}

/** A UI switch for native value overrides that have an explicit default/off value. */
export function ValueGate({
  name,
  title,
  help,
  defaults,
  comparison = 'string',
  children,
}: {
  name: string;
  title: string;
  help?: string;
  defaults: Record<string, string>;
  comparison?: string;
  children: ReactNode;
}) {
  const m = useModel(),
    gateKey = 'ui:enabled:' + name;
  const on =
    m.values[gateKey] ??
    (overrideIsActive(m.values, defaults, comparison) ? '1' : '0');
  const model = {
    ...m,
    values: { ...m.values, [gateKey]: on },
    set(key: string, value: string) {
      if (key !== gateKey) {
        m.set(key, value);
        return;
      }
      for (const [field, next] of Object.entries(
        overrideUpdates(name, value, m.values, defaults),
      ))
        m.set(field, next);
    },
  };
  return (
    <CurrentContext.Provider value={model}>
      <Toggle name={gateKey} title={title} help={help}>
        {children}
      </Toggle>
    </CurrentContext.Provider>
  );
}

export function OptionInput({ option: o }: { option: Option }) {
  const m = useModel(),
    value = m.values[o.key] ?? o.defaultValue;
  const [draft, setDraft] = useState(value),
    [error, setError] = useState(''),
    errorId = useId();
  useEffect(() => {
    setDraft(value);
    setError('');
  }, [value]);
  if (o.kind === 'BOOLEAN')
    return (
      <Toggle
        name={o.key}
        title={o.title}
        help={o.help}
        initial={o.defaultValue}
      />
    );
  const update = (next: string) => {
    setDraft(next);
    if (!validOption(o, next)) {
      setError(
        o.key.includes('country')
          ? '请输入两位英文字母，例如 CN'
          : ['INTEGER', 'DECIMAL'].includes(o.kind)
            ? `请输入${o.minimum}～${o.maximum}之间的${o.kind === 'INTEGER' ? '整数' : '数值'}`
            : o.kind === 'COLOR'
              ? '请输入 #RRGGBB 或 #AARRGGBB 格式的颜色'
              : '请输入有效内容',
      );
      return;
    }
    setError('');
    m.set(o.key, next);
  };
  const hiddenSlots = o.key.endsWith('hidden_icon_slots');
  const font = o.key.endsWith('_clock_font');
  return (
    <div className="c-option-input" {...identity('config:' + o.key, o.title)}>
      <FeatureTitle title={o.title} help={o.help} />
      {o.kind === 'CHOICE' ? (
        <select
          className="c-inline-input"
          aria-label={o.title}
          value={value}
          onChange={(e) => m.set(o.key, e.target.value)}
        >
          {o.choices.map((label, i) => (
            <option key={label} value={String(i)}>
              {label}
            </option>
          ))}
        </select>
      ) : hiddenSlots ? (
        <div className="c-inline-checks">
          {Object.entries({
            alarm_clock: '闹钟',
            bluetooth: '蓝牙',
            zen: '勿扰模式',
            headset: '耳机',
            vpn: 'VPN',
            location: '定位',
            airplane: '飞行模式',
            cast: '投屏',
            rotate: '旋转锁定',
            hotspot: '热点',
            nfc: 'NFC',
          }).map(([key, label]) => (
            <label className="c-check" key={key}>
              <input
                type="checkbox"
                checked={value.split(',').includes(key)}
                onChange={(e) =>
                  m.set(
                    o.key,
                    (e.target.checked
                      ? [...value.split(',').filter(Boolean), key]
                      : value.split(',').filter((v) => v !== key)
                    ).join(','),
                  )
                }
              />
              {label}
            </label>
          ))}
        </div>
      ) : font ? (
        <label className="c-button c-upload">
          {value || '选择字体文件'}
          <input
            type="file"
            accept=".ttf,.otf,.ttc,.woff,.woff2"
            onChange={(e) => {
              const file = e.target.files?.[0];
              if (file) m.set(o.key, file.name);
            }}
          />
        </label>
      ) : (
        <input
          className="c-inline-input"
          aria-label={o.title}
          aria-invalid={!!error}
          aria-describedby={error ? errorId : undefined}
          value={draft}
          inputMode={
            ['INTEGER', 'DECIMAL'].includes(o.kind) ? 'decimal' : 'text'
          }
          spellCheck={false}
          onChange={(e) => update(e.target.value)}
        />
      )}
      {error && (
        <p className="c-error" role="alert" id={errorId}>
          {error}
        </p>
      )}
    </div>
  );
}
