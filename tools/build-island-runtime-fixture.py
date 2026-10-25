"""Build the independent island fixture only when explicitly invoked. No ADB/installation.

--compile-only checks actual Android API usage without producing an APK.
"""
from pathlib import Path
import argparse, hashlib, json, os, subprocess, zipfile, uuid

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'tools/fixtures/island/IslandFixtureRunner.java'
MANIFEST='''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.island" android:versionCode="1" android:versionName="island-lifecycle-r2-controls">
 <uses-sdk android:minSdkVersion="35" android:targetSdkVersion="36"/>
 <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
 <instrumentation android:name="ls.augment.regression.island.IslandFixtureRunner" android:targetPackage="ls.augment.regression.island"/>
 <application android:label="Duo 灵动岛临时验证" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
  <activity android:name="ls.augment.regression.island.IslandFixtureRunner$BackgroundActivity" android:exported="false" android:excludeFromRecents="true"/>
  <activity android:name="ls.augment.regression.island.IslandFixtureRunner$ContentActivity" android:exported="false" android:excludeFromRecents="true"/>
 </application>
</manifest>'''

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compile-only',action='store_true')
    p.add_argument('--output',type=Path,default=ROOT/'out/island-runtime-fixture');a=p.parse_args()
    out=a.output.resolve();out.mkdir(parents=True,exist_ok=True)
    java=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
    sdk=ROOT/'audit-output/android-sdk';android=sdk/'platforms/android-36/android.jar'
    build=sdk/'build-tools/35.0.0';classes=out/('classes-'+uuid.uuid4().hex);classes.mkdir()
    env=dict(os.environ,JAVA_HOME=str(java.parent),PATH=str(java)+os.pathsep+os.environ.get('PATH',''))
    commands=[]
    def run(*args):
        r=subprocess.run(list(map(str,args)),env=env,capture_output=True)
        commands.append({'command':list(map(str,args)),'exitCode':r.returncode,'stdout':r.stdout.decode('utf-8','replace'),'stderr':r.stderr.decode('utf-8','replace')})
        (out/'commands.json').write_text(json.dumps(commands,ensure_ascii=False,indent=2),encoding='utf-8')
        if r.returncode:raise RuntimeError('Build step failed; inspect commands.json')
    sources=sorted(SOURCE.parent.glob('*.java'))
    run(java/'javac.exe','-J-Duser.language=en','-encoding','UTF-8','-source','17','-target','17','-cp',android,'-d',classes,*sources)
    source_hash=hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    source_hashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}
    if a.compile_only:
        (out/'compile-only.json').write_text(json.dumps({'source':str(SOURCE),'sourceSha256':source_hash,'sourceHashes':source_hashes,'apkBuilt':False,'phoneUsed':False,'exitCode':0},indent=2),encoding='utf-8');return
    manifest=out/'AndroidManifest.xml';manifest.write_text(MANIFEST,encoding='utf-8')
    run(build/'d8.bat','--lib',android,'--min-api','35','--output',out,*classes.rglob('*.class'))
    unsigned=out/'unsigned.apk';aligned=out/'aligned.apk';apk=out/'island-runtime-fixture.apk'
    run(build/'aapt2.exe','link','-o',unsigned,'-I',android,'--manifest',manifest)
    with zipfile.ZipFile(unsigned,'a') as z:z.write(out/'classes.dex','classes.dex')
    run(build/'zipalign.exe','-f','4',unsigned,aligned)
    run(build/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
    run(build/'apksigner.bat','verify',apk)
    (out/'build.json').write_text(json.dumps({'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'source':str(SOURCE),'sourceSha256':source_hash,'sourceHashes':source_hashes,'manifestSha256':hashlib.sha256(manifest.read_bytes()).hexdigest(),'fixtureRevision':'island-lifecycle-r2-controls','mainManifestChanged':False},indent=2),encoding='utf-8')
    print(apk)

if __name__=='__main__':main()
