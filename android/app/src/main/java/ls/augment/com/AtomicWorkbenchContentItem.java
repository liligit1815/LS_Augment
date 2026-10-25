package ls.augment.com;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Objects;

/** Immutable private content reference. External delivery must stage bytes through TransferStore. */
final class AtomicWorkbenchContentItem {
    enum Kind { MEDIA, FILES, CLIPBOARD }
    enum Source { MEDIA_STORE, DOCUMENTS, CLIPBOARD, IMPORTED }

    final Kind kind;
    final Source source;
    final String key, revision, uri, mime, name;
    final long modifiedMillis, size, durationMillis;
    private final String text;

    private AtomicWorkbenchContentItem(Kind kind, Source source, String uri, String mime,
            String name, long modified, long size, long duration, String text) {
        this.kind = Objects.requireNonNull(kind); this.source = Objects.requireNonNull(source);
        this.uri = uri; this.mime = mime; this.name = name; this.text = text;
        modifiedMillis = Math.max(0, modified); this.size = Math.max(-1, size);
        durationMillis = Math.max(0, duration);
        key = digest(source.name() + '\n' + (kind == Kind.CLIPBOARD ? text : uri));
        revision = kind == Kind.CLIPBOARD ? key : digest(key + '\n' + modifiedMillis + '\n' + this.size);
    }

    static AtomicWorkbenchContentItem file(Kind kind, Source source, String uri, String mime,
            String name, long modified, long size, long duration) {
        if (kind == Kind.CLIPBOARD || source == Source.CLIPBOARD || !contentUri(uri))
            throw new IllegalArgumentException("Invalid private content reference");
        return new AtomicWorkbenchContentItem(kind, source, uri, AtomicWorkbenchContentPolicy.mime(mime),
                AtomicWorkbenchContentPolicy.name(name), modified, size, duration, "");
    }

    static AtomicWorkbenchContentItem clipboard(CharSequence text, long copiedAt) {
        String value = AtomicWorkbenchContentPolicy.clipboardText(text);
        if (value.isEmpty()) throw new IllegalArgumentException("Empty clipboard text");
        return new AtomicWorkbenchContentItem(Kind.CLIPBOARD, Source.CLIPBOARD, "", "text/plain", "",
                copiedAt, -1, 0, value);
    }

    String text() { return text; }
    boolean video() { return mime.startsWith("video/"); }
    boolean image() { return mime.startsWith("image/"); }
    String historyKey() { return key + ':' + revision; }

    static boolean contentUri(String value) {
        if (value == null || value.length() > 8192) return false;
        try {
            URI parsed = URI.create(value);
            return "content".equals(parsed.getScheme()) && parsed.getRawAuthority() != null
                    && !parsed.getRawAuthority().isEmpty() && parsed.getRawUserInfo() == null
                    && parsed.getRawFragment() == null;
        } catch (IllegalArgumentException invalid) { return false; }
    }

    static String digest(String value) {
        try {
            byte[] bytes = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder out = new StringBuilder(64);
            for (byte item : bytes) out.append(Character.forDigit(item >>> 4 & 15, 16)).append(Character.forDigit(item & 15, 16));
            return out.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }

    @Override public String toString() { return "WorkbenchContentItem(" + kind + ',' + source + ')'; }
}
