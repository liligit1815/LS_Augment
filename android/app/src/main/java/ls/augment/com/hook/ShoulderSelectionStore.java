package ls.augment.com.hook;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Process;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Locale;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;

/** Selects one existing OEM scheme without rewriting its mappings or content. */
final class ShoulderSelectionStore {
    static final String CALL = "ls_augment_shoulder_select";
    static final String RELEASE_CALL = "ls_augment_shoulder_release";
    static final String AUTHORITY = "cn.nubia.tgk.data.TgkDataProvider";
    static final Uri URI = Uri.parse("content://" + AUTHORITY);
    private static final String[] TABLES = {"preset_case_table", "import_case_table"};
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+");
    private static boolean installed;
    private static final int MAX_LEASES = 128;
    private static final int MAX_RETIRED = 256;
    // Provider-process witnesses only. Explicit edit/lifecycle release removes the
    // protection; delayed OEM writes may still persist every non-selection field.
    private static final Map<String, Lease> LEASES = new LinkedHashMap<>();
    private static final Map<String, Boolean> RETIRED = new LinkedHashMap<>();

    private ShoulderSelectionStore() { }

    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 0;
        try {
            Class<?> provider = Class.forName(AUTHORITY, false, loader);
            if (!ContentProvider.class.isAssignableFrom(provider)) {
                throw new NoSuchMethodException("TGK provider type");
            }
            Method call = provider.getDeclaredMethod("call", String.class, String.class, Bundle.class);
            if (call.getReturnType() != Bundle.class || Modifier.isStatic(call.getModifiers())) {
                throw new NoSuchMethodException("TGK provider call contract");
            }
            Method update = provider.getDeclaredMethod("update", Uri.class, ContentValues.class,
                    String.class, String[].class);
            if (update.getReturnType() != int.class || Modifier.isStatic(update.getModifiers())) {
                throw new NoSuchMethodException("TGK provider update contract");
            }
            Field helper = provider.getDeclaredField("mSqliteHelper");
            if (!SQLiteOpenHelper.class.isAssignableFrom(helper.getType())
                    || Modifier.isStatic(helper.getModifiers())) {
                throw new NoSuchFieldException("TGK helper contract");
            }
            requireText(provider, "AUTHORITY", AUTHORITY);
            Class<?> entry = Class.forName("cn.nubia.tgk.data.TgkDataContract$TgkEntry", false, loader);
            requireText(entry, "PRESET_CASE_TABLE_NAME", TABLES[0]);
            requireText(entry, "IMPORT_CASE_TABLE_NAME", TABLES[1]);
            requireText(entry, "_ID", "_id");
            requireText(entry, "TGK_CASE_STATE", "state");
            requireText(entry, "TGK_PACKAGE_NAME", "package_name");
            call.setAccessible(true);
            update.setAccessible(true);
            helper.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(call,
                    "shoulder.selection_store", true).intercept(chain -> {
                if (RELEASE_CALL.equals(chain.getArg(0))) {
                    return release(chain.getThisObject(), helper, (Bundle) chain.getArg(2));
                }
                if (!CALL.equals(chain.getArg(0))) return chain.proceed();
                return select(chain.getThisObject(), helper, (Bundle) chain.getArg(2));
            }));
            module.registerFeatureHook(module.prepareFeatureHook(update,
                    "shoulder.selection_guard", true).intercept(chain -> {
                synchronized (ShoulderSelectionStore.class) {
                    Uri uri = (Uri) chain.getArg(0);
                    ContentValues original = (ContentValues) chain.getArg(1);
                    String where = (String) chain.getArg(2);
                    String[] args = (String[]) chain.getArg(3);
                    ContentValues guarded = guardedValues(chain.getThisObject(), helper,
                            uri, original, where, args);
                    // The original operation remains outside diagnostic/query catches.
                    // It is called once and its result or exception is unchanged.
                    return guarded == original ? chain.proceed()
                            : chain.proceed(new Object[]{uri, guarded, where, args});
                }
            }));
            installed = true;
            trace("INFO", "stage=STORE_REGISTERED route=selection_store");
            return 2;
        } catch (Throwable error) {
            trace("ERROR", "stage=INSTALL_FAILED route=selection_store errorClass="
                    + error.getClass().getSimpleName());
            module.logFeatureError("SHOULDER_SELECTION_STORE_INSTALL_FAILED", error);
            return 0;
        }
    }

    private static void requireText(Class<?> owner, String name, String expected)
            throws ReflectiveOperationException {
        Field field = owner.getDeclaredField(name);
        if (field.getType() != String.class || !Modifier.isStatic(field.getModifiers())) {
            throw new NoSuchFieldException(owner.getName() + "." + name);
        }
        field.setAccessible(true);
        if (!expected.equals(field.get(null))) throw new NoSuchFieldException("TGK " + name + " value");
    }

    private static synchronized Bundle select(Object provider, Field helperField, Bundle extras) {
        // Neither shell/root nor another app may select schemes through this private route.
        if (Binder.getCallingUid() != Process.myUid()) return failure("caller_uid");
        String gamePackage;
        int tableId;
        long caseId;
        String leaseTag;
        String expectedLeaseTag;
        try {
            if (extras == null || !(extras.get("gamePackage") instanceof String)
                    || !(extras.get("tableId") instanceof Integer)
                    || !(extras.get("caseId") instanceof Long)) return failure("invalid_request");
            gamePackage = extras.getString("gamePackage");
            tableId = extras.getInt("tableId", -1);
            caseId = extras.getLong("caseId", -1L);
            leaseTag = leaseTag(extras);
            expectedLeaseTag = tag(extras, "expectedLeaseTag");
            if (gamePackage == null || gamePackage.length() > 255
                    || !PACKAGE.matcher(gamePackage).matches()
                    || tableId < 0 || tableId > 1 || caseId <= 0 || leaseTag == null || expectedLeaseTag == null) {
                return failure("invalid_request");
            }
        } catch (RuntimeException error) {
            return failure("invalid_request");
        }
        Lease currentLease = LEASES.get(gamePackage);
        if ((!leaseTag.isEmpty() && RETIRED.containsKey(retiredKey(gamePackage, leaseTag)))
                || (!expectedLeaseTag.isEmpty()
                    && (currentLease == null || !expectedLeaseTag.equals(currentLease.tag)))) {
            trace("WARN", "stage=STORE_REJECT route=selection_store pkg=" + gamePackage + " reason=stale_lease");
            return failure("stale_lease");
        }
        SQLiteDatabase database = null;
        boolean transaction = false;
        Bundle result;
        try {
            Object helper = helperField.get(provider);
            if (!(helper instanceof SQLiteOpenHelper)) throw new StoreFailure("helper_unavailable");
            database = ((SQLiteOpenHelper) helper).getWritableDatabase();
            if (database == null) throw new StoreFailure("database_unavailable");
            database.beginTransaction();
            transaction = true;
            for (String table : TABLES) requireSchema(database, table);

            String targetTable = TABLES[tableId];
            int targetState;
            try (Cursor cursor = database.rawQuery("SELECT state, package_name FROM " + targetTable
                    + " WHERE _id=?", new String[]{Long.toString(caseId)})) {
                if (cursor == null || !cursor.moveToFirst()) throw new StoreFailure("case_missing");
                if (!gamePackage.equals(cursor.getString(1))) throw new StoreFailure("package_mismatch");
                if (cursor.isNull(0)) throw new StoreFailure("invalid_state");
                targetState = cursor.getInt(0);
                if (cursor.moveToNext()) throw new StoreFailure("duplicate_case");
            }
            int selectedBefore = 0;
            for (String table : TABLES) {
                try (Cursor cursor = database.rawQuery("SELECT count(*) FROM " + table
                        + " WHERE package_name=? AND (state & 1) != 0", new String[]{gamePackage})) {
                    if (cursor == null || !cursor.moveToFirst()) throw new StoreFailure("selection_read");
                    selectedBefore += cursor.getInt(0);
                }
            }
            // A single writer transaction spans both tables. Other state bits and all
            // coordinate/action/content columns retain their OEM values.
            for (String table : TABLES) {
                database.execSQL("UPDATE " + table + " SET state=(state & ~1)"
                        + " WHERE package_name=? AND (state & 1) != 0", new Object[]{gamePackage});
            }
            database.execSQL("UPDATE " + targetTable + " SET state=(state | 1)"
                    + " WHERE _id=? AND package_name=?", new Object[]{caseId, gamePackage});
            try (Cursor cursor = database.rawQuery("SELECT changes()", null)) {
                if (cursor == null || !cursor.moveToFirst() || cursor.getInt(0) != 1) {
                    throw new StoreFailure("target_write");
                }
            }
            int selectedAfter = 0;
            for (String table : TABLES) {
                try (Cursor cursor = database.rawQuery("SELECT count(*) FROM " + table
                        + " WHERE package_name=? AND (state & 1) != 0", new String[]{gamePackage})) {
                    if (cursor == null || !cursor.moveToFirst()) throw new StoreFailure("selection_read");
                    selectedAfter += cursor.getInt(0);
                }
            }
            if (selectedAfter != 1) throw new StoreFailure("selection_write");
            try (Cursor cursor = database.rawQuery("SELECT state FROM " + targetTable
                    + " WHERE _id=? AND package_name=?", new String[]{Long.toString(caseId), gamePackage})) {
                if (cursor == null || !cursor.moveToFirst() || cursor.isNull(0)
                        || cursor.getInt(0) != (targetState | 1)) throw new StoreFailure("target_write");
            }
            database.setTransactionSuccessful();
            result = new Bundle();
            result.putBoolean("ok", true);
            result.putInt("tableId", tableId);
            result.putLong("caseId", caseId);
            result.putBoolean("changed", selectedBefore != 1 || (targetState & 1) == 0);
            result.putInt("selectedBefore", selectedBefore);
            result.putInt("state", targetState | 1);
        } catch (StoreFailure error) {
            result = failure(error.code);
        } catch (Throwable error) {
            trace("ERROR", "stage=STORE_FAILED route=selection_store errorClass=" + error.getClass().getSimpleName());
            result = failure("database_error");
        } finally {
            if (transaction) {
                try {
                    database.endTransaction();
                } catch (Throwable error) {
                    trace("ERROR", "stage=STORE_FAILED route=selection_store reason=commit errorClass="
                            + error.getClass().getSimpleName());
                    result = failure("commit_failed");
                }
            }
        }
        if (result.getBoolean("ok", false)) remember(gamePackage, new Lease(tableId, caseId, leaseTag));
        trace(result.getBoolean("ok", false) ? "INFO" : "ERROR",
                "stage=STORE_RESULT route=selection_store pkg=" + gamePackage + " table=" + tableId + " caseId=" + caseId
                        + " status=" + (result.getBoolean("ok", false) ? "COMMITTED" : "FAILED")
                        + " reason=" + result.getString("error", "none"));
        return result;
    }

    private static String leaseTag(Bundle extras) {
        return tag(extras, "leaseTag");
    }

    private static String tag(Bundle extras, String key) {
        if (!extras.containsKey(key)) return "";
        Object value = extras.get(key);
        if (!(value instanceof String)) return null;
        String tag = (String) value;
        return tag.matches("[A-Za-z0-9_.:-]{0,160}") ? tag : null;
    }

    private static synchronized Bundle release(Object provider, Field helperField, Bundle extras) {
        if (Binder.getCallingUid() != Process.myUid()) return failure("caller_uid");
        try {
            String pkg = extras == null ? null : extras.getString("gamePackage");
            String tag = extras == null ? null : leaseTag(extras);
            if (pkg == null || pkg.length() > 255 || !PACKAGE.matcher(pkg).matches() || tag == null) {
                return failure("invalid_request");
            }
            Lease lease = LEASES.get(pkg);
            boolean released = lease != null && lease.tag.equals(tag);
            boolean rollback = extras.containsKey("rollbackTableId") || extras.containsKey("rollbackCaseId");
            int rollbackTable = -1;
            long rollbackCase = -1L;
            if (rollback) {
                if (!(extras.get("rollbackTableId") instanceof Integer)
                        || !(extras.get("rollbackCaseId") instanceof Long)) return failure("invalid_request");
                rollbackTable = extras.getInt("rollbackTableId", -1);
                rollbackCase = extras.getLong("rollbackCaseId", -1L);
                if (rollbackTable < 0 || rollbackTable > 1 || rollbackCase <= 0) return failure("invalid_request");
            }
            boolean restored = false;
            if (released && rollback) {
                // Restore and retire are one provider-side critical section. A late
                // select cannot commit between a cancellation's compare and release.
                Bundle restore = new Bundle();
                restore.putString("gamePackage", pkg);
                restore.putInt("tableId", rollbackTable);
                restore.putLong("caseId", rollbackCase);
                restore.putString("leaseTag", tag);
                restore.putString("expectedLeaseTag", tag);
                Bundle selected = select(provider, helperField, restore);
                if (!selected.getBoolean("ok", false)) {
                    // Keep the lease live when the transaction failed; cancellation
                    // must not claim that the previous mapping was persisted.
                    return selected;
                }
                restored = true;
            }
            if (released) LEASES.remove(pkg);
            retire(pkg, tag);
            Bundle result = new Bundle();
            result.putBoolean("ok", true);
            result.putBoolean("released", released);
            result.putBoolean("restored", restored);
            if (restored) {
                result.putInt("tableId", rollbackTable);
                result.putLong("caseId", rollbackCase);
            }
            trace("INFO", "stage=STORE_RELEASE route=selection_store pkg=" + pkg
                    + " status=" + (restored ? "PREVIOUS_RESTORED" : released ? "RELEASED" : "UNCHANGED"));
            return result;
        } catch (RuntimeException error) {
            return failure("invalid_request");
        }
    }

    private static void remember(String pkg, Lease lease) {
        Lease previous = LEASES.remove(pkg);
        if (previous != null && !previous.tag.equals(lease.tag)) retire(pkg, previous.tag);
        if (LEASES.size() >= MAX_LEASES) {
            String oldest = LEASES.keySet().iterator().next();
            forget(oldest);
            trace("WARN", "stage=STORE_LEASE route=selection_store pkg=" + oldest
                    + " status=RELEASED reason=capacity");
        }
        LEASES.put(pkg, lease);
    }

    private static String retiredKey(String pkg, String tag) { return pkg + "\n" + tag; }

    private static void retire(String pkg, String tag) {
        // Empty tags are the legacy compatibility route, not cancellable tickets.
        if (tag.isEmpty()) return;
        String key = retiredKey(pkg, tag);
        RETIRED.remove(key);
        if (RETIRED.size() >= MAX_RETIRED) RETIRED.remove(RETIRED.keySet().iterator().next());
        RETIRED.put(key, Boolean.TRUE);
    }

    private static void forget(String pkg) {
        Lease lease = LEASES.remove(pkg);
        if (lease != null) retire(pkg, lease.tag);
    }

    private static void clearLeases() {
        for (Map.Entry<String, Lease> entry : LEASES.entrySet()) retire(entry.getKey(), entry.getValue().tag);
        LEASES.clear();
    }

    private static ContentValues guardedValues(Object provider, Field helperField, Uri uri,
            ContentValues values, String where, String[] args) {
        if (LEASES.isEmpty()) return values;
        try {
            if (!FeatureSettings.enabled(((ContentProvider) provider).getContext(),
                    ls.augment.com.GameOptions.QUICK_SWITCH, false)
                    || !FeatureSettings.enabled(((ContentProvider) provider).getContext(),
                        FeatureSettings.GAME_MASTER)) {
                clearLeases();
                trace("INFO", "stage=STORE_LEASE route=selection_store status=RELEASED reason=feature_off");
                return values;
            }
            int tableId = -1;
            if (uri != null && AUTHORITY.equals(uri.getAuthority())) {
                for (int i = 0; i < TABLES.length; i++) {
                    if (("/" + TABLES[i]).equals(uri.getPath())) tableId = i;
                }
            }
            if (tableId < 0 || values == null) return values;
            if (where == null || !where.trim().matches("_id\\s*=\\s*\\?")
                    || args == null || args.length != 1) {
                clearLeases();
                trace("WARN", "stage=STORE_LEASE route=selection_store status=RELEASED reason=update_shape");
                return values;
            }
            long caseId = Long.parseLong(args[0]);
            if (caseId <= 0) return values;
            Object helper = helperField.get(provider);
            if (!(helper instanceof SQLiteOpenHelper)) throw new StoreFailure("helper_unavailable");
            SQLiteDatabase database = ((SQLiteOpenHelper) helper).getWritableDatabase();
            requireSchema(database, TABLES[tableId]);
            String pkg;
            try (Cursor cursor = database.rawQuery("SELECT package_name FROM " + TABLES[tableId]
                    + " WHERE _id=?", new String[]{Long.toString(caseId)})) {
                if (cursor == null || !cursor.moveToFirst()) return values;
                pkg = cursor.getString(0);
            }
            Lease lease = LEASES.get(pkg);
            if (lease == null) return values;
            if (Binder.getCallingUid() != Process.myUid()
                    || (values.containsKey("package_name") && !pkg.equals(values.getAsString("package_name")))
                    || (values.containsKey("_id") && !Long.valueOf(caseId).equals(values.getAsLong("_id")))) {
                forget(pkg);
                trace("INFO", "stage=STORE_LEASE route=selection_store pkg=" + pkg
                        + " status=RELEASED reason=external_edit");
                return values;
            }
            if (!values.containsKey("state")) return values;
            Integer state = values.getAsInteger("state");
            if (state == null) {
                forget(pkg);
                return values;
            }
            int selected = lease.tableId == tableId && lease.caseId == caseId ? state | 1 : state & ~1;
            if (selected == state) return values;
            ContentValues guarded = new ContentValues(values);
            guarded.put("state", selected);
            trace("INFO", "stage=STORE_GUARD route=selection_store pkg=" + pkg + " table=" + tableId
                    + " caseId=" + caseId + " status=NORMALIZED");
            return guarded;
        } catch (Throwable error) {
            // Unknown schema/identity is an OEM edit, never a synthetic write.
            clearLeases();
            trace("WARN", "stage=STORE_LEASE route=selection_store status=RELEASED reason=guard_unavailable"
                    + " errorClass=" + error.getClass().getSimpleName());
            return values;
        }
    }

    private static void trace(String level, String message) {
        try { HookTelemetry.shoulderSwitch(level, message); }
        catch (Throwable ignored) { /* Diagnostics must not change a committed result or failure. */ }
    }

    private static void requireSchema(SQLiteDatabase database, String table) throws StoreFailure {
        boolean id = false, state = false, packageName = false;
        try (Cursor cursor = database.rawQuery("PRAGMA table_info(" + table + ")", null)) {
            if (cursor == null) throw new StoreFailure("schema_unavailable");
            int nameColumn = cursor.getColumnIndex("name");
            int typeColumn = cursor.getColumnIndex("type");
            int primaryColumn = cursor.getColumnIndex("pk");
            if (nameColumn < 0 || typeColumn < 0 || primaryColumn < 0) {
                throw new StoreFailure("schema_unavailable");
            }
            while (cursor.moveToNext()) {
                String name = cursor.getString(nameColumn);
                String type = cursor.getString(typeColumn);
                type = type == null ? "" : type.toUpperCase(Locale.ROOT);
                if ("_id".equals(name)) id = "INTEGER".equals(type) && cursor.getInt(primaryColumn) == 1;
                else if ("state".equals(name)) state = "INTEGER".equals(type);
                else if ("package_name".equals(name)) packageName = "TEXT".equals(type);
            }
        }
        if (!id || !state || !packageName) throw new StoreFailure("schema_unavailable");
    }

    private static Bundle failure(String code) {
        Bundle result = new Bundle();
        result.putBoolean("ok", false);
        result.putString("error", code);
        return result;
    }

    private static final class StoreFailure extends Exception {
        final String code;
        StoreFailure(String code) { this.code = code; }
    }

    private static final class Lease {
        final int tableId;
        final long caseId;
        final String tag;
        Lease(int tableId, long caseId, String tag) {
            this.tableId = tableId;
            this.caseId = caseId;
            this.tag = tag;
        }
    }
}
