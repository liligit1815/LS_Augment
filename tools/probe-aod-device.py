"""Observe the physical phone's native always-on display; no simulated doze."""
import sys,json,time
from adb_regression import OUTPUT,instrument,shell
from lockscreen_device_helpers import capture
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_aod_')}
samples=[]
def sample(name,values):
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    instrument('set',P+name+'-config',dict(restore,**{'ls_augment_rm_aod_'+k:str(v) for k,v in values.items()}))
    shell('input keyevent 223');time.sleep(4);r=capture(P+name)
    samples.append({'case':name,'awake':r['awake'],'visibleText':[{'id':n['id'],'text':n['text'],'bounds':n['bounds']} for n in r['visible'] if n.get('text') not in ('null','',None)]})
    (folder/'samples.json').write_text(json.dumps(samples,ensure_ascii=False,indent=2),encoding='utf-8')
try:
    require_systemui_build(folder.name)
    sample('native',{})
    sample('seconds-period',{'seconds':1,'period':1})
    time.sleep(2);capture(P+'seconds-tick')
    sample('small-serif',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':'/system/fonts/NotoSerif-Regular.ttf'})
    sample('off',{})
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
