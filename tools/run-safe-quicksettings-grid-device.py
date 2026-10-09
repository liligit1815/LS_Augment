"""Opt-in portrait QS geometry/brightness collector; no tile or slider actions.

Only this collector's module keys may change. Native radio, tile list, brightness,
automatic mode, rotation and panel mode are read-only. Pixels need human review.
"""
from pathlib import Path
import argparse
import contextlib
import datetime
import hashlib
import importlib.util
import json
import math
import re
import struct
import time
import traceback

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('safe_grid_native', ROOT/'tools/run-safe-native-function-device.py')
safe = importlib.util.module_from_spec(spec); spec.loader.exec_module(safe)
P = 'ls_augment_rm_qs_'
ID = 'com.android.systemui:id/'
KEYS = {P+'grid', P+'columns', P+'rows', P+'brightness_percent'}
NATIVE = {'secure': ['sysui_qs_tiles'], 'system': ['use_control_panel', 'screen_brightness',
    'screen_brightness_mode', 'screen_auto_brightness_adj', 'screen_brightness_float',
    'user_rotation', 'accelerometer_rotation', 'font_scale']}


def bounds(node):
    value = tuple(map(int, re.findall(r'-?\d+', node.get('bounds', ''))))
    if len(value) != 4: raise ValueError('Missing native bounds')
    return value


def intersect(a, b):
    return max(a[0], b[0]), max(a[1], b[1]), min(a[2], b[2]), min(a[3], b[3])


def positive(r): return r[2] > r[0] and r[3] > r[1]


def contains(outer, inner, tolerance=2):
    return positive(inner) and all((inner[0] >= outer[0]-tolerance, inner[1] >= outer[1]-tolerance,
        inner[2] <= outer[2]+tolerance, inner[3] <= outer[3]+tolerance))


def walk(node, parents=()):
    yield node, parents
    for child in node.get('children', []): yield from walk(child, parents+(node,))


def orientation(raw):
    """Android 36 reports active INTERNAL Viewports; legacy SurfaceOrientation is fallback."""
    current = []
    for line in raw.splitlines():
        if 'Viewport INTERNAL:' not in line: continue
        if not re.search(r'\bdisplayId=0\b', line) or not re.search(r'\bisActive=\[?1\]?', line): continue
        match = re.search(r'\borientation=([0-3])\b', line)
        if not match: raise ValueError('Active internal viewport has no recognized orientation')
        current.append(int(match[1]))
    legacy = list(map(int, re.findall(r'\bSurfaceOrientation:\s*([0-3])\b', raw)))
    values = current or legacy
    if not values or len(set(values)) != 1: raise ValueError('Actual orientation is missing or ambiguous')
    if current and legacy and set(current) != set(legacy): raise ValueError('Conflicting native orientation reports')
    return values[0]


def idle_instrumentation(raw):
    # Same full-dump evidence contract as the existing native summary collector.
    if re.search(r'Unknown command|Bad activity command|Permission Denial|DUMP TIMEOUT|DeadObjectException', raw, re.I):
        raise ValueError('Activity dump unavailable')
    headers = ['ACTIVITY MANAGER SETTINGS ', 'ACTIVITY MANAGER ACTIVITIES ',
        'ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)',
        'ACTIVITY MANAGER USERS (dumpsys activity users)', 'ACTIVITY MANAGER COMPONENT-ALIAS ']
    positions = []
    for header in headers:
        hits = list(re.finditer(r'^'+re.escape(header), raw, re.M))
        if len(hits) != 1: raise ValueError('Incomplete activity report: '+header)
        positions.append(hits[0].start())
    if positions != sorted(positions): raise ValueError('Unexpected activity report ordering')
    processes = raw[positions[2]:positions[3]]
    for marker in ['  OOM levels:', '  Process OOM control (', '  Raw LRU list (',
                   '  Process LRU list (', '  mWakefulness=', '  mShuttingDown=', '  mForceBackgroundCheck=']:
        if not re.search(r'^'+re.escape(marker), processes, re.M): raise ValueError('Truncated process report')
    if re.search(r'ActiveInstrumentation\{|mClass=ComponentInfo\{|\(instrumentation\)\s*$', processes, re.M):
        return False
    markers = list(re.finditer(r'^  Active instrumentation:[ \t]*$', processes, re.M | re.I))
    if len(markers) > 1: raise ValueError('Duplicate instrumentation section')
    if markers:
        stop = processes.find('\n  OOM levels:', markers[0].end())
        if stop < 0 or processes[markers[0].end():stop].strip(): raise ValueError('Unrecognized instrumentation section')
    return True


