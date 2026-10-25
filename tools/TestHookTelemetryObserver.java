package ls.augment.com.hook;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.Hooker;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Executable;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import ls.augment.com.hook.HookTelemetryObserver.*;

/** Runs production observation against the real API 102 Chain interface. */
public final class TestHookTelemetryObserver {
    static final Object VALUE = new Object(), RECEIVER = new Object();
    static final Object[] ARGS = { "argument", 7 };
    static final Executable METHOD;
    static { try { METHOD = TestHookTelemetryObserver.class.getDeclaredMethod("target", Object.class); }
        catch (Exception error) { throw new AssertionError(error); } }
    static void target(Object arg) { }
    static final class FakeChain implements Chain {
        final List<Object> args = Arrays.asList(ARGS);
        Throwable failure;
        int called;
        Object receiver;
        Object[] replacement;
        public Executable getExecutable() { return METHOD; }
        public Object getThisObject() { return RECEIVER; }
        public List<Object> getArgs() { return args; }
        public Object getArg(int i) { return args.get(i); }
        public Object proceed() throws Throwable { return call(1, null, null); }
        public Object proceed(Object[] values) throws Throwable { return call(2, null, values); }
        public Object proceedWith(Object self) throws Throwable { return call(3, self, null); }
        public Object proceedWith(Object self, Object[] values) throws Throwable { return call(4, self, values); }
        private Object call(int entry, Object self, Object[] values) throws Throwable {
            called = entry; receiver = self; replacement = values;
            if (failure != null) throw failure;
            return VALUE;
        }
    }
    static ErrorRecorder recorder(StackBudget budget) {
        return new ErrorRecorder() {
            public StackResult capture(Throwable error) { return budget.capture(error); }
            public void firstFailure(Counter counter, ErrorRecord error) { }
        };
    }
    static final ErrorRecorder NO_STACK = recorder(new StackBudget(0, 4096));
    static Hooker observed(Hooker hooker, Counter counter) {
        return HookTelemetryObserver.observe(hooker, counter, () -> 12345L, NO_STACK);
    }
    static Object proceed(Chain chain, int entry) throws Throwable {
        switch (entry) {
            case 1: return chain.proceed();
            case 2: return chain.proceed(ARGS);
            case 3: return chain.proceedWith(RECEIVER);
            case 4: return chain.proceedWith(RECEIVER, ARGS);
            default: throw new AssertionError();
        }
    }
    static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    static void throwsSame(Hooker hook, FakeChain chain, Throwable expected) throws Throwable {
        try { hook.intercept(chain); throw new AssertionError("expected exception"); }
        catch (Throwable actual) { require(actual == expected, "exception identity changed: " + actual); }
    }
    static void testDelegation() throws Throwable {
        for (int entry = 1; entry <= 4; entry++) {
            FakeChain chain = new FakeChain(); Counter counter = new Counter("entry-" + entry);
            final int selected = entry;
            Hooker hook = observed(c -> {
                require(c.getExecutable() == METHOD && c.getThisObject() == RECEIVER, "metadata identity");
                require(c.getArgs() == chain.args && c.getArg(0) == ARGS[0], "arguments identity");
                return proceed(c, selected);
            }, counter);
            require(hook.intercept(chain) == VALUE, "result identity");
            require(chain.called == entry, "wrong proceed overload");
            require(chain.receiver == (entry >= 3 ? RECEIVER : null), "receiver changed");
            require(chain.replacement == (entry == 2 || entry == 4 ? ARGS : null), "args copied or changed");
            require(counter.hits.get() == 1 && counter.returned.get() == 1 && counter.failures().total == 0, "success counters");
            Throwable failure = new SecurityException("DETECT_SCREEN_CAPTURE"); chain.failure = failure;
            throwsSame(hook, chain, failure);
            Failures errors = counter.failures();
            require(errors.total == 1 && errors.proceed == 1 && errors.module == 0, "downstream attributed to module");
            require(errors.last.source == ErrorSource.PROCEED_CHAIN && errors.last.at == 12345, "failure event metadata");
        }
        Counter getters = new Counter("getter-error"); FakeChain chain = new FakeChain();
        try { observed(c -> c.getArg(9), getters).intercept(chain); throw new AssertionError(); }
        catch (IndexOutOfBoundsException expected) { }
        require(getters.failures().module == 1, "getter call failure classification");
    }
    static void testModuleAndHandledFailures() throws Throwable {
        FakeChain chain = new FakeChain(); Throwable upstream = new SecurityException("system-permission");
        Throwable module = new IllegalStateException("finally-module"); chain.failure = upstream;
        Counter counter = new Counter("finally");
        throwsSame(observed(c -> { try { return c.proceed(); } finally { throw module; } }, counter), chain, module);
        require(counter.failures().module == 1 && counter.failures().proceed == 0, "finally exception misattributed");
        Counter before = new Counter("before");
        throwsSame(observed(c -> { throw module; }, before), chain, module);
        require(before.failures().module == 1, "pre-proceed module failure");
        Counter caught = new Counter("caught");
        require(observed(c -> { try { c.proceed(); } catch (SecurityException ignored) { } return VALUE; }, caught)
                .intercept(chain) == VALUE, "handled downstream error altered return");
        require(caught.returned.get() == 1 && caught.failures().total == 0, "handled downstream counted as escaping failure");
        Counter earlier = new Counter("earlier-proceed"); Throwable second = new IllegalArgumentException("second");
        throwsSame(observed(c -> {
            try { c.proceed(); } catch (Throwable ignored) { }
            chain.failure = second;
            try { c.proceedWith(RECEIVER, ARGS); } catch (Throwable ignored) { }
            chain.failure = null; c.proceed(); throw upstream;
        }, earlier), chain, upstream);
        require(earlier.failures().proceed == 1, "earlier downstream exception lost after later proceed");
        Counter badRecorder = new Counter("capture-fails"); chain.failure = upstream;
        ErrorRecorder broken = new ErrorRecorder() {
            public StackResult capture(Throwable error) { throw new AssertionError("capture"); }
            public void firstFailure(Counter counter, ErrorRecord error) { throw new AssertionError("logger"); }
        };
        throwsSame(HookTelemetryObserver.observe(Chain::proceed, badRecorder, () -> 1L, broken), chain, upstream);
        require(badRecorder.failures().last.stackState.equals("CAPTURE_FAILED"), "capture failure not identified");
    }
    static void testRecordsAndBudget() throws Throwable {
        StackBudget budget = new StackBudget(1, 256); Counter counter = new Counter("records");
        ErrorRecorder capture = recorder(budget); FakeChain chain = new FakeChain();
        Throwable first = new SecurityException("first-message"), last = new IllegalStateException("last-message");
        throwsSame(HookTelemetryObserver.observe(c -> { throw first; }, counter, () -> 10L, capture), chain, first);
        Failures saved = counter.failures(); ErrorRecord firstRecord = saved.first;
        throwsSame(HookTelemetryObserver.observe(c -> { throw last; }, counter, () -> 20L, capture), chain, last);
        Failures now = counter.failures();
        require(saved.total == 1 && saved.last == firstRecord && now.first == firstRecord, "record mutated in place");
        require(now.last.at == 20 && now.first.at == 10 && now.last.sequence == 2, "first/last event times");
        require(now.first.stack.contains("first-message") && now.last.summary.contains("last-message"), "wrong event text");
        require(now.last.stack.isEmpty() && now.last.stackState.equals("BUDGET_EXHAUSTED"), "old stack reused on new error");
        require(budget.used() == 1 && now.first.stack.length() <= 256, "stack budget or bound exceeded");
        counter.registrationFailed(last, 30, capture);
        require(counter.failures().total == 2 && counter.registrationError().at == 30
                && counter.registrationError().source == ErrorSource.REGISTRATION, "registration mixed into callback counts");
    }
    static void testReentry() throws Throwable {
        Counter counter = new Counter("reentrant"); FakeChain outer = new FakeChain(), inner = new FakeChain();
        Throwable downstream = new SecurityException("inner"), module = new IllegalStateException("outer");
        inner.failure = downstream;
        Hooker nested = observed(Chain::proceed, counter);
        throwsSame(observed(c -> {
            try { nested.intercept(inner); } catch (SecurityException expected) { }
            require(c.getThisObject() == RECEIVER, "outer chain state overwritten by reentry");
            c.proceed(); throw module;
        }, counter), outer, module);
        Failures errors = counter.failures();
        require(errors.total == 2 && errors.proceed == 1 && errors.module == 1, "nested origins mixed");
        require(counter.hits.get() == 2 && errors.first.summary.contains("inner")
                && errors.last.summary.contains("outer"), "nested ordering mixed");
    }
    static void testConcurrency() throws Exception {
        Counter counter = new Counter("concurrent"); StackBudget budget = new StackBudget(8, 256);
        ErrorRecorder capture = recorder(budget); CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>(); Thread[] workers = new Thread[8];
        final int repeats = 1000;
        for (int t = 0; t < workers.length; t++) {
            final int id = t;
            workers[t] = new Thread(() -> {
                try {
                    start.await(); FakeChain chain = new FakeChain();
                    Throwable error = id % 2 == 0 ? new SecurityException("chain-" + id) : new IllegalStateException("module-" + id);
                    if (id % 2 == 0) chain.failure = error;
                    Hooker callback = id % 2 == 0 ? Chain::proceed : c -> { throw error; };
                    Hooker hook = HookTelemetryObserver.observe(callback, counter, System::currentTimeMillis, capture);
                    for (int i = 0; i < repeats; i++) {
                        throwsSame(hook, chain, error);
                        Failures snapshot = counter.failures();
                        require(snapshot.total == snapshot.module + snapshot.proceed, "inconsistent publication counts");
                        require(snapshot.first.sequence == 1 && snapshot.last.sequence == snapshot.total, "torn event publication");
                        require(snapshot.last.summary.startsWith(snapshot.last.source == ErrorSource.PROCEED_CHAIN
                                ? "java.lang.SecurityException:chain-" : "java.lang.IllegalStateException:module-"), "source/text from different events");
                    }
                } catch (Throwable error) { failure.compareAndSet(null, error); }
            }); workers[t].start();
        }
        start.countDown(); for (Thread worker : workers) worker.join();
        if (failure.get() != null) throw new AssertionError("concurrency failure", failure.get());
        Failures errors = counter.failures();
        require(errors.total == 8000 && errors.module == 4000 && errors.proceed == 4000, "lost concurrent failures");
        require(counter.hits.get() == 8000 && counter.returned.get() == 0, "concurrent call counters");
        require(budget.used() == 8 && errors.last.stack.isEmpty(), "concurrent stack budget exceeded");
    }
    static long benchmark(Hooker hook, FakeChain chain, int repeats) throws Throwable {
        long start = System.nanoTime();
        for (int i = 0; i < repeats; i++) require(hook.intercept(chain) == VALUE, "benchmark result");
        return System.nanoTime() - start;
    }
    static void benchmark() throws Throwable {
        FakeChain chain = new FakeChain(); Counter counter = new Counter("benchmark");
        Hooker plain = Chain::proceed, hook = HookTelemetryObserver.observe(plain, counter, System::currentTimeMillis, NO_STACK);
        benchmark(plain, chain, 300000); benchmark(hook, chain, 300000);
        int repeats = 2000000;
        com.sun.management.ThreadMXBean bean = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
        boolean allocated = bean.isThreadAllocatedMemorySupported();
        if (allocated && !bean.isThreadAllocatedMemoryEnabled()) bean.setThreadAllocatedMemoryEnabled(true);
        long thread = Thread.currentThread().getId();
        long baseline = benchmark(plain, chain, repeats);
        long before = allocated ? bean.getThreadAllocatedBytes(thread) : 0;
        long observed = benchmark(hook, chain, repeats);
        long bytes = allocated ? bean.getThreadAllocatedBytes(thread) - before : -1;
        System.out.printf("HotSpot successful callbacks: baseline %.1f ns/call, observed %.1f ns/call, allocation %.1f bytes/call (not device performance)\n",
                baseline / (double) repeats, observed / (double) repeats, bytes < 0 ? -1 : bytes / (double) repeats);
        require(counter.failures().total == 0, "normal callback captured errors");
    }
    public static void main(String[] args) throws Throwable {
        testDelegation(); testModuleAndHandledFailures(); testRecordsAndBudget(); testReentry(); testConcurrency(); testSameEvent(); benchmark();
        System.out.println("HookTelemetryObserver tests passed: real API 102 delegation, identity, attribution, bounded records, reentry, concurrency");
    }
    static void testSameEvent() throws Throwable {
        StackBudget budget=new StackBudget(8,2048);int[] logged={0};
        ErrorRecorder recorder=new ErrorRecorder(){public StackResult capture(Throwable error){return budget.capture(error);}
            public void firstFailure(Counter c,ErrorRecord e){logged[0]++;}};
        Counter a=new Counter("outer"),b=new Counter("middle"),c=new Counter("inner");
        FakeChain chain=new FakeChain();Throwable original=new SecurityException("native denial");chain.failure=original;
        Hooker inner=HookTelemetryObserver.observe(Chain::proceed,c,()->1L,recorder);
        Hooker middle=HookTelemetryObserver.observe(inner,b,()->1L,recorder);
        Hooker outer=HookTelemetryObserver.observe(middle,a,()->1L,recorder);
        throwsSame(outer,chain,original);
        require(a.failures().total==1&&b.failures().total==1&&c.failures().total==1,"per-hook counters retained");
        require(a.failures().last.eventId==c.failures().last.eventId&&b.failures().last.eventId==c.failures().last.eventId,"one throwable has one event identity");
        require(budget.used()==1&&logged[0]==1,"one stack and one log across nested observers");
        require(a.failures().last.duplicate&&a.failures().last.stack.isEmpty(),"duplicate uses explicit event reference");
        long previous=c.failures().last.eventId;throwsSame(outer,chain,original);
        require(c.failures().last.eventId!=previous&&budget.used()==2,"subsequent invocation is a distinct event");
    }
}
