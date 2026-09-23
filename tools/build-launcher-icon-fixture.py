"""Build a disposable launcher app and deterministic crop images for real UI tests."""
import json
from pathlib import Path
import subprocess
import zipfile
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/launcher-icon-fixture'
OUT.mkdir(parents=True, exist_ok=True)
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.launcher'


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True, stdout=subprocess.DEVNULL)


source = OUT / 'IconFixtureActivity.java'
source.write_text('''package ls.augment.regression;
public final class IconFixtureActivity extends android.app.Activity {
  @Override public void onCreate(android.os.Bundle state) {
    super.onCreate(state);
    android.widget.TextView text=new android.widget.TextView(this);
    text.setText("LS ICON FIXTURE\\nTemporary local launcher test\\nUser "+android.os.Process.myUserHandle());
    text.setTextSize(22);text.setGravity(17);setContentView(text);
  }
}''', encoding='utf-8')
classes = OUT / 'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', ANDROID, '-d', classes, source)
run(BUILD/'d8.bat', '--lib', ANDROID, '--min-api', '28', '--output', OUT, *classes.rglob('*.class'))
manifest = OUT / 'AndroidManifest.xml'
manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PACKAGE}" android:versionCode="1" android:versionName="1">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="36"/>
<application android:label="LS Icon Test" android:icon="@android:drawable/ic_menu_compass" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
<activity android:name="ls.augment.regression.IconFixtureActivity" android:exported="true"><intent-filter>
<action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/>
</intent-filter></activity></application></manifest>''', encoding='utf-8')
unsigned = OUT/'unsigned.apk';aligned = OUT/'aligned.apk';apk = OUT/'launcher-icon-fixture.apk'
run(BUILD/'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
with zipfile.ZipFile(unsigned, 'a') as archive:archive.write(OUT/'classes.dex', 'classes.dex')
run(BUILD/'zipalign.exe', '-f', '4', unsigned, aligned)
run(BUILD/'apksigner.bat', 'sign', '--ks', Path.home()/'.android/debug.keystore', '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
run(BUILD/'apksigner.bat', 'verify', apk)

# Square quadrants and narrow center markers make movement/zoom detectable in the saved pixels.
picture = Image.new('RGB', (1024,512), '#e63946');draw = ImageDraw.Draw(picture)
draw.rectangle((256,0,767,511),fill='#25ad5f');draw.rectangle((768,0,1023,511),fill='#2266dd')
draw.rectangle((480,0,543,511),fill='#ffffff');draw.rectangle((0,224,1023,287),fill='#111111')
picture.save(OUT/'LSA-crop-wide-20260909.png')
square = Image.new('RGB',(512,512),'#e63946');d = ImageDraw.Draw(square)
for bounds,color in [((256,0,511,255),'#25ad5f'),((0,256,255,511),'#2266dd'),((256,256,511,511),'#ffce32')]:d.rectangle(bounds,fill=color)
square.save(OUT/'LSA-crop-square-20260909.png')
exif = square.getexif();exif[274] = 6
square.save(OUT/'LSA-crop-exif-20260909.jpg',exif=exif,quality=95)
# Thin, asymmetric marks retain measurable geometry even at the cropper's 8x limit.
grid = Image.new('RGB',(512,512),'#25ad5f');g=ImageDraw.Draw(grid)
for x in range(0,512,32):g.line((x,0,x,511),fill='#1177cc',width=2)
for y in range(0,512,32):g.line((0,y,511,y),fill='#ffce32',width=2)
g.rectangle((252,0,259,511),fill='white');g.rectangle((0,252,511,259),fill='#111111')
grid.save(OUT/'LSA-crop-grid-20260909.png')
(OUT/'inventory.json').write_text(json.dumps({'package':PACKAGE,'component':PACKAGE+'/ls.augment.regression.IconFixtureActivity','apk':str(apk),'ownedMedia':[x.name for x in OUT.glob('LSA-crop-*')]},indent=2),encoding='utf-8')
print(OUT/'inventory.json')
