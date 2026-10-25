package ls.augment.com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Immutable private pending content. IDs/revisions are transport identities, never content hashes. */
final class AtomicWorkbenchPendingPayload {
    enum Availability { READY, MISSING, EXPIRED, UNREADABLE }
    enum State { READY, PARTIAL, EMPTY, READ_FAILED, SAVE_FAILED, CONFLICT }
    final String id, text;
    final long revision, textCreated;
    final boolean textExpired;
    final List<FileItem> files;
    final State state;

    AtomicWorkbenchPendingPayload(String id, long revision, String text, long textCreated,
            boolean textExpired, List<FileItem> files, State state) {
        this.id = id; this.revision = revision; this.text = text;
        this.textCreated = textCreated; this.textExpired = textExpired;
        this.files = Collections.unmodifiableList(new ArrayList<>(files)); this.state = state;
    }
    boolean empty() { return text.isEmpty() && !textExpired && files.isEmpty(); }
    boolean deliverable() {
        if (textExpired || empty() || state == State.READ_FAILED || state == State.SAVE_FAILED) return false;
        for (FileItem file : files) if (file.availability != Availability.READY) return false;
        return true;
    }
    String signature() { return id + ':' + revision; }
    String summary() {
        String words = !text.isEmpty() || textExpired ? (textExpired ? "文字已过期" : "文字 · " + text.length() + " 字") : "";
        String attachments = files.isEmpty() ? "" : files.size() + " 个文件";
        return words.isEmpty() ? attachments : attachments.isEmpty() ? words : words + " + " + attachments;
    }
    FileItem file(String itemId) {
        for (FileItem item : files) if (item.id.equals(itemId)) return item;
        return null;
    }
    AtomicWorkbenchPendingPayload state(State next) {
        return new AtomicWorkbenchPendingPayload(id, revision, text, textCreated, textExpired, files, next);
    }
    static String text(CharSequence raw) throws IOException {
        if (raw == null) return "";
        if (raw.length() > AtomicWorkbenchTransferPolicy.MAX_TEXT) throw new IOException("文字过长，最多支持 32768 个字符");
        return raw.toString().replace("\u0000", "");
    }
    static final class FileItem {
        final String id, uri, name, mime;
        final long bytes, created;
        final Availability availability;
        FileItem(String id, String uri, String name, String mime, long bytes, long created, Availability availability) {
            this.id = id; this.uri = uri; this.name = name; this.mime = mime;
            this.bytes = bytes; this.created = created; this.availability = availability;
        }
        FileItem availability(Availability value) { return new FileItem(id, uri, name, mime, bytes, created, value); }
        boolean image() { return mime.startsWith("image/"); }
        boolean video() { return mime.startsWith("video/"); }
        @Override public String toString() { return "PendingFile(" + availability + ')'; }
    }
    @Override public String toString() { return "PendingPayload(" + state + ",files=" + files.size() + ')'; }
}
