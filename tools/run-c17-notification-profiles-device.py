"""Observe notification layout under real rotation, font and theme changes; restore all."""
import json,re,time,xml.etree.ElementTree as ET
import adb_regression as ar
import native_ui_helpers as ui
version=re.search(r'versionCode=(\d+)',(ar.ROOT/'android/version.properties').read_text())[1]
OUT=ar.ROOT/('out/full-function-audit-20261004/notification-profiles-'+version)
OUT.mkdir(parents=True,exist_ok=True);ar.OUTPUT=OUT;ui.OUTPUT=OUT
settings=ar.instrument('snapshot','baseline')['settings'];restore={};cases=[]
display={k:ar.shell('settings get system '+k) for k in ['font_scale','user_rotation','accelerometer_rotation']}
night=ar.shell('cmd uimode night');mode=re.search(r'Night mode: (\w+)',night).group(1)
(OUT/'display-restore.json').write_text(json.dumps({'settings':display,'night':mode},indent=2),encoding='utf-8')

def configure(label,values):
    for key in values:restore.setdefault(key,settings[key])
    (OUT/'restore.json').write_text(json.dumps(restore,ensure_ascii=False,indent=2),encoding='utf-8')
    ar.instrument('set',label+'-set',values)

def capture(label,wide,font,dark):
    ar.shell('cmd statusbar collapse');ar.shell('settings put system accelerometer_rotation 0')
    ar.shell('settings put system user_rotation '+('1' if wide else '0'));ar.shell('settings put system font_scale '+str(font))
    ar.shell('cmd uimode night '+('yes' if dark else 'no'));ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    ar.shell('cmd statusbar collapse');time.sleep(.5);ar.shell('input swipe 180 5 180 '+('850' if wide else '1800')+' 650');time.sleep(1)
    windows=ui.all_windows(label);nodes=[n for n in ui.nodes(windows) if n.get('visible')]
    target=[n for n in nodes if n.get('id')=='com.android.systemui:id/notification_stack_scroller']
    assert len(target)==1,'Notification surface missing'
    bounds=list(map(int,re.findall(r'-?\d+',target[0]['bounds'])));assert (bounds[2]-bounds[0]>bounds[3]-bounds[1])==wide,'Actual orientation mismatch'
    folder=OUT/label;(folder/'screen.png').write_bytes(ar.adb('exec-out','screencap -p'))
    raw=ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
    diagnostics={n.attrib['name']:n.text for n in ET.fromstring(raw) if any(t in n.attrib.get('name','') for t in ['notification_clock','notification_clear','systemui_last_error'])}
    geometry=[{k:n.get(k) for k in ['id','bounds','text']} for n in nodes if n.get('id','').split('/')[-1] in ['clock','date','cc_header','status_icons_group','iv_dismiss_notification_view']]
    result={'label':label,'landscape':wide,'fontScale':font,'dark':dark,'diagnostics':diagnostics,'geometry':geometry};cases.append(result)
    (folder/'geometry.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print(label,diagnostics,flush=True)

try:
    prefix='ls_augment_rm_notification_clock_'
    configure('stress',{prefix+'portrait_enabled':'1',prefix+'portrait_size':'100',prefix+'portrait_align':'2',prefix+'portrait_x':'120',prefix+'portrait_y':'100',prefix+'portrait_date_size':'24',prefix+'portrait_list_gap':'64',
        prefix+'landscape_enabled':'1',prefix+'landscape_size':'44',prefix+'landscape_align':'1',prefix+'landscape_x':'0',prefix+'landscape_y':'0',prefix+'landscape_date_size':'14',prefix+'landscape_list_gap':'16',
        'ls_augment_rm_notification_clear_appearance_enabled':'1','ls_augment_rm_notification_clear_align':'3','ls_augment_rm_notification_clear_color_dark':'#4D7096'})
    capture('portrait-large-light',False,1.3,False)
    capture('portrait-large-dark',False,1.3,True)
    capture('landscape-normal-light',True,1.0,False)
    capture('landscape-large-dark',True,1.3,True)
finally:
    try:
        if restore:ar.instrument('set','restore',restore)
    finally:
        ar.shell('cmd statusbar collapse');ar.shell('cmd uimode night '+mode)
        for key,value in display.items():
            ar.shell('settings delete system '+key if value=='null' else 'settings put system '+key+' '+value)
    after=ar.instrument('snapshot','restored')['settings'];restored=all(after.get(k)==v for k,v in restore.items())
    display_restored=all(ar.shell('settings get system '+k)==v for k,v in display.items()) and ar.shell('cmd uimode night')==night
    (OUT/'report.json').write_text(json.dumps({'version':version,'cases':cases,'settingsRestored':restored,'displayRestored':display_restored,'evidence':'Actual screenshots and geometry; visual inspection required'},ensure_ascii=False,indent=2),encoding='utf-8')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity');assert restored and display_restored
