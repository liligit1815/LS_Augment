/* eslint-disable react/react-compiler -- This prototype synchronizes browser storage, scroll restoration and native-style drafts without the React compiler. */
'use client';

import { useEffect, useRef, useState, type ReactNode } from 'react';
import {
  Button,
  Card,
  CurrentContext,
  FeatureTitle,
  Toggle,
  identity,
  useModel,
} from './current-ui';
import editorData from './current-editor-data.json';
import editorHelp from './current-editor-help.json';

const definitions = editorData.defaults as Record<
  string,
  { key: string; default: unknown }
>;
const key = (name: string) => definitions[name]?.key || name;
const help = editorHelp.byTitle as Record<string, string>;
const DEFAULT_ACCOUNT = '示例账户';
const WEEKDAYS = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

export type HealthPlanDraft = {
  start: string;
  end: string;
  count: string;
  steps: string;
  days: string[];
};
type HealthDraft = HealthPlanDraft & {
  account: string;
  multiplyEnabled: boolean;
  planEnabled: boolean;
  limitEnabled: boolean;
  multiplier: number;
  limit: string;
};

const isInteger = (value: string, min: number, max: number) =>
  /^\d+$/.test(value) &&
  Number.isSafeInteger(Number(value)) &&
  Number(value) >= min &&
  Number(value) <= max;
const isTime = (value: string) => /^(?:[01]\d|2[0-3]):[0-5]\d$/.test(value);
const minutes = (value: string) =>
  Number(value.slice(0, 2)) * 60 + Number(value.slice(3));
const timeSpan = (draft: HealthPlanDraft) =>
  (minutes(draft.end) - minutes(draft.start) + 1440) % 1440;

/** Validate the whole plan before publishing any one of its fields. */
export function validateHealthPlan(draft: HealthPlanDraft): string {
  if (!isInteger(draft.count, 1, 100)) return '随机执行次数需为 1–100 的整数。';
  if (!isInteger(draft.steps, 1, 1000000))
    return '每次增加步数需为 1–1000000 的整数。';
  if (Number(draft.count) * Number(draft.steps) > 1000000)
    return '执行次数乘以每次步数不能超过 1000000 步；此计划未保存。';
  if (!isTime(draft.start) || !isTime(draft.end))
    return '请设置有效的开始与结束时间。';
  if (!timeSpan(draft)) return '开始和结束时间不能相同；此计划未保存。';
  if (Number(draft.count) > timeSpan(draft))
    return '每次须落在不同分钟，次数不能超过所选时间范围的分钟数；此计划未保存。';
  if (!draft.days.some((day) => /^[1-7]$/.test(day)))
    return '请至少选择一天；此计划未保存。';
  return '';
}

/** Invalid plan/limit drafts never replace their last saved settings. */
export function healthDraftUpdates(draft: HealthDraft): Record<string, string> {
  const updates: Record<string, string> = {};
  if (isInteger(draft.limit, 1, 1000000)) {
    updates[key('HEALTH_DAILY_LIMIT_STEPS')] = String(Number(draft.limit));
    updates[key('HEALTH_DAILY_LIMIT_ENABLED')] = draft.limitEnabled ? '1' : '0';
  } else if (!draft.limitEnabled)
    updates[key('HEALTH_DAILY_LIMIT_ENABLED')] = '0';

  const enabled = draft.multiplyEnabled || draft.planEnabled;
  if (enabled && !draft.account) return updates;
  const planError = validateHealthPlan(draft);
  // Android keeps the old plan if the plan is switched off while its draft is invalid.
  if (draft.planEnabled && planError) return updates;
  updates[key('HEALTH_ENABLED')] = enabled ? '1' : '0';
  updates[key('HEALTH_MULTIPLY_ENABLED')] = draft.multiplyEnabled ? '1' : '0';
  updates[key('HEALTH_PLAN_ENABLED')] = draft.planEnabled ? '1' : '0';
  updates[key('HEALTH_BACKGROUND')] = '1';
  updates[key('HEALTH_MULTIPLIER')] = String(draft.multiplier * 100);
  updates['prototype:health-bound'] = draft.account ? '1' : '0';
  if (draft.account && !planError) {
    updates['health:start'] = draft.start;
    updates['health:end'] = draft.end;
    updates['health:count'] = String(Number(draft.count));
    updates['health:steps'] = String(Number(draft.steps));
    updates['health:days'] = [
      ...new Set(draft.days.filter((day) => /^[1-7]$/.test(day))),
    ]
      .sort()
      .join(',');
  }
  return updates;
}

