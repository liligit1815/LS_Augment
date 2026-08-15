package ls.augment.com.hook;

import android.content.Context;

import java.lang.reflect.Method;

/** Read-only old/new hook-point probe for current Beautify method surface. */
final class BeautifyCompatibilityProbe {
    private static final String[][] POINTS = {
            {"theme", "com.zte.beautify.view.common.preview.online.OnlineThemePreviewFragment",
                    "themeDownload"},
            {"resource", "com.zte.beautify.view.common.preview.BeautyPreviewActivity",
                    "ResourceDownload"},
            {"aod", "com.zte.beautify.view.common.preview.online.AodPreviewFragment",
                    "aodDownload"},
            {"charge", "com.zte.beautify.model.local.data.Bean", "getIsCharge"},
            {"manager", "com.zte.beautify.model.download.DownloadManager",
                    "startDownloadTask"},
            {"save_aod", "com.zte.beautify.view.common.tools.SaveAodPreviewTask", ""},
            {"trial_schedule", "com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper", "schedule"},
            {"trial_main_entry", "com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper", "StartTryResourcePage"},
            {"trial_expiry", "com.zte.beautify.view.common.preview.tryuse.RealResetResourceJobService", "onStartJob"},
            {"trial_main_theme", "com.zte.beautify.view.common.preview.tryuse.ResetResourceJobService", "processTheme"},
            {"trial_main_font", "com.zte.beautify.view.common.preview.tryuse.ResetResourceJobService", "processFont"},
            {"trial_main_live", "com.zte.beautify.view.common.preview.tryuse.ResetResourceJobService", "processLiveWallpaper"},
    };

    private BeautifyCompatibilityProbe() { }

    static void run(AugmentModule module, ClassLoader classLoader) {
        StringBuilder result = new StringBuilder();
        int compatible = 0;
        for (String[] point : POINTS) {
            boolean found = hasPoint(classLoader, point[1], point[2]);
            if (result.length() > 0) result.append(';');
            result.append(point[0]).append('=').append(found ? '1' : '0');
            if (found) compatible++;
        }
        result.append(";matched=").append(compatible).append('/').append(POINTS.length);
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_COMPAT, result.toString());
        module.logFeatureInfo("BEAUTIFY_COMPAT " + result);
    }

    private static boolean hasPoint(ClassLoader loader, String className, String methodName) {
        try {
            Class<?> type = Class.forName(className, false, loader);
            if (methodName.isEmpty()) return true;
            for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
                for (Method method : cursor.getDeclaredMethods()) {
                    if (methodName.equals(method.getName())) return true;
                }
            }
        } catch (Throwable ignored) {
            // Missing means the OTA moved or renamed the old release point.
        }
        return false;
    }
}
