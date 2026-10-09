/** Browser prototype format; deliberately independent of Android's fixed SG2 zones. */
export const SHEET_KEY = 'status:sheet:v1';
export const SHEET_MODE = 'status:layout-mode';
export const SHEET_LIMITS = {
  rows: 2,
  cols: 12,
  width: 336,
  minIcon: 14,
  minText: 12,
  minComposite: 24,
} as const;
export const SHEET_CONTENT = [
  ['clock', '时钟'],
  ['notifications', '通知图标'],
  ['system_icons', '系统图标组'],
  ['battery', '电池 / 三合一'],
  ['cpu', 'CPU 温度'],
  ['gpu', 'GPU 温度'],
  ['battery_temp', '电池温度'],
  ['current', '电流'],
  ['power', '功率'],
  ['network', '网速'],
  ['wifi', 'Wi-Fi'],
  ['mobile', '移动信号'],
  ['bluetooth', '蓝牙'],
  ['alarm', '闹钟'],
  ['mute', '静音'],
  ['headphones', '耳机'],
  ['vpn', 'VPN'],
  ['fan', '风扇'],
  ['text', '自定义文字 / 符号'],
  ['image', '自定义图片'],
] as const;
export type SheetCell = {
  row: number;
  col: number;
  rowSpan: number;
  colSpan: number;
  content: string;
  size: number;
  paddingX: number;
  paddingY: number;
  offsetX: number;
  offsetY: number;
  align: 'left' | 'center' | 'right';
  text: string;
  image: string;
};
export type StatusSheet = {
  version: 1;
  rows: number;
  cols: number;
  rowHeights: number[];
  colWidths: number[];
  rowGap: number;
  colGap: number;
  cells: SheetCell[];
};
export const cellAddress = (row: number, col: number) =>
  String.fromCharCode(65 + col) + (row + 1);
export const sheetEnabled = (values: Record<string, string>) =>
  values[SHEET_MODE] !== 'regions';
export const blankCell = (
  row: number,
  col: number,
  content = '',
): SheetCell => ({
  row,
  col,
  rowSpan: 1,
  colSpan: 1,
  content,
  size: 14,
  paddingX: 0,
  paddingY: 0,
  offsetX: 0,
  offsetY: 0,
  align: 'center',
  text: '',
  image: '',
});
export function minimumSize(
  cell: SheetCell,
  values: Record<string, string> = {},
) {
  if (
    cell.content === 'battery' &&
    values.ls_augment_statusbar_connectivity_group === '1'
  )
    return SHEET_LIMITS.minComposite;
  return [
    'clock',
    'cpu',
    'gpu',
    'battery_temp',
    'current',
    'power',
    'network',
    'text',
  ].includes(cell.content)
    ? SHEET_LIMITS.minText
    : SHEET_LIMITS.minIcon;
}
export type CellExtent = {
  width: number;
  height: number;
  artworkOverflow?: number;
};
export type MeasureCell = (cell: SheetCell) => CellExtent;
export const sheetWidth = (sheet: StatusSheet) =>
  sheet.colWidths.reduce((a, b) => a + b, 0) + (sheet.cols - 1) * sheet.colGap;
