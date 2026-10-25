package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/** The global reset may discard a journal only after its phone-side recovery completes. */
final class AtomicWorkbenchReset {
    private static final String RESET_CLOSE="workbench_reset_close", RESET_GENERATION="workbench_reset_generation";
    private AtomicWorkbenchReset() { }

    static Bundle restore(Context context) {
        if (!ResetWriteFence.owns()) return AtomicWorkbenchProtocol.failure("工作台恢复必须由重置任务执行");
        try {
            Bundle closed=null;
            AtomicWorkbenchProvider.Pending pending = AtomicWorkbenchProvider.existingForReset();
            if (pending != null && pending.endpoint != null && pending.endpoint.isBinderAlive()) {
                Parcel data = Parcel.obtain(), reply = Parcel.obtain();
                try {
                    data.writeInterfaceToken(AtomicWorkbenchProtocol.DESCRIPTOR);
                    data.writeInt(AtomicWorkbenchProtocol.VERSION);
                    data.writeString(pending.token);
                    if (!pending.endpoint.transact(AtomicWorkbenchProtocol.TX_CLOSE, data, reply, 0))
                        throw new IOException("工作台恢复接口不可用");
                    reply.readException();
                    Bundle result = reply.readTypedObject(Bundle.CREATOR);
                    if (result == null || !result.getBoolean("success") || result.getBoolean("recovery_pending"))
                        return result == null ? AtomicWorkbenchProtocol.failure("工作台尚未确认任务恢复") : result;
                    closed=result.deepCopy();
                    AtomicWorkbenchProvider.remove(pending);
                } finally { data.recycle(); reply.recycle(); }
            } else if (pending != null) AtomicWorkbenchProvider.remove(pending);
            if (hasJournal(context) && closed==null) {
                AtomicWorkbenchClient recovery = AtomicWorkbenchClient.connect(context);
                Bundle result = recovery.close();
                if (!result.getBoolean("success") || result.getBoolean("recovery_pending")) return result;
                closed=result.deepCopy();
            }
            Bundle result = new Bundle();
            result.putBoolean("success", true);
            result.putString("message", "工作台任务恢复已确认");
            result.putLong(RESET_GENERATION,ResetWriteFence.generation());
            if(closed!=null) result.putBundle(RESET_CLOSE,closed);
            requireClearSafe(context,result); // Preflight only; the real deletion rechecks under the Store lock later.
            return result;
        } catch (Exception failure) {
            return AtomicWorkbenchProtocol.failure("工作台任务恢复未确认，恢复记录已保留："
                    + failure.getClass().getSimpleName());
        }
    }

    static void requireClearSafe(Context context) throws IOException {
        File directory = new File(context.getFilesDir(), "atomic_workbench");
        if (Files.isSymbolicLink(directory.toPath()) || hasJournal(context) || AtomicWorkbenchProvider.hasLiveEndpoint())
            throw new IOException("工作台仍在运行或保留待恢复任务，不能清除恢复记录");
    }

    static void requireClearSafe(Context context,Bundle workbench) throws IOException {
        if(workbench==null) { requireClearSafe(context); return; }
        checkedReset(context,workbench,false);
    }

    /** Invoked only at the existing total-reset files deletion, never by status or cleanup. */
    static void clearFiles(Context context,Bundle workbench) throws IOException {
        checkedReset(context,workbench,true);
    }

