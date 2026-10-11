package ls.augment.com.hook;

import android.graphics.Paint;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Reads the native drawing color without requiring an optional ROM getter. */
final class LiftArcHandleColor {
    private LiftArcHandleColor() { }

    static String ensureVisible(View handle, int fallbackColor) throws ReflectiveOperationException {
        // NX809J draws with mPaint and has no getHandleColor(). Prefer that actual
        // Paint even on ROMs whose getter returns a cached or unrelated color.
        Paint paint = nativePaint(handle);
        if (paint != null) {
            if ((paint.getColor() >>> 24) >= 8) return "ok(paint)";
            if ((fallbackColor >>> 24) < 8) return "color:transparent";
            paint.setColor(fallbackColor);
            handle.invalidate();
            return "ok(paint-override)";
        }

        // A missing optional getter is a capability difference, not a runtime
        // failure. Without a writable Paint, never replace an unverified color.
        Method getter = optionalGetter(handle.getClass());
        if (getter == null) return "color:unverified";
        getter.setAccessible(true);
        Object color = getter.invoke(handle);
        if (!(color instanceof Integer)) return "color:unverified";
        return (((Integer) color) >>> 24) >= 8
                ? "ok(getter)" : "color:transparent(no-paint)";
    }

    private static Paint nativePaint(View handle) throws IllegalAccessException {
        for (Class<?> type = handle.getClass(); type != null; type = type.getSuperclass()) {
            Field field;
            try {
                field = type.getDeclaredField("mPaint");
            } catch (NoSuchFieldException absent) {
                continue;
            }
            field.setAccessible(true);
            Object value = field.get(handle);
            if (value instanceof Paint) return (Paint) value;
        }
        return null;
    }

    private static Method optionalGetter(Class<?> type) {
        for (; type != null; type = type.getSuperclass()) {
            try {
                return type.getDeclaredMethod("getHandleColor");
            } catch (NoSuchMethodException absent) {
                // Continue through inherited implementations before declaring
                // this optional capability unavailable.
            }
        }
        return null;
    }
}
