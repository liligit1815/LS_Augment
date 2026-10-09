type Settings = Record<string, string>;
const runtime = (key: string) =>
  key.startsWith('prototype:') || /^hide:[^:]+:state:/.test(key);
const safe = (key: string) =>
  !['__proto__', 'prototype', 'constructor'].includes(key);

export function normalizeFanSettings(values: Settings): Settings {
  const result = { ...values };
  delete result.ls_augment_fan_target_rpm;
  delete result.ls_augment_fan_unlock_max;
  if ('ls_augment_fan_fixed_level' in result) {
    const level = Number(result.ls_augment_fan_fixed_level);
    if (!Number.isInteger(level) || level < 1 || level > 5) {
      result.ls_augment_fan_fixed_level = '1';
    }
  }
  return result;
}

export function backupSettings(values: Settings) {
  return normalizeFanSettings(
    Object.fromEntries(
      Object.entries(values).filter(([key]) => safe(key) && !runtime(key)),
    ),
  );
}

export function restoreSettings(
  current: Settings,
  imported: Settings,
  defaults: Settings,
): Settings {
  const result = { ...defaults, ...backupSettings(imported) };
  for (const [key, value] of Object.entries(current)) {
    if (key.startsWith('prototype:')) result[key] = value;
    if (/^hide:[^:]+:state:/.test(key)) {
      const [, space, , ...parts] = key.split(':');
      result[key] = (result['hide:' + space + ':apps'] || '')
        .split(',')
        .includes(parts.join(':'))
        ? value
        : '0';
    }
  }
  if (current['prototype:health-bound'] !== '1') {
    for (const key of Object.keys(result)) {
      if (/health_(multiply|plan)_enabled$/.test(key)) result[key] = '0';
    }
  }
  if (current['prototype:rapid-compatible'] !== '1') {
    for (const key of Object.keys(result))
      if (key.endsWith('tgk_rapid_fire_enabled')) result[key] = '0';
  }
  return result;
}

/** Uses the existing stateless attachment endpoint to support the in-app browser. */
export function downloadBackup(settings: Settings) {
  const iframe = document.createElement('iframe');
  iframe.name = 'current-backup-' + Date.now();
  iframe.hidden = true;
  const form = document.createElement('form');
  form.method = 'POST';
  form.action = '/api/config-export';
  form.target = iframe.name;
  form.hidden = true;
  const input = document.createElement('input');
  input.name = 'configuration';
  input.value = JSON.stringify({
    format: 'LS_Augment.UIPrototype',
    version: 2,
    baseline: 'test20288',
    exportedAt: new Date().toISOString(),
    settings,
  });
  form.appendChild(input);
  document.body.appendChild(iframe);
  document.body.appendChild(form);
  form.submit();
  setTimeout(() => {
    iframe.remove();
    form.remove();
  }, 30_000);
}
