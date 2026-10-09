'use client';
import { useEffect, useRef } from 'react';
import { formatClock } from './current-validation';
import { drawConnectivity } from './current-connectivity-preview';
export function CurrentStatusPreview({
  values: v,
  onSelect,
}: {
  values: Record<string, string>;
  onSelect?: (id: string) => void;
}) {
  const canvas = useRef<HTMLCanvasElement>(null);
  const hits = useRef<
    { id: string; x: number; y: number; width: number; height: number }[]
  >([]);
  useEffect(() => {
    let live = true;
    void document.fonts.ready.then(() => {
      if (!live || !canvas.current) return;
      const c = canvas.current.getContext('2d')!;
      const w = 344,
        h = 62,
        ratio = 3.25;
      canvas.current.width = w * ratio;
      canvas.current.height = h * ratio;
      c.scale(ratio, ratio);
      hits.current = [];
      c.fillStyle = '#e7f3ff';
      c.beginPath();
      c.roundRect(0, 0, w, h, 12);
      c.fill();
      c.strokeStyle = '#c7d9ea';
      c.lineWidth = 0.4;
      c.beginPath();
      c.moveTo(0, 31);
      c.lineTo(w, 31);
      for (let i = 1; i < 3; i++) {
        c.moveTo((w * i) / 3, 0);
        c.lineTo((w * i) / 3, 62);
      }
      c.stroke();
      const n = (key: string, d = 0) => {
          const value = Number(v['ls_augment_statusbar_' + key] ?? d);
          return Number.isFinite(value) ? value : d;
        },
        on = (key: string, d = false) =>
          (v['ls_augment_statusbar_' + key] ?? (d ? '1' : '0')) === '1';
      const rows = n('clock_rows', 2),
        network = [1, 2, 3, 4].includes(n('network_display'))
          ? n('network_display')
          : on('network_two_rows', true)
            ? 4
            : 3,
        custom = on('clock_custom'),
        count = n('notification_max') || 4;
      const format = (s: string) => formatClock(s);
      const clock = custom
        ? [
            v['ls_augment_statusbar_clock_pattern'] || '',
            v['ls_augment_statusbar_clock_pattern_second'] || '',
          ]
            .slice(0, rows)
            .filter(Boolean)
            .map(format)
            .join('\n')
        : (on('clock_24h') ? '14:48' : '2:48') +
          (on('clock_seconds') ? ':30' : '') +
          (on('clock_period') ? ' 下午' : '') +
          (on('clock_week') ? (rows === 2 ? '\n周一' : ' 周一') : '');
      const decimal = (id: string, value: number) =>
        value.toFixed(
          Math.max(
            0,
            Math.min(3, n(id + '_decimals', id === 'current' ? 0 : 1)),
          ),
        );
      const labels: Record<string, string> = {
        clock,
        notifications: on('notification_two_rows', true)
          ? '● '.repeat(Math.ceil(count / 2)).trim() +
            '\n' +
            '● '.repeat(Math.floor(count / 2)).trim()
          : '● '.repeat(count).trim(),
        system_icons: on('system_two_rows', true) ? '◉\n◇' : '◉◇',
        battery: '100%',
        cpu: 'C:' + decimal('cpu', 37) + '°',
        gpu: 'G:' + decimal('gpu', 36) + '°',
        battery_temp: 'B:' + decimal('battery_temp', 33.5) + '°',
        current: 'I:' + decimal('current', 600) + 'mA',
        power: 'P:' + decimal('power', 2.4) + 'W',
        network: ['', '↑12K', '↓36K', '↑12K ↓36K', '↑12K\n↓36K'][network] || '',
      };
      const ids = Object.keys(labels),
        defaults = [2, 2, 8, 8, 1, 1, 4, 7, 7, 5],
        nodes: {
          id: string;
          zone: number;
          order: number;
          size: number;
          text: string;
          weight: number;
          spacing: number;
          lines: number;
        }[] = [];
      ids.forEach((id, i) => {
        if (on('position_size_only') && i >= 4) return;
        if ((v['status:' + id + ':on'] ?? (i < 4 ? '1' : '0')) !== '1') return;
        let size = Number(v['status:' + id + ':size'] ?? (i < 4 ? 13 : 9));
        if (id === 'battery' && on('connectivity_group'))
          size = n('connectivity_size_dp', 26);
        if (id === 'clock' && custom && n('clock_size_sp') > 0)
          size = n('clock_size_sp');
        const item = {
          id,
          zone: Number(v['status:' + id + ':zone'] ?? defaults[i]),
          order: Number(v['status:' + id + ':order'] ?? i),
          size,
          text: labels[id],
          weight: id === 'clock' && custom ? n('clock_weight', 400) : 400,
          spacing: id === 'clock' && custom ? n('clock_letter_spacing') : 0,
          lines: labels[id].split('\n').length,
        };
        if (
          ['clock', 'network', 'system_icons', 'notifications'].includes(id) &&
          item.lines === 2
        ) {
          item.text.split('\n').forEach((text, row) =>
            nodes.push({
              ...item,
              text,
              zone: Math.floor(item.zone / 3) * 3 + row,
              lines: 1,
            }),
          );
        } else nodes.push(item);
      });
      const barHeight = Math.max(12, 33 + n('height_dp')),
        left = 4 + n('left_margin_dp'),
        right = 4 + n('right_margin_dp'),
        top = n('top_margin_dp'),
        bottom = n('bottom_margin_dp'),
        usable = w - left - right,
        usableH = Math.max(2, barHeight - top - bottom),
        gap = Math.min(n('dual_row_gap_dp'), usableH / 4),
        rowH = (usableH - gap) / 2;
      const scale = Math.min(1, (h - 8) / barHeight);
      c.save();
      c.translate((w - w * scale) / 2, (h - barHeight * scale) / 2);
      c.scale(scale, scale);
      for (let col = 0; col < 3; col++) {
        const emptyMiddle = !nodes.some(n => Math.floor(n.zone / 3) === 1);
        const available = emptyMiddle && col !== 1 ? usable / 2 : usable / 3,
          start = left + (col === 2 ? usable - available : col === 1 ? (usable - available) / 2 : 0),
          cursor = [0, 0],
          items: {
            node: (typeof nodes)[number];
            x: number;
            width: number;
            height: number;
            fit: number;
            row: number;
          }[] = [];
        nodes
          .filter((n) => Math.floor(n.zone / 3) === col)
          .sort((a, b) => a.order - b.order)
          .forEach((node) => {
            const span = node.zone % 3 === 2,
              row = node.zone % 3 === 1 ? 1 : 0;
            const font =
              custom && node.id === 'clock'
                ? (
                    v['ls_augment_statusbar_clock_font_family'] || 'sans-serif'
                  ).replace('sans-serif', 'NativeLatin, CurrentDevice')
                : 'NativeLatin, CurrentDevice';
            c.font = `${node.weight} ${node.size}px ${font}`;
            const lineSpacing =
              node.id === 'clock' && custom ? n('clock_line_spacing_dp') : 0;
            const height =
              node.id === 'battery' && on('connectivity_group')
                ? node.size
                : node.size * 1.2 * node.lines +
                  lineSpacing * Math.max(0, node.lines - 1);
            let width = Math.max(
              1,
              ...node.text
                .split('\n')
                .map(
                  (t) =>
                    c.measureText(t).width +
                    Math.max(0, t.length - 1) * node.spacing * node.size,
                ),
            );
            if (node.id === 'clock' && custom)
              width = Math.max(width,...clock.split('\n').map(t=>c.measureText(t).width));
            if (node.id === 'battery' && on('connectivity_group'))
              width = node.size;
            if (node.id === 'clock' && custom && n('clock_width_dp'))
              width = n('clock_width_dp');
            const fit = Math.min(1, (span ? usableH : rowH) / height),
              x = span ? Math.max(...cursor) : cursor[row];
            items.push({
              node,
              x,
              width: width * fit,
              height: height * fit,
              fit,
              row: span ? -1 : row,
            });
            if (span) cursor[0] = cursor[1] = x + width * fit + 1;
            else cursor[row] = x + width * fit + 1;
          });
        const used = Math.max(...cursor) - 1,
          fit = Math.min(1, available / Math.max(1, used)),
          origin =
            col === 2
              ? start + available - used * fit
              : col === 1
                ? start + (available - used * fit) / 2
                : start;
        items.forEach((item) => {
          const { node } = item,
            hh = item.height * fit,
            mid = top + usableH / 2,
            y =
              item.row < 0
                ? mid - hh / 2
                : item.row === 0
                  ? mid - gap / 2 - hh
                  : mid + gap / 2;
          const font =
            custom && node.id === 'clock'
              ? (
                  v['ls_augment_statusbar_clock_font_family'] || 'sans-serif'
                ).replace('sans-serif', 'NativeLatin, CurrentDevice')
              : 'NativeLatin, CurrentDevice';
          c.font = `${node.weight} ${node.size * item.fit * fit}px ${font}`;
          c.fillStyle = '#14233a';
          hits.current.push({
            id: node.id,
            x: (w - w * scale) / 2 + (origin + item.x * fit) * scale,
            y: (h - barHeight * scale) / 2 + y * scale,
            width: Math.max(8, item.width * fit * scale),
            height: Math.max(8, hh * scale),
          });
          if (node.id === 'battery' && on('connectivity_group')) {
            drawConnectivity(c, origin + item.x * fit, y, hh, v);
            return;
          }
          node.text.split('\n').forEach((text, i) => {
            let xx = origin + item.x * fit;
            const align =
              v['ls_augment_statusbar_clock_text_align'] || 'center';
            if (node.id === 'clock' && custom) {
              const tw = c.measureText(text).width;
              xx +=
                align === 'right'
                  ? item.width * fit - tw
                  : align === 'center'
                    ? (item.width * fit - tw) / 2
                    : 0;
            }
            if (node.spacing && node.id === 'clock') {
              for (const char of text) {
                c.fillText(char, xx, y + ((i + 0.82) * hh) / node.lines);
                xx +=
                  c.measureText(char).width +
                  node.spacing * node.size * item.fit * fit;
              }
            } else c.fillText(text, xx, y + ((i + 0.82) * hh) / node.lines);
          });
        });
      }
      c.restore();
    });
    return () => {
      live = false;
    };
  }, [v]);
  return (
    <canvas
      ref={canvas}
      className="c-live-status"
      aria-label="状态栏实时预览，左中右各分上下两排"
      data-native-path="StatusBarGridPreview"
      data-ui-label="状态栏实时预览"
      onClick={(e) => {
        const box = e.currentTarget.getBoundingClientRect(),
          x = ((e.clientX - box.left) * 344) / box.width,
          y = ((e.clientY - box.top) * 62) / box.height;
        const hit = hits.current.find(
          (r) =>
            x >= r.x - 3 &&
            x <= r.x + r.width + 3 &&
            y >= r.y - 4 &&
            y <= r.y + r.height + 4,
        );
        if (hit) onSelect?.(hit.id);
      }}
    />
  );
}
