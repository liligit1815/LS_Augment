"""Real UI import and bounded LAN-traffic capture for scoped Wi-Fi PNG/GIF cells.

Importing this module is offline. --run is explicit; default is control only.
Existing PNG/GIF bytes are not changed. Derived scoped ZIPs are clearly recorded,
not substituted for the fixed historical statusbar-user-assets Android test.
New imported assets/ZIPs are retained, never deleted. Configuration uses a durable
write-ahead journal and exact --restore-only recovery. Optional --header-seconds
uses the existing header switch; no radio, row-mode, font or native-profile changes.
"""
import argparse
import base64
import contextlib
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import re
import shlex
import struct
import time
import traceback
import uuid
import xml.etree.ElementTree as ET
import zipfile

import adb_regression as ar
import native_ui_helpers as ui


def load(name, filename):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(filename))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


traffic = load('wifi_asset_traffic', 'run-c17-wifi-spacing-traffic-device.py')
spacing = traffic.spacing
summary = load('wifi_asset_idle', 'run-c17-summary-assets-device.py')
ART = 'ls_augment_statusbar_artwork_v1'
FONT = 'ls_augment_statusbar_fonts_v1'
KEYS = (ART, spacing.SPACING)
HEADER_SECONDS = 'ls_augment_rm_qs_clock_seconds'
IDS = ('wifi.signal', 'wifi.activity_inout')
ASSETS = '/data/user/0/ls.augment.com/files/statusbar-assets/'
NOTICES = '/data/user/0/ls.augment.com/files/statusbar-pack-notices/'
LEASE = '/data/local/tmp/duo-wifi-assets-collector'
SMALL = {'wifi.signal': (2, 1, 1, 1), 'wifi.activity_inout': (1, 1, 2, 1)}
DEFAULT_PLAN = ar.ROOT / 'out/wifi-asset-spacing-20454/device-inputs/input-plan.json'
RUNTIME_SCHEMA = ar.ROOT / 'out/wifi-asset-spacing-20454/runtime-schema/schema.json'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def native_rotation(raw):
    # Android 36 reports active display viewports instead of SurfaceOrientation.
    # Restrict the modern format to the actual built-in display, not other input
    # devices or virtual displays which can independently use another rotation.
    modern = []
    for line in raw.splitlines():
        if (re.search(r'Viewport INTERNAL:\s*displayId=0,', line)
                and re.search(r'\bisActive=\[1\]', line)):
            match = re.search(r'\borientation=([0-3])\b', line)
            if match:
                modern.append(match[1])
    values = modern or re.findall(r'SurfaceOrientation:\s*([0-3])\b', raw)
    if not values or len(set(values)) != 1:
        raise RuntimeError('Cannot establish actual active display orientation')
    return int(values[0])


def theme_rows(raw):
    if not raw:
        return []
    parts = raw.split(';')
    if parts[0] not in ('1', '2'):
        raise ValueError('Unknown artwork version')
    rows = [row.split(',') for row in parts[1:]]
    if any(len(row) != (10 if parts[0] == '1' else 11) for row in rows):
        raise ValueError('Malformed artwork')
    if parts[0] == '1':
        rows = [row + ['all'] for row in rows]
    return rows


def serialize_theme(rows):
    if not rows:
        return ''
    scoped = any(row[10] != 'all' for row in rows)
    rows = sorted(rows, key=lambda r: (r[10], r[0], r[1], r[2]))
    return ('2' if scoped else '1') + ';' + ';'.join(','.join(r if scoped else r[:10]) for r in rows)


def scoped_theme(raw, surfaces):
    rows = theme_rows(raw)
    if any(row[0] not in IDS or row[10] != 'all' for row in rows):
        raise ValueError('Fixture must contain only shared Wi-Fi child bindings')
    return serialize_theme([row[:10] + [surface] for row in rows for surface in surfaces])


def merge_theme(original, incoming):
    added = theme_rows(incoming)
    owned = {(row[10], row[0]) for row in added}
    return serialize_theme([row for row in theme_rows(original) if (row[10], row[0]) not in owned] + added)


def prepare_inputs(plan_file, folder, surfaces, run_id):
    """Local only. Original ZIPs and image bytes remain unchanged and hash checked."""
    plan = json.loads(plan_file.read_text(encoding='utf-8'))
    packs = {}
    folder.mkdir(parents=True, exist_ok=True)
    for entry in plan['packs']:
        source = Path(entry['pack'])
        if digest(source.read_bytes()) != entry['sha256']:
            raise ValueError('Source ZIP hash differs: ' + str(source))
        with zipfile.ZipFile(source) as archive:
            if len(archive.namelist()) != len(set(archive.namelist())):
                raise ValueError('Duplicate archive entry')
            manifest = json.loads(archive.read('manifest.json'))
            if (manifest.get('format') != 'RedMagicDuo.StatusBarAssets' or manifest.get('version') != 1
                    or manifest.get('fonts') or manifest.get('fontFiles')
                    or manifest['theme'] != entry['theme'] or manifest['images'] != entry['assets']):
                raise ValueError('Unexpected fixture contents')
            payload = {key: archive.read(path) for key, path in manifest['images'].items()}
            if any(digest(value) != key for key, value in payload.items()):
                raise ValueError('Input image hash differs')
            if set(archive.namelist()) != {'manifest.json', *manifest['images'].values()}:
                raise ValueError('Unknown input files')
        manifest['theme'] = scoped_theme(manifest['theme'], surfaces)
        manifest['metadata']['name'] = 'Duo WiFi audit ' + entry['variant'] + ' ' + run_id[:8]
        manifest['metadata']['description'] = 'Explicit scoped derivative for ' + ','.join(surfaces) + '; original image bytes unchanged; local validation only.'
        target = folder / ('DuoWifi-' + run_id[:8] + '-' + entry['variant'] + '.zip')
        with zipfile.ZipFile(target, 'w', zipfile.ZIP_DEFLATED) as archive:
            archive.writestr('manifest.json', json.dumps(manifest, ensure_ascii=False, separators=(',', ':')))
            for key, value in payload.items():
                archive.writestr(manifest['images'][key], value)
        packs[entry['variant']] = {'path': str(target), 'sha256': digest(target.read_bytes()),
            'source': str(source), 'sourceSha256': entry['sha256'], 'theme': manifest['theme'],
            'hashes': sorted(payload), 'name': manifest['metadata']['name']}
    if set(packs) != {'signal-only', 'activity-only', 'signal-and-activity'}:
        raise ValueError('All three explicitly named variants are required')
    missing = plan['missingHashMustBeConfirmedAbsentOnPhone']
    if not re.fullmatch('[a-f0-9]{64}', missing):
        raise ValueError('Invalid missing-asset sentinel')
    return {'packs': packs, 'missingHash': missing,
            'missingTheme': scoped_theme(plan['missingTheme'], surfaces), 'surfaces': list(surfaces)}


def decode_runtime(raw):
    parts = raw.split('.')
    if len(parts) != 3 or parts[0] != 'LSA1':
        raise ValueError('Runtime mirror is unavailable')
    body = base64.urlsafe_b64decode(parts[2] + '=' * (-len(parts[2]) % 4))
    if digest(body) != parts[1]:
        raise ValueError('Runtime snapshot checksum mismatch')
    lines = body.decode().splitlines()
    if len(lines) < 5 or not all(lines[i].startswith(p) for i, p in enumerate(('v=', 'r=', 't=', 's='))):
        raise ValueError('Runtime snapshot header malformed')
    result = {}
    for line in lines[4:]:
        key, value = line.split('=', 1)
        if key in result:
            raise ValueError('Duplicate runtime key')
        result[key] = base64.urlsafe_b64decode(value + '=' * (-len(value) % 4)).decode()
    return result


def environment(values):
    values = dict(values)
    raw = values[spacing.SPACING]
    if raw:
        parts = raw.split(';')
        if parts[0] != 'IS1':
            raise ValueError('Unsupported spacing version')
        rows = [row for row in parts[1:] if row.split(',')[1] not in IDS]
        values[spacing.SPACING] = 'IS1;' + ';'.join(sorted(rows)) if rows else ''
    return digest(('{' + ', '.join(key + '=' + values[key] for key in sorted(values)) + '}').encode())


