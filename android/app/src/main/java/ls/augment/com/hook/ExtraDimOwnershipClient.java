package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Private provider bridge: native tint callbacks only read an immutable memory snapshot. */
final class ExtraDimOwnershipClient {
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "LSA-ExtraDimOwnership"); thread.setDaemon(true); return thread;
    });

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
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
        long appliedGeneration;
        volatile State state = State.EMPTY;
        volatile boolean loaded;
        volatile long retryAfter;
        volatile long checkedAt;
        long reconcileAfter;
        ScheduledFuture<?> scheduled;
        long scheduledAt,scheduledId;
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
        long now=System.nanoTime();
        // A missed provider/Settings notification must not leave a successful
        // snapshot frozen forever. Reads remain off the native callback thread.
        if ((!binding.loaded && now >= binding.retryAfter)
                || binding.loaded && now-binding.checkedAt>=TimeUnit.SECONDS.toNanos(5)) schedule(binding, 0);
        return binding.state;
    }

    static String evidence() {
        Binding b=current;
        return b==null?"ownership=unbound":"ownership="+(b.loaded?"ready":"unavailable")+";requestUser="+b.user
                +";requestAgeMs="+(b.checkedAt==0?-1:TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-b.checkedAt))
                +";generation="+b.invalidations.get();
    }

    static void reconcile(int user,Handler handler) {
        Binding b=current;
        if(b==null||b.user!=user||b.handler!=handler||!b.loaded||!b.state.owned)return;
        synchronized(b){
            long now=System.nanoTime();
            if(now<b.reconcileAfter)return;
            b.reconcileAfter=now+TimeUnit.SECONDS.toNanos(5);
            b.invalidations.incrementAndGet();
        }
        FeatureRuntimeLog.event("EXTRA_DIM_RECONCILE","user="+user+";action=reread_native_request");
        schedule(b,0);
    }

    private static void schedule(Binding binding, long delay) {
        synchronized(binding){
            if(current!=binding)return;
            long at=System.nanoTime()+TimeUnit.MILLISECONDS.toNanos(delay);
            if(binding.queued.get()){
                // A real user notification preempts low-frequency outage retry.
                // An executing read is replayed by its invalidation generation.
                if(binding.scheduled==null||at>=binding.scheduledAt)return;
                binding.scheduled.cancel(false);
            }
            binding.queued.set(true);binding.scheduledAt=at;long id=++binding.scheduledId;
            binding.scheduled=WORKER.schedule(()->{
                synchronized(binding){if(id!=binding.scheduledId)return;binding.scheduled=null;}
                refresh(binding);
            },delay,TimeUnit.MILLISECONDS);
        }
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
            @Override public void onChange(boolean selfChange) {
                binding.invalidations.incrementAndGet();
                FeatureRuntimeLog.event("EXTRA_DIM_NOTIFY","user="+binding.user+";generation="+binding.invalidations.get());
                schedule(binding, 0);
            }
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
            if (observedGeneration != binding.invalidations.get()) return;
            binding.failures = 0; binding.loaded = true; binding.checkedAt=System.nanoTime();
            String detail="user="+binding.user+";owned="+next.owned+";requested="+next.active+";strength="+next.strength;
            FeatureRuntimeLog.state("EXTRA_DIM_REQUEST",detail,detail+";generation="+observedGeneration);
            publish(binding, next, next.owned && observedGeneration != binding.appliedGeneration);
            binding.appliedGeneration = observedGeneration;
        } catch (RuntimeException unavailable) {
            FeatureRuntimeLog.event("EXTRA_DIM_REQUEST_ERROR","user="+binding.user+";exception="+FeatureRuntimeLog.failure(unavailable));
            binding.loaded = false;
            binding.retryAfter = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            publish(binding, State.EMPTY, false);
            binding.failures++;retry=true;
        } finally {
            binding.queued.set(false);
            if (binding.invalidations.get() != observedGeneration) schedule(binding, 0);
            else if (retry) schedule(binding, binding.failures<=3?500L*binding.failures:30_000L);
        }
    }
    private static void publish(Binding binding, State next, boolean reapply) {
        if (current != binding || (!reapply && binding.state.same(next))) return;
        binding.state = next;
        binding.handler.post(() -> {
            if (current == binding && binding.state == next) binding.changed.accept(next.owned);
        });
    }
}
