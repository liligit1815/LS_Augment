package ls.augment.com;

import android.content.Context;
import android.util.AtomicFile;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Phone-private receiver preferences. Entries absent from a MIME query are retained. */
final class AtomicWorkbenchSharePreferences {
    private static final int MAGIC = 0x41575350, VERSION = 1, MAX_ENTRIES = 8192, MAX_BYTES = 2 * 1024 * 1024;
    private static final Object STORE_LOCK = new Object();

    static final class Result {
        final boolean success;
        final String message;
        Result(boolean success, String message) { this.success = success; this.message = message; }
    }

    static final class Setting {
        final AtomicWorkbenchShareTargetRepository.Target target;
        final boolean appVisible, targetVisible, appPinned, targetPinned, expanded;
        Setting(AtomicWorkbenchShareTargetRepository.Target target, Entry app, Entry item) {
            this.target = target;
            appVisible = app == null || app.visible; targetVisible = item == null || item.visible;
            appPinned = app != null && app.pinned; targetPinned = item != null && item.pinned;
            expanded = app == null || app.expanded;
        }
    }

    /** Narrow durable boundary also used by the failure/process-recreation tests. */
    interface Storage {
        byte[] read() throws IOException;
        void write(byte[] value) throws IOException;
    }

    private static final class Entry {
        String parent;
        boolean visible = true, pinned, expanded = true;
        long order;
        Entry(String parent, long order) { this.parent = parent; this.order = order; }
    }

    private static final class State {
        final LinkedHashMap<String, Entry> apps = new LinkedHashMap<>(), targets = new LinkedHashMap<>();
    }

    private final int userId;
    private final Storage storage;
    private String error = "";

    AtomicWorkbenchSharePreferences(Context context) {
        this(android.os.Process.myUid() / 100000, new FileStorage(new File(context.getFilesDir(),
                "atomic-workbench-share/user-" + (android.os.Process.myUid() / 100000) + ".bin")));
    }

    AtomicWorkbenchSharePreferences(int userId, Storage storage) {
        if (userId < 0 || storage == null) throw new IllegalArgumentException("invalid preference owner");
        this.userId = userId;
        this.storage = storage;
    }

    int userId() { return userId; }
    String status() { synchronized (STORE_LOCK) { read(); return error; } }

    String appKey(AtomicWorkbenchShareTargetRepository.Target target) {
        requireOwner(target);
        return userId + ":" + target.component.getPackageName();
    }

    List<AtomicWorkbenchShareTargetRepository.Target> visibleOrdered(List<AtomicWorkbenchShareTargetRepository.Target> source) {
        return ordered(source, true);
    }

    List<AtomicWorkbenchShareTargetRepository.Target> managedOrdered(List<AtomicWorkbenchShareTargetRepository.Target> source) {
        return ordered(source, false);
    }

    private List<AtomicWorkbenchShareTargetRepository.Target> ordered(List<AtomicWorkbenchShareTargetRepository.Target> source, boolean visibleOnly) {
        synchronized (STORE_LOCK) {
            State state = read();
            if (visibleOnly && !error.isEmpty()) return Collections.emptyList();
            return ordered(state, source, visibleOnly);
        }
    }

    List<Setting> settings(List<AtomicWorkbenchShareTargetRepository.Target> source) {
        synchronized (STORE_LOCK) {
            State state = read();
            ArrayList<Setting> result = new ArrayList<>();
            for (AtomicWorkbenchShareTargetRepository.Target target : ordered(state, source, false))
                result.add(new Setting(target, state.apps.get(appKey(target)), state.targets.get(target.key())));
            return Collections.unmodifiableList(result);
        }
    }

