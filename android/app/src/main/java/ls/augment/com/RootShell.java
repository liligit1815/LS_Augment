package ls.augment.com;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

/**
 * Narrow root process transport. Callers must construct commands from fixed
 * templates and validate every variable before invoking this class.
 */
final class RootShell {
    private static final long DEFAULT_TIMEOUT_SECONDS = 20L;
    private static final int DEFAULT_MAX_OUTPUT = 512 * 1024;

    private RootShell() { }

    static Result run(String command) {
        return run(command, null, DEFAULT_TIMEOUT_SECONDS, DEFAULT_MAX_OUTPUT);
    }

    static Result run(String command, String stdin) {
        return run(command, stdin, DEFAULT_TIMEOUT_SECONDS, DEFAULT_MAX_OUTPUT);
    }

    static Result run(String command, String stdin, long timeoutSeconds, int maxOutput) {
        Process process = null;
        OutputReader reader = null;
        try {
            String su = new java.io.File("/system/bin/su").canExecute()
                    ? "/system/bin/su" : "su";
            process = new ProcessBuilder(su, "-c", command)
                    .redirectErrorStream(true)
                    .start();
            reader = new OutputReader(process.getInputStream(), maxOutput);
            Thread readThread = new Thread(reader, "ls-augment-root-output");
            readThread.setDaemon(true);
            readThread.start();

            try (OutputStream output = process.getOutputStream()) {
                if (stdin != null && !stdin.isEmpty()) {
                    output.write(stdin.getBytes(StandardCharsets.UTF_8));
                }
            }

            if (!process.waitFor(timeoutSeconds, TimeUnit.SECONDS)) {
                process.destroyForcibly();
                readThread.join(1000L);
                return new Result(-1, reader.text(), true);
            }
            readThread.join(1000L);
            return new Result(process.exitValue(), reader.text(), false);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return new Result(130, "INTERRUPTED", false);
        } catch (Throwable error) {
            String message = error.getMessage();
            if (message == null || message.isEmpty()) message = "no_message";
            return new Result(127, error.getClass().getSimpleName() + ":" + message, false);
        } finally {
            if (process != null) process.destroy();
        }
    }

    static String quote(String value) {
        String text = value == null ? "" : value;
        return "'" + text.replace("'", "'\"'\"'") + "'";
    }

    private static final class OutputReader implements Runnable {
        private final InputStream input;
        private final int limit;
        private final ByteArrayOutputStream output = new ByteArrayOutputStream();

        OutputReader(InputStream input, int limit) {
            this.input = input;
            this.limit = Math.max(1024, limit);
        }

        @Override
        public void run() {
            byte[] buffer = new byte[4096];
            int remaining = limit;
            try {
                int count;
                while (remaining > 0 && (count = input.read(buffer, 0,
                        Math.min(buffer.length, remaining))) >= 0) {
                    output.write(buffer, 0, count);
                    remaining -= count;
                }
            } catch (IOException ignored) {
                // The process result remains authoritative.
            } finally {
                try { input.close(); } catch (IOException ignored) { }
            }
        }

        String text() {
            return new String(output.toByteArray(), StandardCharsets.UTF_8).trim();
        }
    }

    static final class Result {
        final int exitCode;
        final String output;
        final boolean timedOut;

        Result(int exitCode, String output, boolean timedOut) {
            this.exitCode = exitCode;
            this.output = output == null ? "" : output;
            this.timedOut = timedOut;
        }

        boolean isSuccess() {
            return !timedOut && exitCode == 0;
        }

        String publicError() {
            if (timedOut) return "执行超时";
            if (exitCode == 127) return "Root 不可用";
            String clean = output.replace('\n', ' ').replace('\r', ' ').trim();
            if (clean.length() > 220) clean = clean.substring(0, 220);
            return clean.isEmpty() ? "退出码 " + exitCode : clean;
        }
    }
}
