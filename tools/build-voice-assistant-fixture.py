"""Build a local-only VoiceInteractionService fixture. Never invokes ADB.

Real VoiceInteractionSession.onShow calls alone increment show_count. The
fixture never requests audio/network permissions, creates a recognizer, reads
AssistState/AssistStructure, or inspects screenshots. Only invocation_type is
read from the entry Bundle. Session evidence is private JSONL and preferences.
"""
from pathlib import Path
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/voice-assistant-fixture'
OUT.mkdir(parents=True, exist_ok=True)
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.voiceassistant'


def run(*args):
    subprocess.run(list(map(str, args)), check=True, stdout=subprocess.DEVNULL)


sources = {
    'Evidence.java': r'''
package ls.augment.regression.voiceassistant;
import android.content.Context;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

final class Evidence {
    static void append(Context context, String filename, String json) {
        try (FileOutputStream output = context.openFileOutput(filename, Context.MODE_APPEND)) {
            output.write((json + "\n").getBytes(StandardCharsets.UTF_8));
            output.getFD().sync();
        } catch (Exception error) { throw new IllegalStateException("Evidence persistence failed", error); }
    }
}
''',
    'InteractionService.java': r'''
package ls.augment.regression.voiceassistant;
import android.content.SharedPreferences;
import android.service.voice.VoiceInteractionService;
import android.service.voice.VoiceInteractionSession;

public final class InteractionService extends VoiceInteractionService {
    @Override public void onReady() {
        super.onReady();
        // Disable context acquisition before any show request. No recognizer or
        // hotword detector is instantiated, and this service never shows itself.
        setDisabledShowContext(VoiceInteractionSession.SHOW_WITH_ASSIST
                | VoiceInteractionSession.SHOW_WITH_SCREENSHOT);
        SharedPreferences prefs = getSharedPreferences("service-state", MODE_PRIVATE);
        int count = prefs.getInt("ready_count", 0) + 1;
        if (!prefs.edit().putInt("ready_count", count).putBoolean("context_disabled", true).commit())
            throw new IllegalStateException("Ready evidence persistence failed");
        Evidence.append(this, "service-events.jsonl",
                "{\"event\":\"ready\",\"ready_count\":" + count + ",\"context_disabled\":true}");
    }
}
''',
    'SessionService.java': r'''
package ls.augment.regression.voiceassistant;
import android.os.Bundle;
import android.service.voice.VoiceInteractionSession;
import android.service.voice.VoiceInteractionSessionService;

public final class SessionService extends VoiceInteractionSessionService {
    @Override public VoiceInteractionSession onNewSession(Bundle args) {
        // onNewSession itself is not counted as a shown session.
        return new ProbeSession(this);
    }
}
''',
    'ProbeSession.java': r'''
package ls.augment.regression.voiceassistant;
import android.app.assist.AssistContent;
import android.app.assist.AssistStructure;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import android.service.voice.VoiceInteractionSession;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

public final class ProbeSession extends VoiceInteractionSession {
    private final Context context;
    private TextView status;
    private int showCount;
    private int invocation = -1;
    private boolean invocationPresent;
    private String evidenceError;

    ProbeSession(Context context) { super(context); this.context = context; }

    @Override public View onCreateContentView() {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(24 * context.getResources().getDisplayMetrics().density);
        root.setPadding(padding, padding, padding, padding);
        root.setBackgroundColor(Color.rgb(12, 35, 49));
        status = new TextView(context);
        status.setTextSize(24);
        status.setTextColor(Color.WHITE);
        root.addView(status);
        Button close = new Button(context);
        close.setText("CLOSE SESSION");
        close.setOnClickListener(view -> hide());
        root.addView(close);
        render();
        return root;
    }

    @Override public void onShow(Bundle args, int showFlags) {
        super.onShow(args, showFlags);
        // Read only this one non-sensitive integer. Never serialize the Bundle.
        Object value = args == null ? null : args.get("invocation_type");
        invocationPresent = value instanceof Integer;
        invocation = invocationPresent ? (Integer) value : -1;
        SharedPreferences prefs = context.getSharedPreferences("session-events", Context.MODE_PRIVATE);
        showCount = prefs.getInt("show_count", 0) + 1;
        evidenceError = null;
        try {
            if (!prefs.edit().putInt("show_count", showCount)
                    .putInt("last_invocation_type", invocation)
                    .putBoolean("last_invocation_present", invocationPresent)
                    .putInt("last_show_flags", showFlags).commit())
                throw new IllegalStateException("Session evidence persistence failed");
            Evidence.append(context, "session-events.jsonl", "{\"event\":\"show\",\"show_count\":"
                    + showCount + ",\"invocation_type\":" + invocation
                    + ",\"invocation_present\":" + invocationPresent + ",\"show_flags\":" + showFlags + "}");
        } catch (Exception error) { evidenceError = error.getClass().getSimpleName(); }
        render();
    }

    @Override public void onHide() {
        super.onHide();
        try {
            Evidence.append(context, "session-events.jsonl", "{\"event\":\"hide\",\"show_count\":" + showCount + "}");
        } catch (Exception ignored) { }
    }

    private void render() {
        if (status != null) status.setText("LS VOICE ASSISTANT TEST\nSHOW_COUNT=" + showCount
                + "\nINVOCATION_TYPE=" + invocation + "\nINVOCATION_PRESENT=" + invocationPresent
                + (evidenceError == null ? "" : "\nEVIDENCE ERROR=" + evidenceError));
    }

    // Do not call the default AssistState handler: it extracts assist data.
    @Override public void onHandleAssist(AssistState state) { }
    @Override public void onHandleAssist(Bundle data, AssistStructure structure, AssistContent content) { }
    @Override public void onHandleAssistSecondary(Bundle data, AssistStructure structure,
            AssistContent content, int index, int count) { }
    @Override public void onHandleScreenshot(Bitmap screenshot) { }
}
''',
    'NoAudioRecognitionService.java': r'''
package ls.augment.regression.voiceassistant;
import android.content.Intent;
import android.os.RemoteException;
import android.speech.RecognitionService;
import android.speech.SpeechRecognizer;

// Metadata requires a valid recognition service. This stub never records audio
// or performs recognition; any request gets a fixed non-sensitive error.
public final class NoAudioRecognitionService extends RecognitionService {
    private void unavailable(Callback callback) {
        try { callback.error(SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS); }
        catch (RemoteException ignored) { }
    }
    @Override protected void onStartListening(Intent intent, Callback callback) { unavailable(callback); }
    @Override protected void onStopListening(Callback callback) { unavailable(callback); }
    @Override protected void onCancel(Callback callback) { }
}
''',
    'StatusActivity.java': r'''
package ls.augment.regression.voiceassistant;
import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

// This is a status screen, not an ASSIST Activity. Launching it cannot increment
// the session counter or provide a substitute pass for VoiceInteractionSession.
public final class StatusActivity extends Activity {
    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        TextView text = new TextView(this);
        text.setPadding(36, 120, 36, 30);
        text.setTextSize(20);
        StringBuilder status = new StringBuilder("LS VOICE FIXTURE STATUS\nSelect LS temporary voice assistant in default digital assistant settings.\n");
        for (String filename : new String[]{"service-events.jsonl", "session-events.jsonl"}) {
            status.append('\n').append(filename).append('\n');
            try {
                File file = new File(getFilesDir(), filename);
                if (file.exists()) {
                    java.util.List<String> lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
                    for (int i = Math.max(0, lines.size() - 5); i < lines.size(); i++) status.append(lines.get(i)).append('\n');
                } else status.append("No events\n");
            } catch (Exception error) { status.append("ERROR ").append(error.getClass().getSimpleName()).append('\n'); }
        }
        text.setText(status.toString());
        setContentView(text);
    }
}
''',
}

