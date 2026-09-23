"""Capture device evidence for a named regression stage without changing logs or settings."""
import argparse
import json
import re
import shlex
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('label')
p.add_argument('--since-ms', type=int, help='Retain full crash records at or after this Android wall-clock timestamp')
p.add_argument('--baseline', help='Earlier evidence label with a saved crash-file inventory')
args = p.parse_args()
assert re.fullmatch(r'[A-Za-z0-9_.-]+', args.label)
folder = OUTPUT / args.label
folder.mkdir(parents=True, exist_ok=True)
meta = {'at': shell('date -Iseconds'), 'uptime': shell('cat /proc/uptime')}
processes = shell('ps -A -o PID,UID,NAME')
(folder / 'processes.txt').write_text(processes, encoding='utf-8')
pids = {}
for line in processes.splitlines()[1:]:
    parts = line.split()
    if len(parts) >= 3:
        pids[int(parts[0])] = parts[-1]
meta['corePids'] = {name: pid for pid, name in pids.items() if name in ('system_server', 'com.android.systemui', 'com.zte.mifavor.launcher')}
package = shell('dumpsys package ls.augment.com')
meta['moduleVersion'] = next(line.strip() for line in package.splitlines() if 'versionName=' in line).split('=', 1)[1]
for attempt in range(5):
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
    try:
        parsed = ET.fromstring(raw)
        records = [json.loads(n.text) for n in parsed if n.tag == 'string' and n.text]
        break
    except (ET.ParseError, json.JSONDecodeError):
        if attempt == 4:
            raise
        time.sleep(.2)
(folder / 'hook-processes-private.xml').write_text(raw, encoding='utf-8')
current = []
for record in records:
    pid = record.get('pid')
    process = record.get('process')
    if pid not in pids or record.get('moduleVersion') != meta['moduleVersion']:
        continue
    if process != pids[pid] and not (process == 'system' and pids[pid] == 'system_server'):
        continue
    hooks = record.get('hooks', [])
    current.append({
        'process': process, 'pid': pid, 'receivedAt': record.get('receivedAt'),
        'registered': len(hooks), 'calls': sum(h.get('callbackCalls', 0) for h in hooks),
        'throws': sum(h.get('callbackThrows', 0) for h in hooks),
        'errors': [{k: h.get(k) for k in ('id', 'target', 'callbackThrows', 'lastCallbackAt', 'lastError', 'lastErrorStack')}
                   for h in hooks if h.get('callbackThrows') or h.get('registration') == 'REGISTRATION_FAILED']
    })
meta['currentProcesses'] = current
meta['watchdogs'] = shell('find /data/system/dropbox -maxdepth 1 -type f -name "*watchdog*"', root=True).splitlines()
meta['anrs'] = shell('ls -lt /data/anr 2>/dev/null | head -n 12', root=True)
meta['anrFiles'] = shell('find /data/anr -maxdepth 1 -type f', root=True).splitlines()
# A native animator/listener exception does not pass through a hook callback.
# Keep Android's own persisted exits and crash records even after logcat rotates.
dropbox = shell('find /data/system/dropbox -maxdepth 1 -type f', root=True).splitlines()
(folder / 'dropbox-files.json').write_text(json.dumps(dropbox, indent=2), encoding='utf-8')
crashes = []
for path in dropbox:
    match = re.search(r'/([^/]*(?:crash|anr|tombstone)[^/@]*)@(\d+)\.(?:txt|dat)(?:\.gz)?$', path)
    if match:
        crashes.append({'path': path, 'tag': match[1], 'atMs': int(match[2])})
crashes.sort(key=lambda item: item['atMs'])
meta['crashFiles'] = crashes
if args.baseline:
    assert re.fullmatch(r'[A-Za-z0-9_.-]+', args.baseline)
    previous = json.loads((OUTPUT / args.baseline / 'summary.json').read_text(encoding='utf-8'))
    known = {item['path'] for item in previous['crashFiles']}
    meta['newCrashFiles'] = [item for item in crashes if item['path'] not in known]
    meta['newWatchdogFiles'] = [path for path in meta['watchdogs'] if path not in previous.get('watchdogs', [])]
    meta['newAnrFiles'] = ([path for path in meta['anrFiles'] if path not in previous['anrFiles']]
                           if 'anrFiles' in previous else None)
selected = [item for item in crashes if args.since_ms is None or item['atMs'] >= args.since_ms]
if args.since_ms is None:
    selected = selected[-20:]
retained = folder / 'crashes'
retained.mkdir(exist_ok=True)
for item in selected:
    name = item['path'].rsplit('/', 1)[1]
    (retained / name).write_bytes(adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(item['path']))))
meta['retainedCrashFiles'] = [item['path'] for item in selected]
for process in ('com.android.systemui', 'com.zte.mifavor.launcher', 'cn.nubia.gameassist', 'ls.augment.com'):
    (folder / (process + '-exits.txt')).write_text(shell('dumpsys activity exit-info ' + process, root=True), encoding='utf-8')
(folder / 'logcat.txt').write_bytes(adb('logcat', '-b', 'all', '-d', '-v', 'threadtime', timeout=45))
(folder / 'module-basic-log.txt').write_text(shell('cat /data/user/0/ls.augment.com/files/ls_augment.log', root=True), encoding='utf-8')
(folder / 'summary.json').write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps({'at': meta['at'], 'moduleVersion': meta['moduleVersion'], 'corePids': meta['corePids'],
    'currentProcesses': [{'process': p['process'], 'pid': p['pid'], 'calls': p['calls'], 'throws': p['throws'], 'errors': p['errors']} for p in current],
    'watchdogFiles': len(meta['watchdogs']), 'crashFiles': len(crashes),
    'newCrashFiles': meta.get('newCrashFiles'),
    'newWatchdogFiles': meta.get('newWatchdogFiles'), 'newAnrFiles': meta.get('newAnrFiles'),
    'newestCrashMs': crashes[-1]['atMs'] if crashes else None,
    'evidence': str(folder / 'summary.json')}, ensure_ascii=False), flush=True)
