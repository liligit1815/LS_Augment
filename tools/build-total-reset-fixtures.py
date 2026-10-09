"""Build two disposable, permission-free apps for an explicitly requested device reset test."""
import os
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SDK = ROOT / 'audit-output/android-sdk'
BUILD = SDK / 'build-tools/35.0.0'
JAVA = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
ANDROID = SDK / 'platforms/android-36/android.jar'
OUT = ROOT / 'out/total-reset-fixtures'

def run(*args):
    subprocess.run([str(a) for a in args], check=True)

for suffix in ('a', 'b'):
    package = 'ls.augment.reset.fixture20413' + suffix
    folder = OUT / suffix
    classes = folder / 'classes'
    classes.mkdir(parents=True, exist_ok=True)
    source = folder / 'MainActivity.java'
    source.write_text('package ' + package + '; public final class MainActivity extends android.app.Activity {'
        'public void onCreate(android.os.Bundle state){super.onCreate(state);'
        'android.widget.TextView text=new android.widget.TextView(this);'
        'text.setText("红魔Duo重置验收 ' + suffix + '");text.setTextSize(20);setContentView(text);}}', encoding='utf-8')
    manifest = folder / 'AndroidManifest.xml'
    manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="' + package + '">'
        '<uses-sdk android:minSdkVersion="35" android:targetSdkVersion="36"/>'
        '<application android:label="红魔Duo重置验收 ' + suffix + '" android:allowBackup="false">'
        '<activity android:name=".MainActivity" android:exported="true"><intent-filter>'
        '<action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/>'
        '</intent-filter></activity></application></manifest>', encoding='utf-8')
    run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', ANDROID, '-d', classes, source)
    run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '35', '--output', folder, *classes.rglob('*.class'))
    unsigned = folder / 'unsigned.apk'
    run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
    with zipfile.ZipFile(unsigned, 'a') as apk:
        apk.write(folder / 'classes.dex', 'classes.dex')
    aligned = folder / 'aligned.apk'
    run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore', '--ks-pass', 'pass:android',
        '--key-pass', 'pass:android', '--out', folder / 'fixture.apk', aligned)
    run(BUILD / 'apksigner.bat', 'verify', folder / 'fixture.apk')
    print(folder / 'fixture.apk')
