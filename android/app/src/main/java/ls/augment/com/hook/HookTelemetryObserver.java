package ls.augment.com.hook;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.Hooker;
import java.lang.reflect.Executable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.LongSupplier;

/** Observation only: never wraps, swallows, or replaces a callback's result or exception. */
final class HookTelemetryObserver {
    private static final AtomicLong EVENTS = new AtomicLong();
    private static final ThreadLocal<Invocation> INVOCATION = new ThreadLocal<>();
    private static final class Invocation {
        int depth;
        java.util.IdentityHashMap<Throwable, ErrorRecord> errors;
    }
    enum ErrorSource { MODULE_CALLBACK, PROCEED_CHAIN, REGISTRATION }

    interface ErrorRecorder {
        StackResult capture(Throwable error);
        void firstFailure(Counter counter, ErrorRecord error);
    }

    static Hooker observe(Hooker hooker, Counter counter, LongSupplier clock, ErrorRecorder recorder) {
        return chain -> {
            Invocation invocation = INVOCATION.get();
            if (invocation == null) { invocation = new Invocation(); INVOCATION.set(invocation); }
            invocation.depth++;
            counter.hits.incrementAndGet();
            counter.lastHit = clock.getAsLong();
            // One invocation owns its proxy. Reusing a proxy would change the semantics of
            // a retained Chain and can mix nested or concurrent callbacks' exception origins.
            ObservedChain observed = new ObservedChain(chain);
            try {
                Object value = hooker.intercept(observed);
                counter.returned.incrementAndGet();
                return value;
            } catch (Throwable error) {
                try {
                    counter.failed(observed.propagated(error) ? ErrorSource.PROCEED_CHAIN
                            : ErrorSource.MODULE_CALLBACK, error, clock.getAsLong(), recorder);
                } catch (Throwable ignored) {
                    // Diagnostic capture must not replace the original error, even if a
                    // vendor Throwable or logging implementation fails while being read.
                }
                throw error;
            } finally {
                if (--invocation.depth == 0 && invocation.errors != null) invocation.errors.clear();
            }
        };
    }

    private static final class ObservedChain implements Chain {
        private final Chain delegate;
        private Throwable firstFailure;
        // Only allocate this on the rare path with distinct failures from multiple proceeds.
        private List<Throwable> otherFailures;

        ObservedChain(Chain delegate) { this.delegate = delegate; }
        public Executable getExecutable() { return delegate.getExecutable(); }
        public Object getThisObject() { return delegate.getThisObject(); }
        public List<Object> getArgs() { return delegate.getArgs(); }
        public Object getArg(int index) { return delegate.getArg(index); }
        public Object proceed() throws Throwable {
            try { return delegate.proceed(); }
            catch (Throwable error) { remember(error); throw error; }
        }
        public Object proceed(Object[] args) throws Throwable {
            try { return delegate.proceed(args); }
            catch (Throwable error) { remember(error); throw error; }
        }
        public Object proceedWith(Object receiver) throws Throwable {
            try { return delegate.proceedWith(receiver); }
            catch (Throwable error) { remember(error); throw error; }
        }
        public Object proceedWith(Object receiver, Object[] args) throws Throwable {
            try { return delegate.proceedWith(receiver, args); }
            catch (Throwable error) { remember(error); throw error; }
        }
        private void remember(Throwable error) {
            try {
                if (firstFailure == null) firstFailure = error;
                else if (!propagated(error)) {
                    if (otherFailures == null) otherFailures = new ArrayList<>(2);
                    otherFailures.add(error);
                }
            } catch (Throwable ignored) {
                // Allocation failure must not change the downstream exception object.
            }
        }
        boolean propagated(Throwable error) {
            if (firstFailure == error) return true;
            if (otherFailures != null) for (Throwable seen : otherFailures) if (seen == error) return true;
            return false;
        }
    }

    static final class Counter {
        final String target;
        final AtomicLong hits = new AtomicLong(), returned = new AtomicLong();
        volatile long lastHit;
        volatile String state = "PENDING";
        private volatile Failures failures = new Failures(0, 0, 0, null, null);
        private volatile ErrorRecord registrationError;

