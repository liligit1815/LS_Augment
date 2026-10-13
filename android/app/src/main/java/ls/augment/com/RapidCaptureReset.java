package ls.augment.com;

import android.content.Context;
import android.os.Looper;
import android.os.Process;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** Cancels private leases and waits for the kernel hardware lock and restoration proof. */
final class RapidCaptureReset {
    private static final ModuleWorkerDrain RUNS = new ModuleWorkerDrain();
    private static volatile boolean restorationUnconfirmed;
    private RapidCaptureReset() { }
    static ModuleWorkerDrain.Ticket register(long generation, Runnable cancel) { return RUNS.register(generation, cancel); }
    static void observeHardwareResult(RootShell.Result result) {
        String output = result.output;
        boolean noWake = output.contains("LSA_CAPTURE_ERROR=busy") || output.contains("LSA_CAPTURE_ERROR=unverified_driver")
                || output.contains("LSA_CAPTURE_ERROR=unknown_mode") || output.contains("LSA_CAPTURE_ERROR=invalid_")
                || output.contains("LSA_CAPTURE_ERROR=device0_changed") || output.contains("LSA_CAPTURE_ERROR=device1_changed")
                || output.contains("LSA_CAPTURE_ERROR=missing_tools") || output.contains("LSA_CAPTURE_ERROR=missing_flock")
                || output.contains("LSA_CAPTURE_ERROR=lock_unavailable") || output.contains("LSA_CAPTURE_ERROR=recovery_pending");
        boolean restored = output.matches("(?s).*LSA_CAPTURE_RESTORED=[12]:[12](?:\\r?\\n|$).*")
                && !output.contains("LSA_CAPTURE_ERROR=restore_failed") && !output.contains("LSA_CAPTURE_ERROR=reader_stop_failed")
                && result.capture != null && result.capture.reliable();
        if (!noWake && !restored) restorationUnconfirmed = true;
    }

    /** Invoke after ResetWriteFence.begin(), before holding ACTION_LOCK or clearing the private cache. */
    static Result stopAndAwait(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) return failure("肩键会话停止须在后台执行");
        try {
            if (!RUNS.cancelAndAwait(22_000L)) return failure("肩键采集仍在恢复，请稍后重试；恢复凭据已保留");
            String script;
            try (InputStream input = context.getAssets().open("rapid_reset_wait.sh")) {
                script = new String(input.readAllBytes(), StandardCharsets.UTF_8);
            }
            int uid = Process.myUid(), user = uid / 100000;
            RootShell.Result waited = RootShell.run("sh", "expected_uid=" + uid + "\nexpected_user=" + user + "\n" + script, 20, 4096);
            if (!waited.isSuccess() || waited.capture == null || !waited.capture.reliable()
                    || !waited.output.matches("RAPID_CAPTURE_DRAINED:[0-9]{1,5}:[01]"))
                return failure("肩键恢复等待未确认：" + waited.publicError());
            String[] values = waited.output.split(":");
            if (restorationUnconfirmed || "1".equals(values[2]))
                return failure("肩键会话已停止，但旧会话原状态恢复凭据不完整；请先在原厂游戏空间恢复肩键再重试");
            return new Result(true, false, Integer.parseInt(values[1]), "肩键临时采集已停止，硬件会话已释放");
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt(); return failure("肩键恢复等待被中断，恢复凭据已保留");
        } catch (Exception unavailable) { return failure("肩键临时会话无法安全停止，恢复凭据已保留"); }
    }
    private static Result failure(String text) { return new Result(false, true, 0, text); }
    static final class Result {
        final boolean success, reviewRequired; final int count; final String message;
        Result(boolean success, boolean review, int count, String message) {
            this.success = success; reviewRequired = review; this.count = count; this.message = message;
        }
    }
}
