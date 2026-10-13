package ls.augment.com;

import android.content.Context;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/** First-write recovery records for the exact platform settings edited by the module. */
final class ModuleSystemSettings {
    static final String PREFS = "module-system-settings-v1";
    private static DurablePreferences durable;
    private static boolean extraDimMigrated;
    private static final String EXTRA_DIM_OWNED = "ls_augment_extra_dim_owned";
    static final String EXTRA_DIM_URI = "content://ls.augment.com.config/extra-dim-ownership";
    private ModuleSystemSettings() { }

    static synchronized WriteResult put(Context context, String namespace, String key, String value) {
        if (ResetWriteFence.blocked()) return new WriteResult(false, "正在重置，请稍后重试");
        int user = android.os.Process.myUid() / 100000;
        LinkedHashMap<Address, String> updates = new LinkedHashMap<>();
        updates.put(new Address(user, namespace, key), value);
        return engine(context).put(updates);
    }

    static synchronized WriteResult setExtraDim(Context context, boolean active, int strength) {
        if (ResetWriteFence.blocked()) return new WriteResult(false, "正在重置，请稍后重试");
        if (strength < 0 || strength > 100) return new WriteResult(false, "极暗强度无效");
        int user = android.os.Process.myUid() / 100000;
        LinkedHashMap<Address, String> updates = new LinkedHashMap<>();
        WriteResult migration = migrateExtraDimOwnership(context);
        if (!migration.success) return migration;
        updates.put(new Address(user, "secure", ExtraDimControl.LEVEL), String.valueOf(strength));
        updates.put(new Address(user, "secure", ExtraDimControl.ACTIVE), active ? "1" : "0");
        WriteResult result = engine(context).put(updates);
        notifyExtraDim(context);
        return result;
    }

    static synchronized WriteResult migrateExtraDimOwnership(Context context) {
        if (ResetWriteFence.blocked()) return new WriteResult(false, "正在重置，请稍后重试");
        if (extraDimMigrated) return new WriteResult(true, "");
        WriteResult result = engine(context).migrateExtraDimOwnership();
        if (result.success) { extraDimMigrated = true; notifyExtraDim(context); }
        return result;
    }

    /** Authenticated system-server reads run on its background bridge worker. */
    static synchronized android.os.Bundle extraDimOwnership(Context context) {
        android.os.Bundle result = new android.os.Bundle();
        // A system-server cache read must never initiate a new Root authorization.
        // Upgrade migration runs through the app's authorized migration worker.
        try {
            result.putBoolean("owned", engine(context).extraDimOwned());
            result.putInt("user", android.os.Process.myUid() / 100000);
            result.putBoolean("ok", true);
        } catch (RuntimeException invalid) { }
        return result;
    }

    static synchronized RestoreResult restore(Context context) {
        WriteResult migration = migrateExtraDimOwnership(context);
        if (!migration.success) return new RestoreResult(false, false, 0, migration.message);
        RestoreResult result = engine(context).restore();
        notifyExtraDim(context);
        return result;
    }

    private static void notifyExtraDim(Context context) {
        try { context.getContentResolver().notifyChange(android.net.Uri.parse(EXTRA_DIM_URI), null); }
        catch (RuntimeException ignored) { }
    }

    private static Engine engine(Context context) {
        if (durable == null) durable = new DurablePreferences(context.getApplicationContext().getSharedPreferences(PREFS, 0));
        Store store = new Store() {
            public Map<String, String> load() {
                LinkedHashMap<String, String> values = new LinkedHashMap<>();
                for (Map.Entry<String, ?> entry : durable.getAll().entrySet()) {
                    if (!(entry.getValue() instanceof String)) throw new IllegalStateException("invalid recovery record");
                    values.put(entry.getKey(), (String) entry.getValue());
                }
                return values;
            }
            public boolean commit(Map<String, String> values) {
                DurablePreferences.Editor editor = durable.edit();
                for (String key : durable.getAll().keySet()) editor.remove(key);
                for (Map.Entry<String, String> entry : values.entrySet()) editor.putString(entry.getKey(), entry.getValue());
                return editor.commit();
            }
        };
        return new Engine(store, new RootIo(), android.os.Process.myUid() / 100000);
    }

