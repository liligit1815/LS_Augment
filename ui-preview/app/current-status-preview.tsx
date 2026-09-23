'use client';
import { useEffect, useRef } from 'react';
import { formatClock } from './current-validation';
export function CurrentStatusPreview({
  values: v,
}: {
  values: Record<string, string>;
}) {
  const canvas = useRef<HTMLCanvasElement>(null);
  useEffect(() => {
    let live = true;
    void document.fonts.ready.then(() => {
      if (!live || !canvas.current) return;
      const c = canvas.current.getContext('2d')!;
      const w = 344,
        h = 100,
        ratio = 3.25;
      canvas.current.width = w * ratio;
      canvas.current.height = h * ratio;
      c.scale(ratio, ratio);
      c.fillStyle = '#e7f3ff';
      c.beginPath();
      c.roundRect(0, 0, w, h, 12);
      c.fill();
      c.strokeStyle = '#c7d9ea';
      c.lineWidth = 0.4;
      c.beginPath();
      c.moveTo(0, 50);
      c.lineTo(w, 50);
      for (let i = 1; i < 3; i++) {
        c.moveTo((w * i) / 3, 0);
        c.lineTo((w * i) / 3, 100);
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
        : (on('clock_24h') ? '17:51' : '5:51') +
          (on('clock_seconds') ? ':30' : '') +
          (on('clock_period') ? ' 下午' : '') +
          (on('clock_week') ? (rows === 2 ? '\n周六' : ' 周六') : '');
      const labels: Record<string, string> = {
        clock,
        notifications: on('notification_two_rows', true)
          ? '● '.repeat(Math.ceil(count / 2)).trim() +
            '\n' +
            '● '.repeat(Math.floor(count / 2)).trim()
          : '● '.repeat(count).trim(),
        system_icons: on('system_two_rows', true)
          ? 'Wi-Fi\n静音'
          : 'Wi-Fi 静音',
        battery: '100%',
        cpu: 'C:37°',
        gpu: 'G:36°',
        battery_temp: 'B:33°',
        current: 'I:600mA',
        power: 'P:2.4W',
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
        if ((v['status:' + id + ':on'] ?? (i < 4 ? '1' : '0')) !== '1') return;
        let size = Number(v['status:' + id + ':size'] ?? (i < 4 ? 13 : 9));
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
          ['network', 'system_icons', 'notifications'].includes(id) &&
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
      const barHeight = Math.max(33, n('height_dp')),
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
        const available = usable / 3,
          start = left + col * available,
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
                ? v['ls_augment_statusbar_clock_font_family'] || 'sans-serif'
                : 'CurrentDevice';
            c.font = `${node.weight} ${node.size}px ${font}`;
            const lineSpacing =
              node.id === 'clock' && custom ? n('clock_line_spacing_dp') : 0;
            const height =
              node.size * 1.2 * node.lines +
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
              ? v['ls_augment_statusbar_clock_font_family'] || 'sans-serif'
              : 'CurrentDevice';
          c.font = `${node.weight} ${node.size * item.fit * fit}px ${font}`;
          c.fillStyle = '#14233a';
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
    />
  );
}
