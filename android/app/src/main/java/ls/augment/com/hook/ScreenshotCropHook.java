package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.SystemOptions;

/** Exact screenshot adapters verified in ZteScreenshot 16.0.000.000.2604151512. */
final class ScreenshotCropHook {
    private static final String PACKAGE = "com.android.ztescreenshot";
    private static final String KEY = SystemOptions.key("screenshot_crop_unlimited");
    private static final String STATE = "ls_augment_screenshot_crop_state";
    private static boolean installed;

    private ScreenshotCropHook() { }

    static synchronized void install(AugmentModule module, ClassLoader loader, String pkg) {
        if (!PACKAGE.equals(pkg) || installed) return;
        installed = true;
        int editor = editor(module, loader), overlay = overlay(module, loader), longer = longCrop(module, loader);
        module.logFeatureInfo("SCREENSHOT_CROP_REGISTERED editor=" + editor
                + " area=" + overlay + " long=" + longer + "; awaiting enabled execution");
    }

    private static int editor(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName("com.android.ztescreenshot.edit.event.CropEvent", false, loader);
            Field minimum = field(type, "MIN_CROP_BOX_SIZE", float.class);
            Field matrix = field(type, "mMatrix", Matrix.class);
            Field box = field(type, "mCropBox", RectF.class);
            if (Modifier.isStatic(minimum.getModifiers()) || Modifier.isStatic(matrix.getModifiers())
                    || Modifier.isStatic(box.getModifiers())) throw new NoSuchFieldException("CropEvent instance shape changed");
            Method move = method(type, "touchMove", void.class, float.class, float.class);
            Method up = method(type, "touchUp", void.class, float.class, float.class);
            Method crop = method(type, "crop", Bitmap.class, Bitmap.class);
            // CropRectangle itself has no minimum. CropEvent owns all eight edge/corner
            // clamps and the small-new-selection rejection in touchUp.
            int count = 0;
            for (Method target : new Method[]{move, up}) {
                module.registerFeatureHook(module.prepareFeatureHook(target,
                        "screenshot.crop." + target.getName(), false).intercept(chain -> {
                    Object owner = chain.getThisObject();
                    Context context = FeatureSettings.from(owner);
                    synchronized (owner) {
                        if (!enabled(context)) return chain.proceed();
                        float original = minimum.getFloat(owner);
                        float floor = pixelFloor((Matrix) matrix.get(owner));
                        if (!Float.isFinite(original) || original <= 0 || !Float.isFinite(floor))
                            return chain.proceed();
                        // Per-owner locking also keeps a concurrent disabled native call
                        // from observing the temporary field. The monitor is reentrant.
                        minimum.setFloat(owner, floor);
                        try {
                            Object result = chain.proceed();
                            evidence(context, "editor_native_threshold_applied");
                            return result;
                        } finally {
                            minimum.setFloat(owner, original);
                        }
                    }
                }));
                count++;
            }
            module.registerFeatureHook(module.prepareFeatureHook(crop,
                    "screenshot.crop.editor.output", false).intercept(chain -> {
                Object owner = chain.getThisObject();
                synchronized (owner) {
                    Context context = FeatureSettings.from(owner);
                    if (!enabled(context)) return chain.proceed();
                    RectF original = (RectF) box.get(owner);
                    RectF safe = positiveEditorRect((Matrix) matrix.get(owner), original, (Bitmap) chain.getArg(0));
                    if (safe == null) return chain.proceed();
                    // Protect native int(size) at fractional positions without replacing
                    // bitmap creation, masks, source drawing or the save continuation.
                    box.set(owner, safe);
                    try {
                        Object result = chain.proceed();
                        evidence(context, "editor_native_positive_pixel_applied");
                        return result;
                    } finally {
                        if (box.get(owner) == safe) box.set(owner, original);
                    }
                }
            }));
            count++;
            return count;
        } catch (Throwable error) {
            module.logFeatureError("SCREENSHOT_CROP_EDITOR_UNMATCHED", error);
            return 0;
        }
    }

    /** Minimum display span whose inverse-mapped square contains a full source pixel. */
    private static float pixelFloor(Matrix matrix) {
        if (matrix == null) return Float.NaN;
        Matrix inverse = new Matrix();
        if (!matrix.invert(inverse)) return Float.NaN;
        float[] values = new float[9];
        inverse.getValues(values);
        if (values[6] != 0 || values[7] != 0 || values[8] != 1) return Float.NaN;
        // Read linear terms directly; subtracting mapped positions can lose one
        // pixel at a fractional translation or after a large native zoom.
        float width = Math.abs(values[0]) + Math.abs(values[1]);
        float height = Math.abs(values[3]) + Math.abs(values[4]);
        if (!Float.isFinite(width) || !Float.isFinite(height) || width <= 0 || height <= 0)
            return Float.NaN;
        // Native crop casts inverse-mapped sizes to int. The small margin protects that
        // truncation through native zoom/animation roundoff; zero-sized images remain invalid.
        float floor = Math.max(1f / width, 1f / height);
        return floor * 1.001f + 0.001f;
    }

    private static RectF positiveEditorRect(Matrix matrix, RectF original, Bitmap bitmap) {
        if (matrix == null || original == null || bitmap == null || bitmap.isRecycled()
                || original.width() <= 0 || original.height() <= 0) return null;
        Matrix inverse = new Matrix();
        if (!matrix.invert(inverse)) return null;
        RectF source = new RectF(original);
        inverse.mapRect(source);
        if (!finite(source) || source.width() <= 0 || source.height() <= 0
                || (source.width() >= 1 && source.height() >= 1)) return null;
        // Only expand dimensions that would truncate to zero, inside the actual source.
        // A normal native selection keeps its original object and pixel-exact geometry.
        for (int attempt = 0; attempt < 4; attempt++) {
            RectF corrected = new RectF(source);
            float span = 1.01f + attempt * .1f;
            if (source.width() < 1) {
                float size = Math.min(span, bitmap.getWidth());
                corrected.left = Math.max(0, Math.min(source.left, bitmap.getWidth() - size));
                corrected.right = corrected.left + size;
            }
            if (source.height() < 1) {
                float size = Math.min(span, bitmap.getHeight());
                corrected.top = Math.max(0, Math.min(source.top, bitmap.getHeight() - size));
                corrected.bottom = corrected.top + size;
            }
            if (corrected.left < 0 || corrected.top < 0 || corrected.right > bitmap.getWidth()
                    || corrected.bottom > bitmap.getHeight()) return null;
            RectF safe = new RectF(corrected);
            matrix.mapRect(safe);
            for (int rounding = 0; rounding < 5; rounding++) {
                RectF roundTrip = new RectF(safe);
                inverse.mapRect(roundTrip);
                Rect pixels = new Rect();
                roundTrip.round(pixels);
                if (finite(safe) && finite(roundTrip) && (int) roundTrip.width() > 0
                        && (int) roundTrip.height() > 0 && pixels.left >= 0 && pixels.top >= 0
                        && pixels.right <= bitmap.getWidth() && pixels.bottom <= bitmap.getHeight()) return safe;
                // One-pixel source images cannot accommodate a 1.01px source box.
                // A few display ulps still round to exactly those same source bounds.
                safe.left = Math.nextDown(safe.left); safe.top = Math.nextDown(safe.top);
                safe.right = Math.nextUp(safe.right); safe.bottom = Math.nextUp(safe.bottom);
            }
        }
        return null;
    }

    private static boolean finite(RectF rect) {
        return Float.isFinite(rect.left) && Float.isFinite(rect.top)
                && Float.isFinite(rect.right) && Float.isFinite(rect.bottom);
    }

    private static int overlay(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> base = Class.forName("com.android.ztescreenshot.cropimage.CropBase", false, loader);
            Class<?> type = Class.forName("com.android.ztescreenshot.cropimage.CropRect", false, loader);
            if (type.getSuperclass() != base) throw new NoSuchFieldException("CropRect superclass changed");
            OverlayShape shape = new OverlayShape(base);
            Method target = method(type, "crop", Bitmap.class, Bitmap.class);
            module.registerFeatureHook(module.prepareFeatureHook(target,
                    "screenshot.crop.area", false).intercept(chain -> {
                Object owner = chain.getThisObject();
                Context context = FeatureSettings.from(owner);
                if (!enabled(context)) return chain.proceed();
                Bitmap bitmap = (Bitmap) chain.getArg(0);
                Rect original = (Rect) shape.rect.get(owner);
                Rect safe = shape.positiveRect(owner, bitmap, original);
                if (safe == null) return chain.proceed();
                // This path already has no OEM minimum. Only repair a nonempty selection
                // that native scaling would truncate to zero; keep native crop/save/bounds.
                shape.rect.set(owner, safe);
                try {
                    Object result = chain.proceed();
                    evidence(context, "area_native_positive_pixel_applied");
                    return result;
                } finally {
                    // Native clears clipRect outside area mode. Preserve that teardown.
                    if (shape.rect.get(owner) == safe) shape.rect.set(owner, original);
                }
            }));
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("SCREENSHOT_CROP_AREA_UNMATCHED", error);
            return 0;
        }
    }

    private static final class OverlayShape {
        final Field rect, scale, tx, ty, bitmapScale, minScale, bitmapX, bitmapY, minX;
        final Field bitmapWidth, bitmapHeight, padding, viewWidth, viewHeight;

        OverlayShape(Class<?> base) throws ReflectiveOperationException {
            rect = field(base, "clipRect", Rect.class);
            scale = field(base, "scale", float.class);
            tx = field(base, "translateX", int.class); ty = field(base, "translateY", int.class);
            bitmapScale = field(base, "mBitmapScale", float.class);
            minScale = field(base, "mBitmapMinScale", float.class);
            bitmapX = field(base, "mBitmapXTran", float.class);
            bitmapY = field(base, "mBitmapYTran", float.class);
            minX = field(base, "mBitmapXMinTran", float.class);
            bitmapWidth = field(base, "mBitmapWidth", float.class);
            bitmapHeight = field(base, "mBitmapHeight", float.class);
            padding = field(base, "mImageViewPadding", int.class);
            viewWidth = field(base, "mImageViewWidth", int.class);
            viewHeight = field(base, "mImageViewHeight", int.class);
            if (!Modifier.isStatic(minScale.getModifiers()) || !Modifier.isStatic(minX.getModifiers()))
                throw new NoSuchFieldException("CropBase initial transform changed");
        }

        Rect positiveRect(Object owner, Bitmap bitmap, Rect original) throws IllegalAccessException {
            if (bitmap == null || bitmap.isRecycled() || original == null
                    || original.width() <= 0 || original.height() <= 0) return null;
            float s = scale.getFloat(owner), initial = minScale.getFloat(null);
            float displayed = bitmapScale.getFloat(owner), ratio = displayed / initial;
            if (!Float.isFinite(s) || s <= 0 || !Float.isFinite(initial) || initial <= 0
                    || !Float.isFinite(ratio) || ratio <= 0) return null;
            if (pixels(owner, original, s, initial, ratio, bitmap)) return null;
            int floor = (int) Math.ceil(ratio / s);
            if (floor < 1 || floor > 1_000_000) return null;
            // Reproduce the two native int truncations before selecting the display floor.
            for (int i = 0; i < 4 && (int) (((int) (floor * s)) / ratio) < 1; i++) floor++;
            if ((int) (((int) (floor * s)) / ratio) < 1) return null;
            int p = padding.getInt(owner);
            float x = bitmapX.getFloat(owner), y = bitmapY.getFloat(owner);
            int left = Math.max(0, ((int) x) + p), top = Math.max(0, ((int) y) + p);
            int right = Math.min(viewWidth.getInt(owner), (int) (bitmapWidth.getFloat(owner) * displayed + x + p));
            int bottom = Math.min(viewHeight.getInt(owner), (int) (bitmapHeight.getFloat(owner) * displayed + y + p));
            if (right - left < floor || bottom - top < floor) return null;
            Rect safe = new Rect(original);
            safe.left = Math.max(left, Math.min(safe.left, right - floor));
            safe.top = Math.max(top, Math.min(safe.top, bottom - floor));
            safe.right = Math.min(right, Math.max(safe.right, safe.left + floor));
            safe.bottom = Math.min(bottom, Math.max(safe.bottom, safe.top + floor));
            return pixels(owner, safe, s, initial, ratio, bitmap) ? safe : null;
        }

        private boolean pixels(Object owner, Rect value, float s, float initial, float ratio, Bitmap bitmap)
                throws IllegalAccessException {
            int x = value.left - tx.getInt(owner), y = value.top - ty.getInt(owner);
            int width = value.width(), height = value.height();
            if (s != 1f) {
                x = (int) (x * s); y = (int) (y * s);
                width = (int) (width * s); height = (int) (height * s);
            }
            x = (int) ((x - ((bitmapX.getFloat(owner) - minX.getFloat(null)) / initial)) / ratio);
            y = (int) ((y - (bitmapY.getFloat(owner) / initial)) / ratio);
            width = (int) (width / ratio); height = (int) (height / ratio);
            x = Math.max(0, x); y = Math.max(0, y);
            return Math.min(width, bitmap.getWidth() - x) > 0
                    && Math.min(height, bitmap.getHeight() - y) > 0;
        }
    }

    private static int longCrop(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName("com.android.ztescreenshot.longcapture.supersnap.model.LongSnapModel", false, loader);
            Field start = field(type, "mCutStartY", int.class), end = field(type, "mCutEndY", int.class);
            Method correct = method(type, "correctY", int.class, int.class);
            Method notify = method(type.getSuperclass(), "notifyChanged", void.class, int.class);
            Method target = method(type, "setCutEndY", void.class, int.class, boolean.class);
            module.registerFeatureHook(module.prepareFeatureHook(target,
                    "screenshot.crop.long", false).intercept(chain -> {
                Object owner = chain.getThisObject();
                Context context = FeatureSettings.from(owner);
                if (!enabled(context)) return chain.proceed();
                int first = start.getInt(owner), requested = (Integer) chain.getArg(0);
                if (first < 0 || first == Integer.MAX_VALUE || (long) requested >= (long) first + 100)
                    return chain.proceed();
                int last = (Integer) invoke(correct, owner, Math.max(requested, first + 1));
                if (last <= first) return chain.proceed();
                // OEM inlines the 100-pixel constant. Keep its coordinate correction,
                // state write and optional observer notification, replacing only that floor.
                end.setInt(owner, last);
                if ((Boolean) chain.getArg(1)) invoke(notify, owner, 103);
                evidence(context, "long_native_cut_floor_applied");
                return null;
            }));
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("SCREENSHOT_CROP_LONG_UNMATCHED", error);
            return 0;
        }
    }

    private static Field field(Class<?> type, String name, Class<?> expected) throws ReflectiveOperationException {
        Field result = type.getDeclaredField(name);
        if (result.getType() != expected) throw new NoSuchFieldException(name + " type changed");
        result.setAccessible(true);
        return result;
    }

    private static Method method(Class<?> type, String name, Class<?> result, Class<?>... args)
            throws ReflectiveOperationException {
        Method target = type.getDeclaredMethod(name, args);
        if (target.getReturnType() != result || Modifier.isStatic(target.getModifiers())
                || Modifier.isAbstract(target.getModifiers())) throw new NoSuchMethodException(name + " shape changed");
        target.setAccessible(true);
        return target;
    }

    private static Object invoke(Method method, Object owner, Object... args) throws Throwable {
        try { return method.invoke(owner, args); }
        catch (InvocationTargetException error) { throw error.getCause(); }
    }

    private static boolean enabled(Context context) {
        return context != null && PACKAGE.equals(context.getPackageName()) && FeatureSettings.enabled(context, KEY);
    }

    private static void evidence(Context context, String state) {
        FeatureSettings.diagnostic(context, STATE, state);
    }
}
