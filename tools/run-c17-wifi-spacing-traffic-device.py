"""Six real Wi-Fi spacing samples with bounded ICMP to the current local gateway.

Explicit --run is required. Never changes radios, row modes or icon visibility.
Only control/notification are captured: original baseline, WIFI edges, baseline.
--restore-only uses the durable spacing journal without starting any traffic.
Every ping runs in the foreground of its own ADB transport with native -w 28;
no device process is killed, and no background device service/file is created.
"""
import argparse
import contextlib
import importlib.util
import ipaddress
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import time
import traceback
import xml.etree.ElementTree as ET

import adb_regression as ar
import native_ui_helpers as ui

_spec = importlib.util.spec_from_file_location('spacing_collection', Path(__file__).with_name('run-c17-spacing-device.py'))
spacing = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(spacing)

SURFACES = ('control', 'notification')
PING_COUNT, PING_BYTES, PING_INTERVAL, PING_DEADLINE = 100, 512, .25, 28
PRIVATE_LAN = tuple(ipaddress.ip_network(n) for n in ('10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16', '169.254.0.0/16'))


class NetworkUnavailable(RuntimeError):
    pass


def verified_gateway(routes, addresses, link):
    """Accept one unambiguous, directly connected private IPv4 default on wlan0."""
    if not re.search(r'^\d+: wlan0(?:@\S+)?:.*<[^>]*\bUP\b', link, re.M):
        raise NetworkUnavailable('wlan0 is absent or not UP')
    candidates = set()
    for line in routes.splitlines():
        fields = line.split()
        if not fields or fields[0] != 'default' or 'via' not in fields or 'dev' not in fields:
            continue
        if any(flag in fields for flag in ('linkdown', 'dead', 'nexthop')):
            continue
        try:
            if fields[fields.index('dev') + 1] == 'wlan0':
                candidates.add(str(ipaddress.IPv4Address(fields[fields.index('via') + 1])))
        except (ValueError, IndexError):
            continue
    if len(candidates) != 1:
        raise NetworkUnavailable('No unique IPv4 default gateway on wlan0')
    gateway = ipaddress.IPv4Address(candidates.pop())
    if not any(gateway in network for network in PRIVATE_LAN):
        raise NetworkUnavailable('Gateway is not in an accepted private/link-local LAN range')
    local = []
    for line in addresses.splitlines():
        if re.match(r'^\d+: wlan0(?:@\S+)?\s', line):
            match = re.search(r'\binet (\d+\.\d+\.\d+\.\d+/\d+)\b', line)
            if match:
                local.append(ipaddress.IPv4Interface(match[1]))
    matching = [value for value in local if gateway in value.network and gateway not in
                (value.ip, value.network.network_address, value.network.broadcast_address)]
    if len(matching) != 1:
        raise NetworkUnavailable('Gateway is not a unique directly connected unicast neighbor')
    return {'interface': 'wlan0', 'gateway': str(gateway), 'localAddress': str(matching[0].ip),
            'prefix': str(matching[0].network)}


def verify_route_get(raw, identity):
    if any(token in raw.lower() for token in ('unreachable', 'prohibit', 'blackhole', 'error')):
        raise NetworkUnavailable('Gateway route lookup is unavailable')
    line = next((line for line in raw.splitlines() if line.strip()), '').split()
    try:
        if (not line or line[0] != identity['gateway'] or 'via' in line
                or line[line.index('dev') + 1] != 'wlan0'
                or line[line.index('src') + 1] != identity['localAddress']):
            raise ValueError('route differs')
    except (ValueError, IndexError):
        raise NetworkUnavailable('Gateway route lookup does not confirm direct wlan0/source')


def ping_command(binary, help_text, identity):
    if binary not in ('/system/bin/ping', '/system/xbin/ping'):
        raise NetworkUnavailable('Unrecognized native ping location')
    # Fail closed on other variants: these observed usage names are iputils semantics.
    for flag, word in (('c', 'count'), ('i', 'interval'), ('s', 'packetsize'),
                       ('w', 'deadline'), ('I', 'interface')):
        if not re.search(r'-' + flag + r'\s+' + word + r'\b', help_text):
            raise NetworkUnavailable('Native ping does not advertise required option -' + flag)
    if not (PING_COUNT <= 128 and PING_BYTES <= 512 and PING_INTERVAL >= .2 and PING_DEADLINE <= 30):
        raise AssertionError('Traffic budget exceeds the reviewed limits')
    # identity must have passed verified_gateway, not user-supplied host strings.
    gateway = str(ipaddress.IPv4Address(identity['gateway']))
    if identity['interface'] != 'wlan0' or not any(ipaddress.ip_address(gateway) in n for n in PRIVATE_LAN):
        raise NetworkUnavailable('Refusing non-LAN traffic')
    return 'exec ' + shlex.join([binary, '-n', '-I', 'wlan0', '-c', str(PING_COUNT), '-s', str(PING_BYTES),
                                '-i', str(PING_INTERVAL), '-w', str(PING_DEADLINE), gateway])


