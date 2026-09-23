"""Record actual OEM preview pixels at the selected rate, then verify mark timing."""
import argparse
import math
import subprocess
import sys
import xml.etree.ElementTree as ET
from game_device_helpers import *
from adb_regression import ADB, SERIAL
from module_ui_helpers import hierarchy, visible, tap_node
from fan_device_helpers import prefs

parser = argparse.ArgumentParser()
parser.add_argument('stage')
parser.add_argument('value', choices=['1', '5', '10', 'off'])
args = parser.parse_args()
out = OUTPUT / args.stage
out.mkdir(exist_ok=True)
assert not (out / 'native-preview.mp4').exists()
shell('am start -W -n ls.augment.com/.FeatureActivity --es module combo_speed', root=True)
root = hierarchy(args.stage + '-page')
switches = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.Switch']
assert len(switches) == 1
enabled = args.value != 'off'
if (switches[0].get('checked') == 'true') != enabled:
    tap_node(args.stage + '-switch', switches[0])
    root = hierarchy(args.stage + '-switched')
rate = 1 if not enabled else int(args.value)
if enabled:
    bars = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.SeekBar']
    assert len(bars) == 1
    b = list(map(int, re.findall(r'\d+', bars[0].get('bounds'))))
    shell(f'input tap {round(b[0] + 5 + (b[2] - b[0] - 10) * (rate - 1) / 9)} {(b[1] + b[3]) // 2}')
hierarchy(args.stage + '-saved')
config = prefs('ls_augment_config_v2')
assert config['ls_augment_combo_speed_enabled'] == ('1' if enabled else '0')
assert not enabled or config['ls_augment_combo_speed_rate'] == args.value
shell('am start -W -n ' + COMPONENT)
shell('am broadcast -a cn.nubia.gamelauncher.action.START_ONEKEYLINGK '
      '-n cn.nubia.gamehelpmodule/cn.nubia.gamehelper.GameAssistReceiver '
      '--es packagename ' + PACKAGE + ' --ei enable 1', root=True)
observed = list(nodes(all_windows(args.stage + '-native-entry')))
if any(n.get('visible') and n.get('id') == 'cn.nubia.gamehelpmodule:id/btn_go_home_list' for n in observed):
    touch(args.stage + '-open-list', identity='cn.nubia.gamehelpmodule:id/btn_go_home_list')
touch(args.stage + '-edit', identity='cn.nubia.gamehelpmodule:id/edit')
marker = max((e['now'] for e in input_events(args.stage + '-input-before')), default=0)
remote = '/data/local/tmp/lsa-' + args.stage + '.mp4'
assert re.fullmatch(r'/data/local/tmp/lsa-[A-Za-z0-9_.-]+\.mp4', remote)
seconds = math.ceil(31.889 / rate + 6)
proc = subprocess.Popen([str(ADB), '-s', SERIAL, 'shell', 'screenrecord', '--bit-rate', '12000000',
                         '--time-limit', str(seconds), remote], stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE, creationflags=subprocess.CREATE_NO_WINDOW)
time.sleep(.7)
touch(args.stage + '-preview', identity='cn.nubia.gamehelpmodule:id/menu_tv_preview')
stdout, stderr = proc.communicate(timeout=seconds + 10)
assert proc.returncode == 0, (stdout, stderr)
adb('pull', remote, out / 'native-preview.mp4')
assert (out / 'native-preview.mp4').stat().st_size > 10000
shell('rm -f ' + shlex.quote(remote))
events = [e for e in input_events(args.stage + '-input-after') if e['now'] > marker]
observed = capture(args.stage + '-actual-after')
returned = any(n.get('visible') and n.get('id') == 'cn.nubia.gamehelpmodule:id/close_home_page' for n in observed)
completed = subprocess.run([sys.executable, 'tools/analyze-combo-preview-video.py', str(out), str(rate)], capture_output=True, text=True)
(out / 'pixel-analysis-output.txt').write_text(completed.stdout + completed.stderr, encoding='utf-8')
print(completed.stdout, flush=True)
assert completed.returncode == 0, completed.stdout + completed.stderr
result = json.loads((out / 'preview-results.json').read_text(encoding='utf-8'))
result.update({'featureEnabled': enabled, 'returnedToOriginalList': returned,
               'previewDidNotInjectIntoGame': not events,
               'runtimeWitness': shell('settings get global ls_augment_combo_speed_last_hit')})
result['pass'] &= returned and not events
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print(result, flush=True)
assert result['pass']
