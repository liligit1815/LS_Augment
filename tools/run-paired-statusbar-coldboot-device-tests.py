"""Exercise paired rows beside unequal real content, native icons/font priority, and boot."""
import json,re,sys,time,xml.etree.ElementTree as ET
from adb_regression import OUTPUT,adb,shell,instrument
from statusbar_device_helpers import grid,require_systemui_build
from native_ui_helpers import all_windows,nodes
from quicksettings_device_helpers import restart_ui
prefix=sys.argv[1];out=OUTPUT/(prefix+'results');out.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',prefix+'baseline')['settings'];restore={}
inventory=json.loads((OUTPUT/'notification-fixtures/inventory.json').read_text(encoding='utf-8'))
fixtures=[x for x in inventory if x['version']==2 and x['package'] in ['ls.augment.regression.window'+str(i) for i in range(1,5)]]
assert len(fixtures)==4

def configure(name,values):
    values={'ls_augment_'+k:str(v) for k,v in values.items()}
    for key in values:restore.setdefault(key,base[key])
    instrument('set',prefix+name+'-config',values)

def post_fixtures():
    for fixture in fixtures:shell('am start -W -n '+fixture['component']+' --ez notify true')
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(7)

def capture(name):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(6)
    label=prefix+name;windows=all_windows(label);folder=OUTPUT/label
    (folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    text=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
    values={n.get('name'):n.text for n in ET.fromstring(text) if 'statusbar_' in n.get('name','')}
    (folder/'diagnostics.json').write_text(json.dumps(values,ensure_ascii=False,indent=2),encoding='utf-8')
    metric=values.get('ls_augment_statusbar_phone_metrics_state','')
    pair=re.findall(r'network#[01]=.*?@(-?\d+),',metric);notification=re.search(r'notifications_x=([\d.]+),([\d.]+)',metric)
    clocks=[n for n in nodes(windows) if n.get('visible') and n.get('package')=='com.android.systemui' and n.get('text')=='Aa11']
    result={'case':name,'geometryPass':len(pair)==2 and abs(int(pair[0])-int(pair[1]))<=1 and notification is not None and abs(float(notification[1])-float(notification[2]))<1 and len(clocks)==1,'networkX':pair,'notificationX':list(notification.groups()) if notification else None,'clockNodes':clocks,'evidence':label}
    checks.append(result);(out/'observations.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print({k:v for k,v in result.items() if k!='clockNodes'},flush=True);assert result['geometryPass']

try:
    require_systemui_build(prefix+'loaded')
    configure('base',{'systemui_master':1,'statusbar_height_dp':80,'statusbar_notification_two_rows':1,'statusbar_system_two_rows':1,'statusbar_notification_hide':0,'statusbar_notification_max':20,'statusbar_network_display':4,'rm_network_custom':1,'rm_network_unit':1,'rm_network_digits':5,'rm_network_per_second':1,'rm_network_hide_below_kb':0,'rm_network_width_dp':0,'rm_metrics_custom':1,'rm_metrics_hide_units':0,'rm_metrics_charging_only':0,'rm_notification_native':1,'rm_statusbar_restore_font':1,'statusbar_clock_custom':1,'statusbar_clock_rows':1,'statusbar_clock_pattern':"'Aa11'",'statusbar_clock_pattern_second':'','statusbar_clock_font_family':'monospace','statusbar_clock_weight':400,'statusbar_clock_size_sp':0,'statusbar_clock_width_dp':0})
    restart_ui(prefix+'configured-loaded');post_fixtures()
    for index,network_column in enumerate('LCR'):
        notification_column='LCR'[(index+1)%3];system_column='LCR'[(index+2)%3]
        locations={'cpu':network_column+'1','current':network_column+'2','gpu':notification_column+'1','power':notification_column+'2','battery_temp':system_column+'1','clock':system_column+'2','network':network_column+'S','notifications':notification_column+'S','system_icons':system_column+'S'}
        orders={'cpu':0,'gpu':0,'battery_temp':0,'current':1,'power':1,'clock':1,'network':2,'notifications':2,'system_icons':2}
        spec=grid({key:{'zone':zone,'size':12,'order':orders[key]} for key,zone in locations.items()},only=list(locations))
        for long_top in [True,False]:
            name=network_column+('-top-long' if long_top else '-bottom-long')
            options={'statusbar_grid_v2':spec}
            for key in ['cpu','gpu','battery_temp','current','power']:
                longer=(key in ['cpu','gpu','battery_temp'])==long_top
                options['rm_metric_prefix_'+key]=(key[0].upper()*12+'=') if longer else ''
                options['rm_metric_width_'+key]=0
            configure(name,options);capture(name)
    boot=shell('cat /proc/sys/kernel/random/boot_id');adb('reboot');time.sleep(3);deadline=time.monotonic()+150
    while time.monotonic()<deadline:
        if adb('get-state',check=False,timeout=10).strip()==b'device':
            try:
                if shell('getprop sys.boot_completed')=='1':break
            except RuntimeError:pass
        time.sleep(2)
    else:raise AssertionError('Device did not finish boot')
    time.sleep(8);shell('input keyevent 224');shell('wm dismiss-keyguard');shell('setprop log.tag.LSA.ClockFit D');require_systemui_build(prefix+'boot-loaded')
    new_boot=shell('cat /proc/sys/kernel/random/boot_id');assert boot!=new_boot
    (out/'boot.json').write_text(json.dumps({'before':boot,'after':new_boot},indent=2),encoding='utf-8')
    post_fixtures();capture('after-boot')
    shell('input swipe 170 35 170 1500 650');time.sleep(.8);all_windows(prefix+'after-boot-shade');(OUTPUT/(prefix+'after-boot-shade')/'screen.png').write_bytes(adb('exec-out','screencap -p'));shell('cmd statusbar collapse')
    configure('off',{'systemui_master':0,'rm_notification_native':0,'rm_statusbar_restore_font':0});restart_ui(prefix+'off-loaded');post_fixtures()
    all_windows(prefix+'native-restored');(OUTPUT/(prefix+'native-restored')/'screen.png').write_bytes(adb('exec-out','screencap -p'))
finally:
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse')
    for fixture in fixtures:
        shell('am start -W -n '+fixture['component']+' --ez clear true');shell('am force-stop '+fixture['package'])
    if restore:instrument('set',prefix+'restore',restore)
    restart_ui(prefix+'restored-loaded')
