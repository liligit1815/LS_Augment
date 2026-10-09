"""Offline ownership/input primitives for the finite A/B row collector."""
from pathlib import Path
import json
import os
import re
import time

SYSTEM = 'ls_augment_statusbar_system_two_rows'
NOTIFICATIONS = 'ls_augment_statusbar_notification_two_rows'
ART = 'ls_augment_statusbar_artwork_v1'
FONT = 'ls_augment_statusbar_fonts_v1'
AB_CASES = ('current-assets-lock', 'profiles')
CASES = (*AB_CASES, 'notification-icons')
FRESH_SECONDS = 2.5


class Unobserved(RuntimeError): pass


def atomic(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + '.tmp')
    with temporary.open('w', encoding='utf-8', newline='\n') as out:
        json.dump(value, out, ensure_ascii=False, indent=2)
        out.write('\n'); out.flush(); os.fsync(out.fileno())
    os.replace(temporary, path)


def difference(a, b):
    return {k: {'expected': a.get(k), 'actual': b.get(k)}
            for k in a.keys() | b.keys() if a.get(k) != b.get(k)}


def allowed_keys(case):
    if case not in CASES: raise ValueError('Unknown finite case')
    return {SYSTEM, NOTIFICATIONS, ART, FONT} if case == CASES[0] else {SYSTEM, NOTIFICATIONS}


