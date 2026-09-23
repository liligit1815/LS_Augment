"""Use actual settings controls for icon details/scopes and checkbox save/cancel."""
import sys
from module_ui_helpers import *
from adb_regression import instrument
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings']
suffixes=['hide_wifi_activity','hide_wifi_standard','ignore_system_icon_hide','hide_wifi_scope','hide_hotspot_scope','hide_mobile_scope','hidden_icon_slots','statusbar_double_tap_sleep','statusbar_hide']
restore={'ls_augment_rm_'+k:base['ls_augment_rm_'+k] for k in suffixes}
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(out/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def saved(key,value):
    for _ in range(12):
        if setting('rm_'+key)==str(value):return True
        time.sleep(.2)
    return False
def toggle(title,key,value,up=False):
    root,found=find(P+key+'-'+str(value),title,up);n=found[0];assert n.get('class')=='android.widget.Switch'
    if (n.get('checked')=='true')!=bool(value):tap_node(P+key+'-'+str(value)+'-tap',n)
    check(key+'-'+str(value),saved(key,value),'Actual switch and persisted setting; hardware effect is tracked separately')
try:
    require_systemui_build(P+'loaded');zero={k:'0' for k in restore};zero['ls_augment_rm_hidden_icon_slots']='';instrument('set',P+'native-config',zero)
    open_system_group(P+'open','状态栏细节')
    for key,title in [('hide_wifi_activity','隐藏 Wi-Fi 收发箭头'),('hide_wifi_standard','隐藏 Wi-Fi 标准数字'),('ignore_system_icon_hide','忽略系统图标隐藏限制')]:
        toggle(title,key,1);toggle(title,key,0)
    choices=['遵循原厂','主屏状态栏','锁屏状态栏','通知栏头部','通知栏内控制中心','独立控制中心','全部位置']
    for key,title in [('hide_wifi_scope','隐藏 Wi-Fi 图标的位置'),('hide_hotspot_scope','隐藏热点图标的位置'),('hide_mobile_scope','隐藏移动网络图标的位置')]:
        for value in [1,2,3,4,5,6,0]:
            row_button(P+key+'-'+str(value),title);tap(P+key+'-choose'+str(value),choices[value]);check(key+'-'+str(value),saved(key,value),'Actual single-choice dialog; no-SIM mobile effect remains user-deferred')
    row_button(P+'icons-all','其他隐藏图标')
    labels=['闹钟','蓝牙','勿扰模式','耳机','VPN','定位','飞行模式','投屏','旋转锁定','热点','NFC']
    slots=['alarm_clock','bluetooth','zen','headset','vpn','location','airplane','cast','rotate','hotspot','nfc']
    for title in labels:tap(P+'icons-check-'+str(labels.index(title)),title)
    tap(P+'icons-save','保存');time.sleep(.5)
    check('all-icon-choices-save',set(setting('rm_hidden_icon_slots').split(','))==set(slots),'All11 actual checkboxes save exact native slots')
    row_button(P+'icons-cancel','其他隐藏图标');tap(P+'icons-cancel-change','蓝牙');tap(P+'icons-cancel-dismiss','取消')
    check('icon-checkbox-cancel',set(setting('rm_hidden_icon_slots').split(','))==set(slots),'Cancel retains previously saved selection')
    row_button(P+'icons-clear','其他隐藏图标')
    for title in labels:tap(P+'icons-uncheck-'+str(labels.index(title)),title)
    tap(P+'icons-clear-save','保存');check('icon-checkbox-clear',saved('hidden_icon_slots',''),'Clear and save restores empty list')
    for key,title in [('statusbar_double_tap_sleep','双击状态栏锁屏'),('statusbar_hide','隐藏状态栏内容')]:
        toggle(title,key,1);toggle(title,key,0)
finally:
    instrument('set',P+'restore',restore)
