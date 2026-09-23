"""Verify actual charging text cadence and wake/unlock lifecycle after CHARGE-01."""
import sys,json,time,re,subprocess
from adb_regression import OUTPUT,instrument,shell
from lockscreen_device_helpers import lock_wake,capture
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_charge_')}

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail})
    (folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8')
    print(checks[-1],flush=True);assert yes,checks[-1]

def texts(r):return [n['text'] for n in r['visible'] if n.get('id')=='null' and 'mA' in n.get('text','')]

try:
    require_systemui_build(folder.name)
    for interval,duration in [(1,12000),(5,18000),(30,60000)]:
        shell('input keyevent 224');shell('wm dismiss-keyguard')
        instrument('set',P+str(interval)+'-config',dict(restore,ls_augment_rm_lock_charge_details='1',ls_augment_rm_lock_charge_interval=str(interval)))
        lock_wake();first=capture(P+str(interval)+'-first')
        check('first-visible-'+str(interval),first['awake'] and first['keyguard'] and bool(texts(first)),texts(first))
        label=P+'interval-'+str(interval)
        subprocess.run([sys.executable,'tools/observe-lockscreen-values.py',label,str(duration)],check=True)
        samples=json.loads((OUTPUT/label/'result-private.json').read_text(encoding='utf-8'))['batterySamples']
        check('stayed-locked-'+str(interval),all(s['interactive'] and s['locked'] and s['plugged']>0 and len(s['chargeTexts'])==1 for s in samples),len(samples))
        changes=[]
        for s in samples:
            text=s['chargeTexts'][0]
            if not changes or text!=changes[-1]['text']:changes.append({'uptimeMs':s['uptimeMs'],'text':text})
        for change in changes[1:]:
            numbers=list(map(float,re.findall(r'[\d.]+',change['text'])));assert len(numbers)==4
            temp,current,voltage,power=numbers
            nearby=[s for s in samples if abs(s['uptimeMs']-change['uptimeMs'])<=650]
            change['sourceMatched']=any(abs(temp-s['temperatureTenthsC']/10)<=.11 and abs(voltage-s['voltageMillivolts']/1000)<=.015 and abs(current-abs(s['currentMicroamps'])/1000)<=max(10,current*.05) for s in nearby)
            change['powerCorrect']=abs(power-current/1000*voltage)<=.03
        gaps=[b['uptimeMs']-a['uptimeMs'] for a,b in zip(changes[1:],changes[2:])]
        check('real-values-'+str(interval),len(changes)>1 and all(c['sourceMatched'] and c['powerCorrect'] for c in changes[1:]),changes)
        check('cadence-'+str(interval),bool(gaps) and all(abs(g-interval*1000*round(g/(interval*1000)))<650 and g>interval*1000-650 for g in gaps),{'gapsMs':gaps,'note':'Unchanged sensor text does not generate a visible text change; first retained value excluded.'})
    shell('wm dismiss-keyguard');time.sleep(.6);r=capture(P+'unlocked')
    check('unlock-removes-details',not r['keyguard'] and not texts(r),{'locked':r['keyguard'],'details':texts(r)})
    lock_wake();r=capture(P+'relock');check('relock-first-visible',bool(texts(r)),texts(r))
    shell('input keyevent 223');time.sleep(1);r=capture(P+'screen-off')
    check('screen-off-removes-details',not r['awake'] and not texts(r),{'awake':r['awake'],'details':texts(r)})
    shell('input keyevent 224');time.sleep(.8);r=capture(P+'second-wake');check('second-wake-first-visible',r['awake'] and bool(texts(r)),texts(r))
    instrument('set',P+'hot-off-config',restore);time.sleep(.6);r=capture(P+'hot-off');check('hot-off-removes-details',not texts(r),texts(r))
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
