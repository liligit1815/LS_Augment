"""Collect first real-phone observations with durable restoration, without clearing notifications."""
import json,time,os,xml.etree.ElementTree as ET
from pathlib import Path
import adb_regression as ar
OUT=ar.ROOT/'out/full-function-audit-20261004'/os.environ.get('DUO_C17_STAGE','c17-smoke-20449')
OUT.mkdir(parents=True,exist_ok=True);ar.OUTPUT=OUT
import native_ui_helpers as ui
ui.OUTPUT=OUT
baseline=ar.instrument('snapshot','baseline')['settings'];touched={};results=[]
(OUT/'baseline-settings.json').write_text(json.dumps(baseline,ensure_ascii=False,indent=2),encoding='utf-8')
def set_values(name,values):
    for key in values:touched.setdefault(key,baseline[key])
    (OUT/'restore-values.json').write_text(json.dumps(touched,ensure_ascii=False,indent=2),encoding='utf-8')
    ar.instrument('set',name+'-set',{k:str(v) for k,v in values.items()})
def capture(name,surface):
    ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    ar.shell('cmd statusbar collapse');time.sleep(.5)
    if surface=='control':ar.shell('cmd statusbar expand-settings')
    elif surface=='notification':ar.shell('input swipe 180 5 180 1800 650')
    time.sleep(2)
    windows=ui.all_windows(name);folder=OUT/name
    if surface!='main':
        expected='control_panel' if surface=='control' else 'notification_stack_scroller'
        if not any(n.get('visible') and n.get('id','').endswith('/'+expected) for n in ui.nodes(windows)):
            raise AssertionError('Expected real '+surface+' panel did not remain open')
    (folder/'screen.png').write_bytes(ar.adb('exec-out','screencap -p'))
    raw=ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
    diagnostics={n.attrib['name']:n.text for n in ET.fromstring(raw) if any(x in n.attrib.get('name','') for x in ('notification_','carrier_','cc_appearance','cc_media','statusbar_layout_state','systemui_last_error'))}
    (folder/'diagnostics.json').write_text(json.dumps(diagnostics,ensure_ascii=False,indent=2),encoding='utf-8')
    results.append({'case':name,'surface':surface,'evidence':'native view tree and screenshot collected; visual review pending','systemuiPid':ar.shell('pidof com.android.systemui')})
    print(name,'captured',flush=True)
try:
    capture('main-before','main')
    set_values('summary-symbol',{'ls_augment_systemui_master':'1','ls_augment_notification_summary_enabled':'1','ls_augment_notification_summary_mode':'0','ls_augment_notification_summary_symbol':'♥'})
    capture('summary-symbol','main')
    set_values('summary-text',{'ls_augment_notification_summary_mode':'1','ls_augment_notification_summary_text':'DUO','ls_augment_statusbar_icon_spacing_v1':'IS1;main,notifications,8,0,8,0;main,bluetooth,4,0,4,0'})
    capture('summary-text-spacing','main')
    set_values('summary-off',{'ls_augment_notification_summary_enabled':'0','ls_augment_statusbar_icon_spacing_v1':baseline['ls_augment_statusbar_icon_spacing_v1']})
    capture('summary-off','main')
    capture('control-before','control')
    set_values('control-style',{'ls_augment_rm_cc_corners_enabled':'1','ls_augment_rm_cc_corner_radius_dp':'12','ls_augment_rm_cc_tile_fill_enabled':'1','ls_augment_rm_cc_tile_gradient':'1','ls_augment_carrier_control_enabled':'1','ls_augment_carrier_control_mode':'1','ls_augment_carrier_control_text':'DUO CONTROL','ls_augment_carrier_control_size':'13'})
    capture('control-style','control')
    capture('notification-before','notification')
    set_values('notification-style',{'ls_augment_carrier_notification_enabled':'1','ls_augment_carrier_notification_mode':'1','ls_augment_carrier_notification_text':'DUO NOTICE','ls_augment_rm_notification_clear_appearance_enabled':'1','ls_augment_rm_notification_clear_align':'2'})
    capture('notification-style','notification')
finally:
    if touched:ar.instrument('set','restore',touched)
    after=ar.instrument('snapshot','restored')['settings']
    restored=all(after.get(k)==v for k,v in touched.items())
    (OUT/'report.json').write_text(json.dumps({'cases':results,'configurationRestored':restored,'testedConfigKeys':list(touched)},ensure_ascii=False,indent=2),encoding='utf-8')
    ar.shell('cmd statusbar collapse')
    if not restored:raise AssertionError('Restore mismatch')
