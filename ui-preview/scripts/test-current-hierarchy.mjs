import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import ts from 'typescript';
const cache = new Map();
function load(file) {
  file = path.resolve(file);
  if (file.endsWith('.json')) return JSON.parse(fs.readFileSync(file, 'utf8'));
  if (cache.has(file)) return cache.get(file);
  const mod = { exports: {} };
  cache.set(file, mod.exports);
  const source = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      target: ts.ScriptTarget.ES2022,
      esModuleInterop: true,
    },
  }).outputText;
  vm.runInNewContext(source, {
    module: mod,
    exports: mod.exports,
    Set,
    Map,
    JSON,
    Number,
    Math,
    Array,
    Object,
    require: (name) =>
      load(
        path.resolve(
          path.dirname(file),
          name + (path.extname(name) ? '' : '.ts'),
        ),
      ),
  });
  return mod.exports;
}
const hierarchy = load('app/current-hierarchy.ts'),
  { navigationTargets } = load('app/current-navigation.ts');
assert.equal(navigationTargets.find(target => target.id === 'systemui').title, '通知与控制中心');
assert.equal(navigationTargets.find(target => target.id === 'theme').title, '主题与锁屏');
const notificationSections = hierarchy.applicationSections(navigationTargets.find(target => target.id === 'systemui'));
const themeSections = hierarchy.applicationSections(navigationTargets.find(target => target.id === 'theme'));
assert.equal(notificationSections.find(section => section.id === 'statusbar').title, '状态栏自定义');
assert(!notificationSections.some(section => ['lockscreen', 'aod'].includes(section.id)));
assert.equal(themeSections.find(section => section.id === 'theme').title, '主题下载与使用');
assert.equal(themeSections.find(section => section.id === 'collab_theme').title, '联名主题');
for (const id of ['lockscreen', 'aod']) {
  assert(themeSections.some(section => section.id === id));
  assert.equal(hierarchy.resolveDestination('group/systemui/' + id), 'group/theme/' + id);
  assert.equal(hierarchy.canonicalParent('group/systemui/' + id), 'target-theme');
}
const source = load('app/current-feature-groups.json');
const routes = [
  'status_canvas',
  'status_assets',
  'asset/wifi',
  'extra_dim',
  'support',
  'contributors',
  'scope',
  'rapid_compatibility',
];
const reachable = [];
for (const target of navigationTargets) {
  routes.push('target-' + target.id);
  for (const section of hierarchy.applicationSections(target)) {
    const route = hierarchy.groupRoute(target.id, section.id);
    routes.push(route, ...section.entries);
    assert.equal(hierarchy.resolveGroup(route)?.section.id, section.id);
    const destination = hierarchy.sectionDestination(target, section);
    assert.equal(hierarchy.resolveDestination(destination), destination,
      section.title + ' must land on visible content without another single-child page');
    assert.equal(hierarchy.singleChildRoute(destination), undefined,
      section.title + ' must not expose a redundant grouping page');
    for (const editor of section.entries)
      assert.equal(hierarchy.singleChildRoute(hierarchy.canonicalParent(editor)), undefined,
        editor + ' must return to a visible parent');
    reachable.push(...hierarchy.sectionSettingKeys(section));
  }
}
// StatusBar's 29 source features belong to its six dedicated editor tabs.
const status = source.targets
  .find((t) => t.id === 'systemui')
  .sections.find((s) => s.id === 'statusbar');
reachable.push(...hierarchy.sectionSettingKeys({ ...status, entries: [] }));
const expected = navigationTargets.flatMap((t) =>
  t.sections.flatMap((s) => s.options.map((o) => o.key)),
);
assert.equal(expected.length, 250);
assert.equal(new Set(reachable).size, expected.length);
assert.equal(
  reachable.length,
  new Set(reachable).size,
  'source settings cannot be duplicated or dropped by grouping',
);
for (const key of expected)
  assert(reachable.includes(key), key + ' lost from the page hierarchy');
