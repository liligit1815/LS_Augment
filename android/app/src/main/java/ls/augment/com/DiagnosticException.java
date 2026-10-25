package ls.augment.com;

import java.io.PrintWriter;
import java.io.Writer;

/** Complete Java traces (including causes and suppressed exceptions) within an explicit budget. */
public final class DiagnosticException {
    public static final int MAX_CHARS = 128 * 1024;
    private DiagnosticException() { }
    public static String render(Throwable error) {
        if (error == null) return "";
        try {
            LimitedWriter writer = new LimitedWriter();
            error.printStackTrace(new PrintWriter(writer));
            return writer.text.toString() + (writer.truncated ? "\n[TRUNCATED exception limitChars=" + MAX_CHARS + "]" : "");
        } catch (Throwable captureFailure) {
            return "[EXCEPTION_CAPTURE_FAILED type=" + captureFailure.getClass().getName() + "]";
        }
    }
    private static final class LimitedWriter extends Writer {
        final StringBuilder text = new StringBuilder();
        boolean truncated;
        @Override public void write(char[] value, int offset, int length) {
            int keep = Math.min(length, MAX_CHARS - text.length());
            if (keep > 0) text.append(value, offset, keep);
            if (keep < length) truncated = true;
        }
        @Override public void flush() { }
        @Override public void close() { }
    }
}
