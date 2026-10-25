package ls.augment.com;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.UserManager;

/** Private phone UI handoff. Intent extras carry only a one-use nonce, never extracted text. */
final class AtomicWorkbenchExtractionPresentation {
    static final String EXTRA_NONCE = "ls.augment.com.extraction_result";
    private static final AtomicWorkbenchExtractionHandoff HANDOFF = new AtomicWorkbenchExtractionHandoff(
            SystemClock::elapsedRealtime, ResetWriteFence::generation, ResetWriteFence::active);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private AtomicWorkbenchExtractionPresentation() { }

    static boolean show(Context context, AtomicWorkbenchExtractionResult result, AtomicWorkbenchExtractionRequest request) {
        if (context == null || result == null || request == null || result.state != AtomicWorkbenchExtractionResult.State.READY
                || !request.id.equals(result.requestId) || !request.fresh(SystemClock.elapsedRealtime())
                || ResetWriteFence.stale(request.resetGeneration)) return false;
        String nonce = null;
        try {
            if (!available(context)) return false;
            ConfigSnapshot config = new AppConfig(context).configSnapshot();
            if (!enabled(config) || config.revision != request.configRevision || !config.checksum.equals(request.configChecksum)) return false;
            AtomicWorkbenchExtractionHandoff.Value value = new AtomicWorkbenchExtractionHandoff.Value(result.requestId,
                    result.text, result.sourcePackage, request.configChecksum, request.resetGeneration);
            nonce = HANDOFF.offer(value);
            if (nonce == null) return false;
            String pending = nonce;
            MAIN.postDelayed(() -> HANDOFF.expire(pending), AtomicWorkbenchExtractionHandoff.MAX_AGE_MS);
            return launch(context, nonce);
        } catch (RuntimeException unavailable) { HANDOFF.expire(nonce); return false; }
    }

    static boolean launch(Context context, String nonce) {
        if (context == null || nonce == null || !available(context)) { HANDOFF.expire(nonce); return false; }
        try {
            Intent intent = new Intent(context, AtomicWorkbenchExtractionActivity.class).putExtra(EXTRA_NONCE, nonce);
            AtomicWorkbenchActivity host = AtomicWorkbenchActivity.extractionHost();
            // A separate root task has an ActivityRecordInputSink even when its
            // Window is hidden. Within this real same-UID task the framework can
            // deliver a drag to the visible workbench below the floating page.
            if (host != null) host.startActivity(intent);
            else context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS));
            return true;
        } catch (RuntimeException unavailable) { HANDOFF.expire(nonce); return false; }
    }

    static AtomicWorkbenchExtractionHandoff.Value consume(Context context, String nonce) {
        AtomicWorkbenchExtractionHandoff.Value value = HANDOFF.consume(nonce);
        if (value == null || !available(context)) return null;
        ConfigSnapshot config = new AppConfig(context).configSnapshot();
        return enabled(config) && value.checksum.equals(config.checksum) ? value : null;
    }
    static boolean available(Context context) {
        if (ResetWriteFence.active()) return false;
        UserManager user = context.getSystemService(UserManager.class);
        PowerManager power = context.getSystemService(PowerManager.class);
        KeyguardManager key = context.getSystemService(KeyguardManager.class);
        return user != null && user.isUserUnlocked() && power != null && power.isInteractive()
                && key != null && !key.isDeviceLocked();
    }
    static boolean enabled(ConfigSnapshot config) {
        return config != null && ConfigSchema.truthy(config.get(AtomicWorkbenchConfig.ENABLED))
                && ConfigSchema.truthy(config.get(AtomicWorkbenchExtractionPolicy.ENABLED))
                && ConfigSchema.truthy(config.get(AtomicWorkbenchExtractionPolicy.TEXT_ENABLED));
    }
    static void clear() { HANDOFF.clear(); }
}
