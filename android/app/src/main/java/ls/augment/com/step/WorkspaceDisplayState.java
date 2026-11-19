package ls.augment.com.step;

import android.content.Context;
import android.content.res.Configuration;
import android.hardware.display.DisplayManager;
import android.util.DisplayMetrics;
import android.view.Display;

/** Inputs to the physical Step layout. Attaching an audio or input device alone does not change them. */
record WorkspaceDisplayState(int width, int height, int rotation, int density, float fontScale,
        int direction, int uiMode, String locales) {
    @SuppressWarnings("deprecation")
    static WorkspaceDisplayState read(Context context) {
        DisplayManager manager = context.getSystemService(DisplayManager.class);
        Display display = manager == null ? null : manager.getDisplay(Display.DEFAULT_DISPLAY);
        if (display == null || !display.isValid()) return null;
        DisplayMetrics metrics = new DisplayMetrics();
        display.getRealMetrics(metrics);
        if (metrics.widthPixels <= 0 || metrics.heightPixels <= 0 || metrics.densityDpi <= 0) return null;
        Configuration config = context.getResources().getConfiguration();
        return new WorkspaceDisplayState(metrics.widthPixels, metrics.heightPixels, display.getRotation(),
                metrics.densityDpi, config.fontScale, config.getLayoutDirection(), config.uiMode,
                config.getLocales().toLanguageTags());
    }
}
