package ls.augment.com;

import android.content.Context;
import java.util.Map;
import ls.augment.com.step.WorkspaceCapacity;

/** Shared by Duo's settings page and the phone-side workspace preferences provider. */
public final class StepConfig {
    static final String UPPER = "atomic_workbench_upper_enabled";

    public static boolean enabled(Context context) {
        return new AppConfig(context).getBoolean(AtomicWorkbenchConfig.ENABLED);
    }
    public static int sideCount(Context context) {
        return new AppConfig(context).getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3);
    }
    public static boolean upper(Context context) {
        AppConfig config = new AppConfig(context);
        return config.getBoolean(UPPER) && WorkspaceCapacity.fitsLayout(config.getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3), true);
    }
    public static boolean saveLayout(Context context, int sides, boolean upper) {
        if (ResetWriteFence.blocked() || !WorkspaceCapacity.fitsLayout(sides, upper)) return false;
        return new AppConfig(context).save(Map.of(AtomicWorkbenchConfig.SIDE_COUNT,
                Integer.toString(sides), UPPER, upper ? "1" : "0")).success;
    }
}
