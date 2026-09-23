"""Observe real lockscreen/AOD without waking or unlocking as a side effect."""
import json,time
from adb_regression import OUTPUT,adb,shell
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import bounds

def lock_wake():
    shell('input keyevent 223');time.sleep(1.2);shell('input keyevent 224');time.sleep(.8)

def capture(label):
    windows=all_windows(label);folder=OUTPUT/label
    (folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    display=shell('dumpsys window displays');power=shell('dumpsys power')
    (folder/'display.txt').write_text(display,encoding='utf-8');(folder/'power.txt').write_text(power,encoding='utf-8')
    visible=[{k:v for k,v in n.items() if k!='children'} for n in nodes(windows) if n.get('visible')]
    result={'at':shell('date -Iseconds'),'systemui':shell('pidof com.android.systemui'),'keyguard':'isKeyguardShowing=true' in display,'awake':'mWakefulness=Awake' in power,'visible':visible}
    (folder/'observed.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(label,{k:v for k,v in result.items() if k!='visible'},flush=True)
    print([{k:n.get(k) for k in ['id','text','bounds']} for n in visible if n.get('text') not in (None,'null','')],flush=True)
    return result

def clock_layout(label,style,text):
    """Use the real rendered TextView layout, including native ellipsis counts."""
    pid=shell('pidof com.android.systemui')
    raw=adb('logcat','-d','--pid='+pid,'-s','LSA.ClockFit:D','*:S').decode('utf-8','replace')
    (OUTPUT/label/'clock-layout-log.txt').write_text(raw,encoding='utf-8')
    records=[json.loads(line.split('LSA.ClockFit: ',1)[1]) for line in raw.splitlines() if 'LSA.ClockFit: {' in line]
    relevant=[r for r in records if r['style']==style and r['text'].count(':')==text.count(':')]
    assert relevant,('No current rendered clock layout',style,text)
    latest=relevant[-1]
    (OUTPUT/label/'clock-layout.json').write_text(json.dumps(latest,indent=2),encoding='utf-8')
    assert latest['ellipsis']==0 and latest['desiredWidth']<=latest['width']-latest['padding']+.01,latest
    return latest
