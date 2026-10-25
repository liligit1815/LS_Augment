package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Process;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.util.ArrayList;
import java.util.UUID;

/** Durable evidence for displays created by the private ROOT workbench process. */
final class AtomicWorkbenchJournal {
    static final String PACKAGE = "ls.augment.com";
    static final String DISPLAY_PREFIX = "DuoAtomic-";
    private static final int FORMAT = 1;
    private static final int MAX_BYTES = 256 * 1024;
    private final File dataDirectory;
    private final File directory;
    private final File file;
    private final int uid, user;
    private final int windowId;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile reader;
    private final long directoryDevice, directoryInode;
    private FileOutputStream lockStream;
    private FileLock lock;

    AtomicWorkbenchJournal(Context userContext, int appUid, int userId) throws Exception {
        this(userContext, appUid, userId, -1);
    }

    AtomicWorkbenchJournal(Context userContext, int appUid, int userId, int windowId) throws Exception {
        this(userContext,appUid,userId,windowId,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4);
    }

    AtomicWorkbenchJournal(Context userContext,int appUid,int userId,int windowId,
            AtomicWorkbenchRecoveryScope.ReaderProfile reader) throws Exception {
        if (reader == null || windowId < -1 || windowId >= reader.poolCount)
            throw new IllegalArgumentException("工作区窗口编号无效");
        this.reader=reader;
        ApplicationInfo info = userContext.getPackageManager().getApplicationInfo(PACKAGE, 0);
        if (info.uid != appUid || appUid / 100000 != userId || appUid < 10000)
            throw new SecurityException("工作区所属用户不匹配");
        uid = appUid;
        user = userId;
        this.windowId = windowId;
        dataDirectory = new File(info.dataDir).getCanonicalFile();
        directory = new File(dataDirectory, "files/atomic_workbench");
        file = new File(directory, windowId < 0 ? "recovery.json" : "recovery-window-" + windowId + ".json");
        prepareDirectory();
        StructStat identity = Os.lstat(directory.getPath());
        directoryDevice = identity.st_dev;
        directoryInode = identity.st_ino;
    }

    void acquireLock() throws Exception {
        if (isLocked()) return;
        checkDirectory();
        File lockFile = new File(directory, windowId < 0 ? "session.lock" : "session-window-" + windowId + ".lock");
        FileDescriptor fd = Os.open(lockFile.getPath(), OsConstants.O_RDWR | OsConstants.O_CREAT
                | OsConstants.O_CLOEXEC | OsConstants.O_NOFOLLOW, 0600);
        FileOutputStream stream = new FileOutputStream(fd);
        FileLock acquired = null;
        try {
            StructStat stat = Os.fstat(fd);
            if (!OsConstants.S_ISREG(stat.st_mode) || (stat.st_uid != uid && stat.st_uid != 0))
                throw new SecurityException("工作区会话锁身份无效");
            Os.fchown(fd, uid, uid); Os.fchmod(fd, 0600);
            try { acquired = stream.getChannel().tryLock(); }
            catch (OverlappingFileLockException busy) { throw new IOException("上次工作区仍在恢复，请稍后重试"); }
            if (acquired == null) throw new IOException("上次工作区仍在恢复，请稍后重试");
            lockStream = stream; lock = acquired;
        } finally { if (acquired == null) stream.close(); }
    }

    boolean isLocked() { return lock != null && lock.isValid(); }

    boolean originalStorageMissing() {
        try {
            StructStat stat = Os.lstat(directory.getPath());
            return !OsConstants.S_ISDIR(stat.st_mode) || stat.st_uid != uid
                    || stat.st_dev != directoryDevice || stat.st_ino != directoryInode
                    || !directory.getCanonicalPath().equals(directory.getAbsolutePath());
        } catch (ErrnoException error) {
            return error.errno == OsConstants.ENOENT;
        } catch (IOException error) { return false; }
    }

    void releaseLock() {
        if (lock != null) try { lock.release(); } catch (IOException ignored) { }
        lock = null;
        if (lockStream != null) try { lockStream.close(); } catch (IOException ignored) { }
        lockStream = null;
    }

    boolean exists() throws Exception {
        checkDirectory();
        try { Os.lstat(file.getPath()); return true; }
        catch (ErrnoException error) { if (error.errno == OsConstants.ENOENT) return false; throw error; }
    }