    static final class Address {
        final int user;
        final String namespace, key;
        Address(int user, String namespace, String key) {
            if (user < 0 || user > 99999 || !allowed(namespace, key)) throw new IllegalArgumentException("unsupported setting");
            this.user = user; this.namespace = namespace; this.key = key;
        }
        String id() { return user + ":" + namespace + ":" + key; }
        boolean metadata() { return namespace.equals("secure") && key.equals(EXTRA_DIM_OWNED); }
        boolean dim() { return namespace.equals("secure") && !metadata(); }
        @Override public boolean equals(Object other) { return other instanceof Address && id().equals(((Address) other).id()); }
        @Override public int hashCode() { return id().hashCode(); }
    }

    private static boolean allowed(String namespace, String key) {
        return "global".equals(namespace) && ("development_settings_enabled".equals(key) || "adb_enabled".equals(key))
                || "system".equals(namespace) && ("adb_install_enabled".equals(key) || "lock_refresh_rate".equals(key))
                || "secure".equals(namespace) && ("reduce_bright_colors_activated".equals(key)
                    || "reduce_bright_colors_level".equals(key) || "ls_augment_extra_dim_owned".equals(key));
    }

    interface Store { Map<String, String> load(); boolean commit(Map<String, String> values); }
    interface Io { Read read(Address address); boolean write(Address address, String value); }
    static final class Read {
        final boolean success;
        final String value;
        Read(boolean success, String value) { this.success = success; this.value = value; }
    }
    static final class Record {
        final Address address;
        final boolean originalKnown;
        final String original, previous, intended;
        Record(Address address, boolean originalKnown, String original, String previous, String intended) {
            this.address = address; this.originalKnown = originalKnown; this.original = original;
            this.previous = previous; this.intended = intended;
        }
        String encode() { return "MSS1|" + address.user + "|" + address.namespace + "|" + address.key + "|"
                + (originalKnown ? "1" : "0") + "|" + encodeValue(original) + "|" + encodeValue(previous) + "|" + encodeValue(intended); }
        static Record parse(String text) {
            if (text == null || text.length() > 16384) throw new IllegalArgumentException("invalid recovery record");
            String[] fields = text.split("\\|", -1);
            if (fields.length != 8 || !fields[0].equals("MSS1") || !fields[4].matches("[01]"))
                throw new IllegalArgumentException("invalid recovery record");
            Record record = new Record(new Address(Integer.parseInt(fields[1]), fields[2], fields[3]),
                    fields[4].equals("1"), decodeValue(fields[5]), decodeValue(fields[6]), decodeValue(fields[7]));
            if (!record.encode().equals(text)) throw new IllegalArgumentException("invalid recovery record");
            return record;
        }
        private static String encodeValue(String value) {
            return value == null ? "~" : Base64.getEncoder().encodeToString(value.getBytes(StandardCharsets.UTF_8));
        }
        private static String decodeValue(String value) {
            return value.equals("~") ? null : new String(Base64.getDecoder().decode(value), StandardCharsets.UTF_8);
        }
    }

    /** Testable recovery transaction; no platform mutation is made before its intent is durable. */
    static final class Engine {
        final Store store; final Io io; final int ownerUser;
        Engine(Store store, Io io, int ownerUser) { this.store = store; this.io = io; this.ownerUser = ownerUser; }
        WriteResult put(Map<Address, String> updates) {
            try {
                Map<String, String> records = validatedRecords();
                boolean includesDim = updates.keySet().stream().anyMatch(Address::dim);
                if (updates.keySet().stream().anyMatch(Address::metadata))
                    return new WriteResult(false, "模块归属仅允许保存到应用私有存储");
                for (Map.Entry<Address, String> entry : updates.entrySet()) {
                    Address address = entry.getKey();
                    if (address.user != ownerUser || entry.getValue() == null || !validRequested(address, entry.getValue()))
                        return new WriteResult(false, "系统设置参数无效，未修改");
                    Read before = io.read(address);
                    if (!before.success) return new WriteResult(false, "无法读取原系统设置，未修改");
                    Record old = records.containsKey(address.id()) ? Record.parse(records.get(address.id())) : null;
                    boolean known = old == null || old.originalKnown;
                    String original = old != null ? old.original : before.value;
                    String previous = old != null && (Objects.equals(before.value, old.intended) || Objects.equals(before.value, old.previous))
                            ? before.value : original;
                    records.put(address.id(), new Record(address, known, original, previous, entry.getValue()).encode());
                }
                // Private ownership and every recovery intent are one durable transaction.
                if (includesDim) {
                    Address marker = new Address(ownerUser, "secure", EXTRA_DIM_OWNED);
                    records.put(marker.id(), new Record(marker, true, null, null, "1").encode());
                }
                if (!store.commit(records)) return new WriteResult(false, "原系统设置未能保存，未修改");
                for (Map.Entry<Address, String> entry : updates.entrySet()) {
                    if (!io.write(entry.getKey(), entry.getValue())) return new WriteResult(false, "系统设置写入未完成，恢复记录已保留");
                    Read actual = io.read(entry.getKey());
                    if (!actual.success || !Objects.equals(actual.value, entry.getValue()))
                        return new WriteResult(false, "系统未接受此项设置，恢复记录已保留");
                }
                return new WriteResult(true, "已应用");
            } catch (RuntimeException invalid) { return new WriteResult(false, "系统设置恢复记录无法读取，未修改"); }
        }

