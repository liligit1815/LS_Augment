"""Walk every Control Center setting through its real Android control."""
from module_ui_helpers import *
from statusbar_device_helpers import configure
from quicksettings_device_helpers import capture

P='round19i-qs-settings-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
baseline=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in baseline.items() if k.startswith('ls_augment_rm_qs_')}
results=[]
def check(name,passed,detail):
    results.append({'case':name,'pass':bool(passed),'detail':detail})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(results[-1],flush=True);assert passed,results[-1]
def saved(key,value):
    for _ in range(12):
        if setting('rm_qs_'+key)==str(value):return True
        time.sleep(.3)
    return False
def toggle(title,key):
    root,found=find(P+key,title);assert found[0].get('class')=='android.widget.Switch'
    assert found[0].get('checked')=='false'
    tap_node(P+key+'-tap',found[0]);check(key,saved(key,1),'Real switch saved enabled')
def number(title,key,value):
    row_button(P+key,title);replace_dialog_value(P+key+'-value',str(value));tap(P+key+'-save','保存')
    check(key,saved(key,value),'Real entry saved '+str(value))
def choice(title,key,label,value):
    row_button(P+key,title);tap(P+key+'-choose',label);check(key,saved(key,value),'Real choice saved '+label)
try:
    configure(P+'baseline',restore);open_system_group(P+'open','控制中心')
    toggle('自定义控制中心行列','grid')
    number('竖屏列数','columns',2)
    row_button(P+'columns-invalid','竖屏列数');replace_dialog_value(P+'columns9','9');tap(P+'columns9-save','保存')
    root=hierarchy(P+'columns-rejected')
    check('portrait-max-rejected',setting('rm_qs_columns')=='2' and any(n.get('text','').startswith('请输入有效值') for n in root.iter('node')),'9 rejected; previous valid 2 retained')
    tap(P+'columns-cancel','取消')
    root=hierarchy(P+'columns-cancelled');check('invalid-cancel',not any(n.get('resource-id')=='android:id/alertTitle' for n in root.iter('node')),'One tap exits invalid input dialog')
    number('竖屏行数','rows',1)
    number('横屏列数','land_columns',10)
    number('横屏行数','land_rows',6)
    number('磁贴编辑列数','edit_columns',8)
    number('横屏磁贴编辑列数','land_edit_columns',10)
    choice('运营商名称','carrier','显示',1)
    choice('搜索按钮','search','显示',1)
    toggle('点击日期打开默认日历','calendar')
    number('搜索按钮打开指定应用','browser','com.android.settings')
    toggle('下拉面板时钟显示秒','clock_seconds')
    toggle('下拉面板时钟显示中文时段','clock_period')
    effect=capture(P+'actual-panel')
    check('ui-settings-actual-grid',effect['columns']==2 and effect['rows']==1,{'columns':effect['columns'],'rows':effect['rows']})
    texts=[n.get('text','') for n in effect['header']]
    carrier=any(n['id'].endswith('header_carrier_text') and n.get('text') in ('没有 SIM 卡','无网络覆盖') for n in effect['header'])
    check('ui-settings-actual-header',any(t.count(':')==2 and any(p in t for p in ['凌晨','上午','下午','晚上','中午','早上','傍晚']) for t in texts) and carrier,{'headerTexts':texts})
finally:
    shell('cmd statusbar collapse');configure(P+'restore',restore)
