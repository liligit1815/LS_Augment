"""Capture a synthetic FLAG_SECURE window as still image and actual phone video."""
import json
import time
import cv2
import numpy as np
from adb_regression import *
stage=sys.argv[1] if len(sys.argv)>1 else 'round7'
folder=OUTPUT/(stage+'-secure-capture-results');folder.mkdir(exist_ok=True);results=[]
def mean_center(frame):
    h,w=frame.shape[:2];return float(frame[int(h*.25):int(h*.75),int(w*.15):int(w*.85)].mean())
try:
    for label,enabled in [('off',False),('on',True),('off-again',False)]:
        instrument('set',stage+'-secure-'+label+'-setting',{'ls_augment_rm_secure_capture':'1' if enabled else '0'})
        time.sleep(2);shell('am force-stop ls.augment.validation')
        shell('am start -n ls.augment.validation/.SecureTestActivity');time.sleep(1)
        evidence=folder/label;evidence.mkdir(exist_ok=True)
        still=adb('exec-out','screencap -p');(evidence/'screenshot.png').write_bytes(still)
        stillFrame=cv2.imdecode(np.frombuffer(still,dtype=np.uint8),cv2.IMREAD_COLOR)
        assert stillFrame is not None
        remote='/data/local/tmp/lsa-regression-secure-'+label+'.mp4'
        shell('screenrecord --time-limit 2 --bit-rate 2000000 '+remote,timeout=15)
        adb('pull',remote,evidence/'recording.mp4')
        video=cv2.VideoCapture(str(evidence/'recording.mp4'));ok,frame=video.read();video.release();assert ok
        cv2.imwrite(str(evidence/'recording-frame.png'),frame)
        values={'screenshotCenterMean':round(mean_center(stillFrame),2),'videoCenterMean':round(mean_center(frame),2)}
        passed=all(v>220 for v in values.values()) if enabled else all(v<15 for v in values.values())
        record={'case':label,'enabled':enabled,**values,'status':'pass' if passed else 'fail'}
        results.append(record);(folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
        (evidence/'window-state.txt').write_text(shell('dumpsys window windows'),encoding='utf-8')
        print(json.dumps(record),flush=True);assert passed
finally:
    shell('am force-stop ls.augment.validation')
    instrument('set',stage+'-secure-final-off',{'ls_augment_rm_secure_capture':'0'})
