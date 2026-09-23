"""Real native switches/styles and module OFF restore original Recents text."""
import json
import sys
import time
from adb_regression import OUTPUT, instrument, shell
from module_ui_helpers import hierarchy
from recents_device_helpers import native_memory, overview, style

stage = sys.argv[1] if len(sys.argv) > 1 else 'round40q'
out = OUTPUT / (stage + '-memory-gates')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
rows = []


def check(label, count):
    label = label.replace('round40q', stage, 1)
    _, result = overview(label)
    assert len(result['memory']) == count, result['memory']
    rows.append({'label': label, 'nativeStyle': result['style'], 'nativeMemory': result['nativeMemory'],
                 'text': [n['text'] for n in result['memory']], 'pass': True})
    (out / 'progress.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')


def custom(label, value):
    label = label.replace('round40q', stage, 1)
    instrument('set', label + '-config', {'ls_augment_rm_recents_memory_custom': str(value)})
    time.sleep(.8)


custom(stage + '-initial-enable', 1)
native_memory(stage + '-native-off', False)
check('round40q-native-off-custom-on', 0)
native_memory(stage + '-native-on', True)
check('round40q-both-on', 1)
custom('round40q-custom-off', 0)
check('round40q-native-stack-restored', 2)
for value, name in [(1, '标准样式'), (2, '宫格样式')]:
    style(stage + '-style' + str(value), name)
    check(f'round40q-style{value}-custom-off', 0)
    custom(f'round40q-style{value}-enable', 1)
    check(f'round40q-style{value}-custom-on', 1)
    custom(f'round40q-style{value}-disable', 0)
    check(f'round40q-style{value}-restored', 0)
style(stage + '-style3', '堆叠样式')
custom('round40q-style3-enable', 1)
check('round40q-stack-return', 1)
shell('input keyevent 3')
time.sleep(.8)
root = hierarchy(stage + '-home-clean')
assert not [n for n in root.iter('node') if n.get('visible-to-user') == 'true' and 'GB' in n.get('text', '')]
result = {'cases': rows, 'homeHasNoMemoryOverlay': True, 'pass': True}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