def validate_profile(raw, current, not_before):
    profile = raw.split('|')
    if len(profile) != 10 or profile[0] != 'HSC1':
        raise ValueError('Malformed capacity profile')
    boot, at, build, display, rotation, density, font, rtl, vertical = map(int, profile[1:])
    if (build != current['build'] or display != 0 or rotation != current['rotation']
            or density != current['density'] or font != current['font'] or rtl != current['rtl']
            or abs(boot - current['bootEpoch']) >= 5000 or at > current['uptime'] + 1000
            or current['uptime'] - at > 45000 or boot + at < not_before - 1000):
        raise ValueError('Budget does not match current build/display/profile/configuration time')
    return profile


def parse_budget(raw, current, expected_environment, not_before, expected_reason='native_slot'):
    p = raw.split(';')
    if expected_reason not in ('native_slot', 'capacity'):
        raise ValueError('Unsupported expected capacity outcome')
    if len(p) != 11 or p[0] != 'WAS1' or p[1] != expected_environment or p[2] != expected_reason:
        raise ValueError('Unknown, stale-generation or rejected native asset capacity')
    profile = validate_profile(p[10], current, not_before)
    w, h, mw, mh = map(int, p[3:7])
    units = float(p[7])
    if not (0 < w <= 4096 and 0 < h <= 4096 and 0 < mw <= 32768 and 0 < mh <= 32768
            and math.isfinite(units) and 0 < units <= 100 and p[8] == p[9] == '1'):
        raise ValueError('Both native cells and finite positive capacity must be observed')
    return dict(width=w, height=h, maxWidth=mw, maxHeight=mh, units=units, profile=profile, environment=p[1], reason=p[2])


def parse_rejection_detail(raw, budget, current, not_before, prior=None):
    """WAB has no configuration hash. Correlate it with fresh fingerprinted WAS,
    *then* reuse only the identical, already validated stable geometry report.
    Never represent WAB alone as proof of the current configuration or pixels."""
    parts = raw.split(';')
    fields = dict(part.split('=', 1) for part in parts[1:] if '=' in part)
    expected = {'reason', 'vertical', 'consumed', 'limit', 'parent', 'branch', 'blocker', 'widthOrigin', 'build', 'uptime'}
    if len(parts) != 11 or parts[0] != 'WAB1' or set(fields) != expected:
        raise ValueError('Malformed native budget detail')
    if fields['reason'] != 'bounded' or fields['blocker'] != '{none}' or int(fields['build']) != current['build']:
        raise ValueError('This is not the expected current-build bounded native capacity rejection')
    at = int(fields['uptime'])
    fresh = (current['uptime'] - 45000 <= at <= current['uptime'] + 1000
             and current['bootEpoch'] + at >= not_before - 1000)
    reuse = prior is not None and prior['raw'] == raw and abs(prior['bootEpoch'] - current['bootEpoch']) < 5000
    if not fresh and not reuse:
        raise ValueError('WAB is stale; no matching geometry was established during this collection')
    origin = re.fullmatch(r'\{nativeWidth=(\d+),available=(\d+),consumed=(\d+),limit=(-?\d+),'
                          r'class=com\.android\.systemui\.statusbar\.phone\.StatusIconContainer,resource=statusIcons,visibility=0,(.+)\}', fields['widthOrigin'])
    if not origin:
        raise ValueError('The first width constraint is not the observed native icon row')
    native, available, consumed, limit = map(int, origin.groups()[:4])
    if (not 0 < available <= native or consumed <= 0 or available - consumed != limit
            or limit != budget['maxWidth'] or int(fields['limit']) != limit
            or int(fields['vertical']) + budget['height'] != budget['maxHeight']):
        raise ValueError('WAB detail and the current configuration WAS disagree')
    if not (budget['reason'] == 'capacity' and 0 < limit < 2 * budget['width']
            and budget['maxHeight'] >= budget['height']):
        raise ValueError('Current scene is not horizontal capacity below two unchanged native canvases')
    return {'raw': raw, 'bootEpoch': current['bootEpoch'], 'nativeRowWidth': native,
            'available': available, 'reservedCompleteNativeCost': consumed, 'limit': limit,
            'requiredZeroEdgeWidth': 2 * budget['width'], 'geometryReusedFromEarlierValidatedPhase': not fresh,
            'currentConfigurationVerifiedBy': 'fresh WAS1 full-runtime fingerprint; WAB has no configuration fingerprint'}


def resolve_home(raw):
    values = [line.strip() for line in raw.splitlines() if re.fullmatch(r'[A-Za-z][\w.]*/[A-Za-z.$][\w.$]*', line.strip())]
    if len(values) != 1 or values[0].split('/')[0] in ('android', 'com.android.intentresolver'):
        raise ValueError('No unique resolved HOME application; no default will be selected')
    return values[0]


def known_background(windows, native, home):
    focused = [w for w in windows if w.get('type') == 1 and w.get('active') and w.get('focused')]
    components = re.findall(r'mCurrentFocus=Window\{[^\n]*?\s(?:u\d+\s+)?([A-Za-z][\w.]+/[^\s}]+)', native)
    if len(focused) != 1 or len(set(components)) != 1:
        return False
    component = components[0]
    package = component.split('/')[0]
    def full(value):
        if not value or '/' not in value:
            return None
        pkg, activity = value.split('/', 1)
        return pkg + '/' + (pkg + activity if activity.startswith('.') else activity)
    return focused[0].get('root', {}).get('package') == package and (package == 'ls.augment.com' or full(component) == full(home))


def control_signature(windows):
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    if len(focused) != 1 or focused[0].get('root', {}).get('package') != 'com.android.systemui':
        return None
    panels = [n for n in ui.nodes(focused) if n.get('visible') and n.get('id') == 'com.android.systemui:id/control_panel']
    if len(panels) != 1:
        return None
    try:
        return tuple(bounds(panels[0]))
    except ValueError:
        return None


def require_resource_rows(rows, identities, theme, surface, application):
    selected = {}
    for identity in identities:
        bindings = [binding for binding in theme_rows(theme) if binding[0] == identity and binding[10] == surface]
        candidates = [row for row in rows if row.get('id') == identity and row.get('state') == 'visible'
                      and not row.get('coveredBy') and row.get('application') == application
                      and any(binding[3] == row.get('matchedAsset') and binding[1] == row.get('matchedState')
                              and (binding[1] == 'default' or binding[1] in row.get('states', [])) for binding in bindings)]
        if not candidates:
            raise RuntimeError(('Expected visible hash-matched ready resource without prior custom drawing: ' if application == 'ready'
                                else 'Requested real visible resource has not drawn: ') + identity)
        selected[identity] = candidates
    return selected


def accepts(budget, edges):
    unit = budget['units']
    s, a = [[math.floor(edge * unit + .5) for edge in edges[key]] for key in IDS]
    width = 2 * budget['width'] + s[0] + s[2] + a[0] + a[2]
    height = budget['height'] + max(s[1] + s[3], a[1] + a[3])
    return width <= budget['maxWidth'] and height <= budget['maxHeight']


def bounds(node):
    found = list(map(int, re.findall(r'-?\d+', node.get('bounds', ''))))
    if len(found) != 4 or found[2] <= found[0] or found[3] <= found[1]:
        raise ValueError('No visible target bounds')
    return found


def choose_node(windows, predicate):
    found = [node for node in ui.nodes(windows) if node.get('visible') and node.get('enabled', True) and predicate(node)]
    if len(found) > 1:
        clickable = [node for node in found if node.get('clickable')]
        if len(clickable) == 1:
            found = clickable
    if len(found) != 1:
        raise ValueError('Expected one exact visible UI target; got ' + str(len(found)))
    return found[0]


