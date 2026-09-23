"""Turn off unlimited trial in the real module page and use its scope restart control."""
import json
import re
import sys
import time
from adb_regression import OUTPUT, adb, shell, snapshot
from launcher_icon_device_helpers import saved
from module_ui_helpers import hierarchy, matches, tap
from theme_device_helpers import state

stage = sys.argv[1]
expected_trial = sys.argv[2] if len(sys.argv) > 2 else '257'
assert expected_trial in ('257', '16')
out = OUTPUT / (stage + '-off-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Retain prior journal; choose a new stage'
before = state()
assert before['adapter']['trial_key'] == expected_trial
assert before['settings']['app_master'] == before['settings']['beautify_unlimited_trial'] == '1'
before['adapterPid'] = shell('pidof com.zte.beautifyadapter')
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
shell('am start -W -n ls.augment.com/.SettingsActivity')
for i in range(5):
    root = hierarchy(stage + '-module-home' + str(i))
    if matches(root, '应用增强'):
        break
    shell('input keyevent 4')
else:
    raise AssertionError('Module overview not reached')
tap(stage + '-apps', '应用增强')
tap(stage + '-theme', '主题无限期试用')
tap(stage + '-disable', '无限期试用')
for i in range(25):
    if saved('beautify_unlimited_trial') == '0':
        break
    time.sleep(.2)
assert saved('beautify_unlimited_trial') == '0' and saved('app_master') == '1'
tap(stage + '-restart', '重启作用域')
root = hierarchy(stage + '-restart-dialog')
selected = matches(root, '应用增强（安装兼容、双开与主题商店）')
assert len(selected) == 1 and selected[0].get('checked') == 'true'
tap(stage + '-confirm-restart', '立即重启')
time.sleep(1)
(out / 'native-launch.txt').write_bytes(adb('shell',
    'monkey -p com.zte.beautify -c android.intent.category.LAUNCHER 1'))
original = json.loads((OUTPUT / 'round37n2-original-theme-applied/state.json').read_text(encoding='utf-8'))
observations = []
for i in range(25):
    after = state()
    configuration = shell('dumpsys activity activities')
    font = re.search(r'customFont=([^\s}]+)', configuration)[1]
    wallpaper = shell('dumpsys wallpaper')
    components = re.findall(r'^  mWallpaperComponent=(.+)$', wallpaper, re.M)
    recovered = (after['adapter']['trial_key'] == '0' and after['wallpapers'] == original['wallpapers']
                 and font == 'sans-serif' and bool(components) and 'ImageWallpaper' in components[0])
    observations.append({'state': after, 'actualGlobalFont': font, 'recovered': recovered})
    if recovered:
        break
    time.sleep(1)
(out / 'configuration-after.txt').write_text(configuration, encoding='utf-8')
(out / 'wallpaper-after.txt').write_text(wallpaper, encoding='utf-8')
result = {'case': 'Native-trial-recovery-after-feature-off-and-real-scope-button',
          'pass': recovered and before['adapterPid'] != shell('pidof com.zte.beautifyadapter'),
          'before': before, 'after': after, 'actualGlobalFont': font, 'observations': observations}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
shell('input keyevent 3')
snapshot(stage + '-desktop', False)
print({k: v for k, v in result.items() if k not in ('before', 'after', 'observations')}, flush=True)
assert result['pass']
