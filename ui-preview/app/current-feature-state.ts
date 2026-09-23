export function overrideIsActive(
  values: Record<string, string>,
  defaults: Record<string, string>,
  comparison = 'string',
) {
  return Object.entries(defaults).some(([key, off]) => {
    const value = values[key] ?? off;
    return comparison === 'number'
      ? Number(value) !== Number(off)
      : value !== off;
  });
}

/** Preserve the user's most recent choice while the native value uses its off/default value. */
export function overrideUpdates(
  name: string,
  enabled: string,
  values: Record<string, string>,
  defaults: Record<string, string>,
) {
  const updates: Record<string, string> = {};
  for (const [field, off] of Object.entries(defaults)) {
    const memory = 'ui:remember:' + name + ':' + field;
    if (enabled === '0') {
      updates[memory] = values[field] ?? off;
      updates[field] = off;
    } else if (values[memory] !== undefined) updates[field] = values[memory];
  }
  updates['ui:enabled:' + name] = enabled;
  return updates;
}
