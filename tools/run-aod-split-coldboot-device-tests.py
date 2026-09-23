"""Reboot the real phone with the formerly clipped split clock at its maximum."""
import sys,json,time
from adb_regression import OUTPUT,adb,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,complete,RESTORE
from statusbar_device_helpers import require_systemui_build
from native_ui_helpers import all_windows,nodes
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings'];extra={k:base[k] for k in ['ls_augment_rm_hide_wifi_scope','ls_augment_systemui_master']}

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def take(name,settings=None):
    if settings is not None:config(P+name,settings)
    r=sleep_sample(P+name);check(name+'-complete',bool(r['clocks']) and complete(r),r['clocks']);return r

def wifi(name,expected):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.7)
    w=all_windows(P+name);(OUTPUT/(P+name)/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    count=sum(n.get('visible') and n.get('id')=='com.android.systemui:id/wifi_signal' for n in nodes(w))
    check(name,count==expected,{'visibleWifi':count,'expected':expected})

try:
    select_native(15,P+'style');shell('setprop log.tag.LSA.ClockFit D',root=True);native=take('native',{})
    before=take('before-boot',{'clock_scale':2});instrument('set',P+'wifi-config',{'ls_augment_rm_hide_wifi_scope':'1','ls_augment_systemui_master':'0'});wifi('wifi-before-boot',0)
    boot=shell('cat /proc/sys/kernel/random/boot_id');adb('reboot');print('Real phone reboot requested.',flush=True)
    for _ in range(100):
        time.sleep(1)
        try:
            if shell('getprop sys.boot_completed',timeout=5)=='1':break
        except Exception:pass
    else:raise RuntimeError('Phone boot did not complete')
    time.sleep(5);shell('setprop log.tag.LSA.ClockFit D',root=True);shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(P+'loaded')
    new=shell('cat /proc/sys/kernel/random/boot_id');check('true-cold-boot',new!=boot,{'before':boot,'after':new})
    after=take('after-boot');check('boot-preserves-complete-max-size',before['firstDigit']['clock_hour_view']==after['firstDigit']['clock_hour_view'] and all(abs(v['size']-after['clocks'][k]['size'])<.01 for k,v in before['clocks'].items()),{'before':before['firstDigit'],'after':after['firstDigit']})
    wifi('wifi-after-boot',0);off=take('off',{});check('native-off-restored',all(v['size']==off['clocks'][k]['size'] and v['format']==off['clocks'][k]['format'] for k,v in native['clocks'].items()),off['clocks'])
    instrument('set',P+'wifi-off',{'ls_augment_rm_hide_wifi_scope':'0'});wifi('wifi-restored',1)
finally:
    instrument('set',P+'restore',dict(RESTORE,**extra));restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