    private static void checkedReset(Context context,Bundle workbench,boolean delete) throws IOException {
        try {
            requireResetOwner(workbench);
            Bundle facts=workbench==null?null:closeFacts(workbench.getBundle(RESET_CLOSE));
            int uid=android.os.Process.myUid();
            AtomicWorkbenchTaskShelfStore store=new AtomicWorkbenchTaskShelfStore(context,uid,uid/100000,
                    AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
            store.withResetClear(facts,()->{
                requireResetOwner(workbench);
                if(hasWindowJournal(new File(context.getFilesDir(),"atomic_workbench")) || AtomicWorkbenchProvider.hasLiveEndpoint())
                    throw new IOException("工作台仍有窗口恢复记录或活动接口");
                if(delete) OwnedFileCleaner.clear(context.getFilesDir());
            });
        } catch(IOException refused) { throw refused; }
        catch(Exception unknown) { throw new IOException("工作台最终清除资格尚未核对",unknown); }
    }

    private static void requireResetOwner(Bundle workbench) throws IOException {
        if(!ResetWriteFence.owns() || workbench!=null && (!Boolean.TRUE.equals(workbench.get("success"))
                || !(workbench.get(RESET_GENERATION) instanceof Long)
                || (Long)workbench.get(RESET_GENERATION)!=ResetWriteFence.generation()
                || workbench.containsKey(RESET_CLOSE) && !(workbench.get(RESET_CLOSE) instanceof Bundle)))
            throw new IOException("工作台重置观察身份已变化");
    }

    /** Private same-call close observation. This does not retire or lower the durable high scope. */
    private static Bundle closeFacts(Bundle closed) throws IOException {
        if(closed==null) return null;
        if(!Boolean.TRUE.equals(closed.get("success")) || !Boolean.FALSE.equals(closed.get("recovery_pending"))
                || closed.containsKey("operation_unconfirmed") && !Boolean.FALSE.equals(closed.get("operation_unconfirmed")))
            throw new IOException("工作台关闭仍有未知责任");
        // A legacy endpoint stays compatible for a legacy clean Store, but cannot prove high completion.
        if(!closed.containsKey("recovery_domain") && !closed.containsKey("pool_windows")) return null;
        final java.util.ArrayList<Bundle> owners;
        try { owners=AtomicWorkbenchProtocol.recoveryPoolWindows(closed); }
        catch(RuntimeException malformed) { throw new IOException("工作台完整恢复身份缺失",malformed); }
        for(Bundle owner:owners) {
            requireClosedOwner(owner);
            if(!Boolean.FALSE.equals(owner.get("output_attached"))) throw new IOException("工作台输出仍附着或未知");
        }
        requireClosedOwner(closed.getBundle("recovery_domain").getBundle("legacy"));
        Object rawLegacy=closed.get("legacy_recovery");
        if(!(rawLegacy instanceof Bundle)) throw new IOException("旧工作区完整输出结果缺失");
        Bundle legacy=(Bundle)rawLegacy;
        requireClosedOwner(legacy); // Fixed closed values also bind all sixteen lean facts to this actual result.
        if(!Integer.valueOf(-1).equals(legacy.get("window_id")) || !Boolean.FALSE.equals(legacy.get("output_attached")))
            throw new IOException("旧工作区输出仍附着或未知");
        Object value=closed.get("task_cleanup");
        if(!(value instanceof Bundle)) throw new IOException("任务暂存清理结果缺失");
        Bundle cleanup=(Bundle)value;
        if(!Boolean.TRUE.equals(cleanup.get("success")) || !Boolean.FALSE.equals(cleanup.get("cleanup_pending"))
                || !Boolean.FALSE.equals(cleanup.get("operation_unconfirmed"))
                || !(cleanup.get("store_epoch") instanceof String) || !(cleanup.get("store_revision") instanceof Long)
                || !(cleanup.get("scope_epoch") instanceof String) || !(cleanup.get("scope_phase") instanceof String))
            throw new IOException("任务暂存清理身份未确认");
        Bundle facts=new Bundle();facts.putString("store_epoch",(String)cleanup.get("store_epoch"));
        facts.putLong("store_revision",(Long)cleanup.get("store_revision"));facts.putString("scope_epoch",(String)cleanup.get("scope_epoch"));
        facts.putString("scope_phase",(String)cleanup.get("scope_phase"));return facts;
    }

    private static void requireClosedOwner(Bundle owner) throws IOException {
        if(owner==null || !Boolean.TRUE.equals(owner.get("success")) || !"closed".equals(owner.get("state"))
                || !Integer.valueOf(-1).equals(owner.get("display_id")) || !"".equals(owner.get("window_session"))
                || !"".equals(owner.get("display_name")) || !"".equals(owner.get("display_unique_id"))
                || !Boolean.TRUE.equals(owner.get("output_attached_known"))) throw new IOException("工作台原窗口尚未归还");
        for(String key:java.util.Set.of("recovery_pending","operation_unconfirmed","task_recovery_pending","input_focus_cleanup_pending",
                "guard_cleanup_pending","input_cancel_pending","input_rebind_pending","output_transition_pending"))
            if(!Boolean.FALSE.equals(owner.get(key))) throw new IOException("工作台窗口清理结果未知");
    }

    private static boolean hasJournal(Context context) throws IOException {
        File directory = new File(context.getFilesDir(), "atomic_workbench");
        return hasWindowJournal(directory) || hasTaskResponsibility(context,directory);
    }

    private static boolean hasWindowJournal(File directory) throws IOException {
        if (Files.isSymbolicLink(directory.toPath())) throw new IOException("工作台恢复目录不可用");
        if (!directory.exists()) return false;
        File[] entries = directory.listFiles();
        if (entries == null) throw new IOException("工作台恢复记录无法核对");
        for (File entry : entries) {
            String name = entry.getName();
            // Unknown future slot IDs also block deletion; recovery evidence is never disposable cache.
            if ("recovery.json".equals(name) || name.matches("recovery-window-[0-9]+\\.json")) {
                if (Files.isSymbolicLink(entry.toPath()) || entry.exists()) return true;
            }
        }
        return false;
    }

    /** Shelf PREPARED precedes the window journal; either durable owner must block deletion. */
    private static boolean hasTaskResponsibility(Context context, File directory) throws IOException {
        File shelf = new File(directory, "task-shelf.json");
        if (Files.isSymbolicLink(shelf.toPath())) throw new IOException("任务暂存记录不可用");
        if (!shelf.exists()) return false;
        try {
            int uid = android.os.Process.myUid();
            AtomicWorkbenchTaskShelfStore store = new AtomicWorkbenchTaskShelfStore(context, uid, uid / 100000,
                    AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
            AtomicWorkbenchTaskShelfStore.Snapshot snapshot = store.read();
            // A readable empty high-scope Store is not a complete-drain receipt.
            if (!snapshot.scopeConsistent || snapshot.recoveryScope.requiresHighScopeReader()) return true;
            for (AtomicWorkbenchTaskShelfStore.Record record : snapshot.records)
                if (record.hasResponsibility()) return true;
            return false;
        } catch (Exception unavailable) {
            throw new IOException("任务暂存恢复责任尚未核对，不能清除记录", unavailable);
        }
    }
}
