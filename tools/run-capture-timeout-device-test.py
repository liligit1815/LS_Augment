"""Real native recorder start with its module Provider paused; verify bounded fallback and no late lease."""
import json
import re
import time
import cv2
import numpy as np
from PIL import Image
from adb_regression import *
from native_ui_helpers import tap_id,all_windows,nodes

folder=OUTPUT/'round15d-capture-timeout';folder.mkdir(exist_ok=True)
remote_folder='/sdcard/Pictures/Screenshots/'
before_anr=set(shell('ls /data/anr',root=True).splitlines())
before_files=set(shell('ls '+remote_folder).splitlines())
pid=None;paused=False
saved_master=instrument('snapshot','round15d-capture-timeout-baseline')['settings']['ls_augment_systemui_master']
(folder/'files-before.json').write_text(json.dumps(sorted(before_files)),encoding='utf-8')

def pixels(label):
    path=folder/(label+'.png');path.write_bytes(adb('exec-out','screencap -p'))
    a=np.array(Image.open(path).convert('RGB'))[:107].astype(int)
    return int(((a.max(2)-a.min(2))>30).sum())

try:
    instrument('set','round15d-capture-timeout-config',{'ls_augment_rm_record_hide_status_bar':'1','ls_augment_systemui_master':'0'})
    shell('am force-stop com.android.ztescreenshot')
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
    shell('am start -W --windowingMode 1 -n ls.augment.regression.window2/ls.augment.regression.ProbeActivity')
    shell('cmd statusbar expand-settings');tap('round15d-capture-timeout-tile','录屏');time.sleep(2)
    recorder_pid=shell('pidof com.android.ztescreenshot');assert re.fullmatch(r'\d+',recorder_pid)
    before_threads=shell('cat /proc/'+recorder_pid+'/task/*/comm',root=True)
    (folder/'recorder-threads-before-start.txt').write_text(before_threads,encoding='utf-8')
    assert 'LS-Capture-IPC' not in before_threads, 'Capture worker already ran before the intended timeout'
    pid=shell('pidof ls.augment.com');assert re.fullmatch(r'\d+',pid)
    shell('kill -STOP '+pid,root=True);paused=True
    started=time.monotonic()
    tap_id('round15d-capture-timeout-start','com.android.ztescreenshot:id/start_bn');time.sleep(2)
    waiting_pixels=pixels('while-provider-paused')
    recorder_pid=shell('pidof com.android.ztescreenshot');assert re.fullmatch(r'\d+',recorder_pid)
    threads=shell('cat /proc/'+recorder_pid+'/task/*/comm',root=True)
    (folder/'recorder-threads-while-paused.txt').write_text(threads,encoding='utf-8')
    assert 'LS-Capture-IPC' in threads, 'The lazy capture IPC worker did not run; the timeout path is not established'
    active=all_windows('round15d-capture-timeout-running')
    assert any(n.get('id')=='com.android.ztescreenshot:id/stop_bn' and n.get('visible') for n in nodes(active))
    shell('kill -CONT '+pid,root=True);paused=False
    time.sleep(3)
    restored_pixels=pixels('after-provider-resumed')
    tap_id('round15d-capture-timeout-stop','com.android.ztescreenshot:id/stop_bn')
    for _ in range(30):
        added=set(shell('ls '+remote_folder).splitlines())-before_files
        if added:break
        time.sleep(.5)
    assert len(added)==1,added
    remote=remote_folder+added.pop();(folder/'recording.remote.txt').write_text(remote,encoding='utf-8')
    for _ in range(30):
        raw=adb('exec-out','cat '+remote)
        if b'moov' in raw[-100000:]:break
        time.sleep(.5)
    (folder/'recording.mp4').write_bytes(raw)
    video=cv2.VideoCapture(str(folder/'recording.mp4'));counts=[]
    while True:
        ok,frame=video.read()
        if not ok:break
        band=frame[:round(frame.shape[0]*107/2688)].astype(int)
        counts.append(int(((band.max(2)-band.min(2))>30).sum()))
    video.release()
    assert counts and waiting_pixels>1000 and restored_pixels>1000 and min(counts)>1000, (waiting_pixels,restored_pixels,counts)
    result={'pass':True,'fallback':'native recording remains available without exclusion while service is unavailable',
            'captureIpcWorkerObservedWhilePaused':True,'whilePausedPixels':waiting_pixels,'afterResumePixels':restored_pixels,'decodedFrames':len(counts),
            'minimumBarPixels':min(counts),'newAnrFiles':sorted(set(shell('ls /data/anr',root=True).splitlines())-before_anr)}
    assert not result['newAnrFiles'],result
    (folder/'result.json').write_text(json.dumps(result,indent=2),encoding='utf-8')
    print(json.dumps(result),flush=True)
finally:
    if paused and pid:shell('kill -CONT '+pid,root=True)
    try:
        remaining=all_windows('round15d-capture-timeout-cleanup')
        if any(n.get('id')=='com.android.ztescreenshot:id/stop_bn' and n.get('visible') for n in nodes(remaining)):
            tap_id('round15d-capture-timeout-cleanup-stop','com.android.ztescreenshot:id/stop_bn')
    finally:shell('am force-stop com.android.ztescreenshot')
    instrument('set','round15d-capture-timeout-restored',{'ls_augment_rm_record_hide_status_bar':'0','ls_augment_rm_screenshot_hide_status_bar':'0','ls_augment_systemui_master':saved_master})

    (folder/'created-files.json').write_text(json.dumps(sorted(set(shell('ls '+remote_folder).splitlines())-before_files)),encoding='utf-8')
