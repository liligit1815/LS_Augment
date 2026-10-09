"""Build an inert, local-only capture/installer fixture; never contact a device."""
from pathlib import Path
import json
import os
import shutil
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-function-audit-20261004/safe-native-fixture'
PACKAGE = 'ls.augment.regression.safeaudit'


def build(output=None, landscape=False):
    global OUT
    if output is not None: OUT=Path(output)
    candidates = [ROOT / 'audit-output/android-sdk', Path.home() / 'AppData/Local/Android/Sdk']
    if os.environ.get('ANDROID_SDK_ROOT'):
        candidates.insert(0, Path(os.environ['ANDROID_SDK_ROOT']))
    sdk = next((p for p in candidates if (p / 'platforms/android-36/android.jar').exists()), None)
    if sdk is None:
        raise RuntimeError('Existing Android 36 SDK required; no download is performed')
    build_tools = next((sdk / 'build-tools' / version for version in ['36.0.0', '35.0.0']
                        if (sdk / 'build-tools' / version / 'aapt2.exe').exists()), None)
    if build_tools is None:
        raise RuntimeError('Existing Android build tools required')
    jdk = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
    if not (jdk / 'javac.exe').exists():
        found = shutil.which('javac')
        if not found:
            raise RuntimeError('Existing JDK required')
        jdk = Path(found).parent
    env = dict(os.environ, JAVA_HOME=str(jdk.parent), PATH=str(jdk) + os.pathsep + os.environ.get('PATH', ''))
    OUT.mkdir(parents=True, exist_ok=True)
    classes = OUT / 'classes'
    classes.mkdir(exist_ok=True)
    sources = []
    for name, secure in [('PlainActivity', False), ('SecureActivity', True)]+([('LandscapeActivity',False)] if landscape else []):
        source = OUT / (name + '.java')
        source.write_text('''package ls.augment.regression.safeaudit;
import android.app.Activity;
import android.os.Bundle;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;
public final class NAME extends Activity {
 public void onCreate(Bundle state){super.onCreate(state);
  SECURE
  getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
  getWindow().clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  getWindow().setStatusBarColor(Color.WHITE);
  getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  TextView text=new TextView(this);text.setBackgroundColor(Color.WHITE);text.setTextColor(0xff12345a);
  text.setGravity(Gravity.CENTER);text.setTextSize(24);
  text.setText("Duo owned audit fixture\\nNo account, network, messages or personal data\\nMODE");
  text.setContentDescription("duo_owned_audit_MODE");setContentView(text);
 }
}
'''.replace('NAME', name).replace('SECURE', 'getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);' if secure else '')
                          .replace('MODE', 'secure' if secure else 'plain'), encoding='utf-8')
        sources.append(source)
    manifest = OUT / 'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PACKAGE}"
 android:versionCode="1" android:versionName="1">
 <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="28"/>
 <application android:label="Duo owned audit fixture" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
 <activity android:name=".PlainActivity" android:exported="true" android:screenOrientation="portrait"/>
 <activity android:name=".SecureActivity" android:exported="true" android:screenOrientation="portrait"/>
 {('<activity android:name=".LandscapeActivity" android:exported="true" android:screenOrientation="landscape"/>' if landscape else '')}
 </application></manifest>''', encoding='utf-8')

    def run(*args):
        subprocess.run([str(value) for value in args], check=True, env=env, stdout=subprocess.DEVNULL)

    android = sdk / 'platforms/android-36/android.jar'
    run(jdk / 'javac.exe', '-encoding', 'UTF-8', '--release', '8', '-cp', android, '-d', classes, *sources)
    run(build_tools / 'd8.bat', '--lib', android, '--min-api', '28', '--output', OUT, *classes.rglob('*.class'))
    unsigned = OUT / 'unsigned.apk'
    run(build_tools / 'aapt2.exe', 'link', '-o', unsigned, '-I', android, '--manifest', manifest)
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(OUT / 'classes.dex', 'classes.dex')
    run(build_tools / 'zipalign.exe', '-f', '4', unsigned, OUT / 'aligned.apk')
    keystore = OUT / 'owned-audit.keystore'
    if not keystore.exists():
        run(jdk / 'keytool.exe', '-genkeypair', '-keystore', keystore, '-storepass', 'owned-audit',
            '-keypass', 'owned-audit', '-alias', 'fixture', '-keyalg', 'RSA', '-validity', '3650',
            '-dname', 'CN=Local Inert Duo Audit Fixture')
    apk = OUT / 'safe-audit.apk'
    run(build_tools / 'apksigner.bat', 'sign', '--ks', keystore, '--ks-pass', 'pass:owned-audit',
        '--key-pass', 'pass:owned-audit', '--out', apk, OUT / 'aligned.apk')
    run(build_tools / 'apksigner.bat', 'verify', apk)
    print(json.dumps({'apk': str(apk), 'package': PACKAGE, 'deviceContacted': False}))
    return apk


if __name__ == '__main__':
    build()
