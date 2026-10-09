"""Opt-in A/B two-row closure collector. No production/test APK modifications.

Imports never contact a device. C notification transitions are deliberately absent.
Only existing clock/font assets, two row keys and B font_scale/user_rotation are owned.
"""
from pathlib import Path
import argparse
import base64
import datetime
import importlib.util
import io
import json
import re
import shlex
import struct
import time
import traceback
import uuid
import xml.etree.ElementTree as ET

import statusbar_rows_closure_core as core

ROOT = Path(__file__).resolve().parents[1]


def load(name, filename):
    spec = importlib.util.spec_from_file_location(name, ROOT/'tools'/filename)
    result = importlib.util.module_from_spec(spec); spec.loader.exec_module(result)
    return result


font = load('rows_existing_assets', 'run-main-font-existing-gif-device.py')
clear = load('rows_readonly_identity', 'run-safe-notification-clear-device.py')
base, extra = font.base, font.extra
atomic, difference = core.atomic, core.difference
SYSTEM, NOTIFICATIONS, ART, FONT = core.SYSTEM, core.NOTIFICATIONS, core.ART, core.FONT
APP = 'ls.augment.com'
EDITOR_ACTIVITY=APP+'/.StatusBarSettingsActivity'
EDITOR_STARTS={
    'am start -W -n '+EDITOR_ACTIVITY+' --es module_route '+route+' --es status_component '+component:
        {'activity':EDITOR_ACTIVITY,'route':route,'component':component}
    for route,component in [('status_icons','system_icons'),('status_notifications','notifications')]}
EDITOR_ENTRY_POLICY='development-root-exact-two-editors-v1'
FIXTURE = 'ls.augment.regression.safeaudit'
FIXTURE_APK = ROOT/'out/header-clock-20455/landscape-fixture/safe-audit.apk'
FIXTURE_SHA = 'd93620ad2bf9c8bd1c1ef362d18bbe2ce73f1f0a3d4dffb6a4e0a87dface49e1'
MAX_SECONDS = 900
SUPPORTED_CASES = core.AB_CASES


class NativeNotReady(core.Unobserved):
    """Only a known owned transition may use the finite native-only retry."""


def volume_match_observation(image,bar_bounds,reference_mask):
    """Same .96/.90 native-ink test, but preserve negative pixel evidence."""
    import numpy as np
    l,t,r,b=bar_bounds;area=font.dark_mask(image.crop((l,t,r,b)))
    h,w=area.shape;th,tw=reference_mask.shape
    result={'matched':False,'thresholds':{'minimumIou':.96,'maximumDisjointIouExclusive':.90},
        'method':'whole-statusbar reviewed physical native-ink template','visualPass':False}
    if th>h or tw>w or reference_mask.sum()<50:
        return dict(result,error='No usable native ink template/window')
    shape=(h+th-1,w+tw-1)
    intersection=np.rint(np.fft.irfftn(np.fft.rfftn(area,s=shape,axes=(0,1))*
        np.fft.rfftn(reference_mask[::-1,::-1],s=shape,axes=(0,1)),s=shape,axes=(0,1))).astype(int)[th-1:h,tw-1:w]
    sums=np.pad(area.astype(int),((1,0),(1,0))).cumsum(0).cumsum(1)
    count=sums[th:,tw:]-sums[:-th,tw:]-sums[th:,:-tw]+sums[:-th,:-tw]
    score=intersection/np.maximum(1,count+int(reference_mask.sum())-intersection)
    y,x=np.unravel_index(score.argmax(),score.shape);best=float(score[y,x])
    remaining=score.copy();remaining[max(0,y-th):y+th,max(0,x-tw):x+tw]=0;second=float(remaining.max())
    result.update(candidateBounds=[l+int(x),t+int(y),l+int(x)+tw,t+int(y)+th],iou=best,secondDisjointIou=second)
    if best<.96 or second>=.90:return dict(result,error='Native vibration ink missing/ambiguous; threshold unchanged')
    return dict(result,matched=True,bounds=result['candidateBounds'])


def package_hash(ar, package):
    if not re.fullmatch(r'[A-Za-z][\w.]+', package): raise ValueError('Invalid package')
    paths = ar.shell('pm path '+package).splitlines()
    if len(paths) != 1 or not paths[0].startswith('package:'): raise core.Unobserved('APK absent or split/ambiguous: '+package)
    path = paths[0][8:]
    result = ar.shell('sha256sum '+shlex.quote(path), root=True)
    match = re.fullmatch(r'([a-f0-9]{64})\s+(.+)', result)
    if not match or match[2] != path: raise core.Unobserved('Exact package hash unavailable')
    return match[1]


def strong_identity(ar, name):
    result = font.process_identity(ar, name)
    result['startTicks'] = clear.proc_start(ar.shell('cat /proc/'+str(result['pid'])+'/stat', root=True), result['pid'])
    if ar.shell('pidof com.android.systemui') != str(result['pid']): raise core.Unobserved('SystemUI changed while reading identity')
    return result


def keyguard(raw):
    match = re.search(r'(?m)^\s*KeyguardServiceDelegate\s*$(.*?)(?=\n\s*\S[^=\n]*:\s*\n|\Z)', raw, re.S)
    if not match: raise core.Unobserved('Native KeyguardServiceDelegate state unavailable')
    values = {}
    for name in ('showing', 'secure'):
        found = re.findall(r'(?m)^\s*'+name+r'=(true|false)\s*$', match[1])
        if len(found) != 1: raise core.Unobserved('Unknown keyguard '+name)
        values[name] = found[0] == 'true'
    occluded = re.findall(r'\bmKeyguardOccluded=(true|false)\b', raw)
    if len(occluded) != 1: raise core.Unobserved('Keyguard occlusion state unknown')
    values['occluded'] = occluded[0] == 'true'
    return values


def raw_preferences(raw):
    tree = ET.fromstring(raw)
    if tree.tag != 'map': raise core.Unobserved('Configuration XML unavailable')
    result = {}
    for item in tree:
        key = item.get('name')
        if key in result: raise core.Unobserved('Duplicate preference key')
        result[key] = [item.tag, item.get('value'), item.text or '']
    return result


def resolve_raw(raw, baseline_raw, baseline):
    result = {}
    for key, original in baseline.items():
        item = raw.get(key)
        if item is None:
            if key in baseline_raw: raise core.Unobserved('Registered preference disappeared: '+key)
            result[key] = original  # Unchanged absent default, anchored to initial full snapshot.
        elif item[0] == 'string': result[key] = item[2]
        else: raise core.Unobserved('Unexpected registered preference type')
    return result