        boolean extraDimOwned() {
            String raw = validatedRecords().get(new Address(ownerUser, "secure", EXTRA_DIM_OWNED).id());
            return raw != null && "1".equals(Record.parse(raw).intended);
        }

        /** Import before deleting: an upgrade never throws away ownership or invents a baseline. */
        WriteResult migrateExtraDimOwnership() {
            try {
                Map<String, String> records = validatedRecords();
                Address marker = new Address(ownerUser, "secure", EXTRA_DIM_OWNED);
                Read legacy = io.read(marker);
                if (!legacy.success) return new WriteResult(false, "无法读取旧极暗归属，原记录已保留");
                if (legacy.value == null) return new WriteResult(true, "");
                if (!records.containsKey(marker.id()))
                    records.put(marker.id(), new Record(marker, true, null, null, legacy.value).encode());
                if ("1".equals(legacy.value)) {
                    for (String key : new String[]{"reduce_bright_colors_level", "reduce_bright_colors_activated"}) {
                        Address nativeKey = new Address(ownerUser, "secure", key);
                        if (records.containsKey(nativeKey.id())) continue;
                        Read current = io.read(nativeKey);
                        if (!current.success) return new WriteResult(false, "无法读取旧极暗设置，原记录已保留");
                        records.put(nativeKey.id(), new Record(nativeKey, false, null, current.value, current.value).encode());
                    }
                }
                if (!store.commit(records)) return new WriteResult(false, "旧极暗归属未能保存，原记录已保留");
                Read beforeDelete = io.read(marker);
                if (!beforeDelete.success || !Objects.equals(beforeDelete.value, legacy.value)
                        || !io.write(marker, null)) return new WriteResult(false, "旧极暗归属清理未完成，私有记录已保留");
                Read after = io.read(marker);
                return new WriteResult(after.success && after.value == null,
                        after.success && after.value == null ? "" : "旧极暗归属清理未通过核验");
            } catch (RuntimeException invalid) { return new WriteResult(false, "极暗恢复记录无法读取，原记录已保留"); }
        }

