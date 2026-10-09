"""Install an explicitly selected, verified candidate and reload only SystemUI.

No uninstall, data clearing, reboot, native preference writes, or rollback.
Retain pre/post configuration and the actually loaded process identity.
"""
from pathlib import Path
import argparse
import contextlib
import hashlib
import json
import re
import time
import traceback
import xml.etree.ElementTree as ET
import adb_regression as ar

ROOT=ar.ROOT
AUDIT=ROOT/'out/full-function-audit-20261004'


def write(path,data):
    path.write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')


def require_capture_idle():
    projection=ar.shell('dumpsys media_projection')
    if not ar.projection_is_idle(projection):
        raise RuntimeError('Projection is active or not confirmed idle; SystemUI was not reloaded')
    for key in ('record_screen_state','cn.zte.recorder.recording_state'):
        if ar.shell('settings get global '+key) not in ('null','0'):
            raise RuntimeError('Preserve the active native recorder; SystemUI was not reloaded')


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--version',type=int,required=True)
    parser.add_argument('--apk',type=Path,required=True)
    parser.add_argument('--test-apk',type=Path,required=True)
    args=parser.parse_args()
    apk=args.apk.resolve();test_apk=args.test_apk.resolve()
    verification=json.loads(apk.with_suffix('.verification.json').read_text(encoding='utf-8'))
    digest=hashlib.sha256(apk.read_bytes()).hexdigest()
    if verification.get('versionCode')!=args.version or verification.get('apkSha256')!=digest or not verification.get('signatureVerified') or not verification.get('alignmentVerified'):
        raise RuntimeError('Release verification does not match the exact candidate bytes')
    test_digest=hashlib.sha256(test_apk.read_bytes()).hexdigest()
    for path in AUDIT.rglob('restore.json'):
        if json.loads(path.read_text(encoding='utf-8')).get('pending'):
            raise RuntimeError('Restore pending device changes first: '+str(path))
    leases=ar.shell('for p in /data/local/tmp/duo-wifi-assets-collector /data/local/tmp/duo-summary-assets-collector; do if [ -e "$p" ]; then echo "$p"; fi; done')
    if leases:raise RuntimeError('A device collector lease remains: '+leases)
    require_capture_idle()
    activities=ar.shell('dumpsys activity activities')
    if re.search(r'mActiveInstrumentation.*ls\.augment',activities):raise RuntimeError('Another module instrumentation is active')
    old_dump=ar.shell('dumpsys package ls.augment.com')
    match=re.search(r'\bversionCode=(\d+)',old_dump)
    if not match or int(match[1])!=verification['previousVersionCode']:
        raise RuntimeError('Installed module is not the verified preceding candidate')
    old_pid=ar.shell('pidof com.android.systemui')
    if not re.fullmatch(r'[1-9][0-9]*',old_pid):raise RuntimeError('SystemUI is not a unique running process')
    folder=AUDIT/('deploy-'+str(args.version));folder.mkdir(exist_ok=False);ar.OUTPUT=folder
    report={'installedVersion':None,'requestedVersion':args.version,'apkSha256':digest,
            'testApkSha256':test_digest,'oldSystemUiPid':old_pid,'status':'preflight'}
    def persist():write(folder/'result.json',report)
    def snapshot(label):
        with (folder/(label+'-console.txt')).open('w',encoding='utf-8') as out:
            with contextlib.redirect_stdout(out):return ar.instrument('snapshot',label)
    before=snapshot('before');boot=ar.shell('settings get global boot_count');persist()
    try:
        for label,path in [('module',apk),('instrumentation',test_apk)]:
            result=ar.adb('install','-r',str(path),timeout=150).decode('utf-8','replace')
            (folder/(label+'-install.txt')).write_text(result,encoding='utf-8')
            if 'Success' not in result:raise RuntimeError(label+' install did not report success')
            report['status']=label+'-installed';persist()
        current_dump=ar.shell('dumpsys package ls.augment.com')
        if not re.search(r'\bversionCode='+str(args.version)+r'\b',current_dump):raise RuntimeError('Installed version readback mismatch')
        report['installedVersion']=args.version
        current_pid=ar.shell('pidof com.android.systemui')
        if not re.fullmatch(r'[1-9][0-9]*',current_pid):raise RuntimeError('Cannot identify SystemUI for reload')
        require_capture_idle()
        report['reloadedSystemUiPid']=current_pid;report['status']='reloading-systemui';persist()
        ar.shell('kill -TERM '+current_pid,root=True)
        expected_name=verification['versionName'];loaded=None
        for attempt in range(50):
            time.sleep(.6)
            pid=ar.shell('pidof com.android.systemui')
            if not re.fullmatch(r'[1-9][0-9]*',pid) or pid==current_pid:continue
            raw=ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml',root=True)
            try:tree=ET.fromstring(raw)
            except ET.ParseError:continue
            for element in tree:
                if element.tag!='string' or not element.text:continue
                try:item=json.loads(element.text)
                except ValueError:continue
                if item.get('process')=='com.android.systemui' and str(item.get('pid'))==pid and item.get('moduleVersion')==expected_name and item.get('moduleLoaded') and str(item.get('receivedBoot'))==boot:
                    loaded={key:item.get(key) for key in ('process','pid','moduleVersion','moduleLoaded','receivedBoot','processStartedElapsed','moduleLoadedElapsed')}
            if loaded:break
        if loaded is None:raise RuntimeError('New SystemUI has not confirmed the installed candidate')
        report['loadedSystemUi']=loaded
        after=snapshot('after')
        if after.get('moduleVersion')!=args.version:raise RuntimeError('Installed test APK version mismatch')
        differences={key:{'before':before['settings'].get(key),'after':after['settings'].get(key)} for key in before['settings'].keys()|after['settings'].keys() if before['settings'].get(key)!=after['settings'].get(key)}
        report['configurationDifferences']=differences
        report['configurationUnchanged']=not differences
        if differences:raise RuntimeError('Configuration differs after deployment; no automatic overwrite was attempted')
        report['status']='installed-and-systemui-loaded';persist()
        print(json.dumps(report,ensure_ascii=False))
    except BaseException:
        report['error']=traceback.format_exc();persist();raise


if __name__=='__main__':main()
