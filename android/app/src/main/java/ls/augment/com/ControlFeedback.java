package ls.augment.com;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;

/** Shared press material for activity controls and controls hosted by SystemUI. */
public final class ControlFeedback {
    private ControlFeedback() {}
    public static Drawable ripple(int accent, Drawable content, Drawable mask) {
        return new RippleDrawable(ColorStateList.valueOf(Color.argb(38,
                Color.red(accent), Color.green(accent), Color.blue(accent))), content, mask);
    }
}
