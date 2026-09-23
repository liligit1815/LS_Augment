"""Retained AOD font/seconds after a real boot and actual 12/24-hour changes."""
import sys,json,time,shlex
from adb_regression import OUTPUT,shell,adb,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,complete,RESTORE
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
old=shell('settings get system time_12_24');font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'
(folder/'original-time-format.txt').write_text(old,encoding='utf-8')
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def observe(name):
    r=sleep_sample(P+name);check(name+'-complete',bool(r['clocks']) and complete(r),r['clocks']);return r
try:
    select_native(6,P+'style');shell('settings put system time_12_24 24',root=True);shell('setprop log.tag.LSA.ClockFit D',root=True)
    config(P+'on',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font});before=observe('before-boot')
    boot=shell('cat /proc/sys/kernel/random/boot_id');(folder/'before-boot-id.txt').write_text(boot,encoding='utf-8')
    adb('reboot');print('Real phone reboot requested.',flush=True)
    for _ in range(100):
        time.sleep(1)
        try:
            if shell('getprop sys.boot_completed',timeout=5)=='1':break
        except Exception:pass
    else:raise RuntimeError('Boot did not complete')
    time.sleep(5);shell('setprop log.tag.LSA.ClockFit D',root=True);shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(P+'after-boot-loaded')
    new=shell('cat /proc/sys/kernel/random/boot_id');check('real-boot-id-changed',boot!=new,{'before':boot,'after':new})
    after=observe('after-boot');clock='screen_off_clock'
    check('boot-retains-seconds-period-font',after['clocks'][clock]['text'].count(':')==2 and ' ' in after['clocks'][clock]['text'] and before['firstDigit'][clock]==after['firstDigit'][clock],{'before':before['firstDigit'],'after':after['firstDigit']})
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('settings put system time_12_24 12',root=True)
    on12=observe('on12');expected=int(shell('date +%H'))%12 or 12
    check('12-hour-seconds-period',int(on12['clocks'][clock]['text'].split(':')[0])==expected and on12['clocks'][clock]['text'].count(':')==2 and 'h' in on12['clocks'][clock]['format'],on12['clocks'])
    config(P+'off12',{});off12=observe('off12');check('12-hour-native-restore',off12['clocks'][clock]['text'].count(':')==1 and ' ' not in off12['clocks'][clock]['text'] and off12['clocks'][clock]['size']==208,off12['clocks'])
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('settings put system time_12_24 24',root=True)
    config(P+'on24',{'seconds':1,'period':1});on24=observe('on24');check('back-to24-seconds',on24['clocks'][clock]['text'].count(':')==2 and ('k' in on24['clocks'][clock]['format'] or 'H' in on24['clocks'][clock]['format']),on24['clocks'])
    config(P+'off24',{});off24=observe('off24');check('24-hour-native-restore',off24['clocks'][clock]['text'].count(':')==1 and off24['clocks'][clock]['size']==208,off24['clocks'])
finally:
    instrument('set',P+'restore',RESTORE)
    shell('settings delete system time_12_24' if old=='null' else 'settings put system time_12_24 '+shlex.quote(old),root=True)
    restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
