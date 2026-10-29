"""Build an upgrade APK only after checking version +1 and the historical signer."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
from java_properties import read_properties

ROOT=Path(__file__).resolve().parents[1]
CERT='4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb'
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--previous',type=Path,required=True,help='Previous distributed release APK')
    args=parser.parse_args()
    props=read_properties(ROOT/'android/local.properties')
    sdk=Path(props['sdk.dir']);build=sdk/'build-tools/35.0.0'
    signer=build/('apksigner.bat' if os.name=='nt' else 'apksigner')
    aapt=build/('aapt2.exe' if os.name=='nt' else 'aapt2')
    def output(*command):return subprocess.check_output(list(map(str,command)),cwd=ROOT,encoding='utf-8',errors='replace')
    def certificate(apk):
        data=output(signer,'verify','--print-certs',apk)
        matches=re.findall(r'Signer #\d+ certificate SHA-256 digest: ([0-9a-f]+)',data)
        if matches!=[CERT]:raise RuntimeError('APK does not match the historical release signing certificate')
        return matches[0]
    def version(apk):
        match=re.search(r"package: name='ls.augment.com' versionCode='(\d+)' versionName='([^']+)'",output(aapt,'dump','badging',apk))
        if not match:raise RuntimeError('Unexpected APK package identity')
        return int(match[1]),match[2]
    previous=args.previous.resolve();certificate(previous);previous_code,_=version(previous)
    configured=dict(line.split('=',1) for line in (ROOT/'android/version.properties').read_text().splitlines() if '=' in line and not line.startswith('#'))
    code=int(configured['versionCode']);name=configured['versionName']
    if code!=previous_code+1:raise RuntimeError(f'versionCode must be previous release +1 ({previous_code+1})')
    if not name.endswith(f'-test{code}'):raise RuntimeError('versionName does not match versionCode')
    log=ROOT/'audit-output'/f'build-release-{code}.log';log.parent.mkdir(exist_ok=True)
    gradle=ROOT/'android'/('gradlew.bat' if os.name=='nt' else 'gradlew')
    with log.open('w',encoding='utf-8') as stream:
        subprocess.run([str(gradle),'-p','android',':app:assembleRelease','--offline','--console=plain'],cwd=ROOT,stdout=stream,stderr=subprocess.STDOUT,check=True)
    apk=ROOT/'android/app/build/outputs/apk/release/app-release.apk'
    # Refuse a stale scope resource before copying anything into the distributed release directory.
    subprocess.run([sys.executable,str(ROOT/'tools/check-modern-xposed.py'),str(apk)],cwd=ROOT,check=True)
    certificate(apk)
    if version(apk)!=(code,name):raise RuntimeError('Built APK version does not match version.properties')
    zipalign=build/('zipalign.exe' if os.name=='nt' else 'zipalign')
    output(zipalign,'-c','-P','16','4',apk)
    dest=ROOT/'out'/f'RedMagicDuo-v{name}-release.apk';dest.parent.mkdir(exist_ok=True)
    shutil.copy2(apk,dest)
    sha=hashlib.sha256(dest.read_bytes()).hexdigest()
    dest.with_suffix('.apk.sha256').write_text(sha+'  '+dest.name+'\n',encoding='utf-8')
    dest.with_suffix('.verification.json').write_text(json.dumps({'package':'ls.augment.com','versionCode':code,'versionName':name,'previousVersionCode':previous_code,'certificateSha256':CERT,'apkSha256':sha,'signatureVerified':True,'alignmentVerified':True},ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print('Verified release:',dest)
    print('Version:',name,'('+str(code)+')')
    print('Historical signing certificate:',CERT)
    print('APK SHA256:',sha)
if __name__=='__main__':main()
