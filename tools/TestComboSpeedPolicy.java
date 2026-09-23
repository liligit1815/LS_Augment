package ls.augment.com.hook;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;

public final class TestComboSpeedPolicy {
    private static final String SOURCE_PATH = "/owned/macro9.json";
    private static final String PACKAGE_NAME = "ls.augment.regression.game";

    public static void main(String[] args) throws Exception {
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 1.0f), "1x");
        check(3273L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 2.0f), "2x");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(3273L, 2.0f, 1.0f), "restore OEM 2x to 1x");
        check(1637L, ComboSpeedPolicy.adjustRecoveryTime(3273L, 2.0f, 4.0f), "OEM 2x to 4x");
        check(655L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, 10.0f), "10x");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 0.0f, 2.0f), "invalid original rate");
        check(6546L, ComboSpeedPolicy.adjustRecoveryTime(6546L, 1.0f, Float.NaN), "invalid target rate");
        check(304367L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, 4.0f), "4x motion timestamp");
        check(303907L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, 10.0f), "10x motion timestamp");
        check(303600L, ComboSpeedPolicy.scaleTimestamp(
                303600L, 303600L, 4.0f), "motion origin");
        check(306669L, ComboSpeedPolicy.scaleTimestamp(
                306669L, 303600L, Float.NaN), "invalid motion rate");
        if (!ComboSpeedPolicy.isValidRate(1.0f)
                || !ComboSpeedPolicy.isValidRate(4.0f)
                || !ComboSpeedPolicy.isValidRate(10.0f)
                || ComboSpeedPolicy.isValidRate(0.5f)
                || ComboSpeedPolicy.isValidRate(4.5f)
                || ComboSpeedPolicy.isValidRate(10.01f)) {
            throw new AssertionError("rate validation");
        }
        checkText(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                "stable cache identity");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123457L, 4.0f),
                "mtime invalidates cache");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 5.0f),
                "rate separates cache");
        checkDifferent(ComboSpeedPolicy.cacheIdentity("王者荣耀_002", 123456L, 4.0f),
                ComboSpeedPolicy.cacheIdentity("和平精英_002", 123456L, 4.0f),
                "file name separates cache");
        checkText(null, ComboSpeedPolicy.cacheIdentity(
                "王者荣耀_002", 123456L, 4.5f), "fractional cache rate rejected");
        testPendingCompletionAndTimeout();
        testPendingClaimRace();
        testPendingCancellationAndReplacement();
        testPendingClaimConditions();
        testPendingConfigChanges();
        testPendingDeadline();
        testPendingRejectedCleanup();
        testPendingStaleCleanup();
        testPendingCleanupBeforeReplacement(false);
        testPendingCleanupBeforeReplacement(true);
        testPendingStopBeforePublication();
        testPendingPublicationBeforeStop();
        System.out.println("TestComboSpeedPolicy OK");
    }

    private static void testPendingCompletionAndTimeout() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token completed = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        checkPending(true, claim(pending, completed, owner), "cold completion wins");
        checkPending(false, claim(pending, completed, owner), "timeout loses after completion");

        ComboPlaybackPending.Token timedOut = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 2000L, 500L);
        check(0L, timedOut.remainingNanos(2500L), "timeout reaches original deadline");
        checkPending(true, claim(pending, timedOut, owner), "timeout fallback wins");
        checkPending(false, claim(pending, timedOut, owner), "late cold completion loses");
    }

    private static void testPendingClaimRace() throws Exception {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        CountDownLatch ready = new CountDownLatch(2);
        CountDownLatch start = new CountDownLatch(1);
        ExecutorService callbacks = Executors.newFixedThreadPool(2);
        try {
            Future<Boolean> completion = callbacks.submit(() -> {
                ready.countDown();
                start.await();
                return claim(pending, token, owner);
            });
            Future<Boolean> timeout = callbacks.submit(() -> {
                ready.countDown();
                start.await();
                return claim(pending, token, owner);
            });
            checkPending(true, ready.await(5L, TimeUnit.SECONDS), "both callbacks ready");
            start.countDown();
            int winners = (completion.get(5L, TimeUnit.SECONDS) ? 1 : 0)
                    + (timeout.get(5L, TimeUnit.SECONDS) ? 1 : 0);
            check(1L, winners, "simultaneous completion and timeout publish once");
            checkPending(false, claim(pending, token, owner), "race leaves no reusable token");
        } finally {
            start.countDown();
            callbacks.shutdownNow();
        }
    }

    private static void testPendingCancellationAndReplacement() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new String("owner");
        Object otherOwner = new String("owner");
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        pending.cancel(otherOwner);
        checkPending(true, claim(pending, token, owner),
                "equal but different owner cannot cancel playback");

        token = pending.begin(owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 2000L, 500L);
        pending.cancel(owner);
        checkPending(false, claim(pending, token, owner), "stop blocks late completion");

        token = pending.begin(owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 3000L, 500L);
        pending.cancelAll();
        checkPending(false, claim(pending, token, owner), "cancel all blocks pending playback");

        ComboPlaybackPending.Token old = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 4000L, 500L);
        ComboPlaybackPending.Token replacement = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 4100L, 500L);
        checkPending(false, claim(pending, old, owner), "same path new playback supersedes old");
        checkPending(true, claim(pending, replacement, owner),
                "stale completion does not consume replacement");
    }

    private static void testPendingClaimConditions() {
        Object owner = new Object();
        checkRejectedClaim(owner, new Object(), SOURCE_PATH, PACKAGE_NAME, true, 5.0f,
                "changed owner");
        checkRejectedClaim(owner, owner, SOURCE_PATH + ".other", PACKAGE_NAME, true, 5.0f,
                "changed source path");
        checkRejectedClaim(owner, owner, SOURCE_PATH, "ls.augment.regression.nongame", true,
                5.0f, "changed package");
        checkRejectedClaim(owner, owner, SOURCE_PATH, PACKAGE_NAME, false, 5.0f,
                "feature OFF");
        checkRejectedClaim(owner, owner, SOURCE_PATH, PACKAGE_NAME, true, 2.0f,
                "changed speed");

        ComboPlaybackPending pending = new ComboPlaybackPending();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        checkPending(false, claim(pending, null, owner), "null token cannot claim");
        checkPending(true, pending.claim(token, owner, new String(SOURCE_PATH),
                new String(PACKAGE_NAME), true, 5.0f), "same path and package values match");
    }

    private static void checkRejectedClaim(Object originalOwner, Object actualOwner,
            String path, String packageName, boolean enabled, float rate, String name) {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        ComboPlaybackPending.Token token = pending.begin(
                originalOwner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        checkPending(false, pending.claim(token, actualOwner, path, packageName, enabled, rate),
                name + " blocks playback");
        checkPending(false, claim(pending, token, originalOwner),
                name + " cannot resurrect the consumed request");
    }

    private static void testPendingConfigChanges() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        pending.cancelIfConfigChanged(true, 5.0f);
        checkPending(true, claim(pending, token, owner),
                "same configuration notification preserves pending playback");

        token = pending.begin(owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 2000L, 500L);
        pending.cancelIfConfigChanged(false, 5.0f);
        pending.cancelIfConfigChanged(true, 5.0f);
        checkPending(false, claim(pending, token, owner),
                "OFF then ON cannot restore cancelled playback");

        token = pending.begin(owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 3000L, 500L);
        pending.cancelIfConfigChanged(true, 2.0f);
        pending.cancelIfConfigChanged(true, 5.0f);
        checkPending(false, claim(pending, token, owner),
                "speed change then restore cannot revive cancelled playback");
    }

    private static void testPendingDeadline() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        check(1500L, token.deadlineNanos, "deadline fixed at begin");
        check(500L, token.remainingNanos(1000L), "initial preparation budget");
        check(400L, token.remainingNanos(1100L), "elapsed preparation consumes budget");
        pending.cancelIfConfigChanged(true, 5.0f);
        pending.cancel(new Object());
        check(1L, token.remainingNanos(1499L), "notifications do not restart budget");
        check(0L, token.remainingNanos(1500L), "deadline has zero remaining time");
        check(0L, token.remainingNanos(1700L), "expired budget stays zero");
        check(1500L, token.deadlineNanos, "deadline unchanged after repeated observations");
    }

    private static void testPendingRejectedCleanup() {
        for (boolean configNotification : new boolean[] {false, true}) {
            for (boolean enabled : new boolean[] {false, true}) {
                ComboPlaybackPending pending = new ComboPlaybackPending();
                Object owner = new Object();
                ComboPlaybackPending.Token token = pending.begin(
                        owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
                float changedRate = enabled ? 2.0f : 5.0f;
                String name = (configNotification ? "config notification " : "claim ")
                        + (enabled ? "speed change" : "OFF");
                AtomicInteger cleanups = new AtomicInteger();
                Consumer<ComboPlaybackPending.Token> cleanup = cancelled -> {
                    checkPending(true, cancelled == token, name + " cleans its own token");
                    cleanups.incrementAndGet();
                    checkPending(true, pending.cancel(owner) == null,
                            name + " clears ownership before reentrant stop");
                    pending.cancelIfConfigChanged(false, 5.0f, ignored -> {
                        throw new AssertionError(name + " repeated cleanup on reentry");
                    });
                    checkPending(false, pending.claim(token, owner, SOURCE_PATH,
                            PACKAGE_NAME, false, 5.0f, ignored -> {
                                throw new AssertionError(name + " repeated claim cleanup");
                            }), name + " reentrant claim stays cancelled");
                };
                if (configNotification) {
                    checkPending(true, pending.cancelIfConfigChanged(
                            enabled, changedRate, cleanup) == token, name + " returns token");
                    pending.cancelIfConfigChanged(enabled, changedRate, cleanup);
                } else {
                    checkPending(false, pending.claim(token, owner, SOURCE_PATH,
                            PACKAGE_NAME, enabled, changedRate, cleanup), name + " rejected");
                }
                checkPending(false, pending.claim(token, owner, SOURCE_PATH,
                        PACKAGE_NAME, enabled, changedRate, cleanup), name + " late retry rejected");
                check(1L, cleanups.get(), name + " cleanup runs exactly once");
            }
        }

        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        Consumer<ComboPlaybackPending.Token> unexpectedCleanup = ignored -> {
            throw new AssertionError("unchanged enabled playback must not be cleaned up");
        };
        checkPending(true, pending.cancelIfConfigChanged(true, 5.0f, unexpectedCleanup) == null,
                "unchanged config has no cancelled token");
        checkPending(true, pending.claim(token, owner, SOURCE_PATH, PACKAGE_NAME,
                true, 5.0f, unexpectedCleanup), "accepted claim skips cleanup");
    }

    private static void testPendingStaleCleanup() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token old = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        ComboPlaybackPending.Token replacement = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1100L, 500L);
        AtomicInteger cleanups = new AtomicInteger();
        checkPending(false, pending.claim(old, owner, SOURCE_PATH, PACKAGE_NAME,
                false, 2.0f, ignored -> {
                    cleanups.incrementAndGet();
                    pending.cancel(owner);
                }), "stale token rejected despite matching owner path and package");
        check(0L, cleanups.get(), "stale token cannot clean up same-path replacement");
        checkPending(true, claim(pending, replacement, owner), "replacement survives stale cleanup");
    }

    private static void testPendingCleanupBeforeReplacement(boolean configNotification)
            throws Exception {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token old = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        String name = configNotification ? "config cleanup" : "claim cleanup";
        CountDownLatch cleanupEntered = new CountDownLatch(1);
        CountDownLatch beginAttempted = new CountDownLatch(1);
        CountDownLatch releaseCleanup = new CountDownLatch(1);
        AtomicBoolean cleanupFinished = new AtomicBoolean();
        AtomicInteger cleanups = new AtomicInteger();
        Consumer<ComboPlaybackPending.Token> cleanup = cancelled -> {
            checkPending(true, cancelled == old, name + " receives old token");
            checkPending(true, Thread.holdsLock(pending), name + " retains ownership lock");
            cleanups.incrementAndGet();
            cleanupEntered.countDown();
            awaitLatch(releaseCleanup, name + " released");
            checkPending(true, pending.cancel(owner) == null,
                    name + " cannot encounter or cancel replacement during cleanup");
            cleanupFinished.set(true);
        };
        ExecutorService callbacks = Executors.newFixedThreadPool(2);
        try {
            Future<?> cancellation = callbacks.submit(() -> {
                if (configNotification) {
                    checkPending(true, pending.cancelIfConfigChanged(false, 5.0f, cleanup) == old,
                            name + " cancels old token");
                } else {
                    checkPending(false, pending.claim(old, owner, SOURCE_PATH, PACKAGE_NAME,
                            false, 5.0f, cleanup), name + " rejects old playback");
                }
            });
            awaitLatch(cleanupEntered, name + " entered");
            Future<ComboPlaybackPending.Token> replacement = callbacks.submit(() -> {
                beginAttempted.countDown();
                ComboPlaybackPending.Token next = pending.begin(
                        owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1100L, 500L);
                checkPending(true, cleanupFinished.get(), name + " finishes before new begin");
                return next;
            });
            awaitLatch(beginAttempted, name + " competing begin attempted");
            checkPending(false, replacement.isDone(), name + " blocks competing begin");
            releaseCleanup.countDown();
            cancellation.get(5L, TimeUnit.SECONDS);
            ComboPlaybackPending.Token next = replacement.get(5L, TimeUnit.SECONDS);
            check(1L, cleanups.get(), name + " completed exactly once");
            checkPending(false, pending.claim(old, owner, SOURCE_PATH, PACKAGE_NAME,
                    false, 5.0f, cleanup), name + " old completion stays stale");
            check(1L, cleanups.get(), name + " does not repeat after replacement");
            checkPending(true, claim(pending, next, owner), name + " leaves replacement usable");
        } finally {
            releaseCleanup.countDown();
            callbacks.shutdownNow();
        }
    }

    private static void testPendingStopBeforePublication() {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        AtomicInteger publications = new AtomicInteger();
        checkPending(true, pending.cancel(owner) == token, "stop wins pending ownership");
        for (String callback : new String[] {"late worker", "late timeout"}) {
            checkPending(false, pending.claim(token, owner, SOURCE_PATH, PACKAGE_NAME,
                    true, 5.0f, ignored -> {
                        throw new AssertionError(callback + " cleans an already stopped request");
                    }, publications::incrementAndGet), callback + " cannot publish after stop");
        }
        check(0L, publications.get(), "stop winner prevents every publication");
    }

    private static void testPendingPublicationBeforeStop() throws Exception {
        ComboPlaybackPending pending = new ComboPlaybackPending();
        Object owner = new Object();
        ComboPlaybackPending.Token token = pending.begin(
                owner, SOURCE_PATH, PACKAGE_NAME, 5.0f, 1000L, 500L);
        CountDownLatch publicationEntered = new CountDownLatch(1);
        CountDownLatch stopAttempted = new CountDownLatch(1);
        CountDownLatch releasePublication = new CountDownLatch(1);
        ConcurrentLinkedQueue<String> events = new ConcurrentLinkedQueue<>();
        AtomicInteger publications = new AtomicInteger();
        Runnable publish = () -> {
            checkPending(true, Thread.holdsLock(pending), "publication retains ownership lock");
            checkPending(true, pending.cancel(owner) == null,
                    "ownership consumed before publication begins");
            publicationEntered.countDown();
            awaitLatch(releasePublication, "publication released");
            publications.incrementAndGet();
            events.add("start");
        };
        ExecutorService callbacks = Executors.newFixedThreadPool(2);
        try {
            Future<Boolean> completion = callbacks.submit(() -> pending.claim(
                    token, owner, SOURCE_PATH, PACKAGE_NAME, true, 5.0f, ignored -> {
                        throw new AssertionError("accepted publication invokes cleanup");
                    }, publish));
            awaitLatch(publicationEntered, "publication entered before stop");
            Future<?> stop = callbacks.submit(() -> {
                stopAttempted.countDown();
                checkPending(true, pending.cancel(owner) == null,
                        "stop follows already consumed publication");
                events.add("stop");
            });
            awaitLatch(stopAttempted, "concurrent stop attempted");
            checkPending(false, stop.isDone(), "stop waits until publication finishes");
            checkPending(true, events.isEmpty(), "neither OEM start nor stop completed yet");
            releasePublication.countDown();
            checkPending(true, completion.get(5L, TimeUnit.SECONDS), "publication wins claim");
            stop.get(5L, TimeUnit.SECONDS);
            checkText("start,stop", String.join(",", events), "OEM start precedes OEM stop");
            for (String callback : new String[] {"late worker", "late timeout"}) {
                checkPending(false, pending.claim(token, owner, SOURCE_PATH, PACKAGE_NAME,
                        true, 5.0f, ignored -> {
                            throw new AssertionError(callback + " cleans published request");
                        }, publish), callback + " cannot republish after stop");
            }
            check(1L, publications.get(), "winning publication occurs exactly once");
            checkText("start,stop", String.join(",", events),
                    "late callbacks cannot restart stopped playback");
        } finally {
            releasePublication.countDown();
            callbacks.shutdownNow();
        }
    }

    private static void awaitLatch(CountDownLatch latch, String name) {
        try {
            checkPending(true, latch.await(5L, TimeUnit.SECONDS), name);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new AssertionError(name + " interrupted", interrupted);
        }
    }

    private static boolean claim(ComboPlaybackPending pending,
            ComboPlaybackPending.Token token, Object owner) {
        return pending.claim(token, owner, SOURCE_PATH, PACKAGE_NAME, true, 5.0f);
    }

    private static void checkPending(boolean expected, boolean actual, String name) {
        if (expected != actual) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void check(long expected, long actual, String name) {
        if (expected != actual) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void checkText(String expected, String actual, String name) {
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void checkDifferent(String first, String second, String name) {
        if (first == null || first.equals(second)) {
            throw new AssertionError(name + ": first=" + first + " second=" + second);
        }
    }
}