def interactive_target(windows, native, node):
    package = node.get('package')
    if package not in ('ls.augment.com', 'com.android.documentsui', 'com.google.android.documentsui'):
        raise RuntimeError('Target is outside the actual editor/document picker')
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    if len(focused) != 1 or focused[0].get('root', {}).get('package') != package:
        raise RuntimeError('Unknown or covering focused window; no tap')
    if not any(n is node for n in ui.nodes(focused)):
        raise RuntimeError('Target belongs to an underlying window; no tap')
    native_packages = re.findall(r'mCurrentFocus=Window\{[^\n]*?\s(?:u\d+\s+)?([A-Za-z][\w.]+)/\S+', native)
    if not native_packages or set(native_packages) != {package}:
        raise RuntimeError('Native focus does not match the observed target')
    texts = '\n'.join(str(n.get('text', '')) for n in ui.nodes(focused) if n.get('visible'))
    if re.search(r'权限|用户协议|隐私政策|首次使用|欢迎.{0,12}使用|设置默认|选择.{0,8}应用|仅此一次|始终', texts):
        raise RuntimeError('Permission/default/first-run guide; no tap')


def journal_keys(journal):
    flag = journal.get('headerSeconds', False)
    if not isinstance(flag, bool):
        raise RuntimeError('Unknown seconds recovery mode')
    return KEYS + (HEADER_SECONDS,) if flag else KEYS


def header_clock(windows):
    if control_signature(windows) is None:
        raise RuntimeError('No uniquely focused real control panel for seconds observation')
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    panels = [n for n in ui.nodes(focused) if n.get('visible') and n.get('id') == 'com.android.systemui:id/control_panel']
    def descendants(node):
        yield node
        for child in node.get('children', []):
            yield from descendants(child)
    headers = [n for n in descendants(panels[0]) if n.get('visible') and n.get('id') == 'com.android.systemui:id/cc_header']
    if len(headers) != 1:
        raise RuntimeError('Control header unavailable/ambiguous')
    clocks = [n for n in descendants(headers[0]) if n.get('visible') and n.get('id') == 'com.android.systemui:id/clock']
    if len(clocks) != 1:
        raise RuntimeError('Native control mClockView is not visible/unique')
    return {key: clocks[0].get(key) for key in ('text', 'description', 'bounds', 'renderingInfo')}


def verify_seconds(first, last, diagnostic):
    def normalize(text):
        return re.sub(r'\s+', ' ', str(text or '').replace('\n:', ':')).strip()
    stamps = []
    for node in (first, last):
        text = normalize(node.get('text'))
        match = re.search(r'\d{1,2}:\d{2}:\d{2}', text)
        if not match or normalize(node.get('description')) != text:
            raise RuntimeError('Real seconds text/accessibility description unavailable')
        stamps.append(match[0])
    if stamps[0] == stamps[1]:
        raise RuntimeError('Two observed real seconds values did not advance')
    if ';clock;mode=' not in diagnostic:
        raise RuntimeError('Owned header layout is unavailable, native fallback or stale; no asset experiment')
    return {'observedSeconds': stamps, 'layoutReported': 'custom', 'pixelPass': False,
            'limit': 'Clock diagnostic has no freshness timestamp; real text/PNG and fresh WAS1 environment remain required.'}


def settled_snapshot(inventory, geometry, diagnostics, profile, environment_hash, not_before, opened, theme, required, prior=None):
    """Current decoded resources plus bounded native geometry; deliberately no pixel verdict.

    applied is a historical Resource.drawn latch. It is recorded, never treated
    as current custom rendering or as evidence that native fallback succeeded.
    """
    if (inventory.get('surfaceObservedAt', {}).get('control', 0) < opened
            or inventory.get('runtime', {}).get('activeSurface') != 'control'
            or not inventory.get('runtime', {}).get('enabled') or not inventory.get('runtime', {}).get('interactive')):
        raise RuntimeError('Settled fallback requires fresh current control inventory')
    selected = {}
    for identity in IDS:
        rows = [r for r in inventory.get('surfaces', {}).get('control', []) if r.get('id') == identity
                and r.get('surface') == 'control' and r.get('state') == 'visible' and r.get('capability') == 'whole_layers' and not r.get('coveredBy')]
        if len(rows) != 1 or not rows[0].get('instance') or not rows[0].get('states'):
            raise RuntimeError('Settled fallback requires two unique current native cells/instances/states')
        row = rows[0]
        if identity in required:
            if row.get('application') not in ('ready', 'applied'):
                raise RuntimeError('Settled fallback requires decoded resources; loading/error/matched-only is insufficient')
            require_resource_rows([row], (identity,), theme, 'control', row['application'])
        selected[identity] = {key: row.get(key) for key in ('id', 'instance', 'states', 'application', 'matchedState', 'matchedAsset')}
    rotation = profile['rotation']
    contract = diagnostics.get(f'ls_augment_statusbar_wifi_spacing_contract_control_{rotation}_wifi', '')
    if not contract.startswith('asset_cells;HSC1|'):
        raise RuntimeError('Settled fallback lacks the current asset-pair contract')
    validate_profile(contract.split(';', 1)[1], profile, not_before)
    budget = parse_budget(diagnostics.get(f'ls_augment_statusbar_wifi_asset_space_control_{rotation}_wifi', ''),
                          profile, environment_hash, not_before, 'capacity')
    detail = parse_rejection_detail(diagnostics.get(f'ls_augment_statusbar_wifi_asset_budget_control_{rotation}_wifi', ''),
                                    budget, profile, not_before, prior)
    boxes = {}
    for identity in ('wifi_combo', 'wifi_group', 'wifi_signal', 'wifi_inout', 'statusIcons'):
        nodes = [n for n in geometry if n.get('visible') and n.get('id') == 'com.android.systemui:id/' + identity]
        if len(nodes) != 1:
            raise RuntimeError('Settled fallback requires unique actual native pair/row bounds: ' + identity)
        box = bounds(nodes[0]); boxes[identity] = box
        if identity != 'statusIcons' and (box[2] - box[0], box[3] - box[1]) != (budget['width'], budget['height']):
            raise RuntimeError('Current pair is not the unchanged native canvas size')
    if not all(boxes[k] == boxes['wifi_signal'] for k in ('wifi_combo', 'wifi_group', 'wifi_inout')):
        raise RuntimeError('Current native pair cells do not share their original rectangle')
    row = boxes['statusIcons']; cell = boxes['wifi_signal']
    if row[2] - row[0] != detail['nativeRowWidth'] or not (row[0] <= cell[0] < cell[2] <= row[2] and row[1] <= cell[1] < cell[3] <= row[3]):
        raise RuntimeError('Current native row differs from the full-cost budget or clips the pair')
    return {'rows': selected, 'boxes': boxes, 'budget': budget, 'detail': detail,
            'latchedApplied': [i for i in required if selected[i]['application'] == 'applied'], 'pixelPass': False}


def settled_pair(before, after):
    if before['rows'] != after['rows'] or before['boxes'] != after['boxes']:
        raise RuntimeError('Pair instance/state/resource/history/geometry changed during settled samples')
    fields = ('width', 'height', 'maxWidth', 'maxHeight', 'units', 'environment', 'reason')
    if any(before['budget'][k] != after['budget'][k] for k in fields):
        raise RuntimeError('Actual native capacity changed during settled samples')
    if before['budget']['profile'][3:9] != after['budget']['profile'][3:9]:
        raise RuntimeError('Actual build/display/rotation/font/density/direction changed during settled samples')
    return {'currentStableCapacityObserved': True, 'latchedApplied': after['latchedApplied'], 'pixelPass': False,
            'nativePixels': 'independent review required: exact native state/shape, actual arrows and every neighbor',
            'limit': 'No claim that artwork never drew transiently; these records only bracket the eight saved frames.'}


