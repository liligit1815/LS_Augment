"""Observe native stack scrolling and interact only with this run's fixture notifications.

Explicit --run is required. --self-test exercises selection/ownership locally, without ADB.
No production instrumentation is started between fixture launch and confirmed cleanup.
"""
import argparse
import hashlib
import json
import os
import re
import shlex
import subprocess
import time
import traceback
import xml.etree.ElementTree as ET
from pathlib import Path

import adb_regression as ar
import native_ui_helpers as ui

PACKAGE = 'ls.augment.regression.c17'
RUNNER = PACKAGE + '/ls.augment.com.C17FixtureRunner'
ROW = 'com.android.systemui:id/expandableNotificationRow'
STACK = 'com.android.systemui:id/notification_stack_scroller'
TITLES = {i + 1: '原生通知 ' + str(i + 1) + ' · ' + text for i, text in enumerate(
    ['短内容', '长文字', '收件列表', '图片', '更新内容', '对话'])}
# These exact alternate titles are set by the fixture's InboxStyle/MessagingStyle.
# They only identify an already-active owned id; no arbitrary prefix matching is used.
TITLE_ALIASES = {number: {title} for number, title in TITLES.items()}
TITLE_ALIASES[3].add('六行原生收件列表')
TITLE_ALIASES[6].add('临时对话夹具')
VALUES = {'ls_augment_rm_notification_stack': '1',
          'ls_augment_rm_notification_stack_start': '40'}
ACTION_FRESH_SECONDS = 3
AUDIT = ar.ROOT / 'out/full-function-audit-20261004'


def test_values(profile, stack_mode):
    values = dict(VALUES)
    if profile == 'clock':
        # Formatting alone owns the new native viewport. Keep the expanded clock
        # disabled to isolate the reported seconds/period/weather layout case.
        values.update({'ls_augment_rm_qs_clock_seconds': '1',
                       'ls_augment_rm_qs_clock_period': '1',
                       'ls_augment_rm_notification_weather': '1',
                       'ls_augment_rm_notification_clock_portrait_enabled': '0',
                       'ls_augment_rm_notification_clock_landscape_enabled': '0',
                       'ls_augment_rm_notification_clear_appearance_enabled': '0',
                       'ls_augment_rm_notification_stack': '0'})
    if stack_mode is not None:
        values['ls_augment_rm_notification_stack'] = '1' if stack_mode == 'on' else '0'
    return values


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')


def save_journal(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + '.tmp')
    with temporary.open('w', encoding='utf-8') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def pending_runs(root):
    pending = []
    for path in root.rglob('restore.json'):
        # Malformed journals cannot be assumed safe to ignore.
        value = json.loads(path.read_text(encoding='utf-8'))
        if not isinstance(value, dict):
            raise RuntimeError('Unrecognized recovery journal: ' + str(path))
        if value.get('pending'):
            pending.append(str(path))
    return pending


def current_systemui(raw, pid, boot, version_name):
    if not re.fullmatch(r'[1-9][0-9]*', pid) or not re.fullmatch(r'\d+', boot):
        raise RuntimeError('Current SystemUI PID/boot is unavailable')
    records = []
    for node in ET.fromstring(raw):
        if node.tag != 'string' or not node.text:
            continue
        try:
            value = json.loads(node.text)
        except (ValueError, TypeError):
            continue
        if isinstance(value, dict) and str(value.get('pid')) == pid and value.get('process') == 'com.android.systemui':
            records.append(value)
    if (len(records) != 1 or records[0].get('moduleLoaded') is not True
            or records[0].get('moduleVersion') != version_name
            or str(records[0].get('receivedBoot')) != boot):
        raise RuntimeError('Current SystemUI PID/boot has not loaded the installed module build')
    fields = ('process', 'pid', 'moduleVersion', 'moduleLoaded', 'receivedBoot', 'moduleLoadedAt', 'snapshotAt')
    return {'pid': pid, 'boot': boot, 'record': {key: records[0].get(key) for key in fields}, 'currentBuild': True}


def restored_settings(journal, current, fixture_cleanup_confirmed):
    baseline = journal['baselineSettings']
    differences = {key: {'expected': baseline.get(key), 'actual': current.get(key)}
                   for key in set(baseline) | set(current)
                   if key not in baseline or key not in current or baseline[key] != current[key]}
    original_values_match = all(key in current and current[key] == value for key, value in journal['values'].items())
    restored = fixture_cleanup_confirmed and original_values_match and not differences
    journal.update(pending=not restored, fixtureCleanupConfirmed=fixture_cleanup_confirmed,
                   configurationRestored=restored, originalValuesRestored=original_values_match,
                   fullBaselineRestored=not differences, configurationDifferences=differences,
                   restoreObservedAtUnixMs=int(time.time() * 1000))
    return restored


def fixture_artifact():
    folder = ar.ROOT / 'out/full-function-audit-20261004/c17-runtime-fixture'
    metadata = json.loads((folder / 'build.json').read_text(encoding='utf-8'))
    apk = folder / 'c17-runtime-fixture.apk'
    actual = hashlib.sha256(apk.read_bytes()).hexdigest()
    source = ar.ROOT / 'android/app/src/androidTest/java/ls/augment/com/C17RuntimeFixtureCases.java'
    if actual != metadata['sha256'] or hashlib.sha256(source.read_bytes()).hexdigest() != metadata['sourceSha256']:
        raise RuntimeError('Existing fixture APK/build metadata does not match its recorded source; do not replace it automatically')
    return {'apkSha256': actual, 'sourceSha256': metadata['sourceSha256'], 'package': PACKAGE, 'versionCode': 1}


def walk(node):
    yield node
    for child in node.get('children', []):
        yield from walk(child)


def rect(node):
    value = tuple(map(int, re.findall(r'-?\d+', node.get('bounds', ''))))
    return value if len(value) == 4 else (0, 0, 0, 0)


def intersection(a, b):
    return max(a[0], b[0]), max(a[1], b[1]), min(a[2], b[2]), min(a[3], b[3])


def contains(outer, inner, pad=0):
    return (inner[2] > inner[0] and inner[3] > inner[1]
            and inner[0] >= outer[0] + pad and inner[1] >= outer[1] + pad
            and inner[2] <= outer[2] - pad and inner[3] <= outer[3] - pad)


def active_records(raw):
    """Read only the active list, never archived/enqueued records with identical keys."""
    marker = re.search(r'^  Notification List:\s*$', raw, re.M)
    if not marker:
        raise ValueError('Unrecognized active Notification List; no touch is permitted')
    section = raw[marker.end():]
    end = re.search(r'^  \S', section, re.M)
    if end:
        section = section[:end.start()]
    records = []
    for line in section.splitlines():
        match = re.search(r'NotificationRecord\([^\n]*?pkg=(\S+) user=(\S+) id=(-?\d+) tag=(\S+) .*?key=(\S+)', line)
        if match:
            pkg, user, number, tag, key = match.groups()
            records.append({'package': pkg, 'user': user, 'id': int(number), 'tag': tag, 'key': key.rstrip(':')})
        elif 'NotificationRecord(' in line:
            raise ValueError('Unrecognized active notification record; empty-list cleanup cannot be inferred')
    return records


def owned_ids(records, tag):
    return {r['id'] for r in records if r['package'] == PACKAGE and r['tag'] == tag}


def focused_panel(windows):
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    if len(focused) != 1 or focused[0].get('root', {}).get('package') != 'com.android.systemui':
        raise ValueError('SystemUI is not uniquely focused; no notification action permitted')
    panels = [n for n in walk(focused[0]['root']) if n.get('visible')
              and n.get('id') == 'com.android.systemui:id/notification_panel']
    if len(panels) != 1:
        raise ValueError('Focused notification panel is missing or ambiguous')
    return [focused[0]]