def percent(range_info):
    minimum, maximum, current = [float(range_info[k]) for k in ('min', 'max', 'current')]
    if not all(map(math.isfinite, [minimum, maximum, current])) or maximum <= minimum or not minimum <= current <= maximum:
        raise ValueError('Native slider range is invalid')
    return math.floor((current-minimum)*100/(maximum-minimum)+.5)


def geometry(windows, size):
    entries = [item for window in windows for item in walk(window.get('root', {}))]
    panels = [(n, p) for n, p in entries if n.get('id') == ID+'control_panel' and n.get('visible')]
    if len(panels) != 1: raise ValueError('Native separated control panel is not uniquely visible')
    panel = panels[0][0]
    entries = list(walk(panel))
    pools = [(n, p) for n, p in entries if n.get('id') == ID+'control_center_all_tiles' and n.get('visible')]
    if len(pools) != 1: raise ValueError('Native regular tile pool is not uniquely visible')
    pool, ancestors = pools[0]
    scrollers = [n for n in ancestors if n.get('id') == ID+'content_scroller']
    if len(scrollers) != 1: raise ValueError('Actual native tile scroller not found')
    scroller = scrollers[0]
    clip = intersect(bounds(scroller), (0, 0, *size))
    labels = []
    for node, parents in entries:
        if node.get('id') != ID+'tile_label': continue
        text = node.get('text', '')
        if not text or text == 'null': raise ValueError('An actual tile has no readable identity')
        regular = any(parent is pool for parent in parents)
        scoped = parents[parents.index(pool)+1:] if regular else parents
        candidates = [n for n in scoped if n.get('clickable') and n.get('enabled')
            and sum(child.get('id') == ID+'tile_label' for child, _ in walk(n)) == 1]
        if not candidates: raise ValueError('Tile label has no actual clickable ancestor: '+text)
        # Outermost clickable tile, not the nested title-group action.
        target = candidates[0]
        rect, label_rect = bounds(target), bounds(node)
        visible = bool(node.get('visible') and target.get('visible'))
        item_clip = clip if any(parent is scroller for parent in parents) else intersect(bounds(panel), (0, 0, *size))
        full = visible and contains(item_clip, rect) and contains(rect, label_rect)
        labels.append({'label': text, 'regular': regular, 'clickBounds': rect, 'labelBounds': label_rect,
            'visible': visible, 'fullyReachable': full, 'targetClass': target.get('class'), 'targetId': target.get('id')})
    for regular in (True, False):
        current = [item for item in labels if item['regular'] == regular]
        names = [item['label'] for item in current]
        if len(names) != len(set(names)): raise ValueError('Duplicate tile label prevents unambiguous coverage')
    overlaps = []
    shown = [item for item in labels if item['fullyReachable']]
    for i, first in enumerate(shown):
        for second in shown[i+1:]:
            shared = intersect(first['clickBounds'], second['clickBounds'])
            if shared[2]-shared[0] > 2 and shared[3]-shared[1] > 2:
                overlaps.append([first['label'], second['label'], shared])
    rows = []
    for item in sorted([i for i in shown if i['regular']], key=lambda i: (i['clickBounds'][1], i['clickBounds'][0])):
        top = item['clickBounds'][1]
        row = next((r for r in rows if abs(r['top']-top) <= 5), None)
        if row is None: row = {'top': top, 'labels': []}; rows.append(row)
        row['labels'].append(item['label'])
    return {'tiles': labels, 'regularNames': sorted(i['label'] for i in labels if i['regular']),
        'largeNames': sorted(i['label'] for i in labels if not i['regular']), 'rows': rows,
        'poolBounds': bounds(pool), 'viewportBounds': clip, 'scrollable': bool(scroller.get('scrollable')),
        'forward': any(a in scroller.get('actionIds', []) for a in (4096, 16908346)),
        'backward': any(a in scroller.get('actionIds', []) for a in (8192, 16908344)), 'overlaps': overlaps}


