package ls.augment.com;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.util.Log;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/** A single resumable startup job; no Root operation runs inside a broadcast callback. */
public final class BootJobService extends JobService {
    static final int JOB_ID = 204501;
    private static final int RESTORE = 1, MIRROR = 2, HIDDEN = 4, ALL = RESTORE | MIRROR | HIDDEN;
    private static final int MAX_FAILURES = 3;
    private static final String STATE = "boot-recovery", STATUS = "ls_augment_boot_recovery";
    private final ExecutorService worker = Executors.newSingleThreadExecutor(r ->
            new Thread(r, "LSA-BootRecovery"));
    private final Handler main = new Handler(Looper.getMainLooper());
    private Run active;

    static synchronized boolean schedule(Context context, boolean upgraded) {
        // A persisted unfinished upgrade can contain checkpoints from the previous
        // boot. Boot recovery must recheck device state even when that job exists.
        return scheduleWork(context, RESTORE | HIDDEN | (upgraded ? MIRROR : 0),
                upgraded ? 0 : RESTORE | HIDDEN);
    }

    /** A root-authorized recovery request only rechecks actual hidden state. */
    static synchronized boolean scheduleHiddenRefresh(Context context) {
        return scheduleWork(context, HIDDEN, HIDDEN);
    }

    private static boolean scheduleWork(Context context, int work, int resetWork) {
        try {
            JobScheduler scheduler = context.getSystemService(JobScheduler.class);
            if (scheduler == null) return false;
            JobInfo pending = scheduler.getPendingJob(JOB_ID);
            String resume = "";
            if (pending != null) {
                PersistableBundle previous = pending.getExtras();
                int existing = previous.getInt("work", 0) & ALL;
                if (resetWork == 0 && previous.getInt("version", -1) == BuildConfig.VERSION_CODE
                        && (existing & work) == work) return true;
                work |= existing;
                resume = previous.getString("request", "");
            }
            PersistableBundle extras = new PersistableBundle();
            extras.putInt("work", work);
            extras.putInt("version", BuildConfig.VERSION_CODE);
            extras.putString("resume", resume);
            extras.putInt("reset", resetWork);
            extras.putString("request", Long.toHexString(System.currentTimeMillis())
                    + ":" + Long.toHexString(System.nanoTime()));
            // Persisted jobs survive process death/reboot. A new boot merges with any
            // unfinished upgrade; ordinary boots do not cause an unnecessary mirror.
            JobInfo job = new JobInfo.Builder(JOB_ID, new ComponentName(context, BootJobService.class))
                    .setExtras(extras).setPersisted(true).setMinimumLatency(1000L)
                    .setBackoffCriteria(30_000L, JobInfo.BACKOFF_POLICY_EXPONENTIAL).build();
            return scheduler.schedule(job) == JobScheduler.RESULT_SUCCESS;
        } catch (RuntimeException error) {
            Log.w("LS_Augment", "Unable to schedule startup recovery", error);
            return false;
        }
    }

    @Override public boolean onStartJob(JobParameters params) {
        if (active != null) active.cancel();
        Run run = new Run(params);
        active = run;
        run.task = worker.submit(() -> recover(run));
        return true;
    }

    @Override public boolean onStopJob(JobParameters params) {
        if (active != null && active.params == params) {
            active.cancel();
            active = null;
        }
        // JobScheduler retains the same request/checkpoints and applies backoff.
        return true;
    }

