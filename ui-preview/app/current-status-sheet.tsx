/* eslint-disable react/react-compiler -- Local field drafts and asynchronous file reads use explicit synchronization. */
/* eslint-disable nextjs/no-img-element -- User-selected icons are local data URLs. */
'use client';
import { useEffect, useRef, useState } from 'react';
import {
  AlarmClock,
  BatteryFull,
  Bell,
  Bluetooth,
  Fan,
  Headphones,
  ShieldCheck,
  Signal,
  VolumeX,
  Wifi,
  ImagePlus,
} from 'lucide-react';
import { useModel } from './current-ui';
import { NativeFold } from './current-native-controls';
import { statusText, statusFont, statusExtent } from './current-status-content';
import { drawConnectivity } from './current-connectivity-preview';
import {
  SHEET_KEY,
  SHEET_CONTENT,
  SHEET_LIMITS,
  minimumSize,
  sheetWidth,
  readabilityIssues,
  readabilityEditError,
  worseningReadability,
  arrangeReadably,
  blankCell,
  cellAddress,
  cellAt,
  readSheet,
  resizedSheet,
  sheetError,
  updatedCell,
  movedCell,
  type SheetCell,
  type StatusSheet,
} from './current-status-sheet-model';
import './current-layout-editors.css';

export function LayoutNumber({
  title,
  value,
  min,
  max,
  onChange,
}: {
  title: string;
  value: number;
  min: number;
  max: number;
  onChange: (value: number) => void;
}) {
  const [draft, setDraft] = useState(String(value));
  useEffect(() => setDraft(String(value)), [value]);
  const commit = () => {
    const next = Number(draft);
    setDraft(String(value));
    if (draft.trim() && Number.isInteger(next) && next >= min && next <= max)
      onChange(next);
  };
  return (
    <label className="c-layout-number">
      <span>{title}</span>
      <input
        aria-label={title}
        type="number"
        min={min}
        max={max}
        step={1}
        value={draft}
        onChange={(e) => setDraft(e.target.value)}
        onBlur={commit}
        onKeyDown={(e) => {
          if (e.key === 'Enter') e.currentTarget.blur();
        }}
      />
    </label>
  );
}
const contentName = (id: string) =>
  SHEET_CONTENT.find(([value]) => value === id)?.[1] || '空白';
function useLoadedFonts() {
  const [, refresh] = useState(0);
  useEffect(() => {
    let live = true;
    void document.fonts.ready.then(() => {
      if (live) refresh(1);
    });
    return () => {
      live = false;
    };
  }, []);
}
function SheetConnectivity({ values }: { values: Record<string, string> }) {
  const canvas = useRef<HTMLCanvasElement>(null);
  useEffect(() => {
    const c = canvas.current?.getContext('2d');
    if (!c) return;
    c.clearRect(0, 0, 120, 120);
    drawConnectivity(c, 0, 0, 120, values);
  }, [values]);
  return (
    <canvas
      ref={canvas}
      width={120}
      height={120}
      style={{ width: '1em', height: '1em', flexShrink: 0 }}
      aria-label="三合一电池图标"
    />
  );
}
export function SheetContent({
  cell,
  values,
  miniature = false,
}: {
  cell: SheetCell;
  values: Record<string, string>;
  miniature?: boolean;
}) {
  const key = (s: string) => values['ls_augment_statusbar_' + s];
  const icons: Record<string, typeof Wifi> = {
    wifi: Wifi,
    mobile: Signal,
    bluetooth: Bluetooth,
    alarm: AlarmClock,
    mute: VolumeX,
    headphones: Headphones,
    vpn: ShieldCheck,
    fan: Fan,
  };
  const Icon = icons[cell.content];
  if (Icon) return <Icon size="1em" aria-hidden="true" />;
  if (cell.content === 'image')
    return cell.image ? (
      <img src={cell.image} alt={cell.text || '自定义图标'} draggable={false} />
    ) : (
      <ImagePlus size="1em" aria-hidden="true" />
    );
  const text = statusText(cell, values);
  if (text !== null) {
    const font = statusFont(cell, values);
    return (
      <span
        style={{
          whiteSpace: 'pre',
          lineHeight: 1.2,
          fontFamily: font.family,
          fontWeight: font.weight,
          letterSpacing: font.spacing + 'em',
        }}
      >
        {miniature && cell.content === 'clock' ? '14:48' : text}
      </span>
    );
  }
  if (cell.content === 'battery')
    return key('connectivity_group') === '1' ? (
      <SheetConnectivity values={values} />
    ) : (
      <BatteryFull size="1.4em" aria-hidden="true" />
    );
  if (cell.content === 'notifications') {
    if (key('notification_hide') === '1') return null;
    const count = miniature
      ? 2
      : Math.min(20, Math.max(1, Number(key('notification_max')) || 4));
    const perRow =
      key('notification_two_rows') === '1' ? Math.ceil(count / 2) : count;
    return (
      <span
        className="c-sheet-icon-group"
        style={{ gridTemplateColumns: `repeat(${perRow}, 1em)` }}
      >
        {Array.from({ length: count }, (_, i) => (
          <Bell key={i} size="1em" />
        ))}
      </span>
    );
  }
  if (cell.content === 'system_icons')
    return (
      <span
        className="c-sheet-icon-group"
        style={{
          gridTemplateColumns:
            key('system_two_rows') === '1' ? '1em' : 'repeat(2, 1em)',
        }}
      >
        <Wifi size="1em" />
        <Signal size="1em" />
      </span>
    );
  return null;
}

