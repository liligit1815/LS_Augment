"""Compile/run the production observer with the installed real libxposed API 102."""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--java-home', type=Path)
parser.add_argument('--api-jar', type=Path)
args = parser.parse_args()
java_home = args.java_home or (Path(os.environ['JAVA_HOME']) if os.environ.get('JAVA_HOME') else None)
if java_home is None and Path('C:/Program Files/Android/openjdk/jdk-21.0.8').is_dir():
    java_home = Path('C:/Program Files/Android/openjdk/jdk-21.0.8')
suffix = '.exe' if os.name == 'nt' else ''
javac = str(java_home / 'bin' / ('javac' + suffix)) if java_home else shutil.which('javac')
java = str(java_home / 'bin' / ('java' + suffix)) if java_home else shutil.which('java')
if not javac or not java:
    raise SystemExit('A JDK is required; pass --java-home or set JAVA_HOME.')

with tempfile.TemporaryDirectory(prefix='lsa-hook-telemetry-') as directory:
    temporary = Path(directory)
    api = args.api_jar
    if api is None:
        candidates = [ROOT / 'audit-output/volume-percent-review/libxposed-api.jar']
        caches = [ROOT / 'audit-output/gradle-cache/caches', Path.home() / '.gradle/caches']
        for cache in caches:
            if cache.is_dir():
                candidates.extend(cache.glob('*/transforms/*/transformed/api-102.0.0-api.jar'))
        api = next((candidate for candidate in candidates if candidate.is_file()), None)
        if api is None:
            for cache in caches:
                artifacts = list((cache / 'modules-2/files-2.1/io.github.libxposed/api/102.0.0').glob('*/*.aar'))
                if artifacts:
                    with zipfile.ZipFile(artifacts[0]) as artifact:
                        api = temporary / 'api-102.0.0.jar'
                        api.write_bytes(artifact.read('classes.jar'))
                    break
    if api is None or not api.is_file():
        raise SystemExit('Real libxposed API 102 jar required; pass --api-jar after resolving Gradle dependencies.')
    source = ROOT / 'android/app/src/main/java/ls/augment/com/hook/HookTelemetryObserver.java'
    test = ROOT / 'tools/TestHookTelemetryObserver.java'
    subprocess.run([javac, '-encoding', 'UTF-8', '--release', '17', '-cp', str(api), '-d',
                    str(temporary), str(source), str(test)], check=True)
    subprocess.run([java, '-cp', str(temporary) + os.pathsep + str(api),
                    'ls.augment.com.hook.TestHookTelemetryObserver'], check=True)
