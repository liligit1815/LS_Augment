package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

/** Match verified card controls to the ordinary OEM island's actual foreground color. */
final class NativeIslandCardContrast {
    static void apply(View view, int color) {
        if (ownsMeetingSurface(view)) return;
        if (view instanceof TextView) ((TextView) view).setTextColor(color);
        if (view instanceof ImageView && view.getId() != View.NO_ID) {
            String name = "";
            try { name = view.getResources().getResourceEntryName(view.getId()); }
            catch (Resources.NotFoundException ignored) { }
            if ("play_pause_icon".equals(name) || "reset".equals(name) || "dismiss".equals(name)
                    || "live_island_btn_tag".equals(name) || "live_island_btn_resume_pause".equals(name))
                ((ImageView) view).setImageTintList(ColorStateList.valueOf(color));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) apply(group.getChildAt(i), color);
        }
    }
    private static boolean ownsMeetingSurface(View view) {
        if (!(view instanceof ViewGroup) || view.getId() == View.NO_ID || view.getBackground() == null) return false;
        try {
            // This verified OEM panel owns its background and themed text/button colors.
            // Its capsule still uses the ordinary island surface and needs the shared tint.
            return "com.zte.personalagent".equals(view.getResources().getResourcePackageName(view.getId()))
                    && "meeting_card_content_area".equals(view.getResources().getResourceEntryName(view.getId()));
        } catch (Resources.NotFoundException unknown) { return false; }
    }
    private NativeIslandCardContrast() { }
}
