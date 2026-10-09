'use client';
import type { CSSProperties } from 'react';
import { useModel, Toggle } from './current-ui';
import { LayoutNumber } from './current-status-sheet';
import './current-layout-editors.css';

export const launcherGridDefaults = {
  'launcher:grid:enabled': '0',
  'launcher:grid:rows': '6',
  'launcher:grid:columns': '4',
};
const bounded = (raw: string | undefined, fallback: number) => {
  const n = Number(raw);
  return Number.isInteger(n) && n >= 3 && n <= 12 ? n : fallback;
};
export function CurrentLauncherLayout() {
  const m = useModel();
  const rows = bounded(m.values['launcher:grid:rows'], 6);
  const cols = bounded(m.values['launcher:grid:columns'], 4);
  const setGrid = (columns: number, lines: number) => {
    m.set('launcher:grid:columns', String(columns));
    m.set('launcher:grid:rows', String(lines));
  };
  return (
    <div
      className="c-launcher-layout c-feature"
      data-native-path="prototype:launcher-grid"
      data-ui-label="桌面布局 网格 行数 列数 n×n nxn"
    >
      <Toggle
        name="launcher:grid:enabled"
        title="自定义桌面布局"
        help="自定义桌面图标的列数和行数。此处为网页布局预览，修改自动保存。"
        accessibleWhileOff
      >
        <p className="c-layout-help">
          列 × 行 · 支持 3–12 列、3–12 行，也可分别设置。
        </p>
        <div className="c-launcher-presets" aria-label="桌面布局预设">
          {[
            [4, 5],
            [4, 6],
            [5, 6],
            ...Array.from({ length: 10 }, (_, i) => [i + 3, i + 3]),
          ].map(([c, r]) => (
            <button
              key={c + 'x' + r}
              aria-pressed={cols === c && rows === r}
              onClick={() => setGrid(c, r)}
            >
              {c} × {r}
            </button>
          ))}
        </div>
        <div className="c-layout-fields">
          <LayoutNumber
            title="桌面列数"
            value={cols}
            min={3}
            max={12}
            onChange={(c) => setGrid(c, rows)}
          />
          <LayoutNumber
            title="桌面行数"
            value={rows}
            min={3}
            max={12}
            onChange={(r) => setGrid(cols, r)}
          />
        </div>
        <figure
          className="c-launcher-grid-preview"
          aria-label={`${cols} 列 ${rows} 行，可放置 ${cols * rows} 个图标`}
          style={{
            gridTemplateColumns: `repeat(${cols}, 1fr)`,
            gridTemplateRows: `repeat(${rows}, 1fr)`,
          }}
        >
          {Array.from({ length: rows * cols }, (_, i) => (
            <span
              key={i}
              className={i < Math.min(20, rows * cols) ? 'filled' : ''}
              style={
                {
                  '--tile-color': ['#267cce', '#10a5b3', '#6b75cc', '#e69742'][
                    i % 4
                  ],
                } as CSSProperties
              }
            >
              {i < Math.min(20, rows * cols) && <i />}
            </span>
          ))}
        </figure>
        <p className="c-launcher-capacity">
          <strong>
            {cols} × {rows}
          </strong>
          <span>每页 {cols * rows} 个位置</span>
        </p>
        <p className="c-layout-help">
          仅预览桌面网格；Dock 保持独立。手机上的应用和小组件尚未重新排列。
        </p>
        <button className="c-button" onClick={() => setGrid(4, 6)}>
          恢复 4 × 6
        </button>
      </Toggle>
    </div>
  );
}
