package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Durable hide attempts and observations; neither establishes exclusive ownership. */
final class HideMutationRecorder<T> {
    interface Transport<T> {
        Map<T, HideBatchExecutor.State> query(Set<T> targets);
        Preparation<T> prepare(Set<T> targets);
        RootShell.Result persist(List<HideRecoveryJournal.Entry> entries);
        String revalidate(Map<T, HideRecoveryJournal.Entry> entries);
        RootShell.Result hide(Set<T> targets);
    }

    static final class Preparation<T> {
        final Map<T, HideRecoveryJournal.Entry> entries;
        final String error;
        Preparation(Map<T, HideRecoveryJournal.Entry> entries, String error) {
            this.entries = Collections.unmodifiableMap(new LinkedHashMap<>(entries));
            this.error = error == null ? "" : error;
        }
        static <T> Preparation<T> failure(String error) {
            return new Preparation<>(Collections.emptyMap(), error);
        }
    }

    private final Transport<T> transport;
    HideMutationRecorder(Transport<T> transport) { this.transport = transport; }

    HideBatchExecutor.CommandResult hide(Set<T> requested) {
        Set<T> pending = new LinkedHashSet<>();
        Preparation<T> preparation;
        try {
            Map<T, HideBatchExecutor.State> before = transport.query(requested);
            for (T target : requested) {
                HideBatchExecutor.State state = before.getOrDefault(target, HideBatchExecutor.State.ERROR);
                // A pre-existing hidden state must never acquire a module record.
                if (state == HideBatchExecutor.State.HIDDEN) continue;
                if (state != HideBatchExecutor.State.VISIBLE)
                    return stop("隐藏前状态无法确认，未执行隐藏");
                pending.add(target);
            }
            if (pending.isEmpty()) return new HideBatchExecutor.CommandResult(false, "");
            preparation = transport.prepare(pending);
            if (!preparation.error.isEmpty()) return stop(preparation.error);
            if (!preparation.entries.keySet().equals(pending))
                return stop("隐藏准备记录不完整，未执行隐藏");
            for (HideRecoveryJournal.Entry entry : preparation.entries.values())
                if (entry == null || entry.stage != HideRecoveryJournal.Stage.PREPARED)
                    return stop("隐藏准备记录无效，未执行隐藏");
            RootShell.Result saved = transport.persist(new ArrayList<>(preparation.entries.values()));
            if (!saved.isSuccess()) return stop("隐藏准备记录保存失败，未执行隐藏：" + saved.publicError());
            // This narrows the race but is not a PackageManager compare-and-set.
            String changed = transport.revalidate(preparation.entries);
            if (changed == null || !changed.isEmpty())
                return stop("应用身份无法再次确认，未执行隐藏；已保留准备记录");
            Map<T, HideBatchExecutor.State> ready = transport.query(pending);
            for (T target : pending)
                if (ready.getOrDefault(target, HideBatchExecutor.State.ERROR) != HideBatchExecutor.State.VISIBLE)
                    return stop("应用状态已变化，未执行隐藏；已保留准备记录");
        } catch (RuntimeException error) {
            return stop("无法完成隐藏准备，未执行隐藏；已有记录保持不变");
        }

        RootShell.Result command;
        try { command = transport.hide(pending); }
        catch (RuntimeException error) {
            // The process may have started before the transport failed.
            command = new RootShell.Result(-1, "隐藏命令结果未知", true);
        }
        if (command == null) command = new RootShell.Result(-1, "隐藏命令结果未知", true);
        Map<T, HideBatchExecutor.State> after = Collections.emptyMap();
        boolean identityVerified = false;
        try {
            String identity = transport.revalidate(preparation.entries);
            identityVerified = identity != null && identity.isEmpty();
            if (identityVerified) after = transport.query(pending);
        } catch (RuntimeException ignored) { }
        if (after == null) after = Collections.emptyMap();
        List<HideRecoveryJournal.Entry> observations = new ArrayList<>();
        // A later state snapshot cannot prove that a failed or timed-out command
        // completed this attempt. Keep its evidence and never prepare a retry.
        boolean unknown = !identityVerified || !command.isSuccess();
        for (Map.Entry<T, HideRecoveryJournal.Entry> entry : preparation.entries.entrySet()) {
            HideBatchExecutor.State state = after.getOrDefault(entry.getKey(), HideBatchExecutor.State.ERROR);
            unknown |= state != HideBatchExecutor.State.HIDDEN;
            observations.add(entry.getValue().observed(state.name(), command.exitCode, command.timedOut));
        }
        try {
            RootShell.Result saved = transport.persist(observations);
            if (!saved.isSuccess()) return stop("隐藏已尝试，但结果记录保存失败；已保留准备记录：" + saved.publicError());
        } catch (RuntimeException error) {
            return stop("隐藏已尝试，但结果记录未确认；已保留准备记录");
        }
        if (unknown) return new HideBatchExecutor.CommandResult(command.timedOut,
                "隐藏结果或应用身份未确认，已保留准备和观察记录，停止后续操作", true);
        return new HideBatchExecutor.CommandResult(command.timedOut,
                command.isSuccess() ? "" : command.publicError());
    }

    private static HideBatchExecutor.CommandResult stop(String message) {
        return new HideBatchExecutor.CommandResult(false, message, true);
    }
}
