"""Real merged-shade paging, layout, touch and native restoration."""
import json,time,sys
from io import BytesIO
from itertools import combinations
from PIL import Image
from adb_regression import OUTPUT,adb,shell
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import configure,bounds,require_systemui_build
from quicksettings_device_helpers import restart_ui,capture

P=sys.argv[1] if len(sys.argv)>1 else 'round20e-merged-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in base.items() if k.startswith('ls_augment_rm_qs_')}
original_mode=shell('settings get system use_control_panel');rotation=shell('wm user-rotation');original_tiles=shell('settings get secure sysui_qs_tiles')
(folder/'original-state.json').write_text(json.dumps({'mode':original_mode,'rotation':rotation,'tiles':original_tiles},ensure_ascii=False,indent=2),encoding='utf-8')
results=[]
def check(name,passed,detail):
    results.append({'case':name,'pass':bool(passed),'detail':detail})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(results[-1],flush=True);assert passed,results[-1]
def observe(name,expand=True):
    if expand:shell('cmd statusbar collapse');time.sleep(.3);shell('cmd statusbar expand-settings');time.sleep(.8)
    label=P+name;w=all_windows(label);png=adb('exec-out','screencap -p');(OUTPUT/label/'screen.png').write_bytes(png)
    size=Image.open(BytesIO(png)).size
    pages=[n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_page'];assert pages
    items=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':p} for p in pages]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    rows=[]
    for item in sorted(items,key=lambda n:(n['bounds'][1],n['bounds'][0])):
        if not rows or item['bounds'][1]-rows[-1][0]['bounds'][1]>5:rows.append([])
        rows[-1].append(item)
    result={'tiles':[i for r in rows for i in r],'columns':len(rows[0]) if rows else 0,'rows':len(rows),'page':bounds(pages[0]),'screen':size}
    (OUTPUT/label/'geometry.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');return result
def geometry(name,cols,rows,values=None):
    if values:configure(P+name+'-config',values)
    r=observe(name);rects=[n['bounds'] for n in r['tiles']]
    overlap=any(min(a[2],b[2])-max(a[0],b[0])>2 and min(a[3],b[3])-max(a[1],b[1])>2 for a,b in combinations(rects,2))
    check(name,r['columns']==cols and r['rows']==rows and not overlap,{'columns':r['columns'],'rows':r['rows'],'overlap':overlap,'tiles':r['tiles'],'screen':r['screen']});return r
def pages(name,start,expected):
    found={n['text'] for n in start['tiles']};r=start
    for i in range(5):
        b=r['page'];y=(b[1]+min(b[3],r['screen'][1]))//2
        shell(f'input swipe {int(r["screen"][0]*.85)} {y} {int(r["screen"][0]*.15)} {y} 500');time.sleep(.5)
        r=observe(name+'-'+str(i),False);found.update(n['text'] for n in r['tiles'])
        if found==expected:break
    check(name,found==expected,{'reached':sorted(found),'expected':sorted(expected)})
def touch(name,r):
    b=next(n['bounds'] for n in r['tiles'] if n['text']=='录屏');command=f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}'
    (OUTPUT/(P+name+'-action.txt')).write_text(command,encoding='utf-8');shell(command);time.sleep(.6)
    w=all_windows(P+name+'-toolbar');(OUTPUT/(P+name+'-toolbar')/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    stop=[n for n in nodes(w) if n.get('visible') and n.get('id','').endswith('/stop_bn')]
    check(name,len(stop)==1,'Actual tile tap opens native recorder toolbar; recording has not started')
    b=bounds(stop[0]);shell(f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
try:
    require_systemui_build(folder.name);shell('cmd statusbar collapse');shell('wm user-rotation lock 0');shell('settings put system use_control_panel 0',root=True)
    configure(P+'baseline',restore);native=geometry('native',4,2);expected={n['text'] for n in native['tiles']}
    eight=geometry('8x1-live',7,1,{'rm_qs_grid':1,'rm_qs_columns':8,'rm_qs_rows':1})
    touch('portrait-touch',eight)
    three=geometry('3x1-live',3,1,{'rm_qs_columns':3});pages('3x1-pages',three,expected)
    two=geometry('2x1-live',2,1,{'rm_qs_columns':2});pages('2x1-pages',two,expected)
    geometry('5x2-live',5,2,{'rm_qs_columns':5,'rm_qs_rows':2})
    configure(P+'land-config',{'rm_qs_columns':8,'rm_qs_rows':1,'rm_qs_land_columns':10,'rm_qs_land_rows':2})
    shell('am start -n com.android.settings/.Settings');shell('wm user-rotation lock 1');time.sleep(1)
    land=geometry('land10',7,1);check('actual-landscape',land['screen'][0]>land['screen'][1],land['screen']);touch('land-touch',land)
    shell('wm user-rotation lock 0');time.sleep(.6);geometry('portrait-again',7,1)
    restart_ui(P+'restart');geometry('after-restart',7,1)
    off=geometry('off',4,2,{'rm_qs_grid':0});check('native-geometry-restored',off['tiles']==native['tiles'],{'before':native['tiles'],'after':off['tiles']})
    shell('cmd statusbar collapse');shell('settings put system use_control_panel 1',root=True);configure(P+'independent-config',{'rm_qs_grid':1,'rm_qs_columns':8,'rm_qs_rows':1})
    independent=capture(P+'independent-again');check('independent-regression',len(independent['tiles'])==7 and independent['rows']==1 and all(n['bounds'][2]-n['bounds'][0]<120 for n in independent['tiles']),'Independent center still fits all seven ordinary tiles in one row')
finally:
    shell('cmd statusbar collapse');shell('wm user-rotation '+rotation);shell('settings put system use_control_panel '+original_mode,root=True);configure(P+'restore',restore)
    check('original-system-state',shell('settings get secure sysui_qs_tiles')==original_tiles and shell('settings get system use_control_panel')==original_mode,'Original tile string, control-center style and rotation restored')
