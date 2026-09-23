"""Use the native editor for real hot updates, rotation and drag, restoring its original order."""
import json
import shlex
import time
from io import BytesIO
from PIL import Image
from itertools import combinations
from adb_regression import OUTPUT, adb, shell, instrument
from native_ui_helpers import all_windows, nodes, tap_id
from statusbar_device_helpers import bounds, require_systemui_build, configure
from quicksettings_device_helpers import capture

P='round19g-qs-editor-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
original=shell('settings get secure sysui_qs_tiles')
(folder/'original-tiles.txt').write_text(original,encoding='utf-8')
baseline=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in baseline.items() if k.startswith('ls_augment_rm_qs_')}
results=[]
require_systemui_build(folder.name)

def save():(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
def check(case,passed,detail):
    r={'case':case,'result':'pass' if passed else 'failed','detail':detail};results.append(r);save();assert passed,r
def observe(name):
    label=P+name;w=all_windows(label);png=adb('exec-out','screencap -p');(OUTPUT/label/'screen.png').write_bytes(png)
    size=Image.open(BytesIO(png)).size
    (OUTPUT/label/'display.txt').write_text(shell('dumpsys window displays'),encoding='utf-8')
    root=[n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize'];assert len(root)==1
    children=list(nodes([{'root':root[0]}]));lists=[n for n in children if n.get('visible') and n.get('id')=='android:id/list'];assert len(lists)==1
    tiles=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':lists[0]}]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    ordered=[]
    for item in sorted(tiles,key=lambda t:(t['bounds'][1],t['bounds'][0])):
        if not ordered or item['bounds'][1]-ordered[-1][0]['bounds'][1]>5:ordered.append([])
        ordered[-1].append(item)
    tiles=[t for row in ordered for t in sorted(row,key=lambda t:t['bounds'][0])]
    top=min(t['bounds'][1] for t in tiles);row=[t for t in tiles if abs(t['bounds'][1]-top)<=5]
    result={'tiles':tiles,'columns':len(row),'firstRow':row,'list':bounds(lists[0]),'screenSize':size};(OUTPUT/label/'geometry.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print(name,'columns',len(row),'firstRow',row,'screen',size,flush=True);return result
def hot(name,values,columns):
    if values:instrument('set',P+name+'-config',{'ls_augment_'+k:str(v) for k,v in values.items()})
    time.sleep(1)
    r=observe(name);rects=[t['bounds'] for t in r['tiles']]
    overlap=any(min(a[2],b[2])-max(a[0],b[0])>2 and min(a[3],b[3])-max(a[1],b[1])>2 for a,b in combinations(rects,2))
    widths=[t['bounds'][2]-t['bounds'][0] for t in r['firstRow']]
    check(name,r['columns']==columns and not overlap and max(widths)-min(widths)<=2 and all(b[0]>=r['list'][0] and b[2]<=r['list'][2] for b in rects),'Actual occupied columns, equal uncut first-row labels, no overlap and labels within list edges')
    return r
def drag(name,source,target):
    r=observe(name+'-before');a=next(n['bounds'] for n in r['tiles'] if n['text']==source);b=next(n['bounds'] for n in r['tiles'] if n['text']==target)
    command=f'input draganddrop {(a[0]+a[2])//2} {(a[1]+a[3])//2} {(b[0]+b[2])//2} {(b[1]+b[3])//2} 1200'
    (OUTPUT/(P+name+'-before')/'action.txt').write_text(command,encoding='utf-8');shell(command);time.sleep(.8);return observe(name+'-after')

try:
    shell('input keyevent 4');shell('cmd statusbar collapse');configure(P+'baseline',{'rm_qs_grid':0})
    # Instrumenting the module terminates its SettingsActivity. Keep a separate
    # native activity underneath so the portrait-only launcher cannot veto rotation.
    shell('am start -n com.android.settings/.Settings');time.sleep(.8)
    capture(P+'panel');tap_id(P+'menu','com.android.systemui:id/control_center_menu_button');tap_id(P+'open','com.android.systemui:id/edit_text_button')
    native=observe('native');assert native['columns']==4
    hot('3-live',{'rm_qs_grid':1,'rm_qs_edit_columns':3},3)
    eight=hot('8-live',{'rm_qs_edit_columns':8,'rm_qs_land_edit_columns':10},8)
    shell('wm user-rotation lock 1');time.sleep(1)
    land=hot('land10',{},10);check('actual-landscape',land['screenSize'][0]>land['screenSize'][1],'Physical display screenshot is landscape')
    hot('land2',{'rm_qs_land_edit_columns':2},2)
    shell('wm user-rotation lock 0');time.sleep(1)
    before_drag=hot('portrait8-again',{},8)
    moved=drag('drag-nfc','NFC','红魔互传')
    selected=[n['text'] for n in moved['tiles'][:11]]
    check('real-drag',set(selected)==set(n['text'] for n in before_drag['tiles'][:11]) and selected.index('NFC')<selected.index('红魔互传'),'Real long press and drag changes order while retaining all original selected tiles')
    returned=drag('drag-back','NFC','自动旋转')
    check('drag-back-order',[n['text'] for n in returned['tiles'][:11]]==[n['text'] for n in before_drag['tiles'][:11]],'Reverse drag restores the original selected-tile order')
    off=hot('off-live',{'rm_qs_grid':0},4)
    check('off-original-geometry',off['firstRow']==native['firstRow'],'Native first-row label positions and sizes restore exactly')
finally:
    shell('input keyevent 4');shell('cmd statusbar collapse');shell('wm user-rotation lock 0')
    # OEM edits can discard an unavailable legacy tile. Restore the complete
    # original string, including that pre-existing tile, after exiting the editor.
    if shell('settings get secure sysui_qs_tiles')!=original:shell('settings put secure sysui_qs_tiles '+shlex.quote(original),root=True)
    configure(P+'restore',restore)
    current=shell('settings get secure sysui_qs_tiles');(folder/'restored-tiles.txt').write_text(current,encoding='utf-8');assert current==original
print('Native editor columns, rotation, drag and restoration passed')