def known_background(windows):
    focused = [w for w in windows if w.get('active') and w.get('focused')]
    if (len(focused) != 1 or focused[0].get('root', {}).get('package')
            not in ('ls.augment.com', 'com.zte.mifavor.launcher')):
        raise ValueError('Only focused Duo or the verified native launcher may receive an opening swipe')
    area = rect(focused[0].get('root', {}))
    if area[0:2] != (0, 0) or area[2] < 320 or area[3] < 480:
        raise ValueError('Background is not an observed full-screen surface; no opening swipe')
    return area


def requested_checks(case):
    checks = set()
    if case in ('all', 'scroll'):
        checks.add('allSixReadableCandidatesIncludingOwnedTail')
    if case in ('all', 'actions', 'expand'):
        checks.update(('expandNativeControlAndContent', 'collapseAfterReading'))
    if case in ('all', 'actions', 'click'):
        checks.add('ownedClickCallbackAndActivity')
    if case in ('all', 'actions', 'swipe'):
        checks.add('onlyOwnedSwipeTargetRemoved')
    return checks


def viewport(windows):
    all_nodes = [n for w in windows for n in walk(w.get('root', {}))]
    stack = [n for n in all_nodes if n.get('id') == STACK and n.get('visible')]
    if len(stack) != 1:
        raise ValueError('Unique visible native notification scroller missing')
    bounds = rect(stack[0])
    headers = [rect(n)[3] for n in all_nodes if n.get('visible')
               and n.get('id') == 'com.android.systemui:id/cc_header']
    return bounds[0], max([bounds[1]] + headers) + 8, bounds[2], bounds[3] - 24


def fixture_body(text, number):
    text = str(text or '')
    return (text == '临时夹具，点击查看本条真实内容。'
            or text.startswith('第 ' + str(number) + ' 条独立通知。')
            or number == 3 and bool(re.fullmatch(r'内容 [1-6]：独立通知列表滚动验证', text))
            or number == 4 and text == '本地生成的绿色测试图片'
            or number == 5 and text.startswith('两行测试内容。')
            or number == 6 and bool(re.fullmatch(r'消息 [1-4]：检验多行内容与真实通知展开。', text)))


def rows(windows, area):
    result = []
    for node in (n for w in windows for n in walk(w.get('root', {}))):
        if node.get('id') != ROW:
            continue
        descendants = list(walk(node))
        # Never select a group summary containing multiple owned notifications.
        numbers = {i for i, titles in TITLE_ALIASES.items() if any(n.get('text') in titles for n in descendants)}
        number = next(iter(numbers)) if len(numbers) == 1 else None
        texts = [n for n in descendants if n.get('visible') and n.get('text') not in (None, '', 'null')]
        bounds = rect(node)
        titles = [n for n in texts if number and n.get('text') in TITLE_ALIASES[number]]
        bodies = [n for n in texts if fixture_body(n.get('text'), number)]
        app_names = [n.get('text') for n in texts if n.get('id') == 'android:id/app_name_text']
        readable = bool(number and node.get('visible') and contains(area, bounds)
                        and bounds[3] - bounds[1] >= 80
                        # This ROM omits repeated app-name children on some native
                        # cards. Any observed name must match; exact active tag/id,
                        # unique title and fixture body remain mandatory below.
                        and all(name == 'Duo 临时原生验证' for name in app_names)
                        and any(contains(bounds, rect(n), 2) for n in titles)
                        and any(contains(bounds, rect(n), 2) for n in bodies))
        result.append({'number': number, 'numbers': sorted(numbers), 'bounds': bounds,
                       'visible': bool(node.get('visible')), 'readableCandidate': readable,
                       'node': node, 'titles': titles, 'bodies': bodies})
    return result


def unique_owned(snapshot, number):
    candidates = [r for r in snapshot['rows'] if r['number'] == number and r['readableCandidate']]
    if number - 1 not in snapshot['ownedIds'] or len(candidates) != 1:
        return None
    chosen = candidates[0]
    # Even a correct title is not enough when another notification overlays its body.
    for other in snapshot['rows']:
        if other is chosen or not other['visible']:
            continue
        overlap = intersection(chosen['bounds'], other['bounds'])
        if overlap[2] > overlap[0] and overlap[3] - overlap[1] > 2:
            return None
    return chosen


def owned_collapse_control(snapshot, number):
    """Require exact ownership and an unobstructed actual collapse hit target.

    Projected tail accessibility boxes can overlap the expanded card's lower
    body while its header remains separate. That does not permit arbitrary body
    gestures; this helper is restricted to the observed native collapse control.
    """
    candidates = [r for r in snapshot['rows'] if r['number'] == number and r['readableCandidate']]
    if number-1 not in snapshot['ownedIds'] or len(candidates) != 1:
        return None
    row = candidates[0]
    controls = [n for n in walk(row['node']) if n.get('visible') and n.get('enabled') and n.get('clickable')
                and n.get('id') == 'android:id/expand_button'
                and n.get('description') in ('收起', '折叠', 'Collapse')
                and contains(row['bounds'], rect(n)) and contains(snapshot['area'], rect(n))]
    if len(controls) != 1:
        return None
    target = rect(controls[0])
    for other in snapshot['rows']:
        if other is row or not other['visible']:
            continue
        overlap = intersection(target, other['bounds'])
        if overlap[2] > overlap[0] and overlap[3] > overlap[1]:
            return None
    return controls[0]


def expanded_reading(snapshot, number):
    row = unique_owned(snapshot, number)
    if row is None:
        return False
    control = owned_collapse_control(snapshot, number)
    return bool(control is not None and any(
        n.get('visible') and n.get('id') == 'android:id/big_text'
        and '长文字的最后一段' in str(n.get('text'))
        and contains(row['bounds'], rect(n), 2) and contains(snapshot['area'], rect(n), 2)
        for n in walk(row['node'])))


def reading_scroll_direction(snapshot, number):
    # This only chooses direction, never a touch target. vertical() still gets a
    # fresh tree and requires its normal fully visible owned-card start point.
    candidates = [r for r in snapshot['rows'] if r['number'] == number and r['visible']]
    if number - 1 not in snapshot['ownedIds'] or len(candidates) != 1:
        return None
    row, area = candidates[0]['bounds'], snapshot['area']
    if row[3] - row[1] > area[3] - area[1]:
        return None  # A full-card gate cannot certify a card taller than this viewport.
    if row[3] > area[3]:
        return 'up'
    if row[1] < area[1]:
        return 'down'
    return None


def fingerprint(snapshot):
    return tuple((r['number'], r['bounds'], r['visible']) for r in snapshot['rows'])


def async_cleanup_confirmed(final, samples, runner_ended):
    """A stale immediate count is not failure if independent post-exit reads prove removal."""
    return bool(runner_ended and final and not final.get('error') and not final.get('cleanupErrors')
                and any(event.get('event') == 'fixture_cleanup' for event in final.get('events', []))
                and len(samples) >= 2 and all(sample.get('ownActiveIds') == [] for sample in samples[-2:]))


