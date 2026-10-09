"""Run production HeaderClockLayout on Robolectric's Android 16 framework/native graphics.
Dependencies are resolved separately from the app. No Gradle, APK install or device access.
"""
import argparse
import os
from pathlib import Path
import subprocess
import zipfile
import runpy
import hashlib
import urllib.request

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
BASE=ROOT/'out/header-clock-20455/android-runtime'
DEPS=BASE/'deps'
POM='''<project xmlns="http://maven.apache.org/POM/4.0.0"><modelVersion>4.0.0</modelVersion><groupId>duo.offline</groupId><artifactId>header-layout</artifactId><version>1</version><repositories><repository><id>google</id><url>https://maven.google.com</url></repository></repositories><dependencies><dependency><groupId>org.robolectric</groupId><artifactId>robolectric</artifactId><version>4.16.1</version></dependency><dependency><groupId>junit</groupId><artifactId>junit</artifactId><version>4.13.2</version></dependency></dependencies></project>'''

def bootstrap():
    """Opt-in development dependencies; never shipped or needed on the phone."""
    BASE.mkdir(parents=True,exist_ok=True);(BASE/'pom.xml').write_text(POM,encoding='utf-8')
    archive=BASE/'apache-maven-3.9.11-bin.zip'
    url='https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.11/apache-maven-3.9.11-bin.zip'
    if not archive.exists():urllib.request.urlretrieve(url,archive)
    expected=urllib.request.urlopen(url+'.sha512').read().decode().split()[0]
    if hashlib.sha512(archive.read_bytes()).hexdigest()!=expected:raise RuntimeError('Maven archive checksum mismatch')
    mvn=BASE/'apache-maven-3.9.11/bin/mvn.cmd'
    if not mvn.exists():
        with zipfile.ZipFile(archive) as package:package.extractall(BASE)
    env=dict(os.environ,JAVA_HOME=str(JAVA.parent))
    subprocess.run([str(mvn),'-B','-f',str(BASE/'pom.xml'),'org.apache.maven.plugins:maven-dependency-plugin:3.8.1:copy-dependencies','-DoutputDirectory='+str(DEPS)],env=env,check=True)
    framework=DEPS/'android-all-16-robolectric-13921718.jar'
    url='https://repo.maven.apache.org/maven2/org/robolectric/android-all/16-robolectric-13921718/'+framework.name
    if not framework.exists():urllib.request.urlretrieve(url,framework)
    expected=urllib.request.urlopen(url+'.sha1').read().decode().split()[0]
    if hashlib.sha1(framework.read_bytes()).hexdigest()!=expected:raise RuntimeError('Android framework artifact checksum mismatch')

def run(source_root=ROOT,extra_sources=(),extra_deps=(),test_classes=()):
    if not (DEPS/'robolectric-4.16.1.jar').exists():raise RuntimeError('Resolve the pinned standalone Android test dependencies first: '+str(BASE/'pom.xml'))
    for archive in DEPS.glob('*.aar'):
        target=DEPS/(archive.stem+'-classes.jar')
        with zipfile.ZipFile(archive) as z:target.write_bytes(z.read('classes.jar'))
    classes=BASE/'classes';classes.mkdir(parents=True,exist_ok=True)
    cp=os.pathsep.join([str(ROOT/'audit-output/android-sdk/platforms/android-36/android.jar'),*[str(j) for j in DEPS.glob('*.jar')],*map(str,extra_deps)])
    sources=[source_root/'android/app/src/main/java/ls/augment/com'/n for n in ['HeaderClockGeometry.java','HeaderClockLayout.java','NotificationLayoutPolicy.java','EnhancementOption.java','NotificationAppearanceOptions.java','CarrierTextOptions.java','SystemUiPolicy.java','StatusBarIconSpacingSpec.java','StatusBarHeaderSpacingObservation.java','hook/SystemUiAdapter.java','hook/ControlCenterHeaderHook.java','hook/NotificationAppearanceHook.java','hook/StatusBarHeaderSpacingHook.java']]
    sources.extend([source_root/'android/app/src/main/java/ls/augment/com/StatusBarIconCatalog.java',source_root/'android/app/src/main/java/ls/augment/com/StatusBarSurfaceSpec.java',ROOT/'tools/tests/HeaderClockAndroidTest.java',ROOT/'tools/tests/HeaderClockHooksAndroidTest.java'])
    sources.extend([source_root/'android/app/src/main/java/ls/augment/com/hook/NotificationWeatherHook.java',source_root/'android/app/src/main/java/ls/augment/com/hook/NotificationWeatherText.java',ROOT/'tools/tests/com/zte/controlcenter/view/ControlCenterPanelView.java'])
    sources.extend([source_root/'android/app/src/main/java/ls/augment/com/hook/NotificationViewportInset.java',*extra_sources])
    for name,code in runpy.run_path(str(ROOT/'tools/header-clock-android-support.py'))['SOURCES'].items():
        file=BASE/'support'/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(code,encoding='utf-8');sources.append(file)
    subprocess.run([str(JAVA/'javac.exe'),'-J-Duser.language=en','-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,sources)],check=True)
    # SDK framework is loaded by Robolectric, never the throwing android.jar stubs.
    runtime=os.pathsep.join([str(classes),*[str(j) for j in DEPS.glob('*.jar')],*map(str,extra_deps)])
    return subprocess.run([str(JAVA/'java.exe'),'-Dfile.encoding=UTF-8','-Dsun.stdout.encoding=UTF-8','-Dsun.stderr.encoding=UTF-8','-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2',
                           '-Dduo.evidence='+str(BASE),'-cp',runtime,'org.junit.runner.JUnitCore','ls.augment.com.HeaderClockAndroidTest','ls.augment.com.HeaderClockHooksAndroidTest',*test_classes],cwd=BASE).returncode

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--source-root',type=Path,default=ROOT);parser.add_argument('--bootstrap',action='store_true');parser.add_argument('--output-root',type=Path);args=parser.parse_args()
    if args.output_root:BASE=args.output_root
    if args.bootstrap:bootstrap()
    raise SystemExit(run(args.source_root))
