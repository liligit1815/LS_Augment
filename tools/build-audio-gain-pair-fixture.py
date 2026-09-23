"""Locally build two fixed permission-free AudioTrack probes; never use ADB.

Reads (never imports/runs) the existing fixture's Java literal, preserving its
amplitude, per-track volume, 20-second wall deadline and frame limit. Adds only
explicit pause/resume and absolute monotonic evidence for overlapping sessions.
Old tools and the round110/111 APK evidence remain untouched.
"""
import argparse
import ast
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/audio-gain-pair-fixture'
ORIGINAL = ROOT / 'tools/build-audio-gain-fixture.py'
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
VARIANTS = {
    'primary': 'ls.augment.regression.audio',
    'secondary': 'ls.augment.regression.audio2',
}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def original_java():
    tree = ast.parse(ORIGINAL.read_text(encoding='utf-8'), filename=str(ORIGINAL))
    candidates = [node.value.args[0] for node in tree.body
                  if isinstance(node, ast.Expr) and isinstance(node.value, ast.Call)
                  and isinstance(node.value.func, ast.Attribute)
                  and isinstance(node.value.func.value, ast.Name)
                  and node.value.func.value.id == 'source'
                  and node.value.func.attr == 'write_text' and node.value.args]
    if len(candidates) != 1 or not isinstance(candidates[0], ast.Constant):
        raise RuntimeError('Original fixture Java literal changed; review before rebuilding')
    source = candidates[0].value
    if not isinstance(source, str) or not source.startswith('package ls.augment.regression.audio;'):
        raise RuntimeError('Unexpected original Java package/source')
    return source


def once(source, old, new):
    if source.count(old) != 1:
        raise RuntimeError('Original fixture changed at reviewed insertion point: ' + old[:80])
    return source.replace(old, new, 1)


def source_for(package, variant):
    source = original_java()
    source = once(source, 'package ls.augment.regression.audio;', f'package {package};')
    source = source.replace('LS AUDIO GAIN TEST', 'LS AUDIO GAIN ' + variant.upper())
    source = once(source, '        status.setTextSize(17);',
                  '        status.setTextSize(17);\n'
                  '        status.setMaxLines(6);')
    source = once(source, '        add(root, "STOP", this::stop);',
                  '        add(root, "PAUSE", () -> pauseRequested(true));\n'
                  '        add(root, "RESUME", () -> pauseRequested(false));\n'
                  '        add(root, "STOP", this::stop);')
    source = once(source, '    private void stop() {',
                  '    private void pauseRequested(boolean pause) {\n'
                  '        Playback current = active;\n'
                  '        if (current != null && !current.canceled.get())\n'
                  '            current.pauseRequested.set(pause);\n'
                  '    }\n\n'
                  '    private void stop() {')
    source = once(source, '        final AtomicBoolean canceled = new AtomicBoolean();',
                  '        final AtomicBoolean canceled = new AtomicBoolean();\n'
                  '        final AtomicBoolean pauseRequested = new AtomicBoolean();')
    source = once(source, '                long nextEvidence = SystemClock.elapsedRealtime();',
                  '                long nextEvidence = SystemClock.elapsedRealtime();\n'
                  '                boolean paused = false;')
    source = once(source,
                  '                while (!canceled.get() && SystemClock.elapsedRealtime() - startedAt < LIMIT_MS) {',
                  '''                while (!canceled.get() && SystemClock.elapsedRealtime() - startedAt < LIMIT_MS) {
                    // AudioTrack lifecycle stays on this single writer thread. No
                    // Activity lifecycle callback pauses when the other app opens.
                    boolean wantPaused = pauseRequested.get();
                    if (wantPaused != paused) {
                        if (canceled.get() || SystemClock.elapsedRealtime() - startedAt >= LIMIT_MS) break;
                        if (wantPaused) track.pause(); else track.play();
                        paused = wantPaused;
                        record(paused ? "paused" : "resumed");
                    }
                    if (paused) {
                        long now = SystemClock.elapsedRealtime();
                        if (now >= nextEvidence) { record("paused_progress"); nextEvidence = now + 250; }
                        Thread.sleep(5);
                        continue;
                    }''')
    source = once(source, '            JSONObject row = new JSONObject().put("event", event).put("run_id", runId)',
                  '            JSONObject row = new JSONObject().put("event", event).put("run_id", runId)\n'
                  '                    .put("package", context.getPackageName())\n'
                  '                    .put("elapsed_realtime_ms", SystemClock.elapsedRealtime())\n'
                  '                    .put("pause_requested", pauseRequested.get())')
    # Keep all evidence in JSONL, but do not let a 22-line JSON status push the
    # actual STOP/RESUME controls below the foreground screen.
    source = once(source, '            show(this, row.toString(1));',
                  '            show(this, "LS AUDIO GAIN ' + variant.upper() + ' / " + event\n'
                  '                    + "\\nusage=" + usage + " elapsed=" + (SystemClock.elapsedRealtime() - startedAt)\n'
                  '                    + "\\nUID=" + android.os.Process.myUid() + " PID=" + android.os.Process.myPid() + " session=" + session\n'
                  '                    + "\\nplay=" + play + " route=" + routeType + " head=" + head\n'
                  '                    + "\\nframes=" + submittedFrames + " nonzero=" + nonzeroSamples\n'
                  '                    + "\\nreason=" + stopReason + " error=" + errorType);')
    # Fail if the reused fixture's reviewed safety envelope changed. This is a
    # build guard, not evidence that a phone actually played/paused/stopped audio.
    for guard in ('private static final int AMPLITUDE = 256;',
                  'private static final float TRACK_VOLUME = 0.1f;',
                  'private static final long LIMIT_MS = 20000;',
                  'private static final long FRAME_LIMIT = SAMPLE_RATE * 20L;'):
        if guard not in source:
            raise RuntimeError('Original safety envelope changed: ' + guard)
    return source