def parse_ping_statistics(raw):
    match = re.search(r'(\d+) packets transmitted,\s*(\d+) (?:packets )?received.*?(\d+(?:\.\d+)?)% packet loss', raw)
    return None if not match else {'transmitted': int(match[1]), 'received': int(match[2]),
                                    'packetLossPercent': float(match[3])}


def network_identity():
    # This ROM restricts RTM_GETLINK to root; only that read uses elevated UID.
    raw = {name: ar.shell(command, root=(name == 'link')) for name, command in {
        'routes': 'ip -4 route show table all', 'addresses': 'ip -o -4 addr show dev wlan0',
        'link': 'ip -o link show dev wlan0'}.items()}
    identity = verified_gateway(raw['routes'], raw['addresses'], raw['link'])
    raw['routeGet'] = ar.shell('ip -4 route get ' + identity['gateway'] + ' oif wlan0')
    verify_route_get(raw['routeGet'], identity)
    return identity, raw


def interface_counters():
    values = {}
    for name in ('rx_packets', 'tx_packets', 'rx_bytes', 'tx_bytes'):
        try:
            values[name] = int(ar.shell('cat /sys/class/net/wlan0/statistics/' + name))
        except (RuntimeError, ValueError):
            values[name] = None
    return values


def loaded_systemui(version_name):
    pid = int(ar.shell('pidof com.android.systemui'))
    for attempt in range(4):
        raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
        try:
            records = [json.loads(node.text) for node in ET.fromstring(raw) if node.tag == 'string' and node.text]
            break
        except (ET.ParseError, json.JSONDecodeError):
            # The phone can be committing process diagnostics during this read.
            # Re-read the actual file; never use a previous successful snapshot.
            if attempt == 3:
                raise
            time.sleep(.15)
    if int(ar.shell('pidof com.android.systemui')) != pid:
        raise RuntimeError('SystemUI process changed while reading its loaded build')
    current = [record for record in records if record.get('pid') == pid and record.get('process') == 'com.android.systemui']
    if len(current) != 1 or current[0].get('moduleVersion') != version_name:
        raise RuntimeError('Actual SystemUI process has not loaded the installed build')
    return current[0]


class OwnedPing:
    """One owned local ADB client. Native deadline bounds the remote foreground job."""
    def __init__(self, command, folder, identity):
        self.folder = folder
        self.data = {'identity': identity, 'command': command, 'startedAt': spacing.now(),
                     'limit': {'deadlineSeconds': PING_DEADLINE, 'count': PING_COUNT,
                               'payloadBytes': PING_BYTES, 'intervalSeconds': PING_INTERVAL},
                     'beforeCounters': interface_counters(), 'status': 'starting',
                     'counterLimitation': 'Interface totals include unrelated traffic; ping summary is the attributable packet count.'}
        self.log = (folder / 'ping-console.txt').open('wb')
        self.started = time.monotonic()
        self.process = None
        spacing.atomic_json(folder / 'traffic.json', self.data)
        try:
            self.process = subprocess.Popen([str(ar.ADB), '-s', ar.SERIAL, 'shell', command],
                                            stdout=self.log, stderr=subprocess.STDOUT,
                                            creationflags=getattr(subprocess, 'CREATE_NO_WINDOW', 0))
        except BaseException:
            self.log.close()
            raise
        self.data.update(status='running', localAdbPid=self.process.pid)
        spacing.atomic_json(folder / 'traffic.json', self.data)

    def wait(self):
        # On interruption wait only for this native deadline. Never pkill/kill any device PID.
        timeout = max(1, PING_DEADLINE + 6 - (time.monotonic() - self.started))
        try:
            self.data['exitCode'] = self.process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            # This is exclusively the Popen-created host transport, not a remote/user process.
            self.process.terminate()
            self.process.wait(timeout=5)
            self.data['hostTransportTimedOut'] = True
        finally:
            self.log.close()
            self.data.update(finishedAt=spacing.now(), elapsedSeconds=round(time.monotonic()-self.started, 3),
                             afterCounters=interface_counters(), status='finished')
            self.data['statistics'] = parse_ping_statistics((self.folder/'ping-console.txt').read_text(encoding='utf-8', errors='replace'))
            self.data['bothDirectionsObserved'] = bool(self.data['statistics'] and self.data['statistics']['received'] > 0)
            spacing.atomic_json(self.folder / 'traffic.json', self.data)
        return self.data