function readDraft(values: Record<string, string>): HealthDraft {
  const nativeAccount = values[key('HEALTH_ACCOUNT')] || '';
  const account =
    nativeAccount ||
    (values['prototype:health-bound'] === '1' ? DEFAULT_ACCOUNT : '');
  const storedRate = Number(values[key('HEALTH_MULTIPLIER')] || 100);
  return {
    account,
    multiplyEnabled: values[key('HEALTH_MULTIPLY_ENABLED')] === '1',
    planEnabled: values[key('HEALTH_PLAN_ENABLED')] === '1',
    limitEnabled: values[key('HEALTH_DAILY_LIMIT_ENABLED')] === '1',
    multiplier: Number.isFinite(storedRate)
      ? Math.min(10, Math.max(1, Math.round(storedRate / 100)))
      : 1,
    limit: values[key('HEALTH_DAILY_LIMIT_STEPS')] ?? '10000',
    start: values['health:start'] || '09:00',
    end: values['health:end'] || '18:00',
    count: values['health:count'] ?? '10',
    steps: values['health:steps'] ?? '200',
    days: (values['health:days'] ?? '1,2,3,4,5').split(',').filter(Boolean),
  };
}

function NumberDraft({
  name,
  title,
  value,
  maximum,
  error,
  onChange,
}: {
  name: string;
  title: string;
  value: string;
  maximum: number;
  error?: string;
  onChange: (value: string) => void;
}) {
  const errorId = name.replace(/[^a-zA-Z0-9_-]/g, '-') + '-error';
  return (
    <div className="c-field" {...identity('config:' + name, title)}>
      <FeatureTitle title={title} help={help[title]} />
      <input
        aria-label={title}
        type="number"
        inputMode="numeric"
        min={1}
        max={maximum}
        step={1}
        value={value}
        aria-invalid={Boolean(error)}
        aria-describedby={error ? errorId : undefined}
        onChange={(event) => onChange(event.target.value)}
      />
      {error && (
        <small id={errorId} className="c-error" role="alert">
          {error}
        </small>
      )}
    </div>
  );
}

function HealthTimePicker({
  initial,
  label,
  onConfirm,
}: {
  initial: string;
  label: string;
  onConfirm: (value: string) => void;
}) {
  const model = useModel();
  const [time, setTime] = useState(initial);
  const valid = isTime(time);
  return (
    <>
      <input
        className="c-picker-search"
        type="time"
        aria-label={label + '时间'}
        value={time}
        step={60}
        onChange={(event) => setTime(event.target.value)}
      />
      <footer>
        <button onClick={model.close}>取消</button>
        <button
          disabled={!valid}
          onClick={() => {
            if (valid) {
              onConfirm(time);
              model.close();
            }
          }}
        >
          确定
        </button>
      </footer>
    </>
  );
}

function timetable(draft: HealthPlanDraft): string[] {
  if (validateHealthPlan(draft)) return [];
  const date = new Date();
  date.setHours(0, 0, 0, 0);
  for (
    let i = 0;
    i < 7 && !draft.days.includes(String(((date.getDay() + 6) % 7) + 1));
    i++
  )
    date.setDate(date.getDate() + 1);
  return Array.from(
    { length: Math.min(8, Number(draft.count)) },
    (_, index) => {
      const slot = Math.floor(
        (timeSpan(draft) * (index + 0.37)) / Number(draft.count),
      );
      const moment = new Date(date);
      moment.setMinutes(minutes(draft.start) + slot);
      const pad = (n: number) => String(n).padStart(2, '0');
      return `${pad(moment.getMonth() + 1)}/${pad(moment.getDate())} ${pad(moment.getHours())}:${pad(moment.getMinutes())} +${Number(draft.steps)} 步`;
    },
  );
}

