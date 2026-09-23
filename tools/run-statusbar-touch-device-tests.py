"""Send real ADB touch gestures and observe power state and status-bar pixels."""
import sys,json,time
import numpy as np
from PIL import Image
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import require_systemui_build
from quicksettings_device_helpers import restart_ui
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings'];keys=['ls_augment_systemui_master','ls_augment_rm_statusbar_hide','ls_augment_rm_statusbar_double_tap_sleep'];restore={k:base[k] for k in keys}

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def show():
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.5)
    shell('am start -W -n ls.augment.validation/.SystemUiTestActivity');time.sleep(.7)

def record(name):
    label=P+name;w=all_windows(label);png=adb('exec-out','screencap -p');(OUTPUT/label/'screen.png').write_bytes(png)
    power=shell('dumpsys power');(OUTPUT/label/'power.txt').write_text(power,encoding='utf-8')
    a=np.asarray(Image.open(OUTPUT/label/'screen.png').convert('RGB'))[:107]
    return {'awake':'mWakefulness=Awake' in power,'barSpread':float(a.std()),'nodes':[{'id':n['id'],'bounds':n['bounds']} for n in nodes(w) if n.get('visible') and n.get('id') in ['com.android.systemui:id/status_bar','com.android.systemui:id/clock','com.android.systemui:id/wifi_signal']]}

def touches(name,command,asleep=False):
    show();shell(command);time.sleep(.8);r=record(name);check(name,r['awake']!=asleep,r)

try:
    require_systemui_build(P+'loaded');instrument('set',P+'native-config',{k:'0' for k in keys});show();native=record('native')
    check('native-icons-visible',any(n['id'].endswith('/wifi_signal') for n in native['nodes']),native)
    touches('off-double-tap','input tap 600 50; input tap 600 50')
    instrument('set',P+'enabled-config',{'ls_augment_rm_statusbar_double_tap_sleep':'1'})
    touches('single-tap-stays-awake','input tap 600 50')
    touches('near-double-tap-sleeps','input tap 600 50; input tap 600 50',True)
    touches('distant-taps-stay-awake','input tap 400 50; input tap 800 50')
    touches('long-press-then-tap-stays-awake','input swipe 600 50 600 50 650; input tap 600 50')
    touches('drag-stays-awake','input swipe 170 40 170 1200 600')
    restart_ui(P+'restart-loaded');touches('restart-double-tap-sleeps','input tap 600 50; input tap 600 50',True)
    instrument('set',P+'off-config',{'ls_augment_rm_statusbar_double_tap_sleep':'0'});touches('off-restores-double-tap','input tap 600 50; input tap 600 50')
    show();before=record('hide-before');instrument('set',P+'hide-config',{'ls_augment_rm_statusbar_hide':'1'});time.sleep(.7);hidden=record('hidden')
    check('statusbar-hidden-in-actual-frame',hidden['barSpread']<before['barSpread']*.2,{'before':before,'hidden':hidden})
    instrument('set',P+'show-config',{'ls_augment_rm_statusbar_hide':'0'});time.sleep(.7);restored=record('shown-again')
    check('statusbar-content-restored',restored['barSpread']>before['barSpread']*.8,{'before':before,'after':restored})
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse')
