package ls.augment.com;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public final class TestRootShellTransport {
    private static int checks;
    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            switch (args[0]) {
                case "blocked": Thread.sleep(10000); break;
                case "output": System.out.write(new byte[5 * 1024 * 1024]); break;
                case "echo": System.out.write(System.in.readAllBytes()); break;
                case "error": System.out.print("denied"); System.exit(7); break;
                default: throw new AssertionError(args[0]);
            }
            return;
        }
        long start = System.nanoTime();
        RootShell.Result blocked = run("blocked", "a".repeat(4 * 1024 * 1024), 1, 1024);
        long elapsed = (System.nanoTime() - start) / 1_000_000;
        check(blocked.timedOut && elapsed < 3500, "timeout must include a blocked stdin writer, elapsed=" + elapsed);
        RootShell.Result fullOutput = run("output", null, 5, 1024);
        check(fullOutput.isSuccess() && fullOutput.output.length() <= 1024, "capped output is drained without breaking child");
        check(fullOutput.capture != null && fullOutput.capture.complete && fullOutput.capture.truncated
                && !fullOutput.capture.reliable(), "capture distinguishes drained-but-truncated output");
        String unicode = "空间 999：应用配置\n".repeat(10000);
        RootShell.Result echo = run("echo", unicode, 5, 512 * 1024);
        check(echo.isSuccess() && echo.output.equals(unicode.trim()), "complete UTF-8 stdin delivered");
        check(echo.capture != null && echo.capture.reliable() && echo.capture.text().equals(unicode),
                "raw complete UTF-8 capture retains final newline");
        byte[] exposed = echo.capture.bytes();
        exposed[0] ^= 1;
        check(Arrays.equals(echo.capture.bytes(), unicode.getBytes(StandardCharsets.UTF_8)),
                "consumer cannot mutate captured bytes");
        for (String text : new String[]{" \tACK\n", "ACK\n\n\t ", "ACK\0"}) {
            RootShell.Result raw = run("echo", text, 5, 1024);
            check(raw.isSuccess() && raw.output.equals("ACK"), "legacy trimmed output unchanged");
            check(raw.capture.reliable() && raw.capture.text().equals(text), "raw capture preserves extra characters");
        }
        RootShell.Result denied = run("error", null, 5, 1024);
        check(denied.exitCode == 7 && denied.output.equals("denied"), "permission/exit failure retained");
        check(denied.capture.reliable() && !denied.isSuccess(), "complete output cannot override failed exit");
        RootShell.Result unavailable = RootShell.runProcess(new ProcessBuilder("nonexistent-ls-augment-test-executable"),
                null, 1, 1024, null);
        check(unavailable.exitCode == 127 && !unavailable.isSuccess(), "missing executable retained");
        check(unavailable.capture == null && new RootShell.Result(0, "ACK", false).capture == null,
                "synthetic result is not capture evidence");
        RootShell.Result[] interruptedResult = new RootShell.Result[1];
        boolean[] retainedInterrupt = new boolean[1];
        Thread caller = new Thread(() -> {
            interruptedResult[0] = run("blocked", null, 10, 1024);
            retainedInterrupt[0] = Thread.currentThread().isInterrupted();
        });
        caller.start(); Thread.sleep(200); caller.interrupt(); caller.join(3000);
        check(!caller.isAlive() && interruptedResult[0] != null && interruptedResult[0].exitCode == 130
                && retainedInterrupt[0], "interrupt releases caller and retains interruption status");
        long waiterDeadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        while (hasExitWaiter() && System.nanoTime() < waiterDeadline) Thread.sleep(20);
        check(!hasExitWaiter(), "completed, timed-out and interrupted processes leave no exit waiter");
        readerBoundaries();
        System.out.println("Root transport checks: " + checks + " OK; blocked stdin timeout=" + elapsed + "ms");
    }
    private static boolean hasExitWaiter() {
        return Thread.getAllStackTraces().keySet().stream()
                .anyMatch(thread -> thread.isAlive() && thread.getName().equals("ls-augment-root-exit"));
    }
    private static RootShell.Result run(String mode, String stdin, long timeout, int cap) {
        String java = Path.of(System.getProperty("java.home"), "bin", "java").toString();
        return RootShell.runProcess(new ProcessBuilder(java, "-cp", System.getProperty("java.class.path"),
                TestRootShellTransport.class.getName(), mode).redirectErrorStream(true), stdin, timeout, cap, null);
    }
    private static void readerBoundaries() throws Exception {
        Object broken = reader(new InputStream() {
            boolean sent;
            @Override public int read() { throw new AssertionError("buffer read expected"); }
            @Override public int read(byte[] b, int off, int len) throws IOException {
                if (sent) throw new IOException("injected read failure after valid prefix");
                sent = true;
                byte[] prefix = "ACK".getBytes(StandardCharsets.US_ASCII);
                System.arraycopy(prefix, 0, b, off, prefix.length);
                return prefix.length;
            }
        });
        ((Runnable) broken).run();
        RootShell.Result failedRead = snapshot(broken);
        check(failedRead.output.equals("ACK") && failedRead.capture.failed && !failedRead.capture.reliable(),
                "prefix followed by read failure lacks completeness proof");

        CountDownLatch prefixRead = new CountDownLatch(1), releaseEof = new CountDownLatch(1);
        Object pending = reader(new InputStream() {
            boolean sent;
            @Override public int read() { throw new AssertionError("buffer read expected"); }
            @Override public int read(byte[] b, int off, int len) throws IOException {
                if (!sent) { sent = true; b[off] = 'A'; return 1; }
                prefixRead.countDown();
                try {
                    if (!releaseEof.await(5, TimeUnit.SECONDS)) throw new IOException("test deadline");
                } catch (InterruptedException e) { Thread.currentThread().interrupt(); throw new IOException(e); }
                return -1;
            }
        });
        Thread thread = new Thread((Runnable) pending, "test-root-output-completeness");
        thread.start();
        try {
            check(prefixRead.await(5, TimeUnit.SECONDS), "reader reached pending EOF boundary");
            RootShell.Result beforeEof = snapshot(pending);
            check(beforeEof.output.equals("A") && !beforeEof.capture.complete && !beforeEof.capture.reliable(),
                    "prefix without EOF cannot prove complete output");
            releaseEof.countDown();
            thread.join(5000);
            check(!thread.isAlive() && snapshot(pending).capture.reliable(), "fresh EOF snapshot becomes reliable");
            check(!beforeEof.capture.reliable(), "earlier incomplete result stays incomplete");
        } finally { releaseEof.countDown(); thread.join(5000); }
    }
    private static Object reader(InputStream input) throws Exception {
        Class<?> type = Class.forName("ls.augment.com.RootShell$OutputReader");
        Constructor<?> c = type.getDeclaredConstructor(InputStream.class, int.class, java.util.function.Consumer.class);
        c.setAccessible(true);
        return c.newInstance(input, 1024, null);
    }
    private static RootShell.Result snapshot(Object reader) throws Exception {
        Method m = reader.getClass().getDeclaredMethod("result", int.class, boolean.class);
        m.setAccessible(true);
        return (RootShell.Result) m.invoke(reader, 0, false);
    }
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
}
