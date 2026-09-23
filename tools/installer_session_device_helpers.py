"""Round 119 observations; actions remain explicit native UI clicks by root."""
import json
import shlex
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from game_device_helpers import capture, compact

CALLER = 'ls.augment.regression.installer'
TARGET = 'ls.augment.regression.signature'


def observe(label, ui=True):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    result = {}
    if ui:
        result['ui'] = compact(capture(label))
    for name in ['state.json', 'events.jsonl']:
        raw = adb('exec-out', 'su -c ' + shlex.quote('cat /data/user/0/' + CALLER + '/files/' + name))
        (folder / name).write_bytes(raw)
        if name == 'state.json':
            result['state'] = json.loads(raw)
    for name, command in [('installer-activity', 'dumpsys activity com.android.packageinstaller'),
                          ('target-package', 'dumpsys package ' + TARGET),
                          ('caller-appops', 'cmd appops get ' + CALLER)]:
        (folder / (name + '-private.txt')).write_text(shell(command, root=True), encoding='utf-8')
    for name in ['ls_augment_config_v2', 'hook-processes', 'ls_augment_diagnostics_v2']:
        (folder / (name + '.json')).write_text(json.dumps(prefs(name), ensure_ascii=False, indent=2), encoding='utf-8')
    return result


def brief(result):
    state = result['state']
    return {'phase': state.get('phase'), 'session': state.get('session_id'),
            'terminal': state.get('terminal'), 'last_event': state.get('last_event'),
            'ui': [{k: n[k] for k in ['id', 'text', 'bounds']} for n in result.get('ui', [])
                   if n.get('text') not in ['', 'null'] and len(n.get('text', '')) < 700]}
