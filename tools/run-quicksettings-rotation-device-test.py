"""Recreate the native 0.75 entrance-scale timing boundary on the physical phone."""
import json
import time
from statusbar_device_helpers import configure, require_systemui_build
from quicksettings_device_helpers import OUTPUT, shell, capture

P='round17i-qs-rotation-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
results=[];widths={}
baseline=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in baseline.items() if k.startswith('ls_augment_rm_qs_')}
require_systemui_build(folder.name)
configure(P+'on',{'rm_qs_grid':1,'rm_qs_columns':8,'rm_qs_rows':1,'rm_qs_land_columns':10,'rm_qs_land_rows':2})
try:
    for i in range(6):
        rotation=i%2;shell('wm user-rotation lock '+str(rotation));time.sleep(.3)
        r=capture(P+str(i));sizes=sorted(t['bounds'][2]-t['bounds'][0] for t in r['clickTargets'])
        if rotation not in widths:widths[rotation]=sizes
        passed=len(sizes)==7 and sizes==widths[rotation] and all(110<=n<=120 if rotation==0 else 85<=n<=95 for n in sizes)
        results.append({'case':i,'rotation':rotation,'touchWidths':sizes,'result':'pass' if passed else 'failed'})
        (folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
        assert passed,results[-1]
finally:
    shell('wm user-rotation lock 0');configure(P+'restore',restore)
print('Six rapid rotation cases retain consistent native tile scale')
