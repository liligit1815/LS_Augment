"""Read-only snapshot against the actual round122 game baseline paths."""
import json
import re
import shlex
import sys
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs, sample

label = sys.argv[1]
assert re.fullmatch(r'[A-Za-z0-9_.-]+', label)
p = OUTPUT / label
p.mkdir(exist_ok=True)
assert not (p / 'capture-complete.json').exists()
base = OUTPUT / 'round122a-game-baseline'
inventory = {}
for namespace in ('global', 'system', 'secure'):
    (p / (namespace + '-private.txt')).write_text(shell('settings list ' + namespace), encoding='utf-8')
for package in sorted({x.name for x in (base / 'native-prefs').iterdir()} | {'cn.nubia.gamehighlights'}):
    raw = shell('dumpsys package ' + package)
    (p / (package + '-package-private.txt')).write_text(raw, encoding='utf-8')
    paths = re.findall(r'^\s*dataDir=(/[^\r\n]+)', raw, re.M)
    assert paths, package
    directory = paths[0].strip() + '/shared_prefs'
    names = shell('find ' + shlex.quote(directory) + ' -maxdepth 1 -type f -name "*.xml" 2>/dev/null || true', root=True).splitlines()
    local = p / 'native-prefs' / package
    local.mkdir(parents=True, exist_ok=True)
    inventory[package] = {'directory': directory, 'files': names}
    for name in names:
        assert name.startswith(directory + '/') and name.endswith('.xml'), name
        (local / name.rsplit('/', 1)[1]).write_bytes(adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(name))))
for name in ('ls_augment_config_v2', 'ls_augment_diagnostics_v2', 'hook-processes'):
    try:
        value = prefs(name)
    except Exception as e:
        value = {'captureError': str(e)}
    (p / (name + '.json')).write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')
for name, command in {
    'record-services-private.txt': 'dumpsys activity services cn.nubia.gamehighlights',
    'assist-private.txt': 'dumpsys activity service cn.nubia.gameassist/.service.GameAssistService',
    'power-private.txt': 'dumpsys power', 'audio-private.txt': 'dumpsys audio',
    'appwidget-private.txt': 'dumpsys appwidget', 'dropbox-private.txt': 'dumpsys dropbox',
    'tasks-private.txt': 'dumpsys activity activities',
    'media-video-private.txt': 'content query --uri content://media/external/video/media --projection _id:_data:_size:duration:owner_package_name:date_added',
    'highlight-package-appops.txt': 'cmd appops get cn.nubia.gamehighlights',
    'highlight-uid-appops.txt': 'cmd appops get --uid cn.nubia.gamehighlights'
}.items():
    (p / name).write_text(shell(command, root=True), encoding='utf-8')
(p / 'fan.json').write_text(json.dumps(sample(), ensure_ascii=False, indent=2), encoding='utf-8')
(p / 'capture-complete.json').write_text(json.dumps(inventory, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps({'label': label, 'xmlFiles': sum(len(v['files']) for v in inventory.values())}))