def prerequisites(settings):
    if len(settings) != 497 or not all(isinstance(v, str) for v in settings.values()): raise core.Unobserved('Full497 baseline required')
    if settings.get('ls_augment_systemui_master') not in ('1', 'true') or settings.get('ls_augment_statusbar_position_size_only') != '0':
        raise core.Unobserved('Existing active row-customization prerequisite absent; no enabling/hiding neighbours')
    if settings.get('ls_augment_notification_summary_enabled') not in ('0', 'false') or settings.get('ls_augment_statusbar_notification_hide') != '0':
        raise core.Unobserved('Native notification group is suppressed; no test substitution')
    raw = settings.get('ls_augment_statusbar_grid_v2', '')
    for group in ('notifications', 'system_icons'):
        entries = [p.split(',') for p in raw.split(';')[1:] if p.startswith(group+',')]
        if len(entries) != 1 or entries[0][-1] != '1': raise core.Unobserved('Original group is hidden/unknown: '+group)


class Collector(base.Collector):
    def __init__(self, ar, folder, journal, report):
        if journal.data['metadata']['case'] not in SUPPORTED_CASES:raise ValueError('A/B collector cannot execute or recover C')
        super().__init__(ar, folder, journal, report)
        self.deadline = time.monotonic()+MAX_SECONDS
        self.recovering = False
        self.fixture_active = False
        d = journal.data
        if d['targets'] != (font.targets(d['baseline']) if d['metadata']['case'] == core.CASES[0] else {}):
            raise ValueError('Asset targets do not match exact reviewed merge')
        font.validate_schema(d['metadata']['runtimeSchema'], d['metadata']['installedVersion'], d['baseline'])

    def bounded(self):
        if not self.recovering and time.monotonic() > self.deadline: raise core.Unobserved('Finite case deadline expired')

    def instrument(self, operation, label, values=None, *, tracked=False, current=None, recovery=False):
        if operation not in ('snapshot', 'set', 'statusbar-assets-runtime'): raise ValueError('Unreviewed operation')
        if operation == 'set':
            self.journal.values(values)
            if not tracked: raise ValueError('Every set must enter the exact journal transport')
        self.sequence += 1; label = '%03d-%s' % (self.sequence, label)
        folder = self.folder/label; folder.mkdir()
        command = 'am instrument -w -r -e operation '+operation+' -e label '+shlex.quote(label)
        if values is not None:
            encoded = base64.b64encode(json.dumps(values, ensure_ascii=False).encode()).decode()
            command += ' -e values '+shlex.quote(encoded)
        command += ' ls.augment.com.test/ls.augment.com.DeviceRegressionRunner'
        if tracked:
            now = time.monotonic()
            output = core.invoke_logged(folder/'transport.json', command,
                lambda: self.ar.shell(command, timeout=60), now, now+core.FRESH_SECONDS,
                journal=self.journal, values=values, current=current, recovery=recovery)
        else: output = self.ar.shell(command, timeout=60)
        (folder/'instrumentation.txt').write_text(output, encoding='utf-8')
        if 'INSTRUMENTATION_RESULT: status=pass' not in output: raise core.Unobserved('Instrumentation unsuccessful: '+label)
        raw = self.ar.shell('cat '+shlex.quote(base.APP+'files/device-regression-results/'+label+'.json'), root=True)
        (folder/'result-private.json').write_text(raw, encoding='utf-8'); result = json.loads(raw)
        if result.get('moduleVersion') != self.journal.data['metadata']['installedVersion'] or result.get('status') != 'pass':
            raise core.Unobserved('Test result version/status mismatch')
        return result

    def identity(self, label):
        m = self.journal.data['metadata']
        observed = {'version': list(base.version(self.ar.shell('dumpsys package '+APP))),
            'mainApkSha256': package_hash(self.ar, APP), 'testApkSha256': package_hash(self.ar, APP+'.test'),
            'observerApkSha256': package_hash(self.ar, 'ls.augment.regression.ui'),
            'process': strong_identity(self.ar, m['installedVersionName'])}
        expected = {k: m[k] for k in ('mainApkSha256', 'testApkSha256', 'observerApkSha256', 'process')}
        expected['version'] = [m['installedVersion'], m['installedVersionName']]
        if m['case'] == 'profiles':
            observed['fixtureApkSha256'] = package_hash(self.ar, FIXTURE)
            expected['fixtureApkSha256'] = m['fixtureApkSha256']
        atomic(self.folder/(label+'-identity.json'), dict(observed=observed, differences=difference(expected, observed)))
        if difference(expected, observed): raise core.Unobserved('Exact original APK/observer/process generation changed')

    def native(self):
        return dict(super().native(), **{'global/bluetooth_on': self.ar.shell('settings get global bluetooth_on'),
            'system/screen_off_timeout': self.ar.shell('settings get system screen_off_timeout'),
            'nightPreference': self.ar.shell('cmd uimode night'), 'density': self.ar.shell('wm density'),
            'displaySize': self.ar.shell('wm size')})

    def protect(self, label, expected_native=None):
        d = self.journal.data
        result = {'resources': difference(d['resourcesBefore'], self.resources()),
            'names': difference(d['namesBefore'], self.names()),
            'native': difference(expected_native if expected_native is not None else self.journal.expected(True), self.native())}
        atomic(self.folder/(label+'-protection.json'), result)
        d['lastProtection'] = {'label':label, 'differences':result}; self.journal.save()
        if any(result.values()): raise core.Unobserved('Protected original data/profile changed; preserve external state')
        return result

    def notifications(self, label):
        raw = self.ar.shell('dumpsys notification', timeout=40)
        (self.folder/(label+'-notification-private.txt')).write_text(raw, encoding='utf-8')
        records = clear.notification_records(raw)
        result = {'label': label, 'identities': records, 'sameOriginalIdentities': records == self.journal.data['metadata']['notificationsBefore'],
                  'countIsNotStatusbarIconCount': True, 'mutation': False}
        atomic(self.folder/(label+'-notification-identities-private.json'), result)
        self.report.setdefault('notificationObservations', []).append(result); self.persist()
        return result

    def config(self, label): return self.instrument('snapshot', label)['settings']

    def assert_config(self, actual):
        if difference(self.journal.expected(), actual): raise core.Unobserved('Full497 differs from latest confirmed state')

    def raw_settings(self, label):
        raw = self.ar.shell('cat '+base.APP+'shared_prefs/ls_augment_config_v2.xml', root=True)
        (self.folder/(label+'-config-private.xml')).write_text(raw, encoding='utf-8')
        return resolve_raw(raw_preferences(raw), self.journal.data['metadata']['rawBaseline'], self.journal.data['baseline'])

    def set(self, label, values):
        self.bounded(); self.identity(label); self.protect(label)
        current = self.config(label+'-before'); self.assert_config(current)
        if all(current[k] == v for k, v in values.items()): return
        self.instrument('set', label, values, tracked=True, current=current)
        for i in range(5):
            actual = self.config(label+'-readback-'+str(i))
            if actual == dict(current, **values):
                self.journal.acknowledge(values, actual); return
            if any(k not in values for k in difference(dict(current, **values), actual)): raise core.Unobserved('Unrelated save difference')
            time.sleep(.35)
        raise core.Unobserved('Save not settled; no further phase')

    def set_font_scale(self, value):
        self.bounded(); self.identity('font-scale-'+value); self.protect('font-scale-'+value)
        current = self.native(); key = 'system/font_scale'
        if current[key] == value: return
        command = 'settings --user 0 put system font_scale '+value
        observation = self.native_observe('font-scale-'+value+'-before')
        core.invoke_logged(self.folder/('font-scale-'+value+'-transport.json'), command,
            lambda: self.ar.shell(command), observation['started'], self.deadline,
            journal=self.journal, values={key:value}, current=current, native=True)
        actual = self.native(); self.journal.acknowledge({key:value}, actual, True)

    def native_observe(self, label, *, component=None, rotation=None, allow_rotation_mismatch=False,
                       ready_transition=False, read_deadline=None):
        """No UiAutomation: safe to call inside a direction/profile transition."""
        self.bounded();folder=self.folder/label;folder.mkdir(exist_ok=True)
        def budget():
            remaining=read_deadline-time.monotonic()
            if remaining<=0:raise core.Unobserved('Native readiness deadline expired')
            return min(40,remaining)
        def read(command):
            return self.ar.shell(command,timeout=budget()) if read_deadline is not None else self.ar.shell(command)
        power=read('dumpsys power')
        if not re.search(r'\bmWakefulness=Awake\b',power):raise core.Unobserved('Native transition requires already-awake phone')
        started=time.monotonic()
        png=self.ar.adb('exec-out','screencap','-p',timeout=budget()) if read_deadline is not None else self.ar.adb('exec-out','screencap','-p')
        (folder/'screen.png').write_bytes(png)
        if png[:8]!=b'\x89PNG\r\n\x1a\n' or len(png)<24:raise core.Unobserved('Native transition PNG unavailable')
        size=struct.unpack('>II',png[16:24])
        native=read('dumpsys activity activities');wm=read('dumpsys window windows')
        displays=read('dumpsys window displays')
        (folder/'activity-private.txt').write_text(native,encoding='utf-8');(folder/'windows-private.txt').write_text(wm,encoding='utf-8')
        (folder/'display-private.txt').write_text(displays,encoding='utf-8')
        display=core.primary_rotation(displays)
        rotation_value=read('settings --user 0 get system user_rotation')
        mode=read('settings --user 0 get system accelerometer_rotation')
        expected=self.journal.expected(True)['system/user_rotation']
        if mode!='0' or rotation_value!=expected:raise core.Unobserved('Unexpected native rotation value; never adopt an observer/caller side effect')
        physical=display['actualRotation']
        if physical not in ('0','1') or display['mode']!='USER_ROTATION_LOCKED' or display['userRotation']!=rotation_value:
            raise core.Unobserved('Reverse/unknown or unsynchronized native rotation; no observer/input')
        components={self.journal.data['metadata']['homeComponent'],FIXTURE+'/.PlainActivity',FIXTURE+'/.LandscapeActivity'}
        proof_size=size
        if ready_transition:
            # A screencap and WM dump can straddle a rotation. Validate every
            # native surface against its own known full-display shape first;
            # unknown focus/overlay/layer never becomes a retryable mismatch.
            title=core.focus_title(native)
            if core.canonical_component(title) not in {core.canonical_component(c) for c in components}:
                raise core.Unobserved('Unknown foreground during native transition')
            matches=[r for r in core.window_records(wm) if r['title']==title]
            if len(matches)!=1:raise core.Unobserved('Ambiguous native transition owner')
            bounds=matches[0]['bounds']
            if bounds[:2]!=(0,0) or bounds[2:] not in (tuple(size),tuple(reversed(size))):
                raise core.Unobserved('Unknown native transition frame, not a rotated full display')
            proof_size=bounds[2:]
        proof=core.native_owner(native,wm,proof_size,components if ready_transition else ({component} if component else components),
            self.journal.data['metadata']['process']['pid'])
        policy=keyguard(read('dumpsys window policy'))
        if policy['showing']:raise core.Unobserved('Keyguard blocks owned direction transition')
        reasons=[]
        if (size[0]>size[1])!=(physical=='1') or tuple(proof_size)!=tuple(size):reasons.append('PNG/native frame straddles rotation')
        if not allow_rotation_mismatch and physical!=rotation_value:reasons.append('Native physical angle not at confirmed target')
        if rotation is not None and (rotation_value!=rotation or physical!=rotation):reasons.append('Target direction not ready')
        if component is not None and proof['component']!=core.canonical_component(component):reasons.append('Known owned previous component still focused')
        result=dict(started=started,size=size,native=native,wm=wm,png=png,proof=proof,rotation=rotation_value)
        atomic(folder/'native-proof.json',dict(proof,displayRotation=display,physicalRotation=physical,userRotation=rotation_value,
            started=started,ended=time.monotonic(),ready=not reasons,notReadyReasons=reasons))
        if reasons:
            if ready_transition:raise NativeNotReady('; '.join(reasons))
            raise core.Unobserved('; '.join(reasons))
        if read_deadline is not None:budget()
        return result

    def native_launch(self, label, command, observation):
        allowed={'input keyevent KEYCODE_HOME','am start -W --activity-clear-top -n '+FIXTURE+'/.PlainActivity','am start -W --activity-clear-top -n '+FIXTURE+'/.LandscapeActivity'}
        if command not in allowed:raise ValueError('Native-only input cannot click or launch user apps')
        result=core.invoke_logged(self.folder/(label+'-action.json'),command,lambda:self.ar.shell(command,timeout=20),
            observation['started'],self.deadline if not self.recovering else time.monotonic()+core.FRESH_SECONDS)
        returned=time.monotonic()
        (self.folder/(label+'-transport-output.txt')).write_text(result,encoding='utf-8')
        if command.startswith('am start'):
            statuses=re.findall(r'(?m)^Status:\s*(\S+)\s*$',result)
            activities=re.findall(r'(?m)^Activity:\s*(\S+)\s*$',result)
            requested=core.canonical_component(command.rsplit(' ',1)[1])
            if statuses!=['ok'] or len(activities)!=1 or re.search(r'Error:|Exception|Permission Denial',result):
                raise core.Unobserved('Launch returned missing/ambiguous result; no retry')
            if core.canonical_component(activities[0])!=requested:
                raise core.Unobserved('Launch returned a different actual Activity; no readiness retry')
        return returned

    def await_native_ready(self,label,component,rotation,returned_at):
        deadline=min(returned_at+6,self.deadline if not self.recovering else returned_at+6)
        consecutive=0;result=None
        for i in range(6):
            if time.monotonic()>=deadline:break
            try:
                result=self.native_observe(label+'-target-'+str(i),component=component,rotation=rotation,
                    ready_transition=True,read_deadline=deadline)
                if time.monotonic()>deadline:break
                consecutive+=1
                if consecutive==2:return result
            except NativeNotReady:
                consecutive=0
            remaining=deadline-time.monotonic()
            if remaining>.15:time.sleep(.15)
        raise core.Unobserved('Two native ready proofs not established in one 6-second window; no repeat input')

    def profile_transition(self, label, rotation, activity, *, recovery=False):
        self.bounded();self.identity(label)
        current=self.native();conflicts=self.journal.conflicts(current,True)
        if conflicts:raise core.Unobserved('Native profile changed before transition; no ownership expansion')
        # The known old activity may still have its explicit orientation after
        # settings is changed. Both proofs in this interval are native-only.
        ob=self.native_observe(label+'-native-before',allow_rotation_mismatch=True)
        key='system/user_rotation'
        if current[key]!=rotation:
            command='settings --user 0 put system user_rotation '+rotation
            core.invoke_logged(self.folder/(label+'-rotation-transport.json'),command,lambda:self.ar.shell(command),
                ob['started'],self.deadline if not self.recovering else time.monotonic()+core.FRESH_SECONDS,
                journal=self.journal,values={key:rotation},current=current,native=True,recovery=recovery)
            actual=self.native();self.journal.acknowledge({key:rotation},actual,True,recovery)
        ob=self.native_observe(label+'-before-intent',allow_rotation_mismatch=True)
        target=FIXTURE+'/.'+activity
        returned=self.native_launch(label+'-intent','am start -W --activity-clear-top -n '+target,ob)
        # Two bounded native proofs; no UiAutomation may connect until both
        # exact component, physical direction and planned setting agree.
        self.await_native_ready(label,target,rotation,returned)
        self.fixture_active=True

    def native_home(self, label):
        ob=self.native_observe(label+'-before',allow_rotation_mismatch=True)
        returned=self.native_launch(label,'input keyevent KEYCODE_HOME',ob)
        ob=self.await_native_ready(label,self.journal.data['metadata']['homeComponent'],'0',returned)
        self.fixture_active=False
        return ob

    def observe(self, label, *, awake=True):
        self.bounded(); folder = self.folder/label; folder.mkdir(exist_ok=True)
        native_proof=None
        if self.journal.data['metadata']['case']=='profiles':
            native_proof=self.native_observe(label+'-pre-observer-rotation')
            png=native_proof['png'];started=native_proof['started']
        else:
            power = self.ar.shell('dumpsys power'); (folder/'power-private.txt').write_text(power, encoding='utf-8')
            if awake and not re.search(r'\bmWakefulness=Awake\b', power): raise core.Unobserved('Root must wake first; no automatic wake')
            png = self.ar.adb('exec-out', 'screencap', '-p');started=time.monotonic()
        (folder/'screen.png').write_bytes(png)
        if png[:8] != b'\x89PNG\r\n\x1a\n' or len(png) < 24: raise core.Unobserved('PNG unavailable')
        size = struct.unpack('>II', png[16:24])
        if native_proof:
            windows=core.invoke_logged(folder/'observer-transport.json','owned-ui-observer',lambda:self.ui.all_windows(label),
                started,self.deadline if not self.recovering else time.monotonic()+core.FRESH_SECONDS)
        else:windows = self.ui.all_windows(label)
        native = self.ar.shell('dumpsys activity activities')
        wm = self.ar.shell('dumpsys window windows')
        (folder/'activity-private.txt').write_text(native, encoding='utf-8')
        (folder/'windows-private.txt').write_text(wm, encoding='utf-8')
        if self.journal.data['metadata']['case']=='profiles':
            observed_rotation=self.ar.shell('settings --user 0 get system user_rotation')
            if observed_rotation!=self.journal.expected(True)['system/user_rotation']:
                raise core.Unobserved('Observer changed protected rotation unexpectedly; no adoption')
        observation = dict(windows=windows, native=native, wm=wm, size=size, started=started)
        atomic(folder/'interval.json', {'treeStarted':started, 'ended':time.monotonic(), 'pngBeforeTree':True, 'size':size})
        return observation

    def owner(self, observation, packages, area=None, navigation=False):
        return core.owner(observation['windows'], observation['native'], observation['wm'], observation['size'], packages, area,
                          self.journal.data['metadata']['process']['pid'] if navigation else None,
                          self.journal.data['metadata']['process']['pid'])

    def action(self, label, command, observation, *, values=None, current=None):
        self.bounded()
        editor=EDITOR_STARTS.get(command)
        if not (command in ('input keyevent KEYCODE_HOME', 'input keyevent KEYCODE_BACK', 'input keyevent KEYCODE_SLEEP', 'wm dismiss-keyguard')
                or re.fullmatch(r'input tap \d+ \d+', command)
                or editor is not None
                or command in ('am start -W -n '+FIXTURE+'/.PlainActivity', 'am start -W -n '+FIXTURE+'/.LandscapeActivity')):
            raise ValueError('Command outside bounded A/B input list')
        if editor is not None:
            if values is not None:raise ValueError('Editor entry cannot claim a setting mutation')
            atomic(self.folder/(label+'-transport-policy.json'),dict(editor,policy=EDITOR_ENTRY_POLICY,
                requestedRootTransport=True,exactCommand=command,actualTransportReceipt=label+'-action.json',
                navigationCoverage='direct-owned-editor; not homepage-path verification'))
        result=core.invoke_logged(self.folder/(label+'-action.json'), command, lambda: self.ar.shell(command, root=editor is not None, timeout=20),
            observation['started'], self.deadline if not self.recovering else time.monotonic()+core.FRESH_SECONDS,
            journal=self.journal if values else None, values=values, current=current)
        if editor is not None:
            (self.folder/(label+'-launch-output.txt')).write_text(result,encoding='utf-8')
            statuses=re.findall(r'(?m)^Status:\s*(\S+)\s*$',result)
            activities=re.findall(r'(?m)^Activity:\s*(\S+)\s*$',result)
            valid=(statuses==['ok'] and len(activities)==1 and not re.search(r'Error:|Exception|Permission Denial',result)
                and core.canonical_component(activities[0])==core.canonical_component(editor['activity']))
            atomic(self.folder/(label+'-launch-receipt.json'),dict(policy=EDITOR_ENTRY_POLICY,statuses=statuses,
                actualActivities=activities,expectedActivity=editor['activity'],valid=bool(valid)))
            if not valid:raise core.Unobserved('Exact editor launch result unavailable; no tap or retry')
        return result

    def editor_switch(self,observation,title):
        if core.canonical_component(core.focus_title(observation['native']))!=core.canonical_component(EDITOR_ACTIVITY):
            raise core.Unobserved('Actual focused Activity is not the requested internal editor')
        node=core.row_switch(observation['windows'],title);area=core.rect(node['bounds'])
        if not core.inside(area,(0,0,*observation['size'])):raise core.Unobserved('Editor switch clipped')
        self.owner(observation,{APP},area)
        return node

    def navigation(self, label, command):
        ob = self.observe(label+'-before')
        packages = {APP, self.journal.data['metadata']['homeComponent'].split('/')[0]}
        if self.journal.data['metadata']['case'] == 'profiles': packages.add(FIXTURE)
        self.owner(ob, packages, navigation=True)
        policy = keyguard(self.ar.shell('dumpsys window policy'))
        if policy['showing']: raise core.Unobserved('Lockscreen blocks ordinary navigation')
        self.action(label, command, ob); time.sleep(.55)

    def home(self, label):
        self.navigation(label, 'input keyevent KEYCODE_HOME')
        ob = self.observe(label+'-reached')
        self.owner(ob, {self.journal.data['metadata']['homeComponent'].split('/')[0]}, navigation=True)
        if ob['size'][0] >= ob['size'][1]: raise core.Unobserved('Actual HOME did not become portrait')
        self.fixture_active = False

    def ui_row(self, key, value, label):
        route, component, title = ('status_icons', 'system_icons', '系统图标分两排') if key == SYSTEM else ('status_notifications', 'notifications', '通知图标分两排')
        self.identity(label); self.protect(label); self.assert_config(self.config(label+'-before-ui'))
        command = 'am start -W -n '+APP+'/.StatusBarSettingsActivity --es module_route '+route+' --es status_component '+component
        self.navigation(label+'-open', command)
        current = self.raw_settings(label+'-draft-before'); self.assert_config(current)
        ob = self.observe(label+'-switch'); node = self.editor_switch(ob,title)
        area = core.rect(node['bounds']); point = ((area[0]+area[2])//2, (area[1]+area[3])//2)
        if not core.inside(area, (0,0,*ob['size'])): raise core.Unobserved('Switch clipped')
        self.owner(ob, {APP}, (point[0],point[1],point[0]+1,point[1]+1))
        if node.get('checked') is not (current[key] == '1'): raise core.Unobserved('UI checked value differs from saved value')
        if current[key] != value:
            self.action(label+'-toggle', 'input tap %d %d'%point, ob, values={key:value}, current=current)
            for i in range(8):
                time.sleep(.3); actual = self.raw_settings(label+'-saved-'+str(i))
                if actual == dict(current, **{key:value}): self.journal.acknowledge({key:value}, actual); break
                if any(k != key for k in difference(dict(current, **{key:value}), actual)): raise core.Unobserved('UI changed an unowned key')
            else: raise core.Unobserved('UI auto-save did not settle')
        # The BACK and explicit reopen are both observed inputs, not guessed UI coordinates.
        self.navigation(label+'-return', 'input keyevent KEYCODE_BACK')
        self.navigation(label+'-reopen', command)
        reopened = self.observe(label+'-reopened'); node = self.editor_switch(reopened,title)
        if node.get('checked') is not (value == '1'): raise core.Unobserved('Reopened switch value changed')
        self.assert_config(self.raw_settings(label+'-reopened'))
        self.home(label+'-home'); self.assert_config(self.config(label+'-confirmed'))
        self.report.setdefault('uiReadbacks', []).append({'key':key, 'value':value, 'evidence':label+'-reopened',
            'savedAndReopened':True,'entryPolicy':EDITOR_ENTRY_POLICY,'navigationCoverage':'direct-owned-editor'}); self.persist()

    def diagnostic(self, label):
        raw = self.ar.shell('cat '+base.APP+'shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
        (self.folder/(label+'-diagnostics-private.xml')).write_text(raw, encoding='utf-8')
        tree = ET.fromstring(raw)
        return {n.get('name'):n.text for n in tree if 'statusbar' in n.get('name', '')}

    def capture(self, label, frames=2, *, surface='main', animation=False, wide=False):
        from PIL import Image
        self.bounded(); self.identity(label); self.assert_config(self.raw_settings(label+'-before'))
        inventory = None
        if surface == 'main':
            if self.journal.data['metadata']['case']=='profiles':self.native_observe(label+'-before-inventory')
            after = int(self.ar.shell('date +%s%3N'))
            inventory = self.inventory(label, after)
            if animation:
                targets = [x for x in base.visible_rows(inventory) if x.get('id') == 'volume' and x.get('capability') == 'whole_layers']
                if len(targets) != 1 or targets[0].get('matchedAsset') != font.GIF or targets[0].get('application') not in ('applied', 'ready') or inventory.get('runtime', {}).get('powerSave'):
                    raise core.Unobserved('Current volume GIF prerequisite not observed')
        ob = self.observe(label)
        if (ob['size'][0] > ob['size'][1]) != wide: raise core.Unobserved('Actual pixel orientation differs from requested profile')
        if surface == 'lock':
            state = keyguard(self.ar.shell('dumpsys window policy'))
            if not state['showing'] or state['secure'] or state['occluded']: raise core.Unobserved('Actual unobscured non-secure keyguard absent')
            self.owner(ob, {'com.android.systemui'}, navigation=True)
        else:
            background = FIXTURE if self.fixture_active else self.journal.data['metadata']['homeComponent'].split('/')[0]
            self.owner(ob, {background}, navigation=True)
        nodes = [n for w in ob['windows'] for n, _ in core.walk(w.get('root', {})) if n.get('visible')]
        bars = [n for n in nodes if n.get('id') == 'com.android.systemui:id/status_bar'] if surface == 'main' else [n for n in nodes if n.get('id') in ('com.android.systemui:id/keyguard_status_bar', 'com.android.systemui:id/keyguard_header')]
        bar = None
        if len(bars) == 1:
            candidate = core.rect(bars[0].get('bounds'))
            if core.inside(candidate, (0,0,*ob['size'])): bar = candidate
        if surface == 'main' and (bar is None or bar[0] != 0 or bar[1] != 0 or bar[2] != ob['size'][0] or bar[3] > ob['size'][1]*.2):
            raise core.Unobserved('Whole physical main statusbar bounds unavailable')
        row = dict(label=label, surface=surface, actualSize=ob['size'], wholeStatusBarBounds=bar,
            geometry=nodes, inventory=inventory, frameTimes=[], expectedModule=self.journal.expected(),
            nativeProfile=self.native(), resourceConfiguration=self.ar.shell('cmd activity get-config'),
            diagnostics=self.diagnostic(label), status='collecting', visualPass=False)
        if surface=='lock' and bar is None:
            row['scopeLimitation']='Actual keyguard observed; eligible keyguard statusbar container absent, no positive row claim'
        self.report['cases'].append(row); self.persist(); images=[]; matches=[]
        if animation:row['nativeInkObservations']=matches
        template = font.dark_mask(Image.open(font.REFERENCE).crop(font.REFERENCE_BOX)) if animation else None
        for i in range(frames):
            self.bounded(); start=time.monotonic(); raw=self.ar.adb('exec-out','screencap','-p'); end=time.monotonic()
            image=Image.open(io.BytesIO(raw)).convert('RGB')
            if image.size != tuple(ob['size']): raise core.Unobserved('Orientation changed during pixel sequence')
            (self.folder/label/('frame-%02d.png'%i)).write_bytes(raw); images.append(image)
            row['frameTimes'].append({'frame':i,'start':start,'end':end,'sha256':base.digest(raw)})
            if animation: matches.append(dict(volume_match_observation(image,bar,template),frame=i))
            atomic(self.folder/label/'observation.json', row); time.sleep((.11,.23,.17,.29)[i%4] if frames == 8 else .45)
        if animation:
            row['nativeInk']=matches if all(x['matched'] for x in matches) else []
            row['colorExchange']=font.color_exchange(images,bar,matches) if row['nativeInk'] else {
                'established':False,'reason':'One or more native pixel associations are unobserved','visualPass':False}
            row['animationUnobserved']=not row['colorExchange']['established']
            row['animationAssessment']='unobserved' if row['animationUnobserved'] else 'actual-color-exchange-awaiting-independent-review'
            # Pixel matching is an observation, never authorization for a later
            # tap. Save all bounded frames and continue only through the separate
            # actual window/configuration/identity gates.
        self.assert_config(self.raw_settings(label+'-after'))
        row['status']='collected-independent-pixel-review-required'; atomic(self.folder/label/'observation.json',row); self.persist()
        return row

    def await_owned_sleep(self, label, deadline):
        """Read-only paired power/keyguard proof, within the original 15 seconds."""
        folder=self.folder/(label+'-sleep-readiness');folder.mkdir()
        records=[]
        for i in range(10):
            sample={'attempt':i,'started':time.monotonic(),'deadline':deadline,'reads':[]}
            records.append(sample)
            try:
                raw={}
                for kind,command in [('power','dumpsys power'),('policy','dumpsys window policy')]:
                    remaining=deadline-time.monotonic()
                    if remaining<=0:raise core.Unobserved('Owned sleep deadline expired')
                    read={'kind':kind,'started':time.monotonic(),'timeout':remaining};sample['reads'].append(read)
                    try:
                        raw[kind]=self.ar.shell(command,timeout=remaining)
                        (folder/('%02d-%s-private.txt'%(i,kind))).write_text(raw[kind],encoding='utf-8')
                    finally:read['ended']=time.monotonic()
                    if time.monotonic()>=deadline:raise core.Unobserved('Owned sleep proof finished after deadline')
                wake=re.findall(r'(?m)^\s*mWakefulness=(\w+)\s*$',raw['power'])
                if len(wake)!=1 or wake[0] not in ('Awake','Asleep','Dozing','Dreaming'):
                    raise core.Unobserved('Unknown native wakefulness; no wake input')
                state=keyguard(raw['policy']);sample.update(wakefulness=wake[0],keyguard=state)
                if state['secure'] or state['occluded']:
                    raise core.Unobserved('Secure/occluded sleep state; no wake input')
                sample['ready']=wake[0] in ('Asleep','Dozing') and state['showing']
                if sample['ready']:return sample
            except BaseException as error:
                sample['error']=repr(error);raise
            finally:
                sample['ended']=time.monotonic();atomic(folder/'readiness.json',{'deadline':deadline,'samples':records})
            remaining=deadline-time.monotonic()
            if remaining<=0:break
            time.sleep(min(.25,remaining))
        raise core.Unobserved('Bounded paired owned sleep/keyguard state unavailable')

    def lock_cycle(self, label, frames_after):
        self.identity(label); self.protect(label)
        ob = self.observe(label+'-before-sleep'); self.owner(ob, {self.journal.data['metadata']['homeComponent'].split('/')[0]}, navigation=True)
        state = keyguard(self.ar.shell('dumpsys window policy'))
        if state['secure'] or state['showing']: raise core.Unobserved('Lock cycle requires already-unlocked non-secure device')
        self.action(label+'-sleep', 'input keyevent KEYCODE_SLEEP', ob)
        sleep_until = time.monotonic()+15
        proof=self.await_owned_sleep(label,sleep_until)
        # The only automatic WAKE is paired with this function's successful sleep.
        now=time.monotonic()
        core.invoke_logged(self.folder/(label+'-wake-action.json'), 'input keyevent KEYCODE_WAKEUP',
            lambda:self.ar.shell('input keyevent KEYCODE_WAKEUP',timeout=10),proof['started'],min(sleep_until,now+core.FRESH_SECONDS))
        time.sleep(.6); self.capture(label+'-lock',2,surface='lock')
        ob=self.observe(label+'-before-dismiss'); self.owner(ob,{'com.android.systemui'},navigation=True)
        state=keyguard(self.ar.shell('dumpsys window policy'))
        if state['secure'] or not state['showing'] or state['occluded']: raise core.Unobserved('Keyguard changed; no dismiss')
        self.action(label+'-dismiss','wm dismiss-keyguard',ob);time.sleep(.5)
        self.home(label+'-unlocked');self.capture(label+'-awake-main',frames_after,animation=frames_after==8)

    def exercise(self):
        case=self.journal.data['metadata']['case'];self.identity('preflight');self.protect('preflight')
        if case=='profiles':self.native_home('known-home')
        else:self.home('known-home')
        baseline=self.capture('user-baseline',2)
        if case == 'current-assets-lock':
            from PIL import Image
            eligible=[r for r in base.visible_rows(baseline['inventory']) if r.get('id')=='volume' and r.get('capability')=='whole_layers']
            if len(eligible)!=1:raise core.Unobserved('Existing native volume is not visible; no asset or row writes')
            template=font.dark_mask(Image.open(font.REFERENCE).crop(font.REFERENCE_BOX))
            baseline['prerequisiteVolumeInk']=volume_match_observation(Image.open(self.folder/'user-baseline/frame-00.png'),baseline['wholeStatusBarBounds'],template)
            self.persist()
            self.set('assets-and-00',dict(self.journal.data['targets'],**{SYSTEM:'0',NOTIFICATIONS:'0'}))
            self.capture('assets-00',8,animation=True)
            self.ui_row(SYSTEM,'1','system-ui-on');self.ui_row(NOTIFICATIONS,'1','notifications-ui-on')
            self.capture('assets-11',8,animation=True)
            self.ui_row(SYSTEM,'0','system-ui-off');self.ui_row(NOTIFICATIONS,'0','notifications-ui-off')
            self.capture('assets-00-ui-return',2)
            self.lock_cycle('rows-00',2)
            self.set('lock-rows-11',{SYSTEM:'1',NOTIFICATIONS:'1'})
            self.lock_cycle('rows-11',8)
        else:
            for profile,scale,activity,wide in [('landscape-1.0','1.0','LandscapeActivity',True),('portrait-1.3','1.3','PlainActivity',False)]:
                self.set_font_scale(scale)
                self.profile_transition(profile+'-fixture','1' if wide else '0',activity)
                for step,values in core.profile_steps():
                    self.set(profile+'-'+step,values);row=self.capture(profile+'-'+step,2,wide=wide)
                    row.update(comparisonBaseline=profile+'-00-before',crossProfileIconCountsComparable=False)
                    atomic(self.folder/row['label']/'observation.json',row)
                    self.persist()
        self.report['status']='finite-stages-collected-pixel-review-required';self.persist()

    def native_restore_value(self, key, value, native):
        if key not in ('system/font_scale','system/user_rotation'):raise ValueError('Foreign native restore key')
        name=key.split('/')[1]
        command='settings --user 0 '+('delete system '+name if value=='null' else 'put system '+name+' '+value)
        ob=self.native_observe('recovery-'+name+'-before')
        core.invoke_logged(self.folder/('recovery-'+name+'-transport.json'),command,lambda:self.ar.shell(command),
            ob['started'],time.monotonic()+core.FRESH_SECONDS,journal=self.journal,
            values={key:value},current=native,native=True,recovery=True)
        actual=self.native();self.journal.acknowledge({key:value},actual,True,True)
        return actual

    def capture_restored_native(self):
        """B recovery never connects UiAutomation after exact native restoration."""
        label='restored-main';ob=self.native_observe(label,component=self.journal.data['metadata']['homeComponent'],rotation='0')
        bars=[r for r in core.window_records(ob['wm']) if r['title']=='StatusBar' and
              r['package']=='com.android.systemui' and r['pid']==self.journal.data['metadata']['process']['pid']]
        if len(bars)!=1 or not core.native_edge(bars[0],ob['size'],bars[0]['pid']):
            raise core.Unobserved('Restored native statusbar frame unavailable')
        row=dict(label=label,surface='main',actualSize=ob['size'],wholeStatusBarBounds=bars[0]['bounds'],
            frameTimes=[],nativeProfile=self.native(),nativeOnly=True,visualPass=False,
            status='collected-independent-pixel-review-required',accessibilityObserverUsed=False)
        for i in range(8):
            start=time.monotonic();raw=self.ar.adb('exec-out','screencap','-p');end=time.monotonic()
            if raw[:8]!=b'\x89PNG\r\n\x1a\n' or struct.unpack('>II',raw[16:24])!=tuple(ob['size']):
                raise core.Unobserved('Restored native PNG direction changed')
            (self.folder/label/('frame-%02d.png'%i)).write_bytes(raw)
            row['frameTimes'].append(dict(frame=i,start=start,end=end,sha256=base.digest(raw)))
            time.sleep((.11,.23,.17,.29)[i%4])
        atomic(self.folder/label/'observation.json',row);self.report['cases'].append(row);self.persist()

    def restore(self):
        self.recovering=True;d=self.journal.data;d.update(pending=True,configurationRestored=False);self.journal.validate();self.journal.save()
        errors=[];pixel_error=None;external={};external_native={};identity_ok=False
        try:
            self.identity('recovery-identity')
            identity_ok=True
        except BaseException as error:errors.append(repr(error))
        try:
            if not identity_ok:raise core.Unobserved('Identity refusal: no config transport')
            # snapshot terminates any old editor process/draft before restoration.
            current=self.config('recovery-before'); external.update(self.journal.settle_inflight(current))
            changes={}
            for k,v in d['restore'].items():
                if self.journal.owns(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:
                self.instrument('set','recovery-set',changes,tracked=True,current=current,recovery=True)
                actual=self.config('recovery-set-readback');self.journal.acknowledge(changes,actual,recovery=True)
        except BaseException as error:errors.append(repr(error))
        try:
            if not identity_ok:raise core.Unobserved('Identity refusal: no native transport')
            native=self.native();external_native=self.journal.settle_inflight(native,True)
            external_native.update(self.journal.conflicts(native,True))
            if d['metadata']['case']=='profiles' and not external_native:
                # End any possible landscape observer period first. Navigation
                # and all subsequent pictures are native-only, so disconnect
                # cannot rewrite user_rotation after its exact final restore.
                self.profile_transition('recovery-portrait','0','PlainActivity',recovery=True)
                self.native_home('recovery-native-home')
                native=self.native()
            for k,v in d['nativeRestore'].items():
                if not self.journal.owns(k,native.get(k),True):external_native[k]=native.get(k);continue
                if native[k]!=v and not external_native:native=self.native_restore_value(k,v,native)
            d['externalNativeValuesPreserved']=external_native
            if external or external_native:errors.append('External latest-value conflict preserved')
        except BaseException as error:errors.append(repr(error))
        try:
            if not identity_ok:raise core.Unobserved('Identity refusal: no recovery input')
            # Recovery picture failure never authorizes blind HOME/wake or masks final config checks.
            try:
                if d['metadata']['case']=='profiles':self.capture_restored_native()
                else:self.home('recovery-home');self.capture('restored-main',8)
            except BaseException as error:pixel_error=repr(error)
            self.identity('recovery-final-identity')
            self.protect('recovery-final',d['metadata']['nativeBaseline'])
            self.notifications('recovery-final')
        except BaseException as error:errors.append(repr(error))
        # Last device reads: no screenshot/window/resource query after these.
        final=[]
        try:
            if not identity_ok:raise core.Unobserved('Original identity missing; no test invocation')
            for i in range(2):
                final.append(difference(d['baseline'],self.config('recovery-terminal-'+str(i))))
                if i==0:time.sleep(.4)
            if any(final):errors.append('Terminal full497 differs from original')
        except BaseException as error:errors.append('Terminal snapshot: '+repr(error))
        d.update(terminalDifferences=final,configurationRestored=len(final)==2 and not any(final) and not external,
                 nativeProfileRestored=d.get('lastProtection',{}).get('label')=='recovery-final' and not d['lastProtection']['differences']['native'],
                 restoredPixels='not_fully_observed' if pixel_error else 'captured_review_required',restoredPixelError=pixel_error,
                 cleanupErrors=errors,pending=bool(errors))
        self.journal.save();self.report.update(configurationRestored=d['configurationRestored'],restorePending=d['pending'],
            nativeProfileRestored=d['nativeProfileRestored'],
            cleanupErrors=errors,restoredPixels=d['restoredPixels'],restoredPixelError=pixel_error,wholeFeaturePassed=False)
        self.persist()
        if errors:raise core.Unobserved('Exact recovery remains pending')
        if pixel_error:raise core.Unobserved('Configuration restored; final visual observation incomplete')


def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--case',choices=SUPPORTED_CASES);parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--runtime-schema',type=Path);parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    if args.run and (args.case is None or args.runtime_schema is None):parser.error('--run requires explicit --case and --runtime-schema')
    import adb_regression as ar
    restore_path=args.restore_only
    if restore_path and restore_path.is_dir():restore_path=restore_path/'restore.json'
    extra.gates(ar,restore_path)
    code,name=base.version(ar.shell('dumpsys package '+APP))
    if code!=args.expected_version:raise core.Unobserved('Expected installed build mismatch')
    if restore_path:
        journal=core.Journal(restore_path);m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name):raise core.Unobserved('Original device/build changed')
        folder=restore_path.parent;path=folder/'report.json'
        report=json.loads(path.read_text('utf-8')) if path.exists() else {'cases':[],'status':'reconstructed-for-recovery','wholeFeaturePassed':False}
        collector=Collector(ar,folder,journal,report);collector.restore();return
    schema=json.loads(args.runtime_schema.read_text('utf-8'));local_test=base.digest(args.test_apk.read_bytes())
    if package_hash(ar,APP+'.test')!=local_test:raise core.Unobserved('Installed test APK differs from local reviewed bytes')
    folder=extra.safe.AUDIT/('statusbar-rows-%d-%s-%s'%(code,args.case,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir()
    ar.OUTPUT=folder
    initial=ar.instrument('snapshot','baseline')
    if initial.get('status')!='pass' or initial.get('moduleVersion')!=code:raise core.Unobserved('Initial snapshot mismatch')
    settings=initial['settings'];prerequisites(settings);font.validate_schema(schema,code,settings)
    reader=Collector.__new__(Collector);reader.ar=ar
    resources,names,native=reader.resources(),reader.names(),reader.native()
    if any(native.get(k)!='0' for k in ('system/accelerometer_rotation','system/user_rotation')):
        raise core.Unobserved('A/B require original locked portrait auto0/user0; do not normalize other baselines')
    initial_display_raw=ar.shell('dumpsys window displays')
    initial_display=core.primary_rotation(initial_display_raw)
    (folder/'initial-display-private.txt').write_text(initial_display_raw,encoding='utf-8')
    if initial_display!={'displayId':0,'actualRotation':'0','userRotation':'0','mode':'USER_ROTATION_LOCKED'}:
        raise core.Unobserved('Actual initial display is not locked ROTATION_0; no journal or observer')
    if args.case==core.CASES[0] and native['system/font_scale'] not in ('null','1','1.0'):
        raise core.Unobserved('A uses reviewed native glyph at font1.0; original font profile is preserved')
    if args.case==core.CASES[0]:
        state=keyguard(ar.shell('dumpsys window policy'))
        if state['secure'] or state['showing'] or state['occluded']:raise core.Unobserved('A requires already-unlocked non-secure phone; no journal or mutation')
    target=font.targets(settings) if args.case==core.CASES[0] else {}
    inputs=font.source_inputs() if target else {}
    if target:font.require_resources(resources)
    raw=ar.shell('cat '+base.APP+'shared_prefs/ls_augment_config_v2.xml',root=True);raw_baseline=raw_preferences(raw)
    if resolve_raw(raw_baseline,raw_baseline,settings)!=settings:raise core.Unobserved('Raw/full snapshot disagree')
    notifications=clear.notification_records(ar.shell('dumpsys notification',timeout=40))
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    metadata=dict(case=args.case,serial=ar.SERIAL,installedVersion=code,installedVersionName=name,
        mainApkSha256=package_hash(ar,APP),testApkSha256=local_test,observerApkSha256=package_hash(ar,'ls.augment.regression.ui'),
        process=strong_identity(ar,name),nativeBaseline=native,notificationsBefore=notifications,homeComponent=home,
        initialDisplay=initial_display,
        runId=uuid.uuid4().hex,runtimeSchema=schema,rawBaseline=raw_baseline,assetInputs=inputs,
        collectorSha256=base.digest(Path(__file__).read_bytes()),coreSha256=base.digest(Path(core.__file__).read_bytes()))
    if args.case=='profiles':
        if base.digest(FIXTURE_APK.read_bytes())!=FIXTURE_SHA or package_hash(ar,FIXTURE)!=FIXTURE_SHA:raise core.Unobserved('Already installed exact landscape fixture missing; no install performed')
        metadata['fixtureApkSha256']=FIXTURE_SHA
    # All read-only inputs exist before this first durable pending record.
    journal=core.Journal.create(folder/'restore.json',settings,metadata,resources,names,target)
    report=dict(case=args.case,installedVersion=code,status='prepared',cases=[],allowedMutableKeys=sorted(core.allowed_keys(args.case)),
        nativeMutableKeys=['system/font_scale','system/user_rotation'] if args.case=='profiles' else [],wholeFeaturePassed=False,
        limits=['No C notification fixture/odd-even transitions','No forced SIM/radio/icon visibility or changed clock format',
                'Lock notification-row positive evidence needs actual native eligible container','Pixel review is required'])
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise()
    except BaseException as error:report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'configurationRestored':journal.data.get('configurationRestored',False)}))


if __name__=='__main__':main()
