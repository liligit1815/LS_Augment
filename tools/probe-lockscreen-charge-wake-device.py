"""Observe first display at the maximum refresh interval on real USB charging."""
import sys,time,json
from adb_regression import OUTPUT,instrument,shell
from lockscreen_device_helpers import lock_wake,capture
P=sys.argv[1];folder=OUTPUT/P;folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_charge_')}
samples=[]
try:
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    instrument('set',P+'-config',dict(restore,ls_augment_rm_lock_charge_details='1',ls_augment_rm_lock_charge_interval='30'))
    time.sleep(.7);start=time.monotonic();lock_wake()
    for index,target in enumerate([0,10,32]):
        while time.monotonic()-start<target:
            shell('input tap 608 1800');time.sleep(min(3,max(.1,target-(time.monotonic()-start))))
        shell('input tap 608 1800');r=capture(P+'-'+str(index));texts=[n['text'] for n in r['visible'] if n.get('id')=='null' and 'mA' in n.get('text','')]
        samples.append({'elapsed':time.monotonic()-start,'details':texts,'awake':r['awake'],'locked':r['keyguard']})
        (folder/'samples.json').write_text(json.dumps(samples,ensure_ascii=False,indent=2),encoding='utf-8')
    print(samples,flush=True)
finally:
    instrument('set',P+'-restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