def validate_journal(journal):
    keys = journal_keys(journal)
    if set(journal['values']) != set(keys) or journal['deviceSerial'] != ar.SERIAL:
        raise RuntimeError('Recovery journal device/keys differ')
    if set(journal.get('allowedValues', {})) != set(keys):
        raise RuntimeError('Recovery journal lacks exact owned-key allowlist')
    for key in keys:
        if not isinstance(journal['values'][key], str) or journal['values'][key] not in journal['allowedValues'][key]:
            raise RuntimeError('Recovery journal baseline is not an allowed exact value')
    if HEADER_SECONDS in keys and any(v not in ('0', '1') for v in journal['allowedValues'][HEADER_SECONDS]):
        raise RuntimeError('Invalid seconds value in recovery journal')


def assert_recoverable(current, journal):
    validate_journal(journal)
    for key in journal_keys(journal):
        if current.get(key) not in journal['allowedValues'][key]:
            raise RuntimeError('Refusing to overwrite an unrecognized later user value: ' + key)


def gif_color_observation(folder, geometry):
    """Same-pixel red/green alternation inside the actual activity View, not global diff."""
    from PIL import Image
    import numpy as np
    nodes = [n for n in geometry if n.get('visible') and n.get('id', '').endswith('/wifi_inout')]
    if len(nodes) != 1:
        return {'established': False, 'reason': 'No unique actual visible wifi_inout View for a bounded pixel check'}
    box = bounds(nodes[0])
    masks, frames = [], []
    for path in sorted(folder.glob('frame-*.png')):
        with Image.open(path) as image:
            if not (0 <= box[0] < box[2] <= image.width and 0 <= box[1] < box[3] <= image.height):
                return {'established': False, 'reason': 'Activity bounds exceed screenshot'}
            pixels = np.asarray(image.convert('RGB').crop(tuple(box)), dtype=np.int16)
        red = (pixels[:, :, 0] - pixels[:, :, 1] > 24) & (pixels[:, :, 0] - pixels[:, :, 2] > 24)
        green = (pixels[:, :, 1] - pixels[:, :, 0] > 24) & (pixels[:, :, 1] - pixels[:, :, 2] > 24)
        masks.append((red, green))
        frames.append({'file': path.name, 'redPixels': int(red.sum()), 'greenPixels': int(green.sum())})
    pairs = [{'a': i, 'b': j, 'samePixelsChangedRedGreen': int(((a[0] & b[1]) | (a[1] & b[0])).sum())}
             for i, a in enumerate(masks) for j, b in enumerate(masks) if i < j]
    strongest = max(pairs, key=lambda p: p['samePixelsChangedRedGreen'], default=None)
    return {'established': bool(strongest and strongest['samePixelsChangedRedGreen'] >= 8), 'bounds': box,
            'frames': frames, 'strongestPair': strongest,
            'limit': 'Actual red/green alternation within the observed activity View only; combine with matched GIF resource and manual no-overlap/arrow review. No global image-difference inference.'}


