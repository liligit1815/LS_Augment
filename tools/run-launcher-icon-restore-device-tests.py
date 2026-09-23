"""Real draft cancellation, pending-retry cancellation, and native icon/name restoration."""
import hashlib
import json
import re
import shlex
import time
import xml.etree.ElementTree as ET
from PIL import Image
from adb_regression import OUTPUT, adb, shell, tap
from launcher_icon_device_helpers import desktop, saved, open_editor, choose_fixture, edit_name
from launcher_icon_evidence import compare_images

out = OUTPUT / 'round33s-restore-results'
out.mkdir(exist_ok=True)
refs = {'LSA_MAIN_33': OUTPUT / 'round33f-results/large-cropped.png',
        'LSA_CLONE_33': OUTPUT / 'round33b-results/clone-cropped.png'}
icon_hash = '7012e74dd4ce6af088fd8cd9a1b953b14d920d0923668853a0c7bb18853d3fec'
remote = '/data/user/0/ls.augment.com/files/launcher-icons/' + icon_hash + '.png'
held = remote + '.lsa-cancel-held'
report = {'stage': 'starting', 'cases': []}
moved = False


def save():
    (out / 'results.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')


def record(case, **values):
    value = {'case': case, **values}
    report['cases'].append(value)
    save()
    print(json.dumps(value, ensure_ascii=False), flush=True)


def custom(label):
    folder, _ = desktop(label, list(refs))
    result = compare_images(folder, refs)
    return folder, result


def confirm(label, expected):
    tap(label, '确认修改')
    for _ in range(15):
        if saved() == expected:
            return
        time.sleep(.3)
    raise AssertionError('The actual confirmation did not save the expected entries')


try:
    before = saved()
    report['beforeConfig'] = before
    entries = before.split(';')[1:]
    assert len(entries) == 2 and all('ls.augment.regression.launcher|' in entry for entry in entries)
    main = next(entry for entry in entries if entry.startswith('0:'))
    open_editor('round33s-draft')
    choose_fixture('round33s-draft-clone', 'Mix11')
    tap('round33s-draft-reset-image', '恢复原图标')
    assert saved() == before
    shell('input keyevent 4')
    folder, check = custom('round33s-draft-cancelled')
    assert check['pass'] and saved() == before
    record('unconfirmed-image-reset-cancelled', passed=True, evidence=folder.name)

    assert shell('test ! -e ' + held + ' && echo clean', root=True) == 'clean'
    original = adb('exec-out', 'su -c ' + shlex.quote('cat ' + remote))
    assert hashlib.sha256(original).hexdigest() == icon_hash
    (out / 'owned-clone-original.png').write_bytes(original)
    shell('mv ' + remote + ' ' + held, root=True)
    moved = True
    report['stage'] = 'cancel-testing-owned-image-temporarily-held'
    save()
    shell('am force-stop com.zte.mifavor.launcher')
    shell('input keyevent 3')
    folder, check = custom('round33s-pending-image')
    assert {c['label']: c['pass'] for c in check['checks']} == {'LSA_MAIN_33': True, 'LSA_CLONE_33': False}
    record('pending-retry-established', passed=True, evidence=folder.name)
    open_editor('round33s-cancel-retry')
    choose_fixture('round33s-remove-clone', 'Mix11')
    tap('round33s-clone-reset-image', '恢复原图标')
    edit_name('round33s-clone-reset-name', '')
    expected = 'LI1;' + main
    confirm('round33s-clone-confirm', expected)
    shell('mv ' + held + ' ' + remote, root=True)
    moved = False
    assert shell('sha256sum ' + remote, root=True).split()[0] == icon_hash
    report['stage'] = 'waiting-past-cancelled-retry'
    save()
    time.sleep(35)
    assert saved() == expected
    folder, icons = desktop('round33s-clone-native-after-wait', ['LSA_MAIN_33', 'LS Icon Test'])
    native_clone = out / 'native-clone-reference.png'
    Image.open(OUTPUT / 'round33p-retry-missing-3/screen.png').crop((84, 1853, 279, 2048)).save(native_clone)
    check = compare_images(folder, {'LSA_MAIN_33': refs['LSA_MAIN_33'], 'LS Icon Test': native_clone})
    assert check['pass'], 'Native clone image or unaffected main image mismatch'
    record('cleared-clone-not-resurrected-after-file-recovery', passed=True, evidence=folder.name,
           waitedPastMaximumRetrySeconds=35, expectedConfig=expected)

    open_editor('round33s-main-restore')
    choose_fixture('round33s-remove-main', '机主')
    tap('round33s-main-reset-image', '恢复原图标')
    edit_name('round33s-main-reset-name', '')
    confirm('round33s-main-confirm', 'LI1')
    folder, icons = desktop('round33s-both-native', ['LS Icon Test'])
    assert len(icons) == 2
    record('both-native-names-and-images', evidence=folder.name, labels=icons, pendingVisualReview=True)
    shell('am force-stop com.zte.mifavor.launcher')
    shell('input keyevent 3')
    folder, icons = desktop('round33s-native-restart', ['LS Icon Test'])
    assert len(icons) == 2 and saved() == 'LI1'
    (folder / 'diagnostics.xml').write_text(shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True), encoding='utf-8')
    record('native-restoration-survives-launcher-restart', evidence=folder.name, labels=icons, pendingVisualReview=True)
    report['afterConfig'] = saved()
    report['stage'] = 'captured-pending-native-pixel-and-visual-review'
    save()
except Exception as error:
    report['error'] = type(error).__name__ + ': ' + str(error)
    save()
    raise
finally:
    if moved:
        shell('mv ' + held + ' ' + remote, root=True)
        report['ownedFileRestoredAfterFailure'] = True
        save()