    Record read() throws Exception {
        requireLock();
        if (!exists()) return null;
        StructStat stat = Os.lstat(file.getPath());
        if (!OsConstants.S_ISREG(stat.st_mode) || (stat.st_uid != uid && stat.st_uid != 0)
                || stat.st_size < 1 || stat.st_size > MAX_BYTES)
            throw new IOException("工作区恢复记录不可用，已保留原文件");
        FileDescriptor fd = Os.open(file.getPath(), OsConstants.O_RDONLY | OsConstants.O_CLOEXEC
                | OsConstants.O_NOFOLLOW, 0);
        byte[] bytes;
        try (FileInputStream input = new FileInputStream(fd)) {
            java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int count;
            while ((count = input.read(buffer)) != -1) {
                if (output.size() + count > MAX_BYTES) throw new IOException("恢复记录过大");
                output.write(buffer, 0, count);
            }
            bytes = output.toByteArray();
        }
        JSONObject json = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
        Record record = Record.fromJson(json);
        if (json.getInt("format") != FORMAT || record.ownerUid != uid || record.userId != user
                || record.windowId != windowId || !record.displayName.equals(displayName(uid, windowId, record.session))
                || !UUID.fromString(record.session).toString().equals(record.session)
                || record.displayId < -1 || record.tasks.size() > 256)
            throw new SecurityException("工作区恢复记录身份不匹配");
        requireRecordReader(record);
        return record;
    }

    void save(Record record) throws Exception {
        requireLock();
        checkDirectory();
        if (record.ownerUid != uid || record.userId != user || record.windowId != windowId)
            throw new SecurityException("恢复记录身份不匹配");
        requireRecordReader(Record.fromJson(record.json()));
        writeAtomic(file, record.json());
    }

    /** Keep the original lease evidence after the framework confirms HOME was recreated. */
    void archiveRecreatedHome(Record record, int replacementTaskId) throws Exception {
        requireLock();
        checkDirectory();
        if (record.ownerUid != uid || record.userId != user || record.windowId != windowId
                || record.homeTaskId < 0 || replacementTaskId < 0
                || !UUID.fromString(record.session).toString().equals(record.session))
            throw new SecurityException("原生桌面归档身份不匹配");
        requireRecordReader(Record.fromJson(record.json()));
        JSONObject evidence = record.json();
        evidence.put("recovery_resolution", "system_recreated_primary_home");
        evidence.put("replacement_home_task_id", replacementTaskId);
        writeAtomic(new File(directory, "resolved-home-" + record.session + "-" + record.homeTaskId + ".json"), evidence);
    }

    private void writeAtomic(File destination, JSONObject json) throws Exception {
        byte[] bytes = json.toString().getBytes(StandardCharsets.UTF_8);
        if (bytes.length > MAX_BYTES) throw new IOException("恢复记录过大");
        File temporary = new File(directory, "pending-" + UUID.randomUUID() + ".tmp");
        boolean renamed = false;
        FileDescriptor fd = Os.open(temporary.getPath(), OsConstants.O_WRONLY | OsConstants.O_CREAT
                | OsConstants.O_EXCL | OsConstants.O_CLOEXEC | OsConstants.O_NOFOLLOW, 0600);
        try {
            try (FileOutputStream output = new FileOutputStream(fd)) {
                output.write(bytes);
                Os.fchown(fd, uid, uid);
                Os.fchmod(fd, 0600);
                output.getFD().sync();
            }
            checkDirectory();
            Os.rename(temporary.getPath(), destination.getPath());
            renamed = true;
            syncDirectory();
        } finally {
            if (!renamed) try { Os.remove(temporary.getPath()); } catch (ErrnoException ignored) { }
        }
    }

    void clear() throws Exception {
        requireLock();
        checkDirectory();
        read(); // Unsupported/unknown recovery bytes cannot be cleared by a narrower reader.
        try { Os.remove(file.getPath()); }
        catch (ErrnoException error) { if (error.errno != OsConstants.ENOENT) throw error; }
        syncDirectory();
    }

    private void prepareDirectory() throws Exception {
        File files = directory.getParentFile();
        ensurePrivateDirectory(files);
        ensurePrivateDirectory(directory);
        checkDirectory();
    }