def scroll_path(data):
    # Restrict the whole gesture to the observed regular-grid area. It cannot
    # cross the brightness, volume, media, or large-tile controls above it.
    area = intersect(data['viewportBounds'], data['poolBounds'])
    width, height = area[2]-area[0], area[3]-area[1]
    if width < 80 or height < 160: raise ValueError('No safe observed tile-only swipe corridor')
    margin = max(16, min(45, height//6))
    x = (area[0]+area[2])//2
    return (x, area[3]-margin, x, area[1]+margin)


class Journal:
    def __init__(self, path, baseline=None, metadata=None):
        self.path = Path(path)
        self.data = json.loads(self.path.read_text(encoding='utf-8')) if baseline is None else {
            'schema': 1, 'kind': 'safe-quicksettings-grid', 'pending': True, 'baseline': baseline,
            'metadata': metadata, 'restore': {}, 'allowed': {}, 'history': []}
        if self.data.get('kind') != 'safe-quicksettings-grid': raise ValueError('Wrong recovery journal')
        if baseline is not None: self.save()

    def save(self): safe.atomic(self.path, self.data)

    def plan(self, values):
        if not values or not set(values) <= KEYS: raise ValueError('Mutation is outside the four-key whitelist')
        for key, value in values.items():
            if key not in self.data['baseline'] or not isinstance(value, str): raise ValueError('Unknown configuration key/type')
            original = self.data['baseline'][key]
            self.data['restore'].setdefault(key, original)
            known = self.data['allowed'].setdefault(key, [original])
            if value not in known: known.append(value)
        self.data['pending'] = True
        self.data['history'].append({'at': datetime.datetime.now().isoformat(), 'attemptedValues': values})
        self.save()  # write-ahead before a possibly successful but disconnected call

    def recovery_values(self, current):
        if not set(self.data['restore']) <= KEYS: raise ValueError('Journal contains foreign mutable keys')
        for key, original in self.data['restore'].items():
            if original != self.data['baseline'].get(key): raise ValueError('Journal baseline identity differs')
            if current.get(key) not in self.data['allowed'].get(key, []):
                raise ValueError('Unrecognized later value; refusing to overwrite '+key)
        return {k: v for k, v in self.data['restore'].items() if current.get(k) != v}

    def verify_before_mutation(self, current):
        self.recovery_values(current)
        for key in KEYS-self.data['restore'].keys():
            if current.get(key) != self.data['baseline'].get(key):
                raise ValueError('Previously untouched test key changed; refusing to overwrite '+key)

    def restore(self, instrument):
        current = instrument('snapshot', 'restore-before')['settings']
        values = self.recovery_values(current)
        if values: instrument('set', 'restore-owned-values', values)
        after = instrument('snapshot', 'restore-readback')['settings']
        differences = {key: {'before': self.data['baseline'].get(key), 'after': after.get(key)}
            for key in set(self.data['baseline']) | set(after) if self.data['baseline'].get(key) != after.get(key)}
        self.data.update(configurationRestored=not differences, configurationDifferences=differences, pending=bool(differences))
        self.save()
        if differences: raise ValueError('Final complete configuration differs; retained pending journal, foreign values untouched')


class Collector(safe.Runner):
    def __init__(self, ar, folder, journal, report):
        super().__init__(ar, folder, journal, report)
        # Restore-only retries retain all earlier instrumentation evidence.
        self.sequence=max([0]+[int(match[1]) for path in folder.iterdir()
            if (match:=re.match(r'^(\d+)-',path.name))])

    def instrument(self, operation, label, values=None):
        result = super().instrument(operation, label, values)
        if result.get('moduleVersion') != self.journal.data['metadata']['installedVersion']:
            raise ValueError('Instrumentation APK build does not match installed module')
        return result

    def native(self):
        return {namespace+'/'+key: self.ar.shell('settings --user 0 get '+namespace+' '+key)
            for namespace, keys in NATIVE.items() for key in keys}

    def set(self, label, values):
        if not self.runtime_current('com.android.systemui', label): raise ValueError('SystemUI current process/build gate failed')
        before = self.instrument('snapshot', label+'-before')['settings']
        self.journal.verify_before_mutation(before)
        if before.get('ls_augment_rm_full_brightness') != '0': raise ValueError('Full brightness became enabled; preserve it and stop')
        self.check_profile(label)
        self.journal.plan(values)
        self.instrument('set', label, values)
        actual = self.instrument('snapshot', label+'-readback')['settings']
        if any(actual.get(key) != value for key, value in values.items()): raise ValueError('Exact config readback differs')
        time.sleep(.8)

    def check_profile(self, label):
        actual = self.native()
        before = self.journal.data['metadata']['nativeBaseline']
        # Refuse a changed rotation, mode, theme scale or tile list; never set it back.
        fixed = ['secure/sysui_qs_tiles', 'system/use_control_panel', 'system/user_rotation',
            'system/accelerometer_rotation', 'system/font_scale', 'system/screen_brightness_mode']
        if any(actual[k] != before[k] for k in fixed): raise ValueError('Native panel profile changed; preserving new native settings')
        raw = self.ar.shell('dumpsys input')
        (self.folder/(label+'-input.txt')).write_text(raw, encoding='utf-8')
        if orientation(raw) != 0: raise ValueError('Portrait-only collector; actual orientation changed')
        return actual

    def observe_full(self, label):
        windows = self.ui.all_windows(label)
        report = json.loads((self.folder/label/'result-private.json').read_text(encoding='utf-8'))
        if report.get('observerSchema') != 2: raise ValueError('Install the supplied read-only RangeInfo observer APK first')
        png = self.ar.adb('exec-out', 'screencap', '-p')
        if png[:8] != b'\x89PNG\r\n\x1a\n': raise ValueError('Screenshot unavailable')
        size = struct.unpack('>II', png[16:24])
        if size[0] >= size[1]: raise ValueError('Screenshot is not portrait')
        (self.folder/label/'screen.png').write_bytes(png)
        return windows, size

    def open_panel(self, label):
        self.ar.shell('input keyevent KEYCODE_WAKEUP')
        self.ar.shell('wm dismiss-keyguard')
        self.ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
        self.check_profile(label)
        self.ar.shell('cmd statusbar collapse'); time.sleep(.4)
        png=self.ar.adb('exec-out','screencap','-p')
        if png[:8] != b'\x89PNG\r\n\x1a\n':raise ValueError('Display size unavailable before native pull-down')
        width,height=struct.unpack('>II',png[16:24]);x=round(width*.85)
        self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(height*.65)));time.sleep(1)
        last_error, previous = None, None
        for attempt in range(4):
            evidence = label+'-open-'+str(attempt)
            windows, size = self.observe_full(evidence)
            try:
                data = geometry(windows, size)
                signature = (data['poolBounds'], data['viewportBounds'],
                    [(item['label'],item['clickBounds'],item['labelBounds'],item['visible']) for item in data['tiles']])
                if data['regularNames'] and data['largeNames'] and signature == previous:
                    return evidence, windows, size, data
                previous = signature
            except ValueError as error: last_error = str(error)
            time.sleep(.45)
        raise ValueError('Separated panel did not become observable: '+str(last_error))

    def grid(self, label, expected=None, dimensions=None):
        evidence, windows, size, data = self.open_panel(label)
        # Reopening the native panel may preserve scrollY from the preceding
        # phase. Restore its observed scroll position through native gestures,
        # never by changing the tile order/list or writing native view fields.
        for reset in range(12):
            if not data['backward']: break
            x1,y1,x2,y2 = scroll_path(data)
            safe.atomic(self.folder/(label+'-top-'+str(reset)+'.json'), {'kind':'native-scroll-only',
                'gesture':[x2,y2,x1,y1], 'durationMillis':450, 'tileActions':False})
            self.ar.shell('input swipe %d %d %d %d 450'%(x2,y2,x1,y1)); time.sleep(.6)
            evidence=label+'-at-top-'+str(reset)
            windows,size=self.observe_full(evidence);data=geometry(windows,size)
        else: raise ValueError('Native scroll top not reached within bounded observations')
        phase = {'case': label, 'samples': [], 'allLabelsReachable': False, 'pixelReviewRequired': True}
        self.report['cases'].append(phase); self.persist()
        observed_regular, observed_large, reached = set(), set(), set()
        for index in range(12):
            if index:
                evidence = label+'-scroll-'+str(index)
                windows, size = self.observe_full(evidence); data = geometry(windows, size)
            data['evidence'] = evidence
            phase['samples'].append(data)
            observed_regular.update(data['regularNames']); observed_large.update(data['largeNames'])
            reached.update(i['label'] for i in data['tiles'] if i['fullyReachable'])
            self.persist()
            if data['overlaps']: raise ValueError('Observed complete native tile click rectangles overlap')
            if index == 0 and dimensions:
                columns, rows = dimensions
                if len(data['rows']) != rows or not data['rows'] or len(data['rows'][0]['labels']) != min(columns, len(data['regularNames'])):
                    raise ValueError('Initial complete regular tile rows/columns differ from requested layout')
            if not data['forward']:
                break
            x1, y1, x2, y2 = scroll_path(data)
            safe.atomic(self.folder/(label+'-swipe-'+str(index)+'.json'), {'kind': 'native-scroll-only', 'bounds': data['viewportBounds'],
                'gesture': [x1,y1,x2,y2], 'durationMillis': 450, 'tileActions': False})
            self.ar.shell('input swipe %d %d %d %d 450'%(x1,y1,x2,y2)); time.sleep(.6)
        else: raise ValueError('Native scroll end not reached within twelve observations')
        identities = {'regular': sorted(observed_regular), 'large': sorted(observed_large)}
        if expected is not None and identities != expected: raise ValueError('Actual complete tile labels differ from baseline')
        missing = (observed_regular | observed_large)-reached
        phase.update(identities=identities, unreachedLabels=sorted(missing), allLabelsReachable=not missing,
            nativeSettings=self.check_profile(label+'-end'))
        self.persist()
        if missing: raise ValueError('Some actual tile targets/labels were never fully reachable: '+str(sorted(missing)))
        print(label+': '+str(len(observed_regular))+' regular / '+str(len(observed_large))+' large tiles, native geometry collected',flush=True)
        return identities

    def brightness(self, label):
        evidence, windows, size, _ = self.open_panel(label)
        sliders = [n for w in windows for n, _ in walk(w.get('root', {})) if n.get('id') == ID+'brightness_slider' and n.get('visible')]
        if len(sliders) != 1: raise ValueError('Unique native brightness slider unavailable')
        ranges = [n for n, _ in walk(sliders[0]) if n.get('visible') and n.get('rangeInfo') is not None]
        if len(ranges) != 1: raise ValueError('Unique readonly native brightness RangeInfo unavailable; value not guessed')
        native = self.check_profile(label+'-sample')
        result = {'case': label, 'evidence': evidence, 'brightnessBounds': bounds(sliders[0]),
            'rangeInfo': ranges[0]['rangeInfo'], 'expectedDisplayedPercent': percent(ranges[0]['rangeInfo']),
            'nativeSettings': native, 'overlayAppearancePassed': None, 'pixelReviewRequired': True}
        self.report['cases'].append(result); self.persist()
        from PIL import Image
        with Image.open(self.folder/evidence/'screen.png') as image:
            image.crop(intersect(bounds(sliders[0]), (0, 0, *size))).save(self.folder/evidence/'brightness.png')
        return result

    def restore(self):
        errors = []
        try: self.journal.restore(self.instrument)
        except BaseException: errors.append(traceback.format_exc())
        try:
            after = self.native()
            self.report['nativeReadback'] = after
            self.report['nativeSettingsUnchanged'] = after == self.journal.data['metadata']['nativeBaseline']
            self.report['nativeSettingsNeverWritten'] = True
        except BaseException: errors.append(traceback.format_exc())
        self.report.update(configurationRestored=self.journal.data.get('configurationRestored', False),
            restorePending=self.journal.data['pending'], cleanupErrors=errors)
        if not errors and self.report.get('nativeSettingsUnchanged') is False:
            self.report['nativeReadbackLimit']='Native settings changed during observation; collector never writes them and preserves the current values. Do not count this as an unchanged-native-state pass.'
        self.persist()
        if errors: raise RuntimeError('Recovery incomplete; use restore-only after reviewing journal: '+str(self.journal.path))


