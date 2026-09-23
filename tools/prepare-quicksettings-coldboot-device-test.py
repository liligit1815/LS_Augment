"""Prepare retained settings and perform one real reboot before the checks."""
import sys,json,time
from adb_regression import OUTPUT,adb,shell
from statusbar_device_helpers import configure
from quicksettings_device_helpers import capture
P=sys.argv[1]
folder=OUTPUT/(P+'coldboot');folder.mkdir(exist_ok=True)
def state():
    return {'at':shell('date -Iseconds'),'bootId':shell('cat /proc/sys/kernel/random/boot_id'),'uptime':shell('cat /proc/uptime'),'tiles':shell('settings get secure sysui_qs_tiles')}
shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.7)
shell('settings put system use_control_panel 1',root=True);shell('wm user-rotation lock 0')
configure(P+'before-config',{'rm_qs_grid':'1','rm_qs_columns':'8','rm_qs_rows':'1','rm_qs_land_columns':'10','rm_qs_land_rows':'1','rm_qs_edit_columns':'8','rm_qs_land_edit_columns':'10','rm_qs_carrier':'1','rm_qs_search':'1','rm_qs_calendar':'1','rm_qs_browser':'com.android.settings','rm_qs_clock_seconds':'1','rm_qs_clock_period':'1'})
capture(P+'before-boot')
(folder/'before-state.json').write_text(json.dumps(state(),ensure_ascii=False,indent=2),encoding='utf-8')
adb('reboot');print('Real reboot requested; waiting for boot completion.',flush=True)
for i in range(90):
    time.sleep(1)
    try:
        if shell('getprop sys.boot_completed',timeout=5)=='1':break
    except Exception:pass
else:raise RuntimeError('Boot not completed within observation window')
time.sleep(5);shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
(folder/'after-state.json').write_text(json.dumps(state(),ensure_ascii=False,indent=2),encoding='utf-8')
print('Boot completed and before/after boot identifiers retained.',flush=True)
