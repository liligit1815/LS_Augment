"""Compile the real system-setting recovery engine and run its offline transaction cases."""
from pathlib import Path
import os
import subprocess

ROOT = Path(__file__).resolve().parent.parent
JAVA_HOME = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
ANDROID_JAR = ROOT / 'audit-output/android-sdk/platforms/android-36/android.jar'
OUT = ROOT / 'audit-output/module-system-settings-tests'
OUT.mkdir(parents=True, exist_ok=True)
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com'
subprocess.run([str(JAVA_HOME / 'bin/javac.exe'), '-encoding', 'UTF-8', '-cp', str(ANDROID_JAR), '-d', str(OUT),
                *[str(SOURCE / name) for name in ('RootShell.java', 'DurablePreferences.java', 'ResetWriteFence.java',
                                                'ExtraDimControl.java', 'ModuleSystemSettings.java')],
                str(ROOT / 'tools/TestModuleSystemSettings.java')], check=True)
result = subprocess.run([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT) + os.pathsep + str(ANDROID_JAR),
                         'ls.augment.com.TestModuleSystemSettings'], capture_output=True, text=True, check=True)
(OUT / 'result.txt').write_text(result.stdout, encoding='utf-8')
print(result.stdout.strip())