def scroll_gesture(snapshot, direction):
    area = snapshot['area']
    # Both pointer endpoints stay well below the observed header. A projected
    # tail or blank area is not a proven native scroll hit target.
    margin = max(64, int((area[3] - area[1]) * .08))
    safe_top, safe_bottom = area[1] + margin, area[3] - margin
    choices = []
    for row in snapshot['rows']:
        # Scrolling is an action too: a foreign row or a title-only tail is not
        # an allowed fallback when no current fixture notification is reachable.
        if row['number'] is None or unique_owned(snapshot, row['number']) is not row:
            continue
        b = intersection((area[0], safe_top, area[2], safe_bottom), row['bounds'])
        if not row['visible'] or b[3] - b[1] < 80 or b[2] - b[0] < 120:
            continue
        y = (b[1] + b[3]) // 2
        travel = min(300, y - safe_top if direction == 'up' else safe_bottom - y)
        x = (b[0] + b[2]) // 2
        controls = [n for n in walk(row['node']) if n is not row['node'] and n.get('visible')
                    and (n.get('clickable') or n.get('longClickable') or n.get('scrollable'))]
        if any(rect(n)[0] <= x < rect(n)[2] and rect(n)[1] <= y < rect(n)[3] for n in controls):
            continue
        if travel >= 90:
            choices.append((travel, y, b))
    if not choices:
        raise RuntimeError('No safe observed native notification scroll target; blank space is not used')
    travel, y, b = max(choices)
    x = (b[0] + b[2]) // 2
    return [x, y], [x, y - travel if direction == 'up' else y + travel]


class Fixture:
    def __init__(self, output, phase, seconds):
        self.output, self.phase, self.seconds = output, phase, seconds
        self.proc = self.log = None
        self.path = self.run_id = self.tag = None
        self.started = 0
        self.final = None
        self.cleanup_confirmed = False
        self.cleanup_evidence = None

    def start(self):
        self.started = time.monotonic()
        self.log = (self.output / (self.phase + '-fixture.txt')).open('wb')
        command = [str(ar.ADB), '-s', ar.SERIAL, 'shell', 'am', 'instrument', '-w', '-r',
                   '-e', 'seconds', str(self.seconds), '-e', 'coverAfter', '-1', '-e', 'noCoverAfter', '-1',
                   '-e', 'skipActiveSession', 'true',
                   '-e', 'operation', 'c17-runtime-fixture', RUNNER]
        self.proc = subprocess.Popen(command, stdout=self.log, stderr=subprocess.STDOUT)
        while time.monotonic() - self.started < 15:
            raw = (self.output / (self.phase + '-fixture.txt')).read_text(encoding='utf-8', errors='replace')
            for line in raw.splitlines():
                if line.startswith('INSTRUMENTATION_STATUS: c17Fixture='):
                    try:
                        snap = json.loads(line.split('=', 1)[1])
                    except json.JSONDecodeError:
                        continue
                    self.path, self.run_id, self.tag = snap['progressPath'], snap['runId'], snap['notificationTag']
                    expected = '/data/user/0/' + PACKAGE + '/cache/c17-runtime-fixture/' + self.run_id + '.json'
                    if self.path != expected or self.tag != 'duo_c17_fixture_' + self.run_id:
                        raise RuntimeError('Fixture progress identity mismatch')
                    self.alive()
                    return
            if self.proc.poll() is not None:
                raise RuntimeError('Fixture exited without ready evidence: ' + raw[-2000:])
            time.sleep(.2)
        raise RuntimeError('Fixture ready evidence timed out')

    def read(self):
        if not self.path:
            raise RuntimeError('No confirmed fixture identity')
        snap = json.loads(ar.shell('cat ' + shlex.quote(self.path), root=True))
        if snap['runId'] != self.run_id or snap['notificationTag'] != self.tag:
            raise RuntimeError('Progress file belongs to a different fixture')
        return snap

    def alive(self):
        if self.seconds - (time.monotonic() - self.started) < 10:
            raise TimeoutError('Fixture deadline approaching; stop touches and allow natural cleanup')
        snap = self.read()
        if snap.get('error') or snap.get('cleanupComplete') or self.proc.poll() is not None:
            raise RuntimeError('Fixture is not live')
        return snap

    def finish(self):
        # Never force-stop the fixture: its own finally cancels only its own notifications.
        limit = self.started + self.seconds + 35
        while self.proc is not None and self.proc.poll() is None and time.monotonic() < limit:
            time.sleep(.5)
        if self.log:
            self.log.close()
        if self.path:
            self.final = self.read()
            save(self.output / (self.phase + '-fixture-final.json'), self.final)
        if self.proc is not None and self.proc.poll() is None:
            raise RuntimeError('Fixture still active; do not start module instrumentation')
        raw = (self.output / (self.phase + '-fixture.txt')).read_text(encoding='utf-8', errors='replace')
        runner_ended = 'INSTRUMENTATION_CODE:' in raw and self.proc is not None and self.proc.poll() is not None
        samples = []
        # NotificationManager.cancel() is asynchronous: the Java finally may see
        # still-enqueued removals. Preserve that original report, then independently
        # observe this exact tag twice after the runner's completion, without canceling.
        limit = time.monotonic() + 12
        while self.tag and runner_ended and time.monotonic() < limit:
            records = active_records(ar.shell('dumpsys notification --noredact', root=True))
            samples.append({'ownActiveIds': sorted(owned_ids(records, self.tag)), 'observedAtUnixMs': int(time.time() * 1000)})
            if async_cleanup_confirmed(self.final, samples, runner_ended):
                self.cleanup_confirmed = True
                break
            time.sleep(.4)
        self.cleanup_evidence = {'notificationTag': self.tag, 'runnerEnded': runner_ended,
            'originalImmediateCount': None if not self.final else self.final.get('remainingOwnNotifications'),
            'samples': samples, 'independentlyConfirmed': self.cleanup_confirmed,
            'method': 'Two post-run native active-list queries, exact fixture package and tag; no cancellation commands'}
        save(self.output / (self.phase + '-cleanup-observation.json'), self.cleanup_evidence)
        if not self.cleanup_confirmed:
            raise RuntimeError('Fixture cleanup not independently confirmed; module instrumentation withheld')


