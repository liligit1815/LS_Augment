import assert from 'node:assert/strict';
import {
  SHEET_KEY,
  SHEET_CONTENT,
  SHEET_LIMITS,
  arrangeReadably,
  blankCell,
  minimumSize,
  readSheet,
  readabilityEditError,
  readabilityIssues,
  worseningReadability,
  seedSheet,
  sheetError,
  sheetWidth,
  resizedSheet,
  movedCell,
  updatedCell,
} from '../app/current-status-sheet-model.ts';
import { backupSettings, restoreSettings } from '../app/current-backup.ts';

const base = {
  version: 1,
  rows: 2,
  cols: 4,
  rowHeights: [22, 22],
  colWidths: [24, 24, 24, 24],
  rowGap: 2,
  colGap: 2,
  cells: [],
};
const merged = { ...blankCell(0, 0, 'clock'), colSpan: 2 };
const other = blankCell(1, 3, 'wifi');
const sheet = { ...base, cells: [merged, other] };
assert.equal(sheetError(sheet), '');
const shifted = movedCell(sheet, merged, 0, 1);
assert.equal(sheetError(shifted), '');
assert.equal(shifted.cells.length, 2);
const staleSource = { ...other };
const moved = movedCell(sheet, staleSource, 1, 2);
assert.equal(sheetError(moved), '');
assert.equal(moved.cells.length, 2);
assert.equal(moved.cells.find((c) => c.content === 'wifi').col, 2);
const swapped = movedCell(
  { ...base, cells: [blankCell(0, 0, 'wifi'), other] },
  other,
  0,
  0,
);
assert.equal(sheetError(swapped), '');
assert.deepEqual(swapped.cells.map((c) => [c.content, c.row, c.col]).sort(), [
  ['wifi', 0, 0],
  ['wifi', 1, 3],
]);
assert(sheetError(resizedSheet(sheet, 1, 4)));
assert.equal(
  sheet.cells.length,
  2,
  'rejected shrink must retain original content',
);
assert(
  sheetError(
    updatedCell(sheet, { ...blankCell(0, 1, 'text'), text: 'overlap' }),
  ),
);
for (const bad of [
  null,
  {},
  { ...sheet, rows: 7 },
  { ...sheet, cols: 21 },
  { ...sheet, colGap: NaN },
  { ...sheet, rowHeights: [0, 22] },
  { ...sheet, cells: [{ ...merged, size: Infinity }] },
  { ...sheet, cells: [{ ...merged, image: 'https://example.com/icon.png' }] },
])
  assert(sheetError(bad));
assert(readSheet({ [SHEET_KEY]: '{broken' }).error);
assert(readSheet({ [SHEET_KEY]: 'null' }).error);
const serialized = JSON.stringify(sheet);
assert.deepEqual(readSheet({ [SHEET_KEY]: serialized }).sheet, sheet);
const restored = restoreSettings(
  {},
  backupSettings({
    [SHEET_KEY]: serialized,
    'launcher:grid:rows': '12',
    'launcher:grid:columns': '9',
  }),
  {},
);
assert.equal(restored[SHEET_KEY], serialized);
assert.equal(restored['launcher:grid:columns'], '9');
const largeImage = 'data:image/png;base64,' + 'A'.repeat(260000);
assert(
  sheetError({
    ...base,
    cells: Array.from({ length: 6 }, (_, i) => ({
      ...blankCell(Math.floor(i / 4), i % 4, 'image'),
      image: largeImage,
    })),
  }),
);
for (const zone of Array.from({ length: 9 }, (_, i) => i)) {
  const values = {};
  SHEET_CONTENT.slice(0, 10).forEach(([id]) => {
    values[`status:${id}:on`] = '1';
    values[`status:${id}:zone`] = String(zone);
  });
  const migrated = seedSheet(values);
  assert.equal(sheetError(migrated), '', `migration for zone ${zone}`);
  assert.equal(migrated.cells.length, 10);
  assert.equal(new Set(migrated.cells.map((c) => c.content)).size, 10);
}

