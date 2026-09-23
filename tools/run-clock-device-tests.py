"""Observe the real SystemUI clock after config changes, using a separate observer APK."""
import json
import re
import time
from datetime import datetime
from adb_regression import OUTPUT, adb, shell, instrument
from native_ui_helpers import all_windows, nodes

stage = 'round12-clock'
folder = OUTPUT / (stage + '-results');folder.mkdir(exist_ok=True)
base = json.loads((OUTPUT / 'round12-before-clock/result-private.json').read_text(encoding='utf-8'))['settings']
changed = set()
results = []

def config(label, values):
    full = {'ls_augment_' + key: value for key, value in values.items()}
    changed.update(full)
    instrument('set', stage + '-' + label + '-config', full)
    shell('am start -n ls.augment.com/.SettingsActivity')
    time.sleep(1.3)

def observe(label):
    windows = all_windows(stage + '-' + label)
    actual = [n for n in nodes(windows) if n.get('id') == 'com.android.systemui:id/clock' and n.get('visible')]
    assert len(actual) == 1, actual
    node = {k: v for k, v in actual[0].items() if k != 'children'}
    (OUTPUT / (stage + '-' + label) / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    phone_time = shell('date -Iseconds')
    return {'node': node, 'phoneTime': phone_time, 'text': node['text']}

def save(name, proof, passed):
    entry = {'id': name, 'pass': passed, **proof}
    results.append(entry)
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(entry, ensure_ascii=False), flush=True)
    assert passed, name

try:
    first = observe('after-reboot')
    hour = int(datetime.fromisoformat(first['phoneTime']).strftime('%I'))
    save('CLOCK-01-reboot-12h-lunar', first, first['text'].startswith(f'LS {hour:02}:') and '\n丙午 马 七 廿七 ' in first['text'])
    time.sleep(2)
    second = observe('seconds-later')
    save('CLOCK-02-seconds-update', second, second['text'] != first['text'] and second['text'].split('\n')[1] == first['text'].split('\n')[1])
    config('single', {'statusbar_clock_rows': '1'})
    single = observe('single')
    save('CLOCK-03-single-ignores-second', single, '\n' not in single['text'] and single['text'].startswith('LS '))
    config('default24', {'statusbar_clock_pattern': '', 'statusbar_clock_24h': '1', 'statusbar_clock_seconds': '0', 'statusbar_clock_week': '0', 'statusbar_clock_period': '0'})
    normal = observe('default24')
    save('CLOCK-04-default-24h', normal, normal['text'] == datetime.fromisoformat(normal['phoneTime']).strftime('%H:%M'))
    config('default12', {'statusbar_clock_24h': '0', 'statusbar_clock_seconds': '1'})
    twelve = observe('default12')
    hour = int(datetime.fromisoformat(twelve['phoneTime']).strftime('%I'))
    save('CLOCK-05-default-12h-seconds', twelve, re.fullmatch(str(hour) + r':\d{2}:\d{2} [上下]午', twelve['text']) is not None)
    config('period-week', {'statusbar_clock_pattern': 'HH:mm', 'statusbar_clock_period': '1', 'statusbar_clock_week': '1'})
    period = observe('period-week')
    save('CLOCK-06-period-week', period, period['text'].endswith('晚上 周二'))
    config('quoted', {'statusbar_clock_pattern': "hh 'o''clock'", 'statusbar_clock_seconds': '0', 'statusbar_clock_period': '0', 'statusbar_clock_week': '0'})
    quoted = observe('quoted')
    hour = int(datetime.fromisoformat(quoted['phoneTime']).strftime('%I'))
    save('CLOCK-07-escaped-quote', quoted, quoted['text'] == f"{hour:02} o'clock")
    config('custom-off', {'statusbar_clock_custom': '0'})
    custom_off = observe('custom-off')
    save('CLOCK-08-custom-off', custom_off, custom_off['text'] == datetime.fromisoformat(custom_off['phoneTime']).strftime('%H:%M'))
    config('master-off', {'systemui_master': '0', 'statusbar_clock_custom': '1'})
    master_off = observe('master-off')
    save('CLOCK-09-master-off', master_off, master_off['text'] == datetime.fromisoformat(master_off['phoneTime']).strftime('%H:%M'))
finally:
    # Include the six values set during the initial failed-build reproduction.
    changed.update('ls_augment_' + key for key in ('systemui_master', 'statusbar_clock_custom', 'statusbar_clock_rows', 'statusbar_clock_pattern', 'statusbar_clock_pattern_second', 'statusbar_clock_width_dp'))
    instrument('set', stage + '-restore', {key: base[key] for key in changed})
    shell('am start -n ls.augment.com/.SettingsActivity')