assert.equal(hierarchy.resolveGroup('group/systemui/missing'), undefined);
assert.equal(
  hierarchy.resolveGroup('group/systemui/quicksettings/extra'),
  undefined,
);
for (const route of routes) {
  const visited = new Set();
  let next = route;
  while (!['home', 'settings', 'about'].includes(next)) {
    assert(!visited.has(next), 'navigation loop at ' + next);
    visited.add(next);
    next = hierarchy.canonicalParent(next);
  }
}
assert.equal(hierarchy.canonicalParent('status_canvas'), 'status_layout');
assert.equal(hierarchy.canonicalParent('asset/wifi'), 'status_assets');
assert.equal(hierarchy.resolveDestination('group/system/freeform'), 'freeform');
assert.equal(hierarchy.resolveDestination('target-ai_trigger'), 'ai_trigger');
assert.equal(hierarchy.canonicalParent('freeform'), 'target-system');
assert.equal(hierarchy.canonicalParent('ai_trigger'), 'home');
assert.equal(hierarchy.navigationLevel('freeform'), 3);
assert.equal(hierarchy.navigationLevel('ai_trigger'), 2);
assert.equal(hierarchy.resolveDestination('target-system'), 'target-system');
assert.equal(hierarchy.resolveDestination('target-game'), 'target-game');
assert.equal(hierarchy.canonicalParent('target-game'), 'home');
const game = navigationTargets.find((target) => target.id === 'game');
assert.equal(hierarchy.resolveDestination('rapid_compatibility'), 'rapid_compatibility');
assert.equal(hierarchy.canonicalParent('rapid_compatibility'), 'group/game/shoulder');
assert.equal(hierarchy.navigationLevel('rapid_compatibility'), 4);
const gameSections = hierarchy.applicationSections(game);
assert.equal(gameSections.map((section) => section.id).join(','), 'shoulder,combo,performance,plugins,game_capture');
for (const section of gameSections) {
  const route = hierarchy.groupRoute('game', section.id);
  assert.equal(hierarchy.sectionDestination(game, section), route, section.title + ' must keep its own third-level page');
  assert.equal(hierarchy.resolveDestination(route), route);
  assert.equal(hierarchy.navigationLevel(route), 3);
  assert.equal(hierarchy.canonicalParent(route), 'target-game');
}
const legacyGameRoutes = {
  shoulder: 'shoulder',
  combo_speed: 'combo',
  super_resolution: 'performance',
  diablo_coexist: 'performance',
  'group/game/performance/legacy': 'performance',
};
for (const [route, section] of Object.entries(legacyGameRoutes)) {
  assert.equal(hierarchy.resolveDestination(route), 'group/game/' + section);
  assert.equal(hierarchy.navigationLevel(route), 3, route + ' must not retain a fourth navigation level');
}
const editorDefaults = load('app/current-editor-data.json').defaults;
const allGameOn = Object.fromEntries([
  ...gameSections.flatMap((section) => hierarchy.sectionSettingKeys(section)),
  ...['SHOULDER_ENABLED', 'TGK_RAPID_FIRE_ENABLED', 'COMBO_SPEED_ENABLED',
    'SUPER_MIRROR_LOW_MODE', 'SUPER_MIRROR_DIABLO_COEXIST'].map((name) => editorDefaults[name].key),
].map((key) => [key, '1']));
assert.equal(gameSections.map((section) => hierarchy.activeFeatureCount(section, allGameOn)).join(','), '3,2,6,1,4',
  'game directory counts include all 16 normal and embedded editor features');
assert.equal(gameSections.reduce((count, section) => count + hierarchy.activeFeatureCount(section, {}), 0), 0);
assert.equal(hierarchy.resolveDestination('group/systemui/quicksettings'), 'group/systemui/quicksettings');
assert.equal(hierarchy.resolveDestination('group/systemui/quicksettings_more'), 'group/systemui/quicksettings_more',
  'a page containing standalone settings and an editor must keep both');
