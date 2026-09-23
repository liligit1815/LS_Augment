"""One explicit installer option, on the real phone and owned APK only."""
import json
import sys
from adb_regression import OUTPUT, shell
from fan_device_helpers import prefs
from game_module_ui_helpers import set_options
from installer_device_helpers import open_fixture

case, label = sys.argv[1:3]
assert case in ['cts', 'purify', 'store', 'scan', 'off']
options = [('scan', '跳过安装包扫描', 'installer_skip_scan'),
           ('purify', '隐藏纯净模式选项', 'installer_hide_purify'),
           ('store', '隐藏应用商店推荐', 'installer_hide_store'),
           ('cts', '使用简洁安装界面', 'installer_cts')]
shell('input keyevent 4')
set_options(label + '-settings', [(title, 'ls_augment_rm_' + key, kind == case)
                                 for kind, title, key in options], group='installer')
shell('am force-stop com.android.packageinstaller', root=True)
observed = open_fixture(label)
native = {n['id']: n for n in observed if n.get('visible') and n.get('package') == 'com.android.packageinstaller'}
prefix = 'com.android.packageinstaller:id/'
checks = {'cts': (prefix + 'install_confirm_question_update' in native) == (case == 'cts')}
if case != 'cts':
    checks.update(purify=(prefix + 'pure_mode' in native) == (case != 'purify'),
                  store=(prefix + 'market_replace' in native) == (case != 'store'),
                  continue_present=prefix + 'ok_button' in native,
                  source_preserved=native[prefix + 'app_origin']['text'] == '安装来源：文件')
    if case == 'purify': checks['continue_enabled'] = native[prefix + 'ok_button']['enabled']
    if case == 'scan': checks['unscanned_native_warning'] = prefix + 'warning_unknown' in native
folder = OUTPUT/label
(folder/'checks.json').write_text(json.dumps(checks, indent=2), encoding='utf-8')
(folder/'diagnostics-private.json').write_text(json.dumps(prefs('ls_augment_diagnostics_v2')), encoding='utf-8')
assert all(checks.values()), checks
print(case, checks, flush=True)