    private void recover(Run run) {
        Context context = getApplicationContext();
        SharedPreferences state = null;
        String request = run.params.getExtras().getString("request", "");
        int wanted = run.params.getExtras().getInt("work", 0) & ALL;
        int completed = 0, failures = 0;
        boolean retry = false;
        try {
            run.check();
            state = context.getSharedPreferences(STATE, MODE_PRIVATE);
            boolean sameRequest = request.equals(state.getString("request", ""));
            String resume = run.params.getExtras().getString("resume", "");
            boolean resumed = !resume.isEmpty() && resume.equals(state.getString("request", ""));
            completed = sameRequest || resumed ? state.getInt("completed", 0) : 0;
            if (!sameRequest) completed &= ~run.params.getExtras().getInt("reset", 0);
            failures = sameRequest ? state.getInt("failures", 0) : 0;
            ScreenAutomation.sync(context);
            if (request.isEmpty() || wanted == 0 || failures >= MAX_FAILURES) return;
            AppConfig config = new AppConfig(context);
            SharedPreferences diagnostics = context.getSharedPreferences(AppConfig.DIAGNOSTICS, MODE_PRIVATE);
            boolean rootGranted = "GRANTED".equals(diagnostics.getString("root_last_state", ""))
                    && !diagnostics.getBoolean("root_prompt_suppressed", false);
            Exception stageFailure = null;
            boolean transientFailure = false;
            // Independent stages: an offline framework must not suppress device recovery,
            // and a failed Root operation must not suppress configuration publication.
            for (int stage : new int[] { MIRROR, RESTORE, HIDDEN }) {
                if ((wanted & stage) == 0 || (completed & stage) != 0) continue;
                try {
                    run.check();
                    if (stage == MIRROR) requireSuccess(config.mirrorAll());
                    else if (stage == RESTORE && rootGranted)
                        requireSuccess(BatteryLifeControl.restore(context));
                    else if (stage == HIDDEN) {
                        RootHideManager manager = new RootHideManager(context);
                        // Independent records cannot be inferred from an empty private cache.
                        // Boot only reads observed state; it never sends or replays SHOW.
                        if (rootGranted) {
                            RootHideManager.OperationResult result = manager.syncMirrors();
                            if (!result.success) throw new IOException(result.message);
                        }
                    }
                    run.check();
                    completed |= stage;
                    checkpoint(state, request, completed, failures);
                } catch (InterruptedException stopped) {
                    throw stopped;
                } catch (Exception error) {
                    run.check();
                    boolean terminal = error instanceof RootFailure
                            && (((RootFailure) error).code == 126 || ((RootFailure) error).code == 40);
                    if (terminal) {
                        completed |= stage;
                        checkpoint(state, request, completed, failures);
                    } else transientFailure = true;
                    if (stageFailure == null) stageFailure = error;
                }
            }
            run.check();
            ScreenAutomation.sync(context);
            if (stageFailure != null) {
                failures++;
                retry = transientFailure && failures < MAX_FAILURES;
                checkpoint(state, request, completed, failures);
                status(context, (retry ? "retry:" : "failed:") + failures + ":" + stageFailure.getMessage());
            } else {
                status(context, "complete:work=" + wanted + (rootGranted ? "" : ";root_stages_skipped"));
            }
        } catch (InterruptedException stopped) {
            Thread.currentThread().interrupt();
            // onStopJob owns rescheduling; do not finish a stopped/replaced invocation.
        } catch (Exception error) {
            if (!run.cancelled && !Thread.currentThread().isInterrupted()) {
                failures++;
                retry = failures < MAX_FAILURES;
                if (error instanceof RootFailure) {
                    int code = ((RootFailure) error).code;
                    if (code == 126 || code == 40) retry = false;
                }
                try { if (state != null) checkpoint(state, request, completed, failures); }
                catch (IOException ignored) { /* A storage failure must not crash the service. */ }
                status(context, (retry ? "retry:" : "failed:") + failures + ":" + error.getMessage());
            }
        } finally {
            boolean reschedule = retry;
            main.post(() -> {
                if (active != run || run.cancelled) return;
                active = null;
                jobFinished(run.params, reschedule);
            });
        }
    }

    private static void checkpoint(SharedPreferences state, String request, int completed, int failures)
            throws IOException {
        if (!state.edit().putString("request", request).putInt("completed", completed)
                .putInt("failures", failures).commit()) throw new IOException("checkpoint_unavailable");
    }

    private static void requireSuccess(RootShell.Result result) throws RootFailure {
        if (!result.isSuccess()) throw new RootFailure(result.exitCode, result.publicError());
    }

    private static void status(Context context, String value) {
        context.getSharedPreferences(AppConfig.DIAGNOSTICS, MODE_PRIVATE).edit()
                .putString(STATUS, value + ";ts=" + System.currentTimeMillis()).apply();
    }

    @Override public void onDestroy() {
        if (active != null) active.cancel();
        active = null;
        worker.shutdownNow();
        super.onDestroy();
    }

    private static final class RootFailure extends IOException {
        final int code;
        RootFailure(int code, String message) { super(message); this.code = code; }
    }

    private static final class Run {
        final JobParameters params;
        volatile boolean cancelled;
        Future<?> task;
        Run(JobParameters params) { this.params = params; }
        void cancel() { cancelled = true; if (task != null) task.cancel(true); }
        void check() throws InterruptedException {
            if (cancelled || Thread.currentThread().isInterrupted()) throw new InterruptedException();
        }
    }
}