export function StatusSheetPreview({
  values,
  onSelect,
}: {
  values: Record<string, string>;
  onSelect: (row: number, col: number) => void;
}) {
  useLoadedFonts();
  const { sheet } = readSheet(values, (c) => statusExtent(c, values));
  const sum = (list: number[]) => list.reduce((a, b) => a + b, 0);
  const width = sum(sheet.colWidths) + (sheet.cols - 1) * sheet.colGap;
  const height = sum(sheet.rowHeights) + (sheet.rows - 1) * sheet.rowGap;
  const problems = readabilityIssues(sheet, values, (c) =>
    statusExtent(c, values),
  );
  return (
    <>
      <div
        className="c-sheet-preview"
        aria-label="表格状态栏实时预览"
        style={{ height: Math.min(132, Math.max(54, height + 12)) }}
      >
        <div
          className="c-sheet-preview-stage"
          style={{
            width: Math.max(SHEET_LIMITS.width, width),
            height,
          }}
        >
          {sheet.cells
            .filter((c) => c.content)
            .map((c) => {
              const w =
                sum(sheet.colWidths.slice(c.col, c.col + c.colSpan)) +
                (c.colSpan - 1) * sheet.colGap;
              const h =
                sum(sheet.rowHeights.slice(c.row, c.row + c.rowSpan)) +
                (c.rowSpan - 1) * sheet.rowGap;
              return (
                <button
                  key={cellAddress(c.row, c.col)}
                  className={
                    problems.some(
                      (p) => p.address === cellAddress(c.row, c.col),
                    )
                      ? 'has-readability-issue'
                      : ''
                  }
                  aria-label={
                    '编辑 ' +
                    cellAddress(c.row, c.col) +
                    ' ' +
                    contentName(c.content)
                  }
                  onClick={() => onSelect(c.row, c.col)}
                  style={{
                    left:
                      sum(sheet.colWidths.slice(0, c.col)) +
                      c.col * sheet.colGap,
                    top:
                      sum(sheet.rowHeights.slice(0, c.row)) +
                      c.row * sheet.rowGap,
                    width: w,
                    height: h,
                    padding: `${c.paddingY}px ${c.paddingX}px`,
                    justifyContent: {
                      left: 'flex-start',
                      center: 'center',
                      right: 'flex-end',
                    }[c.align],
                    fontSize: Math.max(c.size, minimumSize(c, values)),
                  }}
                >
                  <span
                    className="c-sheet-ink"
                    style={{
                      transform: `translate(${c.offsetX}px, ${c.offsetY}px)`,
                      textAlign: c.align,
                    }}
                  >
                    <SheetContent cell={c} values={values} />
                  </span>
                </button>
              );
            })}
        </div>
      </div>
      {!!problems.length && (
        <output className="c-readability-warning">
          布局需要调整 · {problems[0].message}
        </output>
      )}
    </>
  );
}

