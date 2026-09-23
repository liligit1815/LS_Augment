"""Check real migrated-setting dialogs, including recovery after rejected input."""
from module_ui_helpers import *
from adb_regression import instrument

folder=OUTPUT/'round16b-battery-ui-results';folder.mkdir(exist_ok=True)
results=[]

def check(name,condition,evidence):
    results.append({'case':name,'pass':bool(condition),'evidence':evidence})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(results[-1],flush=True);assert condition,results[-1]

instrument('set','round16b-ui-baseline',{'ls_augment_rm_battery_width_dp':'0','ls_augment_rm_battery_charging_color':'#FF34C759'})
open_system_group('round16b-ui-battery','状态栏细节')
row_button('round16b-ui-width','电池固定宽度')
replace_dialog_value('round16b-ui-width100','100');tap('round16b-ui-save100','保存');time.sleep(1)
check('valid-width',setting('rm_battery_width_dp')=='100','round16b-ui-save100-before')
row_button('round16b-ui-width-invalid','电池固定宽度')
replace_dialog_value('round16b-ui-width121','121');tap('round16b-ui-save121','保存')
root=hierarchy('round16b-ui-width-rejected')
error=[n for n in root.iter('node') if visible(n) and n.get('text','').startswith('请输入有效值')]
check('invalid-width-rejected',setting('rm_battery_width_dp')=='100' and len(error)==1,'round16b-ui-width-rejected')
tap('round16b-ui-width-cancel','取消');time.sleep(.5)
root=hierarchy('round16b-ui-width-cancelled')
check('one-tap-cancel-after-error',not any(n.get('resource-id')=='android:id/alertTitle' for n in root.iter('node')),'round16b-ui-width-cancelled')
row_button('round16b-ui-width-reset','电池固定宽度');tap('round16b-ui-width-default','恢复默认');time.sleep(1)
check('width-default-restored',setting('rm_battery_width_dp')=='0','round16b-ui-width-default-before')
row_button('round16b-ui-chargecolor','充电时电池颜色')
replace_dialog_value('round16b-ui-chargecolor-bad','invalid');tap('round16b-ui-chargecolor-savebad','保存')
hierarchy('round16b-ui-chargecolor-rejected')
check('invalid-color-rejected',setting('rm_battery_charging_color')=='#FF34C759','round16b-ui-chargecolor-rejected')
replace_dialog_value('round16b-ui-chargecolor-good','#80FF00FF');tap('round16b-ui-chargecolor-save','保存');time.sleep(1)
check('corrected-color-saved',setting('rm_battery_charging_color')=='#80FF00FF','round16b-ui-chargecolor-save-before')
row_button('round16b-ui-chargecolor-default','充电时电池颜色');tap('round16b-ui-chargecolor-restore','恢复默认');time.sleep(1)
check('color-default-restored',setting('rm_battery_charging_color')=='#FF34C759','round16b-ui-chargecolor-restore-before')
print('Seven actual settings-dialog boundary, cancel and restoration cases passed')