class Journal:
    """Only latest confirmed value and ONE unresolved transport are ownership.

    Prepared operations and history never enlarge recovery authority. A transport
    failure may have reached Android; its exact before/target pair remains pending.
    """
    KIND = 'safe-statusbar-rows-closure'

    def __init__(self, path, data=None):
        self.path = Path(path)
        self.data = json.loads(self.path.read_text('utf-8')) if data is None else data
        self.validate()
        if data is not None: self.save()

    def save(self): atomic(self.path, self.data)

    @classmethod
    def create(cls, path, baseline, metadata, resources, names, targets):
        return cls(path, dict(kind=cls.KIND, schema=1, pending=True,
            baseline=baseline, metadata=metadata, resourcesBefore=resources,
            namesBefore=names, targets=targets, restore={}, confirmed={}, inflight={},
            nativeRestore={}, nativeConfirmed={}, nativeInflight={}, operations=[],
            attemptedKeys=[], acknowledgedChangedKeys=[], configurationRestored=False))

    def validate(self):
        d = self.data; m = d.get('metadata', {})
        if d.get('kind') != self.KIND or d.get('schema') != 1: raise ValueError('Foreign journal')
        keys = allowed_keys(m.get('case'))
        b = d.get('baseline', {})
        if len(b) != 497 or not all(isinstance(k, str) and isinstance(v, str) for k, v in b.items()) or not keys <= b.keys():
            raise ValueError('Complete registered 497-string baseline required')
        required = ('serial', 'installedVersion', 'installedVersionName', 'mainApkSha256',
                    'testApkSha256', 'process', 'nativeBaseline', 'notificationsBefore',
                    'homeComponent', 'runId', 'observerApkSha256', 'runtimeSchema')
        if any(k not in m for k in required): raise ValueError('Incomplete durable identity/environment')
        if not isinstance(d.get('resourcesBefore'), dict) or not isinstance(d.get('namesBefore'), dict):
            raise ValueError('Missing resources/names')
        if not isinstance(m['nativeBaseline'], dict) or 'system/font_scale' not in m['nativeBaseline']:
            raise ValueError('Missing native font baseline')
        if any(m['nativeBaseline'].get(k) != '0' for k in ('system/user_rotation','system/accelerometer_rotation')):
            raise ValueError('Only original locked portrait rotation 0 is supported')
        targets = d.get('targets')
        if not isinstance(targets, dict) or set(targets) != ({ART, FONT} if m['case'] == CASES[0] else set()):
            raise ValueError('Wrong exact asset targets')
        for field in ('restore', 'confirmed', 'inflight'):
            if not isinstance(d.get(field), dict) or not set(d[field]) <= keys: raise ValueError('Foreign key')
        if not set(d['confirmed']) <= d['restore'].keys() or not set(d['inflight']) <= d['restore'].keys():
            raise ValueError('Ownership without original')
        if any(v != b[k] for k, v in d['restore'].items()): raise ValueError('Altered original')
        for k, v in d['confirmed'].items(): self.values({k: v})
        for k, v in d['inflight'].items():
            if not isinstance(v, list) or len(v) != 2: raise ValueError('Invalid unresolved transport')
            for x in v: self.values({k: x})
        for field in ('nativeRestore', 'nativeConfirmed', 'nativeInflight'):
            if not isinstance(d.get(field), dict) or not set(d[field]) <= {'system/font_scale', 'system/user_rotation'}:
                raise ValueError('Foreign native mutation')
            if d[field] and m['case'] != 'profiles': raise ValueError('Assets case cannot change native preferences')
        if any(v != m['nativeBaseline'][k] for k, v in d['nativeRestore'].items()): raise ValueError('Altered native original')
        for field in ('nativeConfirmed', 'nativeInflight'):
            if not set(d[field]) <= d['nativeRestore'].keys(): raise ValueError('Native ownership lacks original')
        for k, v in d['nativeConfirmed'].items(): self.native_value(k, v)
        for k, values in d['nativeInflight'].items():
            if not isinstance(values, list) or len(values) != 2: raise ValueError('Invalid native transport')
            for v in values: self.native_value(k, v)

    def values(self, values):
        if not values or not set(values) <= allowed_keys(self.data['metadata']['case']): raise ValueError('Foreign mutation')
        for k, v in values.items():
            if not isinstance(v, str): raise ValueError('Non-string configuration')
            legal = ('0', '1') if k in (SYSTEM, NOTIFICATIONS) else (self.data['baseline'][k], self.data['targets'][k])
            if v not in legal: raise ValueError('Value outside exact plan')

    def native_value(self, key, value):
        if self.data['metadata']['case'] != 'profiles' or key not in ('system/font_scale','system/user_rotation'): raise ValueError('Foreign native key')
        legal = ('0','1') if key == 'system/user_rotation' else ('1.0', '1.3', self.data['metadata']['nativeBaseline'][key])
        if value not in legal: raise ValueError('Foreign native value')

    def expected(self, native=False):
        d = self.data
        return dict(d['metadata']['nativeBaseline'] if native else d['baseline'],
                    **d['nativeConfirmed' if native else 'confirmed'])

    def owns(self, key, value, native=False):
        d = self.data; before = d['metadata']['nativeBaseline'] if native else d['baseline']
        confirmed = d['nativeConfirmed' if native else 'confirmed']
        pending = d['nativeInflight' if native else 'inflight']
        # A durable prepared record alone cannot prove that transport was called.
        # Crash before a post-call receipt leaves the target unclaimed, pending
        # manual recovery; it never adopts a coincidental external value.
        kind = 'native' if native else 'module'
        recent = next((o for o in reversed(d['operations']) if o['kind'] == kind), None)
        invoked = recent is not None and recent.get('transportInvoked') is True
        return value in [confirmed.get(key, before[key]), *(pending.get(key, []) if invoked else [])]

    def conflicts(self, current, native=False):
        d = self.data; expected = self.expected(native)
        diff = difference(expected, current)
        restores = d['nativeRestore' if native else 'restore']
        return {k: v for k, v in diff.items() if k not in restores or not self.owns(k, current.get(k), native)}

    def begin(self, values, current, label, native=False, recovery=False):
        if native:
            for k, v in values.items(): self.native_value(k, v)
        else: self.values(values)
        before = self.data['metadata']['nativeBaseline'] if native else self.data['baseline']
        if recovery:
            if any(v != before[k] or not self.owns(k, current.get(k), native) for k, v in values.items()):
                raise Unobserved('Recovery may only restore exact currently owned originals')
        elif self.conflicts(current, native): raise Unobserved('External state changed; no transport')
        d = self.data; prefix = 'native' if native else ''
        restore = d['nativeRestore' if native else 'restore']
        inflight = d['nativeInflight' if native else 'inflight']
        if inflight: raise Unobserved('Prior transport unresolved; no further save')
        previous_restore = dict(restore)
        for k, v in values.items(): restore.setdefault(k, before[k]); inflight[k] = [current[k], v]
        operation = dict(label=label, kind=prefix or 'module', values=dict(values), before={k: current[k] for k in values},
                         stage='transport-prepared', transportInvoked=False, priorRestore=previous_restore)
        d['operations'].append(operation); d['pending'] = True
        self.save()
        return operation

    def not_invoked(self, operation):
        native = operation['kind'] == 'native'; d = self.data
        d['nativeInflight' if native else 'inflight'].clear()
        d['nativeRestore' if native else 'restore'] = operation['priorRestore']
        operation['stage'] = 'not-invoked'; operation['transportInvoked'] = False; self.save()

    def acknowledge(self, values, actual, native=False, recovery=False):
        d = self.data; pending = d['nativeInflight' if native else 'inflight']
        if set(values) != set(pending) or any(v != pending[k][1] for k, v in values.items()): raise ValueError('Unowned acknowledgement')
        mismatch = any(actual.get(k) != v for k, v in values.items()) if recovery else difference(dict(self.expected(native), **values), actual)
        if mismatch: raise Unobserved('Readback mismatch; keep exact inflight')
        d['nativeConfirmed' if native else 'confirmed'].update(values); pending.clear()
        if not native:
            d['acknowledgedChangedKeys'] = sorted(set(d['acknowledgedChangedKeys']) | {k for k, v in values.items() if v != d['baseline'][k]})
        self.save()

    def settle_inflight(self, current, native=False):
        d = self.data; field = 'nativeInflight' if native else 'inflight'
        confirmed = d['nativeConfirmed' if native else 'confirmed']; external = {}
        for key in list(d[field]):
            if self.owns(key, current.get(key), native): confirmed[key] = current[key]
            else: external[key] = current.get(key)
            d[field].pop(key)
        self.save()
        return external


