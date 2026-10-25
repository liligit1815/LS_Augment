package ls.augment.com;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONObject;

/** Copies granted source content while the receiving Activity is alive. No external paths are exposed. */
final class AtomicWorkbenchTransferStore {
    private static final String PREFS = "atomic-workbench-transfer", PENDING = "pending";
    static final class Payload {
        final String text;
        final ArrayList<Uri> uris = new ArrayList<>();
        final ArrayList<String> names = new ArrayList<>(), mimes = new ArrayList<>();
        final long created;
        final long generation;
        final ArrayList<String> ownedIds = new ArrayList<>();
        Payload(String text, long created) { this.text = text; this.created = created; generation = ResetWriteFence.generation(); }
        boolean empty() { return text.isEmpty() && uris.isEmpty(); }
        String summary() { return uris.isEmpty() ? "文字 · " + text.length() + " 字" : (text.isEmpty() ? "" : "文字 + ") + uris.size() + " 个文件"; }
    }
    static final class Entry {
        final File file;
        final String name, mime;
        final long created;
        Entry(File file, String name, String mime, long created) { this.file = file; this.name = name; this.mime = mime; this.created = created; }
    }
    private AtomicWorkbenchTransferStore() { }

    private static SharedPreferences prefs(Context context) { return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    private static File directory(Context context) { return new File(context.getCacheDir(), "workbench-transfer"); }
    static String authority(Context context) { return context.getPackageName() + ".workbench.transfer"; }

    interface CopyControl {
        void check() throws IOException;
        void opened(java.io.Closeable source) throws IOException;
        void closed(java.io.Closeable source);
    }
    private static final java.util.concurrent.locks.ReentrantLock SOURCE_COPY = new java.util.concurrent.locks.ReentrantLock();
    static Payload importIntent(Context context, Intent intent, boolean picker) throws IOException {
        return importIntent(context, intent, picker, null);
    }
    static Payload importIntent(Context context, Intent intent, boolean picker, CopyControl control) throws IOException {
        if (!SOURCE_COPY.tryLock()) throw new IOException("上次来源仍在结束读取，请稍后重试");
        try { return copyIntent(context, intent, picker, control); }
        finally { SOURCE_COPY.unlock(); }
    }

    // Durable migration/reset/ownership boundary: completion must precede subsequent process/transaction steps; retain commit.
    //noinspection ApplySharedPref
    private static Payload copyIntent(Context context, Intent intent, boolean picker, CopyControl control) throws IOException {
        long generation = ResetWriteFence.generation(); checkCopy(generation, control);
        if (intent == null) throw new IOException("没有可流转的内容");
        String action = intent.getAction();
        if (!picker && !Intent.ACTION_SEND.equals(action) && !Intent.ACTION_SEND_MULTIPLE.equals(action))
            throw new IOException("不支持的分享操作");
        String text = picker ? "" : AtomicWorkbenchTransferPolicy.text(intent.getCharSequenceExtra(Intent.EXTRA_TEXT));
        ArrayList<Uri> sources = new ArrayList<>();
        if (picker && intent.getData() != null) add(sources, intent.getData());
        if (!picker && Intent.ACTION_SEND.equals(action)) {
            Uri uri = intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri.class);
            if (uri != null) add(sources, uri);
        } else if (!picker && Intent.ACTION_SEND_MULTIPLE.equals(action)) {
            ArrayList<Uri> uris = intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM, Uri.class);
            if (uris != null) for (Uri uri : uris) add(sources, uri);
        }
        ClipData clip = intent.getClipData();
        if (clip != null) {
            if (clip.getItemCount() > AtomicWorkbenchTransferPolicy.MAX_ITEMS + 1) throw new IOException("一次最多支持 16 个文件和伴随文字");
            for (int index = 0; index < clip.getItemCount(); index++) {
                ClipData.Item item = clip.getItemAt(index);
                if (item.getUri() != null) add(sources, item.getUri());
                if (!picker && text.isEmpty() && item.getText() != null) text = AtomicWorkbenchTransferPolicy.text(item.getText());
            }
        }
        Payload payload = new Payload(text, System.currentTimeMillis());
        if (sources.isEmpty() && text.isEmpty()) throw new IOException("来源未提供文字或可读取的文件；可先保存文件再选择");
        cleanup(context);
        File directory = directory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("无法创建手机素材缓存");
        long existing = cacheSize(directory), copied = 0, newCopied = 0;
        ArrayList<String> imported = new ArrayList<>();
        try {
            for (Uri source : sources) {
                checkCopy(generation, control);
                if (!"content".equals(source.getScheme())) throw new IOException("来源文件没有提供标准读取授权，请先保存后选择文件");
                if (authority(context).equals(source.getAuthority())) {
                    Entry entry = resolve(context, source);
                    if (entry.file.length() > AtomicWorkbenchTransferPolicy.MAX_BYTES - copied) throw new IOException("单次素材总大小最多支持 512 MB");
                    copied += entry.file.length(); payload.uris.add(source); payload.names.add(entry.name); payload.mimes.add(entry.mime); continue;
                }
                String name = name(context, source), mime = AtomicWorkbenchTransferPolicy.mime(context.getContentResolver().getType(source));
                if ("application/octet-stream".equals(mime)) {
                    int dot = name.lastIndexOf('.');
                    if (dot >= 0) mime = AtomicWorkbenchTransferPolicy.mime(MimeTypeMap.getSingleton()
                            .getMimeTypeFromExtension(name.substring(dot + 1).toLowerCase(java.util.Locale.ROOT)));
                }
                String id = UUID.randomUUID().toString().replace("-", "");
                File file = new File(directory, id + ".bin"); imported.add(id);
                long remaining = Math.min(AtomicWorkbenchTransferPolicy.MAX_BYTES - copied,
                        AtomicWorkbenchTransferPolicy.CACHE_BYTES - existing - newCopied);
                if (remaining < 0) throw new IOException("手机素材缓存已满，请稍后再试");
                InputStream input = context.getContentResolver().openInputStream(source);
                if (input == null) throw new IOException("无法读取来源文件");
                try (InputStream managed = input; FileOutputStream output = new FileOutputStream(file)) {
                    if (control != null) control.opened(input);
                    byte[] buffer = new byte[64 * 1024]; long count = 0; int zeroes = 0;
                    for (;;) {
                        checkCopy(generation, control);
                        int read = input.read(buffer); if (read < 0) break;
                        if (read == 0) { if (++zeroes > 32) throw new IOException("来源文件读取中断"); continue; }
                        zeroes = 0; if (read > remaining - count) throw new IOException("单次素材总大小最多支持 512 MB");
                        output.write(buffer, 0, read); count += read;
                    }
                    copied += count; newCopied += count;
                    output.getFD().sync();
                } finally { if (control != null) control.closed(input); }
                checkCopy(generation, control);
                JSONObject metadata = new JSONObject().put("name", name).put("mime", mime).put("created", payload.created);
                synchronized (ResetWriteFence.class) {
                    checkCopy(generation, control);
                    if (!prefs(context).edit().putString(id, metadata.toString()).commit()) throw new IOException("素材缓存保存失败");
                }
                Uri uri = new Uri.Builder().scheme("content").authority(authority(context)).appendPath(id).appendPath(name).build();
                payload.uris.add(uri); payload.names.add(name); payload.mimes.add(mime);
                payload.ownedIds.add(id);
            }
            checkCopy(generation, control); return payload;
        } catch (Exception error) {
            for (String id : imported) { new File(directory, id + ".bin").delete(); prefs(context).edit().remove(id).commit(); }
            if (error instanceof IOException && ("单次素材总大小最多支持 512 MB".equals(error.getMessage())
                    || "手机素材缓存已满，请稍后再试".equals(error.getMessage())
                    || "来源文件没有提供标准读取授权，请先保存后选择文件".equals(error.getMessage())))
                throw (IOException) error;
            throw new IOException("来源文件无法读取或手机存储不足，请保存文件后重新选择");
        }
    }
    private static void checkCopy(long generation, CopyControl control) throws IOException {
        if (ResetWriteFence.stale(generation)) throw new IOException("模块重置已开始，请在重置结束后重新添加素材");
        if (control != null) control.check();
    }

    private static void add(ArrayList<Uri> values, Uri uri) throws IOException {
        if (uri == null || values.contains(uri)) return;
        if (values.size() >= AtomicWorkbenchTransferPolicy.MAX_ITEMS) throw new IOException("一次最多支持 16 个文件");
        values.add(uri);
    }
    private static String name(Context context, Uri uri) {
        String value = null;
        try (Cursor cursor = context.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) value = cursor.getString(0);
        } catch (RuntimeException ignored) { }
        return AtomicWorkbenchTransferPolicy.displayName(value);
    }

    static void pending(Context context, Payload payload) throws IOException {
        AtomicWorkbenchPendingRepository repository = AtomicWorkbenchPendingStorage.repository(context);
        AtomicWorkbenchPendingPayload before = repository.load();
        AtomicWorkbenchPendingPayload imported = batch(context, payload);
        AtomicWorkbenchPendingRepository.Result result = AtomicWorkbenchPendingStorage.withWriteGeneration(payload.generation,
                () -> repository.put(before.id, before.revision, imported,
                        AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE));
        if (!result.success) throw new IOException(result.message);
        published(payload);
    }

    static Payload pending(Context context) {
        AtomicWorkbenchPendingPayload saved = AtomicWorkbenchPendingStorage.repository(context).load();
        return saved.empty() ? null : payload(saved);
    }

    static void clear(Context context) throws IOException {
        AtomicWorkbenchPendingRepository repository = AtomicWorkbenchPendingStorage.repository(context);
        AtomicWorkbenchPendingPayload before = repository.load();
        AtomicWorkbenchPendingRepository.Result result = repository.clear(before.id, before.revision);
        if (!result.success) throw new IOException(result.message);
    }
    static void clearForReset(Context context) throws IOException {
        if (!ResetWriteFence.owns()) throw new IOException("请通过模块完整重置清理流转素材");
        AtomicWorkbenchTransferStage.cancelForReset();
        clear(context); // Checked durable tombstone first; the reset owner may then clear all module files.
    }

    static synchronized Entry resolve(Context context, Uri uri) throws IOException {
        if (uri == null || !"content".equals(uri.getScheme()) || !authority(context).equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null || uri.getPathSegments().size() != 2)
            throw new IOException("素材不存在或已过期");
        String id = uri.getPathSegments().get(0);
        if (!AtomicWorkbenchTransferPolicy.validId(id)) throw new IOException("素材不存在或已过期");
        try {
            JSONObject metadata = new JSONObject(prefs(context).getString(id, ""));
            String name = metadata.getString("name");
            if (!name.equals(uri.getPathSegments().get(1)) || !AtomicWorkbenchTransferPolicy.fresh(metadata.getLong("created"), System.currentTimeMillis()))
                throw new IOException();
            File directory = directory(context).getCanonicalFile();
            File file = new File(directory, id + ".bin").getCanonicalFile();
            if (!directory.equals(file.getParentFile()) || !file.isFile()) throw new IOException();
            return new Entry(file, name, AtomicWorkbenchTransferPolicy.mime(metadata.getString("mime")), metadata.getLong("created"));
        } catch (Exception invalid) { throw new IOException("素材不存在或已过期"); }
    }
    static AtomicWorkbenchPendingPayload batch(Context context, Payload payload) throws IOException {
        if (ResetWriteFence.stale(payload.generation)) throw new IOException("素材来自重置前的操作，请重新添加");
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>();
        for (Uri uri : payload.uris) {
            Entry entry = resolve(context, uri); String id = uri.getPathSegments().get(0);
            files.add(new AtomicWorkbenchPendingPayload.FileItem(id, uri.toString(), entry.name, entry.mime,
                    entry.file.length(), entry.created, AtomicWorkbenchPendingPayload.Availability.READY));
        }
        return new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, payload.text, payload.created, false, files, AtomicWorkbenchPendingPayload.State.READY);
    }
    static Payload payload(AtomicWorkbenchPendingPayload snapshot) {
        Payload payload = new Payload(snapshot.text, snapshot.textCreated);
        for (AtomicWorkbenchPendingPayload.FileItem item : snapshot.files) {
            payload.uris.add(Uri.parse(item.uri)); payload.names.add(item.name); payload.mimes.add(item.mime);
        }
        return payload;
    }
    static AtomicWorkbenchPendingPayload.FileItem inspect(Context context, AtomicWorkbenchPendingPayload.FileItem saved, long now) {
        try {
            Uri uri = Uri.parse(saved.uri);
            if (!"content".equals(uri.getScheme()) || !authority(context).equals(uri.getAuthority())
                    || uri.getQuery() != null || uri.getFragment() != null || uri.getPathSegments().size() != 2
                    || !saved.id.equals(uri.getPathSegments().get(0)) || !AtomicWorkbenchTransferPolicy.validId(saved.id))
                return saved.availability(AtomicWorkbenchPendingPayload.Availability.UNREADABLE);
            String metadataRaw = prefs(context).getString(saved.id, "");
            if (metadataRaw.isEmpty()) return saved.availability(AtomicWorkbenchPendingPayload.Availability.MISSING);
            JSONObject metadata = new JSONObject(metadataRaw); long created = metadata.getLong("created");
            String name = metadata.getString("name");
            if (!name.equals(uri.getPathSegments().get(1))) return saved.availability(AtomicWorkbenchPendingPayload.Availability.UNREADABLE);
            File file = new File(directory(context), saved.id + ".bin");
            AtomicWorkbenchPendingPayload.Availability availability = !AtomicWorkbenchTransferPolicy.fresh(created, now)
                    ? AtomicWorkbenchPendingPayload.Availability.EXPIRED : !file.isFile()
                    ? AtomicWorkbenchPendingPayload.Availability.MISSING : AtomicWorkbenchPendingPayload.Availability.READY;
            return new AtomicWorkbenchPendingPayload.FileItem(saved.id, saved.uri, name,
                    AtomicWorkbenchTransferPolicy.mime(metadata.getString("mime")), file.isFile() ? file.length() : saved.bytes, created, availability);
        } catch (Exception invalid) { return saved.availability(AtomicWorkbenchPendingPayload.Availability.UNREADABLE); }
    }
    static AtomicWorkbenchPendingPayload legacy(Context context) throws IOException {
        String saved = prefs(context).getString(PENDING, ""); if (saved.isEmpty()) return null;
        try {
            JSONObject value = new JSONObject(saved); long created = value.getLong("created");
            String text = AtomicWorkbenchTransferPolicy.text(value.optString("text", ""));
            JSONArray uris = value.getJSONArray("uris"); if (uris.length() > AtomicWorkbenchTransferPolicy.MAX_ITEMS) throw new IOException();
            ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>();
            for (int index = 0; index < uris.length(); index++) {
                Uri uri = Uri.parse(uris.getString(index));
                if (!authority(context).equals(uri.getAuthority()) || uri.getPathSegments().size() != 2
                        || !AtomicWorkbenchTransferPolicy.validId(uri.getPathSegments().get(0))) throw new IOException();
                AtomicWorkbenchPendingPayload.FileItem item = new AtomicWorkbenchPendingPayload.FileItem(uri.getPathSegments().get(0), uri.toString(),
                        AtomicWorkbenchTransferPolicy.displayName(uri.getLastPathSegment()), "application/octet-stream", 0, created, AtomicWorkbenchPendingPayload.Availability.READY);
                files.add(inspect(context, item, System.currentTimeMillis()));
            }
            return new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, text, created, false, files, AtomicWorkbenchPendingPayload.State.READY);
        } catch (Exception invalid) { throw new IOException("原素材记录读取失败，内容已保留"); }
    }

    // Durable migration/reset/ownership boundary: completion must precede subsequent process/transaction steps; retain commit.
    //noinspection ApplySharedPref
    static void migrationComplete(Context context) { prefs(context).edit().remove(PENDING).commit(); }
    static void published(Payload payload) { synchronized (payload.ownedIds) { payload.ownedIds.clear(); } }

    // Durable migration/reset/ownership boundary: completion must precede subsequent process/transaction steps; retain commit.
    //noinspection ApplySharedPref
    static void discardUnpublished(Context context, Payload payload) {
        if (payload == null) return;
        synchronized (payload.ownedIds) {
            for (String id : payload.ownedIds) { new File(directory(context), id + ".bin").delete(); prefs(context).edit().remove(id).commit(); }
            payload.ownedIds.clear();
        }
    }


    // Durable migration/reset/ownership boundary: completion must precede subsequent process/transaction steps; retain commit.
    //noinspection ApplySharedPref
    private static void cleanup(Context context) {
        File directory = directory(context); File[] files = directory.listFiles();
        // The system may evict cache files independently of preferences. Reap both
        // missing-file metadata and expired grants so repeated shares stay bounded.
        for (String key : prefs(context).getAll().keySet()) {
            if (!AtomicWorkbenchTransferPolicy.validId(key)) continue;
            boolean fresh = false;
            try { fresh = new File(directory, key + ".bin").isFile() && AtomicWorkbenchTransferPolicy.fresh(
                    new JSONObject(prefs(context).getString(key, "")).getLong("created"), System.currentTimeMillis()); }
            catch (Exception ignored) { }
            if (!fresh) {
                revoke(context, key);
                new File(directory, key + ".bin").delete(); prefs(context).edit().remove(key).commit();
            }
        }
        if (files == null) return;
        for (File file : files) {
            String filename = file.getName();
            if (!filename.matches("[0-9a-f]{32}\\.bin")) continue;
            String id = filename.substring(0, 32);
            boolean fresh = false;
            try { fresh = AtomicWorkbenchTransferPolicy.fresh(new JSONObject(prefs(context).getString(id, "")).getLong("created"), System.currentTimeMillis()); }
            catch (Exception ignored) { }
            if (!fresh) { revoke(context, id); file.delete(); prefs(context).edit().remove(id).commit(); }
        }
    }
    private static void revoke(Context context, String id) {
        // This UUID directory belongs to exactly one cached file. Revocation is
        // restricted to its sub-path; active files and other apps' URIs are untouched.
        context.revokeUriPermission(new Uri.Builder().scheme("content").authority(authority(context))
                .appendPath(id).build(), Intent.FLAG_GRANT_READ_URI_PERMISSION);
    }
    private static long cacheSize(File directory) {
        long bytes = 0; File[] files = directory.listFiles();
        if (files != null) for (File file : files) if (file.isFile()) bytes += file.length();
        return bytes;
    }
}