class WifiTrafficCollection(spacing.Collection):
    def __init__(self, output, version, settle):
        super().__init__(output, version, settle)
        self.identity = self.ping_binary = self.ping_help = None
        self.active_ping = None
        self.report.update(scope='Wi-Fi native signal/activity on control and notification only; original WIFI edges; six samples with bounded LAN gateway ICMP.',
                           excluded=['main', 'lock', 'mobile icons', 'radio changes', 'forced icon visibility',
                                     'row mode changes', 'public Internet traffic'], traffic=[],
                           trafficBudget={'perSampleDeadlineSeconds': PING_DEADLINE, 'perSamplePackets': PING_COUNT,
                                          'payloadBytes': PING_BYTES, 'intervalSeconds': PING_INTERVAL,
                                          'maximumSamples': 6, 'maximumRequestPayloadBytes': 6*PING_COUNT*PING_BYTES})

    def read_settings(self, label):
        with (self.output / (label + '-console.txt')).open('w', encoding='utf-8') as log:
            with contextlib.redirect_stdout(log):
                wrapper = ar.instrument('snapshot', label)
        if str(wrapper.get('moduleVersion')) != str(self.version['versionCode']) or wrapper.get('status') != 'pass':
            raise RuntimeError('Snapshot did not come from the installed test/module build')
        return wrapper['settings']

    def set_spacing(self, label, raw):
        with (self.output/(label+'-save-console.txt')).open('w', encoding='utf-8') as log:
            with contextlib.redirect_stdout(log):
                super().set_spacing(label, raw)

    def restore(self):
        with (self.output/'restore-console.txt').open('a', encoding='utf-8') as log:
            with contextlib.redirect_stdout(log):
                super().restore()

    def preflight_network(self):
        self.identity, raw = network_identity()
        self.ping_binary = ar.shell('command -v ping')
        # Help may exit 2; this call sends no network packets.
        self.ping_help = ar.adb('shell', self.ping_binary + ' -h 2>&1', check=False).decode('utf-8', 'replace') if self.ping_binary in ('/system/bin/ping', '/system/xbin/ping') else ''
        command = ping_command(self.ping_binary, self.ping_help, self.identity)
        spacing.atomic_json(self.output/'network-preflight-private.json', {'identity':self.identity, 'raw':raw,
                             'pingBinary':self.ping_binary, 'pingHelp':self.ping_help, 'plannedCommand':command})

    def open_surface(self, surface):
        self.report['latestSystemuiProcess'] = loaded_systemui(self.version['versionName'])
        opened = super().open_surface(surface)
        identity, raw = network_identity()
        if identity != self.identity:
            raise NetworkUnavailable('wlan0 gateway/source changed; stop without targeting a replacement')
        folder = self.output / self.traffic_label
        spacing.atomic_json(folder/'network-before-private.json', {'identity': identity, 'raw': raw})
        self.active_ping = OwnedPing(ping_command(self.ping_binary, self.ping_help, identity), folder, identity)
        time.sleep(3)  # Let native traffic observers update; never force activity Views.
        if self.active_ping.process.poll() is not None:
            raise NetworkUnavailable('Native ping ended before screenshot sampling')
        self.active_ping.data['screenshotSamplingStartedAt'] = spacing.now()
        spacing.atomic_json(folder/'traffic.json', self.active_ping.data)
        return opened

    def capture(self, phase, surface):
        self.traffic_label = phase + '-' + surface
        (self.output/self.traffic_label).mkdir(exist_ok=True)
        self.active_ping = None
        try:
            result = super().capture(phase, surface)
        finally:
            if self.active_ping:
                traffic = self.active_ping.wait()
                traffic['label'] = self.traffic_label
                self.report['traffic'].append(traffic)
                self.active_ping = None
                self.progress(phase, surface)
                stats = traffic.get('statistics') or {}
                print(f"{self.traffic_label}: ping tx={stats.get('transmitted', '?')} rx={stats.get('received', '?')}; actual arrow pixels need review", flush=True)
        if not result['surfaceVerified']:
            raise RuntimeError('Native surface was not verified')
        if not self.report['traffic'][-1]['bothDirectionsObserved']:
            raise NetworkUnavailable('No ICMP reply observed; no further spacing mutation/collection')
        return result

    def phase(self, name, scope=None):
        self.report['phases'].append({'name': name, 'scope': scope or [], 'startedAt': spacing.now()})
        cases = [self.capture(name, surface) for surface in SURFACES]
        self.report['phases'][-1]['completedAt'] = spacing.now()
        self.progress(name + '-complete')
        return cases

    def run(self, restore_only=False):
        if restore_only:
            return super().run(True)  # Zero ping/routing preflight in recovery mode.
        if self.journal_path.exists() or (self.output/'report.json').exists():
            raise RuntimeError('Output already contains evidence; use --restore-only if pending, otherwise a fresh directory')
        try:
            self.preflight_network()
        except (NetworkUnavailable, RuntimeError) as error:
            self.report.update(status='skipped_network_preflight', skipReason=str(error), configurationRestored=True)
            self.progress('skipped-no-mutation')
            return
        self.report['initialSystemuiProcess'] = loaded_systemui(self.version['versionName'])
        self.baseline = self.read_settings('baseline-configuration')
        spacing.atomic_json(self.output/'baseline-settings-private.json', self.baseline)
        if spacing.SPACING not in self.baseline or self.baseline.get(spacing.MASTER) not in ('1', 'true'):
            raise RuntimeError('Existing enabled status-bar master/spacing registration required')
        self.expected_spacing = self.baseline[spacing.SPACING]
        self.report['baselineLayout'] = {k:v for k,v in self.baseline.items() if k.startswith('ls_augment_statusbar_') or k == spacing.MASTER}
        self.report['baselineProfile'] = {k:ar.shell(c) for k,c in {'density':'wm density', 'displaySize':'wm size',
               'fontScale':'settings get system font_scale', 'rotation':'settings get system user_rotation',
               'automaticRotation':'settings get system accelerometer_rotation'}.items()}
        try:
            baseline = self.phase('baseline')
            changes, scope = spacing.selected_rules(baseline, spacing.WIFI)
            changes = {key:value for key,value in changes.items() if key[0] in SURFACES}
            scope = [row for row in scope if row['surface'] in SURFACES]
            if len(changes) != len(SURFACES)*len(spacing.WIFI):
                raise NetworkUnavailable('Both native Wi-Fi members must be recognized on both fresh surfaces')
            self.set_spacing('wifi-edges', spacing.merge_spacing(self.baseline[spacing.SPACING], changes))
            self.phase('wifi-edges', scope)
            self.set_spacing('wifi-edges-restore', self.baseline[spacing.SPACING])
            self.phase('wifi-edges-restored', scope)
            self.report['status'] = 'collection_complete_visual_review_pending'
        except BaseException as error:
            self.report['status'] = 'interrupted_or_incomplete'
            self.report['errors'].append({'at':spacing.now(), 'error':repr(error), 'traceback':traceback.format_exc()})
            raise
        finally:
            try:
                self.restore()
                after = self.read_settings('final-configuration-readback')
                self.assert_preserved(after, 'final-configuration-readback')
                if after.get(spacing.SPACING) != self.baseline[spacing.SPACING]:
                    raise AssertionError('Final baseline spacing readback differs')
                self.report['configurationRestored'] = True
            except BaseException as error:
                self.report['configurationRestored'] = False
                self.report['errors'].append({'phase':'restore', 'error':repr(error)})
                raise
            finally:
                self.report['finishedAt'] = spacing.now()
                self.progress('finished')
                try:
                    ar.shell('cmd statusbar collapse')
                except Exception as error:
                    self.report['errors'].append({'phase':'collapse-panel', 'error':repr(error)})
                    self.progress('finished')


