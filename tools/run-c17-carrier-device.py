"""Observe independent native carrier text and second updates; restore touched values."""
import json,re,time,traceback
import adb_regression as ar
import native_ui_helpers as ui

version=re.search(r'\bversionCode=(\d+)',ar.shell('dumpsys package ls.augment.com'))[1]
OUT=ar.ROOT/('out/full-function-audit-20261004/carrier-'+version+'-'+time.strftime('%H%M%S'))
OUT.mkdir(parents=True,exist_ok=False);ar.OUTPUT=ui.OUTPUT=OUT
base=ar.instrument('snapshot','baseline')['settings'];restore={};cases=[];error=None

def configure(label,values):
    for key in values:restore.setdefault(key,base[key])
    (OUT/'restore.json').write_text(json.dumps(restore,ensure_ascii=False,indent=2),encoding='utf-8')
    ar.instrument('set',label,values)

def capture(label,surface,opening=True):
    if opening:
        ar.shell('cmd statusbar collapse');ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard')
        if surface=='lock':
            ar.shell('input keyevent 223');time.sleep(.5);ar.shell('input keyevent 224')
        else:
            ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
            time.sleep(.8);ar.shell('cmd statusbar collapse');time.sleep(.4)
            if surface=='control':ar.shell('cmd statusbar expand-settings')
            else:ar.shell('input swipe 180 5 180 1800 650')
    time.sleep(.8)
    windows=ui.all_windows(label);nodes=[n for n in ui.nodes(windows) if n.get('visible')]
    carriers=[{k:n.get(k) for k in ('id','text','bounds','class')} for n in nodes if 'carrier' in n.get('id','').lower()]
    (OUT/label/'screen.png').write_bytes(ar.adb('exec-out','screencap -p'))
    ids={n.get('id') for n in nodes}
    locked='com.android.systemui:id/keyguard_status_view' in ids
    confirmed=locked if surface=='lock' else not locked and ('com.android.systemui:id/control_panel' in ids if surface=='control' else 'com.android.systemui:id/notification_stack_scroller' in ids and 'com.android.systemui:id/cc_header' in ids)
    item={'label':label,'surface':surface,'surfaceConfirmed':confirmed,'carrierNodes':carriers,'actualTime':ar.shell('date +%H:%M:%S')}
    cases.append(item);print(json.dumps(item,ensure_ascii=False),flush=True)
    if not confirmed:raise AssertionError('Expected native surface did not remain open: '+surface)
    return item

try:
    for panel in ('notification','control','lock'):capture('baseline-'+panel,panel)
    values={}
    for panel in ('notification','control','lock'):
        p='ls_augment_carrier_'+panel+'_';values.update({p+'enabled':'1',p+'mode':'1',p+'text':'DUO '+panel.upper(),p+'size':'13'})
    configure('fixed-text',values)
    for panel in ('notification','control','lock'):capture('fixed-'+panel,panel)
    values={}
    for panel in ('notification','control','lock'):
        p='ls_augment_carrier_'+panel+'_';values.update({p+'mode':'2',p+'pattern':"'"+panel[:1].upper()+" 'HH:mm:ss"})
    configure('seconds',values)
    for panel in ('notification','control','lock'):
        capture('clock-'+panel+'-a',panel);time.sleep(1.25);capture('clock-'+panel+'-b',panel,False)
    configure('long-lock',{'ls_augment_carrier_lock_mode':'1','ls_augment_carrier_lock_text':'锁屏长文字边界验证 '+('红魔Duo '*12),'ls_augment_carrier_lock_size':'40'})
    capture('long-lock','lock')
    configure('disabled',{f'ls_augment_carrier_{p}_enabled':'0' for p in ('notification','control','lock')})
    for panel in ('notification','control','lock'):capture('disabled-'+panel,panel)
except Exception:error=traceback.format_exc()
finally:
    restored=False;recovery=[]
    try:
        ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard');ar.shell('cmd statusbar collapse')
        if restore:ar.instrument('set','restore',restore)
        final=ar.instrument('snapshot','restored')['settings'];restored=all(final.get(k)==v for k,v in restore.items())
    except Exception:recovery.append(traceback.format_exc())
    (OUT/'report.json').write_text(json.dumps({'installedVersion':version,'cases':cases,'error':error,'recoveryErrors':recovery,'configurationRestored':restored,'visualReviewRequired':True,'scope':'Only actually visible native carrier nodes; hidden native positions are not a visual pass.'},ensure_ascii=False,indent=2),encoding='utf-8')
if error or recovery or not restored:raise RuntimeError('Carrier collection incomplete: '+str(OUT/'report.json'))
