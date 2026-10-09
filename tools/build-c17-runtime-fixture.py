"""Build a disposable self-instrumenting APK, leaving Duo's release permissions untouched."""
from pathlib import Path
import hashlib, json, os, subprocess, zipfile
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/full-function-audit-20261004/c17-runtime-fixture';OUT.mkdir(parents=True,exist_ok=True)
SDK=ROOT/'audit-output/android-sdk';BUILD=SDK/'build-tools/35.0.0';ANDROID=SDK/'platforms/android-36/android.jar'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
env=dict(os.environ,JAVA_HOME=str(JAVA.parent),PATH=str(JAVA)+os.pathsep+os.environ['PATH'])
def run(*args):subprocess.run(list(map(str,args)),check=True,env=env)
fixture=ROOT/'android/app/src/androidTest/java/ls/augment/com/C17RuntimeFixtureCases.java'
runner=OUT/'C17FixtureRunner.java'
runner.write_text('''package ls.augment.com;
public final class C17FixtureRunner extends android.app.Instrumentation {
 private android.os.Bundle args;
 @Override public void onCreate(android.os.Bundle values){super.onCreate(values);args=values;start();}
 @Override public void onStart(){android.os.Bundle result=new android.os.Bundle();int code=0;
  try{org.json.JSONObject report=C17RuntimeFixtureCases.run(this,args);result.putString("fixture",report.toString());
   if(!report.optString("error").isEmpty()||!report.optBoolean("cleanupComplete"))throw new IllegalStateException("Fixture failed");
   result.putString("status","pass");code=-1;
  }catch(Throwable error){result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));}
  finish(code,result);
 }
}''',encoding='utf-8')
classes=OUT/'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe','-encoding','UTF-8','-source','8','-target','8','-cp',ANDROID,'-d',classes,fixture,runner)
run(BUILD/'d8.bat','--lib',ANDROID,'--min-api','35','--output',OUT,*classes.rglob('*.class'))
manifest=OUT/'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.c17" android:versionCode="1" android:versionName="1">
 <uses-sdk android:minSdkVersion="35" android:targetSdkVersion="36"/>
 <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
 <instrumentation android:name="ls.augment.com.C17FixtureRunner" android:targetPackage="ls.augment.regression.c17" android:label="Temporary C17 native fixture"/>
 <application android:label="Duo 临时原生验证" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light">
  <activity android:name="ls.augment.com.C17RuntimeFixtureCases$ContentActivity" android:exported="true" android:excludeFromRecents="true"/>
 </application>
</manifest>''',encoding='utf-8')
unsigned=OUT/'unsigned.apk';aligned=OUT/'aligned.apk';apk=OUT/'c17-runtime-fixture.apk'
run(BUILD/'aapt2.exe','link','-o',unsigned,'-I',ANDROID,'--manifest',manifest)
with zipfile.ZipFile(unsigned,'a') as z:z.write(OUT/'classes.dex','classes.dex')
run(BUILD/'zipalign.exe','-f','4',unsigned,aligned)
run(BUILD/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
run(BUILD/'apksigner.bat','verify',apk)
(OUT/'build.json').write_text(json.dumps({'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'source':str(fixture),'sourceSha256':hashlib.sha256(fixture.read_bytes()).hexdigest(),'releaseManifestChanged':False},indent=2),encoding='utf-8')
print(apk)
