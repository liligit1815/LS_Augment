import {
  seedSheet,
  type SheetCell,
  SHEET_KEY,
} from './current-status-sheet-model';
export const CANVAS_KEY = 'status:canvas:v2';
export type StatusCanvas = {
  rows: number;
  cols: number;
  rowHeight: number;
  colWidth: number;
  rowHeights: Record<string, number>;
  colWidths: Record<string, number>;
  rowGap: number;
  colGap: number;
  scale: number;
  x: number;
  y: number;
  fit: 'manual' | 'width' | 'contain';
  cells: SheetCell[];
};
export function canvasError(value: StatusCanvas): string {
  const integer = (n: number) =>
    Number.isInteger(n) && n >= 1 && n < 2147483647;
  if (!value || !integer(value.rows) || !integer(value.cols))
    return '行数和列数须为正整数。';
  if (
    ![value.rowHeight, value.colWidth, value.scale].every(
      (n) => Number.isFinite(n) && n > 0,
    )
  )
    return '尺寸和输出比例须大于 0。';
  if (
    ![value.x, value.y, value.rowGap, value.colGap].every(Number.isFinite) ||
    value.rowGap < 0 ||
    value.colGap < 0
  )
    return '偏移或间距无效。';
  if (
    !['manual', 'width', 'contain'].includes(value.fit) ||
    !Array.isArray(value.cells)
  )
    return '输出方式或单元格数据无效。';
  for (const [tracks, count] of [
    [value.rowHeights, value.rows],
    [value.colWidths, value.cols],
  ] as const) {
    if (
      !tracks ||
      Object.entries(tracks).some(
        ([index, size]) =>
          !Number.isInteger(+index) ||
          +index < 0 ||
          +index >= count ||
          !Number.isFinite(size) ||
          size <= 0,
      )
    )
      return '独立行高或列宽无效。';
  }
  for (let i = 0; i < value.cells.length; i++) {
    const cell = value.cells[i];
    if (
      ![cell.row, cell.col].every((n) => Number.isInteger(n) && n >= 0) ||
      !integer(cell.rowSpan) ||
      !integer(cell.colSpan) ||
      cell.row + cell.rowSpan > value.rows ||
      cell.col + cell.colSpan > value.cols
    )
      return '单元格超出新范围，请先移动或清空。';
    if (!Number.isFinite(cell.size) || cell.size <= 0)
      return '内容尺寸须大于 0。';
    for (const other of value.cells.slice(0, i)) {
      if (
        cell.row < other.row + other.rowSpan &&
        cell.row + cell.rowSpan > other.row &&
        cell.col < other.col + other.colSpan &&
        cell.col + cell.colSpan > other.col
      )
        return '合并范围与已有内容重叠，请先移动或清空。';
    }
  }
  return '';
}
export function readCanvas(values: Record<string, string>): StatusCanvas {
  try {
    const parsed = JSON.parse(values[CANVAS_KEY]);
    if (!canvasError(parsed)) return parsed;
  } catch {
    /* Seed from the saved legacy layout below. */
  }
  let legacy = seedSheet(values);
  try {
    const parsed = JSON.parse(values[SHEET_KEY]);
    if (parsed?.version === 1 && Array.isArray(parsed.cells)) legacy = parsed;
  } catch {
    /* No legacy sheet. */
  }
  return {
    rows: legacy.rows,
    cols: legacy.cols,
    rowHeight: 22,
    colWidth: 24,
    rowHeights: Object.fromEntries(
      legacy.rowHeights.map((height, row) => [row, height]),
    ),
    colWidths: Object.fromEntries(
      legacy.colWidths.map((width, col) => [col, width]),
    ),
    rowGap: legacy.rowGap,
    colGap: legacy.colGap,
    scale: 1,
    x: 0,
    y: 0,
    fit: 'manual',
    cells: legacy.cells,
  };
}
export const trackSize = (sheet: StatusCanvas, row: boolean, index: number) =>
  (row ? sheet.rowHeights : sheet.colWidths)[index] ??
  (row ? sheet.rowHeight : sheet.colWidth);
export function trackStart(sheet: StatusCanvas, row: boolean, index: number) {
  const fallback = row ? sheet.rowHeight : sheet.colWidth,
    gap = row ? sheet.rowGap : sheet.colGap;
  return (
    index * (fallback + gap) +
    Object.entries(row ? sheet.rowHeights : sheet.colWidths).reduce(
      (n, [i, size]) => (+i < index ? n + size - fallback : n),
      0,
    )
  );
}
export function canvasDimensions(sheet: StatusCanvas) {
  return {
    width: trackStart(sheet, false, sheet.cols) - sheet.colGap,
    height: trackStart(sheet, true, sheet.rows) - sheet.rowGap,
  };
}
export function canvasScale(sheet: StatusCanvas, width = 336, height = 48) {
  const size = canvasDimensions(sheet);
  return sheet.fit === 'width'
    ? width / size.width
    : sheet.fit === 'contain'
      ? Math.min(width / size.width, height / size.height)
      : sheet.scale;
}
export function putCanvasCell(
  sheet: StatusCanvas,
  cell: SheetCell,
  old?: SheetCell,
): StatusCanvas {
  return {
    ...sheet,
    cells: [
      ...sheet.cells.filter(
        (c) => c.row !== (old || cell).row || c.col !== (old || cell).col,
      ),
      cell,
    ],
  };
}
export function columnName(col: number) {
  let result = '',
    value = col + 1;
  while (value > 0) {
    value--;
    result = String.fromCharCode(65 + (value % 26)) + result;
    value = Math.floor(value / 26);
  }
  return result;
}
