"""Actual timeout settings bounds and cold boot of native icon override and timer."""
import sys,re
from module_ui_helpers import *
from adb_regression import adb,instrument
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import require_systemui_build
from quicksettings_device_helpers import restart_ui
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings']
names=['lock_timeout_enabled','lock_timeout_seconds','charging_animation','ignore_system_icon_hide','hidden_icon_slots','hide_wifi_scope']
restore={'ls_augment_rm_'+k:base['ls_augment_rm_'+k] for k in names};native=shell('settings get secure status_bar_keys_close');unlockedTimeout=shell('settings get system screen_off_timeout')
(out/'native-original.json').write_text(json.dumps({'status_bar_keys_close':native,'screen_off_timeout':unlockedTimeout}),encoding='utf-8')
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(out/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def entry(value,label):
    row_button(P+label,'锁屏息屏时间（秒）');replace_dialog_value(P+label,str(value));tap(P+label+'-save','保存');time.sleep(.6)
    check(label,setting('rm_lock_timeout_seconds')==str(value),'Actual settings dialog')
def icons(label,expected):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    w=all_windows(P+label);folder=OUTPUT/(P+label);(folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    n=[v for v in nodes(w) if v.get('visible') and v.get('package')=='com.android.systemui']
    bt=[v for v in n if v.get('description','').startswith('蓝牙') and v.get('class')=='android.widget.ImageView'];wifi=[v for v in n if v.get('id')=='com.android.systemui:id/wifi_signal']
    check(label,len(bt)==expected and len(wifi)==expected,{'bluetooth':len(bt),'wifi':len(wifi),'expected':expected})
def locked(label):
    shell('input keyevent 223');time.sleep(1.2);shell('input keyevent 224');start=time.monotonic();records=[];folder=OUTPUT/(P+label);folder.mkdir(exist_ok=True)
    for delay in [.5,3,11,16]:
        while time.monotonic()-start<delay:time.sleep(min(.5,max(0,delay-(time.monotonic()-start))))
        power=shell('dumpsys power');display=shell('dumpsys window displays');timeout=int(re.search(r'Screen off timeout: (\d+) ms',power)[1])
        records.append({'atSeconds':time.monotonic()-start,'awake':'mWakefulness=Awake' in power,'keyguard':'isKeyguardShowing=true' in display,'computedTimeoutMs':timeout})
        (folder/('power-'+str(delay)+'.txt')).write_text(power,encoding='utf-8')
    (folder/'samples.json').write_text(json.dumps(records,indent=2),encoding='utf-8');(folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    check(label,all(r['awake'] and r['keyguard'] and r['computedTimeoutMs']==86400000 for r in records),{'samples':records,'limit':'Actual Android timeout plan and16-second observation; not a24-hour continuous wait.'})
try:
    require_systemui_build(P+'loaded');open_system_group(P+'open','系统行为')
    root,found=find(P+'enable','自定义锁屏息屏时间')
    if found[0].get('checked')!='true':tap_node(P+'enable-tap',found[0]);time.sleep(.5)
    check('enable-switch',setting('rm_lock_timeout_enabled')=='1','Actual module switch')
    entry(86400,'maximum-ui')
    for value in [0,86401]:
        label='invalid-'+str(value);row_button(P+label,'锁屏息屏时间（秒）');replace_dialog_value(P+label,str(value));tap(P+label+'-save','保存');root=hierarchy(P+label+'-rejected')
        check(label,setting('rm_lock_timeout_seconds')=='86400' and any(n.get('text','').startswith('请输入有效值') for n in root.iter('node')),'Out-of-range rejected; previous86400 retained');tap(P+label+'-cancel','取消')
    entry(1,'minimum-ui');entry(86400,'maximum-restored-ui')
    instrument('set',P+'combined-config',{'ls_augment_rm_charging_animation':'0','ls_augment_rm_ignore_system_icon_hide':'1','ls_augment_rm_hidden_icon_slots':'','ls_augment_rm_hide_wifi_scope':'0'})
    shell("settings put secure status_bar_keys_close 'bluetooth;wifi'",root=True);icons('before-boot-icons',1);locked('before-boot-max-plan')
    boot=shell('cat /proc/sys/kernel/random/boot_id');adb('reboot');time.sleep(3)
    deadline=time.monotonic()+150
    while time.monotonic()<deadline:
        if adb('get-state',check=False,timeout=10).strip()==b'device':
            try:
                if shell('getprop sys.boot_completed')=='1':break
            except RuntimeError:pass
        time.sleep(2)
    else:raise AssertionError('Device did not finish boot')
    time.sleep(8);shell('setprop log.tag.LSA.ClockFit D');shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(P+'boot-loaded')
    check('true-cold-boot',shell('cat /proc/sys/kernel/random/boot_id')!=boot,'Kernel boot identity changed')
    icons('after-boot-icons',1);locked('after-boot-max-plan')
    instrument('set',P+'off-config',{'ls_augment_rm_ignore_system_icon_hide':'0','ls_augment_rm_lock_timeout_enabled':'0'});icons('off-native-hide',0)
finally:
    instrument('set',P+'restore',restore)
    shell('settings delete secure status_bar_keys_close' if native=='null' else 'settings put secure status_bar_keys_close '+shlex.quote(native),root=True)
    shell('input keyevent 224');shell('wm dismiss-keyguard');restart_ui(P+'restored-loaded')
    assert shell('settings get secure status_bar_keys_close')==native;assert shell('settings get system screen_off_timeout')==unlockedTimeout
