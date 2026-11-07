'use client';
import {
  Button,
  CurrentContext,
  Range,
  useModel,
  identity,
} from './current-ui';
import { NativeSelect } from './current-native-controls';
import { layoutIsSingle } from './current-status-policy';
import {
  componentNames,
  defaultZone,
  placementItems,
  placementOwner,
  placementKey,
  placementZones,
  readPlacement,
  numericOrderKey,
} from './current-status-placement';

export function PlacementEditor({ id: requested }: { id: string }) {
  const m = useModel(),
    id = placementOwner(m.values, requested);
  const { zone, order } = readPlacement(m.values, id);
  const single =
    layoutIsSingle(m.values) ||
    m.values.ls_augment_statusbar_position_size_only === '1';
  const title =
    placementItems(m.values).find((i) => i.id === id)?.title ||
    componentNames[id] ||
    id;
  const edit = (key: string, value: string) => {
    m.set('prototype:placement:focus', id);
    if (key === 'placement:side')
      m.set(placementKey(id, 'zone'), String(Number(value) * 3 + (zone % 3)));
    else if (key === 'placement:row')
      m.set(
        placementKey(id, 'zone'),
        String(Math.floor(zone / 3) * 3 + Number(value)),
      );
    else if (key === 'placement:order') m.set(numericOrderKey(id), value);
    else m.set(key, value);
  };
  return (
    <div {...identity('placement:' + id, title + '位置与顺序')}>
      {id !== requested && (
        <p className="c-native-note">
          随{title}整体排列；子元素边距在当前图标设置中调整。
        </p>
      )}
      <CurrentContext.Provider
        value={{
          ...m,
          values: {
            ...m.values,
            'placement:side': String(Math.floor(zone / 3)),
            'placement:row': String(zone % 3),
            'placement:order': String(order),
          },
          set: edit,
        }}
      >
        <NativeSelect
          name="placement:side"
          title="所在区域"
          choices={['左侧', '中间', '右侧']}
        />
        {!single && (
          <NativeSelect
            name="placement:row"
            title="行位置"
            choices={['上排', '下排', '跨两排']}
            help="对象本身选择双排时使用所在侧的两行。单排布局隐藏行位置并保留原值。"
          />
        )}
        {single && (
          <p className="c-native-note">
            当前按单排排列；已保存的{placementZones[zone]}位置在双排时恢复。
          </p>
        )}
        <Range
          name="placement:order"
          title="显示顺序"
          min={1}
          max={999}
          initial={order}
          help="同一区域内，数字越小越靠前。相同数字按固定目录顺序排列；隐藏图标保留顺序，改变位置不会改写其他图标的数字。可点击当前值精确输入。"
        />
        <Range
          name={'prototype:component-gap:' + id}
          title="与后一项的额外间距"
          min={-8}
          max={24}
          suffix=" dp"
          help="负值收紧、正值拉开，0 保持默认距离；遇到实际边界重叠时保留安全距离。图标自身四边微调仍在图标间距中设置。"
        />
        <Button
          secondary
          onClick={() => {
            m.set(placementKey(id, 'zone'), String(defaultZone(id)));
            m.set(placementKey(id, 'order'), '');
            m.set(numericOrderKey(id), '');
            m.set('prototype:component-gap:' + id, '0');
          }}
        >
          恢复此项位置与顺序
        </Button>
      </CurrentContext.Provider>
    </div>
  );
}
