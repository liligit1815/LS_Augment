package ls.augment.com;

import android.app.Instrumentation;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;
import org.json.JSONObject;

/** Exercises real phone content resolution/cache copies. Never opens a social app or sends a message. */
final class AtomicWorkbenchTransferDeviceCases {
    private final Context context;
    private final SharedPreferences prefs;
    private final String peerPackage;
    private final int peerUid;
    private final ArrayList<Uri> owned = new ArrayList<>();
    private int assertions;
    private AtomicWorkbenchTransferDeviceCases(Context context, Context peer) {
        this.context = context; prefs = context.getSharedPreferences("atomic-workbench-transfer", Context.MODE_PRIVATE);
        peerPackage = peer.getPackageName(); peerUid = peer.getApplicationInfo().uid;
    }
    static JSONObject run(Instrumentation instrumentation) throws Exception {
        return new AtomicWorkbenchTransferDeviceCases(instrumentation.getTargetContext(), instrumentation.getContext()).run();
    }
    private JSONObject run() throws Exception {
        String previousPending = prefs.getString("pending", null);
        try {
            ProviderInfo provider = context.getPackageManager().resolveContentProvider(AtomicWorkbenchTransferStore.authority(context), 0);
            check(provider != null && !provider.exported && provider.grantUriPermissions, "provider requires individual URI grants");
            Intent textIntent = new Intent(Intent.ACTION_SEND).setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, "手机端流转样本 https://example.invalid/share");
            AtomicWorkbenchTransferStore.Payload text = AtomicWorkbenchTransferStore.importIntent(context, textIntent, false);
            check(text.uris.isEmpty() && text.text.contains("手机端流转样本"), "text imported as text");
            AtomicWorkbenchTransferStore.pending(context, text);
            check(AtomicWorkbenchTransferStore.pending(context).text.equals(text.text), "text survives cache reload");
            byte[] image = new byte[131075];
            for (int index = 0; index < image.length; index++) image[index] = (byte) (index % 251);
            checkFile(image, "图片.png", "image/png");
            checkFile(new byte[]{0, 0, 0, 20, 'f', 't', 'y', 'p', 'i', 's', 'o', 'm'}, "视频.mp4", "video/mp4");
            checkFile("%PDF-1.4\ntransfer-fixture\n%%EOF".getBytes(StandardCharsets.UTF_8), "文件.pdf", "application/pdf");

            Uri one = seed(new byte[]{1, 2, 3}, "one.png", "image/png");
            Uri two = seed(new byte[]{4, 5, 6}, "two.jpg", "image/jpeg");
            ArrayList<Uri> streams = new ArrayList<>(); streams.add(one); streams.add(two);
            Intent multiple = new Intent(Intent.ACTION_SEND_MULTIPLE).setType("image/*")
                    .putParcelableArrayListExtra(Intent.EXTRA_STREAM, streams);
            ClipData duplicateClip = new ClipData("images", new String[]{"image/*"}, new ClipData.Item(one));
            duplicateClip.addItem(new ClipData.Item(two)); multiple.setClipData(duplicateClip);
            AtomicWorkbenchTransferStore.Payload collection = AtomicWorkbenchTransferStore.importIntent(context, multiple, false);
            owned.addAll(collection.uris);
            check(collection.uris.size() == 2, "EXTRA_STREAM and ClipData duplicates imported once");
            check("image/*".equals(AtomicWorkbenchTransferPolicy.commonMime(collection.mimes)), "mixed image MIME preserved");
            AtomicWorkbenchTransferStore.pending(context, collection);
            AtomicWorkbenchTransferStore.Payload reloaded = AtomicWorkbenchTransferStore.pending(context);
            check(reloaded != null && reloaded.uris.equals(collection.uris), "multiple cached files survive reload");

            Intent picked = new Intent().setData(one);
            AtomicWorkbenchTransferStore.Payload selected = AtomicWorkbenchTransferStore.importIntent(context, picked, true);
            owned.addAll(selected.uris); check(selected.uris.size() == 1, "system file picker content accepted");
            reject(() -> AtomicWorkbenchTransferStore.importIntent(context, new Intent(Intent.ACTION_VIEW).setData(one), false), "unrelated action rejected");
            reject(() -> AtomicWorkbenchTransferStore.importIntent(context,
                    new Intent(Intent.ACTION_SEND).putExtra(Intent.EXTRA_STREAM, Uri.parse("file:///sdcard/private.mp4")), false), "ungranted file paths rejected");
            reject(() -> AtomicWorkbenchTransferStore.resolve(context,
                    Uri.parse("content://" + AtomicWorkbenchTransferStore.authority(context) + "/../pending")), "path traversal rejected");
            reject(() -> AtomicWorkbenchTransferStore.resolve(context,
                    collection.uris.get(0).buildUpon().appendQueryParameter("read", "all").build()), "URI aliases rejected");
            Uri expired = seed(new byte[]{7}, "expired.txt", "text/plain");
            Uri active = collection.uris.get(0);
            context.grantUriPermission(peerPackage, expired, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            context.grantUriPermission(peerPackage, active, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            check(context.checkUriPermission(expired, -1, peerUid, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    == android.content.pm.PackageManager.PERMISSION_GRANTED, "explicit expired-file grant starts valid");
            String expiredId = expired.getPathSegments().get(0);
            JSONObject metadata = new JSONObject(prefs.getString(expiredId, ""));
            metadata.put("created", System.currentTimeMillis() - AtomicWorkbenchTransferPolicy.LIFETIME_MS - 1000);
            prefs.edit().putString(expiredId, metadata.toString()).commit();
            reject(() -> AtomicWorkbenchTransferStore.resolve(context, expired), "expired cache cannot be reopened");
            AtomicWorkbenchTransferStore.importIntent(context, textIntent, false);
            check(context.checkUriPermission(expired, -1, peerUid, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    == android.content.pm.PackageManager.PERMISSION_DENIED, "expired file grant revoked during cache cleanup");
            check(context.checkUriPermission(active, -1, peerUid, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    == android.content.pm.PackageManager.PERMISSION_GRANTED, "active file grant retained during cleanup");
            return new JSONObject().put("success", true).put("assertions", assertions)
                    .put("text", true).put("imageBytes", true).put("videoBytes", true).put("fileBytes", true)
                    .put("multiFileDeduplication", true).put("readOnlyProvider", true).put("sourceIndependentCache", true)
                    .put("expiredGrantsRevoked", true).put("activeGrantsRetained", true)
                    .put("socialAppsOpened", false).put("messagesSent", false);
        } finally {
            for (Uri uri : owned) {
                context.revokeUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                String id = uri.getPathSegments().get(0);
                new File(new File(context.getCacheDir(), "workbench-transfer"), id + ".bin").delete();
                prefs.edit().remove(id).commit();
            }
            SharedPreferences.Editor restore = prefs.edit();
            if (previousPending == null) restore.remove("pending"); else restore.putString("pending", previousPending);
            restore.commit();
        }
    }
    private void checkFile(byte[] bytes, String name, String mime) throws Exception {
        Uri source = seed(bytes, name, mime);
        Intent intent = new Intent(Intent.ACTION_SEND).setType(mime).putExtra(Intent.EXTRA_STREAM, source);
        AtomicWorkbenchTransferStore.Payload imported = AtomicWorkbenchTransferStore.importIntent(context, intent, false);
        owned.addAll(imported.uris);
        check(imported.uris.size() == 1 && !source.equals(imported.uris.get(0)), "source copied to independent cache");
        Uri cached = imported.uris.get(0);
        check(mime.equals(context.getContentResolver().getType(cached)), "provider MIME matches " + mime);
        try (Cursor cursor = context.getContentResolver().query(cached, null, null, null, null)) {
            check(cursor != null && cursor.moveToFirst(), "provider metadata available");
            check(name.equals(cursor.getString(cursor.getColumnIndexOrThrow(OpenableColumns.DISPLAY_NAME))), "provider display name retained");
            check(bytes.length == cursor.getLong(cursor.getColumnIndexOrThrow(OpenableColumns.SIZE)), "provider byte count retained");
        }
        AtomicWorkbenchTransferStore.resolve(context, source).file.delete();
        try (InputStream input = context.getContentResolver().openInputStream(cached)) {
            check(input != null && Arrays.equals(bytes, input.readAllBytes()), "cached bytes survive source deletion");
        }
        reject(() -> {
            try (ParcelFileDescriptor ignored = context.getContentResolver().openFileDescriptor(cached, "w")) { }
        }, "provider refuses writes");
    }
    private Uri seed(byte[] bytes, String name, String mime) throws Exception {
        String id = UUID.randomUUID().toString().replace("-", "");
        File directory = new File(context.getCacheDir(), "workbench-transfer");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("test cache unavailable");
        try (FileOutputStream output = new FileOutputStream(new File(directory, id + ".bin"))) { output.write(bytes); }
        JSONObject metadata = new JSONObject().put("name", name).put("mime", mime).put("created", System.currentTimeMillis());
        prefs.edit().putString(id, metadata.toString()).commit();
        Uri uri = new Uri.Builder().scheme("content").authority(AtomicWorkbenchTransferStore.authority(context))
                .appendPath(id).appendPath(name).build(); owned.add(uri); return uri;
    }
    private interface Operation { void run() throws Exception; }
    private void reject(Operation operation, String message) throws Exception {
        try { operation.run(); throw new AssertionError(message); }
        catch (IOException | SecurityException | IllegalArgumentException expected) { assertions++; }
    }
    private void check(boolean value, String message) { assertions++; if (!value) throw new AssertionError(message); }
}