// Deliberately predictable extents isolate layout protection from browser fonts.
const measure = (cell) => ({
  width:
    cell.content === 'text'
      ? Math.max(1, cell.text.length) * cell.size * 0.6
      : cell.size,
  height: cell.content === 'network' ? cell.size * 2.4 : cell.size,
});
const grid = (rows, cols, cells = []) => ({
  ...base,
  rows,
  cols,
  rowHeights: Array(rows).fill(24),
  colWidths: Array(cols).fill(24),
  cells,
});
const issues = (value, values = {}, extent = measure) =>
  readabilityIssues(value, values, extent);
const reject = (before, after, kind, values = {}, extent = measure) => {
  assert.equal(sheetError(after), '', 'candidate must be structurally valid');
  assert(
    issues(after, values, extent).some((i) => i.kind === kind),
    kind,
  );
  assert(
    readabilityEditError(before, after, values, extent),
    `must reject newly introduced ${kind}`,
  );
};
assert.equal(SHEET_LIMITS.rows, 2);
assert.equal(SHEET_LIMITS.cols, 12);
const maximum = grid(
  2,
  12,
  Array.from({ length: 24 }, (_, i) =>
    blankCell(Math.floor(i / 12), i % 12, 'wifi'),
  ),
);
assert.deepEqual(issues(maximum), []);
reject(maximum, resizedSheet(maximum, 3, 12), 'count');
reject(maximum, resizedSheet(maximum, 2, 13), 'count');
const maximumSnapshot = structuredClone(maximum);
const packedMaximum = arrangeReadably(maximum, {}, measure);
assert(packedMaximum, '24 small icons must fit without shrinking');
assert.equal(packedMaximum.rows, 2);
assert.equal(packedMaximum.cols, 12);
assert.equal(packedMaximum.cells.length, 24);
assert(packedMaximum.cells.every((c) => c.size >= 14));
assert(sheetWidth(packedMaximum) <= SHEET_LIMITS.width);
assert.deepEqual(issues(packedMaximum), []);
assert.deepEqual(maximum, maximumSnapshot, 'reflow must not mutate its input');
const twentyFive = grid(
  3,
  12,
  Array.from({ length: 25 }, (_, i) =>
    blankCell(Math.floor(i / 12), i % 12, 'wifi'),
  ),
);
const tooManySnapshot = structuredClone(twentyFive);
assert.equal(arrangeReadably(twentyFive, {}, measure), null);
assert.deepEqual(
  twentyFive,
  tooManySnapshot,
  'failed reflow must retain every icon',
);

const simple = grid(2, 2, [blankCell(0, 0, 'wifi')]);
reject(simple, updatedCell(simple, { ...simple.cells[0], size: 13 }), 'size');
const textSheet = grid(2, 2, [
  { ...blankCell(0, 0, 'text'), text: 'OK', size: 12 },
]);
assert.deepEqual(issues(textSheet), []);
reject(
  textSheet,
  updatedCell(textSheet, { ...textSheet.cells[0], size: 11 }),
  'size',
);
const compositeValues = { ls_augment_statusbar_connectivity_group: '1' };
const composite = grid(2, 2, [{ ...blankCell(0, 0, 'battery'), size: 24 }]);
assert.equal(minimumSize(composite.cells[0], compositeValues), 24);
assert.deepEqual(issues(composite, compositeValues), []);
reject(
  composite,
  updatedCell(composite, { ...composite.cells[0], size: 23 }),
  'size',
  compositeValues,
);
reject(
  simple,
  updatedCell(simple, { ...simple.cells[0], size: 25 }),
  'overflow',
);
reject(
  simple,
  updatedCell(simple, { ...simple.cells[0], paddingX: 6 }),
  'overflow',
);
reject(
  simple,
  updatedCell(simple, { ...simple.cells[0], paddingY: 6 }),
  'overflow',
);
reject(
  simple,
  updatedCell(simple, { ...simple.cells[0], offsetX: 6 }),
  'overflow',
);
reject(
  simple,
  updatedCell(simple, { ...simple.cells[0], offsetY: -6 }),
  'overflow',
);
reject(
  maximum,
  { ...maximum, colWidths: maximum.colWidths.map((w, i) => (i ? w : w + 40)) },
  'width',
);
reject(maximum, { ...maximum, colGap: 5 }, 'width');
const shortRow = { ...simple, rowHeights: [12, 24] };
reject(simple, shortRow, 'overflow');

