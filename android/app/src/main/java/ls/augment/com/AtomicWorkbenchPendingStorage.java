package ls.augment.com;

import android.content.Context;
import android.util.AtomicFile;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/** One process-wide pending owner per credential directory; bytes/URI cache stays in TransferStore. */
final class AtomicWorkbenchPendingStorage implements AtomicWorkbenchPendingRepository.Storage {
    private static final Map<String, AtomicWorkbenchPendingRepository> OWNERS = new HashMap<>();
    private static final ThreadLocal<Long> WRITE_GENERATION = new ThreadLocal<>();
    private final Context application;
    private final AtomicFile file;
    private AtomicWorkbenchPendingStorage(Context context) {
        application = context; file = new AtomicFile(new File(context.getFilesDir(), "workbench-pending-v2.bin"));
    }
    static synchronized AtomicWorkbenchPendingRepository repository(Context context) {
        Context app = context.getApplicationContext(); if (app == null) app = context;
        String key = app.getFilesDir().getAbsolutePath();
        AtomicWorkbenchPendingRepository existing = OWNERS.get(key); if (existing != null) return existing;
        Context owner = app;
        AtomicWorkbenchPendingRepository next = new AtomicWorkbenchPendingRepository(new AtomicWorkbenchPendingStorage(app),
                (item, now) -> AtomicWorkbenchTransferStore.inspect(owner, item, now), System::currentTimeMillis);
        OWNERS.put(key, next); return next;
    }
    static <T> T withWriteGeneration(long generation, java.util.function.Supplier<T> transaction) {
        Long previous = WRITE_GENERATION.get(); WRITE_GENERATION.set(generation);
        try { return transaction.get(); }
        finally { if (previous == null) WRITE_GENERATION.remove(); else WRITE_GENERATION.set(previous); }
    }
    @Override public byte[] read() throws IOException {
        byte[] saved = readFile(); if (saved != null) return saved;
        AtomicWorkbenchPendingPayload legacy = AtomicWorkbenchTransferStore.legacy(application);
        if (legacy == null) return null;
        byte[] migrated = AtomicWorkbenchPendingRepository.encode(legacy);
        write(migrated); AtomicWorkbenchTransferStore.migrationComplete(application); return migrated;
    }
    private byte[] readFile() throws IOException {
        File base = file.getBaseFile();
        if (!base.exists() && !new File(base.getPath() + ".bak").exists()) return null;
        try (FileInputStream in = file.openRead(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096]; int count;
            while ((count = in.read(buffer)) >= 0) {
                if (count == 0) continue;
                if (count > AtomicWorkbenchPendingRepository.MAX_MANIFEST - out.size()) throw new IOException("素材记录读取失败");
                out.write(buffer, 0, count);
            }
            return out.toByteArray();
        }
    }
    @Override public void write(byte[] bytes) throws IOException {
        synchronized (ResetWriteFence.class) {
            Long expected = WRITE_GENERATION.get();
            if (ResetWriteFence.blocked() || expected != null && ResetWriteFence.stale(expected))
                throw new IOException("模块重置已使本次素材修改失效，请重新添加");
            writeOwned(bytes);
        }
    }
    private void writeOwned(byte[] bytes) throws IOException {
        if (bytes.length > AtomicWorkbenchPendingRepository.MAX_MANIFEST) throw new IOException("素材记录过大");
        byte[] previous = readFile();
        try { writeVerified(bytes); }
        catch (IOException | RuntimeException failed) {
            boolean retained = false;
            try {
                if (!Arrays.equals(previous, readFile())) {
                    if (previous == null) file.delete(); else writeVerified(previous);
                }
                retained = Arrays.equals(previous, readFile());
            } catch (IOException | RuntimeException unavailable) { }
            if (!retained) throw new AtomicWorkbenchPendingRepository.UncertainSave();
            throw new IOException("素材保存失败，原记录已保留");
        }
    }
    private void writeVerified(byte[] bytes) throws IOException {
        FileOutputStream out = null;
        try {
            out = file.startWrite(); out.write(bytes); out.getFD().sync();
            file.finishWrite(out); out = null;
            // AtomicFile.finishWrite can log a rename/sync failure without throwing. Confirm
            // persisted bytes before the repository publishes its new immutable revision.
            if (!Arrays.equals(bytes, readFile())) throw new IOException("素材保存尚未确认");
        } catch (IOException | RuntimeException failed) {
            if (out != null) file.failWrite(out);
            throw new IOException("素材保存失败");
        }
    }
}
