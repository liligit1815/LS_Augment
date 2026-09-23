"""Build a local-only clipboard fixture preserving the previous ClipData.

READ HASH is a foreground-only, read-only observation. Its SHA256 is computed
over the first item's plain text encoded as UTF-8. TEXT_LENGTH counts UTF-16
code units (Java String.length); ITEM_COUNT reports all ClipData items. The OTA
URL case must have exactly one text item. No clipboard text is logged or saved
by READ HASH. SAVE ORIGINAL alone retains the private parcel until restoration.
"""
import subprocess,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'out/full-device-regression-20260908/clipboard-fixture';OUT.mkdir(exist_ok=True)
SDK=Path.home()/'AppData/Local/Android/Sdk';BUILD=SDK/'build-tools/36.0.0';ANDROID=SDK/'platforms/android-36/android.jar';JAVA=Path('C:/Program Files/Java/jdk-17/bin')
def run(*args):subprocess.run(list(map(str,args)),check=True,stdout=subprocess.DEVNULL)
source=OUT/'Probe.java'
source.write_text(r'''package ls.augment.regression.clipboard;
import android.app.Activity;
import android.os.Bundle;
import android.os.Parcel;
import android.content.ClipboardManager;
import android.content.ClipData;
import android.widget.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class Probe extends Activity {
    TextView status;
    ClipboardManager manager;
    File saved, empty;

    public void onCreate(Bundle b) {
        super.onCreate(b);
        manager = getSystemService(ClipboardManager.class);
        saved = new File(getFilesDir(), "original.parcel");
        empty = new File(getFilesDir(), "original.empty");
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(1);
        root.setPadding(40, 150, 40, 30);
        status = new TextView(this);
        status.setTextSize(22);
        root.addView(status);
        add(root, "SAVE ORIGINAL", () -> save());
        add(root, "COPY TEST", () -> copy());
        add(root, "READ HASH", () -> readHash());
        add(root, "RESTORE ORIGINAL", () -> restore());
        setContentView(root);
        status.setText("LS CLIPBOARD TEST");
    }

    void add(LinearLayout root, String title, Runnable operation) {
        Button button = new Button(this);
        button.setText(title);
        button.setOnClickListener(v -> {
            try { operation.run(); }
            catch (Exception e) { status.setText("ERROR " + e.getClass().getSimpleName()); }
        });
        root.addView(button);
    }

    void save() {
        if (saved.exists() || empty.exists()) { status.setText("ALREADY SAVED"); return; }
        ClipData clip = manager.getPrimaryClip();
        try {
            if (clip == null) {
                if (!empty.createNewFile()) throw new IOException();
            } else {
                Parcel parcel = Parcel.obtain();
                try {
                    clip.writeToParcel(parcel, 0);
                    try (FileOutputStream output = new FileOutputStream(saved)) {
                        output.write(parcel.marshall());
                    }
                } finally { parcel.recycle(); }
            }
            status.setText("ORIGINAL SAVED");
        } catch (Exception e) { throw new RuntimeException(e); }
    }

    void copy() {
        if (!saved.exists() && !empty.exists()) throw new IllegalStateException();
        manager.setPrimaryClip(ClipData.newPlainText("LS test", "LSA_CLIPBOARD_103_" + System.currentTimeMillis()));
        status.setText("TEST COPIED");
    }

    void readHash() {
        if (!hasWindowFocus()) throw new IllegalStateException();
        ClipData clip = manager.getPrimaryClip();
        int count = clip == null ? 0 : clip.getItemCount();
        // Do not coerce URI/Intent items, read a content provider, or print raw text.
        CharSequence plain = count == 0 ? null : clip.getItemAt(0).getText();
        String text = plain == null ? "" : plain.toString();
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));
            char[] alphabet = "0123456789abcdef".toCharArray();
            StringBuilder hash = new StringBuilder(64);
            for (byte value : digest) {
                hash.append(alphabet[(value & 255) >>> 4]);
                hash.append(alphabet[value & 15]);
            }
            status.setText("SHA256=" + hash + "\nTEXT_LENGTH=" + text.length() + "\nITEM_COUNT=" + count);
        } catch (Exception e) { throw new RuntimeException(e); }
    }

    void restore() {
        try {
            if (saved.exists()) {
                byte[] bytes = java.nio.file.Files.readAllBytes(saved.toPath());
                Parcel parcel = Parcel.obtain();
                try {
                    parcel.unmarshall(bytes, 0, bytes.length);
                    parcel.setDataPosition(0);
                    manager.setPrimaryClip(ClipData.CREATOR.createFromParcel(parcel));
                } finally { parcel.recycle(); }
            } else if (empty.exists()) {
                manager.clearPrimaryClip();
            } else {
                throw new IllegalStateException();
            }
            if (saved.exists() && !saved.delete()) throw new IOException();
            if (empty.exists() && !empty.delete()) throw new IOException();
            status.setText("ORIGINAL RESTORED");
        } catch (Exception e) { throw new RuntimeException(e); }
    }
}
''',encoding='utf-8')
classes=OUT/'classes';classes.mkdir(exist_ok=True)
run(JAVA/'javac.exe','-encoding','UTF-8','-source','8','-target','8','-cp',ANDROID,'-d',classes,source)
run(BUILD/'d8.bat','--lib',ANDROID,'--min-api','28','--output',OUT,*classes.rglob('*.class'))
manifest=OUT/'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ls.augment.regression.clipboard" android:versionCode="2" android:versionName="2"><uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/><application android:label="LS temporary clipboard" android:allowBackup="false"><activity android:name=".Probe" android:exported="true"><intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/></intent-filter></activity></application></manifest>''',encoding='utf-8')
u=OUT/'unsigned.apk';aligned=OUT/'aligned.apk';apk=OUT/'clipboard.apk'
run(BUILD/'aapt2.exe','link','-o',u,'-I',ANDROID,'--manifest',manifest)
with zipfile.ZipFile(u,'a') as z:z.write(OUT/'classes.dex','classes.dex')
run(BUILD/'zipalign.exe','-f','4',u,aligned)
run(BUILD/'apksigner.bat','sign','--ks',Path.home()/'.android/debug.keystore','--ks-pass','pass:android','--out',apk,aligned)
run(BUILD/'apksigner.bat','verify',apk)
print(apk)
