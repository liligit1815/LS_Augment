"""Actual private-file cleaner fixture; marks unavailable host symlink support."""
from pathlib import Path
import json
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'audit-output/owned-file-cleaner'
OUTPUT.mkdir(parents=True, exist_ok=True)
JDK = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
javac = str(JDK / 'javac.exe') if (JDK / 'javac.exe').is_file() else 'javac'
java = str(JDK / 'java.exe') if (JDK / 'java.exe').is_file() else 'java'
with tempfile.TemporaryDirectory(prefix='classes-', dir=OUTPUT) as temporary:
    classes = Path(temporary).resolve()
    assert classes.is_relative_to(OUTPUT.resolve())
    subprocess.run([javac, '--release', '17', '-encoding', 'UTF-8', '-d', str(classes),
                    str(ROOT / 'android/app/src/main/java/ls/augment/com/OwnedFileCleaner.java'),
                    str(ROOT / 'tools/TestOwnedFileCleaner.java')], check=True, timeout=20)
    run = subprocess.run([java, '-cp', str(classes), 'ls.augment.com.TestOwnedFileCleaner'],
                         capture_output=True, text=True, timeout=20)
    print(run.stdout, end='')
    print(run.stderr, end='')
    report = {'success': run.returncode == 0, 'scope': 'ACTUAL_OWNED_FILE_CLEANER_HOST_TEMP_FIXTURES',
              'realSymlinksVerified': run.returncode == 0 and 'UNSUPPORTED' not in run.stdout,
              'stdout': run.stdout.strip(), 'stderr': run.stderr.strip()}
    (OUTPUT / 'result.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    raise SystemExit(run.returncode)
