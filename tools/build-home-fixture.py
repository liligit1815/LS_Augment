"""Build the isolated HOME probe offline; never installs or operates a device.

The exported Activity only renders a counter and records its own lifecycle and
incoming intent metadata. Registering a HOME intent filter makes it eligible for
the system's chooser; this app never requests a role or changes the default.
"""
from pathlib import Path
import hashlib
import json
import subprocess
import zipfile


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/home-fixture'
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.home'

SOURCE = r'''package ls.augment.regression.home;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Set;
import java.util.TreeSet;
import org.json.JSONArray;
import org.json.JSONObject;

public final class Probe extends Activity {
    private static final String MARKER = "LS HOME TEST";
    private final long instanceId = SystemClock.elapsedRealtimeNanos();
    private int clicks;
    private TextView counter;
    private TextView evidenceStatus;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        clicks = getPreferences(Context.MODE_PRIVATE).getInt("click_count", 0);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int inset = (int) (24 * getResources().getDisplayMetrics().density);
        root.setPadding(inset, inset, inset, inset);
        TextView title = new TextView(this);
        title.setText(MARKER);
        title.setTextSize(24);
        root.addView(title);
        TextView description = new TextView(this);
        description.setText("HOME intent and lifecycle probe\nNo default-role request");
        description.setTextSize(16);
        root.addView(description);
        counter = new TextView(this);
        counter.setTextSize(20);
        root.addView(counter);
        Button button = new Button(this);
        button.setText("COUNT HOME");
        button.setOnClickListener(view -> {
            clicks++;
            boolean saved = getPreferences(Context.MODE_PRIVATE).edit()
                    .putInt("click_count", clicks).commit();
            refreshCounter();
            record(saved ? "click" : "click_save_error", getIntent(), null);
        });
        root.addView(button);
        evidenceStatus = new TextView(this);
        evidenceStatus.setTextSize(14);
        evidenceStatus.setText("Evidence: private home-events.jsonl");
        root.addView(evidenceStatus);
        setContentView(root);
        refreshCounter();
        record("onCreate", getIntent(), null);
    }

    private void refreshCounter() {
        Intent intent = getIntent();
        counter.setText("Count: " + clicks + "\nTask: " + getTaskId()
                + "\nAction: " + (intent == null ? "null" : intent.getAction())
                + "\nCategories: " + (intent == null || intent.getCategories() == null
                        ? "[]" : new TreeSet<String>(intent.getCategories()).toString()));
    }

    @Override protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        refreshCounter();
        record("onNewIntent", intent, null);
    }

    @Override protected void onResume() {
        super.onResume();
        record("onResume", getIntent(), null);
    }

    @Override protected void onPause() {
        record("onPause", getIntent(), null);
        super.onPause();
    }

    @Override protected void onStop() {
        record("onStop", getIntent(), null);
        super.onStop();
    }

    @Override protected void onDestroy() {
        record("onDestroy", getIntent(), null);
        super.onDestroy();
    }

    @Override public void onWindowFocusChanged(boolean focused) {
        super.onWindowFocusChanged(focused);
        record("onWindowFocusChanged", getIntent(), focused);
    }

    private void record(String event, Intent intent, Boolean focusCallback) {
        try {
            JSONArray categories = new JSONArray();
            Set<String> received = intent == null ? null : intent.getCategories();
            if (received != null) {
                for (String category : new TreeSet<String>(received)) categories.put(category);
            }
            JSONObject row = new JSONObject().put("marker", MARKER).put("event", event)
                    .put("instance_id", instanceId).put("time_ms", System.currentTimeMillis())
                    .put("elapsed_ms", SystemClock.elapsedRealtime())
                    .put("pid", android.os.Process.myPid()).put("uid", android.os.Process.myUid())
                    .put("task_id", getTaskId()).put("click_count", clicks)
                    .put("window_focused", hasWindowFocus())
                    .put("in_multi_window", isInMultiWindowMode())
                    .put("intent_action", intent == null || intent.getAction() == null
                            ? JSONObject.NULL : intent.getAction())
                    .put("intent_categories", categories)
                    .put("intent_flags", intent == null ? 0 : intent.getFlags())
                    .put("intent_component", intent == null || intent.getComponent() == null
                            ? JSONObject.NULL : intent.getComponent().flattenToShortString());
            if (focusCallback != null) row.put("focus_callback", focusCallback);
            try (FileOutputStream stream = openFileOutput("home-events.jsonl", Context.MODE_APPEND)) {
                stream.write((row.toString() + "\n").getBytes(StandardCharsets.UTF_8));
            }
        } catch (Exception error) {
            if (evidenceStatus != null)
                evidenceStatus.setText("Evidence error: " + error.getClass().getSimpleName());
        }
    }
}
'''

MANIFEST = '''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="ls.augment.regression.home" android:versionCode="1" android:versionName="1">
    <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35" />
    <application android:label="LS Home Test" android:allowBackup="false"
        android:theme="@android:style/Theme.Material.Light.NoActionBar">
        <activity android:name=".Probe" android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.HOME" />
                <category android:name="android.intent.category.DEFAULT" />
            </intent-filter>
        </activity>
    </application>
</manifest>
'''


