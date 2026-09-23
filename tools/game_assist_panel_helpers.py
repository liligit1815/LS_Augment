"""Real GameAssist panel observation; its main window is absent from accessibility trees."""
import json
import re
import time
from adb_regression import OUTPUT, adb, shell


def state(label):
    folder = OUTPUT / label; folder.mkdir(exist_ok=True)
    raw = shell('dumpsys activity service cn.nubia.gameassist/.service.GameAssistService')
    (folder / 'native-service-private.txt').write_text(raw, encoding='utf-8')
    match = re.search(r'\bmVisible:\s*(true|false)', raw)
    assert match, 'Native panel visibility not reported'
    result = {'visible': match.group(1) == 'true'}
    for spec in ['super_resolution', 'biablo_mode', 'counter']:
        values = re.findall(r'mState=State\[value=(true|false),[^\n]*?spec=' + spec + ',', raw)
        assert values and len(set(values)) == 1, (spec, values)
        result[spec] = values[0] == 'true'
    (folder / 'native-state.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    return result


def open_panel(label):
    actions = []
    for i in range(4):
        current = state(label + '-state' + str(i))
        if current['visible']:
            break
        shell('input swipe 5 220 800 220 250')
        actions.append([5, 220, 800, 220, 250])
        time.sleep(.7)
    else:
        raise AssertionError('Panel did not open after observed native entry gestures')
    time.sleep(1)
    folder = OUTPUT / label; folder.mkdir(exist_ok=True)
    (folder / 'actions.json').write_text(json.dumps({'leftTouchRect': [0,111,59,405], 'swipes': actions}), encoding='utf-8')
    (folder / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    return current