    private void ensurePrivateDirectory(File candidate) throws Exception {
        try { Os.mkdir(candidate.getPath(), 0700); }
        catch (ErrnoException error) { if (error.errno != OsConstants.EEXIST) throw error; }
        StructStat stat = Os.lstat(candidate.getPath());
        if (!OsConstants.S_ISDIR(stat.st_mode) || !candidate.getCanonicalPath().equals(candidate.getAbsolutePath())
                || (stat.st_uid != uid && stat.st_uid != Process.ROOT_UID))
            throw new SecurityException("工作区私有目录不可用");
        Os.chown(candidate.getPath(), uid, uid);
        Os.chmod(candidate.getPath(), 0700);
    }

    private void checkDirectory() throws Exception {
        for (File candidate : new File[]{directory.getParentFile(), directory}) {
            StructStat stat = Os.lstat(candidate.getPath());
            if (!OsConstants.S_ISDIR(stat.st_mode) || stat.st_uid != uid
                    || (candidate.equals(directory) && directoryInode != 0
                        && (stat.st_dev != directoryDevice || stat.st_ino != directoryInode))
                    || !candidate.getCanonicalPath().equals(candidate.getAbsolutePath())
                    || !candidate.getCanonicalPath().startsWith(dataDirectory.getPath() + File.separator))
                throw new SecurityException("工作区私有目录已变化");
        }
    }

    private void requireLock() throws IOException {
        if (!isLocked()) throw new IOException("工作区会话未持有恢复锁");
    }

    private void syncDirectory() throws Exception {
        FileDescriptor fd = Os.open(directory.getPath(), OsConstants.O_RDONLY
                | OsConstants.O_CLOEXEC | OsConstants.O_NOFOLLOW, 0);
        try {
            if (!OsConstants.S_ISDIR(Os.fstat(fd).st_mode)) throw new IOException("工作区恢复目录已变化");
            Os.fsync(fd);
        } finally { Os.close(fd); }
    }

