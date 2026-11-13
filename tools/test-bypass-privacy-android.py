"""Production notification ownership and concrete thumbnail draw on Android native graphics.
OEM entry points/config transport are fixtures; this does not certify hardware or a ROM.
"""
from pathlib import Path
import os, runpy, subprocess
ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'audit-output/bypass-privacy-fix-20261112/android-tests'
DEPS=ROOT/'out/header-clock-20455/android-runtime/deps'
JAVA=Path(os.environ['JAVA_HOME'])/'bin'
ports=runpy.run_path(str(ROOT/'tools/test-bypass-awakening-android.py'))['PORTS']
ports={k:v for k,v in ports.items() if k.endswith(('/FeatureSettings.java','/AugmentModule.java'))}
BASE.mkdir(parents=True,exist_ok=True)
classes=BASE/'classes';classes.mkdir(exist_ok=True)
sources=[]
for name,source in ports.items():
 p=BASE/'ports'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8');sources.append(p)
sources += [ROOT/'android/app/src/main/java/ls/augment/com'/f'{n}.java' for n in ('EnhancementOption','BypassChargingOptions','hook/HookCompatibility','hook/BypassNotificationHook','hook/RecentsPrivacyOverlay','hook/RecentsPrivacyDraw')]
sources += [ROOT/'tools/tests/BypassPrivacyAndroidTest.java']
jars=list(DEPS.glob('*.jar'))
cp=os.pathsep.join(map(str,[ROOT/'audit-output/android-sdk/platforms/android-36/android.jar',*jars]))
subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,sources)],check=True)
cp=os.pathsep.join(map(str,[classes,*jars]))
raise SystemExit(subprocess.run([str(JAVA/'java.exe'),'-Dfile.encoding=UTF-8','-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2','-cp',cp,'org.junit.runner.JUnitCore','ls.augment.com.hook.BypassPrivacyAndroidTest'],cwd=BASE).returncode)
