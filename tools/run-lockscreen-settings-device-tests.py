"""Walk the 17 lockscreen settings through real Android controls."""
import sys,hashlib
from module_ui_helpers import *
from adb_regression import instrument,adb
from lockscreen_device_helpers import lock_wake,capture,clock_layout
from statusbar_device_helpers import require_systemui_build

P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith(('ls_augment_rm_lock_clock_','ls_augment_rm_lock_charge_','ls_augment_rm_charging_')) or k=='ls_augment_rm_keyguard_statusbar_hide'}
fontBytes=adb('exec-out','cat /system/fonts/NotoSerif-Regular.ttf');fontHash=hashlib.sha256(fontBytes).hexdigest()
fontName='LSA-'+P+'font.ttf';remote='/sdcard/Download/'+fontName
fontPath=folder/fontName;fontPath.write_bytes(fontBytes)
fontStored='/data/user/0/ls.augment.com/files/fonts/'+fontHash+'.font'
existed=shell('test -f '+fontStored+' && echo present || true',root=True)=='present'
(folder/'font-ownership.json').write_text(json.dumps({'hash':fontHash,'storedFileExisted':existed,'stagedDownload':remote},indent=2),encoding='utf-8')
adb('push',fontPath,remote)

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def saved(key,value):
    for _ in range(12):
        if setting('rm_'+key)==str(value):return True
        time.sleep(.3)
    return False

def toggle(title,key,value=1,up=False):
    root,found=find(P+key,title,up);assert found[0].get('class')=='android.widget.Switch'
    if (found[0].get('checked')=='true')!=bool(value):tap_node(P+key+'-tap',found[0])
    check(key+'-'+str(value),saved(key,value),'Real switch')

def entry(title,key,value):
    row_button(P+key,title);replace_dialog_value(P+key+'-value',str(value));tap(P+key+'-save','保存')
    check(key,saved(key,value),'Real entry saved '+str(value))

def choose_font():
    row_button(P+'font-menu','锁屏时钟字体文件');tap(P+'font-picker','选择字体文件')
    root=hierarchy(P+'picker-open')
    if not matches(root,fontName):
        drawer=matches(root,'显示根目录')
        if drawer:
            tap_node(P+'picker-roots',drawer[0]);tap(P+'picker-downloads','下载')
    tap(P+'font-file',fontName)
    check('lock_clock_font',saved('lock_clock_font','font:'+fontHash),'Selected the real font file through Android picker')
    stored=adb('exec-out','su -c '+shlex.quote('cat '+fontStored))
    check('imported-font-byte-exact',stored==fontBytes,{'sha256':fontHash})

try:
    require_systemui_build(folder.name);instrument('set',P+'baseline-config',restore);open_system_group(P+'open','锁屏增强')
    toggle('隐藏锁屏顶部状态栏','keyguard_statusbar_hide')
    toggle('锁屏大时钟显示秒','lock_clock_seconds')
    toggle('锁屏大时钟显示中文时段','lock_clock_period')
    choose_font()
    entry('锁屏时钟字体比例','lock_clock_scale','0.5')
    row_button(P+'scale-invalid','锁屏时钟字体比例');replace_dialog_value(P+'scale3','3');tap(P+'scale3-save','保存')
    root=hierarchy(P+'scale-rejected');check('scale-out-of-range',setting('rm_lock_clock_scale')=='0.5' and any(n.get('text','').startswith('请输入有效值') for n in root.iter('node')),'3 rejected; 0.5 retained')
    tap(P+'scale-cancel','取消')
    toggle('自定义充电动画','charging_animation')
    toggle('每次亮屏显示充电动画','charging_every_wake')
    entry('充电动画持续秒数','charging_duration',120)
    entry('充电动画延迟秒数','charging_delay',60)
    toggle('自定义充电动画','charging_animation',0,True)
    toggle('锁屏显示充电详情','lock_charge_details')
    for key,title in [('temperature','温度'),('current','电流'),('voltage','电压'),('power','功率')]:
        toggle('充电详情隐藏'+title,'lock_charge_hide_'+key)
        toggle('充电详情隐藏'+title,'lock_charge_hide_'+key,0)
    entry('充电详情字号','lock_charge_text_size',18)
    entry('充电详情行间距','lock_charge_line_gap',10)
    entry('充电详情刷新间隔（秒）','lock_charge_interval',5)
    lock_wake();r=capture(P+'actual-lockscreen');assert r['keyguard'] and r['awake']
    clock=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    layout=clock_layout(P+'actual-lockscreen','LockScreenClockDefault',clock['text'])
    check('ui-settings-rendered-clock',clock['text'].count(':')==2 and any(n.get('id')=='com.android.systemui:id/am_pm' for n in r['visible']),layout)
    detail=[n['text'] for n in r['visible'] if n.get('id')=='null' and 'mA' in n.get('text','')]
    check('ui-settings-rendered-charge',len(detail)==1 and all(unit in detail[0] for unit in ['°C','mA','V','W']),detail)
    open_system_group(P+'restore-font-open','锁屏增强')
    row_button(P+'restore-font-menu','锁屏时钟字体文件');tap(P+'restore-font-action','恢复原厂字体')
    check('restore-font-menu-clears-import',saved('lock_clock_font',''),'Actual restore menu after a successful file import')
    lock_wake();r=capture(P+'restored-font-lockscreen')
    clock=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    check('restored-font-clock-still-complete',clock['text'].count(':')==2,clock_layout(P+'restored-font-lockscreen','LockScreenClockDefault',clock['text']))
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
    shell('rm -f '+shlex.quote(remote))