def build_one(variant):
    package = VARIANTS[variant]
    directory = OUT / variant
    directory.mkdir(parents=True, exist_ok=True)
    # Every build gets fresh classes; no deletion, cross-variant class mixing or
    # recursive operation on a computed user-directory path is performed.
    classes = Path(tempfile.mkdtemp(prefix='classes-', dir=directory))
    if not classes.resolve().is_relative_to(directory.resolve()):
        raise RuntimeError('Unexpected classes directory')
    logs = []

    def run(label, *args):
        result = subprocess.run(list(map(str, args)), capture_output=True, text=True,
                                encoding='utf-8', errors='replace')
        log = directory / (label + '.txt')
        log.write_text(result.stdout + result.stderr, encoding='utf-8')
        logs.append(log.name)
        if result.returncode:
            raise RuntimeError(f'{label} failed ({result.returncode}); see {log}')
        return result.stdout + result.stderr

    source = directory / 'Probe.java'
    source.write_text(source_for(package, variant), encoding='utf-8')
    run('javac', JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
        '-cp', ANDROID, '-d', classes, source)
    class_files = sorted(classes.rglob('*.class'))
    expected = package.replace('.', '/') + '/'
    if not class_files or any(not p.relative_to(classes).as_posix().startswith(expected) for p in class_files):
        raise RuntimeError('Unexpected generated class package')
    run('d8', BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '29', '--output', directory, *class_files)
    manifest = directory / 'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="{package}" android:versionCode="2" android:versionName="2-pair">
    <uses-sdk android:minSdkVersion="29" android:targetSdkVersion="35" />
    <application android:label="LS audio {variant}" android:allowBackup="false">
        <activity android:name=".Probe" android:exported="true">
            <intent-filter><action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" /></intent-filter>
        </activity>
    </application>
</manifest>
''', encoding='utf-8')
    unsigned = directory / 'unsigned.apk'
    aligned = directory / 'aligned.apk'
    apk = directory / ('audio-gain-' + variant + '.apk')
    run('aapt2-link', BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(directory / 'classes.dex', 'classes.dex')
    run('zipalign-build', BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run('sign', BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
        '--ks-pass', 'pass:android', '--out', apk, aligned)
    run('signature', BUILD / 'apksigner.bat', 'verify', '--verbose', '--print-certs', apk)
    run('alignment', BUILD / 'zipalign.exe', '-c', '-v', '4', apk)
    badging = run('badging', BUILD / 'aapt2.exe', 'dump', 'badging', apk)
    tree = run('manifest', BUILD / 'aapt2.exe', 'dump', 'xmltree', apk, '--file', 'AndroidManifest.xml')
    dex = run('dex', BUILD / 'dexdump.exe', '-d', directory / 'classes.dex')
    if f"package: name='{package}'" not in badging or 'uses-permission' in badging:
        raise RuntimeError('Unexpected package or requested permissions')
    if any(token in tree for token in ('E: service', 'E: receiver', 'E: provider', 'sharedUserId', 'android:process')):
        raise RuntimeError('Unexpected shared process, shared UID or background component')
    own_class = 'L' + package.replace('.', '/') + '/Probe;'
    other_package = next(value for value in VARIANTS.values() if value != package)
    other_class = 'L' + other_package.replace('.', '/') + '/Probe;'
    if own_class not in dex or other_class in dex:
        raise RuntimeError('Unexpected dex class identity')
    with zipfile.ZipFile(apk) as archive:
        if archive.read('classes.dex') != (directory / 'classes.dex').read_bytes():
            raise RuntimeError('Signed dex differs from built dex')
    inventory = {
        'variant': variant, 'package': package, 'component': package + '/.Probe',
        'apk': str(apk), 'sha256': sha(apk), 'bytes': apk.stat().st_size,
        'java_source': str(source), 'java_sha256': sha(source),
        'base_builder_sha256': sha(ORIGINAL), 'pair_builder_sha256': sha(Path(__file__)),
        'version_code': 2, 'min_sdk': 29, 'target_sdk': 35,
        'requested_permissions': [], 'shared_uid': False, 'custom_process': False,
        'writer': 'One static executor in this package default process only',
        'amplitude': 256, 'track_volume': 0.1, 'sample_rate': 48000,
        'wall_deadline_ms': 20000, 'frame_limit': 960000, 'pause_extends_deadline': False,
        'network_or_recording_permission': False, 'audio_focus_or_system_volume_change': False,
        'creates_loudness_enhancer': False, 'manual_start_only': True,
        'private_evidence': '/data/user/0/' + package + '/files/audio-events.jsonl',
        'checks': ['javac', 'd8', 'signature', 'alignment', 'manifest-no-permissions',
                   'dex-class-identity', 'signed-dex-equality'],
        'build_logs': logs, 'installed': False, 'device_execution': 'not performed',
    }
    (directory / 'inventory.json').write_text(json.dumps(inventory, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    return inventory


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--variant', choices=['both', *VARIANTS], default='both')
    args = parser.parse_args()
    OUT.mkdir(parents=True, exist_ok=True)
    chosen = list(VARIANTS) if args.variant == 'both' else [args.variant]
    rows = [build_one(variant) for variant in chosen]
    (OUT / 'last-build.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for row in rows:
        print(row['package'], row['apk'], row['sha256'])


if __name__ == '__main__':
    main()
