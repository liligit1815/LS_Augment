"""Check native label measurement after repeated rotation, disabling and recycling."""
import sys,json,time
from io import BytesIO
from PIL import Image
import numpy as np
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes,tap_id
from statusbar_device_helpers import configure,require_systemui_build,bounds
P=sys.argv[1] if len(sys.argv)>1 else 'round20h-editor-restore-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings'];restore={k.removeprefix('ls_augment_'):v for k,v in base.items() if k.startswith('ls_augment_rm_qs_')}
original=shell('settings get secure sysui_qs_tiles');results=[];native_ink={}
def awake():
    shell('input keyevent 224');shell('wm dismiss-keyguard')
def record(name,columns,native=False):
    awake()
    w=all_windows(P+name);png=adb('exec-out','screencap -p');(OUTPUT/(P+name)/'screen.png').write_bytes(png)
    im=np.asarray(Image.open(BytesIO(png)).convert('RGB'))
    display=shell('dumpsys window displays');(OUTPUT/(P+name)/'display.txt').write_text(display,encoding='utf-8')
    assert 'isKeyguardShowing=false' in display,'Locked display invalidates this editor rotation check'
    root=next(n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize')
    ts=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':root}]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    top=min(t['bounds'][1] for t in ts);row=sorted([t for t in ts if t['bounds'][1]-top<=5],key=lambda n:n['bounds'][0]);widths=[n['bounds'][2]-n['bounds'][0] for n in row]
    valid=len(row)==columns and max(widths)-min(widths)<=2 and all(a['bounds'][2]<=b['bounds'][0] for a,b in zip(row,row[1:]))
    ink={}
    if native:
        valid=valid and all(190<=n['bounds'][2]-n['bounds'][0]<=200 for n in ts)
        for n in row:
            if n['text'] not in ['WLAN','手电筒']:continue
            x,y,rr,bb=n['bounds'];mask=im[y:bb,x:rr].min(axis=2)<80;ys,xs=np.where(mask)
            ink[n['text']]={'left':int(xs.min()),'right':int(xs.max()),'pixels':int(mask.sum())}
        valid=valid and all(v['left']>10 for v in ink.values())
        mode=name.split('-')[0]
        if mode not in native_ink:native_ink[mode]=ink
        else:
            for key,value in ink.items():
                old=native_ink[mode][key]
                valid=valid and abs(value['left']-old['left'])<=1 and abs(value['right']-old['right'])<=1 and abs(value['pixels']-old['pixels'])<=max(10,old['pixels']*.03)
    r={'case':name,'pass':valid,'firstRow':row,'allLabelWidths':sorted(set(n['bounds'][2]-n['bounds'][0] for n in ts)),'ink':ink,'screen':[im.shape[1],im.shape[0]]}
    results.append(r);(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8');print(r,flush=True);assert valid,r
def config(name,values):awake();instrument('set',P+name+'-config',{'ls_augment_rm_qs_'+k:str(v) for k,v in values.items()});time.sleep(.6)
def close_editor(name):
    w=all_windows(P+name+'-close-before');n=next(n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/qs_edit_button_back');b=bounds(n)
    shell(f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}');time.sleep(.5);shell('cmd statusbar collapse')
    w=all_windows(P+name+'-closed');assert not any(n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize' for n in nodes(w))
def open_editor(name,mode):
    shell('cmd statusbar collapse');time.sleep(.2);shell('cmd statusbar expand-settings');time.sleep(.6)
    if mode:tap_id(P+name+'-menu','com.android.systemui:id/control_center_menu_button');tap_id(P+name+'-open','com.android.systemui:id/edit_text_button')
    else:
        # The native merged header's edit button remains visible in landscape.
        # Use its real screen position; the old portrait tap helper clamps x.
        w=all_windows(P+name+'-open-before');n=next(n for n in nodes(w) if n.get('visible') and n.get('id')=='android:id/edit');b=bounds(n)
        command=f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}';(OUTPUT/(P+name+'-open-before')/'action.txt').write_text(command,encoding='utf-8');shell(command)
try:
    require_systemui_build(folder.name);configure(P+'baseline',restore);shell('am start -n com.android.settings/.Settings')
    for mode in [1,0]:
        title='independent' if mode else 'merged';shell('settings put system use_control_panel '+str(mode),root=True);shell('wm user-rotation lock 0');shell('am start -n com.android.settings/.Settings');time.sleep(.4);open_editor(title,mode);record(title+'-native',4,True)
        for i in range(2):
            name=title+'-'+str(i)
            config(name+'-on',{'grid':1,'edit_columns':8,'land_edit_columns':10});record(name+'-8',8)
            awake();shell('wm user-rotation lock 1');time.sleep(.6)
            record(name+'-land10',10)
            awake();shell('wm user-rotation lock 0');time.sleep(.6)
            record(name+'-portrait8',8)
            config(name+'-off',{'grid':0});record(name+'-off4',4,True)
        config(title+'-recycle-on',{'grid':1});close_editor(title+'-recycle');config(title+'-recycle-off',{'grid':0});open_editor(title+'-reopen',mode);record(title+'-reopen-native',4,True);close_editor(title+'-finish')
finally:
    shell('input keyevent 4');shell('cmd statusbar collapse');shell('wm user-rotation lock 0');shell('settings put system use_control_panel 1',root=True);configure(P+'restore',restore)
    assert shell('settings get secure sysui_qs_tiles')==original
