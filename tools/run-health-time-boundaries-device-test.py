"""Use the actual Android time picker; leave all plans in tomorrow's date."""
import json
import re
import time
from datetime import datetime, timedelta
from adb_regression import OUTPUT, instrument, shell
from launcher_icon_device_helpers import saved
from health_device_helpers import plan_events
from module_ui_helpers import hierarchy, visible, tap_node, scroll

stage = 'round39zj'
out = OUTPUT / (stage + '-time-boundaries')
before = json.loads((out / 'before-private.json').read_text(encoding='utf-8'))
guard = json.loads((out / 'guard.json').read_text(encoding='utf-8'))
results = []


def guard_plan():
    p = saved('health_plan').split('|')
    assert p[1] == guard['planId'] and p[4] == guard['startDate']
    assert p[4] > str(datetime.fromisoformat(shell('date -Iseconds')).date())
    return p


def text_input(label, resource_id, value):
    root = hierarchy(label + '-before')
    node = next(n for n in root.iter('node') if visible(n) and n.get('resource-id') == resource_id)
    tap_node(label + '-focus', node)
    shell('input keyevent 123')
    old = node.get('text', '')
    if old:
        shell('input keyevent ' + ' '.join(['67'] * len(old)))
    shell('input text ' + str(value))
    shell('input keyevent 4')


def open_picker(label, start):
    guard_plan()
    prefix = '开始：' if start else '结束：'
    for i in range(8):
        root = hierarchy(label + '-locate' + str(i))
        buttons = [n for n in root.iter('node') if n.get('class') == 'android.widget.Button' and n.get('text', '').startswith(prefix)]
        assert len(buttons) == 1
        if visible(buttons[0]):
            tap_node(label + '-open', buttons[0])
            break
        scroll(root, up=True, short=True)
    root = hierarchy(label + '-clock')
    if not any(visible(n) and n.get('resource-id') == 'android:id/input_hour' for n in root.iter('node')):
        button = next(n for n in root.iter('node') if visible(n) and n.get('resource-id') == 'android:id/toggle_mode')
        tap_node(label + '-keyboard-mode', button)


def set_picker(label, hour, minute, cancel=False):
    text_input(label + '-hour', 'android:id/input_hour', hour)
    text_input(label + '-minute', 'android:id/input_minute', minute)
    root = hierarchy(label + '-submit-before')
    button = next(n for n in root.iter('node') if visible(n) and n.get('resource-id') == ('android:id/button2' if cancel else 'android:id/button1'))
    tap_node(label + '-submit', button)
    time.sleep(1)


def check(label, start, end, count=1, invalid=False, preview=True):
    p = guard_plan()
    assert [int(p[i]) for i in (5, 6, 7)] == [start, end, count], p[5:10]
    message = ''
    if preview:
        for i in range(8):
            root = hierarchy(label + '-preview' + str(i))
            nodes = [n for n in root.iter('node') if visible(n) and (n.get('text', '').startswith('每日合计：') or n.get('text', '').startswith('请设置有效次数'))]
            if nodes:
                message = nodes[0].get('text')
                break
            scroll(root, short=True)
        assert message.startswith('请设置有效次数' if invalid else f'每日合计：{count * 3} 步')
    result = {'case': label, 'savedStartMinute': start, 'savedEndMinute': end,
              'savedExecutions': count, 'invalidDraftRejected': invalid, 'preview': message, 'pass': True}
    results.append(result)
    (out / 'observations.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in result.items() if k != 'preview'}), flush=True)
    return message


try:
    # The first picker was opened and inspected interactively before this run.
    set_picker(stage + '-cancel', 12, 34, cancel=True)
    check(stage + '-cancel', 540, 1080, preview=False)
    open_picker(stage + '-same-time', False)
    set_picker(stage + '-same-time', 9, 0)
    check(stage + '-same-time', 540, 1080, invalid=True)
    open_picker(stage + '-late-start', True)
    set_picker(stage + '-late-start', 23, 59)
    check(stage + '-late-start', 1439, 540)
    open_picker(stage + '-cross-midnight', False)
    set_picker(stage + '-cross-midnight', 0, 1)
    check(stage + '-cross-midnight', 1439, 1)
    # Two actual input events force one preview on each side of midnight.
    for i in range(8):
        root = hierarchy(stage + '-two-executions-field' + str(i))
        fields = [n for n in root.iter('node') if n.get('class') == 'android.widget.EditText']
        assert len(fields) == 2
        if visible(fields[0]):
            tap_node(stage + '-two-executions-focus', fields[0])
            shell('input keyevent 123')
            shell('input keyevent 67')
            shell('input text 2')
            shell('input keyevent 4')
            break
        scroll(root, up=True, short=True)
    time.sleep(1)
    message = check(stage + '-two-midnight-times', 1439, 1, count=2)
    tomorrow = datetime.fromisoformat(guard['startDate'])
    assert tomorrow.strftime('%m/%d') + ' 23:59 +3' in message
    assert (tomorrow + timedelta(days=1)).strftime('%m/%d') + ' 00:00 +3' in message
    open_picker(stage + '-insufficient-minutes', False)
    set_picker(stage + '-insufficient-minutes', 0, 0)
    check(stage + '-insufficient-minutes', 1439, 1, count=2, invalid=True)
    open_picker(stage + '-recover-valid-time', False)
    set_picker(stage + '-recover-valid-time', 0, 2)
    check(stage + '-recover-valid-time', 1439, 2, count=2)
    events = plan_events(stage + '-future-ledger', guard['planId'])
    assert not any(e['admitted'] for e in events), events
    result = {'actualPickerCases': len(results), 'crossMidnightTwoDatesPreviewed': True,
              'futurePlanAdmittedSteps': 0, 'pass': True}
    (out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    print(json.dumps(result), flush=True)
finally:
    shell('input keyevent 3')
    time.sleep(1)
    instrument('set', stage + '-restore-health', {k: v for k, v in before.items() if k.startswith('ls_augment_health_')})
    assert saved('health_plan') == before['ls_augment_health_plan']
