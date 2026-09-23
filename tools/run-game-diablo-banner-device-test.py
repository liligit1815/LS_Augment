"""One short native recording transition, using the already observed panel layout."""
import json
import sys
import time
from adb_regression import OUTPUT, adb, shell
from game_device_helpers import touch
from game_assist_panel_helpers import open_panel, state
from fan_device_helpers import sample

stage = sys.argv[1] if len(sys.argv) > 1 else 'round125c'
p = OUTPUT / (stage + '-banner-transition')
p.mkdir(exist_ok=True)
assert not (p / 'result.json').exists(), 'Do not overwrite an earlier attempt'
actions = []

def save(name):
    (p / (name + '.png')).write_bytes(adb('exec-out', 'screencap -p'))
    (p / (name + '-services.txt')).write_text(shell('dumpsys activity services cn.nubia.gamehighlights'), encoding='utf-8')
    keys = ['game_chicken_mode_switch', 'game_chicken_mode_tips_show', 'game_mode_floating_window_show',
            'manual_record', 'db_game_chicken_value', 'gamehelperline_enable_pkgs']
    s = {k: shell('settings get global ' + k) for k in keys}
    s['deviceTime'] = shell('date -Iseconds')
    (p / (name + '-settings.json')).write_text(json.dumps(s, ensure_ascii=False, indent=2), encoding='utf-8')
    return s

def tap(x, y, purpose):
    actions.append({'at': shell('cat /proc/uptime'), 'x': x, 'y': y, 'purpose': purpose})
    shell(f'input tap {x} {y}')

result = {}
try:
    touch(stage + '-confirm-record', identity='android:id/button1')
    time.sleep(2)
    before = save('before-balanced')
    assert before['manual_record'] == '1' and before['game_chicken_mode_switch'] == '0', before
    s = open_panel(stage + '-before-panel')
    assert s['super_resolution'] and not s['biablo_mode'], s
    tap(220, 938, 'Observed native Diablo tile')
    time.sleep(.4)
    touch(stage + '-confirm-diablo', identity='android:id/button1')
    time.sleep(.8)
    deadline = time.monotonic() + 4
    while shell('settings get global game_mode_floating_window_show') == '0' and time.monotonic() < deadline:
        time.sleep(.3)
    banner = save('diablo-banner')
    assert banner['game_chicken_mode_switch'] == '2', banner
    result['bannerAppeared'] = banner['game_mode_floating_window_show'] == '1'
    if result['bannerAppeared']:
        touch(stage + '-close-banner-only', identity='cn.zte.gamefloat:id/closeId')
        time.sleep(.7)
    after = save('diablo-banner-closed')
    assert after['game_chicken_mode_switch'] == '2' and after['game_mode_floating_window_show'] == '0', after
    assert after['game_chicken_mode_tips_show'] == '0' and after['manual_record'] == '1', after
    # Save promptly, before further diagnostics consume the retrospective window.
    tap(2178, 177, 'Observed native save recording ball')
    time.sleep(.7)
    (p / 'after-save.png').write_bytes(adb('exec-out', 'screencap -p'))
    s = open_panel(stage + '-after-panel')
    assert s['super_resolution'] and s['biablo_mode'], s
    result['transitionRetainedSuperAndRecording'] = True
    result['nativeBannerDismiss'] = True if result['bannerAppeared'] else 'not_shown'
finally:
    # The same observed native controls are used to end the short session.
    if shell('settings get global game_chicken_mode_switch') == '2':
        open_panel(stage + '-exit-panel')
        tap(220, 938, 'Native Diablo OFF')
        time.sleep(.8)
    if shell('settings get global manual_record') == '1':
        open_panel(stage + '-stop-panel')
        tap(2558, 680, 'Native manual recording OFF')
        time.sleep(.8)
    result['stopped'] = save('stopped')
    result['fan'] = sample()
    (p / 'actions.json').write_text(json.dumps(actions, ensure_ascii=False, indent=2), encoding='utf-8')
    (p / 'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    tap(1344, 300, 'Close native game panel outside its controls')
    shell('input keyevent 3')
    shell('input keyevent 223')
print(json.dumps(result, ensure_ascii=False))
