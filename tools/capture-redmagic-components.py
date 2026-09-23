"""Read-only device component capture; never reads app user data or installs anything."""
import argparse, hashlib, json, re, subprocess
from pathlib import Path

PACKAGES = [
    'com.android.systemui', 'cn.nubia.gamelauncher', 'cn.nubia.gameassist',
    'cn.zte.gamefloat', 'cn.nubia.gamehighlights', 'cn.nubia.gamehelpmodule',
    'com.zte.game.plugintrigger', 'com.android.settings', 'com.android.packageinstaller',
    'com.zte.zdm', 'com.zte.beautify', 'com.zte.mifavor.weather',
    'com.android.permissioncontroller', 'com.google.android.permissioncontroller',
    'com.android.nfc', 'com.google.android.nfc', 'cn.nubia.filebrowser',
    'com.android.ztescreenshot', 'com.zte.mifavor.launcher',
]

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--adb',required=True)
    parser.add_argument('--output',required=True)
    args=parser.parse_args()
    dest=Path(args.output).resolve();dest.mkdir(parents=True,exist_ok=True)
    def adb(*parts):
        return subprocess.check_output([args.adb,*parts],timeout=90).decode('utf-8','replace').strip()
    devices=adb('devices')
    if len(re.findall(r'^\S+\s+device$',devices,re.M))!=1:
        raise SystemExit('Exactly one authorized device is required.')
    report={'build':{},'packages':{},'framework':{}}
    for prop in ['ro.product.model','ro.build.display.id','ro.build.version.sdk','ro.build.fingerprint']:
        report['build'][prop]=adb('shell','getprop',prop)
    for package in PACKAGES:
        path_result=subprocess.run([args.adb,'shell','pm','path',package],capture_output=True,timeout=90)
        paths=[p[8:] for p in path_result.stdout.decode('utf-8','replace').splitlines() if p.startswith('package:')]
        if not paths:
            report['packages'][package]={'present':False};continue
        dump=adb('shell','dumpsys','package',package)
        entry={'present':True,'versionCode':re.findall(r'versionCode=(\d+)',dump)[:1],
               'versionName':re.findall(r'versionName=([^\r\n]+)',dump)[:1],'files':[]}
        for index,remote in enumerate(paths):
            local=dest/(package+('' if index==0 else '-split'+str(index))+'.apk')
            digest=hashlib.sha256(local.read_bytes()).hexdigest() if local.is_file() else ''
            remote_digest=adb('shell','sha256sum',remote).split()[0]
            if digest!=remote_digest:
                subprocess.run([args.adb,'pull',remote,str(local)],check=True,capture_output=True,timeout=120)
            entry['files'].append({'file':local.name,'sha256':hashlib.sha256(local.read_bytes()).hexdigest()})
        report['packages'][package]=entry
        (dest/'manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
        print(package,entry['versionCode'],flush=True)
    for remote in ['/system/framework/services.jar','/system/framework/framework.jar',
                   '/apex/com.android.wifi/javalib/service-wifi.jar','/apex/com.android.bt/javalib/service-bluetooth.jar']:
        local=dest/Path(remote).name
        result=subprocess.run([args.adb,'pull',remote,str(local)],capture_output=True,timeout=120)
        report['framework'][remote]={'captured':result.returncode==0}
        if result.returncode==0:
            report['framework'][remote].update(file=local.name,sha256=hashlib.sha256(local.read_bytes()).hexdigest())
        print(remote,result.returncode,flush=True)
    (dest/'manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    print('Capture complete:',dest,flush=True)

if __name__=='__main__':main()
