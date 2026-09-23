package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Bounded batches with an authoritative read after every write, including timeouts. */
final class HideBatchExecutor<T> {
    static final int BATCH_SIZE = 8;
    enum State { VISIBLE, HIDDEN, MISSING, ERROR }

    interface Transport<T> {
        Map<T, State> query(Set<T> targets);
        CommandResult change(Set<T> targets, boolean hide);
    }

    static final class CommandResult {
        final boolean timedOut;
        final String error;
        final boolean stop;
        CommandResult(boolean timedOut, String error) {
            this(timedOut, error, false);
        }
        CommandResult(boolean timedOut, String error, boolean stop) {
            this.timedOut = timedOut;
            this.error = error == null ? "" : error;
            this.stop = stop;
        }
    }

    static final class Outcome<T> {
        final Set<T> success = new LinkedHashSet<>();
        final Map<T, String> failures = new LinkedHashMap<>();
    }

    private final Transport<T> transport;
    HideBatchExecutor(Transport<T> transport) { this.transport = transport; }

    Outcome<T> execute(Set<T> targets, boolean hide) {
        Outcome<T> outcome = new Outcome<>();
        State expected = hide ? State.HIDDEN : State.VISIBLE;
        Map<T, State> before = transport.query(targets);
        Set<T> pending = new LinkedHashSet<>();
        for (T target : targets) {
            State state = before.getOrDefault(target, State.ERROR);
            if (state == expected) outcome.success.add(target);
            else if (state == State.MISSING) outcome.failures.put(target, "目标在该用户中不存在");
            else if (state == State.ERROR) outcome.failures.put(target, "无法确认应用状态，未执行操作");
            else pending.add(target);
        }
        for (int attempt = 1; attempt <= 3 && !pending.isEmpty(); attempt++) {
            Set<T> retry = new LinkedHashSet<>();
            List<T> ordered = new ArrayList<>(pending);
            for (int offset = 0; offset < ordered.size(); offset += BATCH_SIZE) {
                Set<T> batch = new LinkedHashSet<>(ordered.subList(offset,
                        Math.min(offset + BATCH_SIZE, ordered.size())));
                CommandResult result = transport.change(batch, hide);
                // A command exit code alone never establishes package visibility.
                Map<T, State> after = transport.query(batch);
                for (T target : batch) {
                    State actual = after.getOrDefault(target, State.ERROR);
                    if (result.stop) outcome.failures.put(target, result.error);
                    else if (actual == expected) outcome.success.add(target);
                    else if (result.timedOut) outcome.failures.put(target, "PackageManager 操作超时，实际为 " + actual);
                    else if (actual == State.MISSING) outcome.failures.put(target, "目标在该用户中不存在");
                    else if (actual == State.ERROR || attempt == 3) {
                        outcome.failures.put(target, "状态校验失败，实际为 " + actual
                                + (result.error.isEmpty() ? "" : "；" + result.error));
                    } else retry.add(target);
                }
                if (result.timedOut || result.stop) {
                    // Do not queue more writes behind a potentially hung package service.
                    String reason = result.timedOut ? "前序操作超时" : "前序操作未能安全完成";
                    for (int next = offset + batch.size(); next < ordered.size(); next++)
                        outcome.failures.put(ordered.get(next), reason + "，未执行后续目标");
                    for (T target : retry) outcome.failures.put(target, reason + "，停止重试");
                    return outcome;
                }
            }
            pending = retry;
        }
        return outcome;
    }
}