export function CurrentHealth() {
  const model = useModel();
  const [draft, setDraft] = useState<HealthDraft>(() =>
    readDraft(model.values),
  );
  const touched = useRef(false);
  const current = useRef({ draft, model });
  current.current = { draft, model };
  const commit = useRef(() => {});
  commit.current = () => {
    if (!touched.current) return;
    const { draft: latest, model: latestModel } = current.current;
    for (const [name, value] of Object.entries(healthDraftUpdates(latest)))
      if (latestModel.values[name] !== value) latestModel.set(name, value);
  };
  useEffect(() => {
    if (!touched.current) return;
    const timer = setTimeout(() => commit.current(), 600);
    return () => clearTimeout(timer);
  }, [draft]);
  useEffect(() => {
    const flush = () => commit.current();
    window.addEventListener('pagehide', flush);
    return () => {
      window.removeEventListener('pagehide', flush);
      flush();
    };
  }, []);

  function change(patch: Partial<HealthDraft>) {
    touched.current = true;
    setDraft((previous) => ({ ...previous, ...patch }));
  }
  const localValues = {
    ...model.values,
    [key('HEALTH_MULTIPLY_ENABLED')]: draft.multiplyEnabled ? '1' : '0',
    [key('HEALTH_PLAN_ENABLED')]: draft.planEnabled ? '1' : '0',
    [key('HEALTH_DAILY_LIMIT_ENABLED')]: draft.limitEnabled ? '1' : '0',
  };
  const localModel = {
    ...model,
    values: localValues,
    set: (name: string, value: string) => {
      if (
        name === key('HEALTH_MULTIPLY_ENABLED') ||
        name === key('HEALTH_PLAN_ENABLED')
      ) {
        if (value === '1' && !draft.account) {
          model.tell('请先绑定账户');
          return;
        }
        change(
          name === key('HEALTH_MULTIPLY_ENABLED')
            ? { multiplyEnabled: value === '1' }
            : { planEnabled: value === '1' },
        );
      } else if (name === key('HEALTH_DAILY_LIMIT_ENABLED'))
        change({ limitEnabled: value === '1' });
      else model.set(name, value);
    },
  };
  const feature = (name: string, title: string, children: ReactNode) => (
    <Toggle name={key(name)} title={title} help={help[title]}>
      {children}
    </Toggle>
  );
  const planError = validateHealthPlan(draft);
  const invalidLimit =
    draft.limitEnabled && !isInteger(draft.limit, 1, 1000000);
  const countError = !isInteger(draft.count, 1, 100)
    ? '请输入 1–100 的整数；此计划未保存。'
    : '';
  const stepsError = !isInteger(draft.steps, 1, 1000000)
    ? '请输入有效的每次步数；此计划未保存。'
    : '';
  const preview = timetable(draft);
  const enabled = draft.multiplyEnabled || draft.planEnabled;
  const background = !enabled
    ? '后台执行已关闭'
    : draft.account
      ? '后台执行正常'
      : '等待后台服务连接';
  const pickTime = (start: boolean) =>
    model.dialog(
      start ? '开始时间' : '结束时间',
      <HealthTimePicker
        initial={start ? draft.start : draft.end}
        label={start ? '开始' : '结束'}
        onConfirm={(value) => change(start ? { start: value } : { end: value })}
      />,
    );

  return (
    <CurrentContext.Provider value={localModel}>
      <Card path="HealthSettingsActivity:account" label="账户绑定">
        <FeatureTitle title="账户绑定" help={help['账户绑定']} />
        <p
          className="c-note"
          style={{ fontSize: 13, fontWeight: 600, color: 'inherit' }}
        >
          {draft.account
            ? '已绑定本机账户 · ' + draft.account.slice(0, 8)
            : '尚未绑定账户'}
        </p>
        <div className="c-two-columns">
          <Button
            onClick={() => {
              model.set('prototype:health-opened', '1');
              model.tell('原型演示：已打开健康应用，账户已接入');
            }}
          >
            打开健康应用
          </Button>
          <Button
            onClick={() => {
              if (model.values['prototype:health-opened'] !== '1') {
                model.tell('先打开小米运动健康，等待账户接入后再绑定');
                return;
              }
              change({
                account: model.values[key('HEALTH_ACCOUNT')] || DEFAULT_ACCOUNT,
              });
              model.tell('原型演示：已绑定当前账户');
            }}
          >
            绑定当前账户
          </Button>
        </div>
        <output className="c-note" style={{ display: 'block' }}>
          {background}
        </output>
        <p className="c-note">
          后台执行需要在系统电池优化中允许小米运动健康自启动和后台运行。强行停止后需重新打开。云同步遵循健康应用的自动同步间隔，需要立即同步时可打开健康应用。
        </p>
      </Card>

      <Card path="HealthSettingsActivity:multiply" label="真实步数加倍">
        {feature(
          'HEALTH_MULTIPLY_ENABLED',
          '真实步数加倍',
          <div
            className="c-range"
            {...identity('config:' + key('HEALTH_MULTIPLIER'), '步数倍数')}
          >
            <FeatureTitle title="步数倍数" help={help['步数倍数']} />
            <small>当前：{draft.multiplier} 倍</small>
            <input
              type="range"
              aria-label="步数倍数"
              min={1}
              max={10}
              step={1}
              value={draft.multiplier}
              onChange={(event) =>
                change({ multiplier: Number(event.target.value) })
              }
            />
          </div>,
        )}
      </Card>

      <Card path="HealthSettingsActivity:plan" label="随机增加步数">
        {feature(
          'HEALTH_PLAN_ENABLED',
          '随机增加步数',
          <>
            <FeatureTitle title="执行时间" help={help['执行时间']} />
            <div className="c-two-columns">
              <Button onClick={() => pickTime(true)}>
                开始：{draft.start}
              </Button>
              <Button onClick={() => pickTime(false)}>结束：{draft.end}</Button>
            </div>
            <NumberDraft
              name="health:count"
              title="随机执行次数"
              value={draft.count}
              maximum={100}
              error={countError}
              onChange={(count) => change({ count })}
            />
            <NumberDraft
              name="health:steps"
              title="每次增加步数"
              value={draft.steps}
              maximum={1000000}
              error={stepsError}
              onChange={(steps) => change({ steps })}
            />
            <FeatureTitle title="执行星期" help={help['执行星期']} />
            <div
              className="c-weekdays"
              style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(4,minmax(0,1fr))',
              }}
            >
              {WEEKDAYS.map((label, index) => {
                const day = String(index + 1);
                return (
                  <label className="c-check" key={day}>
                    <input
                      type="checkbox"
                      checked={draft.days.includes(day)}
                      onChange={(event) =>
                        change({
                          days: event.target.checked
                            ? [...draft.days, day].sort()
                            : draft.days.filter((value) => value !== day),
                        })
                      }
                    />
                    {label}
                  </label>
                );
              })}
            </div>
            {planError ? (
              <p className="c-error" role="alert">
                {draft.account ? planError : '绑定账户后可预览计划。'}
              </p>
            ) : (
              <p className="c-note" style={{ whiteSpace: 'pre-line' }}>
                {'每日合计：' +
                  Number(draft.count) * Number(draft.steps) +
                  ' 步\n随机时间示例：\n' +
                  preview.join('\n') +
                  (Number(draft.count) > 8 ? '\n……' : '')}
              </p>
            )}
            <p className="c-note">
              修改自动保存。当天已生成的时间表保持不变，修改用于下一执行日；关闭后停止后续新增，已保存的步数保留。
            </p>
          </>,
        )}
      </Card>

      <Card path="HealthSettingsActivity:daily-limit" label="当日步数上限">
        {feature(
          'HEALTH_DAILY_LIMIT_ENABLED',
          '当日步数上限',
          <>
            <NumberDraft
              name={key('HEALTH_DAILY_LIMIT_STEPS')}
              title="上限步数"
              value={draft.limit}
              maximum={1000000}
              error={
                invalidLimit
                  ? '请输入 1–1000000 的整数；此项未保存，仍使用原上限设置。'
                  : ''
              }
              onChange={(limit) => change({ limit })}
            />
            <p className="c-note">
              可设置 1–1000000
              步，修改自动保存。真实步行仍正常记录，已有步数不会减少；次日按新一天重新计算。提高或关闭上限后恢复后续增步，先前受限的计划步数不补发。
            </p>
          </>,
        )}
      </Card>
    </CurrentContext.Provider>
  );
}