def pending_gate(exclude=None):
    patterns = ['native-safe-*/restore.json', 'header-safe-*/restore.json', 'quicksettings-grid-safe-*/restore.json',
        'wifi-assets-*/restore.json', 'wifi-spacing-traffic-*/restore.json', 'c17-spacing-*/restore.json']
    for pattern in patterns:
        for path in safe.AUDIT.glob(pattern):
            if exclude is not None and path.resolve() == exclude.resolve(): continue
            data = json.loads(path.read_text(encoding='utf-8'))
            if data.get('pending'): raise ValueError('Resolve pending prior test first: '+str(path))


def device_pending_gate(ar):
    pending = ar.shell("find /data/user/0/ls.augment.com/files -maxdepth 1 -type f -name '*baseline*.json*'",root=True)
    if pending: raise ValueError('Android test baseline is still pending; no snapshot/set attempted: '+pending)
    lease = ar.shell('if test -e /data/local/tmp/duo-wifi-assets-collector; then echo PRESENT; else echo ABSENT; fi')
    if lease != 'ABSENT': raise ValueError('Wi-Fi asset collector lease present/unknown; no concurrent operation')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--run', action='store_true'); group.add_argument('--restore-only', type=Path)
    parser.add_argument('--expected-version', type=int, required=True)
    parser.add_argument('--cases', default='grid,brightness')
    args = parser.parse_args()
    selected=list(dict.fromkeys(x.strip() for x in args.cases.split(',') if x.strip()))
    if not selected or any(x not in ('grid','brightness') for x in selected):parser.error('Expected grid,brightness or either one')
    import adb_regression as ar
    dump = ar.shell('dumpsys package ls.augment.com')
    version = int(re.search(r'\bversionCode=(\d+)', dump)[1]); name = re.search(r'\bversionName=([^\s]+)', dump)[1]
    if version != args.expected_version: raise ValueError('Installed module differs from expected build')
    pending_gate(args.restore_only)
    activity = ar.shell('dumpsys activity', timeout=90)
    if not idle_instrumentation(activity): raise ValueError('Other instrumentation is active; no operation performed')
    device_pending_gate(ar)
    if args.restore_only:
        journal = Journal(args.restore_only.resolve())
        metadata = journal.data['metadata']
        if metadata['serial'] != ar.SERIAL or metadata['installedVersion'] != version:
            raise ValueError('Journal device/build mismatch')
        folder = journal.path.parent
        report = json.loads((folder/'report.json').read_text(encoding='utf-8'))
        collector = Collector(ar, folder, journal, report); collector.restore()
        print(json.dumps({'report':str(folder/'report.json'), 'configurationRestored':journal.data.get('configurationRestored'), 'pending':journal.data['pending']})); return
    folder = safe.AUDIT/('quicksettings-grid-safe-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')))
    folder.mkdir(parents=True); ar.OUTPUT = folder
    (folder/'activity-preflight.txt').write_text(activity, encoding='utf-8')
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output): baseline = ar.instrument('snapshot', 'baseline')
    if baseline.get('moduleVersion') != version: raise ValueError('Test APK mismatch; no setting was changed')
    if baseline['settings'].get('ls_augment_rm_full_brightness') != '0':
        raise ValueError('Full brightness is enabled/unknown; cannot isolate overlay without changing brightness behavior')
    native = {namespace+'/'+key: ar.shell('settings --user 0 get '+namespace+' '+key) for namespace,keys in NATIVE.items() for key in keys}
    if native['system/use_control_panel'] != '1': raise ValueError('Current native panel mode is not separated; mode was not changed')
    raw = ar.shell('dumpsys input'); (folder/'input-preflight.txt').write_text(raw, encoding='utf-8')
    if orientation(raw) != 0: raise ValueError('Current actual orientation is not portrait; rotation was not changed')
    journal = Journal(folder/'restore.json', baseline['settings'], {'serial':ar.SERIAL, 'installedVersion':version,
        'installedVersionName':name, 'nativeBaseline':native, 'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()})
    report = {'installedVersion':version, 'features':[{'grid':'V2-160','brightness':'V2-143'}[x] for x in selected], 'cases':[], 'wholeFeaturePassed':False,
        'visualReviewRequired':True, 'limits':['Current portrait separated control center only',
        'Native tiles only scrolled, never clicked; edit/reorder/landscape/merged mode untested',
        'No writes to native settings, brightness, automatic mode, tile list or radio state',
        'Accessibility rectangles document observed geometry; screenshots require independent label/pixel review',
        'Brightness overlay is drawn in ViewOverlay and may be absent from accessibility text'], 'status':'started'}
    collector = Collector(ar, folder, journal, report); collector.persist()
    try:
        if not collector.runtime_current('com.android.systemui', 'preflight'): raise ValueError('Installed module is not loaded in current SystemUI')
        if 'grid' in selected:
            initial = collector.grid('user-baseline')
            collector.set('grid-off', {P+'grid':'0'})
            expected = collector.grid('native-grid-off', initial)
            collector.set('grid-3x1', {P+'grid':'1', P+'columns':'3', P+'rows':'1'})
            collector.grid('grid-3x1', expected, (3,1))
            collector.set('grid-5x2', {P+'grid':'1', P+'columns':'5', P+'rows':'2'})
            collector.grid('grid-5x2', expected, (5,2))
            collector.set('grid-off-again', {P+'grid':'0'})
            collector.grid('grid-off-again', expected)
            collector.grid('grid-off-reopened', expected)
        if 'brightness' in selected:
            samples=[]
            for label, enabled in [('brightness-off','0'), ('brightness-on','1'), ('brightness-off-again','0')]:
                collector.set(label, {P+'brightness_percent':enabled})
                samples.append(collector.brightness(label))
            report['brightnessNativeRangeStable'] = all(s['rangeInfo'] == samples[0]['rangeInfo'] for s in samples)
        report['status'] = 'observed_visual_review_pending'
    except BaseException:
        report['status']='failed'; report['error']=traceback.format_exc(); raise
    finally:
        collector.persist()
        try:
            collector.restore()
            if report.get('status') != 'failed':
                try:
                    if 'grid' in selected: collector.grid('user-restored', initial)
                    else: collector.brightness('user-restored')
                except BaseException:
                    report['status']='restored_geometry_incomplete';report['restoredGeometryError']=traceback.format_exc();raise
        finally:
            # No process kill, fixture deletion or native-preference restoration.
            # Only dismiss the panel this collector opened.
            ar.shell('cmd statusbar collapse')
            collector.persist()
            print(json.dumps({'report':str(folder/'report.json'), 'configurationRestored':journal.data.get('configurationRestored'), 'pending':journal.data['pending']},ensure_ascii=False))


if __name__ == '__main__': main()
