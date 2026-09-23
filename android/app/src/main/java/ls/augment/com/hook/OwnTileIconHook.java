package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Supplier;

/** Makes this app's image changes visible to the OEM tile state comparison. */
final class OwnTileIconHook {
    private static final String SPEC = "custom(ls.augment.com/.AugmentTileService)";

    private OwnTileIconHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> tile = Class.forName("com.android.systemui.qs.external.CustomTile", false, loader);
            Class<?> state = Class.forName("com.android.systemui.plugins.qs.QSTile$State", false, loader);
            Method update = tile.getDeclaredMethod("handleUpdateState", state, Object.class);
            Field spec = state.getField("spec");
            Field icon = state.getField("icon");
            Field supplier = state.getField("iconSupplier");
            update.setAccessible(true);
            AtomicBoolean reported = new AtomicBoolean();
            module.registerFeatureHook(module.prepareFeatureHook(update, "systemui.own_tile.icon", false)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            Object value = chain.getArg(0);
                            if (value == null || !SPEC.equals(spec.get(value))) return result;
                            Object source = supplier.get(value);
                            if (source instanceof Supplier<?>) {
                                Object rendered = ((Supplier<?>) source).get();
                                if (rendered != null && icon.getType().isInstance(rendered)) {
                                    // This ROM copies iconSupplier but does not compare it in
                                    // State.copyTo. Populate the compared native icon as well.
                                    icon.set(value, rendered);
                                }
                            }
                        } catch (Throwable error) {
                            if (reported.compareAndSet(false, true)) {
                                module.logFeatureError("OWN_TILE_ICON_REFRESH_FAILED", error);
                            }
                        }
                        return result;
                    }));
            module.logFeatureInfo("OWN_TILE_ICON_REFRESH_INSTALLED");
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("OWN_TILE_ICON_HOOK_FAILED", error);
            return 0;
        }
    }
}
