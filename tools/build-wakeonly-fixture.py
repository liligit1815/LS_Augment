"""Build the isolated wake-only game probe locally; never installs or uses ADB.

The Activity only renders a counter and records its own lifecycle/touch events.
It requests no permissions and does not keep the display or CPU awake. The
manifest's non-resizable declaration is not evidence of the ROM's game policy.
"""
from pathlib import Path
import hashlib
import json
import subprocess
import zipfile


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/wakeonly-fixture'
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.wakeonly'

SOURCE = r'''package ls.augment.regression.wakeonly;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

public final class Probe extends Activity {
    private static final String MARKER = "LS WAKEONLY TEST";
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
        description.setText("Plain non-resizable game probe\nNo app-controlled screen hold");
        description.setTextSize(16);
        root.addView(description);
        counter = new TextView(this);
        counter.setTextSize(22);
        root.addView(counter);
        Button button = new Button(this);
        button.setText("COUNT WAKEONLY");
        button.setOnClickListener(view -> {
            clicks++;
            boolean saved = getPreferences(Context.MODE_PRIVATE).edit()
                    .putInt("click_count", clicks).commit();
            refreshCounter();
            record(saved ? "click" : "click_save_error", null);
        });
        root.addView(button);
        evidenceStatus = new TextView(this);
        evidenceStatus.setTextSize(14);
        evidenceStatus.setText("Evidence: private JSONL");
        root.addView(evidenceStatus);
        setContentView(root);
        refreshCounter();
        record("onCreate", null);
    }

    private void refreshCounter() {
        counter.setText("Clicks: " + clicks + "\nTask: " + getTaskId());
    }

    @Override protected void onResume() {
        super.onResume();
        record("onResume", null);
    }

    @Override protected void onPause() {
        record("onPause", null);
        super.onPause();
    }

    @Override protected void onStop() {
        record("onStop", null);
        super.onStop();
    }

    @Override protected void onDestroy() {
        record("onDestroy", null);
        super.onDestroy();
    }

    @Override public void onWindowFocusChanged(boolean focused) {
        super.onWindowFocusChanged(focused);
        record(focused ? "focus_gained" : "focus_lost", null);
    }

    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        // Capture gesture boundaries without filling the evidence with MOVE samples.
        if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_UP
                || action == MotionEvent.ACTION_CANCEL) record("touch", event);
        return super.dispatchTouchEvent(event);
    }

    private void record(String event, MotionEvent touch) {
        try {
            JSONObject row = new JSONObject().put("marker", MARKER).put("event", event)
                    .put("instance_id", instanceId).put("time_ms", System.currentTimeMillis())
                    .put("elapsed_ms", SystemClock.elapsedRealtime())
                    .put("pid", android.os.Process.myPid()).put("uid", android.os.Process.myUid())
                    .put("task_id", getTaskId()).put("click_count", clicks)
                    .put("window_focused", hasWindowFocus())
                    .put("in_multi_window", isInMultiWindowMode());
            if (touch != null) {
                row.put("action", touch.getActionMasked()).put("event_time_ms", touch.getEventTime())
                        .put("x", Math.round(touch.getX())).put("y", Math.round(touch.getY()));
            }
            try (FileOutputStream stream = openFileOutput("wakeonly-events.jsonl", Context.MODE_APPEND)) {
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
    package="ls.augment.regression.wakeonly" android:versionCode="1" android:versionName="1">
    <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35" />
    <application android:label="LS Wake Only Test" android:allowBackup="false"
        android:appCategory="game" android:resizeableActivity="false"
        android:theme="@android:style/Theme.Material.Light.NoActionBar">
        <activity android:name=".Probe" android:exported="true" android:resizeableActivity="false">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
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
    # Separate class directories by source to avoid retaining obsolete inner classes.
    source_hash = hashlib.sha256(SOURCE.encode()).hexdigest()
    classes = OUT / ('classes-' + source_hash[:16])
    classes.mkdir(exist_ok=True)
    run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
        '-cp', ANDROID, '-d', classes, source)
    run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '28', '--output', OUT,
        *sorted(classes.rglob('*.class')))
    unsigned, aligned, apk = [OUT / name for name in ('unsigned.apk', 'aligned.apk', 'wakeonly.apk')]
    run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(OUT / 'classes.dex', 'classes.dex')
    run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
    signature = run(BUILD / 'apksigner.bat', 'verify', '--verbose', '--print-certs', apk)
    badging = run(BUILD / 'aapt2.exe', 'dump', 'badging', apk)
    binary_manifest = run(BUILD / 'aapt2.exe', 'dump', 'xmltree', '--file', 'AndroidManifest.xml', apk)
    (OUT / 'signature.txt').write_text(signature, encoding='utf-8')
    (OUT / 'badging.txt').write_text(badging, encoding='utf-8')
    (OUT / 'binary-manifest.txt').write_text(binary_manifest, encoding='utf-8')
    if 'uses-permission:' in badging or 'E: uses-permission' in binary_manifest:
        raise RuntimeError('Probe unexpectedly requests a permission')
    inventory = {
        'package': PACKAGE, 'component': PACKAGE + '/.Probe', 'apk': str(apk),
        'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'source_sha256': source_hash,
        'bytes': apk.stat().st_size, 'version_code': 1, 'installed': False,
        'ownedDisposable': True, 'requested_permissions': [],
        'marker': 'LS WAKEONLY TEST', 'button': 'COUNT WAKEONLY',
        'private_events': '/data/user/0/' + PACKAGE + '/files/wakeonly-events.jsonl',
        'manifest_resizable': False, 'app_category': 'game',
        'rom_freeform_eligibility': 'not tested; validate using native game UI and task state',
        'device_execution': 'not performed',
    }
    (OUT / 'inventory.json').write_text(json.dumps(inventory, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(inventory, ensure_ascii=False))


if __name__ == '__main__':
    main()