class Audit:
    def __init__(self, output, phase, seconds, max_steps):
        self.output, self.phase, self.max_steps = output, phase, max_steps
        self.fixture = Fixture(output, phase, seconds)
        self.observations, self.actions, self.readable = [], [], {}
        self.sequence = 0
        self.outcomes = {}
        self.latest = None

    def capture(self, stage, require_panel=True, allow_closed_panel=False):
        self.fixture.alive()
        label = self.phase + '-' + str(self.sequence).zfill(3) + '-' + stage
        self.sequence += 1
        windows = ui.all_windows(label)
        tree_observed = time.monotonic()
        folder = self.output / label
        (folder / 'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
        progress = self.fixture.alive()
        save(folder / 'fixture.json', progress)
        raw = ar.shell('dumpsys notification --noredact', root=True)
        records = active_records(raw)
        ids = owned_ids(records, self.fixture.tag)
        # Store only owned records and hashed unrelated identities, not a full notification dump.
        foreign = sorted(hashlib.sha256(r['key'].encode()).hexdigest()[:16] for r in records
                         if not (r['package'] == PACKAGE and r['tag'] == self.fixture.tag))
        save(folder / 'active-notifications.json', {'owned': [r for r in records if r['package'] == PACKAGE and r['tag'] == self.fixture.tag],
                                                 'unrelatedKeyHashes': foreign})
        try:
            panel = focused_panel(windows) if require_panel else []
        except ValueError:
            if not allow_closed_panel:
                raise
            panel = []
        area = viewport(panel) if panel else None
        current_rows = rows(panel, area) if area else []
        snap = {'label': label, 'windows': windows, 'rows': current_rows, 'area': area,
                'ownedIds': ids, 'fixture': progress, 'foreignKeys': foreign, 'treeObservedMonotonic': tree_observed}
        raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
        diagnostics = {n.attrib['name']: n.text for n in ET.fromstring(raw)
                       if any(key in n.attrib.get('name', '') for key in
                              ('notification_stack', 'notification_viewport', 'notification_clock', 'header_clock_runtime'))}
        public_rows = [{k: v for k, v in r.items() if k not in ('node', 'titles', 'bodies')} for r in current_rows]
        observation = {'label': label, 'rows': public_rows, 'ownedIds': sorted(ids), 'diagnostics': diagnostics}
        self.observations.append(observation)
        save(folder / 'geometry.json', observation)
        for number in TITLES:
            if unique_owned(snap, number):
                self.readable.setdefault(number, label)
        print(label, 'owned=', sorted(ids), 'fully-observed=', sorted(self.readable), flush=True)
        self.latest = snap
        return snap

    def fresh(self, stage):
        # Read ownership before the final tree, then act without screenshot,
        # Provider/diagnostic traversal or another full evidence capture in between.
        progress = self.fixture.alive()
        records = active_records(ar.shell('dumpsys notification --noredact', root=True))
        label = self.phase + '-action-' + str(self.sequence).zfill(3) + '-' + stage
        self.sequence += 1
        # A returned tree may already be old if observer startup or transport was
        # slow. Bound age conservatively from the request, not just its return.
        requested = time.monotonic()
        windows = ui.all_windows(label)
        observed = time.monotonic()
        panel = focused_panel(windows)
        area = viewport(panel)
        snap = {'label': label, 'windows': windows, 'rows': rows(panel, area), 'area': area,
                'ownedIds': owned_ids(records, self.fixture.tag), 'fixture': progress,
                'foreignKeys': sorted(hashlib.sha256(r['key'].encode()).hexdigest()[:16] for r in records
                                      if not (r['package'] == PACKAGE and r['tag'] == self.fixture.tag)),
                'treeObservedMonotonic': requested, 'treeReceivedMonotonic': observed}
        save(self.output / label / 'action-context.json', {
            'notificationTag': self.fixture.tag, 'runId': self.fixture.run_id,
            'ownedIds': sorted(snap['ownedIds']), 'foreignKeyHashes': snap['foreignKeys'],
            'area': area, 'treeObservedMonotonic': requested, 'treeReceivedMonotonic': observed,
            'freshnessOrigin': 'observer request; conservatively includes collection and transport',
            'ownershipReadBeforeFreshTree': True})
        self.latest = snap
        return snap

    def inject(self, snap, command):
        self.fixture.alive()
        if not 0 <= time.monotonic() - snap['treeObservedMonotonic'] <= ACTION_FRESH_SECONDS:
            raise RuntimeError('Fresh notification action tree expired; no input injected')
        ar.shell(command)

    def open_panel(self):
        self.fixture.alive()
        ar.shell('cmd statusbar collapse')
        # The old panel may still be closing when collapse returns. Wait, then
        # require an actual background tree; never reuse its pre-collapse bounds.
        time.sleep(.35)
        for attempt in range(2):
            self.fixture.alive()
            label = self.phase + '-open-background-' + str(self.sequence)
            self.sequence += 1
            requested = time.monotonic()
            windows = ui.all_windows(label)
            try:
                bounds = known_background(windows)
            except ValueError:
                (self.output / label / 'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
                raise
            x = bounds[0] + int((bounds[2] - bounds[0]) * .15)
            self.inject({'treeObservedMonotonic': requested},
                        f'input swipe {x} {bounds[1] + 2} {x} {bounds[1] + int((bounds[3] - bounds[1]) * .67)} 650')
            time.sleep(.6)
            snap = self.capture('opened-attempt-' + str(attempt + 1), allow_closed_panel=True)
            if snap['area'] is not None:
                return snap
            # Keep each failed PNG/tree. One retry is allowed only when this
            # observation still proves Duo or the native launcher, never another app.
            known_background(snap['windows'])
            if attempt == 0:
                time.sleep(.25)
        raise RuntimeError('Notification panel did not open after two bounded attempts; no notification action')

    def vertical(self, direction):
        snap = self.fresh('before-scroll-' + direction)
        start, end = scroll_gesture(snap, direction)
        self.inject(snap, f'input swipe {start[0]} {start[1]} {end[0]} {end[1]} 550')
        self.latest = None
        self.actions.append({'action': 'scroll-' + direction, 'source': snap['label'], 'start': start, 'end': end})
        time.sleep(.35)
        return self.capture('after-scroll-' + direction)

    def scroll_case(self):
        snap = self.open_panel()
        repeated = 0
        for _ in range(self.max_steps):
            if set(self.readable) == set(TITLES):
                break
            previous = fingerprint(snap)
            snap = self.vertical('up')
            repeated = repeated + 1 if fingerprint(snap) == previous else 0
            if repeated >= 2:
                break
        last_owned = next((r['number'] for r in reversed(snap['rows']) if r['number']), None)
        self.outcomes['scroll'] = {'allSixFullyObservedCandidates': set(self.readable) == set(TITLES),
            'evidenceByNotification': dict(self.readable), 'stableEndObserved': repeated >= 2,
            'lastObservedOwnedNumber': last_owned, 'lastOwnedReadableEvidence': self.readable.get(last_owned),
            'scope': 'All six independent fixture notifications including their native-order last item; not the last user notification',
            'stopReason': 'all_six_fixture_rows_observed' if set(self.readable) == set(TITLES) else 'bounded_traversal_or_stable_geometry',
            'endEvidence': snap['label'], 'visualReadabilityRequiresScreenshotReview': True}
        # Exercise the reverse native scroll path as well; no notification is tapped here.
        for _ in range(2):
            self.vertical('down')

    def seek_expanded_reading(self, snapshot, number):
        evidence = [snapshot['label']]
        for _ in range(3):
            if expanded_reading(snapshot, number):
                break
            direction = reading_scroll_direction(snapshot, number)
            if direction is None:
                break
            snapshot = self.vertical(direction)
            evidence.append(snapshot['label'])
        return snapshot, evidence

    def expand(self, number):
        snap = self.fresh('before-expand')
        row = unique_owned(snap, number)
        if not row:
            return False
        targets = [n for n in walk(row['node']) if n.get('visible') and n.get('enabled') and n.get('clickable')
                   and n.get('id') == 'android:id/expand_button' and n.get('description') in ('展开', 'Expand', '收起', '折叠', 'Collapse')
                   and contains(row['bounds'], rect(n)) and contains(snap['area'], rect(n))]
        if len(targets) != 1:
            return False
        if targets[0].get('description') in ('收起', '折叠', 'Collapse'):
            # Some ROMs initially expand the leading notification. Collapse only our
            # positively identified BigText row, then locate its fresh expand control.
            b = rect(targets[0])
            self.inject(snap, f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
            self.actions.append({'action': 'collapse-owned-before-expand', 'number': number,
                                 'source': snap['label'], 'target': b})
            time.sleep(.4)
            self.capture('collapsed-before-expand')
            snap = self.fresh('before-expand-after-initial-collapse')
            row = unique_owned(snap, number)
            if not row:
                return False
            targets = [n for n in walk(row['node']) if n.get('visible') and n.get('enabled') and n.get('clickable')
                       and n.get('id') == 'android:id/expand_button' and n.get('description') in ('展开', 'Expand')
                       and contains(row['bounds'], rect(n)) and contains(snap['area'], rect(n))]
            if len(targets) != 1:
                return False
        b = rect(targets[0])
        self.inject(snap, f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
        time.sleep(.5)
        after = self.capture('after-expand')
        initial_after = after['label']
        after, reading_evidence = self.seek_expanded_reading(after, number)
        matches = [r for r in after['rows'] if r['number'] == number]
        expanded = any(n.get('description') in ('收起', '折叠', 'Collapse') for r in matches for n in walk(r['node']))
        long_text = expanded_reading(after, number)
        result = {'action': 'expand', 'number': number, 'before': snap['label'], 'after': after['label'],
                  'initialAfter': initial_after, 'readingEvidence': reading_evidence,
                  'readingScrollSteps': len(reading_evidence)-1,
                  'target': b, 'nativeCollapseControlObserved': expanded, 'longTextFullyInBounds': long_text,
                  'heightBefore': row['bounds'][3] - row['bounds'][1],
                  'heightAfter': [r['bounds'][3] - r['bounds'][1] for r in matches]}
        self.actions.append(result); self.outcomes['expand'] = result
        # Close the same positively owned row after reading it. This exercises
        # returning from the temporary reading border to configured stacking.
        collapse_source = self.fresh('before-collapse-after-reading')
        control = owned_collapse_control(collapse_source, number) if expanded_reading(collapse_source, number) else None
        collapse = {'action': 'collapse-after-reading', 'number': number,
                    'status': 'not-exercised', 'reason': 'Full owned card, final paragraph and collapse control not all confirmed after bounded reading scroll'}
        if control is not None:
            target = rect(control)
            self.inject(collapse_source, f'input tap {(target[0]+target[2])//2} {(target[1]+target[3])//2}')
            time.sleep(.5)
            collapsed = self.capture('after-collapse')
            candidates = [r for r in collapsed['rows'] if r['number'] == number]
            control_restored = any(
                n.get('visible') and n.get('id') == 'android:id/expand_button'
                and n.get('description') in ('展开', 'Expand')
                and contains(intersection(r['bounds'], collapsed['area']), rect(n))
                for r in candidates for n in walk(r['node']))
            maximum = max(result['heightAfter'], default=0)
            smaller = any(0 < r['bounds'][3]-r['bounds'][1] < maximum for r in candidates)
            collapse = {'action': 'collapse-after-reading', 'number': number, 'status': 'observed',
                        'before': collapse_source['label'], 'after': collapsed['label'], 'target': target,
                        'nativeExpandControlObserved': control_restored, 'nativeHeightDecreased': smaller,
                        'ownedNotificationPreserved': number-1 in collapsed['ownedIds'],
                        'heights': [r['bounds'][3]-r['bounds'][1] for r in candidates],
                        'visualStackReturnRequiresReview': True}
        self.actions.append(collapse); self.outcomes['collapse'] = collapse
        return True

    def click(self, number):
        snap = self.fresh('before-click')
        row = unique_owned(snap, number)
        if not row:
            return False
        title = next(n for n in row['titles'] if contains(row['bounds'], rect(n), 2))
        b = rect(title)
        before = snap['fixture']['contentActivityCallbacks']
        self.inject(snap, f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
        time.sleep(.6)
        after = self.capture('content-opened', require_panel=False)
        own_content = any(w.get('active') and w.get('root', {}).get('package') == PACKAGE
                          and any(TITLES[number] in str(n.get('text')) for n in walk(w['root'])) for w in after['windows'])
        callback = after['fixture']['contentActivityCallbacks'] > before and any(
            e.get('event') == 'content_activity_opened' and e.get('notification') == number - 1
            for e in after['fixture']['events'])
        result = {'action': 'click', 'number': number, 'before': snap['label'], 'after': after['label'],
                  'target': b, 'ownContentActivityObserved': own_content, 'matchingCallbackReceived': callback}
        self.actions.append(result); self.outcomes['click'] = result
        if not own_content:
            raise RuntimeError('Expected owned content Activity did not open; stop rather than touch another app')
        ar.shell('input keyevent 4')
        self.open_panel()
        return True

    def dismiss(self, number):
        snap = self.fresh('before-own-swipe')
        row = unique_owned(snap, number)
        if not row:
            return False
        b = row['bounds']; title = rect(next(n for n in row['titles'] if contains(b, rect(n), 2)))
        y = (title[1] + title[3]) // 2
        x = b[0] + int((b[2] - b[0]) * .78)
        end = snap['area'][0] + 3
        self.inject(snap, f'input swipe {x} {y} {end} {y} 380')
        time.sleep(.7)
        after = self.capture('after-own-swipe')
        removed = snap['ownedIds'] - after['ownedIds']
        result = {'action': 'swipe-owned', 'number': number, 'before': snap['label'], 'after': after['label'],
                  'start': [x, y], 'end': [end, y], 'removedOwnedIds': sorted(removed),
                  'onlyTargetOwnedIdRemoved': removed == {number - 1},
                  'unrelatedKeySetUnchanged': snap['foreignKeys'] == after['foreignKeys']}
        self.actions.append(result); self.outcomes['swipe'] = result
        return True

    def actions_case(self):
        snap = self.open_panel()
        attempts = set()
        desired = {'expand', 'click', 'swipe'} if self.phase == 'actions' else {self.phase}
        for _ in range(self.max_steps):
            # Target names are identities, not assumptions about native notification ordering.
            for name, number, operation in [('expand', 2, self.expand), ('click', 1, self.click), ('swipe', 3, self.dismiss)]:
                if name in desired and name not in attempts and unique_owned(snap, number):
                    if operation(number):
                        attempts.add(name)
                    snap = self.fresh('after-action')
            if attempts == desired:
                break
            snap = self.vertical('up')
        for name in desired:
            self.outcomes.setdefault(name, {'status': 'not-exercised', 'reason': 'Unique owned fully visible native target not found within bounded traversal'})

    def report(self):
        return {'phase': self.phase, 'observations': self.observations, 'actions': self.actions,
                'outcomes': self.outcomes, 'fixtureFinal': self.fixture.final,
                'fixtureCleanupEvidence': self.fixture.cleanup_evidence,
                'evidenceScope': 'Native gestures, owned identities, callback evidence and screenshots; no visual pass inferred from diagnostics alone'}


def self_test():
    import tempfile
    from types import SimpleNamespace
    assert test_values('off', None) == VALUES, 'Legacy default settings must stay unchanged'
    clock = test_values('clock', None)
    assert clock['ls_augment_rm_notification_stack'] == '0', 'Clock profile isolates viewport by default'
    assert clock['ls_augment_rm_qs_clock_seconds'] == clock['ls_augment_rm_qs_clock_period'] == '1'
    assert clock['ls_augment_rm_notification_weather'] == '1'
    assert clock['ls_augment_rm_notification_clear_appearance_enabled'] == '0', 'Visible native clear is still reserved without custom clear styling'
    assert test_values('clock', 'on')['ls_augment_rm_notification_stack'] == '1', 'Combined mode is explicit'
    native = {'pid': 52, 'process': 'com.android.systemui', 'moduleLoaded': True,
              'moduleVersion': 'test20456', 'receivedBoot': 524}
    def native_xml(value):
        node=ET.Element('map');ET.SubElement(node,'string',name='process').text=json.dumps(value)
        return ET.tostring(node,encoding='unicode')
    assert current_systemui(native_xml(native), '52', '524', 'test20456')['currentBuild']
    for wrong in ({**native,'pid':51}, {**native,'moduleLoaded':False},
                  {**native,'moduleVersion':'test20455'}, {**native,'receivedBoot':523}):
        try:current_systemui(native_xml(wrong),'52','524','test20456')
        except RuntimeError:pass
        else:raise AssertionError('A stale PID/build/boot or unloaded module must block mutation')
    with tempfile.TemporaryDirectory(prefix='duo-stack-journal-') as directory:
        root=Path(directory);path=root/'run'/'restore.json'
        journal={'pending':True,'values':{'changed':'before'},'baselineSettings':{'changed':'before','untouched':'keep'}}
        save_journal(path,journal)
        assert pending_runs(root)==[str(path)], 'Pending write-ahead journal blocks another audit'
        assert not restored_settings(journal,{'changed':'before','untouched':'different'},True)
        assert journal['pending'] and not journal['fullBaselineRestored'], 'Matching selected values cannot hide another changed setting'
        assert not restored_settings(journal,dict(journal['baselineSettings']),False), 'Unconfirmed fixture cleanup cannot complete recovery'
        assert journal['pending']
        assert restored_settings(journal,dict(journal['baselineSettings']),True)
        save_journal(path,journal);assert pending_runs(root)==[]
        assert not path.with_name('restore.json.tmp').exists(), 'Atomic journal replacement must complete'
        path.write_text('{',encoding='utf-8')
        try:pending_runs(root)
        except ValueError:pass
        else:raise AssertionError('Malformed journals cannot be ignored')
    raw = ('  Notification List:\n    NotificationRecord(0x01: pkg=' + PACKAGE + ' user=UserHandle{0} id=1 tag=ours importance=2 key=own: Notification())\n'
           '    NotificationRecord(0x02: pkg=com.tencent.mobileqq user=UserHandle{0} id=1 tag=ours importance=2 key=foreign: Notification())\n'
           '  mArchive=\n    NotificationRecord(0x03: pkg=' + PACKAGE + ' user=UserHandle{0} id=2 tag=ours importance=2 key=old: Notification())\n')
    assert owned_ids(active_records(raw), 'ours') == {1}, 'Archived or foreign notification must not establish ownership'
    assert owned_ids(active_records(raw), 'other') == set(), 'Old fixture tags must not establish ownership'
    def n(identity, bounds, text='null', children=None):
        return {'id': identity, 'bounds': bounds, 'text': text, 'visible': True, 'children': children or []}
    title = n('android:id/title', '[20,120][200,145]', TITLES[2])
    body = n('android:id/text', '[20,155][250,185]', '临时夹具，点击查看本条真实内容。')
    app = n('android:id/app_name_text', '[20,102][200,117]', 'Duo 临时原生验证')
    row = n(ROW, '[10,100][300,210]', children=[app, title, body])
    window = [{'root': n(STACK, '[0,0][320,500]', children=[row])}]
    area = viewport(window)
    snap = {'rows': rows(window, area), 'ownedIds': {1}}
    assert unique_owned(snap, 2), 'Complete owned row should be actionable'
    app['text'] = 'Other app'
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'A mismatched observed application label must block input'
    app['text'] = 'Duo 临时原生验证';app['visible'] = False
    assert unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'ROM may omit repeated app labels; active tag/id plus unique exact title and body remain required'
    app['visible'] = True
    row['bounds'] = '[10,192][300,210]'
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'Visible descendants outside tail clip are not readable'
    row['bounds'] = '[10,100][300,210]'
    row['children'].append(n('android:id/title', '[20,120][200,145]', TITLES[3]))
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1, 2}}, 2), 'Multi-notification summary must not be selected'
    row['children'].pop()
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': set()}, 2), 'Title alone is not sufficient'
    overlay = n(ROW, '[10,160][300,220]')
    window[0]['root']['children'].append(overlay)
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'Overlapped row must not be touched'
    window[0]['root']['children'].pop()
    window[0]['root']['children'].append(dict(row))
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'Duplicate titles must not select a random notification'
    window[0]['root']['children'].pop()
    body['text'] = 'An unrelated notification copying the fixture title'
    assert not unique_owned({'rows': rows(window, area), 'ownedIds': {1}}, 2), 'Fixture body must corroborate the exact title'
    body['text'] = '第 2 条独立通知。完整测试内容'
    button = n('android:id/expand_button', '[260,110][290,140]')
    button.update(description='收起', enabled=True, clickable=True)
    row['children'].append(button)
    window[0]['root']['children'].append(overlay)
    collapsed_target = {'rows': rows(window, area), 'ownedIds': {1}, 'area': area}
    assert owned_collapse_control(collapsed_target, 2), 'A lower-body projected tail does not cover the actual collapse control'
    overlay['bounds'] = '[255,105][305,145]'
    assert not owned_collapse_control({'rows': rows(window, area), 'ownedIds': {1}, 'area': area}, 2), 'Covered collapse control must never be tapped'
    window[0]['root']['children'].pop()
    assert not owned_collapse_control({'rows': rows(window, area), 'ownedIds': set(), 'area': area}, 2), 'Collapse requires an active owned notification record'
    row['children'].append(dict(button))
    assert not owned_collapse_control({'rows': rows(window, area), 'ownedIds': {1}, 'area': area}, 2), 'Duplicate collapse targets must be rejected'
    row['children'].pop()
    button['enabled'] = False
    assert not owned_collapse_control({'rows': rows(window, area), 'ownedIds': {1}, 'area': area}, 2), 'Disabled collapse target must be rejected'
    row['children'].pop()
    def reading_snapshot(top, height=320):
        title=n('android:id/title',f'[20,{top+50}][200,{top+75}]',TITLES[2])
        body=n('android:id/big_text',f'[20,{top+90}][270,{top+height-20}]','第 2 条独立通知。长文字的最后一段，完整内容。')
        button=n('android:id/expand_button',f'[260,{top+10}][290,{top+40}]')
        button.update(description='收起',enabled=True,clickable=True)
        card=n(ROW,f'[10,{top}][300,{top+height}]',children=[title,body,button])
        current_area=(0,20,320,600)
        return {'label':'reading-'+str(top),'area':current_area,'ownedIds':{1},
                'rows':rows([{'root':card}],current_area)}
    clipped,complete=reading_snapshot(400),reading_snapshot(200)
    assert not expanded_reading(clipped,2) and reading_scroll_direction(clipped,2)=='up', 'Visible collapse button cannot replace complete long-text reading'
    assert expanded_reading(complete,2) and reading_scroll_direction(complete,2) is None
    assert reading_scroll_direction(reading_snapshot(-20),2)=='down'
    assert reading_scroll_direction(reading_snapshot(40,700),2) is None, 'Oversized cards are not silently certified'
    assert reading_scroll_direction({**clipped,'ownedIds':set()},2) is None
    audit=Audit.__new__(Audit);moves=[]
    audit.vertical=lambda direction:moves.append(direction) or complete
    final,evidence=audit.seek_expanded_reading(clipped,2)
    assert expanded_reading(final,2) and moves==['up'] and evidence==[clipped['label'],complete['label']]
    moves=[];audit.vertical=lambda direction:moves.append(direction) or clipped
    final,evidence=audit.seek_expanded_reading(clipped,2)
    assert len(moves)==3 and len(evidence)==4 and not expanded_reading(final,2), 'Failed reading must stop after three real scroll attempts without false pass'
    moves=[];audit.seek_expanded_reading(complete,2)
    assert not moves, 'Already complete reading needs no extra scroll'
    complete = {'events': [{'event': 'fixture_cleanup'}], 'cleanupErrors': [], 'error': '', 'remainingOwnNotifications': 2}
    samples = [{'ownActiveIds': []}, {'ownActiveIds': []}]
    assert async_cleanup_confirmed(complete, samples, True), 'Post-run async cancellation can be proven independently'
    assert not async_cleanup_confirmed(complete, samples[:1], True), 'One observation is insufficient'
    assert not async_cleanup_confirmed(complete, samples, False), 'Running instrumentation must never permit restore'
    assert not async_cleanup_confirmed(complete, [{'ownActiveIds': []}, {'ownActiveIds': [2]}], True), 'Remaining owned row must block restore'
    assert not async_cleanup_confirmed({**complete, 'cleanupErrors': ['session release failed']}, samples, True), 'Other cleanup failures must not be hidden'
    area = (0, 427, 1216, 2664)
    own = n(ROW, '[62,1039][1154,1249]', children=[
        n('android:id/app_name_text', '[173,1042][500,1058]', 'Duo 临时原生验证'),
        n('android:id/title', '[173,1070][600,1110]', TITLES[2]),
        n('android:id/text', '[173,1140][1000,1190]', '临时夹具，点击查看本条真实内容。')])
    foreign = n(ROW, '[62,286][1154,584]')
    nodes = [{'root': n(STACK, '[0,0][1216,2688]', children=[own, foreign])}]
    snapshot = {'area': area, 'rows': rows(nodes, area), 'ownedIds': {1}}
    start, end = scroll_gesture(snapshot, 'up')
    assert start[1] > 700 and end[1] >= 427 + int((2664 - 427) * .08), 'Pointer must stay away from observed header'
    for absent in (set(), {5}):
        try:scroll_gesture({**snapshot, 'ownedIds': absent}, 'up')
        except RuntimeError:pass
        else:raise AssertionError('Vertical scrolling must also require active exact fixture ownership')
    control = n('android:id/remote_input', '[500,1100][750,1200]');control['clickable'] = True
    own['children'].append(control)
    try:scroll_gesture({**snapshot, 'rows': rows(nodes, area)}, 'up')
    except RuntimeError:pass
    else:raise AssertionError('An interactive child must not become a scroll-down target')
    own['children'].pop()
    saved_bounds=own['bounds'];own['bounds']='[62,430][1154,456]'
    try:scroll_gesture({**snapshot, 'rows': rows(nodes, area)}, 'up')
    except RuntimeError:pass
    else:raise AssertionError('Tail-only/header-adjacent surfaces must not cause blank fallback gestures')
    own['bounds']=saved_bounds
    panel = n('com.android.systemui:id/notification_panel', '[0,0][1216,2688]', children=[nodes[0]['root']])
    focused = [{'active':True, 'focused':True, 'root':{'package':'com.android.systemui','children':[panel]}}]
    assert focused_panel(focused) == focused
    for invalid in ([], focused + focused, [{**focused[0], 'focused':False}]):
        try:focused_panel(invalid)
        except ValueError:pass
        else:raise AssertionError('Ambiguous or unfocused windows cannot permit notification actions')
    assert requested_checks('actions') == {'expandNativeControlAndContent','collapseAfterReading','ownedClickCallbackAndActivity','onlyOwnedSwipeTargetRemoved'}
    assert {'allSixReadableCandidatesIncludingOwnedTail'} != requested_checks('all'), 'A completed scroll cannot pass missing requested actions'
    shell_before,windows_before=ar.shell,ui.all_windows
    calls=[]
    try:
        def fake_shell(command,**kwargs):
            calls.append(command)
            if command.startswith('dumpsys notification'):return raw
            if command.startswith('input '):return ''
            raise AssertionError('Unexpected device command in local transport: '+command)
        ar.shell=fake_shell
        ui.all_windows=lambda label:focused
        with tempfile.TemporaryDirectory(prefix='duo-stack-action-') as directory:
            audit=Audit.__new__(Audit);audit.output=Path(directory);audit.phase='local';audit.sequence=0
            audit.fixture=SimpleNamespace(tag='ours',run_id='local',alive=lambda:{'contentActivityCallbacks':0})
            action=audit.fresh('fresh-input');assert action['ownedIds']=={1}
            audit.inject(action,'input tap 600 1100');assert calls[-1]=='input tap 600 1100'
            total=len(calls);action['treeObservedMonotonic']-=ACTION_FRESH_SECONDS+1
            try:audit.inject(action,'input tap 600 1100')
            except RuntimeError:pass
            else:raise AssertionError('Expired fresh tree cannot inject a tap')
            assert len(calls)==total, 'No input is sent after freshness expiry'
            original_clock=time.monotonic
            try:
                tick=[100.0];time.monotonic=lambda:tick[0]
                def delayed_windows(label):
                    tick[0]+=ACTION_FRESH_SECONDS+1
                    return focused
                ui.all_windows=delayed_windows
                action=audit.fresh('slow-observer');total=len(calls)
                try:audit.inject(action,'input tap 600 1100')
                except RuntimeError:pass
                else:raise AssertionError('Slow observer transport cannot reset an old tree to fresh')
                assert len(calls)==total, 'Slow collection sends no notification input'
            finally:
                time.monotonic=original_clock;ui.all_windows=lambda label:focused
            focused[0]['root']['package']='com.example.other'
            try:audit.fresh('foreign-window')
            except ValueError:pass
            else:raise AssertionError('Changed foreground must block all fixture actions')
    finally:
        ar.shell,ui.all_windows=shell_before,windows_before
    original_shell,original_adb,original_windows,original_sleep=ar.shell,ar.adb,ui.all_windows,time.sleep
    try:
        with tempfile.TemporaryDirectory(prefix='duo-stack-opening-') as directory:
            background=[{'active':True,'focused':True,'root':{'package':'ls.augment.com','bounds':'[0,0][1216,2688]'}}]
            unknown=[{'active':True,'focused':True,'root':{'package':'com.example.other','bounds':'[0,0][1216,2688]'}}]
            for destinations,initial,expected_swipes,success in (
                    ([background,'panel'],background,2,True),
                    ([background,background],background,2,False),
                    ([unknown],background,1,False),
                    ([],unknown,0,False)):
                events=[];remaining=list(destinations)
                ar.shell=lambda command,**kwargs:events.append(command) or ''
                ar.adb=lambda *args,**kwargs:b'local screenshot stub'
                time.sleep=lambda seconds:events.append(('sleep',seconds))
                audit=Audit.__new__(Audit);audit.output=Path(directory);audit.phase='entry';audit.sequence=0
                audit.fixture=SimpleNamespace(alive=lambda:{})
                def observed(label):
                    events.append('observe');(audit.output/label).mkdir(exist_ok=True)
                    return initial
                ui.all_windows=observed
                def captured(stage,**kwargs):
                    events.append('capture');value=remaining.pop(0)
                    return {'area':(0,0,1216,2362) if value=='panel' else None,
                            'windows':background if value=='panel' else value}
                audit.capture=captured
                try:result=audit.open_panel()
                except (ValueError,RuntimeError):
                    assert not success
                else:assert success and result['area'] is not None
                assert sum(isinstance(e,str) and e.startswith('input swipe') for e in events)==expected_swipes
                assert events[:3]==['cmd statusbar collapse',('sleep',.35),'observe'], 'Opening uses a fresh background only after collapse settles'
    finally:
        ar.shell,ar.adb,ui.all_windows,time.sleep=original_shell,original_adb,original_windows,original_sleep
    print('Local profile/ownership/freshness/clip/cleanup/gesture assertions passed; no ADB invoked')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', action='store_true', help='Execute on the configured device; otherwise show help')
    parser.add_argument('--self-test', action='store_true', help='Local selection checks only, no phone access')
    parser.add_argument('--case', choices=('all', 'scroll', 'actions', 'expand', 'click', 'swipe'), default='actions')
    parser.add_argument('--viewport-profile', choices=('off', 'clock'), default='off',
                        help='clock: seconds+period+weather, native clear appearance and stack off by default; off preserves the legacy stack-only profile')
    parser.add_argument('--stack-mode', choices=('on', 'off'),
                        help='Explicit stack override; use on with clock only for the separate combined case')
    parser.add_argument('--expected-version', type=int, help='Refuse a different source/installed module version')
    parser.add_argument('--start-percent', type=int, choices=range(40, 91), metavar='40..90',
                        help='Exercise a specific shade cascade start; restored with the original settings')
    parser.add_argument('--seconds', type=int, choices=range(45, 181), metavar='45..180', default=120)
    parser.add_argument('--max-steps', type=int, default=30)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    if args.self_test:
        self_test(); return
    if not args.run:
        parser.print_help(); return
    version = re.search(r'versionCode=(\d+)', (ar.ROOT / 'android/version.properties').read_text())[1]
    if args.expected_version is not None and args.expected_version != int(version):
        raise RuntimeError('Requested module version differs from current source version')
    values = test_values(args.viewport_profile, args.stack_mode)
    if args.start_percent is not None:
        values['ls_augment_rm_notification_stack_start'] = str(args.start_percent)
    output = args.out or ar.ROOT / ('out/full-function-audit-20261004/stack-native-' + version + '-' + time.strftime('%H%M%S'))
    output.mkdir(parents=True, exist_ok=False)
    ar.OUTPUT = ui.OUTPUT = output
    reports, restore, audits, error = [], {}, [], None
    journal = None
    restored = False
    try:
        unfinished = pending_runs(AUDIT)
        if unfinished:
            raise RuntimeError('Recover pending audit before this run: ' + unfinished[0])
        package_paths = {}
        for package in (PACKAGE, 'ls.augment.regression.ui'):
            package_paths[package] = ar.shell('pm path ' + package).strip()
            if not package_paths[package].startswith('package:'):
                raise RuntimeError('Required already-installed test package missing: ' + package)
        fixture_evidence = fixture_artifact()
        paths = package_paths[PACKAGE].splitlines()
        if len(paths) != 1:
            raise RuntimeError('Unexpected split fixture package; no automatic install or notification action')
        installed_fixture_hash = ar.shell('sha256sum ' + shlex.quote(paths[0][len('package:'):]), root=True).split()[0].lower()
        if installed_fixture_hash != fixture_evidence['apkSha256']:
            raise RuntimeError('Installed fixture APK differs from the audited local artifact; no replacement attempted')
        fixture_evidence['installedApkSha256'] = installed_fixture_hash
        package = ar.shell('dumpsys package ls.augment.com')
        installed = re.search(r'\bversionCode=(\d+)', package)
        installed_name = re.search(r'\bversionName=([^\s]+)', package)
        if not installed or installed[1] != version:
            raise RuntimeError('Installed module version must match the current source version before testing')
        if not installed_name:
            raise RuntimeError('Installed module version name unavailable')
        pid = ar.shell('pidof com.android.systemui').strip()
        runtime = current_systemui(ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True),
                                  pid, ar.shell('settings get global boot_count').strip(), installed_name[1])
        if ar.shell('pidof com.android.systemui').strip() != pid:
            raise RuntimeError('SystemUI changed while checking its loaded build')
        sources = ['android/app/src/main/java/ls/augment/com/hook/NotificationCascadeHook.java',
                   'android/app/src/main/java/ls/augment/com/NotificationCascadePolicy.java',
                   'android/app/src/main/java/ls/augment/com/NotificationLayoutPolicy.java',
                   'android/app/src/main/java/ls/augment/com/hook/NotificationAppearanceHook.java',
                   'android/app/src/main/java/ls/augment/com/hook/NotificationViewportInset.java',
                   'android/app/src/androidTest/java/ls/augment/com/C17RuntimeFixtureCases.java']
        save(output / 'source-evidence.json', {'installedVersionCode': installed[1],
             'viewportProfile': args.viewport_profile, 'requestedSettings': values,
             'fixture': fixture_evidence, 'systemuiRuntime': runtime,
             'sourceSha256': {name: hashlib.sha256((ar.ROOT / name).read_bytes()).hexdigest() for name in sources}})
        baseline_report = ar.instrument('snapshot', 'baseline')
        if str(baseline_report.get('moduleVersion')) != version or baseline_report.get('status') != 'pass':
            raise RuntimeError('Test APK reports a different build or failed baseline; no settings written')
        baseline = baseline_report['settings']
        restore = {key: baseline[key] for key in values}
        journal = {'schema': 1, 'pending': True, 'values': restore, 'baselineSettings': baseline,
                   'metadata': {'serial': ar.SERIAL, 'installedVersionCode': int(version),
                                'installedVersionName': installed_name[1], 'testVersionCode': baseline_report['moduleVersion'],
                                'viewportProfile': args.viewport_profile, 'requestedSettings': values,
                                'fixture': fixture_evidence, 'systemuiRuntime': runtime,
                                'createdAtUnixMs': int(time.time() * 1000)}}
        save_journal(output / 'restore.json', journal)
        ar.instrument('set', 'notification-profile-before-fixture', values)
        ar.shell('input keyevent 224'); ar.shell('wm dismiss-keyguard')
        ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
        for phase in (('scroll', 'actions') if args.case == 'all' else (args.case,)):
            audit = Audit(output, phase, args.seconds, max(1, min(50, args.max_steps)))
            audits.append(audit)
            try:
                audit.fixture.start()
                journal.setdefault('fixtures', []).append({'phase': phase, 'runId': audit.fixture.run_id,
                     'notificationTag': audit.fixture.tag, 'progressPath': audit.fixture.path,
                     'seconds': args.seconds})
                save_journal(output / 'restore.json', journal)
                (audit.scroll_case if phase == 'scroll' else audit.actions_case)()
            except Exception:
                error = traceback.format_exc()
            finally:
                try:
                    audit.fixture.finish()
                finally:
                    reports.append(audit.report())
                    save(output / (phase + '-report.json'), audit.report())
            if error:
                break
    except Exception:
        error = (error or '') + '\n' + traceback.format_exc()
    finally:
        safe = all(a.fixture.proc is None or (a.fixture.proc.poll() is not None and a.fixture.cleanup_confirmed) for a in audits)
        try:
            if restore and safe:
                ar.instrument('set', 'restore-after-fixture-cleanup', restore)
                current_report = ar.instrument('snapshot', 'restored')
                if str(current_report.get('moduleVersion')) != version or current_report.get('status') != 'pass':
                    raise RuntimeError('Restoration snapshot came from a different test build or failed')
                restored = restored_settings(journal, current_report['settings'], safe)
                save_journal(output / 'restore.json', journal)
            elif restore:
                error = (error or '') + '\nFixture cleanup unconfirmed: restore.json retained; no module instrumentation launched.'
            ar.shell('cmd statusbar collapse')
        except Exception:
            error = (error or '') + '\n' + traceback.format_exc()
        checks = {}
        for report in reports:
            outcome = report['outcomes']
            if report['phase'] == 'scroll':
                result = outcome.get('scroll', {})
                checks['allSixReadableCandidatesIncludingOwnedTail'] = bool(result.get('allSixFullyObservedCandidates') and result.get('lastOwnedReadableEvidence'))
            else:
                if 'expand' in outcome:
                    checks['expandNativeControlAndContent'] = bool(outcome['expand'].get('nativeCollapseControlObserved') and outcome['expand'].get('longTextFullyInBounds'))
                if 'collapse' in outcome:
                    checks['collapseAfterReading'] = bool(outcome['collapse'].get('nativeExpandControlObserved')
                        and outcome['collapse'].get('nativeHeightDecreased') and outcome['collapse'].get('ownedNotificationPreserved'))
                if 'click' in outcome:
                    checks['ownedClickCallbackAndActivity'] = bool(outcome['click'].get('ownContentActivityObserved') and outcome['click'].get('matchingCallbackReceived'))
                if 'swipe' in outcome:
                    checks['onlyOwnedSwipeTargetRemoved'] = bool(outcome['swipe'].get('onlyTargetOwnedIdRemoved') and outcome['swipe'].get('unrelatedKeySetUnchanged'))
        save(output / 'report.json', {'version': version, 'cases': reports, 'settingsRestored': restored,
             'viewportProfile': args.viewport_profile, 'requestedSettings': values,
             'pending': None if journal is None else journal['pending'],
             'clearAll': 'not-exercised: OEM clear-all cannot isolate this fixture from user notifications',
             'error': error, 'visualReviewRequired': True, 'testCompleted': not error and restored,
             'machineChecks': checks, 'requestedMachineChecks': sorted(requested_checks(args.case)),
             'allRequestedMachineChecksConfirmed': set(checks) == requested_checks(args.case) and all(checks.values()),
             'productionHooksModified': False, 'neverClearsUserNotifications': True})
    if error or not restored:
        raise RuntimeError('Native stack audit incomplete; inspect ' + str(output / 'report.json'))
    print(output / 'report.json', flush=True)


if __name__ == '__main__':
    main()
