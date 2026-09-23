"""Exercise actual switches for notification style, native fonts and the camera circle."""
import sys
from module_ui_helpers import *
from adb_regression import instrument
from statusbar_device_helpers import require_systemui_build
prefix=sys.argv[1];out=OUTPUT/(prefix+'results');out.mkdir(exist_ok=True);checks=[]
options=[('notification_native','恢复原生通知图标'),('statusbar_restore_font','恢复状态栏原生字体'),('cutout_always','挖孔黑圈常显')]
base=instrument('snapshot',prefix+'baseline')['settings'];restore={'ls_augment_rm_'+key:base['ls_augment_rm_'+key] for key,_ in options}
try:
    require_systemui_build(prefix+'loaded');instrument('set',prefix+'zero',{key:'0' for key in restore})
    open_system_group(prefix+'open','状态栏细节')
    for key,title in options:
        for enabled in [1,0]:
            label=prefix+key+'-'+str(enabled);root,found=find(label,title)
            assert len(found)==1 and found[0].get('class')=='android.widget.Switch'
            assert (found[0].get('checked')=='true')!=bool(enabled)
            tap_node(label+'-tap',found[0]);time.sleep(.4)
            actual=setting('rm_'+key);after=hierarchy(label+'-after');switches=matches(after,title)
            result={'case':key+'-'+str(enabled),'pass':actual==str(enabled) and len(switches)==1 and (switches[0].get('checked')=='true')==bool(enabled),'savedValue':actual,'evidence':label+'-after'}
            checks.append(result);(out/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(result,flush=True);assert result['pass']
finally:instrument('set',prefix+'restore',restore)
