package ls.augment.com.hook;

import android.content.Context;
import android.content.ContentResolver;
import android.graphics.Rect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.function.Predicate;

/** GameSpace 260812 creates Sgame shortcut modes even on devices using the normal panel. */
final class ShoulderModeCompatibilityHook {
    private ShoulderModeCompatibilityHook() { }

    static int install(AugmentModule module, ClassLoader loader, Predicate<String> enabled) {
        int installed = 0;
        try {
            Class<?> helper = Class.forName("cn.nubia.tgk.TgkHelper", false, loader);
            // Older GameSpace has neither this flag nor the incompatible defaults.
            try {
                helper.getDeclaredField("IS_SUPPORT_TGK_SHORTCUT_FUNCTION");
            } catch (NoSuchFieldException legacy) {
                module.logFeatureInfo("SHOULDER_MODE_COMPAT legacy_skip");
                return 0;
            }
            Contract contract = new Contract(helper, loader, enabled);
            // Normalize every loaded preset/import before any consumer can read it,
            // including compiled callers that may have inlined the selection getter.
            module.registerFeatureHook(module.prepareFeatureHook(contract.load,
                    "shoulder.mode_compat.loaded", false).intercept(chain -> {
                Object result = chain.proceed();
                try {
                    Object info = chain.getArg(1);
                    if (info != null) {
                        for (Field table : new Field[]{contract.presets, contract.imports}) {
                            ArrayList<?> rows = (ArrayList<?>) table.get(info);
                            if (rows == null) continue;
                            for (Object data : rows) {
                                if (contract.eligible(data)) contract.normalize(module, data, null, "loaded");
                            }
                        }
                    }
                } catch (Throwable error) { contract.failure(module, error); }
                return result;
            }));
            installed++;
            // Cover stored and imported schemes whenever the OEM selects one, before
            // either the title array or the floating-button array consumes its mode.
            module.registerFeatureHook(module.prepareFeatureHook(contract.selected,
                    "shoulder.mode_compat.selected", false).intercept(chain -> {
                Object result = chain.proceed();
                try {
                    if (contract.eligible(result)) contract.normalize(module, result, null, "selected");
                } catch (Throwable error) { contract.failure(module, error); }
                return result;
            }));
            installed++;
            module.registerFeatureHook(module.prepareFeatureHook(contract.customize,
                    "shoulder.mode_compat.defaults", false).intercept(chain -> {
                Object data = chain.getThisObject();
                int[] previous = null;
                try {
                    if (contract.eligible(data)) {
                        int[] modes = (int[]) contract.options.get(data);
                        if (modes != null) previous = modes.clone();
                    }
                } catch (Throwable error) { contract.failure(module, error); }
                // Keep all OEM side effects and propagate OEM exceptions without retrying.
                Object result = chain.proceed();
                try {
                    if (contract.eligible(data)) contract.normalize(module, data, previous, "defaults");
                } catch (Throwable error) { contract.failure(module, error); }
                return result;
            }));
            installed++;
        } catch (Throwable error) {
            module.logFeatureError("SHOULDER_MODE_COMPAT install", error);
        }
        module.logFeatureInfo("SHOULDER_MODE_COMPAT ready installed=" + installed);
        return installed;
    }

    private static final class Contract {
        final Field shortcut, packageName, options, points, links, orientation, presets, imports;
        final Method selected, customize, updatePoints, load;
        final Constructor<?> constructor;
        final Predicate<String> enabled;
        boolean errorReported;

        Contract(Class<?> helper, ClassLoader loader, Predicate<String> enabled) throws Exception {
            this.enabled = enabled;
            shortcut = field(helper, "IS_SUPPORT_TGK_SHORTCUT_FUNCTION", boolean.class, true);
            constant(helper, "TGK_CONTROL_SGAME_MAP_VIEW", 10);
            constant(helper, "TGK_CONTROL_SGAME_SCORE_VIEW", 11);
            constant(helper, "TGK_OFF_OPT", 9);
            constant(helper, "TGK_SINGLE_OPT", 0);
            Class<?> data = Class.forName("cn.nubia.tgk.data.TgkData", false, loader);
            Class<?> info = Class.forName("cn.nubia.tgk.data.TgkGameInfo", false, loader);
            packageName = field(data, "packageName", String.class, false);
            options = field(data, "optionArray", int[].class, false);
            points = field(data, "pointsArray", Rect[][].class, false);
            links = field(data, "setLinkFlagArray", int[].class, false);
            orientation = field(data, "isLandscape", int.class, false);
            presets = field(info, "presetTableList", ArrayList.class, false);
            imports = field(info, "importTableList", ArrayList.class, false);
            load = ShoulderHookTargets.named(helper, true, void.class,
                    "loadingTgkCases", ContentResolver.class, info);
            selected = ShoulderHookTargets.named(info, false, data, "getSelectedCaseData");
            customize = ShoulderHookTargets.named(data, false, void.class,
                    "setCustomizedTgkData", Context.class, int.class);
            updatePoints = ShoulderHookTargets.named(data, false, void.class,
                    "updateDefaultPointsArray", int.class);
            if (selected == null || customize == null || updatePoints == null || load == null) {
                throw new NoSuchMethodException("GameSpace shoulder mode contract");
            }
            constructor = data.getDeclaredConstructor(String.class, int.class);
            constructor.setAccessible(true);
        }

