package ls.augment.com;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

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
        return run(command, stdin, timeoutSeconds, maxOutput, null);
    }

    static Result run(String command, String stdin, long timeoutSeconds, int maxOutput,
            Consumer<String> onOutput) {
        String su = new java.io.File("/system/bin/su").canExecute() ? "/system/bin/su" : "su";
        return runProcess(new ProcessBuilder(su, "-c", command).redirectErrorStream(true),
                stdin, timeoutSeconds, maxOutput, onOutput);
    }

    /** Also permits unprivileged child processes in transport regression tests. */
    static Result runProcess(ProcessBuilder builder, String stdin, long timeoutSeconds, int maxOutput,
            Consumer<String> onOutput) {
        Process process = null;
        OutputReader reader = null;
        Thread writeThread = null;
        Thread exitThread = null;
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(Math.max(1L, timeoutSeconds));
        try {
            process = builder.start();
            reader = new OutputReader(process.getInputStream(), maxOutput, onOutput);
            Thread readThread = new Thread(reader, "ls-augment-root-output");
            readThread.setDaemon(true);
            readThread.start();

            OutputStream input = process.getOutputStream();
            AtomicReference<IOException> writeError = new AtomicReference<>();
            writeThread = new Thread(() -> {
                try (OutputStream output = input) {
                    if (stdin != null && !stdin.isEmpty())
                        output.write(stdin.getBytes(StandardCharsets.UTF_8));
                } catch (IOException error) { writeError.set(error); }
            }, "ls-augment-root-input");
            writeThread.setDaemon(true);
            writeThread.start();

            // The timeout includes a full stdin pipe: a denied/hung su must not
            // keep the worker blocked before waitFor is reached.
            // Android's timed Process.waitFor polls at ~100 ms intervals on the
            // target device. A blocking waiter signals completion immediately;
            // FutureTask still bounds the caller by the original full deadline.
            Process child = process;
            FutureTask<Integer> exited = new FutureTask<>(() -> child.waitFor());
            exitThread = new Thread(exited, "ls-augment-root-exit");
            exitThread.setDaemon(true);
            exitThread.start();
            long remaining = deadline - System.nanoTime();
            boolean timedOut = remaining <= 0;
            if (!timedOut) {
                try { exited.get(remaining, TimeUnit.NANOSECONDS); }
                catch (TimeoutException timeout) { timedOut = true; }
            }
            if (timedOut) {
                process.destroyForcibly();
                readThread.join(1000L);
                return reader.result(-1, true);
            }
            readThread.join(1000L);
            writeThread.join(1000L);
            if (process.exitValue() == 0 && writeError.get() != null)
                return new Result(74, "Root 输入写入失败", false);
            return reader.result(process.exitValue(), false);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return new Result(130, "INTERRUPTED", false);
        } catch (Throwable error) {
            String message = error.getMessage();
            if (message == null || message.isEmpty()) message = "no_message";
            return new Result(127, error.getClass().getSimpleName() + ":" + message, false);
        } finally {
            if (process != null) process.destroy();
            if (writeThread != null && writeThread.isAlive()) writeThread.interrupt();
            if (exitThread != null && exitThread.isAlive()) exitThread.interrupt();
        }
    }

    static String quote(String value) {
        String text = value == null ? "" : value;
        return "'" + text.replace("'", "'\"'\"'") + "'";
    }

    private static final class OutputReader implements Runnable {
        private final InputStream input;
        private final int limit;
        private final Consumer<String> onOutput;
        private final ByteArrayOutputStream output = new ByteArrayOutputStream();
        private boolean complete, failed, truncated;

        OutputReader(InputStream input, int limit, Consumer<String> onOutput) {
            this.input = input;
            this.limit = Math.max(1024, limit);
            this.onOutput = onOutput;
        }

        @Override
        public void run() {
            byte[] buffer = new byte[4096];
            int remaining = limit;
            try {
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    int kept = Math.min(count, remaining);
                    synchronized (output) {
                        if (kept > 0) output.write(buffer, 0, kept);
                        if (count > kept) truncated = true;
                    }
                    remaining -= kept;
                    // Drain excess output so hitting the capture limit cannot
                    // block the child or terminate it with a broken pipe.
                    if (onOutput != null && kept > 0) {
                        try { onOutput.accept(text()); }
                        catch (RuntimeException ignored) { }
                    }
                }
                synchronized (output) { complete = true; }
            } catch (IOException ignored) {
                synchronized (output) { failed = true; }
                // Existing process success semantics remain unchanged.
            } finally {
                try { input.close(); } catch (IOException ignored) { }
            }
        }

        Result result(int exitCode, boolean timedOut) {
            synchronized (output) {
                CapturedOutput captured = new CapturedOutput(output.toByteArray(),
                        complete, failed, truncated);
                return new Result(exitCode, captured.text().trim(), timedOut, captured);
            }
        }

        String text() {
            synchronized (output) {
                return new String(output.toByteArray(), StandardCharsets.UTF_8).trim();
            }
        }
    }

    /** Immutable snapshot; legacy/synthetic Results deliberately have no capture proof. */
    static final class CapturedOutput {
        private final byte[] bytes;
        final boolean complete, failed, truncated;
        CapturedOutput(byte[] bytes, boolean complete, boolean failed, boolean truncated) {
            this.bytes = bytes.clone();
            this.complete = complete;
            this.failed = failed;
            this.truncated = truncated;
        }
        byte[] bytes() { return bytes.clone(); }
        String text() { return new String(bytes, StandardCharsets.UTF_8); }
        boolean reliable() { return complete && !failed && !truncated; }
    }

    static final class Result {
        final int exitCode;
        final String output;
        final boolean timedOut;
        final CapturedOutput capture;

        Result(int exitCode, String output, boolean timedOut) {
            this(exitCode, output, timedOut, null);
        }

        Result(int exitCode, String output, boolean timedOut, CapturedOutput capture) {
            this.capture = capture;
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
