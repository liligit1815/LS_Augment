"""Exercise the real health number/week controls on an inert future-day plan."""
import json
import argparse
import re
import shlex
import time
from datetime import datetime
from adb_regression import OUTPUT, instrument, shell
from health_device_helpers import open_module, plan_events
from launcher_icon_device_helpers import saved
from module_ui_helpers import hierarchy, visible, tap_node, scroll

stage = 'round39zi'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--weekdays-only', action='store_true')
args = parser.parse_args()
out = OUTPUT / (stage + '-ui-boundaries')
before = json.loads((out / 'before-private.json').read_text(encoding='utf-8'))
guard = json.loads((out / 'guard.json').read_text(encoding='utf-8'))
observations = []
if args.weekdays_only:
    observations = json.loads((out / 'observations.json').read_text(encoding='utf-8'))


def protected():
    p = saved('health_plan').split('|')
    assert p[1] == guard['planId'] and p[4] == guard['startDate']
    assert p[4] > str(datetime.fromisoformat(shell('date -Iseconds')).date())
    return p


def field(label, index, value):
    protected()
    for attempt in range(8):
        root = hierarchy(label + '-field' + str(attempt))
        fields = [n for n in root.iter('node') if n.get('class') == 'android.widget.EditText']
        assert len(fields) == 2
        chosen = fields[index]
        bounds = list(map(int, re.findall(r'-?\d+', chosen.get('bounds'))))
        if visible(chosen) and 320 < bounds[1] < bounds[3] < 2520:
            break
        scroll(root, up=bounds[1] < 320, short=True)
    else:
        raise AssertionError('No usable number input')
    tap_node(label + '-focus', chosen)
    shell('input keyevent 123')
    old = chosen.get('text', '')
    if old:
        shell('input keyevent ' + ' '.join(['67'] * len(old)))
    if value:
        shell('input text ' + shlex.quote(value))
    shell('input keyevent 4')
    time.sleep(1)


def check(label, expected_exec, expected_steps, invalid=False, mask=127):
    p = protected()
    assert [int(p[i]) for i in (7, 8, 9)] == [expected_exec, expected_steps, mask], p[5:10]
    for attempt in range(8):
        root = hierarchy(label + '-preview' + str(attempt))
        previews = [n for n in root.iter('node') if visible(n) and
                    (n.get('text', '').startswith('每日合计：') or n.get('text', '').startswith('请设置有效次数'))]
        if previews:
            break
        scroll(root, short=True)
    assert len(previews) == 1
    text = previews[0].get('text')
    if invalid:
        assert text.startswith('请设置有效次数')
    else:
        assert text.startswith(f'每日合计：{expected_exec * expected_steps} 步')
        assert guard['startDate'] in text
    row = {'case': label, 'savedExecutions': expected_exec, 'savedStepsEach': expected_steps,
           'savedWeekdays': mask, 'invalidDraftRejected': invalid, 'preview': text, 'pass': True}
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in row.items() if k != 'preview'}, ensure_ascii=False), flush=True)


try:
    if args.weekdays_only:
        plan = before['ls_augment_health_plan'].split('|')
        spec = '|'.join(['SP2', guard['planId'], plan[2], 'Asia/Shanghai', guard['startDate'],
                         '540', '1080', '10', '1', '127', '19392026'])
        instrument('set', stage + '-weekday-future-guard', {
            'ls_augment_health_enabled': '1', 'ls_augment_health_plan_enabled': '1',
            'ls_augment_health_multiply_enabled': '0', 'ls_augment_health_plan': spec})
        open_module(stage + '-weekdays-open')
        check(stage + '-weekday-start', 10, 1)
    number_cases = [
        ('zero-executions', 0, '0', 10, 200, True),
        ('empty-executions', 0, '', 10, 200, True),
        ('over-executions', 0, '101', 10, 200, True),
        ('maximum-executions', 0, '100', 100, 200, False),
        ('maximum-daily-total', 1, '10000', 100, 10000, False),
        ('over-daily-total', 1, '10001', 100, 10000, True),
        ('zero-steps', 1, '0', 100, 10000, True),
        ('minimum-step', 1, '1', 100, 1, False),
        ('valid-ten-executions', 0, '10', 10, 1, False),
    ]
    for name, index, value, expected_exec, expected_steps, invalid in ([] if args.weekdays_only else number_cases):
        field(stage + '-' + name, index, value)
        check(stage + '-' + name, expected_exec, expected_steps, invalid)
    for index, day in enumerate(['周一', '周二', '周三', '周四', '周五', '周六', '周日']):
        root = hierarchy(stage + '-weekday-' + str(index))
        box = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.CheckBox' and n.get('text') == day]
        assert len(box) == 1 and box[0].get('checked') == 'true'
        tap_node(stage + '-uncheck-' + str(index), box[0])
        time.sleep(.9)
    check(stage + '-no-weekday', 10, 1, invalid=True, mask=64)
    root = hierarchy(stage + '-thursday-before')
    box = next(n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.CheckBox' and n.get('text') == '周四')
    tap_node(stage + '-select-thursday', box)
    time.sleep(1)
    check(stage + '-thursday-only', 10, 1, mask=8)
    events = plan_events(stage + '-future-ledger', guard['planId'])
    assert not any(e['admitted'] for e in events), events
    result = {'realInputCases': len(observations), 'futurePlanAdmittedSteps': 0,
              'maxDailyTotalAccepted': 1000000, 'pass': True}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result), flush=True)
finally:
    # Close the editor before restoring its owned keys so onPause cannot save
    # the temporary future draft over the completed, original test plan.
    shell('input keyevent 3')
    time.sleep(1)
    restore = {k: v for k, v in before.items() if k.startswith('ls_augment_health_')}
    instrument('set', stage + '-restore-health', restore)
    assert saved('health_plan') == before['ls_augment_health_plan']
