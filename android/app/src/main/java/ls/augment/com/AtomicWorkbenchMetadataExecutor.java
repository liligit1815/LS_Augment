package ls.augment.com;

import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.Function;

/** A slow content witness cannot turn into a request to close all workspace tasks. */
final class AtomicWorkbenchMetadataExecutor {
    private AtomicWorkbenchMetadataExecutor() { }

    static Bundle execute(Handler engine, Callable<Bundle> action, long timeoutMillis,
            Function<Throwable, Bundle> failure) {
        if (timeoutMillis < 1 || timeoutMillis > 20000) throw new IllegalArgumentException("metadata_wait");
        FutureTask<Bundle> operation = new FutureTask<>(() -> {
            long identity = Binder.clearCallingIdentity();
            try { return action.call(); }
            finally { Binder.restoreCallingIdentity(identity); }
        });
        if (!engine.post(operation)) return AtomicWorkbenchProtocol.failure("工作台连接已结束，原任务和内容已保留。");
        try { return operation.get(timeoutMillis, TimeUnit.MILLISECONDS); }
        catch (TimeoutException timeout) {
            // Cancels a queued call. A running Binder call may still finish and owns
            // its real Host/Platform lease until release/maintenance observes it.
            operation.cancel(false);
            return unconfirmed("metadata_timeout");
        } catch (InterruptedException interrupted) {
            operation.cancel(false); Thread.currentThread().interrupt();
            return unconfirmed("metadata_interrupted");
        } catch (ExecutionException unavailable) {
            return failure.apply(unavailable.getCause() == null ? unavailable : unavailable.getCause());
        }
    }

    private static Bundle unconfirmed(String reason) {
        Bundle result = AtomicWorkbenchProtocol.failure("本次操作的结果尚未确认，原任务和内容已保留。请检查目标应用后再操作。");
        result.putBoolean("operation_unconfirmed", true); result.putString("operation_reason", reason);
        return result;
    }
}
