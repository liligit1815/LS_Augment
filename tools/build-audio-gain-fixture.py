"""Build a permission-free AudioTrack probe; never invokes ADB or plays audio.

The three explicit foreground buttons use normal AudioTrack playback so the
system reports real active player/session/usage information to AudioGainHook.
No LoudnessEnhancer, audio focus, system-volume or ringer-mode API is called.
"""
from pathlib import Path
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/full-device-regression-20260908/audio-gain-fixture'
OUT.mkdir(parents=True, exist_ok=True)
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')


def run(*args):
    subprocess.run(list(map(str, args)), check=True, stdout=subprocess.DEVNULL)


source = OUT / 'Probe.java'
source.write_text(r'''package ls.augment.regression.audio;

import android.app.Activity;
import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioDeviceInfo;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

public final class Probe extends Activity {
    // A single worker also serializes tracks across Activity recreation. No
    // main-thread join, AudioTrack cross-thread stop, or concurrent writer.
    private static final ExecutorService WRITER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "LSA-AudioProbe");
        thread.setDaemon(true);
        return thread;
    });
    private static final int SAMPLE_RATE = 48000;
    private static final int CHUNK_FRAMES = 960;
    private static final int AMPLITUDE = 256;
    private static final float TRACK_VOLUME = 0.1f;
    private static final long LIMIT_MS = 20000;
    private static final long FRAME_LIMIT = SAMPLE_RATE * 20L;
    private final Handler main = new Handler(Looper.getMainLooper());
    private volatile boolean destroyed;
    private Playback active;
    private Integer pendingUsage;
    private TextView status;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(36, 120, 36, 24);
        status = new TextView(this);
        status.setTextSize(17);
        status.setText("LS AUDIO GAIN TEST\nIDLE\nPCM16 mono 48000 Hz / amplitude 256 / track volume 0.1\nMaximum 20 seconds");
        root.addView(status);
        add(root, "PLAY MEDIA", () -> request(AudioAttributes.USAGE_MEDIA));
        add(root, "PLAY RINGTONE", () -> request(AudioAttributes.USAGE_NOTIFICATION_RINGTONE));
        add(root, "PLAY ALARM", () -> request(AudioAttributes.USAGE_ALARM));
        add(root, "STOP", this::stop);
        setContentView(root);
    }

    private void add(LinearLayout root, String title, Runnable action) {
        Button button = new Button(this);
        button.setText(title);
        button.setOnClickListener(view -> {
            if (!destroyed && hasWindowFocus()) action.run();
        });
        root.addView(button);
    }

    private void request(int usage) {
        pendingUsage = usage;
        if (active == null) startPending();
        else active.cancel("switch_usage");
    }

    private void startPending() {
        if (destroyed || active != null || pendingUsage == null) return;
        int usage = pendingUsage;
        pendingUsage = null;
        Playback playback = new Playback(getApplicationContext(), usage);
        active = playback;
        status.setText("LS AUDIO GAIN TEST\nSTART REQUESTED\nUSAGE=" + usage);
        WRITER.execute(playback);
    }

    private void stop() {
        pendingUsage = null;
        if (active != null) active.cancel("stop_button");
    }

    @Override protected void onDestroy() {
        destroyed = true;
        pendingUsage = null;
        if (active != null) active.cancel("activity_destroyed");
        main.removeCallbacksAndMessages(null);
        super.onDestroy();
    }

    private void show(Playback owner, String json) {
        if (destroyed) return;
        main.post(() -> {
            if (!destroyed && active == owner)
                status.setText("LS AUDIO GAIN TEST\n" + json);
        });
    }

    private void finished(Playback owner) {
        if (destroyed) return;
        main.post(() -> {
            if (destroyed || active != owner) return;
            active = null;
            startPending();
        });
    }

    private final class Playback implements Runnable {
        final Context context;
        final int usage;
        final long runId = SystemClock.elapsedRealtimeNanos();
        final AtomicBoolean canceled = new AtomicBoolean();
        volatile String stopReason = "timeout_20s";
        AudioTrack track;
        FileOutputStream evidence;
        long startedAt;
        long submittedFrames;
        long nonzeroSamples;
        int session = -1;
        int nativeError;
        String errorType = "";

        Playback(Context context, int usage) { this.context = context; this.usage = usage; }

        void cancel(String reason) {
            stopReason = reason;
            canceled.set(true);
            // Non-blocking writes and <= 5 ms idle sleeps make cancellation
            // responsive without interrupting a thread reused by the next run.
        }

        @Override public void run() {
            startedAt = SystemClock.elapsedRealtime();
            try {
                evidence = context.openFileOutput("audio-events.jsonl", Context.MODE_APPEND);
                record("requested");
                if (canceled.get()) return;
                int minimum = AudioTrack.getMinBufferSize(SAMPLE_RATE, AudioFormat.CHANNEL_OUT_MONO,
                        AudioFormat.ENCODING_PCM_16BIT);
                if (minimum <= 0) { nativeError = minimum; throw new IllegalStateException(); }
                AudioAttributes attributes = new AudioAttributes.Builder().setUsage(usage)
                        .setContentType(usage == AudioAttributes.USAGE_MEDIA
                                ? AudioAttributes.CONTENT_TYPE_MUSIC : AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .build();
                AudioFormat format = new AudioFormat.Builder().setSampleRate(SAMPLE_RATE)
                        .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                        .setEncoding(AudioFormat.ENCODING_PCM_16BIT).build();
                track = new AudioTrack.Builder().setAudioAttributes(attributes).setAudioFormat(format)
                        .setTransferMode(AudioTrack.MODE_STREAM)
                        .setBufferSizeInBytes(Math.max(minimum, CHUNK_FRAMES * 2 * 4))
                        .setSessionId(AudioManager.AUDIO_SESSION_ID_GENERATE).build();
                if (track.getState() != AudioTrack.STATE_INITIALIZED) throw new IllegalStateException();
                session = track.getAudioSessionId();
                if (session <= 0) throw new IllegalStateException();
                int volumeResult = track.setVolume(TRACK_VOLUME);
                if (volumeResult != AudioTrack.SUCCESS) { nativeError = volumeResult; throw new IllegalStateException(); }
                record("initialized");
                if (canceled.get() || SystemClock.elapsedRealtime() - startedAt >= LIMIT_MS) return;
                track.play();
                record("started");
                short[] pcm = new short[CHUNK_FRAMES];
                int count = 0, offset = 0;
                long nextEvidence = SystemClock.elapsedRealtime();
                while (!canceled.get() && SystemClock.elapsedRealtime() - startedAt < LIMIT_MS) {
                    if (offset == count && submittedFrames < FRAME_LIMIT) {
                        count = (int) Math.min(CHUNK_FRAMES, FRAME_LIMIT - submittedFrames);
                        offset = 0;
                        for (int i = 0; i < count; i++) {
                            double phase = 2.0 * Math.PI * 440.0 * (submittedFrames + i) / SAMPLE_RATE;
                            pcm[i] = (short) Math.round(AMPLITUDE * Math.sin(phase));
                        }
                    }
                    int written = 0;
                    if (offset < count) {
                        written = track.write(pcm, offset, count - offset, AudioTrack.WRITE_NON_BLOCKING);
                        if (written < 0) { nativeError = written; throw new IllegalStateException(); }
                        for (int i = offset; i < offset + written; i++) {
                            if (pcm[i] != 0) nonzeroSamples++;
                        }
                        offset += written;
                        submittedFrames += written;
                    }
                    long now = SystemClock.elapsedRealtime();
                    if (now >= nextEvidence) { record("progress"); nextEvidence = now + 250; }
                    if (written == 0) Thread.sleep(5);
                }
            } catch (Exception error) {
                errorType = error.getClass().getSimpleName();
                stopReason = "error";
                recordBestEffort("error");
            } finally {
                // Pause + flush discards queued samples at STOP/deadline; merely
                // calling stop() on a streaming track can drain queued audio.
                try {
                    if (track != null) {
                        recordBestEffort("stopping");
                        if (track.getState() == AudioTrack.STATE_INITIALIZED) {
                            try { track.pause(); }
                            catch (Exception error) { errorType = error.getClass().getSimpleName(); recordBestEffort("pause_error"); }
                            try { track.flush(); }
                            catch (Exception error) { errorType = error.getClass().getSimpleName(); recordBestEffort("flush_error"); }
                            try { track.stop(); }
                            catch (Exception error) { errorType = error.getClass().getSimpleName(); recordBestEffort("stop_error"); }
                            recordBestEffort("stopped");
                        }
                    }
                } finally {
                    try {
                        if (track != null) {
                            try { track.release(); recordBestEffort("released"); }
                            catch (Exception error) { errorType = error.getClass().getSimpleName(); recordBestEffort("release_error"); }
                        } else recordBestEffort("canceled_before_track");
                    } finally {
                        try { if (evidence != null) evidence.close(); }
                        catch (Exception error) { show(this, "EVIDENCE_CLOSE_ERROR=" + error.getClass().getSimpleName()); }
                        finished(this);
                    }
                }
            }
        }

        private void recordBestEffort(String event) {
            try { record(event); }
            catch (Exception error) { show(this, "EVIDENCE_ERROR=" + error.getClass().getSimpleName()); }
        }

        private void record(String event) throws Exception {
            int state = track == null ? -1 : track.getState();
            int play = track == null ? -1 : track.getPlayState();
            long head = -1;
            int routeType = -1;
            if (track != null && state == AudioTrack.STATE_INITIALIZED) {
                head = Integer.toUnsignedLong(track.getPlaybackHeadPosition());
                AudioDeviceInfo device = track.getRoutedDevice();
                routeType = device == null ? 0 : device.getType();
            }
            JSONObject row = new JSONObject().put("event", event).put("run_id", runId)
                    .put("pid", android.os.Process.myPid()).put("uid", android.os.Process.myUid())
                    .put("session_id", session).put("usage", usage).put("track_state", state)
                    .put("play_state", play).put("playback_head", head).put("routed_device_type", routeType)
                    .put("submitted_frames", submittedFrames)
                    .put("nonzero_samples", nonzeroSamples)
                    .put("elapsed_ms", SystemClock.elapsedRealtime() - startedAt)
                    .put("reason", stopReason).put("error_type", errorType).put("native_error_code", nativeError);
            String json = row.toString();
            // No device names, addresses, stream recordings, or exception message text.
            if (evidence == null) throw new IllegalStateException();
            evidence.write((json + "\n").getBytes(StandardCharsets.UTF_8));
            evidence.flush();
            show(this, row.toString(1));
        }
    }
}
''', encoding='utf-8')

classes = OUT / 'classes'
classes.mkdir(exist_ok=True)
run(JAVA / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
    '-cp', ANDROID, '-d', classes, source)
run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '29', '--output', OUT, *classes.rglob('*.class'))
manifest = OUT / 'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="ls.augment.regression.audio" android:versionCode="1" android:versionName="1">
    <uses-sdk android:minSdkVersion="29" android:targetSdkVersion="35" />
    <application android:label="LS temporary audio" android:allowBackup="false">
        <activity android:name=".Probe" android:exported="true">
            <intent-filter><action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" /></intent-filter>
        </activity>
    </application>
</manifest>
''', encoding='utf-8')
unsigned, aligned, apk = [OUT / name for name in ('unsigned.apk', 'aligned.apk', 'audio-gain.apk')]
run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', manifest)
with zipfile.ZipFile(unsigned, 'a') as archive:
    archive.write(OUT / 'classes.dex', 'classes.dex')
run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
    '--ks-pass', 'pass:android', '--out', apk, aligned)
run(BUILD / 'apksigner.bat', 'verify', apk)
print(apk)
