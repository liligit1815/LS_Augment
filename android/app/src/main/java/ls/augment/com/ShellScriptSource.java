package ls.augment.com;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** UTF-8 shell assets must parse identically after Windows and Unix checkouts. */
final class ShellScriptSource {
    private ShellScriptSource() { }

    /** Reads without closing the caller-owned stream. */
    static String readUtf8(InputStream input) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int count;
        while ((count = input.read(buffer)) != -1) bytes.write(buffer, 0, count);
        return normalize(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
    }

    static String normalize(String source) {
        if (source.startsWith("\uFEFF")) source = source.substring(1);
        return source.replace("\r\n", "\n").replace('\r', '\n');
    }
}
