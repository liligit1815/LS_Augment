'use client';
import catalog from './current-catalog.json';
import { Toggle, type Option } from './current-ui';
import { OptionInput, ValueGate } from './current-feature-input';
import { BackGestureSettings } from './current-back-gesture';
export type Feature = {
  id: string;
  title: string;
  toggleKey: string | null;
  parameterKeys: string[];
  features: Feature[];
  activation: { noOpValue: string; comparison: string };
  hasConfiguration: boolean;
  objectGroup?: string;
  destination?: string;
};
const optionMap = Object.fromEntries(
  catalog.options.map((o) => [o.key, o]),
) as Record<string, Option>;
export function FeatureRow({ feature: f }: { feature: Feature }) {
  const toggle = f.toggleKey ? optionMap[f.toggleKey] : undefined;
  const body =
    f.id === 'systemui:back_icon_enabled' ? (
      <BackGestureSettings />
    ) : f.hasConfiguration ? (
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
  if (!parameter) return null;
  return (
    <ValueGate
      name={f.id}
      title={f.title}
      help={parameter?.help}
      defaults={{ [parameter.key]: f.activation.noOpValue }}
      comparison={f.activation.comparison}
    >
      {body}
    </ValueGate>
  );
}