        boolean eligible(Object data) throws IllegalAccessException {
            if (data == null || shortcut.getBoolean(null)) return false;
            String pkg = (String) packageName.get(data);
            return ("com.tencent.tmgp.sgame".equals(pkg)
                    || "com.tencent.tmgp.sgamece".equals(pkg)) && enabled.test(pkg);
        }

        void normalize(AugmentModule module, Object data, int[] previous, String source) throws Exception {
            int[] original = (int[]) options.get(data);
            if (original == null || original.length != 3) return;
            boolean[] convert = new boolean[3];
            int[] normalized = original.clone();
            boolean changed = false;
            for (int i = 0; i < 3; i++) {
                // Only these two confirmed Sgame modes are incompatible. Leave every
                // existing ordinary mode (including off=9) and unknown OEM mode alone.
                if (original[i] != 10 && original[i] != 11) continue;
                convert[i] = changed = true;
                normalized[i] = previous != null && previous.length == 3
                        && previous[i] >= 0 && previous[i] <= 9 ? previous[i] : 0;
            }
            if (!changed) return;

            Rect[][] oldPoints = (Rect[][]) points.get(data);
            Rect[][] newPoints = oldPoints == null ? new Rect[3][] : Arrays.copyOf(oldPoints, 3);
            Rect[][] defaults = null;
            int[] oldLinks = (int[]) links.get(data);
            int[] newLinks = oldLinks == null ? new int[3] : Arrays.copyOf(oldLinks, 3);
            for (int i = 0; i < 3; i++) {
                if (!convert[i]) continue;
                // Clear pending linkage so adjustTgkOptId does not replace the new tap mode.
                newLinks[i] = 0;
                Rect[] row = newPoints[i];
                Rect[] repaired = row == null ? new Rect[2] : Arrays.copyOf(row, 2);
                for (int j = 0; j < 2; j++) {
                    if (valid(repaired[j])) continue;
                    if (defaults == null) {
                        Object fallback = constructor.newInstance(packageName.get(data), 0);
                        updatePoints.invoke(fallback, orientation.getInt(data));
                        defaults = (Rect[][]) points.get(fallback);
                    }
                    Rect rect = defaults[i][j];
                    if (!valid(rect)) throw new IllegalStateException("Invalid OEM shoulder default point");
                    repaired[j] = new Rect(rect);
                }
                newPoints[i] = repaired;
            }
            // Stage all repairs before publishing the normal modes. Retain IDs, switches,
            // valid coordinates and table order; let the OEM handle any subsequent save.
            points.set(data, newPoints);
            links.set(data, newLinks);
            options.set(data, normalized);
            module.logFeatureInfo("SHOULDER_MODE_COMPAT converted pkg=" + packageName.get(data)
                    + " source=" + source
                    + " from=" + Arrays.toString(original) + " to=" + Arrays.toString(normalized));
        }

        void failure(AugmentModule module, Throwable error) {
            if (errorReported) return;
            errorReported = true;
            module.logFeatureError("SHOULDER_MODE_COMPAT normalize", error);
        }
    }

    private static boolean valid(Rect rect) {
        return rect != null && rect.left >= 0 && rect.top >= 0
                && rect.right > rect.left && rect.bottom > rect.top;
    }

    private static Field field(Class<?> owner, String name, Class<?> type, boolean isStatic)
            throws ReflectiveOperationException {
        Field field = owner.getDeclaredField(name);
        if (field.getType() != type || Modifier.isStatic(field.getModifiers()) != isStatic) {
            throw new NoSuchFieldException(owner.getName() + "." + name + " type/static mismatch");
        }
        field.setAccessible(true);
        return field;
    }

    private static void constant(Class<?> owner, String name, int expected)
            throws ReflectiveOperationException {
        if (field(owner, name, int.class, true).getInt(null) != expected) {
            throw new NoSuchFieldException(owner.getName() + "." + name + " value mismatch");
        }
    }
}