def installed_version():
    raw = ar.shell('dumpsys package ls.augment.com')
    code = re.search(r'\bversionCode=(\d+)', raw)
    name = re.search(r'\bversionName=([^\s]+)', raw)
    if not code or not name:
        raise RuntimeError('Cannot read installed module version')
    return {'versionCode':int(code[1]), 'versionName':name[1]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run', action='store_true')
    mode.add_argument('--restore-only', action='store_true')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--settle-seconds', type=float, default=11)
    args = parser.parse_args()
    if not 5 <= args.settle_seconds <= 20:
        parser.error('--settle-seconds must be between 5 and 20')
    if args.restore_only and args.output is None:
        parser.error('--restore-only requires the exact existing --output directory')
    version = installed_version()
    output = (args.output or ar.ROOT / ('out/full-function-audit-20261004/wifi-spacing-traffic-' + str(version['versionCode']) + '-' + time.strftime('%Y%m%d-%H%M%S'))).resolve()
    output.mkdir(parents=True, exist_ok=True)
    ar.OUTPUT = ui.OUTPUT = output
    collector = WifiTrafficCollection(output, version, args.settle_seconds)
    collector.report['workingTreeSourceVersion'] = spacing.source_version()
    collector.run(args.restore_only)


if __name__ == '__main__':
    main()
