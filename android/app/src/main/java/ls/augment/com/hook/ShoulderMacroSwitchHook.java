package ls.augment.com.hook;

import android.content.Context;
import android.content.ContentProvider;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.regex.Pattern;

import ls.augment.com.GameOptions;
import ls.augment.com.BuildConfig;

/** Resolve bare hardware keys against the selected scheme, never an arbitrary suffix. */
final class ShoulderMacroSwitchHook {
    static final String CAPABILITIES_CALL = "ls_augment_shoulder_macro_capabilities";
    private static final String MANAGER = "cn.nubia.gamehelper.manager.GameMotionHelperManager";
    private static final String BEAN = "cn.nubia.gamehelper.bean.TouchKeyMapBean";
    private static final String AUTHORITY = "cn.nubia.tgk.data.TgkDataProvider";
    private static final String[] TABLES = {"preset_case_table", "import_case_table"};
    // Verified FeedUploadHelper.SPLIT in both supported GameSpace APKs.
    private static final String SPLIT = "_";
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+");
    private static volatile boolean installed;

    private ShoulderMacroSwitchHook() { }

    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 0;
        try {
            Class<?> manager = Class.forName(MANAGER, false, loader);
            Class<?> bean = Class.forName(BEAN, false, loader);
            Method resolve = manager.getDeclaredMethod("getTouchKeyBean", String.class, String.class);
            Method refresh = manager.getDeclaredMethod("updateTouchKeyMapSync");
            Method recover = manager.getDeclaredMethod("recoveryMotionByTouchKey", String.class, String.class);
            // Both inspected APKs dispatch touchKeyForStartRecovery through this
            // Runnable. Deoptimize its callers as well as the private lookup.
            Class<?> starter = Class.forName("cn.nubia.gamehelper.db.GameTouchProvider$3", false, loader);
            Method start = starter.getDeclaredMethod("run");
            Class<?> provider = Class.forName("cn.nubia.gamehelper.db.GameTouchProvider", false, loader);
            Method call = provider.getDeclaredMethod("call", String.class, String.class, Bundle.class);
            if (resolve.getReturnType() != bean || Modifier.isStatic(resolve.getModifiers())
                    || refresh.getReturnType() != void.class || Modifier.isStatic(refresh.getModifiers())
                    || recover.getReturnType() != void.class || Modifier.isStatic(recover.getModifiers())
                    || !Runnable.class.isAssignableFrom(starter) || start.getReturnType() != void.class
                    || Modifier.isStatic(start.getModifiers()) || !ContentProvider.class.isAssignableFrom(provider)
                    || call.getReturnType() != Bundle.class || Modifier.isStatic(call.getModifiers())) {
                throw new NoSuchMethodException("GameHelper macro resolver contract");
            }
            Field mappings = manager.getDeclaredField("mTouchKeyBeanMap");
            Field lock = manager.getDeclaredField("mTouchKeyBeanMapLock");
            Field contextField = manager.getDeclaredField("mContext");
            if (!Map.class.isAssignableFrom(mappings.getType()) || Modifier.isStatic(mappings.getModifiers())
                    || lock.getType() != Object.class || Modifier.isStatic(lock.getModifiers())
                    || contextField.getType() != Context.class || !Modifier.isStatic(contextField.getModifiers())) {
                throw new NoSuchFieldException("GameHelper macro map contract");
            }
            Field packageName = textField(bean, "packageName");
            Field touchKey = textField(bean, "touchKeyName");
            Field motionName = textField(bean, "motionName");
            resolve.setAccessible(true);
            refresh.setAccessible(true);
            mappings.setAccessible(true);
            lock.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(resolve, "shoulder.macro_selected", true)
                    .intercept(chain -> {
                        String key = (String) chain.getArg(0);
                        if (!"136".equals(key) && !"137".equals(key) && !"138".equals(key)) {
                            return chain.proceed();
                        }
                        Context context = FeatureSettings.from(chain.getThisObject());
                        if (!FeatureSettings.enabled(context, GameOptions.QUICK_SWITCH, false)
                                || !FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER)) {
                            return chain.proceed();
                        }
                        String pkg = (String) chain.getArg(1);
                        try {
                            if (context == null || pkg == null || pkg.length() > 255
                                    || !PACKAGE.matcher(pkg).matches()) throw new ResolveFailure("invalid_package");
                            Selection selected = selected(context, pkg, key);
                            if (!selected.main || !selected.enabled || selected.mode != 4) {
                                throw new ResolveFailure("selected_key_not_macro");
                            }
                            Object owner = chain.getThisObject();
                            // Keep the OEM's map population and bean contents. Only the
                            // lookup becomes exact; neither bindings nor names are written.
                            String binding = selected.table + SPLIT + selected.id + SPLIT + key;
                            Object result;
                            Object monitor = lock.get(owner);
                            if (monitor == null) throw new ResolveFailure("map_lock_unavailable");
                            synchronized (monitor) {
                                // OEM getTouchKeyBean refreshes while holding this
                                // same monitor; keep refresh and exact lookup together.
                                refresh.invoke(owner);
                                Object map = mappings.get(owner);
                                if (!(map instanceof Map)) throw new ResolveFailure("mapping_unavailable");
                                result = ((Map<?, ?>) map).get(binding);
                                if (!bean.isInstance(result) || !pkg.equals(packageName.get(result))
                                        || !binding.equals(touchKey.get(result))) {
                                    throw new ResolveFailure("exact_binding_missing");
                                }
                                Object name = motionName.get(result);
                                if (!(name instanceof String) || ((String) name).isEmpty()) {
                                    throw new ResolveFailure("motion_missing");
                                }
                            }
                            // A cross-process commit can occur while the OEM refreshes
                            // its cache. Discard that press rather than playing an old scheme.
                            if (!selected.same(selected(context, pkg, key))) {
                                throw new ResolveFailure("selection_changed");
                            }
                            trace("INFO", "stage=MACRO_RESOLVED route=exact_selected pkg=" + pkg
                                    + " table=" + selected.table + " caseId=" + selected.id
                                    + " keyCode=" + key + " status=EXACT_BINDING");
                            return result;
                        } catch (Throwable error) {
                            String reason = error instanceof ResolveFailure
                                    ? ((ResolveFailure) error).code : "resolver_error";
                            trace("ERROR", "stage=MACRO_RESOLVE_FAILED route=exact_selected keyCode=" + key
                                    + " reason=" + reason + " errorClass=" + error.getClass().getSimpleName());
                            // Never fall back to the OEM's numeric/suffix first match.
                            return null;
                        }
                    }));
            module.deoptimize(resolve);
            recover.setAccessible(true);
            start.setAccessible(true);
            module.deoptimize(recover);
            module.deoptimize(start);
            call.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(call, "shoulder.macro_capabilities", true)
                    .intercept(chain -> {
                        if (!CAPABILITIES_CALL.equals(chain.getArg(0))) return chain.proceed();
                        boolean ready = false;
                        try {
                            Context context = ((ContentProvider) chain.getThisObject()).getContext();
                            ready = installed && context != null
                                    && FeatureSettings.enabled(context, GameOptions.QUICK_SWITCH, false)
                                    && FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER);
                        } catch (Throwable error) {
                            trace("ERROR", "stage=MACRO_CAPABILITIES route=exact_selected status=UNAVAILABLE"
                                    + " errorClass=" + error.getClass().getSimpleName());
                        }
                        Bundle result = new Bundle();
                        result.putBoolean("ok", true);
                        result.putBoolean("ready", ready);
                        result.putInt("versionCode", BuildConfig.VERSION_CODE);
                        return result;
                    }));
            installed = true;
            trace("INFO", "stage=MACRO_RESOLVER_REGISTERED route=exact_selected status=READY");
            return 2;
        } catch (Throwable error) {
            trace("ERROR", "stage=INSTALL_FAILED route=macro_selected errorClass=" + error.getClass().getSimpleName());
            module.logFeatureError("SHOULDER_MACRO_SWITCH_INSTALL", error);
            return 0;
        }
    }

    private static Field textField(Class<?> owner, String name) throws NoSuchFieldException {
        Field field = owner.getDeclaredField(name);
        if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) {
            throw new NoSuchFieldException("GameHelper bean " + name);
        }
        field.setAccessible(true);
        return field;
    }

    private static Selection selected(Context context, String pkg, String key) throws ResolveFailure {
        String prefix = "137".equals(key) ? "left" : "138".equals(key) ? "right" : "middle";
        String[] projection = {"_id", "state", "package_name", "main_sw", prefix + "_sw", prefix + "_option"};
        Selection selected = null;
        for (int table = 0; table < TABLES.length; table++) {
            Uri uri = Uri.parse("content://" + AUTHORITY + "/" + TABLES[table]);
            try (Cursor cursor = context.getContentResolver().query(uri, projection,
                    "package_name=? AND (state & 1) != 0", new String[]{pkg}, "_id ASC")) {
                if (cursor == null) throw new ResolveFailure("selection_query_unavailable");
                int idColumn = cursor.getColumnIndexOrThrow("_id");
                int stateColumn = cursor.getColumnIndexOrThrow("state");
                int packageColumn = cursor.getColumnIndexOrThrow("package_name");
                int mainColumn = cursor.getColumnIndexOrThrow("main_sw");
                int enabledColumn = cursor.getColumnIndexOrThrow(prefix + "_sw");
                int modeColumn = cursor.getColumnIndexOrThrow(prefix + "_option");
                while (cursor.moveToNext()) {
                    if (selected != null) throw new ResolveFailure("ambiguous_selection");
                    if (cursor.isNull(idColumn) || cursor.isNull(stateColumn) || cursor.isNull(mainColumn)
                            || cursor.isNull(enabledColumn) || cursor.isNull(modeColumn)) {
                        throw new ResolveFailure("invalid_selection");
                    }
                    long id = cursor.getLong(idColumn);
                    int state = cursor.getInt(stateColumn);
                    // Match TgkData.getTableId, including import's override bit.
                    int stateTable = (state & 8) != 0 ? 1 : (state & 4) != 0 ? 0 : 1;
                    if (id <= 0 || (state & 1) == 0 || table != stateTable
                            || !pkg.equals(cursor.getString(packageColumn))) {
                        throw new ResolveFailure("invalid_selection");
                    }
                    selected = new Selection(table, id, state, cursor.getInt(mainColumn) == 1,
                            cursor.getInt(enabledColumn) == 1, cursor.getInt(modeColumn));
                }
            }
        }
        if (selected == null) throw new ResolveFailure("selection_missing");
        return selected;
    }

    private static void trace(String level, String message) {
        try { HookTelemetry.shoulderSwitch(level, message); }
        catch (Throwable ignored) { /* Diagnostics never replace the resolver result. */ }
    }

    private static final class Selection {
        final int table, state, mode;
        final long id;
        final boolean main, enabled;
        Selection(int table, long id, int state, boolean main, boolean enabled, int mode) {
            this.table = table; this.id = id; this.state = state;
            this.main = main; this.enabled = enabled; this.mode = mode;
        }
        boolean same(Selection other) {
            return other != null && table == other.table && id == other.id && state == other.state
                    && main == other.main && enabled == other.enabled && mode == other.mode;
        }
    }

    private static final class ResolveFailure extends Exception {
        final String code;
        ResolveFailure(String code) { this.code = code; }
    }
}