def invoke_logged(path, command, callback, observed_at, deadline, *, journal=None, values=None,
                  current=None, native=False, recovery=False, clock=time.monotonic):
    """No callback if logging, journal persistence or the final age check fails."""
    def fresh():
        now = clock()
        if now > deadline or not 0 <= now - observed_at <= FRESH_SECONDS: raise Unobserved('Input deadline expired; zero input')
        return now
    start = fresh(); event = dict(command=command, observedAt=observed_at, preparedAt=start,
                                  transportInvoked=False, phase='prepared')
    atomic(path, event)  # A failed action log has no pending input/config claim.
    operation = None; invoked = False
    try:
        if journal is not None:
            operation = journal.begin(values, current, Path(path).stem, native, recovery)
        fresh()
        invoked = True; event['phase'] = 'transport-entered'; event['transportInvoked'] = True
        if operation is not None: operation['transportInvoked'] = True; operation['stage'] = 'transport-entered'
        result = callback()
        event['phase'] = 'transport-returned'; return result
    except BaseException as error:
        event['error'] = repr(error)
        if not invoked and operation is not None: journal.not_invoked(operation)
        raise
    finally:
        event['completedAt'] = clock()
        if operation is not None and invoked:
            operation['stage'] = event['phase']; operation['completedAt'] = event['completedAt']
            if not native: journal.data['attemptedKeys'] = sorted(set(journal.data['attemptedKeys']) | set(values))
            journal.save()
        atomic(path, event)


def rect(value):
    values = tuple(map(int, re.findall(r'-?\d+', value or '')))
    if len(values) != 4: raise Unobserved('Malformed bounds')
    return values


def overlaps(a, b): return a[0] < a[2] and a[1] < a[3] and b[0] < b[2] and b[1] < b[3] and a[0] < b[2] and a[2] > b[0] and a[1] < b[3] and a[3] > b[1]
def inside(a, b): return b[0] <= a[0] < a[2] <= b[2] and b[1] <= a[1] < a[3] <= b[3]


def focus_title(raw):
    found = re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu\d+\s+([^\s}]+)\s*\}', raw)
    if len(found) != 1: raise Unobserved('Native focus missing/ambiguous')
    return found[0]


