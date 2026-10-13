package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Private provider bridge: native tint callbacks only read an immutable memory snapshot. */
final class ExtraDimOwnershipClient {
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "LSA-ExtraDimOwnership"); thread.setDaemon(true); return thread;
    });
    private static volatile Binding current;
    static final class State {
        static final State EMPTY = new State(false, false, 50);
        final boolean owned, active;
        final int strength;
        State(boolean owned, boolean active, int strength) { this.owned = owned; this.active = active; this.strength = strength; }
        boolean same(State other) { return owned == other.owned && active == other.active && strength == other.strength; }
    }
    private static final class Binding {
        final Context context; final int user; final Handler handler; final java.util.function.Consumer<Boolean> changed;
        final AtomicBoolean queued = new AtomicBoolean();
        final AtomicLong invalidations = new AtomicLong();
        volatile State state = State.EMPTY;
        volatile boolean loaded;
        volatile long retryAfter;
        ContentObserver observer; int failures;
        Binding(Context context, int user, Handler handler, java.util.function.Consumer<Boolean> changed) {
            this.context = context; this.user = user; this.handler = handler; this.changed = changed;
        }
    }
    private ExtraDimOwnershipClient() { }

    static State peek(Context context, int user, Handler handler, java.util.function.Consumer<Boolean> changed) {
        if (user < 0 || handler == null) return State.EMPTY;
        Binding binding = current;
        if (binding == null || binding.user != user || binding.handler != handler) synchronized (ExtraDimOwnershipClient.class) {
            binding = current;
            if (binding == null || binding.user != user || binding.handler != handler) {
                Binding previous = binding;
                binding = new Binding(context, user, handler, changed);
                current = binding;
                if (previous != null) WORKER.execute(() -> unregister(previous));
            }
        }
        if (!binding.loaded && System.nanoTime() >= binding.retryAfter) schedule(binding, 0);
        return binding.state;
    }

    private static void schedule(Binding binding, long delay) {
        if (current == binding && binding.queued.compareAndSet(false, true))
            WORKER.schedule(() -> refresh(binding), delay, TimeUnit.MILLISECONDS);
    }
    private static void unregister(Binding binding) {
        if (binding.observer != null) try { binding.context.getContentResolver().unregisterContentObserver(binding.observer); }
        catch (RuntimeException ignored) { }
        binding.observer = null;
    }
    private static Uri privateUri(Binding binding, String suffix) {
        return Uri.parse("content://" + binding.user + "@ls.augment.com.config" + suffix);
    }
    private static void observe(Binding binding) {
        if (binding.observer != null) return;
        ContentObserver observer = new ContentObserver(binding.handler) {
            @Override public void onChange(boolean selfChange) { binding.invalidations.incrementAndGet(); schedule(binding, 0); }
        };
        try {
            binding.context.getContentResolver().registerContentObserver(privateUri(binding, "/extra-dim-ownership"), false, observer);
            for (String key : new String[]{"reduce_bright_colors_activated", "reduce_bright_colors_level"})
                binding.context.getContentResolver().registerContentObserver(
                        Uri.parse("content://" + binding.user + "@settings/secure/" + key), false, observer);
            binding.observer = observer;
        } catch (RuntimeException failure) {
            try { binding.context.getContentResolver().unregisterContentObserver(observer); } catch (RuntimeException ignored) { }
            throw failure;
        }
    }
    private static String nativeValue(Binding binding, String key) {
        Bundle args = new Bundle(); args.putInt("_user", binding.user);
        Bundle result = binding.context.getContentResolver().call(Uri.parse("content://settings"), "GET_secure", key, args);
        return result == null ? null : result.getString("value");
    }
    private static void refresh(Binding binding) {
        long observedGeneration = binding.invalidations.get();
        boolean retry = false;
        try {
            if (current != binding) return;
            observe(binding);
            Bundle result = binding.context.getContentResolver().call(privateUri(binding, ""), "extra_dim_ownership", null, null);
            if (result == null || !result.getBoolean("ok", false) || result.getInt("user", -1) != binding.user)
                throw new IllegalStateException("ownership unavailable");
            State next = State.EMPTY;
            if (result.getBoolean("owned", false)) {
                String active = nativeValue(binding, "reduce_bright_colors_activated");
                String strength = nativeValue(binding, "reduce_bright_colors_level");
                if (!("0".equals(active) || "1".equals(active)) || strength == null || !strength.matches("[0-9]{1,3}"))
                    throw new IllegalStateException("invalid native request");
                int amount = Integer.parseInt(strength);
                if (amount > 100) throw new IllegalStateException("invalid native strength");
                next = new State(true, "1".equals(active), amount);
            }
            binding.failures = 0; binding.loaded = true;
            publish(binding, next);
        } catch (RuntimeException unavailable) {
            binding.loaded = false;
            binding.retryAfter = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            publish(binding, State.EMPTY);
            retry = ++binding.failures <= 3;
        } finally {
            binding.queued.set(false);
            if (binding.invalidations.get() != observedGeneration) schedule(binding, 0);
            else if (retry) schedule(binding, 500L * binding.failures);
        }
    }
    private static void publish(Binding binding, State next) {
        if (current != binding || binding.state.same(next)) return;
        binding.state = next;
        binding.handler.post(() -> {
            if (current == binding && binding.state == next) binding.changed.accept(next.owned);
        });
    }
}
