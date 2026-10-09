"""Run real settings-page controls in a declared display profile and restore that profile."""
import argparse, json, re, time
import adb_regression as ar
p=argparse.ArgumentParser();p.add_argument('--landscape',action='store_true');p.add_argument('--font-scale',type=float,default=1.0);a=p.parse_args()
assert .8<=a.font_scale<=2
version=re.search(r'versionCode=(\d+)',(ar.ROOT/'android/version.properties').read_text())[1]
label=f'c17-ui-{version}-'+('landscape' if a.landscape else 'portrait')+'-font'+str(a.font_scale)
OUT=ar.ROOT/'out/full-function-audit-20261004'/label;OUT.mkdir(parents=True,exist_ok=True)
original=ar.shell('settings get system font_scale'); (OUT/'display-restore.json').write_text(json.dumps({'font_scale':original}),encoding='utf-8')
result='';error=''
try:
    ar.shell('settings put system font_scale '+str(a.font_scale));ar.shell('input keyevent 224');ar.shell('wm dismiss-keyguard')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    command='am instrument -w -r -e operation c17-enhancement-ui -e label '+label+' -e c17_expected_font_scale '+str(a.font_scale)
    if a.landscape:command+=' -e c17_landscape true'
    command+=' ls.augment.com.test/ls.augment.com.DeviceRegressionRunner'
    result=ar.shell(command,timeout=600)
    (OUT/'instrumentation.txt').write_text(result,encoding='utf-8')
    assert 'status=pass' in result,result
except Exception as failure:
    error=str(failure);raise
finally:
    # Recover the UI test's durable settings backup if a process failed mid-page.
    try:
        exists=ar.shell('if test -f /data/user/0/ls.augment.com/files/c17-enhancement-ui-baseline.json; then echo present; else echo absent; fi',root=True)
        if exists=='present':
            ar.shell('am force-stop ls.augment.com')
            recovered=ar.shell('am instrument -w -r -e operation c17-enhancement-ui-restore ls.augment.com.test/ls.augment.com.DeviceRegressionRunner',timeout=60)
            (OUT/'recovery.txt').write_text(recovered,encoding='utf-8');assert 'status=pass' in recovered
    finally:
        if original=='null':ar.shell('settings delete system font_scale')
        else:ar.shell('settings put system font_scale '+original)
    ar.adb('pull','/sdcard/Android/data/ls.augment.com/files/c17-enhancement-ui-'+version,str(OUT/'artifacts'))
    restored=ar.shell('settings get system font_scale')==original
    (OUT/'execution.json').write_text(json.dumps({'version':version,'fontScale':a.font_scale,'landscape':a.landscape,'displayRestored':restored,'error':error},ensure_ascii=False,indent=2),encoding='utf-8')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity');assert restored
print(label,'passed; display restored',flush=True)
