"""Real notification-panel geometry and scrolling observations; preserves user notifications."""
import json,time,re,xml.etree.ElementTree as ET
from pathlib import Path
import adb_regression as ar
version=re.search(r'versionCode=(\d+)',(ar.ROOT/'android/version.properties').read_text())[1]
OUT=ar.ROOT/('out/full-function-audit-20261004/notification-native-'+version);OUT.mkdir(parents=True,exist_ok=True);ar.OUTPUT=OUT
import native_ui_helpers as ui;ui.OUTPUT=OUT
baseline=ar.instrument('snapshot','baseline')['settings'];restore={};results=[]
def set_values(label,values):
    for key in values:restore.setdefault(key,baseline[key])
    (OUT/'restore.json').write_text(json.dumps(restore,ensure_ascii=False,indent=2),encoding='utf-8')
    ar.instrument('set',label+'-set',values)
def open_panel():
    ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard');ar.shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    ar.shell('cmd statusbar collapse');time.sleep(.5);ar.shell('input swipe 180 5 180 1800 650');time.sleep(1)
def capture(label):
    windows=ui.all_windows(label);folder=OUT/label;(folder/'screen.png').write_bytes(ar.adb('exec-out','screencap -p'))
    visible=[n for n in ui.nodes(windows) if n.get('visible')]
    assert any(n.get('id')=='com.android.systemui:id/notification_stack_scroller' for n in visible),'Notification panel unexpectedly closed'
    raw=ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
    diagnostics={n.attrib['name']:n.text for n in ET.fromstring(raw) if any(x in n.attrib.get('name','') for x in ('notification_clock','notification_stack','notification_clear'))}
    geom=[{k:n.get(k) for k in ['id','class','bounds','clickable']} for n in visible if any(n.get('id','').endswith('/'+s) for s in ['clock','date','iv_dismiss_notification_view','status_icons_group','cc_header'])]
    (folder/'geometry.json').write_text(json.dumps({'geometry':geom,'diagnostics':diagnostics},ensure_ascii=False,indent=2),encoding='utf-8')
    results.append({'label':label,'geometry':geom,'diagnostics':diagnostics});print(label,diagnostics,flush=True)
    return visible
try:
    open_panel();capture('before')
    set_values('clear-left',{'ls_augment_rm_notification_clear_appearance_enabled':'1','ls_augment_rm_notification_clear_align':'1','ls_augment_rm_notification_clear_color_light':'#BFE0FF'})
    open_panel();capture('clear-left')
    set_values('clear-off',{'ls_augment_rm_notification_clear_appearance_enabled':'0'});open_panel();capture('clear-restored')
    set_values('clock-on',{'ls_augment_rm_notification_clock_portrait_enabled':'1','ls_augment_rm_notification_clock_portrait_size':'64'})
    open_panel();capture('clock-expanded');time.sleep(2);capture('clock-stable')
    set_values('clock-off',{'ls_augment_rm_notification_clock_portrait_enabled':'0'});open_panel();capture('clock-restored')
    set_values('stack-on',{'ls_augment_rm_notification_stack':'1','ls_augment_rm_notification_stack_start':'40'})
    open_panel();capture('stack-top')
    for index in range(1,4):
        ar.shell('input swipe 550 650 550 440 650');time.sleep(.5);capture('stack-scroll-'+str(index))
finally:
    if restore:ar.instrument('set','restore',restore)
    after=ar.instrument('snapshot','restored')['settings'];restored=all(after.get(k)==v for k,v in restore.items())
    (OUT/'report.json').write_text(json.dumps({'evidence':'Observed native geometry and screenshots; interaction assertions still require individual review','cases':results,'configurationRestored':restored},ensure_ascii=False,indent=2),encoding='utf-8')
    ar.shell('cmd statusbar collapse');assert restored
