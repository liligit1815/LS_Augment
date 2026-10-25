package ls.augment.com;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.LongSupplier;

/** Short, serial manifest transactions. Source byte IO never enters this monitor. */
final class AtomicWorkbenchPendingRepository {
    interface Storage { byte[] read() throws IOException; void write(byte[] bytes) throws IOException; }
    static final class UncertainSave extends IOException { UncertainSave() { super("素材保存结果未确认，请重新读取后重试"); } }
    interface Catalog { AtomicWorkbenchPendingPayload.FileItem inspect(AtomicWorkbenchPendingPayload.FileItem saved, long now); }
    interface Listener { void changed(AtomicWorkbenchPendingPayload snapshot); }
    enum Mode { APPEND, REPLACE }
    enum TextChoice { REQUIRE_CHOICE, KEEP, REPLACE, MERGE }
    static final int MAX_MANIFEST = 256 * 1024;
    private static final int MAGIC = 0x44555032;
    private final Storage storage;
    private final Catalog catalog;
    private final LongSupplier clock;
    private final CopyOnWriteArrayList<Listener> listeners = new CopyOnWriteArrayList<>();
    private AtomicWorkbenchPendingPayload committed;
    private Undo undo;
    private boolean persisted;

    AtomicWorkbenchPendingRepository(Storage storage, Catalog catalog, LongSupplier clock) {
        this.storage = storage; this.catalog = catalog; this.clock = clock;
        committed = new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, "", 0, false,
                List.of(), AtomicWorkbenchPendingPayload.State.EMPTY);
    }
    AutoCloseable subscribe(Listener listener) { listeners.add(listener); return () -> listeners.remove(listener); }
    synchronized AtomicWorkbenchPendingPayload load() {
        try {
            byte[] saved = storage.read();
            if (saved != null) { committed = decode(saved); persisted = true; }
            else if (persisted) {
                committed = new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, "", 0, false,
                        List.of(), AtomicWorkbenchPendingPayload.State.EMPTY); persisted = false; undo = null;
            }
            committed = hydrate(committed);
            return committed;
        } catch (IOException | RuntimeException invalid) { return committed.state(AtomicWorkbenchPendingPayload.State.READ_FAILED); }
    }
    synchronized Result put(String id, long revision, AtomicWorkbenchPendingPayload batch, Mode mode, TextChoice choice) {
        AtomicWorkbenchPendingPayload before = load();
        Result rejected = reject(before, id, revision); if (rejected != null) return rejected;
        if (batch == null) return failure(before, "empty_batch", "没有收到可添加的素材");
        try { if (!AtomicWorkbenchPendingPayload.text(batch.text).equals(batch.text)) throw new IOException(); }
        catch (IOException | RuntimeException invalid) { return failure(before, "text_limit", "文字无效或超过 32768 个字符，请重新选择"); }
        String text = mode == Mode.REPLACE ? batch.text : before.text;
        long textCreated = mode == Mode.REPLACE ? batch.textCreated : before.textCreated;
        boolean expired = mode == Mode.REPLACE ? batch.textExpired : before.textExpired;
        if (mode == Mode.APPEND && !batch.text.isEmpty()) {
            if (!before.text.isEmpty() || before.textExpired) {
                if (choice == TextChoice.REQUIRE_CHOICE) return failure(before, "text_choice", "已有文字，请选择保留、替换或合并");
                if (choice == TextChoice.REPLACE) { text = batch.text; textCreated = batch.textCreated; expired = batch.textExpired; }
                else if (choice == TextChoice.MERGE) {
                    if (before.textExpired) return failure(before, "expired_text", "原文字已过期，请移除或选择使用新文字");
                    try { text = AtomicWorkbenchPendingPayload.text(before.text + "\n" + batch.text); }
                    catch (IOException tooLong) { return failure(before, "text_limit", tooLong.getMessage()); }
                    textCreated = Math.min(before.textCreated, batch.textCreated);
                }
            } else { text = batch.text; textCreated = batch.textCreated; expired = batch.textExpired; }
        }
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>(mode == Mode.REPLACE ? List.of() : before.files);
        HashSet<String> seen = new HashSet<>(); for (AtomicWorkbenchPendingPayload.FileItem item : files) seen.add(item.id);
        for (AtomicWorkbenchPendingPayload.FileItem item : batch.files) if (seen.add(item.id)) files.add(item);
        if (files.size() > AtomicWorkbenchTransferPolicy.MAX_ITEMS) return failure(before, "file_limit", "一次最多保留 16 个文件，请先移除部分素材");
        long bytes = 0;
        for (AtomicWorkbenchPendingPayload.FileItem item : files) {
            if (item.bytes < 0 || item.bytes > AtomicWorkbenchTransferPolicy.MAX_BYTES - bytes)
                return failure(before, "byte_limit", "待流转素材合计最多支持 512 MB");
            bytes += item.bytes;
        }
        return commit(before, text, textCreated, expired, files, false);
    }
    synchronized Result remove(String id, long revision, String itemId) {
        AtomicWorkbenchPendingPayload before = load(); Result rejected = reject(before, id, revision); if (rejected != null) return rejected;
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>(before.files);
        if (!files.removeIf(item -> item.id.equals(itemId))) return failure(before, "item_missing", "此项已经变化，请重新打开素材");
        return commit(before, before.text, before.textCreated, before.textExpired, files, true);
    }
    synchronized Result removeText(String id, long revision) {
        AtomicWorkbenchPendingPayload before = load(); Result rejected = reject(before, id, revision); if (rejected != null) return rejected;
        return commit(before, "", 0, false, before.files, true);
    }
    synchronized Result moveBefore(String id, long revision, String itemId, String beforeId) {
        AtomicWorkbenchPendingPayload before = load(); Result rejected = reject(before, id, revision); if (rejected != null) return rejected;
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>(before.files);
        AtomicWorkbenchPendingPayload.FileItem moving = before.file(itemId);
        if (moving == null || beforeId != null && before.file(beforeId) == null) return failure(before, "item_missing", "排序对象已变化，请重试");
        if (itemId.equals(beforeId)) return new Result(true, "unchanged", "顺序保持", before, null);
        files.remove(moving); int destination = beforeId == null ? files.size() : index(files, beforeId); files.add(destination, moving);
        return commit(before, before.text, before.textCreated, before.textExpired, files, false);
    }
    synchronized Result clear(String id, long revision) {
        AtomicWorkbenchPendingPayload before = load(); Result rejected = reject(before, id, revision); if (rejected != null) return rejected;
        return commit(before, "", 0, false, List.of(), true);
    }
    synchronized Result undo(Undo token) {
        AtomicWorkbenchPendingPayload before = load();
        if (token == null || undo != token || clock.getAsLong() > token.until || !before.id.equals(token.before.id) || before.revision != token.after)
            return failure(before, "undo_stale", "素材已变化，无法撤销这次移除");
        return commit(before, token.before.text, token.before.textCreated, token.before.textExpired, token.before.files, false);
    }
    synchronized AtomicWorkbenchPendingPayload delivery(String id, long revision, String itemId, boolean textOnly) throws IOException {
        AtomicWorkbenchPendingPayload current = load();
        if (current.state == AtomicWorkbenchPendingPayload.State.READ_FAILED || !current.id.equals(id) || current.revision != revision)
            throw new IOException("素材已变化或尚未恢复，请重新打开");
        if (itemId != null) {
            AtomicWorkbenchPendingPayload.FileItem item = current.file(itemId);
            if (item == null || item.availability != AtomicWorkbenchPendingPayload.Availability.READY) throw new IOException("此素材不存在或已过期");
            return new AtomicWorkbenchPendingPayload(current.id, current.revision, "", 0, false, List.of(item), AtomicWorkbenchPendingPayload.State.READY);
        }
        if (textOnly) {
            if (current.text.isEmpty() || current.textExpired) throw new IOException("文字为空或已过期");
            return new AtomicWorkbenchPendingPayload(current.id, current.revision, current.text, current.textCreated, false, List.of(), AtomicWorkbenchPendingPayload.State.READY);
        }
        if (!current.deliverable()) throw new IOException("有素材已失效，请先移除或明确选择有效单项");
        return current;
    }
    private Result reject(AtomicWorkbenchPendingPayload before, String id, long revision) {
        if (before.state == AtomicWorkbenchPendingPayload.State.READ_FAILED) return failure(before, "read_failed", "素材记录读取失败，原内容已保留，请重试");
        if (!before.id.equals(id) || before.revision != revision) return new Result(false, "conflict", "素材已被其他操作更新，请重试", before.state(AtomicWorkbenchPendingPayload.State.CONFLICT), null);
        return null;
    }
    private Result commit(AtomicWorkbenchPendingPayload before, String text, long textCreated, boolean expired,
            List<AtomicWorkbenchPendingPayload.FileItem> files, boolean allowUndo) {
        if (before.revision >= Long.MAX_VALUE - 1) return failure(before, "revision_limit", "素材记录版本无效，请重新打开");
        AtomicWorkbenchPendingPayload candidate = hydrate(new AtomicWorkbenchPendingPayload(before.id, before.revision + 1,
                text, textCreated, expired, files, AtomicWorkbenchPendingPayload.State.READY));
        try { storage.write(encode(candidate)); }
        catch (UncertainSave uncertain) { return new Result(false, "save_unknown", uncertain.getMessage(), before.state(AtomicWorkbenchPendingPayload.State.READ_FAILED), null); }
        catch (IOException | RuntimeException failed) { return new Result(false, "save_failed", "素材保存失败，原内容和顺序已保留", before.state(AtomicWorkbenchPendingPayload.State.SAVE_FAILED), null); }
        committed = candidate; persisted = true; undo = allowUndo ? new Undo(before, candidate.revision, clock.getAsLong() + 10_000L) : null;
        for (Listener listener : listeners) try { listener.changed(candidate); } catch (RuntimeException ignored) { }
        return new Result(true, "saved", "已更新流转素材", candidate, undo);
    }
    private AtomicWorkbenchPendingPayload hydrate(AtomicWorkbenchPendingPayload source) {
        long now = clock.getAsLong(); boolean expired = source.textExpired || !source.text.isEmpty() && !AtomicWorkbenchTransferPolicy.fresh(source.textCreated, now);
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>(); boolean partial = expired;
        for (AtomicWorkbenchPendingPayload.FileItem item : source.files) {
            AtomicWorkbenchPendingPayload.FileItem checked = catalog.inspect(item, now);
            files.add(checked); partial |= checked.availability != AtomicWorkbenchPendingPayload.Availability.READY;
        }
        String text = expired ? "" : source.text;
        AtomicWorkbenchPendingPayload.State state = partial ? AtomicWorkbenchPendingPayload.State.PARTIAL
                : files.isEmpty() && text.isEmpty() ? AtomicWorkbenchPendingPayload.State.EMPTY : AtomicWorkbenchPendingPayload.State.READY;
        return new AtomicWorkbenchPendingPayload(source.id, source.revision, text, source.textCreated, expired, files, state);
    }
    private static int index(List<AtomicWorkbenchPendingPayload.FileItem> files, String id) {
        for (int index = 0; index < files.size(); index++) if (files.get(index).id.equals(id)) return index;
        return -1;
    }
    private static Result failure(AtomicWorkbenchPendingPayload snapshot, String reason, String message) { return new Result(false, reason, message, snapshot, null); }
    static final class Result {
        final boolean success; final String reason, message; final AtomicWorkbenchPendingPayload snapshot; final Undo undo;
        Result(boolean success, String reason, String message, AtomicWorkbenchPendingPayload snapshot, Undo undo) { this.success = success; this.reason = reason; this.message = message; this.snapshot = snapshot; this.undo = undo; }
    }
    static final class Undo { final AtomicWorkbenchPendingPayload before; final long after, until; Undo(AtomicWorkbenchPendingPayload before, long after, long until) { this.before = before; this.after = after; this.until = until; } }
    static byte[] encode(AtomicWorkbenchPendingPayload value) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(); DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(MAGIC); string(out, value.id); out.writeLong(value.revision); string(out, value.text); out.writeLong(value.textCreated); out.writeBoolean(value.textExpired); out.writeInt(value.files.size());
        for (AtomicWorkbenchPendingPayload.FileItem file : value.files) {
            string(out, file.id); string(out, file.uri); string(out, file.name); string(out, file.mime); out.writeLong(file.bytes); out.writeLong(file.created);
        }
        out.flush(); if (bytes.size() > MAX_MANIFEST) throw new IOException("素材记录过大"); return bytes.toByteArray();
    }
    static AtomicWorkbenchPendingPayload decode(byte[] bytes) throws IOException {
        if (bytes.length > MAX_MANIFEST) throw new IOException(); DataInputStream in = new DataInputStream(new ByteArrayInputStream(bytes));
        if (in.readInt() != MAGIC) throw new IOException(); String id = string(in, 64); if (!UUID.fromString(id).toString().equals(id)) throw new IOException();
        long revision = in.readLong(); if (revision < 0 || revision == Long.MAX_VALUE) throw new IOException();
        String text = AtomicWorkbenchPendingPayload.text(string(in, AtomicWorkbenchTransferPolicy.MAX_TEXT * 4)); long copied = in.readLong(); boolean expired = in.readBoolean();
        int count = in.readInt(); if (count < 0 || count > AtomicWorkbenchTransferPolicy.MAX_ITEMS) throw new IOException();
        ArrayList<AtomicWorkbenchPendingPayload.FileItem> files = new ArrayList<>(); HashSet<String> seen = new HashSet<>(); long total = 0;
        for (int index = 0; index < count; index++) {
            String item = string(in, 32), uri = string(in, 8192), name = string(in, 1024), mime = string(in, 127); long size = in.readLong(), created = in.readLong();
            if (!AtomicWorkbenchTransferPolicy.validId(item) || !seen.add(item) || size < 0 || size > AtomicWorkbenchTransferPolicy.MAX_BYTES - total) throw new IOException();
            total += size;
            files.add(new AtomicWorkbenchPendingPayload.FileItem(item, uri, name, AtomicWorkbenchTransferPolicy.mime(mime), size, created, AtomicWorkbenchPendingPayload.Availability.READY));
        }
        if (in.read() != -1) throw new IOException(); return new AtomicWorkbenchPendingPayload(id, revision, text, copied, expired, files, AtomicWorkbenchPendingPayload.State.READY);
    }
    private static void string(DataOutputStream out, String value) throws IOException { byte[] bytes = value.getBytes(StandardCharsets.UTF_8); out.writeInt(bytes.length); out.write(bytes); }
    private static String string(DataInputStream in, int limit) throws IOException {
        int length = in.readInt(); if (length < 0 || length > limit || length > in.available()) throw new IOException(); byte[] bytes = new byte[length]; in.readFully(bytes);
        try { return StandardCharsets.UTF_8.newDecoder().onMalformedInput(java.nio.charset.CodingErrorAction.REPORT).onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT).decode(java.nio.ByteBuffer.wrap(bytes)).toString(); }
        catch (java.nio.charset.CharacterCodingException invalid) { throw new IOException(); }
    }
}
