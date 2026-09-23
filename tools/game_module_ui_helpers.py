"""Set game options through fresh, observed module controls on the phone."""
import json
import time
from adb_regression import OUTPUT, shell
from fan_device_helpers import prefs
from module_ui_helpers import find, tap_node


def set_options(label, options, module=None, group='game'):
    """options contains (visible title, exact config key, enabled) tuples."""
    target = ('FeatureActivity --es module ' + module if module else
              'EnhancementSettingsActivity --es group ' + group)
    shell('am start -W -f 0x10008000 -n ls.augment.com/.' + target, root=True)
    for i, (title, key, enabled) in enumerate(options):
        _, found = find(label + '-find' + str(i), title)
        switches = [n for n in found if n.get('class') == 'android.widget.Switch']
        assert len(switches) == 1, (title, len(switches))
        if (switches[0].get('checked') == 'true') != enabled:
            tap_node(label + '-toggle' + str(i), switches[0])
        time.sleep(1)
        assert prefs('ls_augment_config_v2')[key] == ('1' if enabled else '0'), key
    config = prefs('ls_augment_config_v2')
    folder = OUTPUT / label; folder.mkdir(exist_ok=True)
    (folder / 'config.json').write_text(json.dumps(config, indent=2), encoding='utf-8')
    return config