export function StatusSheetEditor({
  selection,
  onSelect,
}: {
  selection: { row: number; col: number };
  onSelect: (row: number, col: number) => void;
}) {
  useLoadedFonts();
  const m = useModel();
  const measure = (c: SheetCell) => statusExtent(c, m.values);
  const { sheet, error: savedError } = readSheet(m.values, measure);
  const problems = readabilityIssues(sheet, m.values, measure);
  const [error, setError] = useState('');
  const [undo, setUndo] = useState<
    { sheet: string; problems: ReturnType<typeof readabilityIssues> }[]
  >([]);
  const drag = useRef<SheetCell | null>(null);
  const clipboard = useRef<SheetCell | null>(null);
  const [copied, setCopied] = useState(false);
  const file = useRef<HTMLInputElement>(null);
  const table = useRef<HTMLTableElement>(null);
  const row = Math.min(selection.row, sheet.rows - 1),
    col = Math.min(selection.col, sheet.cols - 1);
  const cell = cellAt(sheet, row, col) || blankCell(row, col);
  const address = cellAddress(cell.row, cell.col);
  const latest = useRef(sheet);
  const latestValues = useRef(m.values);
  latestValues.current = m.values;
  const ownWrite = useRef(m.values[SHEET_KEY]);
  const savedSheet = m.values[SHEET_KEY];
  const uploadGeneration = useRef(0);
  useEffect(() => {
    if (ownWrite.current !== savedSheet) {
      setUndo([]);
      setError('');
      uploadGeneration.current++;
    }
    ownWrite.current = savedSheet;
  }, [savedSheet]);
  useEffect(
    () => () => {
      uploadGeneration.current++;
    },
    [],
  );
  latest.current = sheet;
  const commit = (next: StatusSheet) => {
    const problem =
      sheetError(next) || readabilityEditError(sheet, next, m.values, measure);
    if (problem) {
      setError(problem);
      return false;
    }
    setUndo((history) => [
      ...history.slice(-19),
      { sheet: JSON.stringify(sheet), problems },
    ]);
    uploadGeneration.current++;
    ownWrite.current = JSON.stringify(next);
    m.set(SHEET_KEY, ownWrite.current);
    setError('');
    return true;
  };
  const patch = (next: Partial<SheetCell>) => {
    const value = { ...cell, ...next };
    if (next.content)
      value.size = Math.max(value.size, minimumSize(value, m.values));
    return commit(updatedCell(sheet, value));
  };
  const select = (r: number, c: number, focus = false) => {
    const anchor = cellAt(sheet, r, c);
    const nextRow = anchor?.row ?? r,
      nextCol = anchor?.col ?? c;
    onSelect(nextRow, nextCol);
    if (focus)
      requestAnimationFrame(() =>
        table.current
          ?.querySelector<HTMLButtonElement>(
            `[data-cell="${cellAddress(nextRow, nextCol)}"]`,
          )
          ?.focus(),
      );
  };
  const resize = (rows: number, cols: number) => {
    if (commit(resizedSheet(sheet, rows, cols)))
      onSelect(Math.min(row, rows - 1), Math.min(col, cols - 1));
  };
  const move = (r: number, c: number) => {
    const source = sheet.cells.find(
      (x) => x.row === cell.row && x.col === cell.col,
    );
    if (!source) {
      select(r, c);
      return;
    }
    if (commit(movedCell(sheet, source, r, c))) onSelect(r, c);
  };
  const upload = async (chosen?: File) => {
    if (!chosen) return;
    if (
      !['image/png', 'image/jpeg', 'image/webp', 'image/gif'].includes(
        chosen.type,
      ) ||
      chosen.size > 200000
    ) {
      setError('请选择不超过 200 KB 的 PNG、JPG、WebP 或 GIF 图片。');
      return;
    }
    const anchor = { row: cell.row, col: cell.col };
    const generation = ++uploadGeneration.current;
    const reader = new FileReader();
    reader.onload = () => {
      if (generation !== uploadGeneration.current) return;
      if (typeof reader.result !== 'string') {
        setError('图片读取失败，请重新选择。');
        return;
      }
      const current = latest.current;
      const currentValues = latestValues.current;
      const target =
        cellAt(current, anchor.row, anchor.col) ||
        blankCell(anchor.row, anchor.col);
      const next = updatedCell(current, {
        ...target,
        content: 'image',
        size: Math.max(SHEET_LIMITS.minIcon, target.size),
        image: reader.result,
      });
      const problem =
        sheetError(next) ||
        readabilityEditError(current, next, currentValues, (c) =>
          statusExtent(c, currentValues),
        );
      if (problem) {
        setError(problem);
        return;
      }
      setUndo((history) => [
        ...history.slice(-19),
        {
          sheet: JSON.stringify(current),
          problems: readabilityIssues(current, currentValues, (c) =>
            statusExtent(c, currentValues),
          ),
        },
      ]);
      ownWrite.current = JSON.stringify(next);
      m.set(SHEET_KEY, ownWrite.current);
      setError('');
    };
    reader.onerror = () => setError('图片读取失败，请重新选择。');
    reader.readAsDataURL(chosen);
  };
  return (
    <div
      className="c-sheet-editor"
      data-native-path="prototype:status-sheet"
      data-ui-label="状态栏表格编辑"
    >
      <div className="c-sheet-heading">
        <strong>状态栏表格</strong>
        <span>
          {sheet.rows} 行 × {sheet.cols} 列
        </span>
      </div>
      <p className="c-layout-help">
        最多 2 排 × 12 列（24 格）。图标至少 14 dp，文字至少 12 dp，三合一至少
        24 dp；空间不足时不会自动缩小。
      </p>
      <p className="c-layout-help">
        已占宽度 {Math.ceil(sheetWidth(sheet))} / {SHEET_LIMITS.width} dp ·
        格数上限不代表能同时放下同样数量的内容。
      </p>
      <button
        className="c-button"
        onClick={() => {
          const next = arrangeReadably(sheet, m.values, measure);
          if (!next) {
            setError(
              '内容无法按清晰尺寸完整放入，请减少内容、缩短文字，或检查三合一内部偏移。',
            );
            return;
          }
          if (commit(next)) onSelect(0, 0);
        }}
      >
        按清晰尺寸重新整理
      </button>
      <p className="c-layout-help">
        重新整理会调整位置和行列、清除格内留白与偏移，保留内容和图片；可撤销。
      </p>
      <div className="c-layout-fields c-sheet-dimensions">
        <LayoutNumber
          title="表格行数"
          value={sheet.rows}
          min={1}
          max={SHEET_LIMITS.rows}
          onChange={(r) => resize(r, sheet.cols)}
        />
        <LayoutNumber
          title="表格列数"
          value={sheet.cols}
          min={2}
          max={SHEET_LIMITS.cols}
          onChange={(c) => resize(sheet.rows, c)}
        />
      </div>
      <div className="c-sheet-scroll">
        <table
          ref={table}
          className="c-sheet-table"
          aria-label="状态栏布局表格"
        >
          <colgroup>
            <col style={{ width: 30 }} />
            {sheet.colWidths.map((w, i) => (
              <col key={i} style={{ width: Math.max(56, w * 2) }} />
            ))}
          </colgroup>
          <thead>
            <tr>
              <th aria-label="行号" />
              {sheet.colWidths.map((_, i) => (
                <th scope="col" key={i}>
                  {String.fromCharCode(65 + i)}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {sheet.rowHeights.map((height, r) => (
              <tr key={r} style={{ height: Math.max(48, height * 1.5) }}>
                <th scope="row">{r + 1}</th>
                {sheet.colWidths.map((_, c) => {
                  const value = cellAt(sheet, r, c) || blankCell(r, c);
                  if (value.row !== r || value.col !== c) return null;
                  const active = cell.row === r && cell.col === c;
                  return (
                    <td
                      key={c}
                      rowSpan={value.rowSpan}
                      colSpan={value.colSpan}
                      className={active ? 'is-selected' : ''}
                    >
                      <button
                        type="button"
                        data-cell={cellAddress(r, c)}
                        aria-label={
                          cellAddress(r, c) + ' ' + contentName(value.content)
                        }
                        aria-pressed={active}
                        tabIndex={active ? 0 : -1}
                        draggable={!!value.content}
                        onDragStart={() => {
                          drag.current = value;
                        }}
                        onDragEnd={() => {
                          drag.current = null;
                        }}
                        onDragOver={(e) => e.preventDefault()}
                        onDrop={(e) => {
                          e.preventDefault();
                          const source = drag.current;
                          drag.current = null;
                          if (source && commit(movedCell(sheet, source, r, c)))
                            select(r, c);
                        }}
                        onClick={() => select(r, c)}
                        onKeyDown={(e) => {
                          const next =
                            e.key === 'ArrowRight'
                              ? [r, c + value.colSpan]
                              : e.key === 'ArrowLeft'
                                ? [r, c - 1]
                                : e.key === 'ArrowDown'
                                  ? [r + value.rowSpan, c]
                                  : e.key === 'ArrowUp'
                                    ? [r - 1, c]
                                    : null;
                          if (next) {
                            e.preventDefault();
                            select(
                              Math.max(0, Math.min(sheet.rows - 1, next[0])),
                              Math.max(0, Math.min(sheet.cols - 1, next[1])),
                              true,
                            );
                          }
                          if (e.key === 'Delete' || e.key === 'Backspace') {
                            e.preventDefault();
                            commit({
                              ...sheet,
                              cells: sheet.cells.filter(
                                (c) => c.row !== r || c.col !== value.col,
                              ),
                            });
                          }
                        }}
                      >
                        <span
                          className="c-sheet-glyph"
                          style={{
                            fontSize: Math.max(
                              15,
                              minimumSize(value, m.values),
                            ),
                          }}
                        >
                          <SheetContent
                            cell={value}
                            values={m.values}
                            miniature
                          />
                        </span>
                        <small>
                          {value.content ? contentName(value.content) : '+'}
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
      <div className="c-sheet-tools">
        <button
          disabled={!undo.length}
          onClick={() => {
            const previous = undo.at(-1)!;
            const issue = worseningReadability(
              previous.problems,
              readabilityIssues(
                JSON.parse(previous.sheet) as StatusSheet,
                m.values,
                measure,
              ),
              true,
            );
            if (issue) {
              setError('当前内容样式下无法撤销：' + issue);
              return;
            }
            uploadGeneration.current++;
            ownWrite.current = previous.sheet;
            m.set(SHEET_KEY, previous.sheet);
            setUndo(undo.slice(0, -1));
            setError('');
          }}
        >
          撤销
        </button>
        <button
          onClick={() => {
            clipboard.current = { ...cell };
            setCopied(true);
          }}
        >
          复制格子
        </button>
        <button
          disabled={!copied}
          onClick={() => {
            if (clipboard.current)
              commit(
                updatedCell(sheet, {
                  ...clipboard.current,
                  row: cell.row,
                  col: cell.col,
                }),
              );
          }}
        >
          粘贴
        </button>
        <button
          onClick={() =>
            commit({
              ...sheet,
              cells: sheet.cells.filter(
                (c) => c.row !== cell.row || c.col !== cell.col,
              ),
            })
          }
        >
          清空格子
        </button>
      </div>
      {(error || savedError) && (
        <p className="c-layout-error" role="alert">
          {error || savedError}
        </p>
      )}
      {!error && !savedError && problems.length > 0 && (
        <p className="c-layout-error">
          {problems.find((p) => p.address === address)?.message ||
            problems[0].message}
        </p>
      )}
      <section
        className="c-sheet-inspector"
        aria-label={'编辑单元格 ' + address}
      >
        <div className="c-sheet-heading">
          <strong>单元格 {address}</strong>
          <span>{contentName(cell.content)}</span>
        </div>
        <label className="c-layout-select">
          <span>填入内容</span>
          <select
            aria-label="单元格内容"
            value={cell.content}
            onChange={(e) => patch({ content: e.target.value })}
          >
            <option value="">空白 / 留白</option>
            {SHEET_CONTENT.map(([id, name]) => (
              <option key={id} value={id}>
                {name}
              </option>
            ))}
          </select>
        </label>
        {cell.content === 'text' && (
          <label className="c-layout-select">
            <span>文字或符号</span>
            <input
              aria-label="单元格文字"
              maxLength={60}
              value={cell.text}
              onChange={(e) => patch({ text: e.target.value })}
              placeholder="例如 ♥ 或自定义文字"
            />
          </label>
        )}
        {cell.content === 'image' && (
          <>
            <input
              ref={file}
              hidden
              type="file"
              accept="image/png,image/jpeg,image/webp,image/gif"
              onChange={(e) => {
                void upload(e.target.files?.[0]);
                e.target.value = '';
              }}
            />
            <button className="c-button" onClick={() => file.current?.click()}>
              {cell.image ? '更换图标图片' : '从本地选择图标'}
            </button>
            <p className="c-layout-help">
              PNG、JPG、WebP 或 GIF，最大 200 KB。
            </p>
          </>
        )}
        <div className="c-layout-fields" key={address}>
          <LayoutNumber
            title="所在行"
            value={cell.row + 1}
            min={1}
            max={sheet.rows}
            onChange={(r) => move(r - 1, cell.col)}
          />
          <LayoutNumber
            title="所在列"
            value={cell.col + 1}
            min={1}
            max={sheet.cols}
            onChange={(c) => move(cell.row, c - 1)}
          />
          <LayoutNumber
            title="跨行数"
            value={cell.rowSpan}
            min={1}
            max={sheet.rows - cell.row}
            onChange={(rowSpan) => patch({ rowSpan })}
          />
          <LayoutNumber
            title="跨列数"
            value={cell.colSpan}
            min={1}
            max={sheet.cols - cell.col}
            onChange={(colSpan) => patch({ colSpan })}
          />
          <LayoutNumber
            title="内容大小"
            value={cell.size}
            min={minimumSize(cell, m.values)}
            max={40}
            onChange={(size) => patch({ size })}
          />
          <label className="c-layout-select">
            <span>水平对齐</span>
            <select
              aria-label="单元格对齐"
              value={cell.align}
              onChange={(e) =>
                patch({ align: e.target.value as SheetCell['align'] })
              }
            >
              <option value="left">靠左</option>
              <option value="center">居中</option>
              <option value="right">靠右</option>
            </select>
          </label>
          <LayoutNumber
            title="左右内间距"
            value={cell.paddingX}
            min={0}
            max={24}
            onChange={(paddingX) => patch({ paddingX })}
          />
          <LayoutNumber
            title="上下内间距"
            value={cell.paddingY}
            min={0}
            max={24}
            onChange={(paddingY) => patch({ paddingY })}
          />
          <LayoutNumber
            title="水平偏移"
            value={cell.offsetX}
            min={-80}
            max={80}
            onChange={(offsetX) => patch({ offsetX })}
          />
          <LayoutNumber
            title="垂直偏移"
            value={cell.offsetY}
            min={-40}
            max={40}
            onChange={(offsetY) => patch({ offsetY })}
          />
        </div>
        <p className="c-layout-help">
          尺寸与间距按 dp 预览。偏移负数向左 / 上，正数向右 /
          下；放不下时会提示调整，不会缩小或裁切后直接保存。
        </p>
        <NativeFold title="行高、列宽与格子间距">
          <div className="c-layout-fields" key={address}>
            <LayoutNumber
              title={'第 ' + (cell.row + 1) + ' 行高度'}
              value={sheet.rowHeights[cell.row]}
              min={12}
              max={80}
              onChange={(h) =>
                commit({
                  ...sheet,
                  rowHeights: sheet.rowHeights.map((x, i) =>
                    i === cell.row ? h : x,
                  ),
                })
              }
            />
            <LayoutNumber
              title={String.fromCharCode(65 + cell.col) + ' 列宽度'}
              value={sheet.colWidths[cell.col]}
              min={12}
              max={160}
              onChange={(w) =>
                commit({
                  ...sheet,
                  colWidths: sheet.colWidths.map((x, i) =>
                    i === cell.col ? w : x,
                  ),
                })
              }
            />
            <LayoutNumber
              title="行间距"
              value={sheet.rowGap}
              min={0}
              max={20}
              onChange={(rowGap) => commit({ ...sheet, rowGap })}
            />
            <LayoutNumber
              title="列间距"
              value={sheet.colGap}
              min={0}
              max={20}
              onChange={(colGap) => commit({ ...sheet, colGap })}
            />
          </div>
        </NativeFold>
        {(cell.rowSpan > 1 || cell.colSpan > 1) && (
          <button
            className="c-button"
            onClick={() => patch({ rowSpan: 1, colSpan: 1 })}
          >
            拆分合并单元格
          </button>
        )}
      </section>
    </div>
  );
}
