"""Build four isolated phone test apps. These are never module runtime dependencies."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--sdk', type=Path, default=ROOT / 'audit-output/android-sdk')
parser.add_argument('--java-home', type=Path, default=Path(os.environ.get('JAVA_HOME', r'C:\Program Files\Android\openjdk\jdk-21.0.8')))
parser.add_argument('--output', type=Path, default=ROOT / 'audit-output/atomic-workbench-fixture-apks')
args = parser.parse_args()
args.output.mkdir(parents=True, exist_ok=True)
java = args.java_home / 'bin/java.exe'
javac = args.java_home / 'bin/javac.exe'
keytool = args.java_home / 'bin/keytool.exe'
android = args.sdk / 'platforms/android-36/android.jar'
build = args.sdk / 'build-tools/35.0.0'
keystore = args.output / 'developer-fixtures.jks'

def run(command):
    subprocess.run([str(item) for item in command], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

if not keystore.exists():
    run([keytool, '-genkeypair', '-keystore', keystore, '-alias', 'androiddebugkey', '-storepass', 'android',
         '-keypass', 'android', '-keyalg', 'RSA', '-validity', '3650', '-dname', 'CN=Workbench Developer Fixtures'])
template = (ROOT / 'android/app/src/androidTest/java/ls/augment/com/AtomicWorkbenchFixtureActivity.java').read_text(encoding='utf-8')
for name in ('one', 'two', 'three', 'four'):
    package = 'ls.augment.workbench.fixture.' + name
    with tempfile.TemporaryDirectory(prefix='lsa-workbench-fixture-') as temporary:
        folder = Path(temporary)
        source = folder / 'AtomicWorkbenchFixtureActivity.java'
        source.write_text(template.replace('package ls.augment.com;', f'package {package};'), encoding='utf-8')
        classes, dex = folder / 'classes', folder / 'dex'
        classes.mkdir(); dex.mkdir()
        run([javac, '-encoding', 'UTF-8', '--release', '17', '-classpath', android, '-d', classes, source])
        run([java, '-cp', build / 'lib/d8.jar', 'com.android.tools.r8.D8', '--min-api', '35', '--lib', android,
             '--output', dex, *classes.rglob('*.class')])
        manifest = folder / 'AndroidManifest.xml'
        manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{package}" android:versionCode="5" android:versionName="5">
<queries><package android:name="ls.augment.com"/></queries>
<application android:label="工作台样本 {name}" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
<activity android:name=".AtomicWorkbenchFixtureActivity" android:exported="true" android:resizeableActivity="true">
<intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/></intent-filter>
</activity></application></manifest>''', encoding='utf-8')
        unsigned = folder / 'unsigned.apk'
        run([build / 'aapt2.exe', 'link', '-I', android, '--manifest', manifest, '--min-sdk-version', '35',
             '--target-sdk-version', '36', '-o', unsigned])
        with zipfile.ZipFile(unsigned, 'a', zipfile.ZIP_DEFLATED) as apk:
            apk.write(dex / 'classes.dex', 'classes.dex')
        aligned = folder / 'aligned.apk'
        run([build / 'zipalign.exe', '-f', '4', unsigned, aligned])
        output = args.output / f'workbench-fixture-{name}.apk'
        run([java, '-jar', build / 'lib/apksigner.jar', 'sign', '--ks', keystore, '--ks-key-alias', 'androiddebugkey',
             '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', output, aligned])
        run([java, '-jar', build / 'lib/apksigner.jar', 'verify', output])
        print(f'PASS {package}: {output}')