        Counter(String target) { this.target = target; }
        Failures failures() { return failures; }
        ErrorRecord registrationError() { return registrationError; }
        synchronized void clearHistory(long cutoff){
            hits.set(0);returned.set(0);lastHit=0;failures=new Failures(0,0,0,null,null);
            if(registrationError!=null&&registrationError.at<=cutoff)registrationError=null;
        }
        synchronized void failed(ErrorSource source, Throwable error, long at, ErrorRecorder recorder) {
            Failures old = failures;
            ErrorRecord record = record(source, error, at, old.total + 1, recorder);
            failures = new Failures(old.total + 1,
                    old.module + (source == ErrorSource.MODULE_CALLBACK ? 1 : 0),
                    old.proceed + (source == ErrorSource.PROCEED_CHAIN ? 1 : 0),
                    old.first == null ? record : old.first, record);
            if (old.total == 0 && !record.duplicate) {
                try { recorder.firstFailure(this, record); } catch (Throwable ignored) { }
            }
        }
        void registrationFailed(Throwable error, long at, ErrorRecorder recorder) {
            try { registrationError = record(ErrorSource.REGISTRATION, error, at, 0, recorder); }
            catch (Throwable ignored) { }
            state = "REGISTRATION_FAILED";
        }
        private static ErrorRecord record(ErrorSource source, Throwable error, long at, long sequence,
                ErrorRecorder recorder) {
            String summary = summary(error);
            Invocation invocation = INVOCATION.get();
            ErrorRecord previous = invocation == null || invocation.errors == null ? null : invocation.errors.get(error);
            if (previous != null) return new ErrorRecord(source, at, sequence, summary, "",
                    "SAME_EVENT", previous.eventId, true);
            StackResult stack;
            try { stack = recorder.capture(error); }
            catch (Throwable ignored) { stack = new StackResult("", "CAPTURE_FAILED"); }
            ErrorRecord record = new ErrorRecord(source, at, sequence, summary, stack.text, stack.state,
                    EVENTS.incrementAndGet(), false);
            if (invocation != null && invocation.depth > 0) {
                if(invocation.errors==null)invocation.errors=new java.util.IdentityHashMap<>();
                invocation.errors.put(error, record);
            }
            return record;
        }
    }

    /** One immutable publication keeps counts and both records from the same error event. */
    static final class Failures {
        final long total, module, proceed;
        final ErrorRecord first, last;
        Failures(long total, long module, long proceed, ErrorRecord first, ErrorRecord last) {
            this.total = total; this.module = module; this.proceed = proceed;
            this.first = first; this.last = last;
        }
    }
    static final class ErrorRecord {
        final ErrorSource source;
        final long at, sequence;
        final long eventId;
        final boolean duplicate;
        final String summary, stack, stackState;
        ErrorRecord(ErrorSource source, long at, long sequence, String summary, String stack, String stackState,
                long eventId, boolean duplicate) {
            this.source = source; this.at = at; this.sequence = sequence;
            this.eventId = eventId; this.duplicate = duplicate;
            this.summary = summary; this.stack = stack; this.stackState = stackState;
        }
    }
    static final class StackResult {
        final String text, state;
        StackResult(String text, String state) { this.text = text; this.state = state; }
    }

    /** Global, capped stack budget; an uncaptured event never borrows an older event's stack. */
    static final class StackBudget {
        private final int limit, maxChars;
        private final AtomicInteger used = new AtomicInteger();
        StackBudget(int limit, int maxChars) { this.limit = Math.max(0, limit); this.maxChars = Math.max(128, maxChars); }
        int used() { return used.get(); }
        void clearHistory(){used.set(0);}
        StackResult capture(Throwable error) {
            int count;
            do {
                count = used.get();
                if (count >= limit) return new StackResult("", "BUDGET_EXHAUSTED");
            } while (!used.compareAndSet(count, count + 1));
            StringBuilder text = new StringBuilder(Math.min(1024, maxChars));
            boolean truncated = false;
            Throwable current = error;
            // Bound causes, frames and output; suppressed exceptions are counted, not traversed.
            for (int cause = 0; current != null && cause < 4; cause++) {
                if (cause > 0) append(text, "Caused by: ", maxChars);
                append(text, summary(current) + "\n", maxChars);
                StackTraceElement[] frames = current.getStackTrace();
                for (int i = 0; i < Math.min(64, frames.length); i++) {
                    append(text, "\tat " + frames[i] + "\n", maxChars);
                    if (text.length() >= maxChars) { truncated = true; break; }
                }
                if (frames.length > 64) { append(text, "\t[additional frames omitted]\n", maxChars); truncated = true; }
                int suppressed = current.getSuppressed().length;
                if (suppressed > 0) { append(text, "\t[" + suppressed + " suppressed exceptions omitted]\n", maxChars); truncated = true; }
                Throwable next = current.getCause();
                if (next == current) { truncated = true; break; }
                current = next;
                if (text.length() >= maxChars) { truncated = true; break; }
            }
            if (current != null) truncated = true;
            return new StackResult(text.toString(), truncated ? "CAPTURED_TRUNCATED" : "CAPTURED");
        }
        private static void append(StringBuilder out, String value, int max) {
            int remaining = max - out.length();
            if (remaining > 0) out.append(value, 0, Math.min(remaining, value.length()));
        }
    }
    private static String summary(Throwable error) {
        String message;
        try { message = String.valueOf(error.getMessage()); }
        catch (Throwable ignored) { message = "[message unavailable]"; }
        if (message.length() > 512) message = message.substring(0, 512) + " [TRUNCATED]";
        return error.getClass().getName() + ":" + message;
    }
}
