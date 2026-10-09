/* eslint-disable nextjs/no-img-element -- Preserve local native artwork and user-selected animated image files. */
'use client';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { Toggle, Range, useModel } from './current-ui';
import { NativeSelect } from './current-native-controls';
import native from './current-native-data.json';
const fields = [
  'mode',
  'asset',
  'background_asset',
  'background_scale_percent',
  'scale_percent',
  'opacity_percent',
  'mirror',
  'inset_dp',
  'offset_y_dp',
];
const key = (side: string, field: string) =>
  'ls_augment_rm_back_icon_' + side + '_' + field;
export function BackGestureSettings() {
  const m = useModel(),
    v = m.values;
  const preset = (sides: string[]) =>
    sides.forEach((side) => {
      m.set(key(side, 'mode'), '1');
      m.set(key(side, 'asset'), '/current/miku-arrow.png');
      m.set(key(side, 'background_asset'), '/current/miku-background.png');
    });
  const upload = (side: string, field: string, file?: File) => {
    if (!file) return;
    const reader = new FileReader();
    reader.onload = () => {
      if (typeof reader.result === 'string') {
        m.set(key(side, field), reader.result);
        m.set(key(side, 'mode'), '1');
      }
    };
    reader.readAsDataURL(file);
  };
  return (
    <div className="c-back-gesture">
      <p className="c-native-note">
        两侧图标和遮罩独立选图，支持 GIF、动态
        WebP；动图保留完整画面，静态图标可裁剪。大小最高 10
        倍。下方为组合示意，实际跟手效果请从屏幕边缘滑动查看。
      </p>
      <button className="c-button" onClick={() => preset(['left', 'right'])}>
        初音未来 · 应用到双侧
      </button>
      {['left', 'right'].map((side, i) => (
        <div key={side} className="c-gesture-side">
          <h3>{i === 0 ? '左边缘 → 向右滑' : '右边缘 ← 向左滑'}</h3>
          <p className="c-native-note">修改此侧不会联动另一侧</p>
          <NativeSelect
            name={key(side, 'mode')}
            title="图标来源"
            choices={['原厂图标', '自定义图片']}
          />
          <div
            className={'c-gesture-preview ' + side}
            aria-label={i === 0 ? '左侧自定义图片预览' : '右侧自定义图片预览'}
          >
            {v[key(side, 'mode')] === '1' &&
              v[key(side, 'background_asset')] && (
                <img
                  alt="遮罩背景"
                  src={v[key(side, 'background_asset')]}
                  className="c-gesture-mask"
                  style={{
                    transform: `scale(${Number(v[key(side, 'background_scale_percent')] || 100) / 100})`,
                  }}
                />
              )}
            {v[key(side, 'mode')] === '1' && v[key(side, 'asset')] ? (
              <img
                alt="返回图标"
                src={v[key(side, 'asset')]}
                style={{
                  opacity: Number(v[key(side, 'opacity_percent')] || 100) / 100,
                  transform: `translate(${Number(v[key(side, 'inset_dp')] || 0) * (i === 0 ? 1 : -1)}px,${Number(v[key(side, 'offset_y_dp')] || 0)}px) scale(${Number(v[key(side, 'scale_percent')] || 100) / 100}) scaleX(${v[key(side, 'mirror')] === '1' ? -1 : 1})`,
                }}
              />
            ) : i === 0 ? (
              <ArrowRight size={26} />
            ) : (
              <ArrowLeft size={26} />
            )}
          </div>
          <button className="c-button" onClick={() => preset([side])}>
            此侧使用初音未来
          </button>
          <div className="c-gesture-actions">
            <label className="c-button c-upload">
              选择图标（含动图）
              <input
                aria-label={(i === 0 ? '左侧' : '右侧') + '选择图标'}
                type="file"
                accept="image/*"
                onChange={(e) => upload(side, 'asset', e.target.files?.[0])}
              />
            </label>
            <button
              className="c-button"
              onClick={() =>
                fields.forEach((f) =>
                  m.set(
                    key(side, f),
                    (native.allDefaults as Record<string, string>)[
                      key(side, f)
                    ] || '',
                  ),
                )
              }
            >
              恢复本侧原厂
            </button>
          </div>
          <label className="c-button c-upload">
            选择遮罩背景（含动图）
            <input
              aria-label={(i === 0 ? '左侧' : '右侧') + '选择遮罩背景'}
              type="file"
              accept="image/*"
              onChange={(e) =>
                upload(side, 'background_asset', e.target.files?.[0])
              }
            />
          </label>
          {v[key(side, 'background_asset')] && (
            <button
              className="c-button"
              onClick={() => {
                m.set(key(side, 'background_asset'), '');
                m.set(key(side, 'background_scale_percent'), '100');
              }}
            >
              保留人物，恢复原厂波浪
            </button>
          )}
          <Toggle name={key(side, 'mirror')} title="水平镜像" />
          {[
            ['scale_percent', '图标大小', 10, 1000],
            ['background_scale_percent', '遮罩大小', 10, 1000],
            ['opacity_percent', '不透明度', 10, 100],
            ['inset_dp', '向屏幕内侧偏移', -256, 512],
            ['offset_y_dp', '向下偏移', -512, 512],
          ].map(([f, title, min, max]) => (
            <Range
              key={String(f)}
              name={key(side, String(f))}
              title={String(title)}
              min={Number(min)}
              max={Number(max)}
              initial={String(f).endsWith('percent') ? 100 : 0}
            />
          ))}
          <button
            className="c-button"
            onClick={() =>
              fields.forEach((f) =>
                m.set(key(i === 0 ? 'right' : 'left', f), v[key(side, f)]),
              )
            }
          >
            {i === 0 ? '复制到右侧' : '复制到左侧'}
          </button>
        </div>
      ))}
    </div>
  );
}
