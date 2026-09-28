package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.widget.TextView;

/** Resource-free menu artwork: this view runs in the launcher's resource context. */
final class LauncherPagesEntry {
    static void style(TextView entry, TextView reference) {
        float density = entry.getResources().getDisplayMetrics().density;
        int size = Math.round(52 * density);
        if (reference != null) {
            entry.setGravity(reference.getGravity());
            Drawable top = reference.getCompoundDrawables()[1];
            if (top != null && top.getBounds().height() > 0) size = top.getBounds().height();
            entry.setPadding(reference.getPaddingLeft(), reference.getPaddingTop(),
                    reference.getPaddingRight(), reference.getPaddingBottom());
            entry.setCompoundDrawablePadding(reference.getCompoundDrawablePadding());
            entry.setMinHeight(Math.max(Math.round(72 * density), reference.getMinimumHeight()));
        } else {
            entry.setCompoundDrawablePadding(Math.round(10 * density));
        }
        Drawable icon = new PagesIcon(entry.getCurrentTextColor());
        icon.setBounds(0, 0, size, size);
        entry.setCompoundDrawables(null, icon, null, null);
        entry.setSingleLine(true);
        entry.setClickable(true);
        entry.setFocusable(true);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xffffffff);
        mask.setCornerRadius(18 * density);
        entry.setBackground(new RippleDrawable(ColorStateList.valueOf(0x30ffffff), null, mask));
    }

    private static final class PagesIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int color;
        private int alpha = 255;
        PagesIcon(int color) { this.color = color; }
        @Override public void draw(Canvas canvas) {
            int save = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 56f, getBounds().height() / 56f);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
            paint.setAlpha(Math.round(alpha * 0.14f));
            canvas.drawCircle(28, 28, 27, paint);
            paint.setAlpha(Math.round(alpha * 0.35f));
            canvas.drawRoundRect(new RectF(17, 15, 35, 37), 3, 3, paint);
            paint.setAlpha(alpha);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2.2f);
            paint.setStrokeJoin(Paint.Join.ROUND);
            canvas.drawRoundRect(new RectF(22, 19, 40, 41), 3, 3, paint);
            canvas.restoreToCount(save);
        }
        @Override public void setAlpha(int value) { alpha = value; invalidateSelf(); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private LauncherPagesEntry() {}
}