const embeddedEditors = {
  launcher_custom: 'group/launcher/launcher',
  extra_dim: 'group/systemui/quicksettings_more',
  audio_gain: 'group/system/audio',
  signature_install: 'group/system/installer',
};
for (const [editor, route] of Object.entries(embeddedEditors)) {
  const group = hierarchy.resolveGroup(route);
  assert.equal(hierarchy.resolveDestination(editor), route);
  assert.equal(hierarchy.resolveDestination(route), route);
  assert.equal(hierarchy.sectionDestination(group.target, group.section), route);
  assert.equal(hierarchy.usesEmbeddedEditors(group.target.id, group.section), true);
  assert.equal(hierarchy.navigationLevel(editor), 3);
  assert.equal(hierarchy.navigationLevel(route), 3);
  assert.equal(hierarchy.canonicalParent(editor), 'target-' + group.target.id);
  assert.equal(hierarchy.canonicalParent(route), 'target-' + group.target.id);
  assert.equal(group.section.entries.filter((entry) => entry === editor).length, 1);
}
for (const [route, key] of [
  ['group/launcher/launcher', 'prototype:launcher-enabled'],
  ['group/systemui/quicksettings_more', 'prototype:extra-dim-tile'],
  ['group/system/audio', editorDefaults.AUDIO_GAIN_ENABLED.key],
  ['group/system/installer', editorDefaults.ALLOW_SIGNATURE_MISMATCH.key],
]) {
  const { section } = hierarchy.resolveGroup(route);
  assert.equal(hierarchy.activeFeatureCount(section, { [key]: '1' }) -
    hierarchy.activeFeatureCount(section, { [key]: '0' }), 1,
    'directory counts its embedded feature at ' + route);
}
const canvas = load('app/current-status-canvas-model.ts'),
  legacy = load('app/current-status-sheet-model.ts');
const initial = canvas.readCanvas({});
assert.equal(canvas.canvasError(initial), '');
const expanded = { ...initial, rows: 1000000, cols: 1000000 };
assert.equal(
  canvas.canvasError(expanded),
  '',
  'native-style sparse dimensions must not allocate a million-cell grid',
);
assert(canvas.canvasDimensions(expanded).width > 1000000);
const cropped = { ...initial, scale: 4, x: 900, y: -30 };
assert.equal(
  canvas.canvasError(cropped),
  '',
  'overflow is retained and clipped, not rejected',
);
assert.equal(
  canvas.canvasScale({ ...initial, fit: 'width' }),
  336 / canvas.canvasDimensions(initial).width,
);
assert.equal(canvas.columnName(26), 'AA');
assert.equal(canvas.columnName(701), 'ZZ');
assert(canvas.canvasError({ ...initial, rows: 0 }));
assert(
  canvas.canvasError({
    ...initial,
    cells: [legacy.blankCell(0, 0, 'wifi'), legacy.blankCell(0, 0, 'battery')],
  }),
);
const fresh = { ...initial, cells: [legacy.blankCell(0, 0, 'wifi')] };
const moved = canvas.putCanvasCell(
  fresh,
  { ...fresh.cells[0], row: 1 },
  fresh.cells[0],
);
assert.equal(moved.cells.length, 1);
assert.equal(moved.cells[0].row, 1);
assert.equal(fresh.cells[0].row, 0);
const icons = load('app/current-asset-icons.json');
assert.equal(icons.length, 68);
assert.equal(new Set(icons.map((i) => i.id)).size, 68);
console.log(
  'PASS: 18 groups, 250 unique source settings, five game third-level pages with 16 counted features, four embedded editor groups and legacy redirects, recursive single-child navigation, compressed breadcrumbs and returns, mixed settings retained, acyclic navigation, sparse canvas, 68 native icon IDs.',
);
