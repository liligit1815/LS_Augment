"""Build a local-only Activity assistant for actual power-key routing tests."""
import subprocess,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/full-device-regression-20260908/assistant-fixture';OUT.mkdir(exist_ok=True)
SDK=Path.home()/'AppData/Local/Android/Sdk';BUILD=SDK/'build-tools/36.0.0';ANDROID=SDK/'platforms/android-36/android.jar';JAVA=Path('C:/Program Files/Java/jdk-17/bin')
def run(*args):subprocess.run(list(map(str,args)),check=True,stdout=subprocess.DEVNULL)
source=OUT/'Probe.java'
source.write_text('''package ls.augment.regression.assistant;
import android.app.Activity;import android.os.Bundle;import android.widget.TextView;
public class Probe extends Activity {
 public void onCreate(Bundle b){super.onCreate(b);android.content.SharedPreferences p=getSharedPreferences("launches",0);int n=p.getInt("count",0)+1;p.edit().putInt("count",n).putString("action",String.valueOf(getIntent().getAction())).putLong("time",System.currentTimeMillis()).commit();TextView v=new TextView(this);v.setTextSize(24);v.setText("LS ASSISTANT TEST\\nLaunch count: "+n);setContentView(v);}
}''',encoding='utf-8')
classes=OUT/'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe','-encoding','UTF-8','-source','8','-target','8','-cp',ANDROID,'-d',classes,source)
run(BUILD/'d8.bat','--lib',ANDROID,'--min-api','28','--output',OUT,*classes.rglob('*.class'))
manifest=OUT/'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.assistant" android:versionCode="1" android:versionName="1"><uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/><application android:label="LS temporary assistant" android:allowBackup="false"><activity android:name=".Probe" android:exported="true"><intent-filter><action android:name="android.intent.action.ASSIST"/><category android:name="android.intent.category.DEFAULT"/></intent-filter></activity></application></manifest>''',encoding='utf-8')
u=OUT/'unsigned.apk';aligned=OUT/'aligned.apk';apk=OUT/'assistant.apk'
run(BUILD/'aapt2.exe','link','-o',u,'-I',ANDROID,'--manifest',manifest)
with zipfile.ZipFile(u,'a') as z:z.write(OUT/'classes.dex','classes.dex')
run(BUILD/'zipalign.exe','-f','4',u,aligned)
run(BUILD/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
run(BUILD/'apksigner.bat','verify',apk)
print(apk)
