"""Isolate real lock carrier text-length/font boundaries with durable recovery.

Screenshots and actual ink must be reviewed; accessibility bounds and a saved
font value alone are not evidence that the requested glyph size was rendered.
"""
import argparse
import contextlib
import datetime as dt
import json
import os
from pathlib import Path
import re
import time
import traceback
import xml.etree.ElementTree as ET

import adb_regression as ar
import native_ui_helpers as ui

PREFIX = 'ls_augment_carrier_lock_'
KEYS = {PREFIX + suffix for suffix in ('enabled', 'mode', 'text', 'size')}


def atomic(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    with temporary.open('w', encoding='utf-8') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def instrument(operation, label, values=None):
    with (ar.OUTPUT / 'instrument-console.txt').open('a', encoding='utf-8') as stream:
        with contextlib.redirect_stdout(stream):
            return ar.instrument(operation, label, values)


def restore(output, journal):
    if journal['deviceSerial'] != ar.SERIAL or set(journal['values']) != KEYS:
        raise RuntimeError('Recovery journal does not match this device and carrier keys')
    ar.shell('input keyevent 224')
    ar.shell('wm dismiss-keyguard')
    instrument('set', 'restore', journal['values'])
    after = instrument('snapshot', 'restored')['settings']
    if any(after.get(k) != v for k, v in journal['values'].items()):
        raise RuntimeError('Carrier recovery readback mismatch')
    journal.update(pending=False, restoredAt=dt.datetime.now(dt.timezone.utc).isoformat())
    atomic(output / 'restore.json', journal)
    ar.shell('cmd statusbar collapse')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
    return after


def capture(label, size, text):
    ar.shell('input keyevent 223')
    time.sleep(.5)
    ar.shell('input keyevent 224')
    time.sleep(1.2)
    windows = ui.all_windows(label)
    visible = [n for n in ui.nodes(windows) if n.get('visible')]
    if not any(n.get('id') == 'com.android.systemui:id/keyguard_status_view' for n in visible):
        raise RuntimeError('Expected native lock screen is not visible')
    (ar.OUTPUT / label / 'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
    nodes = [{k: n.get(k) for k in ('id', 'text', 'bounds')} for n in visible
             if any(x in n.get('id', '') for x in ('carrier', 'clock', 'system_icons'))]
    raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
    diagnostics = {n.attrib['name']: n.text for n in ET.fromstring(raw)
                   if n.attrib.get('name', '').startswith(PREFIX) or
                   'statusbar_grid' in n.attrib.get('name', '')}
    case = {'label': label, 'sizeSp': size, 'text': text, 'nativeNodes': nodes,
            'diagnostics': diagnostics, 'systemuiPid': ar.shell('pidof com.android.systemui')}
    atomic(ar.OUTPUT / label / 'observations.json', case)
    print(label, nodes, flush=True)
    return case


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run', action='store_true')
    mode.add_argument('--restore-only', type=Path)
    args = parser.parse_args()
    if args.restore_only:
        ar.OUTPUT = ui.OUTPUT = args.restore_only.resolve()
        journal = json.loads((ar.OUTPUT / 'restore.json').read_text(encoding='utf-8'))
        restore(ar.OUTPUT, journal)
        atomic(ar.OUTPUT / 'manual-recovery.json', {'configurationRestored': True})
        return
    package = ar.shell('dumpsys package ls.augment.com')
    version = int(re.search(r'\bversionCode=(\d+)', package)[1])
    output = ar.ROOT / ('out/full-function-audit-20261004/lock-carrier-'+str(version)+'-'+time.strftime('%H%M%S'))
    output.mkdir(parents=True, exist_ok=False)
    ar.OUTPUT = ui.OUTPUT = output
    baseline = instrument('snapshot', 'baseline')['settings']
    journal = {'deviceSerial': ar.SERIAL, 'installedVersion': version, 'pending': True,
               'values': {key: baseline[key] for key in KEYS}}
    atomic(output / 'restore.json', journal)
    report = {'installedVersion': version, 'deviceSerial': ar.SERIAL, 'cases': [], 'errors': [],
              'configurationRestored': False, 'visualReviewRequired': True,
              'profile': {name: ar.shell(command) for name, command in {
                  'density': 'wm density', 'fontScale': 'settings get system font_scale',
                  'rotation': 'settings get system user_rotation'}.items()}}
    long_text = '锁屏长文字边界验证 '+('红魔Duo '*12)
    try:
        for label, size, text in [('short13',13,'DUO LOCK'), ('long13',13,long_text),
                                  ('short40',40,'DUO LOCK'), ('long40',40,long_text),
                                  ('short13-return',13,'DUO LOCK')]:
            ar.shell('input keyevent 224')
            ar.shell('wm dismiss-keyguard')
            ar.shell('cmd statusbar collapse')
            instrument('set', label, {PREFIX+'enabled':'1', PREFIX+'mode':'1',
                                     PREFIX+'text':text, PREFIX+'size':str(size)})
            report['cases'].append(capture(label, size, text))
            atomic(output / 'report.json', report)
    except BaseException:
        report['errors'].append(traceback.format_exc())
        raise
    finally:
        try:
            after = restore(output, journal)
            differences = {k: {'before': v, 'after': after.get(k)} for k, v in baseline.items() if after.get(k) != v}
            report['configurationRestored'] = not differences
            report['unexpectedSettingDifferences'] = differences
            if differences:
                raise RuntimeError('Configuration differs from baseline after recovery')
        except BaseException:
            report['errors'].append(traceback.format_exc())
            raise
        finally:
            atomic(output / 'report.json', report)
            print('Evidence:', output, flush=True)


if __name__ == '__main__':
    main()