export function cellBox(sheet: StatusSheet, cell: SheetCell) {
  return {
    width:
      sheet.colWidths
        .slice(cell.col, cell.col + cell.colSpan)
        .reduce((a, b) => a + b, 0) +
      (cell.colSpan - 1) * sheet.colGap,
    height:
      sheet.rowHeights
        .slice(cell.row, cell.row + cell.rowSpan)
        .reduce((a, b) => a + b, 0) +
      (cell.rowSpan - 1) * sheet.rowGap,
  };
}
export function readabilityIssues(
  sheet: StatusSheet,
  values: Record<string, string>,
  measure: MeasureCell,
  availableWidth = SHEET_LIMITS.width,
) {
  const issues: {
    kind: string;
    amount: number;
    message: string;
    address?: string;
  }[] = [];
  if (sheet.rows > SHEET_LIMITS.rows || sheet.cols > SHEET_LIMITS.cols)
    issues.push({
      kind: 'count',
      amount: Math.max(0, sheet.rows - 2) + Math.max(0, sheet.cols - 12),
      message:
        '最多 2 排、12 列，共 24 格。旧表格已保留，请减少行列或重新整理。',
    });
  if (sheetWidth(sheet) > availableWidth + 0.1)
    issues.push({
      kind: 'width',
      amount: sheetWidth(sheet) - availableWidth,
      message: `布局宽度超过可用的 ${Math.floor(availableWidth)} dp，请减少列宽、间距或内容。`,
    });
  for (const cell of sheet.cells.filter((c) => c.content)) {
    const address = cellAddress(cell.row, cell.col);
    const min = minimumSize(cell, values);
    if (cell.size < min)
      issues.push({
        kind: 'size',
        amount: min - cell.size,
        address,
        message: `${address} 内容太小，至少需要 ${min} dp。`,
      });
    const box = cellBox(sheet, cell),
      ink = measure({ ...cell, size: Math.max(min, cell.size) });
    if ((ink.artworkOverflow || 0) > 0.5)
      issues.push({
        kind: 'artwork',
        amount: ink.artworkOverflow!,
        address,
        message: `${address} 三合一内部图标超出圆形组件，请减小内部偏移或缩放。`,
      });
    const innerWidth = box.width - cell.paddingX * 2,
      innerHeight = box.height - cell.paddingY * 2;
    const x =
      (cell.align === 'left'
        ? 0
        : cell.align === 'right'
          ? innerWidth - ink.width
          : (innerWidth - ink.width) / 2) + cell.offsetX;
    const y = (innerHeight - ink.height) / 2 + cell.offsetY;
    const horizontal =
      Math.max(0, -x) + Math.max(0, x + ink.width - innerWidth);
    const vertical =
      Math.max(0, -y) + Math.max(0, y + ink.height - innerHeight);
    if (horizontal + vertical > 0.5)
      issues.push({
        kind: 'overflow',
        amount: horizontal + vertical,
        address,
        message: `${address} 内容放不下：请扩大或合并格子，减小间距或偏移，或减少内容。`,
      });
  }
  return issues;
}
export function readabilityEditError(
  before: StatusSheet,
  after: StatusSheet,
  values: Record<string, string>,
  measure: MeasureCell,
  availableWidth = SHEET_LIMITS.width,
) {
  const oldIssues = readabilityIssues(before, values, measure, availableWidth);
  const newIssues = readabilityIssues(after, values, measure, availableWidth);
  return worseningReadability(oldIssues, newIssues);
}
export function worseningReadability(
  oldIssues: ReturnType<typeof readabilityIssues>,
  newIssues: ReturnType<typeof readabilityIssues>,
  sameCells = false,
) {
  // Style edits and undo compare the same geometry: one cell's old overflow
  // must not give another cell permission to develop a new problem.
  if (sameCells) {
    for (const issue of newIssues) {
      const previous = oldIssues
        .filter(
          (old) => old.kind === issue.kind && old.address === issue.address,
        )
        .reduce((sum, old) => sum + old.amount, 0);
      if (issue.amount > previous + 0.1) return issue.message;
    }
    return '';
  }
  // An old layout may be repaired in steps; newly introduced or worsened problems are rejected.
  for (const kind of ['count', 'width', 'size', 'overflow', 'artwork']) {
    const sum = (list: typeof newIssues) =>
      list.filter((i) => i.kind === kind).reduce((n, i) => n + i.amount, 0);
    if (sum(newIssues) > sum(oldIssues) + 0.1)
      return newIssues.find((i) => i.kind === kind)!.message;
  }
  return '';
}
export function arrangeReadably(
  sheet: StatusSheet,
  values: Record<string, string>,
  measure: MeasureCell,
  availableWidth = SHEET_LIMITS.width,
): StatusSheet | null {
  const content = sheet.cells
    .filter((c) => c.content)
    .map((c) => ({
      ...c,
      size: Math.max(c.size, minimumSize(c, values)),
      paddingX: 0,
      paddingY: 0,
      offsetX: 0,
      offsetY: 0,
      rowSpan: 1,
      colSpan: 1,
    }));
  if (content.length > 24) return null;
  const tall: SheetCell[] = [],
    short: SheetCell[] = [];
  for (const c of content) (measure(c).height > 24 ? tall : short).push(c);
  short.sort((a, b) => measure(b).width - measure(a).width);
  const columns: SheetCell[][] = tall.map((c) => [{ ...c, rowSpan: 2 }]);
  for (let i = 0; i < short.length; i += 2) columns.push(short.slice(i, i + 2));
  if (columns.length > SHEET_LIMITS.cols) return null;
  while (columns.length < 2) columns.push([]);
  const rowHeight = Math.max(
    24,
    ...tall.map((c) => Math.ceil((measure(c).height + 4) / 2)),
  );
  const result: StatusSheet = {
    version: 1,
    rows: 2,
    cols: columns.length,
    rowHeights: [rowHeight, rowHeight],
    colWidths: columns.map((list) =>
      Math.max(24, ...list.map((c) => Math.ceil(measure(c).width + 4))),
    ),
    rowGap: 2,
    colGap: 2,
    cells: columns.flatMap((list, col) =>
      list.map((c, row) => ({ ...c, row, col })),
    ),
  };
  return !sheetError(result) &&
    !readabilityIssues(result, values, measure, availableWidth).length
    ? result
    : null;
}
const within = (v: unknown, min: number, max: number) =>
  typeof v === 'number' && Number.isFinite(v) && v >= min && v <= max;
