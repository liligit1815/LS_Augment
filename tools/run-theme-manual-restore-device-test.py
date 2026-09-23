"""Replace actual native trial resources and verify their individual trial flags clear."""
import json
import re
import sys
import time
from theme_device_helpers import open_local, card, tap_label, save_state
from adb_regression import OUTPUT, shell, snapshot

stage = sys.argv[1]
out = OUTPUT / (stage + '-manual-results')
out.mkdir(exist_ok=True)
assert not (out / 'font-result.json').exists(), 'Keep the prior result; use a fresh stage'
before = save_state(stage + '-before-manual')
assert before['adapter']['trial_key'] == '257'
open_local(stage + '-font', '字体', False)
card(stage + '-default-font', '思源黑体（默认）')
tap_label(stage + '-font-apply', '应用')
time.sleep(2)
value = save_state(stage + '-default-font-applied')
configuration = shell('dumpsys activity activities')
(out / 'font-configuration.txt').write_text(configuration, encoding='utf-8')
font = re.search(r'customFont=([^\s}]+)', configuration)[1]
result = {'case': 'Manual-default-font-clears-only-font-trial',
          'pass': value['adapter']['trial_key'] == '1'
                  and value['selection']['selectedFontId'] == 'default_font_android_id'
                  and value['selection']['selectedThemeId'] == before['selection']['selectedThemeId']
                  and value['wallpapers'] == before['wallpapers'] and font == 'sans-serif',
          'actualGlobalFont': font, 'before': before, 'after': value}
(out / 'font-result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ('before', 'after')}, flush=True)
assert result['pass']
open_local(stage + '-theme', '主题', False)
card(stage + '-original-theme', '液态琉璃·面板验证')
tap_label(stage + '-theme-apply', '应用')
time.sleep(2)
value = save_state(stage + '-original-theme-applied')
original = json.loads((OUTPUT / 'round37k-original-theme-applied/state.json').read_text(encoding='utf-8'))
result = {'case': 'Manual-original-theme-clears-last-trial',
          'pass': value['adapter']['trial_key'] == '0' and value['selection'] == original['selection']
                  and value['wallpapers'] == original['wallpapers'], 'after': value, 'original': original}
(out / 'theme-result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
shell('input keyevent 3')
snapshot(stage + '-restored-desktop', False)
print({k: v for k, v in result.items() if k not in ('after', 'original')}, flush=True)
assert result['pass']
