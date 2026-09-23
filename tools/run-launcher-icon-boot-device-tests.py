"""Observe both real launcher images through boot without editing preferences."""
import argparse
import json
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell, snapshot
from launcher_icon_device_helpers import desktop, saved
from launcher_icon_evidence import compare_images

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('prefix')
p.add_argument('--resume-from', help='Previous kernel boot ID for a boot already requested')
p.add_argument('--expected-version', type=int, required=True,
               help='Module version that the launcher must actually load after boot')
args = p.parse_args()
out = OUTPUT / (args.prefix + '-results')
out.mkdir(exist_ok=True)
refs = {'LSA_MAIN_33': OUTPUT / 'round33f-results/large-cropped.png',
        'LSA_CLONE_33': OUTPUT / 'round33b-results/clone-cropped.png'}
report = {'stage': 'starting', 'samples': [], 'references': {k: str(v) for k, v in refs.items()}}
report['expectedVersion'] = args.expected_version


def save():
    (out / 'results.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')


def usb_state():
    return {key: shell(command) for key, command in {
        'functions': 'getprop sys.usb.config',
        'persistedFunctions': 'getprop persist.sys.usb.config',
        'adbEnabled': 'settings get global adb_enabled',
        'developerEnabled': 'settings get global development_settings_enabled',
        'chargeOnlyDebugAllowed': 'settings get system allow_debug_in_charge_only_mode'
    }.items()}


def observe(label):
    folder, _ = desktop(label, list(refs))
    result = compare_images(folder, refs)
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
    (folder / 'hook-processes.xml').write_text(raw, encoding='utf-8')
    pid = int(shell('pidof com.zte.mifavor.launcher'))
    records = [json.loads(n.text) for n in ET.fromstring(raw) if n.tag == 'string' and n.text]
    current = [r for r in records if r.get('pid') == pid and r.get('process') == 'com.zte.mifavor.launcher']
    result.update({'evidence': folder.name, 'uptime': shell('cat /proc/uptime'), 'pid': pid,
                   'loadedVersion': [r.get('moduleVersion') for r in current],
                   'hooks': [{k: h.get(k) for k in ('id', 'callbackCalls', 'callbackThrows')}
                             for r in current for h in r.get('hooks', []) if '.launcher.' in h['id']]})
    (folder / 'diagnostics.xml').write_text(shell(
        'cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True), encoding='utf-8')
    # Before the provider starts, diagnostics use the Global fallback. Read each
    # key separately so the multiline image trace is retained in full.
    for key in ('ls_augment_launcher_image_load', 'ls_augment_launcher_image_error',
                'ls_augment_launcher_image_trace', 'ls_augment_launcher_runtime'):
        (folder / (key + '.txt')).write_text(shell('settings get global ' + key, root=True), encoding='utf-8')
    result['versionMatches'] = bool(current) and all(
        str(r.get('moduleVersion', '')).rsplit('test', 1)[-1] == str(args.expected_version) for r in current)
    return result


try:
    report['beforeConfig'] = saved()
    report['beforeUsb'] = usb_state()
    report['oldBoot'] = args.resume_from or shell('cat /proc/sys/kernel/random/boot_id')
    if args.resume_from is None:
        baseline = observe(args.prefix + '-before')
        report['before'] = baseline
        save()
        assert baseline['pass'], 'Custom images are already absent before this boot'
        print('Rebooting actual phone', flush=True)
        adb('reboot')
        time.sleep(3)
        deadline = time.monotonic() + 150
        while time.monotonic() < deadline:
            if adb('get-state', check=False, timeout=8).strip() == b'device':
                try:
                    if shell('getprop sys.boot_completed') == '1':
                        break
                except RuntimeError:
                    pass
            time.sleep(2)
        else:
            raise RuntimeError('Phone did not reconnect and complete boot')
    report['newBoot'] = shell('cat /proc/sys/kernel/random/boot_id')
    assert report['newBoot'] != report['oldBoot'], 'Kernel identity did not change'
    shell('input keyevent 224')
    shell('wm dismiss-keyguard')
    report['stage'] = 'observing'
    save()
    first = time.monotonic()
    for delay in (0, 20, 60):
        while time.monotonic() - first < delay:
            time.sleep(.5)
        result = observe(args.prefix + '-after-' + str(delay))
        result['observedAfterUnlockSeconds'] = time.monotonic() - first
        report['samples'].append(result)
        save()
        print(json.dumps({'evidence': result['evidence'], 'imagesMatch': result['pass'],
                          'seconds': result['observedAfterUnlockSeconds']}), flush=True)
    report['afterConfig'] = saved()
    report['afterUsb'] = usb_state()
    report['configPreserved'] = report['beforeConfig'] == report['afterConfig']
    report['stage'] = 'captured-pending-visual-review'
    report['pixelChecksPass'] = report['configPreserved'] and all(s['pass'] for s in report['samples'])
    report['loadedVersionPass'] = all(s['versionMatches'] for s in report['samples'])
    save()
    assert report['pixelChecksPass'], 'Actual launcher image or configuration check failed; all samples retained'
    assert report['loadedVersionPass'], 'Launcher did not load the expected module version'
except Exception as error:
    report['error'] = type(error).__name__ + ': ' + str(error)
    save()
    raise
