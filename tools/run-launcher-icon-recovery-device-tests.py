"""Exercise temporary image-file failure and recovery on the real launcher."""
import argparse
import hashlib
import json
import re
import shlex
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell
from launcher_icon_device_helpers import desktop, saved
from launcher_icon_evidence import compare_images

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('prefix')
p.add_argument('--expected-version', type=int, required=True)
args = p.parse_args()
out = OUTPUT / (args.prefix + '-results')
out.mkdir(exist_ok=True)
icon_hash = '7012e74dd4ce6af088fd8cd9a1b953b14d920d0923668853a0c7bb18853d3fec'
remote = '/data/user/0/ls.augment.com/files/launcher-icons/' + icon_hash + '.png'
held = remote + '.lsa-regression-held'
refs = {'LSA_MAIN_33': OUTPUT / 'round33f-results/large-cropped.png',
        'LSA_CLONE_33': OUTPUT / 'round33b-results/clone-cropped.png'}
report = {'stage': 'starting', 'expectedVersion': args.expected_version, 'samples': []}
moved = False


def save():
    (out / 'results.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')


def diagnostics(folder):
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
    (folder / 'diagnostics.xml').write_text(raw, encoding='utf-8')
    values = {n.get('name'): n.text or '' for n in ET.fromstring(raw)}
    key = 'ls_augment_launcher_image_load'
    fallback = shell('settings get global ' + key, root=True)
    (folder / (key + '-global.txt')).write_text(fallback, encoding='utf-8')
    candidates = [values.get(key, ''), fallback]
    def uptime(value):
        match = re.search(r'published=(\d+)', value)
        return int(match.group(1)) if match else -1
    return max(candidates, key=uptime)


def capture(label):
    folder, _ = desktop(label, list(refs))
    result = compare_images(folder, refs)
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
    (folder / 'hook-processes.xml').write_text(raw, encoding='utf-8')
    pid = int(shell('pidof com.zte.mifavor.launcher'))
    records = [json.loads(n.text) for n in ET.fromstring(raw) if n.tag == 'string' and n.text]
    current = [r for r in records if r.get('pid') == pid and r.get('process') == 'com.zte.mifavor.launcher']
    assert current and all(str(r.get('moduleVersion', '')).rsplit('test', 1)[-1] == str(args.expected_version) for r in current)
    result.update({'evidence': folder.name, 'pid': pid, 'load': diagnostics(folder),
                   'uptime': shell('cat /proc/uptime')})
    report['samples'].append(result)
    save()
    print(json.dumps(result, ensure_ascii=False), flush=True)
    return result


try:
    report['beforeConfig'] = saved()
    assert icon_hash in report['beforeConfig'], 'Owned image is not configured'
    assert shell('test ! -e ' + shlex.quote(held) + ' && echo clean', root=True) == 'clean'
    original = adb('exec-out', 'su -c ' + shlex.quote('cat ' + remote))
    assert hashlib.sha256(original).hexdigest() == icon_hash
    (out / 'owned-clone-original.png').write_bytes(original)
    report['originalSha256'] = icon_hash
    assert capture(args.prefix + '-baseline')['pass']
    shell('mv ' + shlex.quote(remote) + ' ' + shlex.quote(held), root=True)
    moved = True
    report['stage'] = 'owned-image-temporarily-unavailable'
    save()
    shell('am force-stop com.zte.mifavor.launcher')
    shell('input keyevent 3')
    missing = capture(args.prefix + '-missing')
    assert not missing['pass'], 'Missing image did not produce the expected visual control'
    individual = {c['label']: c['pass'] for c in missing['checks']}
    assert individual == {'LSA_MAIN_33': True, 'LSA_CLONE_33': False}, individual
    assert 'images=1|' in missing['load'] and 'failed=true' in missing['load'], missing['load']
    assert shell('pidof com.zte.mifavor.launcher') == str(missing['pid'])
    first_attempt = int(re.search(r'attempt=(\d+)', missing['load']).group(1))
    retries = []
    deadline = time.monotonic() + 38
    while time.monotonic() < deadline:
        time.sleep(2)
        value = diagnostics(out)
        retries.append({'load': value, 'pid': shell('pidof com.zte.mifavor.launcher')})
        match = re.search(r'attempt=(\d+)', value)
        if match and int(match.group(1)) > first_attempt and 'failed=true' in value and 'changed=false' in value:
            break
    else:
        raise AssertionError('Did not observe a subsequent retry without a redundant model refresh')
    report['failedRetries'] = retries
    assert all(r['pid'] == str(missing['pid']) for r in retries)
    shell('mv ' + shlex.quote(held) + ' ' + shlex.quote(remote), root=True)
    moved = False
    report['fileRestoredAt'] = shell('date -Iseconds')
    report['stage'] = 'waiting-for-autonomous-recovery'
    save()
    deadline = time.monotonic() + 38
    while time.monotonic() < deadline:
        value = diagnostics(out)
        if 'images=2|' in value and 'failed=false' in value:
            break
        time.sleep(2)
    else:
        raise AssertionError('Image was restored but the launcher did not recover without an edit')
    recovered = capture(args.prefix + '-recovered')
    assert recovered['pass'], 'The real image pixels did not recover'
    assert recovered['pid'] == missing['pid'], 'Launcher restarted instead of recovering in place'
    report['afterConfig'] = saved()
    assert report['beforeConfig'] == report['afterConfig'], 'Recovery unexpectedly modified configuration'
    assert shell('sha256sum ' + remote, root=True).split()[0] == icon_hash
    report['stage'] = 'passed-pending-visual-review'
    save()
except Exception as error:
    report['error'] = type(error).__name__ + ': ' + str(error)
    save()
    raise
finally:
    if moved:
        shell('mv ' + shlex.quote(held) + ' ' + shlex.quote(remote), root=True)
        report['fileRestoredAfterFailure'] = True
        save()
