package ls.augment.com.hook;

import android.graphics.RectF;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.SystemOptions;

/** CropObject adapter inspected in Nubia Photo Editor neovision11.0_V16.0.000.2604031458. */
final class GalleryCropHook {
    private static final String PACKAGE = "cn.nubia.photoeditor";
    private static final String TYPE = "com.android.gallery3d.filtershow.crop.CropObject";
    private static boolean installed;
    private GalleryCropHook() { }

    static synchronized void install(AugmentModule module, ClassLoader loader, String pkg) {
        // Gallery's normal ACTION_EDIT route launches this separate editor package.
        if (!PACKAGE.equals(pkg) || installed) return;
        try {
            Class<?> type = Class.forName(TYPE, false, loader);
            Field minimum = type.getDeclaredField("mMinSideSize");
            Field fixed = type.getDeclaredField("mFixAspectRatio");
            Method inner = type.getDeclaredMethod("getInnerBounds");
            if (minimum.getType() != float.class || fixed.getType() != boolean.class
                    || inner.getReturnType() != RectF.class
                    || Modifier.isStatic(minimum.getModifiers()) || Modifier.isFinal(minimum.getModifiers())
                    || Modifier.isStatic(fixed.getModifiers()) || Modifier.isStatic(inner.getModifiers())
                    || Modifier.isAbstract(inner.getModifiers())) {
                throw new NoSuchFieldException("Unsupported editor crop geometry");
            }
            minimum.setAccessible(true);
            fixed.setAccessible(true);
            inner.setAccessible(true);
            String key = SystemOptions.key("gallery_crop_unlimited");
            String[] methods = {"moveCurrentSelection", "setInnerAspectRatio", "setInnerAspectNoRatio"};
            for (String name : methods) {
                Method target = type.getDeclaredMethod(name, float.class, float.class);
                Class<?> resultType = name.equals("setInnerAspectNoRatio") ? void.class : boolean.class;
                if (Modifier.isStatic(target.getModifiers()) || Modifier.isAbstract(target.getModifiers())
                        || target.getReturnType() != resultType) throw new NoSuchMethodException(name);
            }
            int count = 0;
            for (String name : methods) {
                // ImageCrop calls the two-argument inner-bounds movement. The
                // three-argument overload belongs to rotate/straighten handling.
                Class<?>[] args = new Class<?>[]{float.class, float.class};
                Class<?> resultType = name.equals("setInnerAspectNoRatio") ? void.class : boolean.class;
                count += OemHooks.methods(module, loader, TYPE, name, resultType, 2, key, chain -> {
                    Object owner = chain.getThisObject();
                    synchronized (owner) {
                        float original = minimum.getFloat(owner);
                        if (!Float.isFinite(original) || original <= 0f) return chain.proceed();
                        float floor = 1f;
                        // Fixed-corner movement projects both axis deltas onto the crop
                        // diagonal. A 1px axis clamp alone can project below one pixel.
                        if (name.equals("moveCurrentSelection") && fixed.getBoolean(owner)) {
                            Object bounds = inner.invoke(owner);
                            if (bounds instanceof RectF) floor = projectedPixelFloor((RectF) bounds);
                        }
                        // Never tighten an already smaller native floor, including tiny
                        // inputs. Native aspect, rotation and boundary checks still run.
                        float replacement = Math.min(original, floor);
                        minimum.setFloat(owner, replacement);
                        try {
                            return chain.proceed();
                        } finally {
                            // onDraw supplies a scale-dependent native floor. Keep it for
                            // hot-disable, subsequent layouts and exceptions in native code.
                            minimum.setFloat(owner, original);
                        }
                    }
                }, args);
            }
            installed = count > 0;
            module.logFeatureInfo("GALLERY_CROP_READY hooks=" + count);
        } catch (ReflectiveOperationException | RuntimeException error) {
            module.logFeatureError("GALLERY_CROP_INSTALL", error);
        }
    }

    private static float projectedPixelFloor(RectF bounds) {
        double width = bounds.width(), height = bounds.height();
        if (!Double.isFinite(width) || !Double.isFinite(height) || width <= 0 || height <= 0) return 1f;
        double floor = (width * width + height * height) / (Math.min(width, height) * (width + height));
        // Slightly round upward so float projection does not collapse at an integer
        // rounding boundary. This affects geometry validity, not the OEM UI size floor.
        return Float.isFinite((float) floor) ? Math.nextUp((float) Math.max(1d, floor)) : 1f;
    }
}
