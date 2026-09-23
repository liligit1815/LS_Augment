"""Turn both real health controls OFF before a future three-step plan is due."""
import json
import time
import uuid
from datetime import datetime, timedelta
from adb_regression import OUTPUT, instrument, shell
from health_device_helpers import open_module, diagnostics, plan_events
from launcher_icon_device_helpers import saved
from module_ui_helpers import hierarchy, tap

stage = 'round39zb'
out = OUTPUT / (stage + '-disabled-plan')
out.mkdir(exist_ok=True)
assert not (out / 'before-private.json').exists(), 'Preserve the existing real scheduled test'
before = instrument('snapshot', stage + '-before')['settings']
now = datetime.fromisoformat(shell('date -Iseconds'))
due = (now + timedelta(minutes=3)).replace(second=0, microsecond=0)
assert due.date() == now.date()
minute = due.hour * 60 + due.minute
plan_id = uuid.uuid4().hex
spec = '|'.join(['SP2', plan_id, saved('health_account'), 'Asia/Shanghai', str(due.date()),
                 str(minute), str(minute + 1), '1', '3', str(1 << due.weekday()), '19392026'])
meta = {'config': before, 'due': due.isoformat(), 'planId': plan_id, 'spec': spec}
(out / 'before-private.json').write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding='utf-8')
try:
    instrument('set', stage + '-future-plan', {
        'ls_augment_health_enabled': '1', 'ls_augment_health_multiply_enabled': '1',
        'ls_augment_health_multiplier': '100', 'ls_augment_health_plan_enabled': '1',
        'ls_augment_health_plan': spec,
    })
    time.sleep(.8)
    open_module(stage + '-module')
    tap(stage + '-plan-off', '随机增加步数')
    time.sleep(.8)
    tap(stage + '-multiply-off', '真实步数加倍')
    time.sleep(2.5)
    assert saved('health_enabled') == saved('health_plan_enabled') == saved('health_multiply_enabled') == '0'
    root = hierarchy(stage + '-both-off')
    assert any(n.get('text') == '后台执行已关闭' for n in root.iter('node'))
    assert datetime.fromisoformat(shell('date -Iseconds')) < due
except BaseException:
    instrument('set', stage + '-fail-safe-off', {
        'ls_augment_health_enabled': '0', 'ls_augment_health_plan_enabled': '0',
        'ls_augment_health_multiply_enabled': '0',
    })
    raise
print(json.dumps({'disabledBeforeDue': True, 'due': due.isoformat(), 'planId': plan_id}), flush=True)
observations = []
deadline = due.timestamp() + 105
started = time.monotonic()
while True:
    events = plan_events(stage + '-disabled-ledger-' + str(len(observations)), plan_id)
    phone_ms = int(shell('date +%s%3N'))
    row = {'phoneMs': phone_ms, 'secondsAfterDue': round(phone_ms / 1000 - due.timestamp(), 1),
           'events': events, 'admittedSteps': sum(e['steps'] for e in events if e['admitted']),
           'healthEnabled': saved('health_enabled')}
    assert row['admittedSteps'] == 0 and row['healthEnabled'] == '0', row
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
    if len(observations) % 3 == 1 or phone_ms / 1000 >= deadline:
        print(json.dumps(row), flush=True)
    if phone_ms / 1000 >= deadline:
        break
    assert time.monotonic() - started < 420
    time.sleep(20)
d = diagnostics(stage + '-disabled-plan')
result = {'planId': plan_id, 'due': due.isoformat(), 'admittedSteps': 0,
          'observedThroughSecondsAfterDue': observations[-1]['secondsAfterDue'],
          'backgroundStatus': d.get('ls_augment_health_background_runtime'),
          'realSwitchesOff': True, 'pass': True}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
