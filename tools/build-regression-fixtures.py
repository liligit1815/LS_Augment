"""Build isolated APK variants for actual PackageManager and multiwindow tests."""
import json
import os
from pathlib import Path
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
notification_fixtures = '--notifications' in sys.argv
notification_count = int(next((arg.split('=', 1)[1] for arg in sys.argv if arg.startswith('--notification-count=')), '6'))
assert 1 <= notification_count <= 24
notification_folder = 'notification-fixtures' + ('' if notification_count == 6 else '-' + str(notification_count))
OUT = ROOT / ('out/full-device-regression-20260908/' + notification_folder if notification_fixtures
              else 'out/full-device-regression-20260908/fixtures')
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
OUT.mkdir(parents=True, exist_ok=True)
CLASSES = OUT / 'classes'
CLASSES.mkdir(exist_ok=True)

def run(*args):
    subprocess.run([str(x) for x in args], check=True, stdout=subprocess.DEVNULL)

source = OUT / 'ProbeActivity.java'
source.write_text('''package ls.augment.regression;
import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
public final class ProbeActivity extends Activity {
  @Override public void onCreate(Bundle state) {
    super.onCreate(state);
    String marker=getPreferences(0).getString("marker",null);
    if(marker==null){marker="REGRESSION-"+System.currentTimeMillis();getPreferences(0).edit().putString("marker",marker).commit();}
    long version=0;try{version=getPackageManager().getPackageInfo(getPackageName(),0).getLongVersionCode();}catch(Exception ignored){}
    TextView view=new TextView(this);view.setTextSize(20);view.setGravity(17);
    view.setText("LS ADB REGRESSION\\n"+getPackageName()+"\\nVERSION "+version+"\\n"+marker);
    setContentView(view);
    android.app.NotificationManager notifications=getSystemService(android.app.NotificationManager.class);
    if(getIntent().getBooleanExtra("clear",false))notifications.cancelAll();
    if(getIntent().getBooleanExtra("notify",false)){
      notifications.createNotificationChannel(new android.app.NotificationChannel("regression","LS ADB icons",android.app.NotificationManager.IMPORTANCE_LOW));
      notifications.notify(7001,new android.app.Notification.Builder(this,"regression")
          .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle(getPackageName())
          .setContentText("Temporary local status-bar test").build());
    }
    android.util.Log.i("LSA-Regression",getPackageName()+";version="+version+";marker="+marker);
  }
}''', encoding='utf-8')
run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', ANDROID, '-d', CLASSES, source)
run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '28', '--output', OUT, *CLASSES.rglob('*.class'))
second_key = OUT / 'regression-only.keystore'
if not second_key.exists():
    run(JAVA / 'keytool.exe', '-genkeypair', '-keystore', second_key, '-storepass', 'regression-only',
        '-keypass', 'regression-only', '-alias', 'regression', '-keyalg', 'RSA', '-validity', '3650',
        '-dname', 'CN=Disposable LS Regression')

variants = [('signature-v1','ls.augment.regression.signature',1,False,False),
            ('signature-v2','ls.augment.regression.signature',2,True,False),
            ('signature-v3','ls.augment.regression.signature',3,False,False),
            ('shared-v1','ls.augment.regression.shared',1,False,True),
            ('shared-v2','ls.augment.regression.shared',2,True,True)]
variants += [('legacy-v1','ls.augment.regression.legacy',1,False,False)]
variants += [(f'window-{i}',f'ls.augment.regression.window{i}',1,False,False) for i in range(1,7)]
if notification_fixtures:
    variants = [(f'window-{i}',f'ls.augment.regression.window{i}',2,False,False) for i in range(1,notification_count + 1)]
inventory = []
for label, package, version, alternate, shared in variants:
    folder=OUT/label;folder.mkdir(exist_ok=True)
    manifest=folder/'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{package}"
      android:versionCode="{version}" android:versionName="{version}" {'android:sharedUserId="ls.augment.regression.shared.uid"' if shared else ''}>
      <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
      <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
      <application android:label="LS ADB {label}" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
        <activity android:name="ls.augment.regression.ProbeActivity" android:exported="true" android:resizeableActivity="false"/>
      </application></manifest>''',encoding='utf-8')
    unsigned=folder/'unsigned.apk';aligned=folder/'aligned.apk';apk=folder/(label+'.apk')
    run(BUILD/'aapt2.exe','link','-o',unsigned,'-I',ANDROID,'--manifest',manifest)
    with zipfile.ZipFile(unsigned,'a') as archive: archive.write(OUT/'classes.dex','classes.dex')
    run(BUILD/'zipalign.exe','-f','4',unsigned,aligned)
    password='regression-only' if alternate else 'android'
    legacy=label=='legacy-v1'
    signing=['--v1-signing-enabled','true','--v2-signing-enabled','false','--v3-signing-enabled','false','--v4-signing-enabled','false'] if legacy else []
    run(BUILD/'apksigner.bat','sign','--ks',second_key if alternate else Path.home()/'.android/debug.keystore',
        '--ks-pass','pass:'+password,'--key-pass','pass:'+password,*signing,'--out',apk,aligned)
    run(BUILD/'apksigner.bat','verify',*(['--min-sdk-version','23','--max-sdk-version','23'] if legacy else []),apk)
    inventory.append({'label':label,'package':package,'version':version,'alternateSigningKey':alternate,
                      'sharedUid':shared,'component':package+'/ls.augment.regression.ProbeActivity','apk':str(apk)})
(OUT/'inventory.json').write_text(json.dumps(inventory,indent=2),encoding='utf-8')
print(json.dumps({'fixtureVariants':len(inventory),'inventory':str(OUT/'inventory.json')}))
