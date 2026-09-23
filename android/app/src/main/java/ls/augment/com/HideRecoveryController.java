package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/** Historical queries only; current explicit commands use HideTargetController. */
final class HideRecoveryController {
    private static final long REVIEW_MILLIS = 120_000;

    interface Access {
        RootHideManager.RootStatus root();
        RootShell.Result installEmergency();
        RootShell.Result archive(String selection);
        Set<RootHideManager.Target> configured();
        default String configuredRaw() { return selection(configured()); }
        HideRecoveryCatalog.Page read(String cursor);
        HideRecoveryCatalog.Page readOne(String key);
        default HideRecoverySearch.Page search(HideRecoverySearch.Query query) {
            return HideRecoverySearch.Page.failure("当前没有可用的来源查询入口");
        }
        RootHideManager.UserDirectory users();
        HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target);
        RootHideManager.State state(RootHideManager.Target target);
        default HideRootClient.RestorePreparation prepareRestore(RootHideManager.Target target,
                HideRecoveryIdentity.Snapshot identity,HideRecoveryJournal.Entry source) {
            return new HideRootClient.RestorePreparation(null,"当前系统未提供可核验的条件恢复入口");
        }
        default RootShell.Result persistRestore(HideRootClient.RestoreAttempt attempt){return new RootShell.Result(75,"恢复记录未保存",false);}
        default RootShell.Result restore(HideRootClient.RestoreAttempt attempt){return new RootShell.Result(75,"恢复入口不可用",false);}
        default void closeRestore(HideRootClient.RestoreAttempt attempt){}
        default RootShell.Result restoreStatus(HideRecoveryJournal.Entry entry){return new RootShell.Result(75,"恢复结果仍未知，记录已保留",false);}
        long now();
    }

    private final Access access;

    HideRecoveryController(Context context) {
        Context app = context.getApplicationContext();
        RootHideManager manager = new RootHideManager(app);
        HideRootClient transactions = new HideRootClient();
        access = new Access() {
            public RootHideManager.RootStatus root() { return manager.rootStatus(); }
            public RootShell.Result installEmergency() { return HideRecoveryEmergency.install(); }
            public RootShell.Result archive(String selection) { return HideRecoveryArchive.preserve(selection); }
            public Set<RootHideManager.Target> configured() { return manager.targets(); }
            public String configuredRaw() { return manager.selectionStatus().raw; }
            public HideRecoveryCatalog.Page read(String cursor) { return HideRecoveryCatalog.read(cursor); }
            public HideRecoveryCatalog.Page readOne(String key) { return HideRecoveryCatalog.readOne(key); }
            public HideRecoverySearch.Page search(HideRecoverySearch.Query query) {
                return HideRecoverySearch.read(query);
            }
            public RootHideManager.UserDirectory users() { return manager.userDirectory(); }
            public HideRecoveryIdentity.Snapshot identity(RootHideManager.Target target) {
                return HideRecoveryIdentity.read(app, target);
            }
            public RootHideManager.State state(RootHideManager.Target target) { return manager.queryState(target); }
            public RootShell.Result restoreStatus(HideRecoveryJournal.Entry entry){return transactions.recheckRestore(entry);}
            public long now() { return SystemClock.elapsedRealtime(); }
        };
    }

    HideRecoveryController(Access access) { this.access = access; }

    Page load(String cursor, boolean configuredOnly) {
        RootHideManager.ACTION_LOCK.lock();
        try {
            RootHideManager.RootStatus root = access.root();
            if (root.state != RootHideManager.RootState.GRANTED) return Page.failure(root.message);
            String selection = access.configuredRaw();
            if (configuredOnly) {
                HideTargetCodec.Selection parsed = HideTargetCodec.parse(selection);
                if (!parsed.valid) return Page.failure("应用名单尚未读取成功，请重新读取");
                List<Row> current = new ArrayList<>();
                for (RootHideManager.Target target : access.configured()) current.add(Row.current(target));
                return new Page(true, current.isEmpty() ? "当前没有已保存应用。也可从应用列表选择要显示的应用。"
                        : "选择一个应用，核对当前空间后手动显示。", current, "");
            }
            String historyProblem = preserveHistory(HideTargetCodec.parse(selection).valid ? selection : "");
            if (!historyProblem.isEmpty()) return Page.failure(historyProblem);
            HideRecoveryCatalog.Page catalog = access.read(cursor == null ? "" : cursor);
            if (catalog == null || !catalog.success) return Page.failure(catalog == null ? "历史读取失败" : catalog.message);
            List<Row> rows = new ArrayList<>();
            for (HideRecoveryCatalog.Source source : catalog.sources) rows.addAll(rows(source));
            return new Page(true, catalog.message, rows, catalog.nextCursor);
        } catch (RuntimeException error) { return Page.failure("读取历史时发生异常，记录已保留，请重试"); }
        finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    /** Discovery only: neither a selection nor a search result creates restoration authority. */
    Page loadCandidates(String cursor, RootHideManager.Target exact) {
        RootHideManager.ACTION_LOCK.lock();
        try {
            if (exact == null || !exact.isBound() || RootHideManager.isProtected(exact.packageName))
                return Page.failure("目标空间身份不完整，请从当前应用列表或原始记录重新核对");
            HideRecoverySearch.Query query = new HideRecoverySearch.Query(
                    exact.userId, exact.userSerial, exact.packageName, cursor);
            RootHideManager.RootStatus root = access.root();
            if (root == null || root.state != RootHideManager.RootState.GRANTED)
                return Page.failure(root == null ? "Root 状态无法确认" : root.message);
            RootHideManager.UserDirectory users = access.users();
            if (users == null || !users.success || !users.userIds().contains(exact.userId))
                return Page.failure("原用户空间已不存在或无法读取，请重新核对");
            HideRecoveryIdentity.Snapshot identity = access.identity(exact);
            if (identity == null || !identity.success || identity.userSerial != exact.userSerial)
                return Page.failure("原空间身份或应用已变化，不能改用相同编号的其他空间；历史记录继续保留");
            String historyProblem = preserveHistory(access.configuredRaw());
            if (!historyProblem.isEmpty()) return Page.failure(historyProblem);
            HideRecoverySearch.Page found = access.search(query);
            if (found == null || !found.success)
                return Page.failure(found == null ? "来源查询结果未确认，请重新读取" : found.message);
            if (found.nextCursor == null || !found.nextCursor.isEmpty()
                    && found.nextCursor.equals(query.cursor))
                return Page.failure("来源分页没有前进，请重新读取");
            // Validate the returned cursor's complete target binding before exposing it to the UI.
            new HideRecoverySearch.Query(exact.userId, exact.userSerial, exact.packageName, found.nextCursor);
            List<Row> candidates = new ArrayList<>();
            for (HideRecoveryCatalog.Source source : found.sources) {
                List<Row> parsed = rows(source);
                if (parsed.size() != 1) return Page.failure("来源查询记录不完整，请重新读取");
                Row row = parsed.get(0);
                if ((!row.restoreSource() && !row.restoreStatus()) || row.originalUserId != exact.userId
                        || row.userSerial != exact.userSerial || !row.packageName.equals(exact.packageName))
                    return Page.failure("来源查询与所选应用或空间不匹配，已停止核对");
                candidates.add(row);
            }
            return new Page(true, found.message, candidates, found.nextCursor);
        } catch (RuntimeException invalid) {
            return Page.failure("来源查询失败或分页已失效，记录保留，请重新读取");
        } finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    private String preserveHistory(String selection) {
        // The emergency installer archives the old script before replacing it.
        // Searching itself is read-only; these existing page-entry safeguards still write archives.
        RootShell.Result emergency = access.installEmergency();
        if (emergency == null || !emergency.isSuccess())
            return "应急入口保护未完成，历史记录保留：" + error(emergency);
        RootShell.Result archive = access.archive(selection);
        return archive == null || !archive.isSuccess()
                ? "当前名单备份失败，已停止读取可操作清单：" + error(archive) : "";
    }

    RootHideManager.UserDirectory users() {
        try { return access.users(); }
        catch (RuntimeException error) { return RootHideManager.UserDirectory.failure("无法读取当前用户空间，请重试"); }
    }

    Preview preview(Row row, int chosenUserId) {
        if (row != null && row.currentTarget) return Preview.failure("请使用当前应用的显示按钮重新核对");
        RootHideManager.ACTION_LOCK.lock();
        try {
            if (row == null || !row.actionable) return Preview.failure("此记录不能用于操作，请查看原始记录说明");
            if (!row.chooseUser && row.originalUserId != chosenUserId)
                return Preview.failure("记录中的空间与所选空间不一致");
            RootHideManager.Target target = new RootHideManager.Target(chosenUserId, row.packageName);
            if (!target.isValid() || RootHideManager.isProtected(target.packageName))
                return Preview.failure("目标无效或属于受保护应用");
            RootHideManager.RootStatus root = access.root();
            if (root.state != RootHideManager.RootState.GRANTED) return Preview.failure(root.message);
            String sourceProblem = sourceProblem(row);
            if (!sourceProblem.isEmpty()) return Preview.failure(sourceProblem);
            if(row.restoreStatus()) {
                RootShell.Result result=access.restoreStatus(row.journalEntry);
                return Preview.failure(result==null?"恢复结果仍未知，原记录已保留":result.isSuccess()?result.output:result.publicError());
            }
            RootHideManager.UserDirectory users = access.users();
            if (users == null || !users.success) return Preview.failure(users == null ? "空间读取失败" : users.message);
            String name = null;
            for (RootHideManager.UserRecord user : users.users) if (user.userId == chosenUserId) name = user.name;
            if (name == null) return Preview.failure("所选用户空间已不存在，请重新核对");
            HideRecoveryIdentity.Snapshot identity = access.identity(target);
            if (identity == null || !identity.success) return Preview.failure(identity == null ? "空间或应用身份读取失败" : identity.message);
            if (row.userSerial >= 0 && identity.userSerial != row.userSerial)
                return Preview.failure("历史空间已被删除或编号被复用，不能按这条记录操作");
            if (!"unknown".equals(row.packageIdentity) && !row.packageIdentity.equals(identity.packageIdentity))
                return Preview.failure("当前应用与历史身份资料不一致，不能按这条记录操作");
            if (identity.userSerial < 0) return Preview.failure("当前空间身份未知，已停止核对");
            // Legacy/pending records are evidence only. Bind this read-only query to
            // the identity just observed; never mutate or upgrade the saved record.
            target = new RootHideManager.Target(chosenUserId, identity.userSerial, row.packageName);
            RootHideManager.State state = access.state(target);
            if (state != RootHideManager.State.HIDDEN && state != RootHideManager.State.VISIBLE)
                return Preview.failure(state == RootHideManager.State.MISSING ? "此空间中没有安装该应用" : "无法确认当前显示状态");
            String message = "当前空间：" + name + "（user " + chosenUserId + "，序列号 " + identity.userSerial + "）\n"
                    + "应用：" + target.packageName + "\n当前状态："
                    + (state == RootHideManager.State.HIDDEN ? "已隐藏" : "已显示")
                    + "。\n历史记录仅供查看，没有发送应用操作。需要显示时，请从当前应用入口重新确认。";
            return new Preview(this, row, target, name, identity.userSerial, identity.packageIdentity,
                    state, access.now(), message);
        } catch (RuntimeException error) { return Preview.failure("核对失败，尚未改变应用状态，请重试"); }
        finally { RootHideManager.ACTION_LOCK.unlock(); }
    }

    /** Compatibility gate for an already-created review; there is no mutation transport. */
    RootHideManager.OperationResult show(Preview preview) {
        if (preview == null || !preview.success || preview.controller != this || !preview.used.compareAndSet(false, true))
            return RootHideManager.OperationResult.failure("核对已失效或已使用，请重新核对");
        RootHideManager.ACTION_LOCK.lock();
        try {
            RootHideManager.RootStatus root = access.root();
            if (root.state != RootHideManager.RootState.GRANTED) return RootHideManager.OperationResult.failure(root.message);
            String changed = revalidate(preview);
            if (!changed.isEmpty()) return RootHideManager.OperationResult.failure(changed);
            // VISIBLE is a verified no-op, never a reason to claim ownership. There is
            // deliberately no PM unhide fallback for PREPARED, observations, or old lists.
            if (preview.state == RootHideManager.State.VISIBLE)
                return RootHideManager.OperationResult.success("最近核对时此空间中的应用为显示状态；未执行恢复命令");
            return RootHideManager.OperationResult.failure("历史记录只用于查询；请从当前应用入口重新确认显示");
        } catch (RuntimeException error) {
            return RootHideManager.OperationResult.failure("状态核对失败，未执行恢复命令，原始记录继续保留");
        } finally {try{if(preview.restoreAttempt!=null)access.closeRestore(preview.restoreAttempt);}finally{RootHideManager.ACTION_LOCK.unlock();}}
    }

    /** Old records and already-issued restore reservations are never replayed by this UI. */
    RootHideManager.OperationResult restore(Preview preview) {
        cancel(preview);
        return RootHideManager.OperationResult.failure("历史记录不会执行应用操作，请从当前应用入口重新确认显示");
    }
    void cancel(Preview preview) {
        if(preview!=null&&preview.controller==this&&preview.used.compareAndSet(false,true)&&preview.restoreAttempt!=null)
            access.closeRestore(preview.restoreAttempt);
    }
    private static boolean matchesIdentity(HideRecoveryIdentity.Snapshot expected,HideRecoveryIdentity.Snapshot current) {
        return current!=null&&current.success&&current.userSerial==expected.userSerial&&current.packageIdentity.equals(expected.packageIdentity);
    }

    private String revalidate(Preview preview) {
        long elapsed = access.now() - preview.checkedAt;
        if (elapsed < 0 || elapsed > REVIEW_MILLIS) return "核对已过期，请重新核对";
        String problem = sourceProblem(preview.row);
        if (!problem.isEmpty()) return problem;
        RootHideManager.UserDirectory users = access.users();
        if (users == null || !users.success || !users.userIds().contains(preview.target.userId))
            return "用户空间读取失败或已变化，请重新核对";
        if (!matches(preview, access.identity(preview.target))) return "空间或应用身份已变化，请重新核对";
        if (access.state(preview.target) != preview.state) return "显示状态已变化，已停止操作，请重新核对";
        elapsed = access.now() - preview.checkedAt;
        return elapsed < 0 || elapsed > REVIEW_MILLIS ? "核对已过期，请重新核对" : "";
    }

    private static boolean matches(Preview preview, HideRecoveryIdentity.Snapshot identity) {
        return identity != null && identity.success && identity.userSerial == preview.userSerial
                && identity.packageIdentity.equals(preview.packageIdentity);
    }

    private String sourceProblem(Row row) {
        HideRecoveryCatalog.Page page = access.readOne(row.sourceKey);
        if (page == null || !page.success || page.sources.size() != 1) return "历史来源无法重新读取，已停止操作";
        HideRecoveryCatalog.Source source = page.sources.get(0);
        if (!source.key.equals(row.sourceKey) || !source.sha256.equals(row.sourceDigest) || !source.problem.isEmpty())
            return "历史来源已变化或校验失败，请刷新后重新核对";
        // Do not trust an old row after its source is replaced. Parse the actual source again.
        for (Row candidate : rows(source)) if (candidate.actionable && candidate.originalUserId == row.originalUserId
                && candidate.packageName.equals(row.packageName) && candidate.userSerial == row.userSerial
                && candidate.packageIdentity.equals(row.packageIdentity) && candidate.chooseUser == row.chooseUser
                && java.util.Objects.equals(candidate.journalEntry==null?null:candidate.journalEntry.encode(),
                    row.journalEntry==null?null:row.journalEntry.encode())) return "";
        return "历史来源不再包含此目标，请重新核对";
    }

    static List<Row> rows(HideRecoveryCatalog.Source source) {
        List<Row> rows = new ArrayList<>();
        if (!source.problem.isEmpty()) {
            rows.add(Row.notice(source, "原始记录已保留，但无法用于操作：" + source.problem));
            return rows;
        }
        String raw = new String(source.bytes, StandardCharsets.UTF_8);
        if (source.key.startsWith("script:")) {
            rows.add(Row.notice(source, "旧应急脚本原文已保留；不执行其中的命令。请从应用名单核对。"));
        } else if (source.key.startsWith("journal:")) {
            String line = raw.endsWith("\n") ? raw.substring(0, raw.length() - 1) : raw;
            HideRecoveryJournal.Entry entry = HideRecoveryJournal.parse(line);
            if (entry == null || !source.key.equals("journal:" + entry.operationId + "." + entry.stage + ".record")) {
                rows.add(Row.notice(source, "操作记录格式或名称不一致，原文已保留，不用于操作"));
            } else if (entry.stage == HideRecoveryJournal.Stage.PREPARED) {
                rows.add(new Row(source, entry.packageName, entry.userId, entry.userSerial, entry.packageIdentity,
                        "隐藏前记录；实例 " + entry.ownerId + "，空间序列号 " + entry.userSerial
                                + "。仅查询当前状态，不重新发送历史命令。"
                                + recordLabel(entry),true,false,entry));
            } else if(entry.stage==HideRecoveryJournal.Stage.RESTORE_PREPARED) {
                rows.add(new Row(source,entry.packageName,entry.userId,entry.userSerial,entry.packageIdentity,
                        "恢复前记录；仅查询这次恢复的原事务结果，不会重新发送恢复。"
                                + recordLabel(entry),true,false,entry));
            } else {
                // Orphan or later observations never acquire authority from a claimed result.
                rows.add(Row.notice(source, entry.packageName + "（历史 user " + entry.userId + "）："
                        + entry.stage + "，观察状态 " + entry.state + "。仅供查看；核对操作请使用隐藏前记录或原始名单。"));
            }
        } else {
            Set<HideTargetCodec.Entry> seen = new LinkedHashSet<>();
            int invalid = 0;
            for (String token : raw.split("[;\r\n]+", -1)) {
                if (token.isEmpty()) continue;
                HideTargetCodec.Selection parsed = HideTargetCodec.parse(token);
                if (!parsed.valid || parsed.entries.size() != 1) { invalid++; continue; }
                HideTargetCodec.Entry target = parsed.entries.iterator().next();
                String details = "名单记载 user " + target.userId
                        + (target.userSerial < 0 ? "，没有空间序列号" : "，空间序列号 " + target.userSerial)
                        + (target.isBound() ? "。" : "，尚未确认当前空间。")
                        + "旧名单仅供查询，不会据此执行应用操作。";
                if (seen.add(target)) rows.add(new Row(source, target.packageName, target.userId,
                        target.userSerial, "unknown", details, true, target.userSerial < 0));
            }
            if (invalid > 0) rows.add(Row.notice(source, "另有 " + invalid + " 项无法解析，原文完整保留，不用于操作"));
            if (rows.isEmpty()) rows.add(Row.notice(source, "空名单，原文已保留"));
        }
        return rows;
    }

    private static String selection(Set<RootHideManager.Target> targets) {
        List<String> values = new ArrayList<>();
        for (RootHideManager.Target target : targets) {
            if (target == null || !target.isValid()) throw new IllegalArgumentException("Invalid selection");
            values.add(target.encode());
        }
        Collections.sort(values);
        return String.join("\n", values);
    }

    private static String recordLabel(HideRecoveryJournal.Entry entry) {
        return "\n记录时间：" + java.text.DateFormat.getDateTimeInstance().format(new java.util.Date(entry.createdAt))
                + "\n记录编号：" + entry.operationId;
    }

    private static String digest(byte[] bytes) {
        try {
            StringBuilder result = new StringBuilder(64);
            for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes)) result.append(String.format(Locale.ROOT, "%02x", b & 255));
            return result.toString();
        } catch (java.security.NoSuchAlgorithmException error) { throw new IllegalStateException(error); }
    }

    private static String error(RootShell.Result result) { return result == null ? "结果未知" : result.publicError(); }

    static final class Page {
        final boolean success;
        final String message, nextCursor;
        final List<Row> rows;
        Page(boolean success, String message, List<Row> rows, String nextCursor) {
            this.success = success; this.message = message;
            this.rows = Collections.unmodifiableList(new ArrayList<>(rows)); this.nextCursor = nextCursor;
        }
        static Page failure(String message) { return new Page(false, message, Collections.emptyList(), ""); }
    }

    static final class Row {
        final String sourceKey, sourceDigest, packageName, details, packageIdentity;
        final int originalUserId;
        final long userSerial;
        final HideRecoveryJournal.Entry journalEntry;
        // Current list rows navigate to a new explicit command; historical rows are read-only.
        final boolean actionable, chooseUser, currentTarget;
        private Row(HideRecoveryCatalog.Source source, String packageName, int userId, long serial,
                String identity, String details, boolean actionable, boolean chooseUser) {
            this(source,packageName,userId,serial,identity,details,actionable,chooseUser,null);
        }
        private Row(HideRecoveryCatalog.Source source, String packageName, int userId, long serial,
                String identity, String details, boolean actionable, boolean chooseUser,HideRecoveryJournal.Entry entry) {
            sourceKey = source == null ? "" : source.key; sourceDigest = source == null ? "" : source.sha256; currentTarget = source == null; this.packageName = packageName;
            originalUserId = userId; userSerial = serial; packageIdentity = identity;
            this.details = details; this.actionable = actionable; this.chooseUser = chooseUser;
            journalEntry=entry;
        }
        static Row current(RootHideManager.Target target) {
            return new Row(null, target.packageName, target.userId, target.userSerial, "unknown",
                    "空间 " + target.userId + " · " + (target.isBound() ? "序列号 " + target.userSerial
                            : "空间身份待确认，请到应用列表重新选择"),
                    target.isValid() && target.isBound() && !RootHideManager.isProtected(target.packageName), false);
        }
        boolean restoreSource(){return journalEntry!=null&&journalEntry.stage==HideRecoveryJournal.Stage.PREPARED;}
        boolean restoreStatus(){return journalEntry!=null&&journalEntry.stage==HideRecoveryJournal.Stage.RESTORE_PREPARED;}
        boolean searchable(){return !currentTarget && actionable&&journalEntry==null&&!chooseUser&&userSerial>=0;}
        static Row notice(HideRecoveryCatalog.Source source, String details) {
            return new Row(source, "", -1, -1, "unknown", details, false, false);
        }
    }

    static final class Preview {
        final boolean success;
        final String message, userName;
        final RootHideManager.Target target;
        final RootHideManager.State state;
        final HideRootClient.RestoreAttempt restoreAttempt;
        private final HideRecoveryController controller;
        private final Row row;
        private final long userSerial, checkedAt;
        private final String packageIdentity;
        private final AtomicBoolean used = new AtomicBoolean();
        private Preview(HideRecoveryController controller, Row row, RootHideManager.Target target, String userName,
                long userSerial, String packageIdentity, RootHideManager.State state, long checkedAt, String message) {
            this(controller,row,target,userName,userSerial,packageIdentity,state,checkedAt,message,null);
        }
        private Preview(HideRecoveryController controller, Row row, RootHideManager.Target target, String userName,
                long userSerial, String packageIdentity, RootHideManager.State state, long checkedAt, String message,
                HideRootClient.RestoreAttempt attempt) {
            this.controller = controller; this.row = row; this.target = target; this.userName = userName;
            this.userSerial = userSerial; this.packageIdentity = packageIdentity; this.state = state;
            this.checkedAt = checkedAt; this.message = message; success = true;
            restoreAttempt=attempt;
        }
        private Preview(String message) {
            success = false; this.message = message; userName = ""; target = null; state = RootHideManager.State.ERROR;
            controller = null; row = null; userSerial = -1; checkedAt = 0; packageIdentity = "unknown";
            restoreAttempt=null;
        }
        static Preview failure(String message) { return new Preview(message); }
    }
}
