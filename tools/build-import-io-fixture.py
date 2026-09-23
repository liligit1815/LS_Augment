"""Build a local SAF provider for real, reliable-pipe import I/O failures.

No device calls. --payload must name an explicitly supplied local UTF-8 module
export; otherwise only two harmless, owned marker settings are embedded. All
documents expose exactly the same valid bytes, padded with JSON whitespace to
16 KiB so a reader must consume multiple chunks. EOF status or delivery delay differs.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUT = ROOT / 'out/full-device-regression-20260908/import-io-fixture-v2'
PACKAGE = 'ls.augment.regression.importio'
MAX_BYTES = 32 * 1024 * 1024

SOURCE = r'''package ls.augment.regression.importio;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.DocumentsContract;
import android.provider.DocumentsProvider;
import android.system.Os;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONObject;

public final class Probe extends Activity {
    static final String AUTHORITY = "ls.augment.regression.importio.documents";
    static final String ROOT_ID = "owned-root";
    static final String HEALTHY = "healthy";
    static final String FAILING = "read-error";
    static final String SLOW = "slow-healthy";
    static final String ERROR = "LSA_IO_FIXTURE_INJECTED_READ_ERROR";
    static final String EVENTS = "import-io-events.jsonl";
    static final AtomicLong SEQUENCE = new AtomicLong();
    private TextView status;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(30, 100, 30, 30);
        TextView title = new TextView(this);
        title.setText("LS IMPORT IO TEST\nThree owned JSON documents; no network or user document access.");
        title.setTextSize(22);
        body.addView(title);
        TextView instructions = new TextView(this);
        instructions.setText("In LS configuration import, open the system file picker, choose LS Import IO Test, then an owned JSON document.\nAll have identical valid bytes. 02-read-error.json ends with a reliable-pipe I/O error. 03-slow-healthy.json pauses for 6 seconds after its first 4096 bytes, then finishes normally.\nThe optional self-check below still checks only 01 and 02; it does not test module import atomicity or lifecycle.");
        body.addView(instructions);
        Button check = new Button(this);
        check.setText("RUN OWN PIPE CHECK");
        check.setContentDescription("import_io_self_check");
        check.setOnClickListener(v -> {
            check.setEnabled(false);
            status.setText("Checking only the two owned documents...");
            new Thread(() -> {
                String result = selfCheck(HEALTHY) + "\n" + selfCheck(FAILING);
                runOnUiThread(() -> { status.setText(result); check.setEnabled(true); });
            }, "LS-import-io-self-check").start();
        });
        body.addView(check);
        Button refresh = new Button(this);
        refresh.setText("SHOW PRIVATE EVENTS");
        refresh.setContentDescription("import_io_show_events");
        refresh.setOnClickListener(v -> showEvents());
        body.addView(refresh);
        status = new TextView(this);
        status.setText("READY\nProvider: LS Import IO Test");
        status.setTextIsSelectable(true);
        body.addView(status);
        ScrollView scroll = new ScrollView(this);
        scroll.addView(body);
        setContentView(scroll);
    }

    private String selfCheck(String document) {
        long read = 0;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            Uri uri = DocumentsContract.buildDocumentUri(AUTHORITY, document);
            try (InputStream input = getContentResolver().openInputStream(uri)) {
                if (input == null) throw new IOException("null owned input");
                byte[] chunk = new byte[8192];
                int count;
                while ((count = input.read(chunk)) != -1) {
                    read += count;
                    digest.update(chunk, 0, count);
                }
            }
            event(this, "self_check_eof", document, "", read, "sha256", hex(digest.digest()));
            return document + ": CLEAN EOF; bytes=" + read;
        } catch (IOException error) {
            event(this, "self_check_io_exception", document, "", read,
                    "error_class", error.getClass().getSimpleName(),
                    "injected_error_observed", String.valueOf(error.getMessage()).contains(ERROR));
            return document + ": IOException after bytes=" + read
                    + "; injected=" + String.valueOf(error.getMessage()).contains(ERROR);
        } catch (Exception error) {
            event(this, "self_check_other_error", document, "", read,
                    "error_class", error.getClass().getSimpleName());
            return document + ": " + error.getClass().getSimpleName();
        }
    }

    private void showEvents() {
        File file = new File(getFilesDir(), EVENTS);
        if (!file.exists()) { status.setText("NO EVENTS"); return; }
        try (InputStream input = new FileInputStream(file)) {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] bytes = new byte[4096];
            int count;
            while ((count = input.read(bytes)) != -1 && output.size() < 256 * 1024) {
                output.write(bytes, 0, count);
            }
            String text = new String(output.toByteArray(), StandardCharsets.UTF_8);
            status.setText(text.substring(Math.max(0, text.length() - 12000)));
        } catch (IOException error) { status.setText(error.getClass().getSimpleName()); }
    }

    static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder();
        for (byte value : bytes) out.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        return out.toString();
    }

    static synchronized void event(Context context, String event, String document,
            String attempt, long written, Object... fields) {
        try {
            JSONObject item = new JSONObject().put("event", event).put("document", document)
                    .put("attempt", attempt).put("bytes", written)
                    .put("elapsed_ms", SystemClock.elapsedRealtime())
                    .put("pid", android.os.Process.myPid());
            for (int i = 0; i + 1 < fields.length; i += 2) item.put((String) fields[i], fields[i + 1]);
            try (FileOutputStream output = context.openFileOutput(EVENTS, Context.MODE_APPEND)) {
                output.write((item.toString() + "\n").getBytes(StandardCharsets.UTF_8));
            }
        } catch (Exception error) {
            android.util.Log.e("LSA-ImportIO", "Private evidence write failed: " + error.getClass().getSimpleName());
        }
    }

    public static final class DocumentProvider extends DocumentsProvider {
        private byte[] payload;
        private String payloadHash;
        private static final String[] ROOT_COLUMNS = {
            DocumentsContract.Root.COLUMN_ROOT_ID, DocumentsContract.Root.COLUMN_DOCUMENT_ID,
            DocumentsContract.Root.COLUMN_TITLE, DocumentsContract.Root.COLUMN_SUMMARY,
            DocumentsContract.Root.COLUMN_FLAGS, DocumentsContract.Root.COLUMN_MIME_TYPES,
            DocumentsContract.Root.COLUMN_AVAILABLE_BYTES, DocumentsContract.Root.COLUMN_ICON };
        private static final String[] DOCUMENT_COLUMNS = {
            DocumentsContract.Document.COLUMN_DOCUMENT_ID, DocumentsContract.Document.COLUMN_DISPLAY_NAME,
            DocumentsContract.Document.COLUMN_MIME_TYPE, DocumentsContract.Document.COLUMN_FLAGS,
            DocumentsContract.Document.COLUMN_SIZE, DocumentsContract.Document.COLUMN_LAST_MODIFIED };

        @Override public boolean onCreate() {
            try (InputStream input = getContext().getAssets().open("config.json")) {
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] chunk = new byte[8192];
                int count;
                while ((count = input.read(chunk)) != -1) output.write(chunk, 0, count);
                payload = output.toByteArray();
                payloadHash = hex(MessageDigest.getInstance("SHA-256").digest(payload));
                return true;
            } catch (Exception error) {
                event(getContext(), "provider_init_error", ROOT_ID, "", 0,
                        "error_class", error.getClass().getSimpleName());
                return false;
            }
        }

        @Override public Cursor queryRoots(String[] projection) {
            MatrixCursor cursor = new MatrixCursor(projection == null ? ROOT_COLUMNS : projection);
            MatrixCursor.RowBuilder row = cursor.newRow();
            put(row, cursor, DocumentsContract.Root.COLUMN_ROOT_ID, ROOT_ID);
            put(row, cursor, DocumentsContract.Root.COLUMN_DOCUMENT_ID, ROOT_ID);
            put(row, cursor, DocumentsContract.Root.COLUMN_TITLE, "LS Import IO Test");
            put(row, cursor, DocumentsContract.Root.COLUMN_SUMMARY, "Three owned JSON documents");
            put(row, cursor, DocumentsContract.Root.COLUMN_FLAGS, DocumentsContract.Root.FLAG_LOCAL_ONLY);
            put(row, cursor, DocumentsContract.Root.COLUMN_MIME_TYPES, "application/json");
            put(row, cursor, DocumentsContract.Root.COLUMN_AVAILABLE_BYTES, -1);
            put(row, cursor, DocumentsContract.Root.COLUMN_ICON, android.R.drawable.ic_menu_save);
            return cursor;
        }

        @Override public Cursor queryDocument(String id, String[] projection) throws FileNotFoundException {
            requireId(id);
            MatrixCursor cursor = new MatrixCursor(projection == null ? DOCUMENT_COLUMNS : projection);
            addDocument(cursor, id);
            return cursor;
        }

        @Override public Cursor queryChildDocuments(String parent, String[] projection, String sortOrder)
                throws FileNotFoundException {
            if (!ROOT_ID.equals(parent)) throw new FileNotFoundException("Not an owned root");
            MatrixCursor cursor = new MatrixCursor(projection == null ? DOCUMENT_COLUMNS : projection);
            addDocument(cursor, HEALTHY);
            addDocument(cursor, FAILING);
            addDocument(cursor, SLOW);
            return cursor;
        }

        @Override public boolean isChildDocument(String parent, String document) {
            return ROOT_ID.equals(parent) && (HEALTHY.equals(document) || FAILING.equals(document) || SLOW.equals(document));
        }

        private void addDocument(MatrixCursor cursor, String id) {
            boolean root = ROOT_ID.equals(id);
            MatrixCursor.RowBuilder row = cursor.newRow();
            put(row, cursor, DocumentsContract.Document.COLUMN_DOCUMENT_ID, id);
            put(row, cursor, DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                    root ? "LS Import IO Test" : HEALTHY.equals(id) ? "01-healthy.json"
                            : FAILING.equals(id) ? "02-read-error.json" : "03-slow-healthy.json");
            put(row, cursor, DocumentsContract.Document.COLUMN_MIME_TYPE,
                    root ? DocumentsContract.Document.MIME_TYPE_DIR : "application/json");
            put(row, cursor, DocumentsContract.Document.COLUMN_FLAGS, 0);
            put(row, cursor, DocumentsContract.Document.COLUMN_SIZE, root ? null : payload.length);
            put(row, cursor, DocumentsContract.Document.COLUMN_LAST_MODIFIED, 0);
        }

        private static void put(MatrixCursor.RowBuilder row, MatrixCursor cursor, String column, Object value) {
            if (cursor.getColumnIndex(column) >= 0) row.add(column, value);
        }

        private static void requireId(String id) throws FileNotFoundException {
            if (!ROOT_ID.equals(id) && !HEALTHY.equals(id) && !FAILING.equals(id) && !SLOW.equals(id))
                throw new FileNotFoundException("Unknown owned document");
        }

        @Override public ParcelFileDescriptor openDocument(String id, String mode, CancellationSignal signal)
                throws FileNotFoundException {
            requireId(id);
            if (ROOT_ID.equals(id) || !"r".equals(mode)) throw new FileNotFoundException("Read-only owned file required");
            if (signal != null) signal.throwIfCanceled();
            String attempt = SystemClock.elapsedRealtime() + "-" + SEQUENCE.incrementAndGet();
            int caller = android.os.Binder.getCallingUid();
            event(getContext(), "open_document", id, attempt, 0,
                    "caller_uid", caller, "mode", mode, "payload_bytes", payload.length,
                    "payload_sha256", payloadHash, "failure_expected", FAILING.equals(id));
            try {
                ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createReliablePipe();
                ParcelFileDescriptor writer = pipe[1];
                if (signal != null) signal.setOnCancelListener(() -> {
                    event(getContext(), "canceled", id, attempt, 0);
                    try { writer.closeWithError("LSA_IO_FIXTURE_CANCELED"); }
                    catch (IOException ignored) { }
                });
                Thread worker = new Thread(() -> writeDocument(id, attempt, writer), "LS-import-io-writer");
                worker.setDaemon(true);
                worker.start();
                return pipe[0];
            } catch (IOException error) {
                event(getContext(), "pipe_creation_failed", id, attempt, 0,
                        "error_class", error.getClass().getSimpleName());
                throw new FileNotFoundException("Owned reliable pipe unavailable");
            }
        }

        private void writeDocument(String id, String attempt, ParcelFileDescriptor writer) {
            int written = 0;
            try {
                // Write identical COMPLETE valid JSON for all documents. JSON whitespace
                // ensures multiple reads, and a brief split makes partial delivery observable.
                while (written < payload.length) {
                    int count = Os.write(writer.getFileDescriptor(), payload, written,
                            Math.min(4096, payload.length - written));
                    if (count <= 0) throw new IOException("No owned pipe write progress");
                    written += count;
                    event(getContext(), "write_progress", id, attempt, written);
                    if (written == 4096) {
                        if (SLOW.equals(id)) {
                            event(getContext(), "slow_pause_started", id, attempt, written, "pause_ms", 6000);
                            SystemClock.sleep(6000);
                            event(getContext(), "slow_pause_finished", id, attempt, written, "pause_ms", 6000);
                        } else {
                            SystemClock.sleep(150);
                        }
                    }
                }
                event(getContext(), "payload_complete", id, attempt, written,
                        "payload_sha256", payloadHash);
                if (FAILING.equals(id)) {
                    writer.closeWithError(ERROR);
                    event(getContext(), "close_with_error", id, attempt, written, "error_marker", ERROR);
                } else {
                    writer.close();
                    event(getContext(), "close_clean", id, attempt, written);
                }
            } catch (Exception error) {
                event(getContext(), "writer_failure", id, attempt, written,
                        "error_class", error.getClass().getSimpleName());
                try { writer.closeWithError("LSA_IO_FIXTURE_WRITER_FAILURE"); }
                catch (IOException ignored) { }
            } finally {
                try { writer.close(); } catch (IOException ignored) { }
            }
        }
    }
}
'''


def run(*args: object) -> str:
    result = subprocess.run([str(arg) for arg in args], check=True,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                            encoding='utf-8', errors='replace')
    return result.stdout + result.stderr


def payload_bytes(path: Path | None) -> tuple[bytes, dict]:
    if path is None:
        document = {
            'format': 'LS_Augment.settings', 'version': 1,
            'moduleVersion': 'owned-import-io-fixture', 'exportedAt': 0,
            'settings': {'ls_augment_tile_label': 'SAF_IO_FIXTURE',
                         'ls_augment_store_download_count': '11'},
            'images': {}, 'fonts': {},
        }
        raw = (json.dumps(document, ensure_ascii=False, indent=2) + '\n').encode('utf-8')
    else:
        raw = path.resolve(strict=True).read_bytes()
        document = json.loads(raw.decode('utf-8'))
    if not isinstance(document, dict) or document.get('format') != 'LS_Augment.settings' or document.get('version') != 1:
        raise ValueError('Payload must be a version 1 LS_Augment.settings document')
    settings = document.get('settings')
    if not isinstance(settings, dict) or not settings or not all(isinstance(k, str) and isinstance(v, str) for k, v in settings.items()):
        raise ValueError('Payload settings must be a non-empty object of string values')
    for key in ('images', 'fonts'):
        if key in document and not isinstance(document[key], dict):
            raise ValueError(f'Payload {key} must be an object')
    if len(raw) > MAX_BYTES:
        raise ValueError('Payload exceeds the actual importer 32 MiB maximum')
    raw += b' ' * max(0, 16384 - len(raw))
    assert json.loads(raw.decode('utf-8')) == document
    return raw, document


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--payload', type=Path, help='Explicit local valid export to embed; never fetched from a device')
    parser.add_argument('--output-dir', type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()
    payload, document = payload_bytes(args.payload)
    out = args.output_dir.resolve()
    out.mkdir(parents=True, exist_ok=True)
    sdk = Path(os.environ.get('ANDROID_SDK_ROOT', Path.home() / 'AppData/Local/Android/Sdk'))
    build = sdk / 'build-tools/36.0.0'
    android = sdk / 'platforms/android-36/android.jar'
    java = Path('C:/Program Files/Java/jdk-17/bin')
    source = out / 'Probe.java'
    source.write_text(SOURCE, encoding='utf-8')
    assets = out / 'assets'
    assets.mkdir(exist_ok=True)
    (assets / 'config.json').write_bytes(payload)
    manifest = out / 'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PACKAGE}" android:versionCode="2" android:versionName="2">
 <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
 <application android:label="LS Import IO Test" android:allowBackup="false" android:theme="@android:style/Theme.Material.Light.NoActionBar">
  <activity android:name=".Probe" android:exported="true"><intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/></intent-filter></activity>
  <provider android:name=".Probe$DocumentProvider" android:authorities="{PACKAGE}.documents" android:exported="true" android:grantUriPermissions="true" android:permission="android.permission.MANAGE_DOCUMENTS">
   <intent-filter><action android:name="android.content.action.DOCUMENTS_PROVIDER"/></intent-filter>
  </provider>
 </application>
</manifest>''', encoding='utf-8')
    # Fresh classes prevent stale nested classes from another build entering the APK.
    with tempfile.TemporaryDirectory(prefix='compile-', dir=out) as temporary:
        classes = Path(temporary)
        compile_log = run(java / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
                          '-cp', android, '-d', classes, source)
        run(build / 'd8.bat', '--lib', android, '--min-api', '28', '--output', out,
            *sorted(classes.rglob('*.class')))
    unsigned, aligned, apk = (out / name for name in ('unsigned.apk', 'aligned.apk', 'import-io.apk'))
    run(build / 'aapt2.exe', 'link', '-o', unsigned, '-I', android,
        '--manifest', manifest, '-A', assets)
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(out / 'classes.dex', 'classes.dex')
    run(build / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run(build / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
    signature_log = run(build / 'apksigner.bat', 'verify', '--verbose', '--print-certs', apk)
    alignment_log = run(build / 'zipalign.exe', '-c', '-v', '4', apk)
    compiled_manifest = run(build / 'aapt2.exe', 'dump', 'xmltree', apk, '--file', 'AndroidManifest.xml')
    assert 'android.permission.MANAGE_DOCUMENTS' in compiled_manifest
    assert 'uses-permission' not in compiled_manifest
    with zipfile.ZipFile(apk) as archive:
        assert archive.read('assets/config.json') == payload
        assert archive.read('classes.dex').startswith(b'dex\n')
    for name, text in [('compile.txt', compile_log), ('signature.txt', signature_log),
                       ('alignment.txt', alignment_log), ('compiled-manifest.txt', compiled_manifest)]:
        (out / name).write_text(text, encoding='utf-8')
    result = {
        'package': PACKAGE, 'activity': PACKAGE + '/.Probe',
        'authority': PACKAGE + '.documents', 'root_title': 'LS Import IO Test',
        'version_code': 2,
        'documents': ['01-healthy.json', '02-read-error.json', '03-slow-healthy.json'],
        'slow_document_id': 'slow-healthy', 'slow_pause_after_bytes': 4096, 'slow_pause_ms': 6000,
        'apk': str(apk), 'apk_sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
        'payload_sha256': hashlib.sha256(payload).hexdigest(), 'payload_bytes': len(payload),
        'payload_source': 'explicit_local_file' if args.payload else 'owned_default_markers',
        'setting_count': len(document['settings']), 'same_payload_for_all_documents': True,
        'manifest_has_no_requested_permissions': True, 'provider_permission': 'android.permission.MANAGE_DOCUMENTS',
        'compiled': True, 'signature_verified': True, 'alignment_verified': True,
        'runtime_verified': False, 'adb_used': False,
        'private_evidence': '/data/user/0/' + PACKAGE + '/files/import-io-events.jsonl',
        'error_marker': 'LSA_IO_FIXTURE_INJECTED_READ_ERROR',
    }
    (out / 'build-result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