class Collector(spacing.Collection):
    def __init__(self, output, version, surfaces=('control',), settle=8, expect_capacity_rejection=False, header_seconds=False, observe_settled_fallback=False):
        super().__init__(output, version, settle)
        if header_seconds and (tuple(surfaces) != ('control',) or expect_capacity_rejection):
            raise ValueError('Seconds combination requires control only and normal capacity verification')
        if observe_settled_fallback and (tuple(surfaces) != ('control',) or header_seconds or expect_capacity_rejection):
            raise ValueError('Settled fallback requires control only, no seconds mutation and its own evidence mode')
        self.observe_settled_fallback = observe_settled_fallback
        self.header_seconds = header_seconds
        self.mutation_keys = KEYS + (HEADER_SECONDS,) if header_seconds else KEYS
        self.surfaces = tuple(surfaces)
        self.expected = {}
        self.run_id = uuid.uuid4().hex
        self.identity = self.ping_binary = self.ping_help = None
        self.not_before = 0
        self.inputs = None
        self.expect_capacity_rejection = expect_capacity_rejection
        self.home_component = None
        self.rejection_details = {}
        self.report['expectCapacityRejection'] = expect_capacity_rejection
        self.report['observeSettledFallback'] = observe_settled_fallback
        self.report.update(scope='Scoped Wi-Fi child PNG/GIF import and canvas spacing; control/notification only.',
            onlyMutatedKeys=list(self.mutation_keys), headerSeconds=header_seconds, importedResourcesPolicy='Retain all imported assets, new metadata/names/notices and staged ZIPs; delete no user or fixture media.',
            excluded=['main', 'lock', 'radio changes', 'forced activity visibility', 'row modes/manual size/native profile changes', 'public Internet traffic'],
            cases=[], surfaces=list(surfaces), runtimeGatesAreNotPixelPass=True)
        samples = (7 if observe_settled_fallback else 6 if expect_capacity_rejection else 8) + int(header_seconds)
        self.report['trafficBudget'] = {'perSampleSeconds': traffic.PING_DEADLINE, 'perSamplePackets': traffic.PING_COUNT,
            'payloadBytes': traffic.PING_BYTES, 'intervalSeconds': traffic.PING_INTERVAL, 'maximumSamples': samples*len(surfaces),
            'maximumRequestPayloadBytes': samples*len(surfaces)*traffic.PING_COUNT*traffic.PING_BYTES}
        self.report.pop('onlyMutatedKey', None)

    def instrument(self, operation, label, values=None):
        with (self.output / (label + '-console.txt')).open('w', encoding='utf-8') as stream, contextlib.redirect_stdout(stream):
            result = ar.instrument(operation, label, values)
        if str(result.get('moduleVersion')) != str(self.version['versionCode']) or result.get('status') != 'pass':
            raise RuntimeError('Instrumentation build/status mismatch')
        return result

    def read_settings(self, label):
        return self.instrument('snapshot', label)['settings']

    def assert_preserved(self, settings, label):
        expected = dict(self.baseline, **self.expected)
        difference = {key: {'expected': expected.get(key), 'actual': settings.get(key)} for key in expected.keys() | settings.keys()
                      if key not in expected or key not in settings or settings.get(key) != expected.get(key)}
        if difference:
            spacing.atomic_json(self.output / (label + '-config-diff.json'), difference)
            raise RuntimeError('Configuration readback differs from exact expected baseline/fixture')

    def write_ahead(self, values, label):
        for key, value in values.items():
            if key not in self.mutation_keys:
                raise ValueError('Unowned setting')
            if key == HEADER_SECONDS and value not in ('0', '1'):
                raise ValueError('Invalid seconds setting')
            if value not in self.journal['allowedValues'][key]:
                self.journal['allowedValues'][key].append(value)
        self.journal.update(pending=True, phase=label, updatedAt=spacing.now())
        spacing.atomic_json(self.journal_path, self.journal)
        ar.adb('push', self.journal_path, LEASE + '/restore.json')
        if digest(ar.adb('exec-out', 'cat ' + LEASE + '/restore.json')) != digest(self.journal_path.read_bytes()):
            raise RuntimeError('Durable phone journal readback differs')
        self.progress(label)

    def set_values(self, label, values):
        self.check_process()
        self.write_ahead(values, label)
        self.not_before = int(ar.shell('date +%s%3N'))
        self.instrument('set', label + '-set', values)
        self.expected.update(values)
        self.assert_preserved(self.read_settings(label + '-readback'), label)

    def check_process(self):
        if traffic.installed_version() != self.version:
            raise RuntimeError('Installed APK changed during collection; stop before the next mutation')
        actual = traffic.loaded_systemui(self.version['versionName'])
        if actual['pid'] != self.report['initialSystemuiProcess']['pid']:
            raise RuntimeError('SystemUI process changed during collection; stopping and restoring')
        self.report['latestSystemuiProcess'] = actual

    def current_profile(self):
        density = ar.shell('wm density')
        values = re.findall(r'(?:Physical|Override) density:\s*(\d+)', density)
        rotation = native_rotation(ar.shell('dumpsys input'))
        if not values:
            raise RuntimeError('Cannot establish actual native density/orientation')
        uptime = round(float(ar.shell('cat /proc/uptime').split()[0]) * 1000)
        epoch = int(ar.shell('date +%s%3N')) - uptime
        font = float(ar.shell('settings get system font_scale'))
        native_config = ar.shell('am get-config')
        directions = re.findall(r'\b(ldltr|ldrtl)\b', native_config)
        if not directions or len(set(directions)) != 1:
            raise RuntimeError('Cannot establish current native layout direction')
        return {'build': self.version['versionCode'], 'rotation': rotation, 'density': round(int(values[-1]) / 160 * 1000),
                'font': round(font * 1000), 'uptime': uptime, 'bootEpoch': epoch, 'rtl': int(directions[0] == 'ldrtl')}

    def native_settings(self):
        profile = self.current_profile()
        return {'profile': {k: profile[k] for k in ('rotation', 'density', 'font', 'rtl')},
                'density': ar.shell('wm density'), 'size': ar.shell('wm size'),
                'settings': {k: ar.shell('settings --user 0 get system ' + k)
                             for k in ('font_scale', 'user_rotation', 'accelerometer_rotation')}}

    def settled_diagnostics_before(self, folder):
        for attempt in range(6):
            raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
            try:
                parsed = ET.fromstring(raw)
                break
            except ET.ParseError:
                if attempt == 5: raise
                time.sleep(.15)
        (folder / 'diagnostics-before-private.xml').write_text(raw, encoding='utf-8')
        return {n.attrib['name']: n.text or '' for n in parsed if 'wifi_' in n.attrib.get('name', '') or 'header_spacing' in n.attrib.get('name', '')}

    def expected_runtime_values(self):
        # The legacy global mirror is retired. Reconstruct the expected runtime
        # map from this run's exact settings and the compiled matching schema;
        # the fresh WAS1 fingerprint below must match SystemUI's actual snapshot.
        schema = json.loads(RUNTIME_SCHEMA.read_text(encoding='utf-8'))
        if schema['build'] != self.version['versionCode']:
            raise RuntimeError('Runtime key schema does not match the installed build')
        expected = dict(self.baseline, **self.expected)
        if any(key not in expected for key in schema['runtimeKeys']):
            raise RuntimeError('Current settings do not contain the full runtime schema')
        values = {key: expected[key] for key in schema['runtimeKeys']}
        if not all(key in values for key in getattr(self, 'mutation_keys', KEYS)):
            raise RuntimeError('Required runtime keys absent')
        return values

    def file_hash(self, path):
        if not (re.fullmatch(re.escape(ASSETS) + r'[a-f0-9]{64}\.(asset|json)(\.bak|\.new)?', path)
                or re.fullmatch(re.escape(NOTICES) + r'[a-f0-9]{64}\.json(\.bak|\.new)?', path)):
            raise ValueError('Unowned resource path')
        raw = ar.shell('if test -L ' + shlex.quote(path) + '; then echo REFUSE_LINK; elif test -f ' + shlex.quote(path)
                       + '; then sha256sum ' + shlex.quote(path) + '; elif test -e ' + shlex.quote(path)
                       + '; then echo REFUSE_NONFILE; else echo ABSENT; fi', root=True)
        if raw == 'ABSENT':
            return None
        match = re.fullmatch(r'([a-f0-9]{64})\s+(.+)', raw)
        if not match or match[2] != path:
            raise RuntimeError('Cannot establish exact resource identity: ' + path)
        return match[1]

    def assets_state(self):
        result = {}
        hashes = self.inputs['packs']['signal-and-activity']['hashes'] + [self.inputs['missingHash']]
        for asset in hashes:
            for path in (ASSETS + asset + '.asset', ASSETS + asset + '.json', NOTICES + asset + '.json'):
                result[path] = self.file_hash(path)
                for suffix in ('.bak', '.new'):
                    if self.file_hash(path + suffix) is not None:
                        raise RuntimeError('An atomic resource write/recovery is already pending')
        return result

    def observe(self, label):
        windows = ui.all_windows(label)
        folder = self.output / label
        (folder / 'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
        return windows

    def entrance_observation(self, label):
        windows = self.observe(label)
        native = ar.shell('dumpsys activity activities')
        (self.output / label / 'activity-private.txt').write_text(native, encoding='utf-8')
        return windows, native

    def open_control(self, label):
        ar.shell('input keyevent 224')
        ar.shell('wm dismiss-keyguard')
        windows, native = self.entrance_observation(label + '-entry-before')
        if control_signature(windows) is not None:
            ar.shell('cmd statusbar collapse')
            time.sleep(.6)
            windows, native = self.entrance_observation(label + '-entry-collapsed')
        if not known_background(windows, native, self.home_component):
            raise RuntimeError('Control entry requires actual uniquely focused HOME or Duo; unknown foreground preserved')
        for opening in range(2):
            opened = int(ar.shell('date +%s%3N'))
            ar.shell('cmd statusbar expand-settings')
            time.sleep(self.settle)
            previous = None
            for sample in range(4):
                windows, native = self.entrance_observation(label + f'-entry-{opening}-{sample}')
                signature = control_signature(windows)
                if signature is not None and signature == previous:
                    return opened
                previous = signature
                time.sleep(.6)
            if opening == 0 and known_background(windows, native, self.home_component):
                continue  # Only one retry, with both fresh accessibility/native focus proving a known background.
            raise RuntimeError('Actual control panel did not stabilize; no unknown-focus retry or blind gesture')
        raise AssertionError('Bounded control entrance exhausted')

    def tap(self, label, predicate, attempts=4):
        for attempt in range(attempts):
            windows, native = self.entrance_observation(label + '-' + str(attempt))
            try:
                node = choose_node(windows, predicate)
            except ValueError:
                if attempt + 1 == attempts:
                    raise
                time.sleep(1)
                continue
            left, top, right, bottom = bounds(node)
            interactive_target(windows, native, node)
            png = ar.adb('exec-out', 'screencap -p')
            width, height = struct.unpack('>II', png[16:24])
            x, y = (left + right) // 2, (top + bottom) // 2
            if not (0 <= left < right <= width and 0 <= top < bottom <= height):
                raise RuntimeError('Observed target is clipped/outside current display')
            spacing.atomic_json(self.output / (label + '-tap.json'), {'node': node, 'x': x, 'y': y})
            ar.shell(f'input tap {x} {y}')
            return

    @staticmethod
    def text(value, package='ls.augment.com'):
        return lambda node: node.get('package') == package and value in (node.get('text'), node.get('description'))

    def import_pack(self, variant):
        pack = self.inputs['packs'][variant]
        label = 'import-' + variant
        target = merge_theme(self.baseline[ART], pack['theme'])
        self.set_values(label + '-clean-scope', {ART: self.baseline[ART]})
        remote = '/sdcard/Download/' + Path(pack['path']).name
        if ar.shell('if test -e ' + shlex.quote(remote) + '; then echo PRESENT; else echo ABSENT; fi') != 'ABSENT':
            raise RuntimeError('Staged filename already exists; will not overwrite')
        self.write_ahead({ART: target}, label + '-before-real-ui-import')
        self.journal.setdefault('retainedZips', []).append({'path': remote, 'sha256': pack['sha256']})
        self.write_ahead({}, label + '-stage')
        ar.adb('push', pack['path'], remote)
        raw = ar.shell('sha256sum ' + shlex.quote(remote))
        if raw.split()[0] != pack['sha256']:
            raise RuntimeError('Staged ZIP hash mismatch')
        ar.shell('cmd statusbar collapse')
        ar.shell('am start -W -n ls.augment.com/.StatusBarAssetsActivity --es status_assets_page share --es status_surface ' + self.surfaces[0], root=True)
        self.tap(label + '-open', self.text('导入素材包'))
        # Use only the actual visible document-picker controls, never guessed coordinates.
        is_picker = lambda n: n.get('package') in ('com.android.documentsui', 'com.google.android.documentsui')
        filename = lambda n: is_picker(n) and n.get('text') == Path(pack['path']).name
        current = self.observe(label + '-picker')
        try:
            choose_node(current, filename)
        except ValueError:
            self.tap(label + '-roots', lambda n: is_picker(n) and (n.get('id') == 'android:id/home'
                     or n.get('description') in ('显示根目录', 'Show roots', '显示导航栏', 'Open navigation drawer')))
            self.tap(label + '-downloads', lambda n: is_picker(n) and n.get('text') in ('下载', 'Downloads'))
        self.tap(label + '-file', filename)
        self.tap(label + '-preview', self.text('载入并预览'))
        # Import lands on long icon inventory; the share tab exposes the same real Apply action without scrolling that list.
        self.tap(label + '-share-tab', self.text('导入与分享'))
        self.not_before = int(ar.shell('date +%s%3N'))
        self.tap(label + '-apply', self.text('应用到状态栏'))
        self.expected[ART] = target
        time.sleep(2)
        # Finish the editor after its real save; later instrumentation may replace its process.
        self.assert_preserved(self.read_settings(label + '-applied'), label)
        files = self.assets_state()
        for asset in pack['hashes']:
            if files[ASSETS + asset + '.asset'] != asset:
                raise RuntimeError('Real import did not install the exact Android-decoded resource')
        spacing.atomic_json(self.output / (label + '-resource-readback.json'), files)
        self.report.setdefault('imports', []).append({'variant': variant, 'protocol': 'real DocumentsUI / Activity PACK=303 / preflight / install / apply',
            'scopedZip': pack, 'retainedRemoteZip': remote, 'resourceBytesVerified': True, 'pixelResult': 'pending'})
        self.progress(label + '-complete')

    def capture(self, phase, surface, require_assets=(), fallback=False):
        self.check_process()
        label = phase + '-' + surface
        folder = self.output / label
        folder.mkdir(exist_ok=True)
        case = {'phase': phase, 'surface': surface, 'label': label, 'visualReviewPending': True}
        self.report['cases'].append(case)
        self.progress(phase, surface)
        ping = None
        try:
            opened = self.open_control(label) if surface == 'control' else super().open_surface(surface)
            identity, raw = traffic.network_identity()
            if identity != self.identity:
                raise RuntimeError('LAN identity changed; will not target another gateway')
            spacing.atomic_json(folder / 'network-before-private.json', {'identity': identity, 'raw': raw})
            ping = traffic.OwnedPing(traffic.ping_command(self.ping_binary, self.ping_help, identity), folder, identity)
            time.sleep(3)
            if ping.process.poll() is not None:
                raise RuntimeError('Ping ended before real sample')
            windows = self.observe(label)
            expected_id = 'control_panel' if surface == 'control' else 'notification_stack_scroller'
            visible = [n for n in ui.nodes(windows) if n.get('visible')]
            if expected_id not in {n.get('id', '').split('/')[-1] for n in visible}:
                raise RuntimeError('Requested actual native surface is absent')
            seconds_required = self.header_seconds and phase not in ('user-baseline', 'restored')
            if self.header_seconds:
                case['headerClockBefore'] = header_clock(windows)
                spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            settled_required = self.observe_settled_fallback and bool(require_assets)
            if settled_required:
                case['settledBefore'] = {
                    'inventory': self.instrument('statusbar-assets-runtime', label + '-before-inventory')['statusbarRuntime']['inventory'],
                    'profile': self.current_profile(), 'diagnostics': self.settled_diagnostics_before(folder),
                    'geometry': [{key: n.get(key) for key in ('id', 'bounds', 'visible')} for n in ui.nodes(windows)]}
                spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            times = []
            for frame in range(8):
                if ping.process.poll() is not None:
                    raise RuntimeError('Ping expired before all animation frames; no false traffic claim')
                (folder / f'frame-{frame:02d}.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
                times.append({'frame': frame, 'hostMonotonic': time.monotonic()})
                time.sleep((.13, .27, .19, .31)[frame % 4])
            if self.header_seconds:
                case['headerClockAfter'] = header_clock(self.observe(label + '-clock-after'))
            if settled_required:
                after_windows = self.observe(label + '-settled-after')
                if control_signature(after_windows) is None:
                    raise RuntimeError('Actual focused control panel disappeared during settled samples')
                case['settledGeometryAfter'] = [{key: n.get(key) for key in ('id', 'bounds', 'visible')} for n in ui.nodes(after_windows)]
            runtime = self.instrument('statusbar-assets-runtime', label + '-inventory')['statusbarRuntime']['inventory']
            rows = [row for row in runtime.get('surfaces', {}).get(surface, []) if row.get('id') in IDS]
            case.update(wifiRows=rows, inventory=runtime, frameTimes=times,
                        geometry=[{key: n.get(key) for key in ('id', 'bounds', 'visible', 'text', 'description', 'renderingInfo')} for n in ui.nodes(windows)
                                  if any(word in n.get('id', '') for word in ('wifi', 'status_icons', 'statusIcons', 'cc_header', 'nfc', 'bluetooth', 'vibrate', 'mobile', 'battery', 'volte', 'clock', 'date', 'qs_footer_actions'))])
            # Preserve the actual fallback reason before any assertion exits and
            # restoration replaces its generation. A ready asset is not drawn.
            spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            profile = self.current_profile()
            for attempt in range(6):
                raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
                try:
                    parsed = ET.fromstring(raw)
                    break
                except ET.ParseError:
                    if attempt == 5: raise
                    time.sleep(.15)
            (folder / 'diagnostics-private.xml').write_text(raw, encoding='utf-8')
            diagnostics = {n.attrib['name']: n.text or '' for n in parsed if 'wifi_' in n.attrib.get('name', '') or 'header_spacing' in n.attrib.get('name', '') or 'header_clock_runtime_' in n.attrib.get('name', '')}
            case.update(profile=profile, diagnostics=diagnostics)
            spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            if seconds_required:
                orientation = 'landscape' if profile['rotation'] in (1, 3) else 'portrait'
                case['headerSecondsObservation'] = verify_seconds(case['headerClockBefore'], case['headerClockAfter'],
                    diagnostics.get('ls_augment_header_clock_runtime_1_' + orientation, ''))
                spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            if (runtime.get('surfaceObservedAt', {}).get(surface, 0) < opened
                    or runtime.get('runtime', {}).get('activeSurface') != surface
                    or not runtime.get('runtime', {}).get('enabled') or not runtime.get('runtime', {}).get('interactive')):
                raise RuntimeError('No fresh inventory from this exact surface')
            if phase == 'user-baseline' and any(not any(row.get('id') == identity and row.get('state') == 'visible'
                    and row.get('capability') == 'whole_layers' and not row.get('coveredBy') for row in rows) for identity in IDS):
                raise RuntimeError('Both real native Wi-Fi members must be visible and independently supported before import')
            rejection = (self.expect_capacity_rejection or self.observe_settled_fallback) and bool(require_assets)
            if not settled_required:
                require_resource_rows(rows, require_assets, self.expected[ART], surface, 'ready' if rejection else 'applied')
            if fallback and not any(row.get('id') == 'wifi.signal' and row.get('state') == 'visible' and not row.get('matchedAsset')
                                    and row.get('application') in (('native_unmapped',) if fallback == 'removed' else ('load_failed',)) for row in rows):
                raise RuntimeError('Missing hash did not report native/error fallback')
            contract_key = f'ls_augment_statusbar_wifi_spacing_contract_{surface}_{profile["rotation"]}_wifi'
            budget_key = f'ls_augment_statusbar_wifi_asset_space_{surface}_{profile["rotation"]}_wifi'
            current_environment = environment(self.expected_runtime_values())
            if settled_required:
                self.check_process()
                before = case['settledBefore']
                a = settled_snapshot(before['inventory'], before['geometry'], before['diagnostics'], before['profile'],
                                     current_environment, self.not_before, opened, self.expected[ART], require_assets,
                                     self.rejection_details.get(surface))
                b = settled_snapshot(runtime, case['settledGeometryAfter'], diagnostics, profile,
                                     current_environment, self.not_before, opened, self.expected[ART], require_assets, a['detail'])
                case['settledObservation'] = settled_pair(a, b)
                case['settledValidatedBefore'] = a; case['settledValidatedAfter'] = b
                self.rejection_details[surface] = b['detail']
                spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            if 'wifi.activity_inout' in require_assets:
                case['gifPixels'] = gif_color_observation(folder, case['geometry'])
                spacing.atomic_json(folder / 'gif-color-observation.json', case['gifPixels'])
                if rejection and case['gifPixels']['established']:
                    raise RuntimeError('GIF red/green pixels appeared despite expected native capacity rejection')
                if not rejection and not case['gifPixels']['established']:
                    raise RuntimeError('Actual GIF red/green frame alternation not established; visible/running counters are insufficient')
            if require_assets:
                if not diagnostics.get(contract_key, '').startswith('asset_cells;HSC1|'):
                    raise RuntimeError('Asset cells contract not observed; capture is fallback/unknown')
                case['budget'] = parse_budget(diagnostics.get(budget_key, ''), profile, current_environment, self.not_before,
                                              'capacity' if rejection else 'native_slot')
                edges = SMALL if phase == 'small-edges' else {key: (0, 0, 0, 0) for key in IDS}
                if rejection:
                    validate_profile(diagnostics[contract_key].split(';', 1)[1], profile, self.not_before)
                    detail_key = f'ls_augment_statusbar_wifi_asset_budget_{surface}_{profile["rotation"]}_wifi'
                    detail = parse_rejection_detail(diagnostics.get(detail_key, ''), case['budget'], profile, self.not_before,
                                                    self.rejection_details.get(surface))
                    row_nodes = [n for n in case['geometry'] if n.get('visible') and n.get('id', '').endswith('/statusIcons')]
                    if len(row_nodes) != 1 or bounds(row_nodes[0])[2] - bounds(row_nodes[0])[0] != detail['nativeRowWidth']:
                        raise RuntimeError('Current native row bounds do not match the validated WAB width origin')
                    self.rejection_details[surface] = detail
                    case.update(expectedCapacityRejectionObserved=True, nativeBudgetDetail=detail,
                                neighborPixelPreservation='pending independent PNG review; visibility/diagnostics are not a pixel pass')
                elif not accepts(case['budget'], edges):
                    raise RuntimeError('Current complete pair does not fit the measured budget')
            elif fallback:
                contract = diagnostics.get(contract_key, '')
                if not contract.startswith('native;HSC1|'):
                    raise RuntimeError('Removal/missing resource did not reestablish the native contract')
                validate_profile(contract.split(';', 1)[1], profile, self.not_before)
            case['status'] = 'evidence_collected_visual_review_pending'
            spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            self.assert_preserved(self.read_settings(label + '-readback'), label)
        except BaseException as error:
            case.update(status='incomplete', error=repr(error))
            spacing.atomic_json(folder / 'geometry-and-runtime.json', case)
            raise
        finally:
            if ping:
                case['traffic'] = ping.wait()
            self.progress(phase, surface)
        if not case['traffic']['bothDirectionsObserved']:
            raise RuntimeError('No actual ICMP reply; stop further collection')
        print(label + ': 8 frames collected; real asset/arrow/GIF pixels still require review', flush=True)
        return case

    def phase(self, name, require_assets=(), fallback=False):
        return [self.capture(name, surface, require_assets, fallback) for surface in self.surfaces]

    def restore(self):
        if not self.journal or not self.journal.get('pending'):
            return
        validate_journal(self.journal)
        self.header_seconds = self.journal.get('headerSeconds', False)
        self.mutation_keys = journal_keys(self.journal)
        self.progress('restoring')
        # Validate ownership before any restore mutation, including stopping our editor.
        remote = ar.shell('if test -f ' + LEASE + '/restore.json; then cat ' + LEASE + '/restore.json; else echo ABSENT; fi')
        cleanup_retry = remote == 'ABSENT' and self.journal.get('valuesRestored') is True
        if not cleanup_retry and (remote == 'ABSENT' or json.loads(remote).get('runId') != self.journal['runId']):
            raise RuntimeError('Foreign recovery lease; will not change configuration or remove it')
        # Only our test module activity/workers; never SystemUI or another application.
        ar.shell('am force-stop ls.augment.com')
        current = self.read_settings('recovery-current')
        assert_recoverable(current, self.journal)
        self.instrument('set', 'recovery-baseline-set', self.journal['values'])
        self.expected = dict(self.journal['values'])
        after = self.read_settings('recovery-final-readback')
        if any(after.get(k) != v for k, v in self.journal['values'].items()):
            raise RuntimeError('Restore readback mismatch; durable journal remains pending')
        if self.baseline:
            self.assert_preserved(after, 'recovery-final')
        if 'nativeSettingsBefore' in self.journal:
            actual_native = self.native_settings()
            self.report['nativeSettingsAfter'] = actual_native
            self.report['nativeSettingsUnchanged'] = actual_native == self.journal['nativeSettingsBefore']
            if not self.report['nativeSettingsUnchanged']:
                raise RuntimeError('Native profile changed externally; no native setting overwritten; recovery remains pending')
        # Existing assets/metadata are never removed or rewritten by this runner.
        before = self.journal.get('resourcesBefore', {})
        differences = {path: {'before': value, 'after': self.file_hash(path)} for path, value in before.items()
                       if value is not None and self.file_hash(path) != value}
        if differences:
            spacing.atomic_json(self.output / 'resource-preservation-differences.json', differences)
            raise RuntimeError('A pre-existing resource changed; preserve evidence and journal for review')
        self.journal.update(valuesRestored=True, valuesRestoredAt=spacing.now())
        spacing.atomic_json(self.journal_path, self.journal)
        # Exact test lease only; no recursive remove or media deletion.
        if cleanup_retry:
            ar.shell('if test -d ' + LEASE + '; then rmdir ' + LEASE + '; fi')
        else:
            ar.shell('rm ' + LEASE + '/restore.json && rmdir ' + LEASE)
        self.journal.update(pending=False, restoredAt=spacing.now())
        spacing.atomic_json(self.journal_path, self.journal)
        self.report.update(configurationRestored=True, retainedImportedAssets=self.journal.get('fixtureHashes', []),
                           retainedZips=self.journal.get('retainedZips', []))
        self.progress('restored')

    def run(self, plan_file=DEFAULT_PLAN, restore_only=False):
        if restore_only:
            self.journal = json.loads(self.journal_path.read_text(encoding='utf-8'))
            if self.journal.get('version') != self.version or not self.journal.get('pending'):
                raise RuntimeError('No pending recovery for the currently installed build')
            self.report = json.loads((self.output / 'report.json').read_text(encoding='utf-8'))
            self.baseline = json.loads((self.output / 'baseline-settings-private.json').read_text(encoding='utf-8'))
            summary.no_active_instrumentation()
            self.restore()
            return
        if self.journal_path.exists() or (self.output / 'report.json').exists():
            raise RuntimeError('Evidence directory already exists; use exact --restore-only when pending')
        if self.version['versionCode'] < 20454:
            raise RuntimeError('Wi-Fi asset spacing requires installed candidate 20454 or later')
        if self.expect_capacity_rejection and self.version['versionCode'] < 20458:
            raise RuntimeError('Expected full-native-cost rejection requires installed 20458 or later')
        if self.observe_settled_fallback and self.version['versionCode'] < 20460:
            raise RuntimeError('Settled fallback/removal inventory requires reviewed candidate 20460 or later')
        summary.no_active_instrumentation()
        pending = ar.shell("find /data/user/0/ls.augment.com/files -maxdepth 1 -type f -name '*baseline*.json*'", root=True)
        if pending:
            raise RuntimeError('An Android test baseline is still pending; restore it before this collector: ' + pending)
        if ar.shell('if test -e ' + LEASE + '; then echo PRESENT; else echo ABSENT; fi') != 'ABSENT':
            raise RuntimeError('An earlier Wi-Fi asset collector lease exists; restore it first')
        self.report['initialSystemuiProcess'] = traffic.loaded_systemui(self.version['versionName'])
        home_raw = ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME')
        self.home_component = resolve_home(home_raw)
        self.report['resolvedHomeComponent'] = self.home_component
        self.inputs = prepare_inputs(plan_file, self.output / 'scoped-inputs', self.surfaces, self.run_id)
        spacing.atomic_json(self.output / 'input-plan.json', self.inputs)
        self.baseline = self.read_settings('baseline-config')
        spacing.atomic_json(self.output / 'baseline-settings-private.json', self.baseline)
        if len(self.baseline) != 497:
            raise RuntimeError('Expected the reviewed complete 497-key schema')
        if (self.baseline.get(spacing.MASTER) not in ('1', 'true')
                or self.baseline.get('ls_augment_statusbar_position_size_only') != '0' or not all(k in self.baseline for k in self.mutation_keys)):
            raise RuntimeError('Enabled status-bar master/registered config keys are prerequisites')
        if any(row[0] == 'wifi' or row[0].startswith('wifi.') for row in theme_rows(self.baseline[ART])):
            raise RuntimeError('Existing Wi-Fi artwork requires a separate baseline design; no user binding changed')
        self.identity, network = traffic.network_identity()
        self.ping_binary = ar.shell('command -v ping')
        if self.ping_binary not in ('/system/bin/ping', '/system/xbin/ping'):
            raise RuntimeError('Native reviewed ping missing')
        self.ping_help = ar.adb('shell', self.ping_binary + ' -h 2>&1', check=False).decode('utf-8', 'replace')
        traffic.ping_command(self.ping_binary, self.ping_help, self.identity)
        spacing.atomic_json(self.output / 'network-preflight-private.json', network)
        resources = self.assets_state()
        if resources[ASSETS + self.inputs['missingHash'] + '.asset'] is not None:
            raise RuntimeError('Missing hash is actually present; no fallback experiment allowed')
        for asset in self.inputs['packs']['signal-and-activity']['hashes']:
            if resources[ASSETS + asset + '.asset'] not in (None, asset):
                raise RuntimeError('Existing resource content does not match its identity')
        self.expected = {k: self.baseline[k] for k in self.mutation_keys}
        self.journal = {'pending': True, 'runId': self.run_id, 'version': self.version, 'deviceSerial': ar.SERIAL,
            'values': dict(self.expected), 'allowedValues': {k: [self.baseline[k]] for k in self.mutation_keys}, 'resourcesBefore': resources,
            'fixtureHashes': self.inputs['packs']['signal-and-activity']['hashes'], 'startedAt': spacing.now(),
            'expectCapacityRejection': self.expect_capacity_rejection}
        if self.observe_settled_fallback:
            self.journal.update(observeSettledFallback=True, nativeSettingsBefore=self.native_settings())
        if self.header_seconds:
            if self.version['versionCode'] < 20459:
                raise RuntimeError('Header seconds/full Wi-Fi cell combination requires reviewed candidate 20459 or later')
            if self.baseline[HEADER_SECONDS] not in ('0', '1'):
                raise RuntimeError('Unknown baseline seconds value')
            self.journal.update(headerSeconds=True, nativeSettingsBefore=self.native_settings())
            # Refuse before any mutation if the actual-build runtime schema cannot fingerprint seconds.
            self.expected_runtime_values()
        spacing.atomic_json(self.journal_path, self.journal)
        self.progress('creating-recovery-lease')
        ar.shell('mkdir ' + LEASE)
        zero = spacing.merge_spacing(self.baseline[spacing.SPACING], {(surface, identity): (0, 0, 0, 0) for surface in self.surfaces for identity in IDS})
        try:
            self.write_ahead({}, 'journal-ready')
            self.phase('user-baseline')
            if self.header_seconds:
                self.set_values('header-seconds-on', {HEADER_SECONDS: '1'})
                self.phase('header-seconds-native')
            self.set_values('zero-fixture-spacing', {spacing.SPACING: zero})
            for variant, required in [('signal-only', ('wifi.signal',)), ('activity-only', ('wifi.activity_inout',)), ('signal-and-activity', IDS)]:
                self.import_pack(variant)
                dual = self.phase(variant, required)
            if not self.expect_capacity_rejection and not self.observe_settled_fallback:
                if not all(accepts(case['budget'], SMALL) for case in dual):
                    raise RuntimeError('Measured complete-pair budget rejects requested small edges; they were not saved')
                small = spacing.merge_spacing(zero, {(surface, identity): SMALL[identity] for surface in self.surfaces for identity in IDS})
                self.set_values('small-edges', {spacing.SPACING: small})
                self.phase('small-edges', IDS)
            self.set_values('remove-bindings', {ART: self.baseline[ART], spacing.SPACING: zero})
            self.phase('bindings-removed', fallback='removed')
            if not self.expect_capacity_rejection:
                if self.file_hash(ASSETS + self.inputs['missingHash'] + '.asset') is not None:
                    raise RuntimeError('Missing sentinel appeared; refusing fallback experiment')
                self.set_values('absent-hash', {ART: merge_theme(self.baseline[ART], self.inputs['missingTheme'])})
                self.phase('missing-hash-fallback', fallback=True)
            self.set_values('baseline-restored', {k: self.baseline[k] for k in self.mutation_keys})
            self.phase('restored', fallback='removed' if self.expect_capacity_rejection or self.header_seconds or self.observe_settled_fallback else False)
            self.report['status'] = 'collection_complete_visual_review_pending'
        except BaseException as error:
            self.report.update(status='incomplete', error=repr(error), traceback=traceback.format_exc())
            raise
        finally:
            try:
                self.restore()
            except BaseException as error:
                self.report.update(configurationRestored=False, restoreError=repr(error))
                raise
            finally:
                self.report['finishedAt'] = spacing.now()
                self.progress('finished')
                ar.shell('cmd statusbar collapse')


def main():
    global RUNTIME_SCHEMA
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run', action='store_true')
    mode.add_argument('--restore-only', action='store_true')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--surfaces', choices=('control', 'control,notification'), default='control')
    parser.add_argument('--input-plan', type=Path, default=DEFAULT_PLAN)
    parser.add_argument('--expect-capacity-rejection', action='store_true',
                        help='Collect three real imports expecting bounded capacity below two native canvases, then removal and restored pixels; no small-edge or missing-hash experiment')
    parser.add_argument('--header-seconds', action='store_true',
                        help='Control only: temporarily enable existing header seconds, preserve size/neighbors, and restore its exact original value')
    parser.add_argument('--observe-settled-fallback', action='store_true',
                        help='Control only: record current bounded native fallback; latched draw history is retained, never a pixel pass; no seconds or small-edge mutation')
    parser.add_argument('--runtime-schema', type=Path, default=RUNTIME_SCHEMA,
                        help='Runtime keys exported from the exact tested release classes')
    args = parser.parse_args()
    RUNTIME_SCHEMA = args.runtime_schema.resolve()
    if args.restore_only and not args.output:
        parser.error('--restore-only requires the exact original --output')
    if args.header_seconds and (args.surfaces != 'control' or args.expect_capacity_rejection or args.restore_only):
        parser.error('--header-seconds requires --run, control only, and normal capacity mode; restore-only derives ownership from its journal')
    if args.observe_settled_fallback and (args.surfaces != 'control' or args.header_seconds or args.expect_capacity_rejection or args.restore_only):
        parser.error('--observe-settled-fallback requires --run, control only, and no other evidence mode; restore-only derives ownership from its journal')
    version = traffic.installed_version()
    output = (args.output or ar.ROOT / ('out/full-function-audit-20261004/wifi-assets-' + str(version['versionCode']) + '-' + time.strftime('%Y%m%d-%H%M%S'))).resolve()
    output.mkdir(parents=True, exist_ok=True)
    ar.OUTPUT = ui.OUTPUT = output
    collector = Collector(output, version, tuple(args.surfaces.split(',')), expect_capacity_rejection=args.expect_capacity_rejection,
                          header_seconds=args.header_seconds, observe_settled_fallback=args.observe_settled_fallback)
    collector.report['workingTreeSourceVersion'] = spacing.source_version()
    collector.run(args.input_plan, args.restore_only)


if __name__ == '__main__':
    main()
