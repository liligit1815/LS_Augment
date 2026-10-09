"""Check exact reset entrypoints and model isolated versus init app-data mounts.

Production cleanup bodies execute only in disposable local fixtures. The host
nsenter double validates arguments and routes stdin to an init-view fixture;
it does not enter any real namespace or contact a device/system service.
"""
from pathlib import Path
import json
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
ASSETS = ROOT / 'android/app/src/main/assets'
OUT = ROOT / 'audit-output/reset-init-namespace-fixture'
OUT.mkdir(parents=True, exist_ok=True)
BASH = Path(r'C:/Program Files/Git/bin/bash.exe')
ENTRY = 'nsenter -t 1 -m -- sh'

results = []
for name, count in (('GameHelperResetCache', 1), ('LauncherResetController', 2), ('HealthResetController', 2)):
    source = (SRC / (name + '.java')).read_text(encoding='utf-8')
    commands = re.findall(r'RootShell\.run\(\s*([^,]+),', source)
    assert commands == ['"' + ENTRY + '"'] * count, (name, commands)
    results.append({'case': name + '-all-entrypoints-init-namespace', 'calls': count, 'pass': True})
launcher = (SRC / 'LauncherResetController.java').read_text(encoding='utf-8')
assert 'new String[]{base,deviceBase}' in launcher and 'app.dataDir.equals(deviceBase)' in launcher
assert launcher.index('LauncherResetXml.read') < launcher.index('LauncherResetRuntime.begin')
assert launcher.index('LauncherResetRuntime.await') < launcher.index('桌面清理结果无法安全读取')
assert 'stage=clear' not in launcher
assert 'am force-stop' not in (ASSETS / 'launcher_reset_records.sh').read_text(encoding='utf-8')
assert 'directory.equals(primary)?1:0' in launcher and 'required_base=' in launcher
results.append({'case': 'launcher-both-legal-storages-read-before-owning-ACK-and-after', 'pass': True})

# Read-only evidence already collected by the parent. No command is executed to
# verify these facts here, and no personal configuration content is emitted.
evidence_path = ROOT / 'outputs/total-reset-live-20412/root-paths-native.json'
if evidence_path.exists():
    evidence = json.loads(evidence_path.read_text(encoding='utf-8-sig'))['totalResetRootPaths']
    inherited = evidence['inheritedRootNamespace']['output']
    init = evidence['initRootNamespace']['output']
    assert evidence['configurationUnchanged'] and evidence['noForceStopNoResetNoDatabaseReads']
    assert evidence['initRootNamespace']['exitCode'] == 0 and evidence['initRootNamespace']['reliableCapture']
    assert '/system/bin/nsenter' in init and 'DIRECTORY=true' in init
    assert 'cn.nubia.gamehelpmodule\nDIRECTORY=false' in inherited
    assert 'cn.nubia.gamehelpmodule\nDIRECTORY=true' in init
    assert any(item.get('dataDir') == '/data/user_de/0/com.zte.mifavor.launcher'
               for item in evidence['packageIdentities'])
    results.append({'case': 'existing-native-nsenter-and-DE-path-evidence', 'pass': True})

def posix(path):
    value = path.resolve().as_posix()
    return '/' + value[0].lower() + value[2:] if value[1:2] == ':' else value

def quoted(value):
    return "'" + value.replace("'", "'\"'\"'") + "'"

