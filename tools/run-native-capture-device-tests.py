"""Exercise native video recording, lifecycle and screenshot output through ADB UI."""
import argparse
import json
import time
import cv2
import numpy as np
from PIL import Image
from adb_regression import OUTPUT, adb, shell, instrument, tap
from native_ui_helpers import tap_id, all_windows, nodes

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('stage')
args = p.parse_args()
folder = OUTPUT / (args.stage + '-native-capture-results')
folder.mkdir(exist_ok=True)
results = []
remote_folder = '/sdcard/Pictures/Screenshots/'


def files():
    return set(shell('ls ' + remote_folder).splitlines())


def take_new(before, local):
    for _ in range(30):
        added = files() - before
        if added:
            break
        time.sleep(.5)
    assert len(added) == 1, added
    remote = remote_folder + added.pop()
    # Native save is asynchronous. A new directory entry can still contain an
    # unfinished MP4 without its moov atom, or an incomplete JPEG.
    for _ in range(30):
        raw = adb('exec-out', 'cat ' + remote)
        if local.endswith('.mp4'):
            offset = 0;complete = False
            while offset + 8 <= len(raw):
                size = int.from_bytes(raw[offset:offset + 4], 'big')
                if size == 1 and offset + 16 <= len(raw):
                    size = int.from_bytes(raw[offset + 8:offset + 16], 'big')
                if size < 8 or offset + size > len(raw):break
                if raw[offset + 4:offset + 8] == b'moov':complete = True
                offset += size
        else:
            complete = raw.endswith(b'\xff\xd9')
        if complete:break
        time.sleep(.5)
    assert complete, 'Native output did not finish: ' + remote
    (folder / local).write_bytes(raw)
    (folder / (local + '.remote.txt')).write_text(remote, encoding='utf-8')
    return folder / local


def count_bar(array):
    height = round(array.shape[0] * 107 / 2688)
    band = array[:height, :, :3].astype(int)
    return int(((band.max(axis=2) - band.min(axis=2)) > 30).sum())


def live_bar(name, hidden):
    raw = adb('exec-out', 'screencap -p')
    path = folder / (name + '.png');path.write_bytes(raw)
    count = count_bar(np.asarray(Image.open(path)))
    assert count < 30 if hidden else count > 1000, (name, count)
    return count


def save_result(result):
    results.append(result)
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result), flush=True)


def native_video(name, enabled, lifecycle=False):
    label = args.stage + '-' + name
    instrument('set', label + '-config', {'ls_augment_rm_record_hide_status_bar': str(int(enabled))})
    shell('cmd statusbar expand-settings');tap(label + '-tile', '录屏');time.sleep(2)
    before = files()
    tap_id(label + '-start', 'com.android.ztescreenshot:id/start_bn');time.sleep(3)
    during = live_bar(name + '-during', enabled)
    # Exclusion should leave the actual status-bar window and controls visible.
    windows = all_windows(label + '-running-windows')
    assert any(n.get('package') == 'com.android.systemui' and n.get('visible')
               and n.get('id', '').endswith('/status_bar') for n in nodes(windows)), 'Status bar view missing'
    pauses = {}
    if lifecycle:
        tap_id(label + '-pause', 'com.android.ztescreenshot:id/start_bn');time.sleep(.7)
        pauses['pausedPixels'] = live_bar(name + '-paused', False)
        tap_id(label + '-resume', 'com.android.ztescreenshot:id/start_bn');time.sleep(3)
        pauses['resumedPixels'] = live_bar(name + '-resumed', enabled)
    tap_id(label + '-stop', 'com.android.ztescreenshot:id/stop_bn')
    path = take_new(before, name + '.mp4')
    time.sleep(.6);after = live_bar(name + '-after', False)
    video = cv2.VideoCapture(str(path))
    duration = video.get(cv2.CAP_PROP_FRAME_COUNT) / video.get(cv2.CAP_PROP_FPS)
    # The native encoder omits unchanged frames. OpenCV time-based seeking is
    # unreliable on these variable-rate MP4s, so inspect every decoded frame.
    checks = [];last_frame = None
    while True:
        ok, frame = video.read()
        if not ok:break
        count = count_bar(frame)
        checks.append(count);last_frame = frame
        if len(checks) == 1:cv2.imwrite(str(folder / (name + '-first-frame.png')), frame)
    video.release()
    assert checks, 'No decoded video frames'
    cv2.imwrite(str(folder / (name + '-last-frame.png')), last_frame)
    assert max(checks) < 30 if enabled else sum(c > 1000 for c in checks) / len(checks) > .8, (name, min(checks), max(checks))
    save_result({'case': name, 'durationSeconds': duration, 'decodedFrames': len(checks),
                 'minimumBarPixels': min(checks), 'maximumBarPixels': max(checks),
                 'duringPixels': during, 'afterPixels': after, **pauses, 'status': 'pass'})


try:
    shell('am start -W --windowingMode 1 -n ls.augment.regression.window2/ls.augment.regression.ProbeActivity')
    for name, enabled in [('record-off', False), ('record-on', True), ('record-off-again', False)]:
        native_video(name, enabled)
    native_video('record-pause-resume', True, True)
    instrument('set', args.stage + '-record-off-before-stills', {'ls_augment_rm_record_hide_status_bar': '0'})
    for name, enabled in [('screenshot-off', False), ('screenshot-on', True), ('screenshot-off-again', False)]:
        instrument('set', args.stage + '-' + name + '-config', {'ls_augment_rm_screenshot_hide_status_bar': str(int(enabled))})
        before = files();shell('input keyevent KEYCODE_SYSRQ')
        path = take_new(before, name + '.jpg')
        count = count_bar(np.asarray(Image.open(path)))
        assert count < 30 if enabled else count > 1000, (name, count)
        save_result({'case': name, 'coloredStatusBarPixels': count, 'status': 'pass'})
finally:
    # A failed assertion must not leave a native recording running.
    try:
        remaining = all_windows(args.stage + '-cleanup-windows')
        if any(n.get('id') == 'com.android.ztescreenshot:id/stop_bn' and n.get('visible') for n in nodes(remaining)):
            tap_id(args.stage + '-cleanup-stop', 'com.android.ztescreenshot:id/stop_bn')
    finally:
        shell('am force-stop com.android.ztescreenshot')
    instrument('set', args.stage + '-capture-restored', {'ls_augment_rm_record_hide_status_bar': '0', 'ls_augment_rm_screenshot_hide_status_bar': '0'})