    private List<AtomicWorkbenchShareTargetRepository.Target> ordered(State state, List<AtomicWorkbenchShareTargetRepository.Target> source, boolean visibleOnly) {
            ArrayList<AtomicWorkbenchShareTargetRepository.Target> result = new ArrayList<>();
            Set<String> seen = new HashSet<>();
            if (source != null) for (AtomicWorkbenchShareTargetRepository.Target target : source) {
                if (!owned(target) || !seen.add(target.key())) continue;
                Entry app = state.apps.get(appKey(target)), item = state.targets.get(target.key());
                if (!visibleOnly || (app == null || app.visible) && (item == null || item.visible)) result.add(target);
            }
            // Preserve the repository's locale-aware order for equal, as-yet-unconfigured entries.
            result.sort((left, right) -> {
                String a = appKey(left), b = appKey(right);
                int app = compare(state.apps.get(a), state.apps.get(b));
                if (!a.equals(b)) {
                    if (app != 0) return app;
                    return indexOfApp(source, a) - indexOfApp(source, b);
                }
                return compare(state.targets.get(left.key()), state.targets.get(right.key()));
            });
            return Collections.unmodifiableList(result);
    }

    private int indexOfApp(List<AtomicWorkbenchShareTargetRepository.Target> source, String key) {
        for (int i = 0; i < source.size(); i++) if (owned(source.get(i)) && key.equals(appKey(source.get(i)))) return i;
        return Integer.MAX_VALUE;
    }

    private static int compare(Entry left, Entry right) {
        boolean lp = left != null && left.pinned, rp = right != null && right.pinned;
        if (lp != rp) return lp ? -1 : 1;
        return Long.compare(left == null ? Long.MAX_VALUE : left.order, right == null ? Long.MAX_VALUE : right.order);
    }

    boolean appVisible(AtomicWorkbenchShareTargetRepository.Target target) { return value(target, true, 0); }
    boolean targetVisible(AtomicWorkbenchShareTargetRepository.Target target) { return value(target, false, 0); }
    boolean appPinned(AtomicWorkbenchShareTargetRepository.Target target) { return value(target, true, 1); }
    boolean targetPinned(AtomicWorkbenchShareTargetRepository.Target target) { return value(target, false, 1); }
    boolean expanded(AtomicWorkbenchShareTargetRepository.Target target) { return value(target, true, 2); }

    private boolean value(AtomicWorkbenchShareTargetRepository.Target target, boolean app, int field) {
        synchronized (STORE_LOCK) {
            requireOwner(target);
            State state = read();
            Entry entry = app ? state.apps.get(appKey(target)) : state.targets.get(target.key());
            return entry == null ? field != 1 : field == 0 ? entry.visible : field == 1 ? entry.pinned : entry.expanded;
        }
    }

    Result setAppVisible(AtomicWorkbenchShareTargetRepository.Target target, boolean visible) { return set(target, true, 0, visible); }
    Result setTargetVisible(AtomicWorkbenchShareTargetRepository.Target target, boolean visible) { return set(target, false, 0, visible); }
    Result setAppPinned(AtomicWorkbenchShareTargetRepository.Target target, boolean pinned) { return set(target, true, 1, pinned); }
    Result setTargetPinned(AtomicWorkbenchShareTargetRepository.Target target, boolean pinned) { return set(target, false, 1, pinned); }
    Result setExpanded(AtomicWorkbenchShareTargetRepository.Target target, boolean expanded) { return set(target, true, 2, expanded); }

    private Result set(AtomicWorkbenchShareTargetRepository.Target target, boolean app, int field, boolean value) {
        if (!owned(target)) return new Result(false, "此用户的分享入口尚未连接");
        return mutate(state -> {
            ensure(state, Collections.singletonList(target));
            Entry entry = app ? state.apps.get(appKey(target)) : state.targets.get(target.key());
            if (field == 0) entry.visible = value;
            else if (field == 1) entry.pinned = value;
            else entry.expanded = value;
            return "";
        });
    }

    /** Only the currently supplied catalog changes; unknown/temporarily absent receivers stay saved. */
    Result setAllVisible(List<AtomicWorkbenchShareTargetRepository.Target> catalog, boolean visible) {
        return mutate(state -> {
            ensure(state, catalog);
            if (catalog != null) for (AtomicWorkbenchShareTargetRepository.Target target : catalog) if (owned(target)) {
                state.apps.get(appKey(target)).visible = visible;
                state.targets.get(target.key()).visible = visible;
            }
            return "";
        });
    }

