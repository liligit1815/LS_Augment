"""Compile and run the real update contract with the cached org.json test runtime."""
import argparse
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--java-home', type=Path)
    parser.add_argument('--json-jar', type=Path)
    parser.add_argument('--manifest', type=Path, help='Optional published redmagic-duo JSON to verify')
    args = parser.parse_args()
    java_home = args.java_home or (Path(os.environ['JAVA_HOME']) if os.environ.get('JAVA_HOME') else None)
    suffix = '.exe' if os.name == 'nt' else ''
    java = str(java_home / 'bin' / ('java' + suffix)) if java_home else shutil.which('java')
    javac = str(java_home / 'bin' / ('javac' + suffix)) if java_home else shutil.which('javac')
    if not java or not javac:
        parser.error('Set JAVA_HOME or pass --java-home to a JDK.')
    jars = list((Path.home() / '.gradle/caches/modules-2/files-2.1/org.json/json/20240303').glob('*/json-20240303.jar'))
    json_jar = args.json_jar or (jars[0] if jars else None)
    if json_jar is None or not json_jar.is_file():
        parser.error('Pass --json-jar with the org.json 20240303 JVM test artifact.')
    output = ROOT / 'audit-output/app-update-tests'
    output.mkdir(parents=True, exist_ok=True)
    sources = [ROOT / 'android/app/src/main/java/ls/augment/com' / name for name in ('AppUpdatePolicy.java', 'AppUpdateManifest.java')]
    sources.append(ROOT / 'tools/TestAppUpdates.java')
    subprocess.run([javac, '-encoding', 'UTF-8', '-cp', str(json_jar), '-d', str(output), *map(str, sources)], check=True)
    command = [java, '-cp', str(output) + os.pathsep + str(json_jar), 'ls.augment.com.TestAppUpdates']
    if args.manifest:
        command.append(str(args.manifest.resolve()))
    subprocess.run(command, check=True)


if __name__ == '__main__':
    main()
