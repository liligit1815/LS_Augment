package ls.augment.com;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

/** Content bounds for phone-side sharing; independent of Android framework state. */
final class AtomicWorkbenchTransferPolicy {
    static final int MAX_ITEMS = 16, MAX_TEXT = 32768;
    static final long MAX_BYTES = 512L * 1024 * 1024;
    static final long CACHE_BYTES = 1024L * 1024 * 1024;
    static final long LIFETIME_MS = 24L * 60 * 60 * 1000;
    private AtomicWorkbenchTransferPolicy() { }

    static boolean validId(String value) { return value != null && value.matches("[0-9a-f]{32}"); }

    static boolean validPackage(String value) {
        return value != null && value.length() <= 255
                && value.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z][A-Za-z0-9_]*)+");
    }

    static String text(CharSequence value) throws IOException {
        if (value == null) return "";
        if (value.length() > MAX_TEXT) throw new IOException("文字过长，最多支持 32768 个字符");
        return value.toString().replace("\u0000", "");
    }

    static String displayName(String value) {
        String cleaned = value == null ? "" : value.replaceAll("[\\p{Cntrl}/\\\\]", "_").trim();
        if (cleaned.isEmpty() || cleaned.equals(".") || cleaned.equals("..")) return "分享文件";
        return cleaned.length() > 120 ? cleaned.substring(0, 120) : cleaned;
    }

    static String mime(String value) {
        if (value == null || value.length() > 127 || !value.matches("[A-Za-z0-9!#$&^_.+-]+/[A-Za-z0-9!#$&^_.+-]+"))
            return "application/octet-stream";
        return value.toLowerCase(java.util.Locale.ROOT);
    }

    static String commonMime(List<String> values) {
        if (values == null || values.isEmpty()) return "text/plain";
        String first = mime(values.get(0)), family = first.substring(0, first.indexOf('/'));
        boolean same = true;
        for (String value : values) {
            String current = mime(value);
            if (!first.equals(current)) same = false;
            if (!current.startsWith(family + "/")) return "*/*";
        }
        return same ? first : family + "/*";
    }

    static boolean fresh(long created, long now) {
        return created > 0 && created <= now + 5 * 60 * 1000L && now - created <= LIFETIME_MS;
    }

    static long copy(InputStream input, OutputStream output, long limit) throws IOException {
        if (input == null || limit < 0) throw new IOException("无法读取来源文件");
        byte[] buffer = new byte[64 * 1024];
        long count = 0;
        int emptyReads = 0;
        for (;;) {
            int read = input.read(buffer);
            if (read < 0) return count;
            if (read == 0) {
                if (++emptyReads > 32) throw new IOException("来源文件读取中断");
                continue;
            }
            emptyReads = 0;
            if (read > limit - count) throw new IOException("单次素材总大小最多支持 512 MB");
            output.write(buffer, 0, read); count += read;
        }
    }
}