    Result setAllExpanded(List<AtomicWorkbenchShareTargetRepository.Target> catalog, boolean expanded) {
        return mutate(state -> {
            ensure(state, catalog);
            if (catalog != null) for (AtomicWorkbenchShareTargetRepository.Target target : catalog) if (owned(target))
                state.apps.get(appKey(target)).expanded = expanded;
            return "";
        });
    }

    /** beforeKey == null appends within the same pin section; cross-section moves are explicit failures. */
    Result moveApp(List<AtomicWorkbenchShareTargetRepository.Target> catalog, String key, String beforeKey) {
        return move(catalog, key, beforeKey, true);
    }

    Result moveTarget(List<AtomicWorkbenchShareTargetRepository.Target> catalog, String key, String beforeKey) {
        return move(catalog, key, beforeKey, false);
    }

    private Result move(List<AtomicWorkbenchShareTargetRepository.Target> catalog, String key, String beforeKey, boolean app) {
        return mutate(state -> {
            ensure(state, catalog);
            Map<String, Entry> entries = app ? state.apps : state.targets;
            Entry source = entries.get(key), destination = beforeKey == null ? null : entries.get(beforeKey);
            if (source == null || beforeKey != null && destination == null) return "分享入口已变化，请重新打开管理";
            if (key.equals(beforeKey)) return "";
            if (destination != null && (source.pinned != destination.pinned || !source.parent.equals(destination.parent)))
                return app ? "置顶应用与普通应用分别排序" : "请在同一应用和置顶分组内排序";
            ArrayList<String> sequence = new ArrayList<>();
            for (Map.Entry<String, Entry> item : entries.entrySet())
                if (item.getValue().pinned == source.pinned && item.getValue().parent.equals(source.parent)) sequence.add(item.getKey());
            sequence.sort(Comparator.comparingLong(item -> entries.get(item).order));
            sequence.remove(key);
            int insertion = beforeKey == null ? sequence.size() : sequence.indexOf(beforeKey);
            if (insertion < 0) return "分享入口已变化，请重新打开管理";
            sequence.add(insertion, key);
            for (int i = 0; i < sequence.size(); i++) entries.get(sequence.get(i)).order = i;
            return "";
        });
    }

    private interface Mutation { String apply(State state); }

    private Result mutate(Mutation mutation) {
        synchronized (STORE_LOCK) {
            State state = read();
            if (!error.isEmpty()) return new Result(false, error);
            try {
                String rejected = mutation.apply(state);
                if (!rejected.isEmpty()) return new Result(false, rejected);
                byte[] bytes = encode(state);
                storage.write(bytes);
                if (!Arrays.equals(bytes, storage.read())) throw new IOException("persistence verification failed");
                error = "";
                return new Result(true, "");
            } catch (IOException | RuntimeException failed) {
                error = "分享设置保存失败，请检查手机存储后重试";
                return new Result(false, error);
            }
        }
    }

    private void ensure(State state, List<AtomicWorkbenchShareTargetRepository.Target> catalog) {
        long appOrder = next(state.apps), targetOrder = next(state.targets);
        if (catalog != null) for (AtomicWorkbenchShareTargetRepository.Target target : catalog) if (owned(target)) {
            String parent = appKey(target);
            if (!state.apps.containsKey(parent)) state.apps.put(parent, new Entry("", appOrder++));
            if (!state.targets.containsKey(target.key())) state.targets.put(target.key(), new Entry(parent, targetOrder++));
        }
    }

    private static long next(Map<String, Entry> entries) {
        long next = 0;
        for (Entry value : entries.values()) next = Math.max(next, value.order + 1);
        return next;
    }

    private boolean owned(AtomicWorkbenchShareTargetRepository.Target target) {
        return target != null && target.component != null && target.userId == userId;
    }

    private void requireOwner(AtomicWorkbenchShareTargetRepository.Target target) {
        if (!owned(target)) throw new IllegalArgumentException("preference owner mismatch");
    }

