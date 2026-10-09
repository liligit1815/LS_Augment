"""Actual Android 16 + AndroidX ConstraintLayout adapter regression. No APK/device/Gradle.
Programmatic ConstraintLayout needs its AAR R constants, not inflated application resources.
Pinned Google Maven dependencies are development-only and never enter the application.
"""
from pathlib import Path
import argparse,hashlib,runpy,urllib.request,zipfile
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/header-viewport-20261004'
DEPS=OUT/'deps'
ARTIFACTS=[('constraintlayout-2.2.1.aar','constraintlayout/2.2.1','30f8d79b782d283a90f0b6f7369169d9cf560091537fdd6056d1daa9f3033763'),('constraintlayout-core-1.1.0.jar','constraintlayout-core/1.1.0','a8b90d19f7d758f7cb8962491547cf57cb7837c31fe3b00e01c4e85df7bf4851')]
def dependencies(bootstrap=False):
    DEPS.mkdir(parents=True,exist_ok=True)
    for name,folder,sha in ARTIFACTS:
        file=DEPS/name
        if not file.exists():
            if not bootstrap:raise RuntimeError('Missing pinned dependency; explicitly use --bootstrap: '+name)
            urllib.request.urlretrieve('https://dl.google.com/dl/android/maven2/androidx/constraintlayout/'+folder+'/'+name,file)
        if hashlib.sha256(file.read_bytes()).hexdigest()!=sha:raise RuntimeError('Dependency hash mismatch: '+name)
    with zipfile.ZipFile(DEPS/ARTIFACTS[0][0]) as archive:
        (DEPS/'constraintlayout-2.2.1.jar').write_bytes(archive.read('classes.jar'))
        groups={}
        for line in archive.read('R.txt').decode().splitlines():
            typ,cls,name,value=line.split(' ',3);groups.setdefault(cls,[]).append(f'public static final {typ} {name} = {value};')
        (DEPS/'R.java').write_text('package androidx.constraintlayout.widget; public final class R { '+''.join('public static final class '+cls+' { '+''.join(fields)+' }' for cls,fields in groups.items())+' }',encoding='utf-8')
def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--bootstrap',action='store_true');parser.add_argument('--source-root',type=Path,default=ROOT);args=parser.parse_args()
    dependencies(args.bootstrap)
    suite=runpy.run_path(str(ROOT/'tools/test-header-clock-android.py'))
    run=suite['run'];run.__globals__['BASE']=OUT/'android-runtime'
    return run(args.source_root,[DEPS/'R.java',ROOT/'tools/tests/com/android/systemui/shade/NotificationsQuickSettingsContainer.java',ROOT/'tools/tests/com/android/systemui/statusbar/notification/stack/NotificationStackScrollLayout.java',ROOT/'tools/tests/NotificationViewportAndroidTest.java'],list(DEPS.glob('*.jar')),['ls.augment.com.hook.NotificationViewportAndroidTest'])
if __name__=='__main__':raise SystemExit(main())
