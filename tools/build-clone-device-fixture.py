"""Build an owned app with visible per-user persistent data for OEM clone tests."""
import json
from pathlib import Path
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/clone-fixture'
OUT.mkdir(exist_ok=True)
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.clone'


def run(*args):
    subprocess.run([str(a) for a in args], check=True, stdout=subprocess.DEVNULL)


source = OUT / 'CloneFixtureActivity.java'
source.write_text('''package ls.augment.regression;
public final class CloneFixtureActivity extends android.app.Activity {
  private android.content.SharedPreferences data;
  private android.widget.TextView status;
  @Override public void onCreate(android.os.Bundle state) {
    super.onCreate(state);
    data=getSharedPreferences("clone-probe",0);
    if(!data.contains("marker")) data.edit().putString("marker",java.util.UUID.randomUUID().toString()).commit();
    android.widget.LinearLayout page=new android.widget.LinearLayout(this);
    page.setOrientation(1);page.setGravity(17);page.setPadding(36,80,36,80);
    status=new android.widget.TextView(this);status.setTextSize(20);status.setGravity(17);page.addView(status);
    android.widget.Button add=new android.widget.Button(this);add.setText("计数 +1");
    add.setOnClickListener(v->{data.edit().putInt("count",data.getInt("count",0)+1).commit();refresh();});
    page.addView(add);setContentView(page);refresh();
  }
  private void refresh(){status.setText("LS CLONE FIXTURE\\n"+getPackageName()+"\\n"+
    android.os.Process.myUserHandle()+"\\n"+data.getString("marker","")+"\\nCOUNT "+data.getInt("count",0));}
}''', encoding='utf-8')
classes = OUT / 'classes'; classes.mkdir(exist_ok=True)
run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', ANDROID,
    '-d', classes, source)
run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '28', '--output', OUT, *classes.rglob('*.class'))
manifest = OUT / 'AndroidManifest.xml'
manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PACKAGE}"
android:versionCode="1" android:versionName="1">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="36"/>
<application android:label="LS Clone Test" android:icon="@android:drawable/ic_menu_recent_history"
android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
<activity android:name="ls.augment.regression.CloneFixtureActivity" android:exported="true"><intent-filter>
<action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/>
</intent-filter></activity></application></manifest>''', encoding='utf-8')
unsigned = OUT / 'unsigned.apk'; aligned = OUT / 'aligned.apk'; apk = OUT / 'clone-fixture.apk'
run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
with zipfile.ZipFile(unsigned, 'a') as archive:
    archive.write(OUT / 'classes.dex', 'classes.dex')
run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
    '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
run(BUILD / 'apksigner.bat', 'verify', apk)
(OUT / 'inventory.json').write_text(json.dumps({'package': PACKAGE,
    'component': PACKAGE + '/ls.augment.regression.CloneFixtureActivity', 'apk': str(apk)}, indent=2), encoding='utf-8')
print(OUT / 'inventory.json')
