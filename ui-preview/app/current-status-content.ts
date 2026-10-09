import { formatClock } from './current-validation';
import type { SheetCell, CellExtent } from './current-status-sheet-model';

export function statusText(
  cell: SheetCell,
  values: Record<string, string>,
): string | null {
  const k = (name: string) => values['ls_augment_statusbar_' + name];
  if (cell.content === 'text') return cell.text || '文字';
  if (cell.content === 'clock') {
    const dual = k('clock_rows') === '2',
      custom = k('clock_custom') === '1';
    const first = custom
      ? formatClock(k('clock_pattern') || 'HH:mm')
      : (k('clock_24h') === '1' ? '14:48' : '2:48') +
        (k('clock_seconds') === '1' ? ':30' : '') +
        (k('clock_period') === '1' ? ' 下午' : '') +
        (k('clock_week') === '1' && !dual ? ' 周一' : '');
    const second = dual
      ? custom
        ? formatClock(k('clock_pattern_second') || '')
        : k('clock_week') === '1'
          ? '周一'
          : ''
      : '';
    return first + (second ? '\n' + second : '');
  }
  if (cell.content === 'network') {
    const up = (k('network_upload_mark') ?? '↑') + '12K',
      down = (k('network_download_mark') ?? '↓') + '36K';
    return k('network_display') === '1'
      ? up
      : k('network_display') === '2'
        ? down
        : k('network_display') === '3'
          ? up + ' ' + down
          : up + '\n' + down;
  }
  const readings: Record<string, [number, string]> = {
    cpu: [37, '°'],
    gpu: [36, '°'],
    battery_temp: [33.5, '°'],
    current: [600, 'mA'],
    power: [2.4, 'W'],
  };
  const reading = readings[cell.content];
  if (!reading) return null;
  const digits = Number(
    k(cell.content + '_decimals') ?? (cell.content === 'current' ? 0 : 1),
  );
  return (
    reading[0].toFixed(
      Number.isFinite(digits) ? Math.max(0, Math.min(3, digits)) : 1,
    ) + reading[1]
  );
}
export function statusFont(cell: SheetCell, values: Record<string, string>) {
  const custom =
    cell.content === 'clock' &&
    values.ls_augment_statusbar_clock_custom === '1';
  return {
    family:
      (custom && values.ls_augment_statusbar_clock_font_family) ||
      'NativeLatin, CurrentDevice, sans-serif',
    weight: custom
      ? Number(values.ls_augment_statusbar_clock_weight) || 400
      : 400,
    spacing: custom
      ? Number(values.ls_augment_statusbar_clock_letter_spacing) || 0
      : 0,
  };
}
let context: CanvasRenderingContext2D | null = null;
export function statusExtent(
  cell: SheetCell,
  values: Record<string, string>,
): CellExtent {
  const text = statusText(cell, values),
    size = cell.size;
  if (text !== null) {
    if (!context && typeof document !== 'undefined')
      context = document.createElement('canvas').getContext('2d');
    const font = statusFont(cell, values);
    if (context) context.font = `${font.weight} ${size}px ${font.family}`;
    const lines = text.split('\n');
    return {
      width: Math.max(
        ...lines.map(
          (line) =>
            (context?.measureText(line).width ??
              Array.from(line).reduce(
                (n, c) => n + (c.charCodeAt(0) > 255 ? size : size * 0.62),
                0,
              )) +
            line.length * size * Math.max(0, font.spacing),
        ),
      ),
      height: Math.max(1, lines.length) * size * 1.2,
    };
  }
  if (cell.content === 'notifications') {
    if (values.ls_augment_statusbar_notification_hide === '1')
      return { width: 0, height: 0 };
    const count = Math.min(
      20,
      Math.max(1, Number(values.ls_augment_statusbar_notification_max) || 4),
    );
    const cols =
      values.ls_augment_statusbar_notification_two_rows === '1'
        ? Math.ceil(count / 2)
        : count;
    const rows = Math.ceil(count / cols);
    return { width: cols * size + cols - 1, height: rows * size + rows - 1 };
  }
  if (cell.content === 'system_icons')
    return values.ls_augment_statusbar_system_two_rows === '1'
      ? { width: size, height: size * 2 + 1 }
      : { width: size * 2 + 1, height: size };
  if (
    cell.content === 'battery' &&
    values.ls_augment_statusbar_connectivity_group !== '1'
  )
    return { width: size * 1.4, height: size * 1.4 };
  if (cell.content === 'battery') {
    const n = (key: string, fallback = 0) =>
      Number(values['ls_augment_statusbar_connectivity_' + key] ?? fallback);
    let overflow = 0;
    const bounds = (
      x: number,
      y: number,
      left: number,
      top: number,
      right: number,
      bottom: number,
      scale: number,
    ) => {
      overflow +=
        Math.max(0, -(x + left * scale)) +
        Math.max(0, x + right * scale - 1) +
        Math.max(0, -(y + top * scale)) +
        Math.max(0, y + bottom * scale - 1);
    };
    ['upper', 'middle', 'lower'].forEach((slot, i) => {
      const content =
        values['ls_augment_statusbar_connectivity_' + slot + '_content'] ||
        ['wifi', 'battery', 'dual'][i];
      if (content === 'none') return;
      const x = 0.5 + n(slot + '_x') / 100,
        y = [0.25, 0.51, 0.79][i] + n(slot + '_y') / 100,
        scale = n(slot + '_scale', 100) / 100;
      if (content === 'wifi') bounds(x, y, -0.193, -0.143, 0.193, 0.065, scale);
      else if (content === 'battery') {
        bounds(x, y, -0.19, -0.18, 0.19, 0.18, scale);
        for (const state of ['charge', 'bypass'])
          bounds(
            x + (0.25 + n(state + '_x') / 100) * scale,
            y + (n(state + '_y') / 100) * scale,
            -0.125,
            -0.15,
            0.125,
            0.15,
            (scale * n(state + '_scale', 100)) / 100,
          );
      } else
        bounds(
          x,
          y,
          -0.208,
          -0.105,
          content === 'dual' ? 0.231 : -0.019,
          0.035,
          scale,
        );
    });
    return { width: size, height: size, artworkOverflow: overflow * size };
  }
  return { width: size, height: size };
}