def window_records(raw):
    if not raw.startswith('WINDOW MANAGER WINDOWS (dumpsys window windows)'): raise Unobserved('Incomplete native window dump')
    blocks = re.split(r'(?m)^\s*Window #(?=\d+ Window\{)', raw)[1:]
    if not blocks: raise Unobserved('No native window ordering')
    records = []
    for block in blocks:
        if not re.search(r'\bisVisible=true\b', block) or 'mHasSurface=true' not in block or 'shown=true' not in block: continue
        rank = re.match(r'(\d+) Window\{[^\n}]*?\bu0\s+([^}]+)\}', block)
        pkg = re.search(r'\bpackage=([\w.]+)', block)
        frame = re.search(r'Frames:.*?\bframe=(\[[-\d,]+\]\[[-\d,]+\])', block)
        display = re.search(r'mDisplayId=(\d+)', block)
        layer = re.search(r'mBaseLayer=(-?\d+)\s+mSubLayer=(-?\d+)', block)
        pid = re.search(r'mSession=Session\{\S+\s+(\d+):', block)
        if not all((rank, pkg, frame, display, layer, pid)) or display[1] != '0': raise Unobserved('Shown native window identity/ordering unknown')
        bounds = rect(frame[1])
        if bounds[2] < bounds[0] or bounds[3] < bounds[1]: raise Unobserved('Negative native window size')
        records.append(dict(rank=int(rank[1]), title=rank[2], package=pkg[1], bounds=bounds,
                            base=int(layer[1]), sub=int(layer[2]), pid=int(pid[1]), notTouchable='NOT_TOUCHABLE' in block))
    if not records: raise Unobserved('No shown native surfaces')
    return records


def native_edge(record, size, system_pid):
    if record['package'] != 'com.android.systemui' or record['pid'] != int(system_pid): return False
    l, t, r, b = record['bounds']; w, h = size; title = record['title']
    if not inside((l, t, r, b), (0, 0, w, h)): return False
    return ((title == 'StatusBar' and l == t == 0 and r == w and b <= h * .15)
        or (title == 'NavigationBar0' and l == 0 and r == w and b == h and h - t <= h * .15)
        or (title == 'GestureStubLeft' and l == 0 and r <= w * .12)
        or (title == 'GestureStubRight' and r == w and w - l <= w * .12))


def canonical_component(value):
    if not re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+', value): raise Unobserved('Unknown native component')
    package, activity = value.split('/')
    return package + '/' + (package + activity if activity.startswith('.') else activity)


