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
        // Observers may run on the first setting change; establish ownership
        // before level/active, after all recovery records have been persisted.
        updates.put(new Address(user, "secure", "ls_augment_extra_dim_owned"), "1");
        updates.put(new Address(user, "secure", ExtraDimControl.LEVEL), String.valueOf(strength));
        updates.put(new Address(user, "secure", ExtraDimControl.ACTIVE), active ? "1" : "0");
        return engine(context).put(updates);
    }

    static synchronized RestoreResult restore(Context context) { return engine(context).restore(); }

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
        boolean dim() { return namespace.equals("secure") && !key.equals("ls_augment_extra_dim_owned"); }
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
                Read legacy = includesDim ? io.read(new Address(ownerUser, "secure", "ls_augment_extra_dim_owned")) : new Read(true, null);
                if (!legacy.success) return new WriteResult(false, "无法读取系统设置归属，未修改");
                for (Map.Entry<Address, String> entry : updates.entrySet()) {
                    Address address = entry.getKey();
                    if (address.user != ownerUser || entry.getValue() == null || !validRequested(address, entry.getValue()))
                        return new WriteResult(false, "系统设置参数无效，未修改");
                    Read before = io.read(address);
                    if (!before.success) return new WriteResult(false, "无法读取原系统设置，未修改");
                    Record old = records.containsKey(address.id()) ? Record.parse(records.get(address.id())) : null;
                    // The old owned marker proves a prior module edit, but does not reveal its original value.
                    boolean known = old != null ? old.originalKnown : !(address.dim() && "1".equals(legacy.value));
                    String original = old != null ? old.original : address.key.equals("ls_augment_extra_dim_owned") ? null : before.value;
                    String previous = old != null && (Objects.equals(before.value, old.intended) || Objects.equals(before.value, old.previous))
                            ? before.value : original;
                    records.put(address.id(), new Record(address, known, original, previous, entry.getValue()).encode());
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

        RestoreResult restore() {
            int restored = 0; boolean failed = false, review = false, legacyHistoryUnknown = false;
            ArrayList<String> issues = new ArrayList<>();
            try {
                Map<String, String> records = validatedRecords();
                ArrayList<String> order=new ArrayList<>(records.keySet());
                // Retain compatibility ownership until both original native
                // dim settings are restored, independent of preference order.
                order.sort(java.util.Comparator.comparing(id -> Record.parse(records.get(id)).address.key.equals("ls_augment_extra_dim_owned")));
                for (String id : order) {
                    Record record = Record.parse(records.get(id));
                    if(record.address.key.equals("ls_augment_extra_dim_owned")
                            && records.values().stream().map(Record::parse).anyMatch(r -> r.address.dim())) {
                        review=true;issues.add("极暗原设置尚未恢复，归属标记已保留");continue;
                    }
                    if (!record.originalKnown) { review = true; issues.add("旧版极暗设置缺少修改前的记录"); continue; }
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
                    String previous = records.remove(id);
                    if (!store.commit(records)) {
                        records.put(id, previous); failed = true; issues.add("恢复记录清理未完成");
                    }
                }
                Read legacy = io.read(new Address(ownerUser, "secure", "ls_augment_extra_dim_owned"));
                if (!legacy.success) { failed = true; issues.add("无法核验旧极暗设置"); }
                else if ("1".equals(legacy.value)) {
                    Address active=new Address(ownerUser,"secure","reduce_bright_colors_activated");
                    Read current=io.read(active);
                    boolean pendingDim=records.values().stream().map(Record::parse).anyMatch(r -> r.address.dim());
                    // An inactive native feature needs no guessed native value. Retire only our
                    // stale marker; preserve the strength and explicitly report the missing history.
                    if(!pendingDim&&current.success&&"0".equals(current.value)) {
                        Address marker=new Address(ownerUser,"secure","ls_augment_extra_dim_owned");
                        Read freshMarker=io.read(marker),freshActive=io.read(active);
                        if(!freshMarker.success||!"1".equals(freshMarker.value)||!freshActive.success||!"0".equals(freshActive.value)
                                ||!io.write(marker,null)) { failed=true;issues.add("旧极暗标记未能清理"); }
                        else {
                            Read afterMarker=io.read(marker),afterActive=io.read(active);
                            if(!afterMarker.success||afterMarker.value!=null||!afterActive.success||!"0".equals(afterActive.value)) {
                                failed=true;issues.add("旧极暗标记清理未通过核验");
                            } else legacyHistoryUnknown=true;
                        }
                    } else { review=true;issues.add("旧版极暗设置缺少修改前的记录"); }
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
