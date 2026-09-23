"""Validate all battery styles after the advertised SystemUI scope restart."""
import json
import time
import numpy as np
from PIL import Image
from statusbar_device_helpers import *

folder=OUTPUT/'round15d-battery-style-results';folder.mkdir(exist_ok=True)
results=[]
configure('round15d-battery-base',{'systemui_master':1,'statusbar_grid_v2':grid({'battery':{'zone':'RS','size':20}},only=['battery']),
    'statusbar_height_dp':48,'rm_battery_style':0,'rm_battery_colors':0,'rm_battery_hide_percent':0,'rm_battery_alpha_percent':100,'rm_battery_width_dp':0})
for index,style in enumerate([0,1,2,3,4,5,6,0]):
    label=f'round15d-battery-style{style}-{index}'
    configure(label,{'rm_battery_style':style})
    shell('kill -9 '+shell('pidof com.android.systemui'),root=True);time.sleep(4)
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard');shell('am start -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    o=observe(label)
    a=np.array(Image.open(OUTPUT/label/'screen.png').convert('RGB'))[:156]
    pixels=int((a.min(axis=2)<170).sum())
    inside=by_id(o,'mfv_battery_level_inside');outside=by_id(o,'mfv_battery_level_outside');icon=by_id(o,'mfv_battery_meterview')
    if style in (0,1):good=bool(inside and icon and not outside)
    elif style==2:good=bool(outside and icon and not inside and bounds(icon[0])[0]<bounds(outside[0])[0])
    elif style==3:good=bool(outside and icon and not inside and bounds(outside[0])[0]<bounds(icon[0])[0])
    elif style==4:good=bool(icon and not inside and not outside)
    elif style==5:good=bool(outside and not icon and not inside)
    else:good=not inside and not outside and not icon and pixels==0
    item={'style':style,'pass':good,'pixels':pixels,'inside':inside,'outside':outside,'icon':icon,'evidence':label}
    results.append(item);(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(style,good,pixels,flush=True)
    assert good,item
before=set((OUTPUT/'round15-fix/anr-before20192.txt').read_text(encoding='utf-8').splitlines())
after=set(shell('ls /data/anr',root=True).splitlines())
(folder/'new-anr-files.json').write_text(json.dumps(sorted(after-before)),encoding='utf-8')
assert not after-before,after-before
print('Eight battery style / restoration cases passed; no new ANR after hot update and scope restarts')
