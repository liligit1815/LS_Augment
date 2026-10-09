import fs from 'node:fs';
const root = new URL('../app/', import.meta.url);
const read = (name) => JSON.parse(fs.readFileSync(new URL(name, root), 'utf8'));
const write = (name, data) =>
  fs.writeFileSync(new URL(name, root), JSON.stringify(data, null, 2) + '\n');
const native = read('current-native-data.json');
const old = read('current-catalog.json');
const enrich = (f) => ({
  ...f,
  optionKeys: [...(f.toggleKey ? [f.toggleKey] : []), ...f.parameterKeys],
  features: f.features.map(enrich),
});
native.groups = native.groups.map((t) => ({
  ...t,
  sections: t.sections.map((s) => ({ ...s, features: s.features.map(enrich) })),
}));
write('current-catalog.json', {
  ...old,
  sourceVersion: native.version,
  targets: native.targets.map((t) => ({
    ...t,
    entries: t.entries.map((e) => ({ ...e, help: e.summary || '' })),
  })),
  options: native.options,
});
const top = native.groups.flatMap((t) => t.sections.flatMap((s) => s.features));
const walk = (f) => [f, ...f.features.flatMap(walk)];
const features = top.flatMap(walk);
const assigned = features.flatMap((f) => f.optionKeys);
const expected = native.targets.flatMap((t) =>
  t.sections.flatMap((s) => s.options.map((o) => o.key)),
);
write('current-feature-groups.json', {
  ...read('current-feature-groups.json'),
  sourceVersion: native.version,
  targets: native.groups,
  validation: {
    catalogOptionCount: expected.length,
    assignedOptionCount: assigned.length,
    topLevelFeatureCount: top.length,
    recursiveFeatureCount: features.length,
    missingKeys: expected.filter((k) => !assigned.includes(k)),
    unknownKeys: assigned.filter((k) => !expected.includes(k)),
    duplicateKeys: Object.fromEntries(
      [...new Set(assigned)]
        .map((k) => [k, assigned.filter((x) => x === k).length])
        .filter(([, count]) => count > 1),
    ),
    independentParameterFeatures: features.filter((f) => !f.toggleKey).length,
  },
});
write('current-editor-data.json', {
  ...read('current-editor-data.json'),
  source: 'ConfigSchema.java · ' + native.version,
  defaults: native.defaults,
});
console.log(
  `Synced ${native.version}: ${native.targets.length} applications, ${native.options.length} options`,
);
