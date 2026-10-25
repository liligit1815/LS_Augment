'use client';
import { useEffect, useRef } from 'react';
import { formatClock } from './current-validation';
import { drawConnectivity } from './current-connectivity-preview';
import {
  componentNames,
  placementItems,
  placementKey,
  readPlacement,
  effectiveZone,
} from './current-status-placement';
import {
  effectiveStatusValues,
  layoutIsSingle,
  resolveSpacing,
  hiddenReason,
  notificationSampleCount,
} from './current-status-policy';
export function CurrentStatusPreview({
  values: saved,
  onSelect,
  individual = false,
}: {
  values: Record<string, string>;
  onSelect?: (id: string) => void;
  individual?: boolean;
}) {
  const canvas = useRef<HTMLCanvasElement>(null);
  const hits = useRef<
    { id: string; x: number; y: number; width: number; height: number }[]
  >([]);
  useEffect(() => {
    const v = effectiveStatusValues(saved);
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
      if (!layoutIsSingle(v)) {
        c.moveTo(0, 31);
        c.lineTo(w, 31);
      }
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
        network = [0, 1, 2, 3, 4].includes(n('network_display'))
          ? n('network_display')
          : on('network_two_rows', true)
            ? 4
            : 3,
        custom = on('clock_custom'),
        count = notificationSampleCount(v);
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
      const summary =
        v.ls_augment_notification_summary_enabled === '1' &&
        ['all', 'status'].includes(v['prototype:status:surface'] || 'all');
      const summaryText =
        v.ls_augment_notification_summary_mode === '1'
          ? v.ls_augment_notification_summary_text || '有新通知'
          : v.ls_augment_notification_summary_mode === '2'
            ? v.ls_augment_notification_summary_asset
              ? '▣'
              : ''
            : v.ls_augment_notification_summary_symbol || '♥';
      const sampleIds = [
        'wifi',
        'mobile1',
        'mobile2',
        'dual_signal',
        'bluetooth',
        'alarm_clock',
        'vpn',
      ];
      const systemSamples = placementItems(v).filter(
        (i) =>
          (i.id !== 'dual_signal' || v.ls_augment_rm_signal_dual === '1') &&
          !(i.id in componentNames) &&
          (sampleIds.includes(i.id) ||
            v['prototype:placement:focus'] === i.id) &&
          !hiddenReason(v, v['prototype:status:surface'] || 'all', i.id),
      );
      const glyphs: Record<string, string> = {
        wifi: '≋',
        secondary_wifi: '≋',
        mobile1: '▥',
        mobile2: '▥',
        dual_signal: '▥▥',
        bluetooth: '♧',
        alarm_clock: '◷',
        vpn: '◇',
      };
      const metricsAdvanced = v.ls_augment_rm_metrics_custom === '1';
      const metric = (
        id: string,
        value: number,
        prefix: string,
        unit: string,
      ) =>
        (metricsAdvanced
          ? (v['ls_augment_rm_metric_prefix_' + id] ?? prefix)
          : prefix) +
        decimal(id, value) +
        (metricsAdvanced && v.ls_augment_rm_metrics_hide_units === '1'
          ? ''
          : unit);
      const up = v.ls_augment_statusbar_network_upload_mark ?? '↑',
        down = v.ls_augment_statusbar_network_download_mark ?? '↓';
      const labels: Record<string, string> = {
        clock,
        notifications:
          summary && summaryText
            ? summaryText
            : on('notification_two_rows', true)
              ? '●'.repeat(Math.ceil(count / 2)).trim() +
                '\n' +
                '●'.repeat(Math.floor(count / 2)).trim()
              : '●'.repeat(count).trim(),
        battery: '73%',
        cpu: metric('cpu', 37, 'C:', '°'),
        gpu: metric('gpu', 36, 'G:', '°'),
        battery_temp: metric('battery_temp', 33.5, 'B:', '°'),
        current: metric('current', 600, 'I:', 'mA'),
        power: metric('power', 2.4, 'P:', 'W'),
        network:
          [
            '36KB/s',
            up + '12K',
            down + '36K',
            up + '12K ' + down + '36K',
            up + '12K\n' + down + '36K',
          ][network] || '',
      };
      if (individual && v['status:system_icons:on'] !== '0')
        systemSamples.forEach((i) => {
          labels[i.id] = glyphs[i.id] || i.title.slice(0, 2);
        });
      if (!individual) {
        const text = systemSamples
          .map((i) => glyphs[i.id] || i.title.slice(0, 1))
          .join('');
        labels.system_icons = on('system_two_rows')
          ? text.slice(0, 2) + '\n' + text.slice(2)
          : text;
      }
      if (
        hiddenReason(
          v,
          v['prototype:status:surface'] || 'all',
          on('connectivity_group') ? 'connectivity' : 'battery',
        )
      )
        delete labels.battery;
      const ids = Object.keys(labels),
        nodes: {
          id: string;
          zone: number;
          order: number;
          size: number;
          text: string;
          weight: number;
          spacing: number;
          lines: number;
          iconGap: number;
        }[] = [];
      ids.forEach((id, i) => {
        const ordinary = !(id in componentNames) && id !== 'system_icons';
        if (
          on('position_size_only') &&
          ['cpu', 'gpu', 'battery_temp', 'current', 'power'].includes(id)
        )
          return;
        if (
          !ordinary &&
          (v['status:' + id + ':on'] ??
            (['clock', 'notifications', 'battery'].includes(id)
              ? '1'
              : '0')) !== '1'
        )
          return;
        if (
          metricsAdvanced &&
          v.ls_augment_rm_metrics_charging_only === '1' &&
          ['current', 'power'].includes(id) &&
          !['1', '2'].includes(v['ui:charging-preview'])
        )
          return;
        let size = Number(
          v['status:' + (ordinary ? 'system_icons' : id) + ':size'] ??
            (ordinary ? 13 : 9),
        );
        if (id === 'notifications' && summary && summaryText)
          size = Number(v.ls_augment_notification_summary_size || 18);
        if (id === 'battery' && on('connectivity_group'))
          size = n('connectivity_size_dp', 26);
        if (id === 'clock' && custom && n('clock_size_sp') > 0)
          size = n('clock_size_sp');
        const item = {
          id,
          zone:
            id === 'system_icons'
              ? Number(v['status:system_icons:zone'] || 8)
              : ordinary &&
                  on('system_two_rows') &&
                  !layoutIsSingle(v) &&
                  !v[placementKey(id, 'zone')]
                ? Math.floor(effectiveZone(v, id) / 3) * 3 +
                  (systemSamples.findIndex((x) => x.id === id) % 2)
                : effectiveZone(v, id),
          order:
            id === 'system_icons'
              ? Number(v['status:system_icons:order'] || 2)
              : readPlacement(v, id).order,
          size,
          text: labels[id],
          weight: id === 'clock' && custom ? n('clock_weight', 400) : 400,
          spacing: id === 'clock' && custom ? n('clock_letter_spacing') : 0,
          lines: labels[id].split('\n').length,
          iconGap:
            (id === 'notifications' && !(summary && summaryText)) ||
            id === 'system_icons'
              ? Math.max(
                  0,
                  4 +
                    resolveSpacing(
                      v,
                      v['prototype:status:surface'] || 'all',
                      id === 'system_icons' ? 'system-default' : id,
                    )
                      .filter((_, i) => i === 0 || i === 2)
                      .reduce((a, b) => a + b, 0),
                )
              : 0,
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
      const barHeight =
          n('height_dp') <= 0
            ? Math.max(12, 33 + n('height_dp'))
            : Math.max(33, n('height_dp')),
        left = 4 + n('left_margin_dp'),
        right = 4 + n('right_margin_dp'),
        top = n('top_margin_dp'),
        bottom = n('bottom_margin_dp'),
        usable = w - left - right,
        usableH = Math.max(2, barHeight - top - bottom),
        gap = layoutIsSingle(v)
          ? 0
          : Math.max(0, Math.min(n('dual_row_gap_dp'), usableH / 4)),
        rowH = (usableH - gap) / 2;
      const scale = Math.min(1, (h - 8) / barHeight);
      c.save();
      c.translate((w - w * scale) / 2, (h - barHeight * scale) / 2);
      c.scale(scale, scale);
      for (let col = 0; col < 3; col++) {
        const emptyMiddle = !nodes.some((n) => Math.floor(n.zone / 3) === 1);
        const available = emptyMiddle && col !== 1 ? usable / 2 : usable / 3,
          start =
            left +
            (col === 2
              ? usable - available
              : col === 1
                ? (usable - available) / 2
                : 0),
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
                    Math.max(0, t.length - 1) *
                      (node.spacing * node.size + node.iconGap),
                ),
            );
            if (node.id === 'clock' && custom)
              width = Math.max(
                width,
                ...clock.split('\n').map((t) => c.measureText(t).width),
              );
            if (node.id === 'battery' && on('connectivity_group'))
              width = node.size;
            if (node.id === 'clock' && custom && n('clock_width_dp'))
              width = n('clock_width_dp');
            const edges = resolveSpacing(
              v,
              v['prototype:status:surface'] || 'all',
              node.id === 'battery' && on('connectivity_group')
                ? 'connectivity'
                : node.id,
            );
            width = Math.max(1, width + edges[0] + edges[2]);
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
            const componentGap = Math.max(
              0,
              8 + Number(v['prototype:component-gap:' + node.id] || 0),
            );
            if (span) cursor[0] = cursor[1] = x + width * fit + componentGap;
            else cursor[row] = x + width * fit + componentGap;
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
            const edges = resolveSpacing(
              v,
              v['prototype:status:surface'] || 'all',
              node.id,
            );
            let xx = origin + item.x * fit + edges[0] * fit;
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
            if ((node.spacing && node.id === 'clock') || node.iconGap) {
              for (const char of text) {
                c.fillText(char, xx, y + ((i + 0.82) * hh) / node.lines);
                xx +=
                  c.measureText(char).width +
                  (node.spacing * node.size + node.iconGap) * item.fit * fit;
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
  }, [saved, individual]);
  return (
    <canvas
      ref={canvas}
      className="c-live-status"
      aria-label={
        layoutIsSingle(saved) ? '状态栏布局预览，单排' : '状态栏布局预览，双排'
      }
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