for kind, package, uid, script_name, marker in (
    ('game', 'cn.nubia.gamehelpmodule', 10044, 'gamehelper_reset_cache.sh', 'GAMEHELPER_CACHE_CLEARED:1'),
    ('health', 'com.mi.health', 10177, 'health_reset_cleanup.sh', 'HEALTH_RESET_FILES=1'),
    ('launcher-ce', 'com.zte.mifavor.launcher', 10177, 'launcher_reset_records.sh', 'LAUNCHER_RESET_RECORDS_V1'),
    ('launcher-de', 'com.zte.mifavor.launcher', 10177, 'launcher_reset_records.sh', 'LAUNCHER_RESET_RECORDS_V1'),
):
    with tempfile.TemporaryDirectory(prefix=kind + '-', dir=OUT) as temp:
        folder = Path(temp)
        for namespace in ('isolated', 'init'):
            (folder / namespace / 'data/user/0/ls.augment.com').mkdir(parents=True)
            (folder / namespace / 'proc/1').mkdir(parents=True)
            (folder / namespace / 'proc/1/status').write_text('Uid:\t1\t1\t1\t1\n')
        storage = 'user_de' if kind.endswith('-de') else 'user'
        base = folder / f'init/data/{storage}/0/{package}'
        base.mkdir(parents=True)
        if kind == 'game':
            cache = base / 'cache/ls_augment_combo'
            cache.mkdir(parents=True)
            candidate = cache / ('motion-v3-' + 'a' * 64 + '.json')
            candidate.write_text('module derivative')
            original = base / 'files/original.json'
        elif kind == 'health':
            (base / 'databases').mkdir()
            (base / 'files').mkdir()
            candidate = base / 'databases/ls_augment_steps_v1.db'
            candidate.write_text('module ledger')
            original = base / 'databases/native.db'
        else:
            (base / 'shared_prefs').mkdir()
            candidate = base / 'shared_prefs/ls_augment_launcher_grid_state.xml'
            candidate.write_text('<map><int name="original_rows" value="6"/></map>')
            original = base / 'databases/native.db'
        original.parent.mkdir(parents=True, exist_ok=True)
        original.write_text('OEM original stays')
        raw = (f'expected_user=0\nexpected_uid={uid}\nbase=\'/data/{storage}/0/{package}\'\nstage=read\n'
               + (ASSETS / script_name).read_text(encoding='utf-8'))
        shim = f'''id() {{ printf '0\\n'; }}
cmd() {{ [ "$*" = 'package list packages --user 0 -U {package}' ] || return 1; printf 'package:{package} uid:{uid}\\n'; }}
am() {{ [ "$*" = 'force-stop --user 0 {package}' ] || return 1; }}
sleep() {{ :; }}
fsync() {{ :; }}
stat() {{ if [ "$1" = -c ] && [ "$2" = %u ]; then printf '{uid}\\n'; else command stat "$@"; fi; }}
'''
        def translated(namespace):
            prefix = posix(folder / namespace)
            body = re.sub(r'(?<![A-Za-z0-9_/])/data(?=/|[\s\'\"]|$)', prefix + '/data', raw)
            return shim + body.replace('/proc/[0-9]', prefix + '/proc/[0-9]')
        # Entering init's view is modeled at the exact namespace command boundary.
        # The inherited view has no target sandbox, matching the observed failure.
        init_script = folder / 'init-input.sh'
        init_script.write_text(translated('init'), encoding='utf-8', newline='\n')
        wrapper = ('nsenter() { [ "$*" = "-t 1 -m -- sh" ] || return 79; '
                   + 'command bash -s; }\n' + ENTRY + '\n')
        command = wrapper.replace('command bash -s;', 'command bash -s < ' + quoted(posix(init_script)) + ';')
        run = subprocess.run([str(BASH), '-s'], input=command, capture_output=True, text=True)
        assert run.returncode == 0 and marker in run.stdout, (kind, run)
        assert original.read_text() == 'OEM original stays'
        if kind in ('game', 'health'):
            assert not candidate.exists()
            inherited = subprocess.run([str(BASH), '-s'], input=translated('isolated'), capture_output=True, text=True)
            assert inherited.returncode == 73, (kind, inherited)
        else:
            assert candidate.exists()  # Read phase never discards grid originals.
        results.append({'case': kind + '-init-view-original-retained', 'pass': True})

report = {'success': True, 'scope': 'OFFLINE_NAMESPACE_DOUBLE_AND_EXISTING_READ_ONLY_NATIVE_EVIDENCE_NO_ADB',
          'cases': results}
(OUT / 'result.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
print('PASS reset init namespace:', len(results), 'checks; no device commands')