        RestoreResult restore() {
            int restored = 0; boolean failed = false, review = false, legacyHistoryUnknown = false;
            ArrayList<String> issues = new ArrayList<>();
            try {
                WriteResult migration = migrateExtraDimOwnership();
                if (!migration.success) return new RestoreResult(false, false, 0, migration.message);
                Map<String, String> records = validatedRecords();
                ArrayList<String> order = new ArrayList<>(records.keySet());
                // Compatibility remains owned until both native values have been restored.
                order.sort(java.util.Comparator.comparing(id -> Record.parse(records.get(id)).address.metadata()));
                for (String id : order) {
                    Record record = Record.parse(records.get(id));
                    if (record.address.metadata()) {
                        if (records.values().stream().map(Record::parse).anyMatch(r -> r.address.dim())) {
                            review = true; issues.add("极暗原设置尚未恢复，私有归属已保留"); continue;
                        }
                    } else if (!record.originalKnown) {
                        Read current = io.read(new Address(ownerUser, "secure", "reduce_bright_colors_activated"));
                        if (!current.success) { failed = true; issues.add("无法读取旧极暗执行状态"); continue; }
                        if (!"0".equals(current.value)) {
                            review = true; issues.add("旧版极暗设置缺少修改前的记录"); continue;
                        }
                        // Already off: leave native strength/state intact, discard no user data,
                        // and explicitly acknowledge that the pre-module history is unknown.
                        legacyHistoryUnknown = true;
                    } else {
                        Read actual = io.read(record.address);
                        if (!actual.success) { failed = true; issues.add("无法读取 " + record.address.key); continue; }
                        if (!Objects.equals(actual.value, record.original)) {
                            if (!Objects.equals(actual.value, record.intended) && !Objects.equals(actual.value, record.previous)) {
                                review = true; issues.add(record.address.key + " 已被另行修改"); continue;
                            }
                            if (!io.write(record.address, record.original)) { failed = true; issues.add("未恢复 " + record.address.key); continue; }
                            Read after = io.read(record.address);
                            if (!after.success || !Objects.equals(after.value, record.original)) {
                                failed = true; issues.add("恢复校验未通过 " + record.address.key); continue;
                            }
                            restored++;
                        }
                    }
                    String previous = records.remove(id);
                    if (!store.commit(records)) {
                        records.put(id, previous); failed = true; issues.add("恢复记录清理未完成");
                    }
                }
            } catch (RuntimeException invalid) { failed = true; issues.add("系统设置恢复记录损坏，原记录已保留"); }
            String detail = String.join("；", new java.util.LinkedHashSet<>(issues));
            return new RestoreResult(!failed && !review, review, restored, legacyHistoryUnknown,
                    "已恢复 " + restored + " 项系统设置" + (detail.isEmpty() ? "。" : "；" + detail + "。"));
        }

        private Map<String, String> validatedRecords() {
            Map<String, String> records = new LinkedHashMap<>(store.load());
            for (Map.Entry<String, String> entry : records.entrySet()) {
                Record record = Record.parse(entry.getValue());
                if (!record.address.id().equals(entry.getKey()) || record.address.user != ownerUser)
                    throw new IllegalArgumentException("different setting owner");
            }
            return records;
        }
        private static boolean validRequested(Address address, String value) {
            if (address.key.equals("reduce_bright_colors_level")) {
                try { int level = Integer.parseInt(value); return level >= 0 && level <= 100 && String.valueOf(level).equals(value); }
                catch (NumberFormatException invalid) { return false; }
            }
            return value.equals("0") || value.equals("1");
        }
    }

    private static final class RootIo implements Io {
        public Read read(Address address) {
            // List distinguishes an absent key from a present value literally equal to "null".
            RootShell.Result result = RootShell.run("settings --user " + address.user + " list " + address.namespace, null, 5, 256 * 1024);
            if (!result.isSuccess() || result.capture == null || !result.capture.reliable()) return new Read(false, null);
            String value = null; boolean found = false;
            for (String line : result.capture.text().split("\\r?\\n")) if (line.startsWith(address.key + "=")) {
                if (found) return new Read(false, null);
                found = true; value = line.substring(address.key.length() + 1);
            }
            return new Read(true, value);
        }
        public boolean write(Address address, String value) {
            // Legacy module metadata is deletion-only; never re-create it in Settings.
            if (address.metadata() && value != null) return false;
            String command = "settings --user " + address.user + (value == null ? " delete " : " put ")
                    + address.namespace + " " + address.key + (value == null ? "" : " " + RootShell.quote(value));
            return RootShell.run(command, null, 5, 1024).isSuccess();
        }
    }
    static final class WriteResult {
        final boolean success; final String message;
        WriteResult(boolean success, String message) { this.success = success; this.message = message; }
    }
    static final class RestoreResult {
        final boolean success, reviewRequired, legacyDimHistoryUnknown; final int restoredCount; final String message;
        RestoreResult(boolean success, boolean reviewRequired, int restoredCount, String message) {
            this(success,reviewRequired,restoredCount,false,message);
        }
        RestoreResult(boolean success, boolean reviewRequired, int restoredCount, boolean legacyDimHistoryUnknown, String message) {
            this.success = success; this.reviewRequired = reviewRequired; this.restoredCount = restoredCount;
            this.legacyDimHistoryUnknown=legacyDimHistoryUnknown;this.message = message;
        }
    }
}
