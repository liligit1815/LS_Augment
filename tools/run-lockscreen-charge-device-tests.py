"""Check charging details using real USB charging and actual lockscreen views."""
import sys,json,time,re
from adb_regression import OUTPUT,shell,instrument
from lockscreen_device_helpers import capture,lock_wake
from statusbar_device_helpers import bounds,require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);results=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_charge_')}
units={'temperature':'°C','current':'mA','voltage':'V','power':'W'}
density=int(re.findall(r'density:\s*(\d+)',shell('wm density'))[-1])/160
def config(name,values):
    shell('input tap 608 1800');instrument('set',P+name+'-config',{'ls_augment_rm_lock_charge_'+k:str(v) for k,v in values.items()});time.sleep(.5)
def sample(name,wake=False):
    if wake:lock_wake()
    shell('input tap 608 1800');r=capture(P+name);assert r['awake'] and r['keyguard']
    found=[n for n in r['visible'] if n.get('id')=='null' and any(unit in n.get('text','') for unit in units.values())]
    assert len(found)<=1
    text=found[0]['text'] if found else '';b=bounds(found[0]) if found else None
    native=[n for n in r['visible'] if n.get('id')=='com.android.systemui:id/keyguard_indication_text_bottom']
    return {'text':text,'bounds':b,'height':b[3]-b[1] if b else 0,'native':bounds(native[0]) if native else None}
def check(name,yes,detail):
    results.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8');print(results[-1],flush=True);assert yes,results[-1]
try:
    require_systemui_build(folder.name);instrument('set',P+'baseline-config',restore);lock_wake();native=sample('native');check('off-no-details',not native['text'],native)
    config('on',{'details':1});on=sample('all');check('four-real-units',all(unit in on['text'] for unit in units.values()),on)
    for key,unit in units.items():
        values={'hide_'+k:int(k==key) for k in units};config('hide-'+key,values);r=sample('hide-'+key)
        check('hide-only-'+key,unit not in r['text'] and all(u in r['text'] for k,u in units.items() if k!=key),r)
    config('hide-all',{'hide_'+k:1 for k in units});r=sample('hide-all');check('all-hidden-removes-line',not r['text'],r)
    config('show-all',{'hide_'+k:0 for k in units});r=sample('show-all');check('show-all-restored',all(u in r['text'] for u in units.values()),r)
    config('size8',{'text_size':8});small=sample('size8');check('size8-smaller',small['height']<on['height']*.75,small)
    config('size32',{'text_size':32});large=sample('size32');check('size32-complete',large['height']>on['height']*1.5 and all(u in large['text'] for u in units.values()) and large['bounds'][3]<2600,large)
    config('gap0',{'text_size':14,'line_gap':0});gap0=sample('gap0',True)
    config('gap40',{'line_gap':40});gap40=sample('gap40',True)
    check('gap40-versus0',bool(gap0['native'] and gap40['native']) and abs(((gap40['bounds'][1]-gap40['native'][3])-(gap0['bounds'][1]-gap0['native'][3]))-round(40*density))<=2,{'zero':gap0,'forty':gap40,'density':density})
    config('off',{'details':0});off=sample('off');check('hot-off-removes-line',not off['text'],off)
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