const image = 'data:image/png;base64,aGVsbG8=';
const legacy = grid(6, 20, [
  { ...blankCell(0, 0, 'wifi'), size: 8 },
  { ...blankCell(5, 19, 'image'), size: 9, image, text: 'saved image' },
]);
const legacySnapshot = structuredClone(legacy);
const savedLegacy = readSheet({ [SHEET_KEY]: JSON.stringify(legacy) }, measure);
assert.equal(savedLegacy.error, '');
assert.deepEqual(
  savedLegacy.sheet,
  legacy,
  'legacy dimensions, small sizes and images must survive loading',
);
assert(issues(legacy).some((i) => i.kind === 'count'));
assert(issues(legacy).some((i) => i.kind === 'size'));
const largerLegacyIcon = updatedCell(legacy, { ...legacy.cells[0], size: 10 });
assert.equal(
  readabilityEditError(legacy, largerLegacyIcon, {}, measure),
  '',
  'partial size repair is allowed while other legacy problems remain',
);
const narrowerLegacy = { ...largerLegacyIcon, colWidths: Array(20).fill(23) };
assert.equal(
  readabilityEditError(largerLegacyIcon, narrowerLegacy, {}, measure),
  '',
  'partial width repair is allowed',
);
assert(
  issues(narrowerLegacy).some((i) => i.kind === 'width'),
  'repair does not have to solve all issues in one edit',
);
const relocatedLegacy = movedCell(
  narrowerLegacy,
  narrowerLegacy.cells.find((c) => c.content === 'image'),
  1,
  11,
);
const reducedLegacy = resizedSheet(relocatedLegacy, 2, 12);
assert.equal(sheetError(reducedLegacy), '');
assert.equal(
  readabilityEditError(relocatedLegacy, reducedLegacy, {}, measure),
  '',
  'reduce legacy rows and columns without dropping content',
);
assert.equal(reducedLegacy.cells.length, 2);
assert.deepEqual(
  legacy,
  legacySnapshot,
  'loading and repairs must not mutate the saved source',
);

const customContent = grid(3, 4, [
  {
    ...blankCell(0, 0, 'image'),
    image,
    text: 'custom icon',
    size: 8,
    paddingX: 3,
    offsetY: 4,
  },
  {
    ...blankCell(1, 1, 'text'),
    text: 'Status',
    size: 10,
    align: 'right',
    offsetX: -2,
  },
  { ...blankCell(2, 0, 'network'), size: 12, colSpan: 2 },
]);
const customSnapshot = structuredClone(customContent);
const reflowed = arrangeReadably(customContent, {}, measure);
assert(reflowed);
assert.equal(sheetError(reflowed), '');
assert.deepEqual(issues(reflowed), []);
assert.equal(reflowed.cells.length, customContent.cells.length);
for (const original of customContent.cells) {
  const retained = reflowed.cells.find((c) => c.content === original.content);
  assert(retained);
  assert.equal(retained.text, original.text);
  assert.equal(retained.image, original.image);
  assert.equal(retained.align, original.align);
  assert(retained.size >= minimumSize(retained));
  assert.equal(
    retained.paddingX + retained.paddingY + retained.offsetX + retained.offsetY,
    0,
  );
}
assert.equal(
  reflowed.cells.find((c) => c.content === 'network').rowSpan,
  2,
  'tall content receives both rows',
);
assert.deepEqual(
  customContent,
  customSnapshot,
  'reflow preserves the source for undo',
);
assert.equal(
  arrangeReadably(customContent, {}, measure, 40),
  null,
  'insufficient width must fail instead of scaling content down',
);
// A hidden notification cannot donate its old overflow to a newly longer clock
// when undo restores the exact same old geometry under changed styles.
const oldOverflow = [
  { kind: 'overflow', amount: 39, address: 'B1', message: 'notifications' },
];
const newOverflow = [
  { kind: 'overflow', amount: 12, address: 'A1', message: 'clock' },
];
assert.equal(worseningReadability(oldOverflow, newOverflow, true), 'clock');
assert.equal(worseningReadability(oldOverflow, oldOverflow, true), '');
assert.equal(
  worseningReadability(oldOverflow, [{ ...oldOverflow[0], amount: 20 }], true),
  '',
);

console.log(
  'PASS: migration, movement, backup, finite grid and readable-size limits, spacing/overflow protection, legacy repair, and lossless reflow.',
);
