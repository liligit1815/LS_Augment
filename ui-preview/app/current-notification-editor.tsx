'use client';
import type { ReactNode } from 'react';
import {
  Button,
  Card,
  CurrentContext,
  Range,
  Toggle,
  useModel,
} from './current-ui';
import { NativeFold, NativeSelect } from './current-native-controls';
import {
  layoutIsSingle,
  resolveSpacing,
  spacingAxes,
  spacingKey,
  spacingMode,
  spacingModeKey,
} from './current-status-policy';
import { surfaces } from './current-status-icon-manager';

const key = (name: string) => 'ls_augment_statusbar_notification_' + name;
const scopeKey = 'prototype:notification-spacing-surface';

export function NotificationEditor({
  summary,
  native,
}: {
  summary: ReactNode;
  native: ReactNode;
}) {
  const m = useModel();
  const scope = m.values[scopeKey] || 'all';
  const modeKey = spacingModeKey(scope, 'notifications');
  const edgeKey = (axis: string) => spacingKey(scope, 'notifications', axis);
  const edgeMode = spacingMode(m.values, scope, 'notifications');
  const edges = resolveSpacing(m.values, scope, 'notifications');
  const model = {
    ...m,
    values: {
      ...m.values,
      [modeKey]: edgeMode,
      ...Object.fromEntries(
        spacingAxes.map((axis, i) => [edgeKey(axis), String(edges[i])]),
      ),
    },
    set(name: string, value: string) {
      if (name === modeKey && value === 'custom') {
        spacingAxes.forEach((axis, i) =>
          m.set(edgeKey(axis), m.values[edgeKey(axis)] ?? String(edges[i])),
        );
      }
      if (spacingAxes.some((axis) => edgeKey(axis) === name)) {
        spacingAxes.forEach((axis, i) =>
          m.set(edgeKey(axis), String(edges[i])),
        );
        m.set(modeKey, 'custom');
      }
      m.set(name, value);
    },
  };
  const requestedDual = m.values[key('two_rows')] === '1';
  const positionOnly = m.values.ls_augment_statusbar_position_size_only === '1';
  const single = layoutIsSingle(m.values);
  const base = 'ls_augment_notification_summary_';
  const mode = m.values[base + 'mode'] || '0';
  const asset = m.values[base + 'asset'];
  const visible = m.values['status:notifications:on'] !== '0';
  return (
    <CurrentContext.Provider value={model}>
      <Card>
        <Toggle
          name="status:notifications:on"
          title="显示通知图标"
          initial="1"
          help="开启时显示状态栏通知图标；关闭时隐藏通知区域，包括已启用的通知汇总。原通知不删除，位置、顺序、大小、数量、边距与汇总配置均保留，重新开启后恢复。"
        />
        {!visible && (
          <p className="c-native-note" role="status">
            通知图标已隐藏，通知汇总也暂不显示；全部配置保留。
          </p>
        )}
        <NativeSelect
          name={key('two_rows')}
          title="通知图标排布方式"
          help="单排将通知图标排列在同一行；双排按上下两行排列，共用所在区域的空间。每排数量由可用宽度与图标大小决定，排间距沿用状态栏布局中的两排行间距。整栏单排或开启“仅调整位置和大小”时，双排暂不生效，已选配置保留。"
          choices={[
            ['0', '单排'],
            ['1', '双排'],
          ]}
        />
        {requestedDual && (single || positionOnly) && (
          <p className="c-native-note" role="status">
            双排配置已保留；
            {positionOnly
              ? '“仅调整位置和大小”已开启'
              : '当前整栏为单排／跟随系统'}
            ，目前按单排显示。
          </p>
        )}
        {requestedDual && (
          <NativeFold
            title="双排数量与行间距"
            help="每排数量由实际通知数、数量上限、图标大小和可用空间自动安排。两排之间的基础间距由状态栏布局统一设置，所有双排对象共享。"
          >
            <p className="c-native-note">
              每排数量：自动安排，受可用空间和通知数量限制。
            </p>
            <p className="c-native-note">
              基础行间距：{m.values.ls_augment_statusbar_dual_row_gap_dp || '0'}{' '}
              dp（整栏共享）。
            </p>
            <Button secondary onClick={() => m.go('status_arrangement')}>
              前往状态栏布局调整行间距
            </Button>
          </NativeFold>
        )}
        <Toggle
          name={key('unlimited')}
          title="通知图标数量解限"
          help="开启后接管原厂数量限制，可在展开配置中设置最多显示通知数。0 不额外限制，1～20 为自定义上限，双排时两排合计；仍受实际通知数与可用空间影响。关闭后恢复原厂数量规则，保留自定义上限。仅影响状态栏图标，不删除通知。"
        >
          <Range
            name={key('max')}
            title="最多显示通知数"
            min={0}
            max={20}
            help="数量解限开启后生效。0 不额外限制，1～20 为两排合计的最多通知图标数；仍受实际通知数与可用空间限制，超出上限的通知仍保留在通知中心。"
          />
        </Toggle>
        <NativeFold
          title="通知图标大小"
          help="调整状态栏通知图标的显示尺寸，范围为 6～32 dp。数值越大，图标越大，占用空间越多；实际可显示数量仍受状态栏可用空间限制。不改变通知卡片大小，也不改变通知汇总的内容大小。"
        >
          <Range
            name="status:notifications:size"
            title="图标大小"
            min={6}
            max={32}
            initial={13}
            suffix=" dp"
          />
        </NativeFold>
        <NativeFold
          title="通知图标边距"
          help="分别调整每个通知图标上、下、左、右四边的额外留白，支持共享方案和各显示位置单独配置。0 不增加额外留白；负值收紧，正值增加，原型范围为 −12～24 dp。共享方案不覆盖各位置的单独配置，选择继承共享可恢复统一规则。上下边距与整栏双排基础行间距分别生效，过小可能重叠。"
        >
          <NativeSelect
            name={scopeKey}
            title="边距适用位置"
            choices={surfaces}
            initial="all"
          />
          <NativeSelect
            name={modeKey}
            title="边距规则"
            choices={[
              ['inherit', scope === 'all' ? '遵循原厂' : '继承共享方案'],
              ['custom', '单独调整'],
              ['native', '使用原厂间距'],
            ]}
          />
          {edgeMode !== 'custom' && (
            <p className="c-native-note">
              当前上／下／左／右边距：{edges[1]}／{edges[3]}／{edges[0]}／
              {edges[2]} dp。选择“单独调整”可修改，旧数值保留。
            </p>
          )}
          {edgeMode === 'custom' &&
            (
              [
                ['top', '上边距'],
                ['bottom', '下边距'],
                ['start', '左边距'],
                ['end', '右边距'],
              ] as const
            ).map(([axis, title]) => (
              <Range
                key={axis}
                name={edgeKey(axis)}
                title={title}
                min={-12}
                max={24}
                suffix=" dp"
              />
            ))}
          <Button secondary onClick={() => m.set(modeKey, 'inherit')}>
            {scope === 'all' ? '恢复默认边距规则' : '恢复继承共享方案'}
          </Button>
        </NativeFold>
      </Card>
      <Card>
        {summary}
        {m.values[base + 'enabled'] === '1' && mode === '2' && !asset && (
          <p className="c-native-note">尚未选择汇总图片，暂时显示通知图标。</p>
        )}
        {native}
      </Card>
    </CurrentContext.Provider>
  );
}