    private State read() {
        try {
            byte[] bytes = storage.read();
            if (bytes == null) { error = ""; return new State(); }
            if (bytes.length > MAX_BYTES) throw new IOException("oversized preferences");
            DataInputStream input = new DataInputStream(new ByteArrayInputStream(bytes));
            if (input.readInt() != MAGIC || input.readInt() != VERSION || input.readInt() != userId) throw new IOException("invalid owner or version");
            State state = new State();
            readEntries(input, state.apps, false);
            readEntries(input, state.targets, true);
            for (Entry entry : state.targets.values()) if (!state.apps.containsKey(entry.parent)) throw new IOException("missing parent");
            if (input.read() != -1) throw new IOException("trailing preferences");
            error = "";
            return state;
        } catch (IOException | RuntimeException failed) {
            error = "分享设置暂时无法读取，原设置已保留，请检查手机存储后重试";
            return new State();
        }
    }

    private void readEntries(DataInputStream input, Map<String, Entry> entries, boolean targets) throws IOException {
        int count = input.readInt();
        if (count < 0 || count > MAX_ENTRIES) throw new IOException("invalid entry count");
        for (int i = 0; i < count; i++) {
            String key = input.readUTF(), parent = input.readUTF();
            if (key.length() > 2048 || !key.startsWith(userId + ":") || targets && !parent.startsWith(userId + ":") || !targets && !parent.isEmpty())
                throw new IOException("invalid identity");
            Entry entry = new Entry(parent, input.readLong());
            if (entry.order < 0 || entry.order >= MAX_ENTRIES) throw new IOException("invalid order");
            entry.visible = input.readBoolean(); entry.pinned = input.readBoolean(); entry.expanded = input.readBoolean();
            if (entries.put(key, entry) != null) throw new IOException("duplicate identity");
        }
    }

    private byte[] encode(State state) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream output = new DataOutputStream(bytes);
        output.writeInt(MAGIC); output.writeInt(VERSION); output.writeInt(userId);
        writeEntries(output, state.apps); writeEntries(output, state.targets); output.flush();
        if (bytes.size() > MAX_BYTES) throw new IOException("oversized preferences");
        return bytes.toByteArray();
    }

    private static void writeEntries(DataOutputStream output, Map<String, Entry> entries) throws IOException {
        if (entries.size() > MAX_ENTRIES) throw new IOException("too many preferences");
        output.writeInt(entries.size());
        for (Map.Entry<String, Entry> item : entries.entrySet()) {
            Entry entry = item.getValue();
            if (entry.order < 0 || entry.order >= MAX_ENTRIES) throw new IOException("invalid order");
            output.writeUTF(item.getKey()); output.writeUTF(entry.parent); output.writeLong(entry.order);
            output.writeBoolean(entry.visible); output.writeBoolean(entry.pinned); output.writeBoolean(entry.expanded);
        }
    }

    private static final class FileStorage implements Storage {
        private final AtomicFile file;
        FileStorage(File path) { file = new AtomicFile(path); }
        public byte[] read() throws IOException {
            try (FileInputStream input = file.openRead()) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] block = new byte[4096]; int count;
                while ((count = input.read(block)) != -1) {
                    if (bytes.size() + count > MAX_BYTES) throw new IOException("oversized preferences");
                    bytes.write(block, 0, count);
                }
                return bytes.toByteArray();
            } catch (FileNotFoundException absent) {
                if (!file.getBaseFile().exists()) return null;
                throw absent;
            }
        }
        public void write(byte[] value) throws IOException {
            File directory = file.getBaseFile().getParentFile();
            if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) throw new IOException("cannot create preferences directory");
            FileOutputStream output = null;
            try {
                output = file.startWrite(); output.write(value); output.flush(); output.getFD().sync();
                file.finishWrite(output); output = null;
            } catch (IOException | RuntimeException failed) {
                if (output != null) file.failWrite(output);
                throw failed;
            }
        }
    }
}