    static final class TaskOrigin {
        final int taskId, displayId, userId;
        final String component;
        final int uid;
        final String serverBootGeneration, taskGeneration, disposition, successorSession;
        TaskOrigin(int taskId, int displayId, int userId, String component) {
            this(taskId, displayId, userId, component, -1, "", "", "WORKSPACE_OWNED", "");
        }
        TaskOrigin(int taskId, int displayId, int userId, String component, int uid, String boot,
                   String generation, String disposition, String successorSession) {
            boolean legacy = uid == -1 && "".equals(boot) && "".equals(generation)
                    && "WORKSPACE_OWNED".equals(disposition) && "".equals(successorSession);
            if (!legacy && (taskId < 0 || displayId < 0 || userId < 0 || uid < 1000 || uid % 100000 < 1000 || uid / 100000 != userId
                    || component == null || component.length() > 1024 || android.content.ComponentName.unflattenFromString(component) == null
                    || boot == null || !boot.matches("[0-9a-f]{32}") || generation == null || !generation.matches("[0-9a-f]{32}")
                    || disposition == null || !disposition.matches("WORKSPACE_OWNED|SHELVED_REFERENCE|TRANSFERRED|RELEASED|ENDED")
                    || successorSession == null || ("TRANSFERRED".equals(disposition)
                        ? !successorSession.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}") : !successorSession.isEmpty())))
                throw new IllegalArgumentException("task_journal_origin_identity");
            this.taskId = taskId; this.displayId = displayId; this.userId = userId;
            this.component = component == null ? "" : component;
            this.uid = uid; this.serverBootGeneration = boot; this.taskGeneration = generation;
            this.disposition = disposition; this.successorSession = successorSession;
        }
        JSONObject json() throws Exception {
            JSONObject json = new JSONObject();
            json.put("task_id", taskId); json.put("origin_display", displayId);
            json.put("user_id", userId); json.put("component", component);
            if (!taskGeneration.isEmpty()) {
                json.put("uid", uid); json.put("server_boot_generation", serverBootGeneration);
                json.put("task_generation", taskGeneration); json.put("disposition", disposition);
                json.put("successor_session", successorSession);
            }
            return json;
        }
        static TaskOrigin read(JSONObject json) throws Exception {
            int id = json.getInt("task_id"), display = json.getInt("origin_display"), user = json.getInt("user_id");
            String component = json.getString("component");
            if (id < 0 || display < 0 || user < 0 || component.length() > 1024)
                throw new IOException("任务恢复记录无效");
            if (!json.has("task_generation")) {
                if (json.has("uid") || json.has("server_boot_generation") || json.has("disposition") || json.has("successor_session"))
                    throw new IOException("任务移交记录不完整");
                return new TaskOrigin(id, display, user, component);
            }
            if (!hasTaskKeys(json, "task_id", "origin_display", "user_id", "component", "uid",
                    "server_boot_generation", "task_generation", "disposition", "successor_session")) throw new IOException("任务移交字段无效");
            id = strictTaskInt(json, "task_id"); display = strictTaskInt(json, "origin_display"); user = strictTaskInt(json, "user_id");
            component = strictTaskString(json, "component");
            int uid = strictTaskInt(json, "uid"); String boot = strictTaskString(json, "server_boot_generation"), generation = strictTaskString(json, "task_generation");
            String disposition = strictTaskString(json, "disposition"), successor = strictTaskString(json, "successor_session");
            if (uid < 1000 || uid / 100000 != user || !boot.matches("[0-9a-f]{32}") || !generation.matches("[0-9a-f]{32}")
                    || !disposition.matches("WORKSPACE_OWNED|SHELVED_REFERENCE|TRANSFERRED|RELEASED|ENDED")
                    || ("TRANSFERRED".equals(disposition) ? !successor.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}") : !successor.isEmpty()))
                throw new IOException("任务移交身份无效");
            return new TaskOrigin(id, display, user, component, uid, boot, generation, disposition, successor);
        }
    }

    /** Durable union-reconciliation evidence; deliberately contains no Root token or END confirmation. */
    static final class TaskOperation {
        final String operationId, shelfId, action, phase, leaseId, targetSession, targetName, targetUnique;
        final int targetWindow, targetDisplay;
        final TaskOrigin origin;
        TaskOperation(String operationId, String shelfId, String action, String phase, String leaseId, TaskOrigin origin,
                      int targetWindow, int targetDisplay, String targetSession, String targetName, String targetUnique) {
            this.operationId = operationId; this.shelfId = shelfId; this.action = action; this.phase = phase; this.leaseId = leaseId;
            this.origin = origin; this.targetWindow = targetWindow; this.targetDisplay = targetDisplay;
            this.targetSession = targetSession; this.targetName = targetName; this.targetUnique = targetUnique;
        }
        JSONObject json() throws Exception {
            JSONObject j = new JSONObject(); j.put("operation_id", operationId); j.put("shelf_id", shelfId); j.put("action", action);
            j.put("phase", phase); j.put("lease_id", leaseId); j.put("origin", origin.json()); j.put("target_window", targetWindow);
            j.put("target_display", targetDisplay); j.put("target_session", targetSession); j.put("target_name", targetName); j.put("target_unique", targetUnique);
            return j;
        }
        static TaskOperation read(JSONObject j) throws Exception {
            if (!hasTaskKeys(j, "operation_id", "shelf_id", "action", "phase", "lease_id", "origin", "target_window",
                    "target_display", "target_session", "target_name", "target_unique")) throw new IOException("任务事务字段无效");
            TaskOperation r = new TaskOperation(strictTaskString(j, "operation_id"), strictTaskString(j, "shelf_id"), strictTaskString(j, "action"),
                    strictTaskString(j, "phase"), strictTaskString(j, "lease_id"), TaskOrigin.read(j.getJSONObject("origin")),
                    strictTaskInt(j, "target_window"), strictTaskInt(j, "target_display"), strictTaskString(j, "target_session"), strictTaskString(j, "target_name"), strictTaskString(j, "target_unique"));
            if (!r.operationId.matches("[0-9a-f]{32}") || !r.shelfId.matches("[0-9a-f]{32}")
                    || !r.action.matches("SHELVE|RESTORE|MOVE_OUT|END_TASK") || !r.phase.matches("PREPARED|MUTATING|VERIFY_PENDING|COMMITTED|CLEANUP_PENDING")
                    || !(r.leaseId.isEmpty() || r.leaseId.matches("[0-9a-f]{32}")) || r.origin.taskGeneration.isEmpty()
                    || r.targetWindow < -1 || r.targetWindow >= AtomicWorkbenchSlotDomain.POOL_SIZE || r.targetDisplay < 0 || r.targetName.isEmpty() || r.targetName.length() > 512
                    || r.targetUnique.isEmpty() || r.targetUnique.length() > 1024
                    || (r.targetWindow >= 0 ? !r.targetSession.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}") : !r.targetSession.isEmpty()))
                throw new IOException("任务事务记录无效");
            return r;
        }
    }

    private static String strictTaskString(JSONObject json, String key) throws Exception {
        Object value = json.get(key); if (!(value instanceof String)) throw new IOException("任务字段类型无效"); return (String) value;
    }
    private static boolean hasTaskKeys(JSONObject json, String... expected) {
        java.util.HashSet<String> remaining = new java.util.HashSet<>(java.util.Arrays.asList(expected));
        java.util.Iterator<String> actual = json.keys();
        while (actual.hasNext()) if (!remaining.remove(actual.next())) return false;
        return remaining.isEmpty();
    }
    private static int strictTaskInt(JSONObject json, String key) throws Exception {
        Object value = json.get(key);
        if (!(value instanceof Integer) && !(value instanceof Long)) throw new IOException("任务字段类型无效");
        long number = ((Number) value).longValue();
        if (number < Integer.MIN_VALUE || number > Integer.MAX_VALUE) throw new IOException("任务字段范围无效"); return (int) number;
    }

    static final class Record {
        final int ownerUid, userId;
        final int windowId;
        final String session, displayName;
        String uniqueId = "", component = "", state = "prepared";
        String taskAllocationId = "";
        boolean retainedEmptyTaskDisplay;
        int displayId = -1, width, height, density, imePolicy = -1, hiddenTaskId = -1;
        // The actual primary HOME is borrowed separately from ordinary app tasks.
        // Persist before migration; clear only after observing it back on display 0.
        int homeTaskId = -1, homeOriginDisplay = 0;
        boolean homeMigrationPending;
        String homeComponent = "";
        // A direct VD-to-VD handoff retains the source's responsibility until the
        // destination journal has acknowledged it. Old schema-1 files omit these.
        int homeTransferDisplay = -1;
        String homeTransferName = "", homeTransferUniqueId = "";
        boolean homeOnly;
        final ArrayList<TaskOrigin> tasks = new ArrayList<>();
        final ArrayList<TaskOperation> taskOperations = new ArrayList<>();
        Record(int uid, int user) {
            this(uid, user, -1);
        }
        Record(int uid, int user, int windowId) {
            ownerUid = uid; userId = user;
            this.windowId = windowId;
            session = UUID.randomUUID().toString();
            displayName = displayName(uid, windowId, session);
        }
        private Record(int uid, int user, int windowId, String session, String name) {
            ownerUid = uid; userId = user; this.windowId = windowId; this.session = session; displayName = name;
        }
        JSONObject json() throws Exception {
            JSONObject json = new JSONObject();
            json.put("format", FORMAT); json.put("owner_uid", ownerUid); json.put("user_id", userId);
            json.put("window_id", windowId);
            json.put("session", session); json.put("display_name", displayName); json.put("unique_id", uniqueId);
            json.put("display_id", displayId); json.put("width", width); json.put("height", height);
            json.put("density", density); json.put("ime_policy", imePolicy); json.put("component", component);
            json.put("state", state);
            if (!taskAllocationId.isEmpty()) json.put("task_allocation_id", taskAllocationId);
            if (retainedEmptyTaskDisplay) json.put("retained_empty_task_display", true);
            json.put("hidden_task_id", hiddenTaskId);
            json.put("home_task_id", homeTaskId); json.put("home_origin_display", homeOriginDisplay);
            json.put("home_migration_pending", homeMigrationPending);
            json.put("home_component", homeComponent); json.put("home_only", homeOnly);
            json.put("home_transfer_display", homeTransferDisplay);
            json.put("home_transfer_name", homeTransferName); json.put("home_transfer_unique_id", homeTransferUniqueId);
            JSONArray entries = new JSONArray(); for (TaskOrigin task : tasks) entries.put(task.json());
            json.put("tasks", entries);
            JSONArray operations = new JSONArray(); for (TaskOperation operation : taskOperations) operations.put(operation.json());
            json.put("task_operations", operations); return json;
        }
        static Record fromJson(JSONObject json) throws Exception {
            Record record = new Record(json.getInt("owner_uid"), json.getInt("user_id"), (json.has("window_id") ? strictTaskInt(json,"window_id") : -1),
                    json.getString("session"), json.getString("display_name"));
            if(record.windowId < -1 || record.windowId >= AtomicWorkbenchSlotDomain.POOL_SIZE)
                throw new IOException("工作区窗口编号无效");
            record.uniqueId = json.getString("unique_id"); record.displayId = json.getInt("display_id");
            record.width = json.getInt("width"); record.height = json.getInt("height"); record.density = json.getInt("density");
            record.imePolicy = json.getInt("ime_policy"); record.component = json.getString("component");
            record.state = json.getString("state"); JSONArray tasks = json.getJSONArray("tasks");
            if (json.has("task_allocation_id")) {
                Object allocation = json.get("task_allocation_id");
                if (!(allocation instanceof String) || !((String) allocation).matches("[0-9a-f]{32}"))
                    throw new IOException("任务空显示分配身份无效");
                record.taskAllocationId = (String) allocation;
            }
            if (json.has("retained_empty_task_display")) {
                Object retained = json.get("retained_empty_task_display");
                if (!(retained instanceof Boolean)) throw new IOException("任务空显示状态无效");
                record.retainedEmptyTaskDisplay = (Boolean) retained;
            }
            record.hiddenTaskId = json.optInt("hidden_task_id", -1);
            record.homeTaskId = json.has("home_task_id") ? json.getInt("home_task_id") : -1;
            record.homeMigrationPending = json.has("home_migration_pending") && json.getBoolean("home_migration_pending");
            record.homeOriginDisplay = json.has("home_origin_display") ? json.getInt("home_origin_display") : 0;
            record.homeComponent = json.has("home_component") ? json.getString("home_component") : "";
            record.homeOnly = json.has("home_only") && json.getBoolean("home_only");
            record.homeTransferDisplay = json.optInt("home_transfer_display", -1);
            record.homeTransferName = json.optString("home_transfer_name", "");
            record.homeTransferUniqueId = json.optString("home_transfer_unique_id", "");
            if (record.homeTransferDisplay < -1 || record.homeTransferName.length() > 1024 || record.homeTransferUniqueId.length() > 1024
                    || (record.homeTransferDisplay >= 0 && (record.homeTransferDisplay == 0 || record.homeTaskId < 0
                        || !record.homeMigrationPending || record.homeTransferUniqueId.isEmpty()
                        || !record.homeTransferName.matches("DuoAtomic-" + record.ownerUid + "-w[0-7]-[0-9a-f-]{36}")))
                    || (record.homeTransferDisplay < 0 && (!record.homeTransferName.isEmpty() || !record.homeTransferUniqueId.isEmpty())))
                throw new IOException("原生桌面移交记录无效");
            if (record.homeTaskId < -1 || record.homeTaskId > Integer.MAX_VALUE - 1000000 || record.homeOriginDisplay != 0
                    || record.homeComponent.length() > 1024
                    || (record.homeTaskId >= 0 && (record.homeComponent.isEmpty()
                        || android.content.ComponentName.unflattenFromString(record.homeComponent) == null))
                    || (record.homeTaskId < 0 && (!record.homeComponent.isEmpty() || record.homeMigrationPending)))
                throw new IOException("原生桌面恢复记录无效");
            if (tasks.length() > 256 || record.uniqueId.length() > 1024 || record.component.length() > 1024)
                throw new IOException("恢复记录无效");
            for (int i = 0; i < tasks.length(); i++) record.tasks.add(TaskOrigin.read(tasks.getJSONObject(i)));
            JSONArray operations = json.optJSONArray("task_operations");
            if (json.has("task_operations") && operations == null || operations != null && operations.length() > 16)
                throw new IOException("任务事务记录无效");
            java.util.HashSet<String> operationIds = new java.util.HashSet<>();
            if (operations != null) for (int i = 0; i < operations.length(); i++) {
                TaskOperation operation = TaskOperation.read(operations.getJSONObject(i));
                if (!operationIds.add(operation.operationId) || operation.origin.userId != record.userId)
                    throw new IOException("任务事务重复或用户不匹配");
                record.taskOperations.add(operation);
            }
            return record;
        }
    }

    private void requireRecordReader(Record record) throws IOException {
        boolean high=AtomicWorkbenchSlotDomain.high(record.windowId);
        high |= AtomicWorkbenchSlotDomain.highDisplayName(record.homeTransferName);
        for(TaskOperation operation:record.taskOperations) {
            high |= AtomicWorkbenchSlotDomain.high(operation.targetWindow);
            high |= AtomicWorkbenchSlotDomain.highDisplayName(operation.targetName);
        }
        if(high && reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
            throw new IOException("journal_scope_unsupported_full_scope");
    }

    private static String displayName(int uid, int windowId, String session) {
        return DISPLAY_PREFIX + uid + "-" + (windowId < 0 ? "" : "w" + windowId + "-") + session;
    }
}