source_dir = OUT / 'src'
source_dir.mkdir(exist_ok=True)
java_files = []
for name, content in sources.items():
    path = source_dir / name
    path.write_text(content.strip() + '\n', encoding='utf-8')
    java_files.append(path)
classes = OUT / 'classes'
classes.mkdir(exist_ok=True)
run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
    '-cp', ANDROID, '-d', classes, *java_files)
run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '29', '--output', OUT, *classes.rglob('*.class'))

resources = OUT / 'res/xml'
resources.mkdir(parents=True, exist_ok=True)
(resources / 'voice_interaction.xml').write_text('''<voice-interaction-service xmlns:android="http://schemas.android.com/apk/res/android"
    android:sessionService="ls.augment.regression.voiceassistant.SessionService"
    android:recognitionService="ls.augment.regression.voiceassistant.NoAudioRecognitionService"
    android:settingsActivity="ls.augment.regression.voiceassistant.StatusActivity"
    android:supportsAssist="true"
    android:supportsLaunchVoiceAssistFromKeyguard="false"
    android:supportsLocalInteraction="false" />
''', encoding='utf-8')
manifest = OUT / 'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="ls.augment.regression.voiceassistant" android:versionCode="1" android:versionName="1">
    <uses-sdk android:minSdkVersion="29" android:targetSdkVersion="35" />
    <application android:label="LS temporary voice assistant" android:allowBackup="false">
        <service android:name=".InteractionService" android:exported="true"
            android:permission="android.permission.BIND_VOICE_INTERACTION">
            <intent-filter><action android:name="android.service.voice.VoiceInteractionService" /></intent-filter>
            <meta-data android:name="android.voice_interaction" android:resource="@xml/voice_interaction" />
        </service>
        <service android:name=".SessionService" android:exported="true" android:process=":session"
            android:permission="android.permission.BIND_VOICE_INTERACTION" />
        <service android:name=".NoAudioRecognitionService" android:exported="true" android:process=":recognition"
            android:permission="android.permission.BIND_SPEECH_RECOGNITION">
            <intent-filter><action android:name="android.speech.RecognitionService" /></intent-filter>
        </service>
        <activity android:name=".StatusActivity" android:exported="true">
            <intent-filter><action android:name="android.intent.action.MAIN" /><category android:name="android.intent.category.LAUNCHER" /></intent-filter>
        </activity>
    </application>
</manifest>
''', encoding='utf-8')
compiled = OUT / 'compiled-res.zip'
run(BUILD / 'aapt2.exe', 'compile', '--dir', OUT / 'res', '-o', compiled)
unsigned, aligned, apk = [OUT / name for name in ('unsigned.apk', 'aligned.apk', 'voice-assistant.apk')]
run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest, compiled)
with zipfile.ZipFile(unsigned, 'a') as archive:
    archive.write(OUT / 'classes.dex', 'classes.dex')
run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
    '--ks-pass', 'pass:android', '--out', apk, aligned)
run(BUILD / 'apksigner.bat', 'verify', apk)
print(apk)
