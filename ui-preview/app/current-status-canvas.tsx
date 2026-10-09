'use client';
import { useRef, useState, type CSSProperties } from 'react';
import {
  Move,
  ZoomIn,
  Maximize2,
  Undo2,
  ChevronLeft,
  ChevronRight,
} from 'lucide-react';
import { Card, Button, useModel } from './current-ui';
import { LayoutNumber, SheetContent } from './current-status-sheet';
import { NativeFold } from './current-native-controls';
import { blankCell, SHEET_CONTENT } from './current-status-sheet-model';
import {
  CANVAS_KEY,
  readCanvas,
  canvasError,
  canvasDimensions,
  canvasScale,
  trackStart,
  trackSize,
  putCanvasCell,
  columnName,
  type StatusCanvas,
} from './current-status-canvas-model';
export function CanvasPreview({ values }: { values: Record<string, string> }) {
  const sheet = readCanvas(values),
    size = canvasDimensions(sheet),
    scale = canvasScale(sheet);
  return (
    <div className="d-canvas-output" aria-label="固定区域输出预览">
      <div
        style={{
          width: 336,
          height: 48,
          position: 'relative',
          transformOrigin: '0 0',
          transform: `translate(${sheet.x}px,${sheet.y}px) scale(${scale})`,
        }}
      >
        {sheet.cells
          .filter((c) => c.content)
          .map((cell) => (
            <span
              key={cell.row + ':' + cell.col}
              style={{
                position: 'absolute',
                left: trackStart(sheet, false, cell.col),
                top: trackStart(sheet, true, cell.row),
                width:
                  trackStart(sheet, false, cell.col + cell.colSpan) -
                  trackStart(sheet, false, cell.col) -
                  sheet.colGap,
                height:
                  trackStart(sheet, true, cell.row + cell.rowSpan) -
                  trackStart(sheet, true, cell.row) -
                  sheet.rowGap,
                fontSize: cell.size,
                display: 'flex',
                alignItems: 'center',
                justifyContent:
                  cell.align === 'left'
                    ? 'flex-start'
                    : cell.align === 'right'
                      ? 'flex-end'
                      : 'center',
                padding: `${cell.paddingY}px ${cell.paddingX}px`,
              }}
            >
              <span
                style={{
                  transform: `translate(${cell.offsetX}px,${cell.offsetY}px)`,
                }}
              >
                <SheetContent cell={cell} values={values} />
              </span>
            </span>
          ))}
      </div>
      <span className="d-canvas-output-size">
        {Math.round(size.width)} × {Math.round(size.height)} dp
      </span>
    </div>
  );
}
export function CurrentStatusCanvas() {
  const m = useModel(),
    sheet = readCanvas(m.values);
  const [selected, select] = useState({ row: 0, col: 0 }),
    [origin, setOrigin] = useState({ row: 0, col: 0 });
  const [error, setError] = useState(''),
    [undo, setUndo] = useState<StatusCanvas[]>([]),
    [full, setFull] = useState(false);
  const [zoom, setZoom] = useState(1),
    [pan, setPan] = useState({ x: 0, y: 0 }),
    [mode, setMode] = useState<'select' | 'pan'>('select');
  const points = useRef(new Map<number, { x: number; y: number }>()),
    drag = useRef({ x: 0, y: 0, px: 0, py: 0, distance: 0, zoom: 1 });
  const cell =
    sheet.cells.find(
      (c) =>
        selected.row >= c.row &&
        selected.row < c.row + c.rowSpan &&
        selected.col >= c.col &&
        selected.col < c.col + c.colSpan,
    ) || blankCell(selected.row, selected.col);
  const address = columnName(cell.col) + (cell.row + 1);
  const commit = (next: StatusCanvas) => {
    const issue = canvasError(next);
    if (issue) {
      setError(issue);
      return false;
    }
    setUndo((history) => [...history.slice(-19), sheet]);
    m.set(CANVAS_KEY, JSON.stringify(next));
    select((current) => ({
      row: Math.min(current.row, next.rows - 1),
      col: Math.min(current.col, next.cols - 1),
    }));
    setOrigin((current) => ({
      row: Math.min(current.row, next.rows - 1),
      col: Math.min(current.col, next.cols - 1),
    }));
    setError('');
    return true;
  };
  const patch = (next: Partial<typeof cell>) =>
    commit(putCanvasCell(sheet, { ...cell, ...next }, cell));
  const rows = Array.from(
    { length: Math.min(6, sheet.rows - origin.row) },
    (_, i) => origin.row + i,
  );
  const cols = Array.from(
    { length: Math.min(8, sheet.cols - origin.col) },
    (_, i) => origin.col + i,
  );
  const fields = (
    <>
      <p className="d-page-description">
        编辑视图与实际输出独立。表格可继续扩展，超出顶部显示区域的内容会裁切。
      </p>
      <Card>
        <CanvasPreview values={m.values} />
        <p className="d-save-note">输出预览 · 主屏与锁屏的顶部固定区域</p>
      </Card>
      <Card>
        <div className="d-canvas-toolbar">
          <button
            aria-label="选择单元格"
            aria-pressed={mode === 'select'}
            onClick={() => setMode('select')}
          >
            选择
          </button>
          <button
            aria-label="平移画布"
            aria-pressed={mode === 'pan'}
            onClick={() => setMode('pan')}
          >
            <Move size={16} />
            平移
          </button>
          <button
            aria-label={full ? '退出全屏编辑' : '全屏编辑'}
            onClick={() => setFull(!full)}
          >
            <Maximize2 size={16} />
            {full ? '退出全屏' : '全屏'}
          </button>
          <button
            aria-label="撤销画布修改"
            disabled={!undo.length}
            onClick={() => {
              const previous = undo.at(-1)!;
              m.set(CANVAS_KEY, JSON.stringify(previous));
              setUndo(undo.slice(0, -1));
              select({ row: 0, col: 0 });
              setOrigin({ row: 0, col: 0 });
            }}
          >
            <Undo2 size={16} />
          </button>
        </div>
        <div className="d-canvas-zoom">
          <ZoomIn size={16} />
          <label>
            编辑缩放{' '}
            <input
              aria-label="编辑缩放"
              type="range"
              min={0.35}
              max={3}
              step={0.05}
              value={zoom}
              onChange={(e) => setZoom(+e.target.value)}
            />
          </label>
          <output>{Math.round(zoom * 100)}%</output>
        </div>
        <div
          className="d-canvas-viewport"
          aria-label="工作表编辑画布"
          style={{ touchAction: 'none' }}
          onPointerDown={(e) => {
            if (
              (e.target as HTMLElement).closest('button') &&
              mode === 'select' &&
              e.pointerType === 'mouse'
            )
              return;
            points.current.set(e.pointerId, { x: e.clientX, y: e.clientY });
            e.currentTarget.setPointerCapture(e.pointerId);
            drag.current = {
              x: e.clientX,
              y: e.clientY,
              px: pan.x,
              py: pan.y,
              distance: 0,
              zoom,
            };
            if (points.current.size === 2) {
              const [a, b] = [...points.current.values()];
              drag.current.distance = Math.hypot(a.x - b.x, a.y - b.y);
            }
          }}
          onPointerMove={(e) => {
            if (!points.current.has(e.pointerId)) return;
            points.current.set(e.pointerId, { x: e.clientX, y: e.clientY });
            if (points.current.size === 2) {
              const [a, b] = [...points.current.values()];
              if (drag.current.distance)
                setZoom(
                  Math.min(
                    3,
                    Math.max(
                      0.35,
                      (drag.current.zoom * Math.hypot(a.x - b.x, a.y - b.y)) /
                        drag.current.distance,
                    ),
                  ),
                );
            } else if (mode === 'pan' || e.pointerType !== 'mouse')
              setPan({
                x: drag.current.px + e.clientX - drag.current.x,
                y: drag.current.py + e.clientY - drag.current.y,
              });
          }}
          onPointerUp={(e) => points.current.delete(e.pointerId)}
          onPointerCancel={(e) => points.current.delete(e.pointerId)}
        >
          <table
            className="d-worktable"
            style={{
              transform: `translate(${pan.x}px,${pan.y}px) scale(${zoom})`,
              transformOrigin: '0 0',
            }}
            aria-label="状态栏工作表"
          >
            <colgroup>
              <col style={{ width: 30 }} />
              {cols.map((c) => (
                <col
                  key={c}
                  style={{
                    width: Math.max(44, trackSize(sheet, false, c) * 2),
                  }}
                />
              ))}
            </colgroup>
            <thead>
              <tr>
                <th aria-label="行列原点" />
                {cols.map((c) => (
                  <th key={c}>
                    {columnName(c)}
                    <input
                      aria-label={columnName(c) + '列宽'}
                      type="range"
                      min={12}
                      max={160}
                      value={trackSize(sheet, false, c)}
                      onChange={(e) =>
                        commit({
                          ...sheet,
                          colWidths: {
                            ...sheet.colWidths,
                            [c]: +e.target.value,
                          },
                        })
                      }
                    />
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => (
                <tr
                  key={r}
                  style={{
                    height: Math.max(54, trackSize(sheet, true, r) * 2),
                  }}
                >
                  <th>
                    {r + 1}
                    <input
                      aria-label={'第' + (r + 1) + '行高'}
                      type="range"
                      min={12}
                      max={80}
                      value={trackSize(sheet, true, r)}
                      onChange={(e) =>
                        commit({
                          ...sheet,
                          rowHeights: {
                            ...sheet.rowHeights,
                            [r]: +e.target.value,
                          },
                        })
                      }
                    />
                  </th>
                  {cols.map((c) => {
                    const item = sheet.cells.find(
                      (v) =>
                        r >= v.row &&
                        r < v.row + v.rowSpan &&
                        c >= v.col &&
                        c < v.col + v.colSpan,
                    );
                    const anchorRow = item ? Math.max(origin.row, item.row) : r;
                    const anchorCol = item ? Math.max(origin.col, item.col) : c;
                    if (item && (r !== anchorRow || c !== anchorCol))
                      return null;
                    const covered = item && (item.row !== r || item.col !== c);
                    const current = item
                      ? selected.row === item.row && selected.col === item.col
                      : selected.row === r && selected.col === c;
                    return (
                      <td
                        key={c}
                        rowSpan={
                          item
                            ? Math.min(
                                item.row + item.rowSpan,
                                rows.at(-1)! + 1,
                              ) - anchorRow
                            : 1
                        }
                        colSpan={
                          item
                            ? Math.min(
                                item.col + item.colSpan,
                                cols.at(-1)! + 1,
                              ) - anchorCol
                            : 1
                        }
                        data-covered={!!covered}
                      >
                        <button
                          aria-label={
                            columnName(c) +
                            (r + 1) +
                            ' ' +
                            (item?.content || '空白')
                          }
                          aria-pressed={current}
                          draggable={mode === 'select' && !!item}
                          onDragStart={(e) =>
                            e.dataTransfer.setData(
                              'text/plain',
                              JSON.stringify({
                                row: item?.row,
                                col: item?.col,
                              }),
                            )
                          }
                          onDragOver={(e) => e.preventDefault()}
                          onDrop={(e) => {
                            e.preventDefault();
                            try {
                              const source = JSON.parse(
                                e.dataTransfer.getData('text/plain'),
                              );
                              const before = sheet.cells.find(
                                (v) =>
                                  v.row === source.row && v.col === source.col,
                              );
                              if (
                                before &&
                                commit(
                                  putCanvasCell(
                                    sheet,
                                    { ...before, row: r, col: c },
                                    before,
                                  ),
                                )
                              )
                                select({ row: r, col: c });
                            } catch {
                              /* Ignore unrelated dragged files. */
                            }
                          }}
                          onClick={() => {
                            if (mode !== 'select') return;
                            select(
                              item
                                ? { row: item.row, col: item.col }
                                : { row: r, col: c },
                            );
                          }}
                          onDoubleClick={() => {
                            select(
                              item
                                ? { row: item.row, col: item.col }
                                : { row: r, col: c },
                            );
                            document
                              .getElementById('canvas-cell-inspector')
                              ?.scrollIntoView({ block: 'nearest' });
                          }}
                        >
                          {item && !covered ? (
                            <span style={{ fontSize: Math.min(25, item.size) }}>
                              <SheetContent cell={item} values={m.values} />
                            </span>
                          ) : null}
                          <small>
                            {covered ? '已合并' : columnName(c) + (r + 1)}
                          </small>
                        </button>
                      </td>
                    );
                  })}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="d-canvas-pages">
          <button
            disabled={origin.col === 0}
            aria-label="查看前面列"
            onClick={() => {
              setOrigin({ ...origin, col: Math.max(0, origin.col - 8) });
              setPan({ x: 0, y: 0 });
            }}
          >
            <ChevronLeft size={16} />
          </button>
          <span>
            {columnName(origin.col)}–{columnName(cols.at(-1) ?? 0)} ·{' '}
            {origin.row + 1}–{rows.at(-1)! + 1} 行
          </span>
          <button
            disabled={origin.col + 8 >= sheet.cols}
            aria-label="查看后面列"
            onClick={() => {
              setOrigin({ ...origin, col: origin.col + 8 });
              setPan({ x: 0, y: 0 });
            }}
          >
            <ChevronRight size={16} />
          </button>
        </div>
        <div className="c-layout-fields">
          <LayoutNumber
            title="定位到行"
            min={1}
            max={sheet.rows}
            value={origin.row + 1}
            onChange={(row) => {
              setOrigin({ ...origin, row: row - 1 });
              setPan({ x: 0, y: 0 });
            }}
          />
          <LayoutNumber
            title="定位到列"
            min={1}
            max={sheet.cols}
            value={origin.col + 1}
            onChange={(col) => {
              setOrigin({ ...origin, col: col - 1 });
              setPan({ x: 0, y: 0 });
            }}
          />
        </div>
        <p className="d-save-note">
          单指平移、双指缩放；鼠标拖动内容移动单元格。表头滑杆调整行高与列宽。
        </p>
      </Card>
      {error && (
        <p role="alert" className="c-layout-error">
          {error}
        </p>
      )}
      <Card>
        <NativeFold title="表格尺寸与默认间距">
          <div className="c-layout-fields">
            <LayoutNumber
              title="表格行数"
              min={1}
              max={2147483646}
              value={sheet.rows}
              onChange={(rows) => commit({ ...sheet, rows })}
            />
            <LayoutNumber
              title="表格列数"
              min={1}
              max={2147483646}
              value={sheet.cols}
              onChange={(cols) => commit({ ...sheet, cols })}
            />
            <LayoutNumber
              title="默认行高"
              min={1}
              max={160}
              value={sheet.rowHeight}
              onChange={(rowHeight) => commit({ ...sheet, rowHeight })}
            />
            <LayoutNumber
              title="默认列宽"
              min={1}
              max={320}
              value={sheet.colWidth}
              onChange={(colWidth) => commit({ ...sheet, colWidth })}
            />
            <LayoutNumber
              title="行间距"
              min={0}
              max={40}
              value={sheet.rowGap}
              onChange={(rowGap) => commit({ ...sheet, rowGap })}
            />
            <LayoutNumber
              title="列间距"
              min={0}
              max={40}
              value={sheet.colGap}
              onChange={(colGap) => commit({ ...sheet, colGap })}
            />
          </div>
        </NativeFold>
        <NativeFold title="实际输出比例与偏移">
          <label className="c-layout-select">
            输出方式
            <select
              aria-label="输出方式"
              value={sheet.fit}
              onChange={(e) =>
                commit({ ...sheet, fit: e.target.value as StatusCanvas['fit'] })
              }
            >
              <option value="manual">手动比例</option>
              <option value="width">适应宽度</option>
              <option value="contain">完整容纳</option>
            </select>
          </label>
          <div className="c-layout-fields">
            <LayoutNumber
              title="输出比例百分比"
              min={1}
              max={1000}
              value={Math.round(sheet.scale * 100)}
              onChange={(v) => commit({ ...sheet, scale: v / 100 })}
            />
            <LayoutNumber
              title="整体水平偏移"
              min={-1000}
              max={1000}
              value={sheet.x}
              onChange={(x) => commit({ ...sheet, x })}
            />
            <LayoutNumber
              title="整体垂直偏移"
              min={-1000}
              max={1000}
              value={sheet.y}
              onChange={(y) => commit({ ...sheet, y })}
            />
          </div>
          <p className="d-save-note">
            输出范围固定，超出的内容保留在工作表内；修改编辑缩放不会改变实际输出。
          </p>
        </NativeFold>
      </Card>
      <Card>
        <section
          id="canvas-cell-inspector"
          aria-label={'编辑单元格 ' + address}
        >
          <h3 className="d-inspector-title">单元格 {address}</h3>
          <label className="c-layout-select">
            内容
            <select
              aria-label="画布单元格内容"
              value={cell.content}
              onChange={(e) => patch({ content: e.target.value })}
            >
              <option value="">留白</option>
              {SHEET_CONTENT.map(([id, title]) => (
                <option key={id} value={id}>
                  {title}
                </option>
              ))}
            </select>
          </label>
          {cell.content === 'text' && (
            <label className="c-layout-select">
              文字
              <input
                aria-label="画布单元格文字"
                value={cell.text}
                onChange={(e) => patch({ text: e.target.value })}
              />
            </label>
          )}
          {cell.content === 'image' && (
            <label className="c-button c-upload">
              选择图片
              <input
                type="file"
                accept="image/png,image/jpeg,image/webp,image/gif"
                onChange={(e) => {
                  const file = e.target.files?.[0];
                  if (!file) return;
                  if (file.size > 200000) {
                    setError('原型单张图片请小于200 KB。');
                    return;
                  }
                  const reader = new FileReader();
                  reader.onload = () => {
                    if (typeof reader.result === 'string')
                      patch({ image: reader.result });
                  };
                  reader.readAsDataURL(file);
                }}
              />
            </label>
          )}
          <div className="c-layout-fields">
            <LayoutNumber
              title="移动到行"
              min={1}
              max={sheet.rows}
              value={cell.row + 1}
              onChange={(row) => {
                if (patch({ row: row - 1 }))
                  select({ row: row - 1, col: cell.col });
              }}
            />
            <LayoutNumber
              title="移动到列"
              min={1}
              max={sheet.cols}
              value={cell.col + 1}
              onChange={(col) => {
                if (patch({ col: col - 1 }))
                  select({ row: cell.row, col: col - 1 });
              }}
            />
            <LayoutNumber
              title="合并行数"
              min={1}
              max={sheet.rows - cell.row}
              value={cell.rowSpan}
              onChange={(rowSpan) => patch({ rowSpan })}
            />
            <LayoutNumber
              title="合并列数"
              min={1}
              max={sheet.cols - cell.col}
              value={cell.colSpan}
              onChange={(colSpan) => patch({ colSpan })}
            />
            <LayoutNumber
              title="内容尺寸"
              min={1}
              max={160}
              value={cell.size}
              onChange={(size) => patch({ size })}
            />
          </div>
          <NativeFold title="单元格留白、偏移与对齐">
            <div className="c-layout-fields">
              {(['paddingX', 'paddingY', 'offsetX', 'offsetY'] as const).map(
                (key, i) => (
                  <LayoutNumber
                    key={key}
                    title={
                      ['水平留白', '垂直留白', '格内水平偏移', '格内垂直偏移'][
                        i
                      ]
                    }
                    min={i < 2 ? 0 : -1000}
                    max={1000}
                    value={cell[key]}
                    onChange={(value) => patch({ [key]: value })}
                  />
                ),
              )}
            </div>
            <label className="c-layout-select">
              对齐
              <select
                aria-label="画布单元格对齐"
                value={cell.align}
                onChange={(e) =>
                  patch({ align: e.target.value as typeof cell.align })
                }
              >
                <option value="left">靠左</option>
                <option value="center">居中</option>
                <option value="right">靠右</option>
              </select>
            </label>
          </NativeFold>
          <Button
            secondary
            onClick={() =>
              commit({
                ...sheet,
                cells: sheet.cells.filter(
                  (c) => c.row !== cell.row || c.col !== cell.col,
                ),
              })
            }
          >
            清空本格
          </Button>
        </section>
      </Card>
    </>
  );
  return (
    <div
      className={full ? 'd-workspace d-workspace-full' : 'd-workspace'}
      style={{ '--canvas-zoom': zoom } as CSSProperties}
    >
      {fields}
    </div>
  );
}
