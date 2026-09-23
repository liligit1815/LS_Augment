"""Private observations for the native wake-only game path; capture never wakes."""
import json
import re
import shlex
import time
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs


def capture(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    for name, command in [('assist', 'dumpsys activity service cn.nubia.gameassist/.service.GameAssistService'),
                          ('power', 'dumpsys power'), ('task', 'dumpsys activity activities'),
                          ('window', 'dumpsys window windows'), ('global', 'settings list global')]:
        (folder / (name + '-private.txt')).write_text(shell(command, root=True), encoding='utf-8')
    for name in ['active_mode_wack_lock_list.xml', 'active_mode_free_form_list.xml']:
        path = '/data/user_de/0/cn.nubia.gameassist/shared_prefs/' + name
        (folder / name).write_bytes(adb('exec-out', 'su -c ' + shlex.quote('cat ' + path)))
    (folder / 'config.json').write_text(json.dumps(prefs('ls_augment_config_v2'), indent=2), encoding='utf-8')
    (folder / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    return folder


def open_panel(label):
    # Observed landscape edge entry; unlike the older helper, no dependency on
    # super-resolution or Diablo tiles being available to this particular game.
    for _ in range(4):
        raw = shell('dumpsys activity service cn.nubia.gameassist/.service.GameAssistService')
        if re.search(r'mVisible:\s*true', raw):
            time.sleep(.7)
            return capture(label)
        shell('input swipe 5 220 800 220 250')
        time.sleep(.7)
    raise AssertionError('Native panel did not become visible')
