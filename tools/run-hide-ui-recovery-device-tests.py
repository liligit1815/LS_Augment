"""Use actual app controls to recover selected, hidden fixtures across both spaces."""
import json
import sys
import time
from adb_regression import OUTPUT, shell, snapshot, tap
from module_ui_helpers import hierarchy, find, visible, tap_node, scroll, matches
from launcher_icon_device_helpers import saved

stage = sys.argv[1]
out = OUTPUT / (stage + '-recovery-results')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists(), 'Preserve prior results'
records = []


def states():
    raw = shell('dumpsys package ls.augment.regression.launcher', root=True)
    result = {}
    for u in [0, 999]:
        line = next(s.strip() for s in raw.splitlines() if s.strip().startswith(f'User {u}:'))
        assert 'installed=true' in line
        result[str(u)] = 'hidden=true' in line
    return result


def until(predicate, timeout=18):
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        if predicate():
            return
        time.sleep(.4)
    raise AssertionError('Expected saved/native state did not arrive')


def record(case, success, **details):
    row = {'case': case, 'pass': success, 'states': states(),
           'targets': saved('hide_targets_v2'), **details}
    records.append(row)
    (out / 'results.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(row, ensure_ascii=False), flush=True)
    assert success, row


def space(user):
    title = '机主\n空间 0' if user == 0 else 'Mix11\n空间 999'
    find(stage + '-space' + str(user), title, up=True)
    tap(stage + '-space' + str(user) + '-select', title)
    for i in range(12):
        root = hierarchy(stage + f'-space{user}-load{i}')
        if any(n.get('text', '').startswith(f'空间 {user} · 可选') for n in root.iter('node')):
            buttons = [n for n in root.iter('node') if visible(n)
                       and n.get('class') == 'android.widget.Button'
                       and n.get('text', '').startswith('管理应用（')]
            if buttons:
                assert len(buttons) == 1
                tap_node(stage + f'-space{user}-expand', buttons[0])
                _, fields = find(stage + f'-space{user}-search', '搜索应用名称或包名')
                tap_node(stage + f'-space{user}-search-field', fields[0])
                shell('input text LS%sIcon')
                shell('input keyevent 4')
            return hierarchy(stage + f'-space{user}-filtered')
        time.sleep(.4)
    raise AssertionError('Selected space did not finish loading')


assert states() == {'0': True, '999': True}
space(0)
root, _ = find(stage + '-main-name', 'LS Icon Test')
scroll(root, short=True)
folder = snapshot(stage + '-main-hidden-metadata', verbose=False)
record('Hidden-main-name-search', 'LS Icon Test' in (folder / 'window.xml').read_text(encoding='utf-8'))
space(999)
root, _ = find(stage + '-clone-name', 'LS Icon Test')
scroll(root, short=True)
folder = snapshot(stage + '-clone-hidden-metadata', verbose=False)
record('Hidden-clone-name-search', 'LS Icon Test' in (folder / 'window.xml').read_text(encoding='utf-8'))
root = hierarchy(stage + '-clone-unselect-before')
checks = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.CheckBox']
assert len(checks) == 1 and checks[0].get('checked') == 'true'
tap_node(stage + '-clone-unselect', checks[0])
until(lambda: saved('hide_targets_v2') == '0:ls.augment.regression.launcher'
      and states() == {'0': True, '999': False})
record('Removing-hidden-clone-restores-only-clone', True, evidence=snapshot(stage + '-clone-removed', verbose=False).name)

space(0)
find(stage + '-main-show-find', '显示')
tap(stage + '-main-show', '显示')
until(lambda: states() == {'0': False, '999': False})
record('Single-show-after-space-switch', True)
find(stage + '-main-hide-find', '隐藏')
tap(stage + '-main-hide', '隐藏')
until(lambda: states() == {'0': True, '999': False})
record('Single-hide-does-not-change-removed-clone', True)

find(stage + '-master-find', '启用隐藏管理', up=True)
tap(stage + '-master-off', '启用隐藏管理')
until(lambda: saved('hide_master') == '0')
root, _ = find(stage + '-recovery-find', '紧急恢复')
folder = snapshot(stage + '-master-off-recovery', verbose=False)
record('Recovery-visible-with-master-off', states() == {'0': True, '999': False}, evidence=folder.name)
tap(stage + '-recovery-cancel-open', '紧急恢复')
tap(stage + '-recovery-cancel', '取消')
record('Recovery-cancel-retains-hidden-state', states() == {'0': True, '999': False})
tap(stage + '-recovery-confirm-open', '紧急恢复')
tap(stage + '-recovery-confirm', '继续')
until(lambda: states() == {'0': False, '999': False})
record('Recovery-confirm-works-with-master-off', saved('hide_master') == '0',
       evidence=snapshot(stage + '-recovered', verbose=False).name)
tap(stage + '-recovery-repeat-open', '紧急恢复')
tap(stage + '-recovery-repeat', '继续')
time.sleep(3)
record('Repeated-recovery-keeps-visible-target', states() == {'0': False, '999': False}
       and saved('hide_targets_v2') == '0:ls.augment.regression.launcher')
