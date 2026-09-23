"""Count real clock-image changes in ADB recordings; never substitutes saved settings for effect."""
import json
import cv2
import numpy as np
from statusbar_device_helpers import *

folder=OUTPUT/'round14-clock-refresh-results';folder.mkdir(exist_ok=True)
results=[]
configure('round14-refresh-base',{'systemui_master':1,'statusbar_grid_v2':grid({'clock':{'zone':'CS','size':24}},only=['clock']),
    'statusbar_height_dp':80,'statusbar_clock_custom':1,'statusbar_clock_rows':1,
    'statusbar_clock_pattern':'ss.SSS','statusbar_clock_pattern_second':'','statusbar_clock_size_sp':0,
    'statusbar_clock_font_family':'monospace','statusbar_clock_weight':400,'statusbar_clock_letter_spacing':0,
    'statusbar_clock_line_spacing_dp':0,'statusbar_clock_width_dp':0})
for name,enabled,interval in [('seconds',0,100),('100ms',1,100),('250ms',1,250),('seconds-restored',0,250)]:
    label='round14-refresh-'+name
    configure(label,{'rm_clock_milliseconds_refresh':enabled,'rm_clock_refresh_ms':interval})
    observe(label+'-before')
    remote='/data/local/tmp/lsa-regression-refresh-'+name+'.mp4'
    shell('screenrecord --time-limit 5 --size 608x1344 '+remote,timeout=20)
    (folder/(name+'.mp4')).write_bytes(adb('exec-out','cat '+remote))
    (folder/(name+'-remote.txt')).write_text(remote,encoding='utf-8')
    video=cv2.VideoCapture(str(folder/(name+'.mp4')))
    count=0;changes=[];previous=None
    while True:
        ok,frame=video.read()
        if not ok:break
        count+=1
        roi=frame[:130,140:470]
        mask=roi.max(axis=2)<180
        difference=int(np.count_nonzero(mask!=previous)) if previous is not None else 100000
        if difference>20:
            changes.append({'frame':count,'timeMs':video.get(cv2.CAP_PROP_POS_MSEC),'changedPixels':difference})
            previous=mask
    video.release()
    item={'case':name,'frames':count,'distinctClockStates':len(changes),'changes':changes,'result':'observed'}
    results.append(item)
    (folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
    print(name,count,len(changes),flush=True)
assert all(r['frames']>0 for r in results)
slow,fast,medium,restored=[r['distinctClockStates'] for r in results]
assert 3<=slow<=9 and fast>=30 and 12<=medium<fast*0.75 and 3<=restored<=9,results
for r in results:r['result']='pass'
(folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
print('All four actual-refresh cases passed')