const integer = (v: unknown, min: number, max: number) =>
  within(v, min, max) && Number.isInteger(v);
export function covers(c: SheetCell, row: number, col: number) {
  return (
    row >= c.row &&
    row < c.row + c.rowSpan &&
    col >= c.col &&
    col < c.col + c.colSpan
  );
}
export function cellAt(sheet: StatusSheet, row: number, col: number) {
  return sheet.cells.find((c) => covers(c, row, col));
}
export function sheetError(sheet: StatusSheet): string {
  if (
    !sheet ||
    sheet.version !== 1 ||
    !integer(sheet.rows, 1, 6) ||
    !integer(sheet.cols, 2, 20)
  )
    return '表格支持 1–6 行、2–20 列。';
  if (
    !Array.isArray(sheet.rowHeights) ||
    sheet.rowHeights.length !== sheet.rows ||
    !sheet.rowHeights.every((x) => within(x, 12, 80)) ||
    !Array.isArray(sheet.colWidths) ||
    sheet.colWidths.length !== sheet.cols ||
    !sheet.colWidths.every((x) => within(x, 12, 160)) ||
    !within(sheet.rowGap, 0, 20) ||
    !within(sheet.colGap, 0, 20)
  )
    return '请检查行高、列宽和间距。';
  if (!Array.isArray(sheet.cells) || sheet.cells.length > 120)
    return '单元格数据无效。';
  const occupied = new Set<string>();
  let imageBytes = 0;
  for (const c of sheet.cells) {
    if (
      !c ||
      !integer(c.row, 0, sheet.rows - 1) ||
      !integer(c.col, 0, sheet.cols - 1) ||
      !integer(c.rowSpan, 1, sheet.rows - c.row) ||
      !integer(c.colSpan, 1, sheet.cols - c.col)
    )
      return '调整后有单元格超出表格，请先移动或清空这些格子。';
    if (
      !['', ...SHEET_CONTENT.map(([id]) => id)].includes(c.content) ||
      !within(c.size, 6, 40) ||
      !within(c.paddingX, 0, 24) ||
      !within(c.paddingY, 0, 24) ||
      !within(c.offsetX, -80, 80) ||
      !within(c.offsetY, -40, 40) ||
      !['left', 'center', 'right'].includes(c.align) ||
      typeof c.text !== 'string' ||
      c.text.length > 60 ||
      typeof c.image !== 'string' ||
      c.image.length > 300000 ||
      (c.image !== '' &&
        !/^data:image\/(png|jpeg|webp|gif);base64,[A-Za-z0-9+/=]+$/.test(
          c.image,
        ))
    )
      return '单元格内容或位置参数无效。';
    imageBytes += c.image.length;
    if (imageBytes > 1500000)
      return '表格图片总量过大，请减少图片格子或使用更小的图片后再保存。';
    for (let r = c.row; r < c.row + c.rowSpan; r++)
      for (let col = c.col; col < c.col + c.colSpan; col++) {
        const address = cellAddress(r, col);
        if (occupied.has(address))
          return '合并范围内有其他单元格，请先移动或清空。';
        occupied.add(address);
      }
  }
  return '';
}
export function seedSheet(
  values: Record<string, string>,
  measure?: MeasureCell,
): StatusSheet {
  const sheet: StatusSheet = {
    version: 1,
    rows: 2,
    cols: 12,
    rowHeights: [22, 22],
    colWidths: Array(12).fill(24),
    rowGap: 2,
    colGap: 2,
    cells: [],
  };
  const zones = [2, 2, 8, 8, 1, 1, 4, 7, 7, 5];
  const components = SHEET_CONTENT.slice(0, 10)
    .map(([id], i) => ({
      id,
      index: i,
      zone: Number(values['status:' + id + ':zone'] ?? zones[i]),
      order: Number(values['status:' + id + ':order'] ?? i),
    }))
    .filter(
      ({ id, index }) =>
        (values['status:' + id + ':on'] ?? (index < 4 ? '1' : '0')) === '1',
    )
    .sort((a, b) => a.order - b.order);
  for (const { id, index, zone } of components) {
    const c = blankCell(
      zone % 3 === 1 ? 1 : 0,
      Math.min(8, Math.max(0, Math.floor(zone / 3) * 4)),
      id,
    );
    c.rowSpan = zone % 3 === 2 ? 2 : 1;
    const size = Number(
      values['status:' + id + ':size'] ?? (index < 4 ? 13 : 9),
    );
    c.size = Number.isFinite(size) ? Math.min(40, Math.max(6, size)) : 13;
    if (id === 'clock') c.colSpan = 2;
    const fits = () =>
      !sheet.cells.some(
        (other) =>
          other.row < c.row + c.rowSpan &&
          other.row + other.rowSpan > c.row &&
          other.col < c.col + c.colSpan &&
          other.col + other.colSpan > c.col,
      );
    let placed = false;
    const preferred = c.col;
    for (let step = 0; step < sheet.cols; step++) {
      c.col = (preferred + step) % sheet.cols;
      if (c.col + c.colSpan <= sheet.cols && fits()) {
        placed = true;
        break;
      }
    }
    // Retain every enabled component, even if all ten were assigned to one old zone.
    if (!placed) {
      c.rowSpan = 1;
      c.colSpan = 1;
      for (let n = 0; n < sheet.rows * sheet.cols; n++) {
        c.row = Math.floor(n / sheet.cols);
        c.col = n % sheet.cols;
        if (fits()) break;
      }
    }
    sheet.cells.push(c);
  }
  for (const c of sheet.cells) {
    const desired =
      c.content === 'clock'
        ? 92
        : c.content === 'current'
          ? 44
          : c.content === 'battery'
            ? 34
            : c.content === 'network'
              ? 32
              : 28;
    for (let col = c.col; col < c.col + c.colSpan; col++)
      sheet.colWidths[col] = Math.max(
        sheet.colWidths[col],
        Math.ceil(desired / c.colSpan),
      );
    if (
      c.content === 'battery' &&
      values['ls_augment_statusbar_connectivity_group'] === '1'
    ) {
      const size = Number(
        values['ls_augment_statusbar_connectivity_size_dp'] || 26,
      );
      c.size = Number.isFinite(size) ? Math.max(6, Math.min(40, size)) : 26;
    }
  }
  const estimate: MeasureCell =
    measure ||
    ((c) => {
      const s = c.size;
      if (c.content === 'clock')
        return {
          width:
            values.ls_augment_statusbar_clock_custom === '1' ? 94 : s * 3.1,
          height:
            s * 1.2 * (values.ls_augment_statusbar_clock_rows === '2' ? 2 : 1),
        };
      if (c.content === 'network') return { width: s * 2.6, height: s * 2.4 };
      if (c.content === 'notifications') return { width: s * 4 + 3, height: s };
      if (c.content === 'system_icons') return { width: s * 2 + 1, height: s };
      if (c.content === 'battery') return { width: s, height: s };
      const widths: Record<string, number> = {
        cpu: 1.9,
        gpu: 1.9,
        battery_temp: 3.1,
        current: 3.1,
        power: 2.5,
      };
      return { width: s * (widths[c.content] || 1), height: s * 1.2 };
    });
  return arrangeReadably(sheet, values, estimate) || sheet;
}
export function readSheet(
  values: Record<string, string>,
  measure?: MeasureCell,
): {
  sheet: StatusSheet;
  error: string;
} {
  const raw = values[SHEET_KEY];
  if (raw) {
    try {
      const sheet = JSON.parse(raw) as StatusSheet;
      const error = sheetError(sheet);
      if (!error) return { sheet, error: '' };
    } catch {
      /* Keep malformed saved data untouched until the user chooses to edit. */
    }
    return {
      sheet: seedSheet(values, measure),
      error: '保存的表格无法读取，正在显示原区域配置；再次编辑会保存新表格。',
    };
  }
  return { sheet: seedSheet(values, measure), error: '' };
}
export function resizedSheet(
  sheet: StatusSheet,
  rows: number,
  cols: number,
): StatusSheet {
  return {
    ...sheet,
    rows,
    cols,
    rowHeights: Array.from(
      { length: rows },
      (_, i) => sheet.rowHeights[i] ?? 22,
    ),
    colWidths: Array.from({ length: cols }, (_, i) => sheet.colWidths[i] ?? 24),
  };
}
export function updatedCell(sheet: StatusSheet, cell: SheetCell): StatusSheet {
  return {
    ...sheet,
    cells: [
      ...sheet.cells.filter((c) => c.row !== cell.row || c.col !== cell.col),
      cell,
    ],
  };
}
export function movedCell(
  sheet: StatusSheet,
  source: SheetCell,
  row: number,
  col: number,
): StatusSheet {
  if (row === source.row && col === source.col) return sheet;
  const current = sheet.cells.find(
    (c) => c.row === source.row && c.col === source.col,
  );
  if (!current) return sheet;
  const hit = cellAt(sheet, row, col);
  const target = hit === current ? undefined : hit;
  const cells = sheet.cells.filter((c) => c !== current && c !== target);
  if (target) cells.push({ ...target, row: source.row, col: source.col });
  cells.push({ ...current, row, col });
  return { ...sheet, cells };
}
