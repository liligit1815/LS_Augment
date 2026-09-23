"""Verify retained Control Center settings after a real full-device reboot."""
import json,time,re,sys
from io import BytesIO
from PIL import Image
import numpy as np
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes,tap_id
from statusbar_device_helpers import configure,require_systemui_build,bounds
from quicksettings_device_helpers import capture

P=sys.argv[1] if len(sys.argv)>1 else 'round20i-'
folder=OUTPUT/(P+'coldboot');results=[]
base=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings'];restore={k.removeprefix('ls_augment_'):v for k,v in base.items() if k.startswith('ls_augment_rm_qs_')}
def check(name,passed,detail):
    results.append({'case':name,'pass':bool(passed),'detail':detail});(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(results[-1],flush=True);assert passed,results[-1]
def focus(name,package):
    data=shell('dumpsys window displays');line=next(s for s in data.splitlines() if 'mCurrentFocus=' in s)
    (folder/(name+'-focus.txt')).write_text(line,encoding='utf-8');w=all_windows(P+name);(OUTPUT/(P+name)/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    check(name,package+'/' in line,line)
def editor(name,columns):
    w=all_windows(P+name);png=adb('exec-out','screencap -p');(OUTPUT/(P+name)/'screen.png').write_bytes(png)
    im=np.asarray(Image.open(BytesIO(png)).convert('RGB'))
    root=next(n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize')
    ts=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':root}]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    top=min(t['bounds'][1] for t in ts);row=sorted([t for t in ts if t['bounds'][1]-top<=5],key=lambda n:n['bounds'][0])
    (OUTPUT/(P+name)/'tiles.json').write_text(json.dumps(ts,ensure_ascii=False,indent=2),encoding='utf-8')
    widths=[n['bounds'][2]-n['bounds'][0] for n in row]
    check(name,len(row)==columns and max(widths)-min(widths)<=2 and (columns!=4 or min(widths)>=190) and all(a['bounds'][2]<=b['bounds'][0] for a,b in zip(row,row[1:])),row)
    if columns==4:
        ink={}
        for n in row:
            if n['text'] not in ['WLAN','手电筒']:continue
            x,y,rr,bb=n['bounds'];ys,xs=np.where(im[y:bb,x:rr].min(axis=2)<80);ink[n['text']]=int(xs.min())
        check(name+'-no-marquee-ghost',abs(ink['WLAN']-49)<=1 and abs(ink['手电筒']-45)<=1,ink)
try:
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    require_systemui_build(folder.name)
    pid=shell('pidof com.android.systemui')
    old=json.loads((folder/'before-state.json').read_text(encoding='utf-8'));new=json.loads((folder/'after-state.json').read_text(encoding='utf-8'))
    check('actual-cold-boot',old['bootId']!=new['bootId'] and old['tiles']==new['tiles'],{'beforeBoot':old['bootId'],'afterBoot':new['bootId'],'tileOrderRetained':old['tiles']==new['tiles']})
    before=json.loads((OUTPUT/(P+'before-boot')/'geometry.json').read_text(encoding='utf-8'));after=capture(P+'after-boot')
    check('grid-retained-exactly',after['tiles']==before['tiles'],after['tiles'])
    h=after['header'];clock=next(n for n in h if n['id'].endswith('/clock'));check('header-retained',clock['text'].count(':')==2 and any(p in clock['text'] for p in ['凌晨','早上','上午','中午','下午','傍晚','晚上']) and any(n['id'].endswith('header_carrier_text') for n in h) and any(n['id'].endswith('search_button') for n in h),h)
    tap_id(P+'search-tap','com.android.systemui:id/search_button');time.sleep(.6);focus('search-after-boot','com.android.settings')
    capture(P+'date-panel');tap_id(P+'date-tap','com.android.systemui:id/date');time.sleep(.6);focus('date-after-boot','com.android.calendar')
    shell('am start -n com.android.settings/.Settings');capture(P+'edit-panel');tap_id(P+'menu','com.android.systemui:id/control_center_menu_button');tap_id(P+'editor-open','com.android.systemui:id/edit_text_button');editor('editor-portrait8',8)
    shell('wm user-rotation lock 1');time.sleep(1);editor('editor-land10',10)
    shell('wm user-rotation lock 0');time.sleep(.7);instrument('set',P+'editor-off-config',{'ls_augment_rm_qs_grid':'0'});time.sleep(.6);editor('editor-off4',4)
    tap_id(P+'editor-close','com.android.systemui:id/qs_edit_button_back');time.sleep(.6);shell('cmd statusbar collapse');time.sleep(.6);configure(P+'restore',restore)
    native=capture(P+'native-restored');check('native-restored',native['columns']==4 and native['rows']==2 and len(native['header'])==2 and next(n['text'] for n in native['header'] if n['id'].endswith('/clock')).count(':')==1,native['header'])
    check('systemui-process-retained',shell('pidof com.android.systemui')==pid,pid)
finally:
    shell('input keyevent 4');time.sleep(.6);shell('cmd statusbar collapse');time.sleep(.6);shell('wm user-rotation lock 0');shell('settings put system use_control_panel 1',root=True);configure(P+'final-restore',restore)
