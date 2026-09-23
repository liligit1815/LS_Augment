"""Tap the actual Quick Settings tile and compare per-user PackageManager state."""
import json
import time
from adb_regression import *
from tile_device_helpers import wait_tile
stage=sys.argv[1] if len(sys.argv)>1 else 'round5'
folder=OUTPUT/(stage+'-tile-results');folder.mkdir(exist_ok=True)
targets=json.loads(sys.argv[2]) if len(sys.argv)>2 else ['0:ls.augment.validation','999:ls.augment.regression.window1'];results=[]
def check(name,expected):
    states={}
    for target in targets:
        user,package=target.split(':',1);raw=shell('dumpsys package '+package,root=True)
        (folder/(name+'-'+user+'.txt')).write_text(raw,encoding='utf-8')
        line=next(x.strip() for x in raw.splitlines() if x.strip().startswith('User '+user+':'))
        states[target]='hidden=true' in line
    record={'case':name,'expected':expected,'actual':states,'status':'pass' if list(states.values())==expected else 'fail'}
    results.append(record);(folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
    print(json.dumps(record),flush=True);assert record['status']=='pass'
wait_tile(stage+'-tile-ready','ADB_HIDE，SPACE_TEST，全部显示',2)
tap(stage+'-tile-hide-click','ADB_HIDE，SPACE_TEST，全部显示')
wait_tile(stage+'-tile-all-hidden','ADB_HIDE，SPACE_TEST，全部隐藏',1);check('TILE-01-hide',[True,True])
tap(stage+'-tile-show-click','ADB_HIDE，SPACE_TEST，全部隐藏')
wait_tile(stage+'-tile-all-shown','ADB_HIDE，SPACE_TEST，全部显示',2);check('TILE-02-show',[False,False])
shell('cmd statusbar collapse')
instrument('hide-configure',stage+'-tile-mixed-fixture',{'targets':targets,'hidden':[targets[0]]})
shell('cmd statusbar expand-settings');wait_tile(stage+'-tile-mixed-visible','ADB_HIDE，SPACE_TEST，状态混合，点击恢复显示',1)
tap(stage+'-tile-mixed-click','ADB_HIDE，SPACE_TEST，状态混合，点击恢复显示')
wait_tile(stage+'-tile-mixed-restored','ADB_HIDE，SPACE_TEST，全部显示',2);check('TILE-03-mixed-recovery',[False,False])
shell('cmd statusbar collapse')
instrument('set',stage+'-tile-disabled',{'ls_augment_tile_enabled':'0'})
shell('cmd statusbar expand-settings');wait_tile(stage+'-tile-disabled-visible','ADB_HIDE',0)
shell('cmd statusbar click-tile ls.augment.com/.AugmentTileService');time.sleep(2)
check('TILE-04-disabled',[False,False])
shell('cmd statusbar collapse')
instrument('set',stage+'-tile-enable-restored',{'ls_augment_tile_enabled':'1'})