def run(*args):
    result = subprocess.run(list(map(str, args)), capture_output=True, text=True,
                            encoding='utf-8', errors='replace')
    if result.returncode != 0:
        raise RuntimeError(result.stdout + result.stderr)
    return result.stdout


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    source = OUT / 'Probe.java'
    source.write_text(SOURCE, encoding='utf-8')
    manifest = OUT / 'AndroidManifest.xml'
    manifest.write_text(MANIFEST, encoding='utf-8')
    source_hash = hashlib.sha256(SOURCE.encode()).hexdigest()
    classes = OUT / ('classes-' + source_hash[:16])
    classes.mkdir(exist_ok=True)
    run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
        '-cp', ANDROID, '-d', classes, source)
    run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '28', '--output', OUT,
        *sorted(classes.rglob('*.class')))
    unsigned, aligned, apk = [OUT / name for name in ('unsigned.apk', 'aligned.apk', 'home.apk')]
    run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(OUT / 'classes.dex', 'classes.dex')
    run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
    with zipfile.ZipFile(apk) as archive:
        if archive.read('classes.dex') != (OUT / 'classes.dex').read_bytes():
            raise RuntimeError('Signed APK DEX does not match the compiled DEX')
    signature = run(BUILD / 'apksigner.bat', 'verify', '--verbose', '--print-certs', apk)
    badging = run(BUILD / 'aapt2.exe', 'dump', 'badging', apk)
    binary_manifest = run(BUILD / 'aapt2.exe', 'dump', 'xmltree', '--file', 'AndroidManifest.xml', apk)
    dex_dump = run(BUILD / 'dexdump.exe', '-d', OUT / 'classes.dex')
    for filename, content in [('signature.txt', signature), ('badging.txt', badging),
                              ('binary-manifest.txt', binary_manifest), ('dexdump.txt', dex_dump)]:
        (OUT / filename).write_text(content, encoding='utf-8')
    if 'uses-permission:' in badging or 'E: uses-permission' in binary_manifest:
        raise RuntimeError('Probe unexpectedly requests a permission')
    if 'android.intent.category.LAUNCHER' in binary_manifest:
        raise RuntimeError('Probe unexpectedly declares a launcher icon')
    filters = binary_manifest.split('E: intent-filter')[1:]
    if not any(all(value in block for value in ('android.intent.action.MAIN',
               'android.intent.category.HOME', 'android.intent.category.DEFAULT')) for block in filters):
        raise RuntimeError('Binary manifest is missing the MAIN/HOME/DEFAULT filter')
    for expected in ('LS HOME TEST', 'COUNT HOME', 'home-events.jsonl', 'onCreate',
                     'onNewIntent', 'onResume', 'onPause', 'onWindowFocusChanged',
                     'getAction', 'getCategories', 'getTaskId', 'isInMultiWindowMode'):
        if expected not in dex_dump:
            raise RuntimeError('Expected DEX evidence missing: ' + expected)
    forbidden = ('Landroid/net/', 'Ljava/net/', 'Landroid/media/', 'Landroid/app/role/',
                 'Landroid/provider/Settings', 'Landroid/os/PowerManager',
                 'Landroid/app/Notification', 'getInstalledPackages', 'getInstalledApplications',
                 'queryIntentActivities', 'setComponentEnabledSetting', 'setKeepScreenOn',
                 'addPreferredActivity', 'setFlags', 'addFlags')
    for reference in forbidden:
        if reference in dex_dump:
            raise RuntimeError('Unexpected DEX reference: ' + reference)
    inventory = {
        'package': PACKAGE, 'component': PACKAGE + '/.Probe', 'apk': str(apk),
        'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'source_sha256': source_hash,
        'bytes': apk.stat().st_size, 'version_code': 1, 'installed': False,
        'ownedDisposable': True, 'requested_permissions': [],
        'marker': 'LS HOME TEST', 'button': 'COUNT HOME', 'display_name': 'LS Home Test',
        'private_events': '/data/user/0/' + PACKAGE + '/files/home-events.jsonl',
        'private_counter': '/data/user/0/' + PACKAGE + '/shared_prefs/Probe.xml',
        'intent_filters': [['android.intent.action.MAIN', 'android.intent.category.HOME',
                            'android.intent.category.DEFAULT']],
        'activity_launch_mode': 'standard (default)',
        'sets_or_requests_default_role': False,
        'verification': {'signature': 'passed', 'binary_manifest': 'passed', 'dex': 'passed'},
        'device_execution': 'not performed',
        'interpretation': 'Intent metadata supports comparison; prove actual HOME resolution with system task evidence.',
    }
    (OUT / 'inventory.json').write_text(json.dumps(inventory, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(inventory, ensure_ascii=False))


if __name__ == '__main__':
    main()
