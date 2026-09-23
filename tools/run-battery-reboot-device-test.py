"""Check colored outside digits and reserved width across a real phone reboot."""
import json
import time
import numpy as np
from PIL import Image
from statusbar_device_helpers import *

folder=OUTPUT/'round15p-battery-reboot';folder.mkdir(exist_ok=True)
results=[]

def restart_ui():
    shell('kill -9 '+shell('pidof com.android.systemui'),root=True);time.sleep(5)
    unlock()
    require_systemui_build(folder.name)

def unlock():
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
    shell('am start -n ls.augment.com/.SettingsActivity');time.sleep(1)

def capture(name,color,number_first=False):
    label='round15p-'+name;o=observe(label)
    a=np.array(Image.open(OUTPUT/label/'screen.png').convert('RGB'))[:156].astype(int)
    icon=by_id(o,'mfv_battery_meterview');number=by_id(o,'mfv_battery_level_outside')
    assert len(icon)==len(number)==1,(icon,number)
    ib,nb=bounds(icon[0]),bounds(number[0])
    assert (nb[0]<ib[0])==number_first,(ib,nb)
    if color=='magenta':mask=(a[:,:,0]-a[:,:,1]>30)&(a[:,:,2]-a[:,:,1]>30)
    else:mask=(a[:,:,1]-a[:,:,0]>35)&(a[:,:,2]-a[:,:,0]>35)
    left=min(ib[0],nb[0]);right=max(ib[0],nb[0]);boundary=(left+right)//2
    assert mask[:,:boundary].sum()>150 and mask[:,boundary:].sum()>150,'Both icon fill and outside digits must use the selected color'
    y,x=np.where(a.min(2)<170)
    r={'case':name,'icon':ib,'number':nb,'colorPixels':int(mask.sum()),'ink':[int(x.min()),int(y.min()),int(x.max()+1),int(y.max()+1)],'pass':True}
    results.append(r);(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(r,flush=True);return r

require_systemui_build(folder.name)
before_anr=set(shell('ls /data/anr',root=True).splitlines())
configure('round15p-setup',{'systemui_master':1,'statusbar_grid_v2':grid({'battery':{'zone':'RS','size':20}},only=['battery']),
    'statusbar_height_dp':48,'rm_battery_style':2,'rm_battery_width_dp':100,'rm_battery_alpha_percent':100,
    'rm_battery_colors':1,'rm_battery_charging_color':'#FFFF00FF','rm_battery_hide_percent':0})
restart_ui();before=capture('before-reboot','magenta')
adb('reboot');adb('wait-for-device',timeout=55)
deadline=time.monotonic()+55
while time.monotonic()<deadline:
    if shell('getprop sys.boot_completed')=='1':break
    time.sleep(2)
else:raise AssertionError('Phone boot did not finish')
unlock();require_systemui_build(folder.name)
after=capture('after-reboot','magenta')
# Native USB selection may dim the entire screen just after boot. The actual
# node positions and colored glyphs remain valid under that system scrim.
assert before['icon']==after['icon'] and before['number']==after['number'],(before,after)
configure('round15p-number-first',{'rm_battery_style':3,'rm_battery_charging_color':'#FF00FFFF'})
restart_ui();capture('number-first','cyan',True)
baseline=json.loads((OUTPUT/'round15-before-battery/result-private.json').read_text(encoding='utf-8'))['settings']
values={k:v for k,v in baseline.items() if k.startswith(('ls_augment_statusbar_','ls_augment_rm_battery_')) or k=='ls_augment_systemui_master'}
instrument('set','round15p-restore-config',values)
restart_ui();o=observe('round15p-native-restored')
assert o['window']=='[0,0][1216,107]',o['window']
after_anr=set(shell('ls /data/anr',root=True).splitlines())
(folder/'new-anr-files.json').write_text(json.dumps(sorted(after_anr-before_anr)),encoding='utf-8')
assert not after_anr-before_anr,after_anr-before_anr
print('Colored icon/digits, order, width, cold reboot and native restoration passed; no new ANR')
