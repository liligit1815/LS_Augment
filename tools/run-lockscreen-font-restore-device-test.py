"""Exercise restore-original-font after a real UI import from round22f/22i."""
import sys
from module_ui_helpers import *
from adb_regression import instrument
from lockscreen_device_helpers import lock_wake,capture,clock_layout
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_clock_')}
font=json.loads((OUTPUT/'round22f-ui-results/font-ownership.json').read_text(encoding='utf-8'))['hash']
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
try:
    instrument('set',P+'imported-config',dict(restore,ls_augment_rm_lock_clock_seconds='1',ls_augment_rm_lock_clock_font='font:'+font,ls_augment_rm_lock_clock_scale='0.5'))
    lock_wake();capture(P+'before')
    open_system_group(P+'open','锁屏增强');row_button(P+'font-menu','锁屏时钟字体文件');tap(P+'restore-action','恢复原厂字体')
    time.sleep(.7);raw=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',root=True)
    (folder/'after-menu-preferences-private.xml').write_text(raw,encoding='utf-8')
    check('menu-clears-imported-reference',setting('rm_lock_clock_font')=='','Real menu; empty XML string normalized to empty text')
    lock_wake();r=capture(P+'after');c=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    check('restored-clock-remains-complete',c['text'].count(':')==2,clock_layout(P+'after','LockScreenClockDefault',c['text']))
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
