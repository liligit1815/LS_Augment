"""Real native Control Center geometry, scrolling, rotation and scope restart."""
import json
import time
from itertools import combinations
from statusbar_device_helpers import configure, require_systemui_build
from quicksettings_device_helpers import OUTPUT, shell, capture, restart_ui

P='round17g-qs-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
results=[]
baseline=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in baseline.items() if k.startswith('ls_augment_rm_qs_')}
rotation=shell('wm user-rotation')
require_systemui_build(folder.name)

def save():(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
def check(r,condition,message):
    r['result']='pass' if condition else 'failed';r['check']=message;results.append(r);save();assert condition,r
def overlaps(rects):
    return any(min(a[2],b[2])-max(a[0],b[0])>2 and min(a[3],b[3])-max(a[1],b[1])>2 for a,b in combinations(rects,2))
def sample(name,settings=None,cols=None,rows=None,wide=None,expand=True):
    label=P+name
    if settings:configure(label,settings)
    r=capture(label,expand=expand);r['case']=name
    checks=len(r['tiles'])>0 and not overlaps([t['bounds'] for t in r['tiles']]) and not overlaps([t['bounds'] for t in r['clickTargets']])
    if cols is not None:checks &= r['columns']==cols
    if rows is not None:checks &= r['rows']==rows
    if wide is not None:checks &= r['wideTiles']==wide
    check(r,checks,'Visible labels and complete touch targets do not overlap; requested occupied columns/rows and native wide tiles match')
    return r
def scroll_all(name,first,expected):
    seen={t['text'] for t in first['tiles']}
    for i in range(len(expected)+3):
        b=first['scroller'][0];x=(b[0]+b[2])//2
        shell(f'input swipe {x} {b[3]-60} {x} {b[1]+60} 800');time.sleep(.4)
        current=capture(P+name+str(i),expand=False);seen.update(t['text'] for t in current['tiles'])
        if seen==expected:break
    check({'case':name,'seen':sorted(seen),'expected':sorted(expected)},seen==expected,'All original regular tiles remain reachable by real scrolling')

try:
    native=sample('native',{'rm_qs_grid':0},4,2)
    expected={t['text'] for t in native['tiles']};assert len(expected)==7
    three=sample('3x1',{'rm_qs_grid':1,'rm_qs_columns':3,'rm_qs_rows':1},3,1,native['wideTiles'])
    scroll_all('3x1-scroll',three,expected)
    sample('5x2',{'rm_qs_columns':5,'rm_qs_rows':2},5,2,native['wideTiles'])
    eight=sample('8x1',{'rm_qs_columns':8,'rm_qs_rows':1},7,1,native['wideTiles'])
    assert max(t['bounds'][2]-t['bounds'][0] for t in eight['tiles'])<110
    for i in range(2):
        shell('cmd statusbar collapse');time.sleep(.4)
        sample('8x1-reopen'+str(i),cols=7,rows=1,wide=native['wideTiles'])
    configure(P+'land-config',{'rm_qs_land_columns':10,'rm_qs_land_rows':2})
    shell('wm user-rotation lock 1');time.sleep(2)
    sample('land10x2',cols=7,rows=1)
    landtwo=sample('land2x1',{'rm_qs_land_columns':2,'rm_qs_land_rows':1},2,1)
    scroll_all('land2x1-scroll',landtwo,expected)
    shell('wm user-rotation lock 0');time.sleep(2)
    sample('portrait-again',cols=7,rows=1,wide=native['wideTiles'])
    restart_ui(P+'restart')
    sample('after-restart',cols=7,rows=1,wide=native['wideTiles'])
    off=sample('off',{'rm_qs_grid':0},4,2,native['wideTiles'])
    check({'case':'off-exact-restore'},off['tiles']==native['tiles'] and off['scroller']==native['scroller'],'Disabling restores original label positions and full scroll container')
finally:
    shell('wm user-rotation '+rotation)
    configure(P+'restore',restore)
print('All Control Center grid cases passed')
