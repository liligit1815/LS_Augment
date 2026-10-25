'use client';
import { useState } from 'react';
import {
  Button,
  CurrentContext,
  Range,
  useModel,
  identity,
} from './current-ui';
import { NativeFold, NativeSelect } from './current-native-controls';
import {
  layoutIsSingle,
  hiddenReason,
  surfaceKey,
} from './current-status-policy';
import {
  componentNames,
  defaultZone,
  placementItems,
  placementOwner,
  placementKey,
  placementPeers,
  placementRoute,
  placementZones,
  readPlacement,
  movePlacement,
} from './current-status-placement';

export function PlacementEditor({ id: requested }: { id: string }) {
  const m = useModel(),
    id = placementOwner(m.values, requested);
  const { zone } = readPlacement(m.values, id),
    peers = placementPeers(m.values, id);
  const at = peers.findIndex((p) => p.id === id);
  const single =
    layoutIsSingle(m.values) ||
    m.values.ls_augment_statusbar_position_size_only === '1';
  const title =
    placementItems(m.values).find((i) => i.id === id)?.title ||
    componentNames[id] ||
    id;
  const apply = (changes: Record<string, string>) =>
    Object.entries(changes).forEach(([k, v]) => m.set(k, v));
  const edit = (key: string, value: string) => {
    m.set('prototype:placement:focus', id);
    if (key === 'placement:side')
      apply(movePlacement(m.values, id, Number(value) * 3 + (zone % 3)));
    else if (key === 'placement:row')
      m.set(
        placementKey(id, 'zone'),
        String(Math.floor(zone / 3) * 3 + Number(value)),
      );
    else if (key === 'placement:before')
      apply(movePlacement(m.values, id, zone, value));
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
            'placement:before': peers[at + 1]?.id || '',
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
        <NativeSelect
          name="placement:before"
          title="放置顺序"
          choices={[
            ...peers
              .filter((p) => p.id !== id)
              .map(
                (p) => [p.id, '放在' + p.title + '之前'] as [string, string],
              ),
            ['', '放在本区域最后'],
          ]}
          help="决定实际排列顺序。没有活动状态的图标也可预先配置，临时消失不会改变顺序。"
        />
        <div className="sd-actions">
          <Button
            disabled={at <= 0}
            onClick={() =>
              apply(movePlacement(m.values, id, zone, peers[at - 1]?.id))
            }
          >
            前移
          </Button>
          <Button
            disabled={at < 0 || at >= peers.length - 1}
            onClick={() =>
              apply(movePlacement(m.values, id, zone, peers[at + 2]?.id || ''))
            }
          >
            后移
          </Button>
        </div>
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
            m.set('prototype:component-gap:' + id, '0');
          }}
        >
          恢复此项位置与顺序
        </Button>
      </CurrentContext.Provider>
    </div>
  );
}

export function PlacementList() {
  const m = useModel();
  const query = m.values['prototype:layout-query'] || '',
    selected = m.values['prototype:layout-selection'] || '';
  const setQuery = (value: string) => m.set('prototype:layout-query', value);
  const setSelected = (value: string) =>
    m.set('prototype:layout-selection', value);
  const [drag, setDrag] = useState('');
  const list = placementItems(m.values).filter((i) =>
    (i.title + ' ' + i.id).toLowerCase().includes(query.toLowerCase()),
  );
  return (
    <>
      <label className="sd-search">
        查找排列对象
        <input
          type="search"
          aria-label="查找排列对象"
          placeholder="例如：通知、蓝牙、时钟"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
      </label>
      <p className="c-native-note">
        通知作为整体排列，系统图标逐项排列。点击“调整”选择位置与顺序，也可拖到另一项之前；子元素跟随所属图标。
      </p>
      {[0, 1, 2].map((side) => (
        <NativeFold
          key={side}
          title={['左侧图标', '中间图标', '右侧图标'][side]}
        >
          {list
            .filter(
              (i) =>
                Math.floor(readPlacement(m.values, i.id).zone / 3) === side,
            )
            .sort(
              (a, b) =>
                readPlacement(m.values, a.id).order -
                readPlacement(m.values, b.id).order,
            )
            .map((i) => (
              <div
                className="sd-placement-item"
                key={i.id}
                draggable
                onDragStart={() => setDrag(i.id)}
                onDragEnd={() => setDrag('')}
                onDragOver={(e) => e.preventDefault()}
                onDrop={(e) => {
                  e.preventDefault();
                  if (drag && drag !== i.id) {
                    Object.entries(
                      movePlacement(
                        m.values,
                        drag,
                        readPlacement(m.values, i.id).zone,
                        i.id,
                      ),
                    ).forEach(([k, v]) => m.set(k, v));
                    setDrag('');
                  }
                }}
              >
                <div className="sd-placement-row">
                  <button
                    className="sd-placement-name"
                    aria-label={'打开' + i.title + '设置'}
                    onClick={() => m.go(placementRoute(m.values, i.id))}
                  >
                    <strong>{i.title}</strong>
                    <small>
                      {placementZones[readPlacement(m.values, i.id).zone]}
                      {hiddenReason(
                        m.values,
                        m.values[surfaceKey] || 'all',
                        i.id,
                      )
                        ? ' · 已隐藏，保留位置'
                        : ' · 按系统状态显示'}
                    </small>
                  </button>
                  <Button
                    secondary
                    onClick={() => setSelected(selected === i.id ? '' : i.id)}
                  >
                    {selected === i.id ? '收起' : '调整'}
                  </Button>
                </div>
                {selected === i.id && <PlacementEditor id={i.id} />}
              </div>
            ))}
          {!list.some(
            (i) => Math.floor(readPlacement(m.values, i.id).zone / 3) === side,
          ) && (
            <p className="c-native-note">
              没有匹配的图标。可从其他区域调整位置移入。
            </p>
          )}
        </NativeFold>
      ))}
    </>
  );
}
