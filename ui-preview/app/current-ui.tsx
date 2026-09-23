/* eslint-disable react/react-compiler -- This prototype synchronizes browser storage, scroll restoration and native-style drafts without the React compiler. */
'use client';
import {
  createContext,
  useContext,
  useState,
  useEffect,
  useRef,
  type ReactNode,
} from 'react';
import editorHelp from './current-editor-help.json';
import { validText, clockPatternValid } from './current-validation';
const keyHelp = editorHelp.forKey as Record<string, string>,
  inlineHelp = editorHelp.inlineByKey as Record<string, string>,
  titleHelp = editorHelp.byTitle as Record<string, string>;
import {
  CircleAlert,
  ChevronRight,
  ChevronDown,
  ArrowLeft,
  RotateCw,
} from 'lucide-react';
export type Option = {
  key: string;
  title: string;
  summary: string;
  help: string;
  kind: string;
  defaultValue: string;
  minimum: number;
  maximum: number;
  choices: string[];
};
export type Model = {
  values: Record<string, string>;
  set: (key: string, value: string) => void;
  go: (route: string) => void;
  back: () => void;
  tell: (s: string) => void;
  dialog: (title: string, body: ReactNode) => void;
  close: () => void;
};
export const CurrentContext = createContext<Model>(null!);
export const useModel = () => useContext(CurrentContext);
export const identity = (path: string, label: string) => ({
  'data-native-path': path,
  'data-ui-label': label,
});
export function Card({
  children,
  className = '',
  path,
  label,
}: {
  children: ReactNode;
  className?: string;
  path?: string;
  label?: string;
}) {
  return (
    <section
      className={'c-card ' + className}
      {...identity(path || label || '', label || '')}
    >
      {children}
    </section>
  );
}
export function Help({ title, text }: { title: string; text?: string }) {
  const m = useModel();
  return text ? (
    <button
      className="c-help"
      aria-label={'查看' + title + '说明'}
      {...identity('FeatureHelp:' + title, title + '说明')}
      onClick={(e) => {
        e.stopPropagation();
        m.dialog(
          title,
          <>
            <p className="c-help-copy">{text}</p>
            <footer>
              <button onClick={m.close}>知道了</button>
            </footer>
          </>,
        );
      }}
    >
      <CircleAlert size={14} />
    </button>
  ) : null;
}
export function FeatureTitle({
  title,
  help,
}: {
  title: string;
  help?: string;
}) {
  return (
    <div className="c-feature-title">
      <strong>{title}</strong>
      <Help title={title} text={help} />
    </div>
  );
}
export function Toggle({
  name,
  title,
  help,
  children,
  initial = '0',
  disabled = false,
}: {
  name: string;
  title: string;
  help?: string;
  children?: ReactNode;
  initial?: string;
  disabled?: boolean;
}) {
  const m = useModel(),
    on = (m.values[name] ?? initial) === '1',
    [expanded, expand] = useState(on);
  useEffect(() => expand(on), [on]);
  return (
    <div {...identity('config:' + name, title)}>
      <div className="c-toggle-row">
        <FeatureTitle
          title={title}
          help={inlineHelp[name] || help || titleHelp[title]}
        />
        <button
          type="button"
          role="switch"
          aria-label={title}
          aria-checked={on}
          className="c-switch"
          disabled={disabled}
          onClick={() => m.set(name, on ? '0' : '1')}
        >
          <span />
        </button>
        {children ? (
          <button
            className="c-fold-arrow"
            aria-label={(on && expanded ? '收起' : '展开') + title + '配置'}
            aria-expanded={on && expanded}
            disabled={!on || disabled}
            onClick={() => expand(!expanded)}
          >
            <ChevronDown
              size={18}
              style={{
                transform: expanded && on ? 'rotate(180deg)' : undefined,
              }}
            />
          </button>
        ) : (
          <span className="c-switch-slot" aria-hidden="true" />
        )}
      </div>
      {on && !disabled && expanded && children ? (
        <div className="c-fold-body">{children}</div>
      ) : null}
    </div>
  );
}
export function LinkCard({
  title,
  help,
  route,
  onClick,
  icon,
  summary,
}: {
  title: string;
  help?: string;
  route?: string;
  onClick?: () => void;
  icon?: ReactNode;
  summary?: string;
}) {
  const m = useModel();
  return (
    <Card
      className={'c-link ' + (icon ? 'c-setting-link' : '')}
      path={route ? 'route:' + route : 'action:' + title}
      label={title}
    >
      <button
        className="c-link-hit"
        aria-label={title}
        onClick={onClick || (() => m.go(route!))}
      />
      {icon && <span className="c-setting-icon">{icon}</span>}
      <div className="c-link-copy">
        {summary ? (
          <>
            <strong>{title}</strong>
            <small>{summary}</small>
          </>
        ) : (
          <FeatureTitle title={title} help={help} />
        )}
      </div>
      {(icon || summary) && <ChevronRight size={15} />}
    </Card>
  );
}
export function Button({
  children,
  onClick,
  secondary = false,
}: {
  children: ReactNode;
  onClick: () => void;
  secondary?: boolean;
}) {
  return (
    <button
      className={'c-button' + (secondary ? ' secondary' : '')}
      {...(typeof children === 'string'
        ? identity('action:' + children, children)
        : {})}
      onClick={onClick}
    >
      {children}
    </button>
  );
}
export function Range({
  name,
  title,
  min,
  max,
  step = 1,
  initial = 0,
  suffix = '',
}: {
  name: string;
  title: string;
  min: number;
  max: number;
  step?: number;
  initial?: number;
  suffix?: string;
}) {
  const m = useModel();
  const value = Number(m.values[name] ?? initial);
  return (
    <div className="c-range" {...identity('config:' + name, title)}>
      <FeatureTitle
        title={title}
        help={
          keyHelp[name] ||
          titleHelp[title] ||
          `调整${title}。可选范围：${min}–${max}。`
        }
      />
      <small>
        当前：{value}
        {suffix}
      </small>
      <input
        aria-label={title}
        type="range"
        min={min}
        max={max}
        step={step}
        value={value}
        onChange={(e) => {
          m.set(name, e.target.value);
          if (name === 'status:clock:size')
            m.set('ls_augment_statusbar_clock_size_sp', '0');
        }}
      />
    </div>
  );
}
export function Field({
  name,
  title,
  type = 'text',
  initial = '',
  min,
  max,
  decimal = false,
  maxLength,
}: {
  name: string;
  title: string;
  type?: string;
  initial?: string;
  min?: number;
  max?: number;
  decimal?: boolean;
  maxLength?: number;
}) {
  const m = useModel(),
    stored = m.values[name] ?? initial,
    [draft, setDraft] = useState(stored),
    [error, setError] = useState(false);
  useEffect(() => {
    setDraft(stored);
    setError(false);
  }, [stored]);
  return (
    <div className="c-field" {...identity('config:' + name, title)}>
      <FeatureTitle
        title={title}
        help={
          keyHelp[name] ||
          titleHelp[title] ||
          (type === 'number'
            ? `输入${title}。${min !== undefined ? '最小值：' + min + '。' : ''}${max !== undefined ? '最大值：' + max + '。' : ''}`
            : '设置' + title + '。')
        }
      />
      <input
        type={type}
        aria-label={title}
        value={draft}
        min={min}
        max={max}
        maxLength={maxLength}
        step={decimal ? 'any' : 1}
        onChange={(e) => {
          const value = e.target.value;
          setDraft(value);
          const valid =
            (maxLength === undefined ||
              Array.from(value).length <= maxLength) &&
            (type !== 'number' ||
              (value.trim() !== '' &&
                Number.isFinite(+value) &&
                (min === undefined || +value >= min) &&
                (max === undefined || +value <= max) &&
                (decimal || Number.isInteger(+value)))) &&
            (!name.includes('clock_pattern') || clockPatternValid(value));
          setError(!valid);
          if (valid) m.set(name, value);
        }}
      />
      {error && (
        <small className="c-error" role="alert">
          {type === 'number'
            ? `请输入${min}–${max}范围内的有效${decimal ? '数值' : '整数'}`
            : '请输入有效内容'}
          ；此项未保存。
        </small>
      )}
    </div>
  );
}
export function Choice({
  name,
  title,
  choices,
  initial = '0',
}: {
  name: string;
  title: string;
  choices: string[];
  initial?: string;
}) {
  const m = useModel();
  return (
    <label className="c-choice" {...identity('config:' + name, title)}>
      <span>{title}</span>
      <select
        aria-label={title}
        value={m.values[name] ?? initial}
        onChange={(e) => m.set(name, e.target.value)}
      >
        {choices.map((t, i) => (
          <option key={i} value={i}>
            {t}
          </option>
        ))}
      </select>
    </label>
  );
}
export function Modal({
  title,
  children,
  onClose,
}: {
  title: string;
  children: ReactNode;
  onClose: () => void;
}) {
  const box = useRef<HTMLDialogElement>(null);
  useEffect(() => {
    const previous = document.activeElement as HTMLElement;
    box.current?.focus();
    return () => previous?.focus();
  }, []);
  return (
    <div className="c-scrim">
      <button
        className="c-scrim-dismiss"
        aria-label="关闭弹窗"
        onClick={onClose}
      />
      <dialog
        open
        className="c-modal"
        ref={box}
        tabIndex={-1}
        aria-modal="true"
        aria-label={title}
        onKeyDown={(e) => {
          if (e.key === 'Escape') onClose();
          if (e.key === 'Tab') {
            const els = box.current?.querySelectorAll<HTMLElement>(
              'button,input,select,textarea,[tabindex="0"]',
            );
            if (!els?.length) return;
            const first = els[0],
              last = els[els.length - 1];
            if (
              e.shiftKey &&
              (document.activeElement === first ||
                document.activeElement === box.current)
            ) {
              e.preventDefault();
              last.focus();
            } else if (!e.shiftKey && document.activeElement === last) {
              e.preventDefault();
              first.focus();
            }
          }
        }}
      >
        <h2>{title}</h2>
        {children}
      </dialog>
    </div>
  );
}
function EditOption({ option: o }: { option: Option }) {
  const m = useModel(),
    [draft, setDraft] = useState(m.values[o.key] ?? o.defaultValue),
    [error, setError] = useState('');
  const save = () => {
    let valid = true;
    if (o.kind === 'INTEGER')
      valid =
        /^-?\d+$/.test(draft) && +draft >= o.minimum && +draft <= o.maximum;
    else if (o.kind === 'DECIMAL')
      valid =
        draft.trim() !== '' &&
        Number.isFinite(+draft) &&
        +draft >= o.minimum &&
        +draft <= o.maximum;
    else if (o.kind === 'COLOR')
      valid = /^#(?:[0-9a-f]{6}|[0-9a-f]{8})$/i.test(draft);
    else valid = validText(o.key, draft, o.maximum || 65536);
    if (!valid) {
      setError(
        '请输入有效值' +
          (['INTEGER', 'DECIMAL'].includes(o.kind)
            ? `（${o.minimum}～${o.maximum}）`
            : ''),
      );
      return;
    }
    m.set(o.key, draft);
    m.close();
  };
  return (
    <>
      <input
        className="c-edit-input"
        aria-label={o.title}
        value={draft}
        onChange={(e) => setDraft(e.target.value)}
        onKeyDown={(e) => e.key === 'Enter' && save()}
      />
      {error && (
        <p role="alert" className="c-error">
          {error}
        </p>
      )}
      <footer>
        <button
          onClick={() => {
            m.set(o.key, o.defaultValue);
            m.close();
          }}
        >
          恢复默认
        </button>
        <button onClick={m.close}>取消</button>
        <button onClick={save}>保存</button>
      </footer>
    </>
  );
}
function IconChoices({ option: o }: { option: Option }) {
  const m = useModel(),
    [selected, setSelected] = useState((m.values[o.key] || '').split(','));
  const labels = [
      '闹钟',
      '蓝牙',
      '勿扰模式',
      '耳机',
      'VPN',
      '定位',
      '飞行模式',
      '投屏',
      '旋转锁定',
      '热点',
      'NFC',
    ],
    slots = [
      'alarm_clock',
      'bluetooth',
      'zen',
      'headset',
      'vpn',
      'location',
      'airplane',
      'cast',
      'rotate',
      'hotspot',
      'nfc',
    ];
  return (
    <>
      {labels.map((label, i) => (
        <label className="c-check" key={label}>
          <input
            type="checkbox"
            checked={selected.includes(slots[i])}
            onChange={(e) =>
              setSelected(
                e.target.checked
                  ? [...selected, slots[i]]
                  : selected.filter((x) => x !== slots[i]),
              )
            }
          />
          {label}
        </label>
      ))}
      <footer>
        <button onClick={m.close}>取消</button>
        <button
          onClick={() => {
            m.set(o.key, selected.filter(Boolean).join(','));
            m.close();
          }}
        >
          保存
        </button>
      </footer>
    </>
  );
}
export function OptionCard({ option: o }: { option: Option }) {
  const m = useModel(),
    value = m.values[o.key] ?? o.defaultValue;
  const font = o.key.endsWith('_clock_font'),
    icons = o.key.endsWith('hidden_icon_slots');
  function edit() {
    if (icons) {
      m.dialog('选择要隐藏的图标', <IconChoices option={o} />);
      return;
    }
    if (o.kind === 'CHOICE') {
      m.dialog(
        o.title,
        <>
          {o.choices.map((c, i) => (
            <label className="c-radio" key={c}>
              <input
                type="radio"
                name={o.key}
                checked={String(i) === value}
                onChange={() => {
                  m.set(o.key, String(i));
                  m.close();
                }}
              />
              {c}
            </label>
          ))}
          <footer>
            <button onClick={m.close}>取消</button>
          </footer>
        </>,
      );
      return;
    }
    m.dialog(o.title, <EditOption option={o} />);
  }
  return (
    <Card label={o.title} path={'config:' + o.key}>
      {o.kind === 'BOOLEAN' ? (
        <Toggle
          name={o.key}
          title={o.title}
          help={o.help}
          initial={o.defaultValue}
        />
      ) : (
        <>
          <FeatureTitle title={o.title} help={o.help} />
          {font ? (
            <div>
              <label className="c-button c-upload">
                {value ? '更换字体' : '选择字体文件'}
                <input
                  type="file"
                  accept=".ttf,.otf,.ttc,.woff,.woff2"
                  onChange={(e) => {
                    const f = e.target.files?.[0];
                    if (f) m.set(o.key, f.name);
                  }}
                />
              </label>
              {value && (
                <Button onClick={() => m.set(o.key, '')}>恢复原厂字体</Button>
              )}
            </div>
          ) : (
            <Button onClick={edit}>
              {icons
                ? '选择要隐藏的图标'
                : o.kind === 'CHOICE'
                  ? o.choices[+value]
                  : value || '未设置'}
            </Button>
          )}
        </>
      )}
    </Card>
  );
}
export function Header({
  title,
  restart,
}: {
  title: string;
  restart?: () => void;
}) {
  const m = useModel();
  return (
    <header className="c-detail-header">
      <button aria-label="返回上一页" onClick={m.back}>
        <ArrowLeft size={24} />
      </button>
      <h1>{title}</h1>
      {restart && (
        <button
          className="c-restart-icon"
          aria-label="重启作用域"
          title="重启作用域"
          onClick={restart}
        >
          <RotateCw size={22} />
        </button>
      )}
    </header>
  );
}
