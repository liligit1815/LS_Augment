"""Open only the owned installer fixture through actual Files UI."""
import time
from adb_regression import shell, adb, OUTPUT
from game_device_helpers import touch, capture


def open_fixture(label, malformed=False):
    # OEM success flow can delete the source APK. Replenish only our owned fixture.
    source = OUTPUT/'notification-fixtures-18/window-18/window-18.apk'
    if malformed:
        source = OUTPUT/'LSA-installer-invalid-20260910.apk'
        source.write_bytes(b'Owned regression fixture: not an APK.\n')
    shell('mkdir -p /sdcard/Download/LSA-installer-regression-20260910')
    adb('push', source, '/sdcard/Download/LSA-installer-regression-20260910/LSA-installer-test-20260910.apk')
    shell('am start -W -f 0x10008000 -a android.intent.action.VIEW '
          '-d content://com.android.externalstorage.documents/document/primary%3ADownload%2FLSA-installer-regression-20260910 '
          '-t vnd.android.document/directory -p com.android.documentsui '
          '--grant-read-uri-permission', root=True)
    observed = capture(label + '-owned-folder')
    found = [n for n in observed if n.get('visible') and n.get('id') == 'android:id/title'
             and n.get('text') == 'LSA-installer-test-20260910.apk']
    assert len(found) == 1, 'Owned APK not uniquely present in Files'
    touch(label + '-apk', text='LSA-installer-test-20260910.apk')
    observed = capture(label + '-source')
    if any(n.get('text') == '允许安装' and n.get('visible') for n in observed):
        assert not any(n.get('checked') for n in observed
                       if n.get('id') == 'com.android.packageinstaller:id/alwaysTrust')
        touch(label + '-allow-once', identity='android:id/button1')
    final_ids = {'com.android.packageinstaller:id/ok_button',
                 'com.android.packageinstaller:id/install_confirm_question_update', 'android:id/message'}
    for attempt in range(8):
        observed = capture(label + '-settle' + str(attempt))
        if any(n.get('visible') and n.get('package') == 'com.android.packageinstaller'
               and n.get('id') in final_ids for n in observed):
            return capture(label)
        time.sleep(.5)
    raise AssertionError('Installer did not reach confirmation or a native error')
