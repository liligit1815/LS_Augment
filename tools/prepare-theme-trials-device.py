"""Start the two pre-existing cached resources using their native explicit trial buttons."""
import sys
import time
from theme_device_helpers import open_local, card, tap_label, save_state

stage = sys.argv[1]
save_state(stage + '-before')
open_local(stage + '-theme', '主题', False)
card(stage + '-trial-theme', '多图冬日小奶猫')
tap_label(stage + '-theme-trial', '立即试用')
time.sleep(2)
value = save_state(stage + '-theme-active')
assert value['selection']['selectedThemeId'] == 'ZT677798e9e4b005c6bf44ef29'
print({'themeActive': True, 'trial': value['adapter']['trial_key']}, flush=True)
open_local(stage + '-font', '字体', False)
card(stage + '-trial-font', '体制阅读公文楷体')
tap_label(stage + '-font-trial', '立即试用')
time.sleep(2)
value = save_state(stage + '-font-active')
assert value['selection']['selectedFontId'] == 'FT6924fdefe4b06e8e0765c1e0'
assert value['adapter']['trial_key'] == '257'
print({'bothTrialsActive': True, 'trial': value['adapter']['trial_key']}, flush=True)
