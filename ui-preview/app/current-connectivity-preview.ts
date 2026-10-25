import { hiddenReason, resolveSpacing } from './current-status-policy';
/** Canvas rendering of the native three-part icon's editable regions. */
export function drawConnectivity(
  c: CanvasRenderingContext2D,
  x: number,
  y: number,
  size: number,
  v: Record<string, string>,
) {
  const p = 'ls_augment_statusbar_connectivity_',
    n = (key: string, d = 0) => Number(v[p + key] ?? d),
    color = (value: string) =>
      /^#[0-9a-f]{8}$/i.test(value)
        ? '#' + value.slice(3) + value.slice(1, 3)
        : value;
  const charging = v['ui:charging-preview'] === '1',
    bypass = v['ui:charging-preview'] === '2';
  const scope = v['prototype:status:surface'] || 'all';
  const visible = (id: string) => !hiddenReason(v, scope, id);
  const powerColor = (text = false) => {
    const base = text ? 'battery_text' : 'battery';
    if (v['ls_augment_rm_' + base + '_colors'] === '1')
      return color(
        v[
          'ls_augment_rm_' +
            base +
            (charging || bypass ? '_charging_color' : '_color_2')
        ] || '#FF81C784',
      );
    return !text && v[p + 'colors'] !== '0' && (charging || bypass)
      ? '#34c759'
      : '#294258';
  };
  c.save();
  c.translate(x, y);
  c.beginPath();
  c.rect(0, 0, size, size);
  c.clip();
  const radius = size * 0.46,
    stroke = (size * n('ring_percent', 6)) / 100,
    cx = size / 2,
    cy = size / 2;
  c.lineWidth = stroke;
  c.lineCap = 'round';
  c.strokeStyle = `rgba(35,66,82,${n('inactive_percent', 28) / 100})`;
  c.beginPath();
  c.arc(cx, cy, radius, -Math.PI / 2, Math.PI * 1.5);
  if (visible('battery') && visible('battery.shell')) c.stroke();
  c.strokeStyle = powerColor();
  c.beginPath();
  c.arc(cx, cy, radius, -Math.PI / 2, -Math.PI / 2 + Math.PI * 2 * 0.73);
  if (visible('battery') && visible('battery.fill')) c.stroke();
  ['upper', 'middle', 'lower'].forEach((slot, i) => {
    const content = v[p + slot + '_content'] || ['wifi', 'battery', 'dual'][i];
    if (content === 'none') return;
    const data =
      v['prototype:connectivity-data-slot'] === '2' ? 'mobile2' : 'mobile1';
    const element =
      content === 'battery'
        ? 'battery_text'
        : content === 'wifi'
          ? 'wifi'
          : content === 'data'
            ? data
            : content === 'other'
              ? data === 'mobile1'
                ? 'mobile2'
                : 'mobile1'
              : 'dual_signal';
    if (!visible(element)) return;
    if (content === 'wifi' && !visible('wifi.signal')) return;
    const edges = resolveSpacing(v, scope, element);
    const scale = n(slot + '_scale', 100) / 100;
    c.save();
    c.translate(
      cx + (size * n(slot + '_x')) / 100 + (edges[0] - edges[2]) / 2,
      size * [0.25, 0.51, 0.79][i] +
        (size * n(slot + '_y')) / 100 +
        (edges[1] - edges[3]) / 2,
    );
    c.scale(scale, scale);
    c.fillStyle = '#294258';
    c.strokeStyle = '#294258';
    c.lineWidth = size * 0.045;
    if (content === 'battery') {
      c.fillStyle = powerColor(true);
      c.font = `500 ${size * 0.29}px NativeLatin, CurrentDevice`;
      c.textAlign = 'center';
      c.textBaseline = 'middle';
      c.fillText('73', 0, 0);
      if (
        (charging || bypass) &&
        visible(charging ? 'battery.charging' : 'battery.bypass')
      ) {
        c.save();
        const state = charging ? 'charge' : 'bypass';
        c.translate(
          size * 0.25 + (size * n(state + '_x')) / 100,
          (size * n(state + '_y')) / 100,
        );
        c.scale(n(state + '_scale', 100) / 100, n(state + '_scale', 100) / 100);
        c.fillStyle = color(v[p + 'plug_color'] || '#FF34C759');
        c.font = `${size * 0.25}px sans-serif`;
        c.fillText(charging ? 'ϟ' : '↧', 0, 0);
        c.restore();
      }
    } else if (content === 'wifi') {
      [size * 0.13, size * 0.22].forEach((r) => {
        c.beginPath();
        c.arc(0, size * 0.1, r, -Math.PI * 0.78, -Math.PI * 0.22);
        c.stroke();
      });
      c.beginPath();
      c.arc(0, size * 0.04, size * 0.025, 0, Math.PI * 2);
      c.fill();
    } else {
      for (let side = 0; side < (content === 'dual' ? 2 : 1); side++)
        if (
          visible(
            content === 'dual' ? (side === 0 ? 'mobile1' : 'mobile2') : element,
          ) &&
          visible(
            (content === 'dual'
              ? side === 0
                ? 'mobile1'
                : 'mobile2'
              : element) + '.signal',
          )
        )
          for (let j = 0; j < 4; j++)
            c.fillRect(
              (j - 4) * size * 0.052 + side * size * 0.25,
              -j * size * 0.035,
              size * 0.033,
              (j + 1) * size * 0.035,
            );
    }
    c.restore();
  });
  c.restore();
}
