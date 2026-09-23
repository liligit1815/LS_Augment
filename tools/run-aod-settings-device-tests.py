"""All five AOD settings through real controls, font picker and restore menu."""
import sys,hashlib
from module_ui_helpers import *
from adb_regression import instrument,adb
from aod_device_helpers import select_native,restore_native,sleep_sample,complete,RESTORE
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
data=adb('exec-out','cat /system/fonts/NotoSerif-Regular.ttf');digest=hashlib.sha256(data).hexdigest()
name='LSA-'+P+'font.ttf';local=folder/name;local.write_bytes(data);remote='/sdcard/Download/'+name
stored='/data/user/0/ls.augment.com/files/fonts/'+digest+'.font'
(folder/'font-ownership.json').write_text(json.dumps({'storedFileExisted':shell('test -f '+stored+' && echo yes',root=True)=='yes','sha256':digest,'stagedDownload':remote},indent=2),encoding='utf-8')
adb('push',local,remote)
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def saved(key,value):
    for _ in range(10):
        if setting('rm_aod_'+key)==str(value):return True
        time.sleep(.3)
    return False
def entry(title,key,value):
    row_button(P+key,title);replace_dialog_value(P+key+'value',str(value));tap(P+key+'save','保存');check(key,saved(key,value),'Actual numeric control')
try:
    select_native(6,P+'style');instrument('set',P+'baseline',RESTORE);open_system_group(P+'open','息屏显示')
    for key,title in [('seconds','息屏时钟显示秒'),('period','息屏时钟显示中文时段')]:
        root,found=find(P+key,title);assert found[0].get('class')=='android.widget.Switch'
        if found[0].get('checked')!='true':tap_node(P+key+'tap',found[0])
        check(key,saved(key,1),'Actual switch')
    entry('息屏时段字号比例','period_scale','0.3');entry('息屏时段字号比例','period_scale','1.5')
    row_button(P+'font-menu','息屏时钟字体');tap(P+'font-select','选择字体文件');root=hierarchy(P+'picker')
    if not matches(root,name):
        drawer=matches(root,'显示根目录')
        if drawer:tap_node(P+'roots',drawer[0]);tap(P+'downloads','下载')
    tap(P+'font-file',name);check('font-import',saved('clock_font','font:'+digest),'Actual system font picker')
    check('font-byte-exact',adb('exec-out','su -c '+shlex.quote('cat '+stored))==data,digest)
    entry('息屏时钟字体比例','clock_scale','0.5');entry('息屏时钟字体比例','clock_scale','2.0')
    row_button(P+'invalid','息屏时钟字体比例');replace_dialog_value(P+'invalid-value','2.1');tap(P+'invalid-save','保存')
    root=hierarchy(P+'invalid-result');check('out-of-range-stays-open',setting('rm_aod_clock_scale')=='2.0' and any(n.get('text','').startswith('请输入有效值') for n in root.iter('node')),'2.1 rejected; 2.0 retained');tap(P+'invalid-cancel','取消')
    r=sleep_sample(P+'actual');check('five-ui-settings-rendered',bool(r['clocks']) and complete(r) and any(v['text'].count(':')==2 and ' ' in v['text'] for v in r['clocks'].values()),r['clocks'])
    open_system_group(P+'restore-open','息屏显示');row_button(P+'restore-font-menu','息屏时钟字体');tap(P+'restore-font','恢复原厂字体')
    check('font-restore-menu',saved('clock_font',''),'Actual restore action')
    r=sleep_sample(P+'font-cleared');check('font-restore-rendered',complete(r),r['clocks'])
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard');shell('rm -f '+shlex.quote(remote))