def primary_rotation(raw):
    """Actual primary-display angle, not merely PNG landscape/portrait shape."""
    header='WINDOW MANAGER DISPLAY CONTENTS (dumpsys window displays)'
    if raw.count(header)!=1:raise Unobserved('Incomplete WindowManager rotation dump')
    raw=raw.split(header,1)[1].split('\nWINDOW MANAGER ',1)[0]
    blocks=list(re.finditer(r'(?m)^  Display: mDisplayId=(\d+)\b',raw))
    primary=[(i,m) for i,m in enumerate(blocks) if m[1]=='0']
    if len(primary)!=1:raise Unobserved('Primary display rotation section missing/ambiguous')
    i,match=primary[0];section=raw[match.end():blocks[i+1].start() if i+1<len(blocks) else len(raw)]
    angles=re.findall(r'(?m)^    mRotation=([0-3]) mDeferredRotationPauseCount=\d+\s*$',section)
    modes=re.findall(r'(?m)^    mUserRotationMode=(USER_ROTATION_\w+) mUserRotation=ROTATION_(0|90|180|270)\b',section)
    if len(angles)!=1 or len(modes)!=1:raise Unobserved('Actual primary display rotation/mode unknown')
    mode,user=modes[0]
    return {'displayId':0,'actualRotation':angles[0],'userRotation':str(int(user)//90),'mode':mode}


def native_owner(native, wm, size, components, system_pid):
    """Orientation transition proof without creating a UiAutomation connection.

    Used only for non-coordinate launch/HOME between exact owned activities/HOME.
    Does not manufacture an accessibility tree or authorize coordinate taps.
    """
    title = focus_title(native)
    canonical = canonical_component(title)
    if canonical not in {canonical_component(c) for c in components}: raise Unobserved('Native focus is not an exact allowed component')
    records = window_records(wm); screen = (0,0,*size)
    matches = [x for x in records if x['title'] == title and x['package'] == canonical.split('/')[0] and x['bounds'] == screen]
    if len(matches) != 1: raise Unobserved('Focused native component/frame does not match physical PNG')
    target = matches[0]
    for other in records:
        if other is target or not overlaps(other['bounds'], screen): continue
        if other['rank'] > target['rank'] and other['base'] + other['sub'] <= target['base'] + target['sub']: continue
        if native_edge(other,size,system_pid): continue
        if other['notTouchable'] and other['pid'] == int(system_pid) and other['package'] == 'com.android.systemui' and other['title'] in (
                'ScreenDecorHwcOverlay','ScreenDecorOverlay','ScreenDecorOverlayTop','ScreenDecorOverlayBottom'): continue
        raise Unobserved('Native-only transition has unknown/intersecting foreground surface')
    return dict(component=canonical, bounds=screen, nativeWindow=target, accessibilityObserverUsed=False)


def owner(windows, native, wm, size, packages, area=None, navigation_pid=None, system_pid=None):
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    if len(focused) != 1: raise Unobserved('No unique focused window')
    w = focused[0]; pkg = w.get('root', {}).get('package'); title = focus_title(native)
    native_pkg = 'com.android.systemui' if title == 'NotificationShade' else title.split('/')[0]
    if pkg not in packages or native_pkg != pkg: raise Unobserved('Unknown/covered native foreground')
    bounds = rect(w.get('bounds')); root = rect(w['root'].get('bounds')); screen = (0, 0, *size)
    if not inside(bounds, screen) or root != bounds: raise Unobserved('Focused root/window bounds disagree')
    records = window_records(wm)
    matches = [x for x in records if x['package'] == pkg and x['bounds'] == bounds and x['title'] == title]
    if len(matches) != 1: raise Unobserved('Exact native owner is unavailable')
    target = matches[0]; area = area or bounds
    if not inside(area, bounds): raise Unobserved('Target outside current owner')
    for other in records:
        if other is target or not overlaps(other['bounds'], area): continue
        if other['rank'] > target['rank'] and other['base'] + other['sub'] <= target['base'] + target['sub']: continue
        # Non-coordinate navigation can coexist with the measured native system
        # edge affordances; a coordinate tap never receives this exception.
        if navigation_pid is not None and native_edge(other, size, navigation_pid): continue
        if other['notTouchable'] and other['pid'] == (system_pid or navigation_pid) and other['package'] == 'com.android.systemui' and other['title'] in (
                'ScreenDecorHwcOverlay', 'ScreenDecorOverlay', 'ScreenDecorOverlayTop', 'ScreenDecorOverlayBottom'): continue
        raise Unobserved('Intersecting surface above/unknown relative to target')
    return w


def walk(node, parents=()):
    yield node, parents
    for child in node.get('children', []): yield from walk(child, parents + (node,))


def row_switch(windows, title):
    focused = [w for w in windows if w.get('active') and w.get('focused') and w.get('root', {}).get('package') == 'ls.augment.com']
    if len(focused) != 1: raise Unobserved('Duo editor is not uniquely focused')
    candidates = []
    for n, parents in walk(focused[0]['root']):
        if not n.get('visible') or n.get('text') != title: continue
        for parent in reversed(parents):
            switches = [x for x, _ in walk(parent) if x.get('visible') and x.get('enabled') and x.get('checkable') and x.get('clickable') and 'Switch' in x.get('class', '')]
            labels = [x for x, _ in walk(parent) if x.get('visible') and x.get('text') == title]
            if len(switches) == 1 and len(labels) == 1:
                candidates.append(switches[0]); break
    if len(candidates) != 1: raise Unobserved('Unique visible row switch absent; do not tap a parent fold')
    return candidates[0]


def profile_steps():
    return [(name, {SYSTEM: s, NOTIFICATIONS: n}) for name, s, n in
            [('00-before', '0', '0'), ('10', '1', '0'), ('00-middle', '0', '0'), ('01', '0', '1'), ('00-after', '0', '0')]]
