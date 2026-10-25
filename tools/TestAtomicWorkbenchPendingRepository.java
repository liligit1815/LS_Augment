package ls.augment.com;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Uses production transactions/codec and durable real files; never accesses phone/user content. */
public final class TestAtomicWorkbenchPendingRepository {
    static int cases, checks;
    static void check(boolean value, String reason) { checks++; if (!value) throw new AssertionError(reason); }
    interface Case { void run() throws Exception; }
    static void test(String name, Case body) throws Exception { body.run(); cases++; System.out.println("PASS pending repository: " + name); }
    static final class Disk implements AtomicWorkbenchPendingRepository.Storage {
        final Path path; int fail; byte[] observed;
        Disk() throws IOException { path = Files.createTempFile("duo-pending-", ".bin"); Files.delete(path); }
        public byte[] read() throws IOException { if (fail == 2) throw new IOException(); return Files.exists(path) ? Files.readAllBytes(path) : null; }
        public void write(byte[] bytes) throws IOException {
            observed = bytes.clone(); if (fail == 1) throw new IOException();
            if (fail == 3) throw new AtomicWorkbenchPendingRepository.UncertainSave();
            Files.write(path, bytes);
        }
    }
    static final class F implements AutoCloseable {
        final Disk disk = new Disk(); final AtomicLong now = new AtomicLong(2_000_000_000L);
        final Set<String> absent = new HashSet<>();
        final AtomicWorkbenchPendingRepository repo = new AtomicWorkbenchPendingRepository(disk, (item, time) ->
                item.availability(absent.contains(item.id) ? AtomicWorkbenchPendingPayload.Availability.MISSING
                        : !AtomicWorkbenchTransferPolicy.fresh(item.created, time) ? AtomicWorkbenchPendingPayload.Availability.EXPIRED
                        : AtomicWorkbenchPendingPayload.Availability.READY), now::get);
        F() throws IOException { }
        AtomicWorkbenchPendingPayload put(String text, int... files) {
            var before = repo.load(); var r = repo.put(before.id, before.revision, batch(text, now.get(), files), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.REQUIRE_CHOICE);
            check(r.success, "seed failed"); return r.snapshot;
        }
        public void close() throws IOException { Files.deleteIfExists(disk.path); }
    }
    static String id(int value) { return String.format(Locale.ROOT, "%032x", value); }
    static AtomicWorkbenchPendingPayload.FileItem file(int number, long created, long bytes) {
        return new AtomicWorkbenchPendingPayload.FileItem(id(number), "content://test/" + id(number), "synthetic", "image/png", bytes, created, AtomicWorkbenchPendingPayload.Availability.READY);
    }
    static AtomicWorkbenchPendingPayload batch(String text, long created, int... files) {
        List<AtomicWorkbenchPendingPayload.FileItem> list = new ArrayList<>(); for (int n : files) list.add(file(n, created, 10));
        return new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, text, text.isEmpty() ? 0 : created, false, list, AtomicWorkbenchPendingPayload.State.READY);
    }
    static void fails(Case action) throws Exception { try { action.run(); throw new AssertionError("expected failure"); } catch (IOException expected) { checks++; } }
    public static void main(String[] args) throws Exception {
        test("durable rebuild preserves mixed whitespace and immutable order", () -> { try (F f = new F()) {
            var first = f.put(" \n 字 \t", 1, 2); var moved = f.repo.moveBefore(first.id, first.revision, id(2), id(1)); check(moved.success, "move failed");
            var rebuilt = new AtomicWorkbenchPendingRepository(f.disk, (item, now) -> item, f.now::get).load();
            check(rebuilt.id.equals(first.id) && rebuilt.revision == first.revision + 1, "identity lost"); check(rebuilt.text.equals(" \n 字 \t"), "whitespace changed");
            check(rebuilt.files.get(0).id.equals(id(2)), "order not durable");
            try { rebuilt.files.clear(); throw new AssertionError("mutable list"); } catch (UnsupportedOperationException expected) { checks++; }
        }});
        test("append deduplicates real cache identity and explicitly resolves text", () -> { try (F f = new F()) {
            var before = f.put("old", 1); var batch = batch("new", f.now.incrementAndGet(), 1, 2);
            var conflict = f.repo.put(before.id, before.revision, batch, AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.REQUIRE_CHOICE);
            check(!conflict.success && conflict.reason.equals("text_choice"), "silent text overwrite"); check(f.repo.load().revision == before.revision, "choice changed disk");
            var kept = f.repo.put(before.id, before.revision, batch, AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.KEEP);
            check(kept.success && kept.snapshot.text.equals("old") && kept.snapshot.files.size() == 2, "keep/append wrong");
            var merged = f.repo.put(kept.snapshot.id, kept.snapshot.revision, batch, AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.MERGE);
            check(merged.success && merged.snapshot.text.equals("old\nnew") && merged.snapshot.textCreated == before.textCreated, "merge renews old text");
        }});
        test("replacement is explicit and keeps per-item creation timestamps", () -> { try (F f = new F()) {
            var old = f.put("old", 1); f.now.addAndGet(1234); var incoming = batch("new", f.now.get(), 2);
            var replaced = f.repo.put(old.id, old.revision, incoming, AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            check(replaced.success && replaced.snapshot.text.equals("new") && replaced.snapshot.files.size() == 1, "replace wrong");
            check(replaced.snapshot.files.get(0).created == incoming.files.get(0).created, "created renewed");
        }});
        test("16 files plus full text allowed; seventeenth and merged text overflow retain disk", () -> { try (F f = new F()) {
            int[] sixteen = java.util.stream.IntStream.rangeClosed(1, 16).toArray(); var old = f.put("x".repeat(32768), sixteen); byte[] disk = f.disk.read();
            var tooMany = f.repo.put(old.id, old.revision, batch("", f.now.get(), 17), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.KEEP);
            check(!tooMany.success && Arrays.equals(disk, f.disk.read()), "17th written");
            var tooLong = f.repo.put(old.id, old.revision, batch("y", f.now.get()), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.MERGE);
            check(!tooLong.success && Arrays.equals(disk, f.disk.read()), "merged text truncated");
            var invalid = f.repo.put(old.id, old.revision, batch("x".repeat(32769), f.now.get()), AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            check(!invalid.success && Arrays.equals(disk, f.disk.read()), "oversized constructed batch admitted");
        }});
        test("aggregate byte budget rejects overflow before write", () -> { try (F f = new F()) {
            var before = f.repo.load(); var big = new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(), 0, "", 0, false,
                    List.of(file(1, f.now.get(), AtomicWorkbenchTransferPolicy.MAX_BYTES), file(2, f.now.get(), 1)), AtomicWorkbenchPendingPayload.State.READY);
            var result = f.repo.put(before.id, before.revision, big, AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            check(!result.success && f.disk.read() == null, "byte overflow written");
        }});
        test("partial loss remains visible and whole delivery never silently drops an item", () -> { try (F f = new F()) {
            var old = f.put(" words ", 1, 2); f.absent.add(id(1)); var partial = f.repo.load();
            check(partial.state == AtomicWorkbenchPendingPayload.State.PARTIAL && partial.files.size() == 2, "loss erased whole pending");
            fails(() -> f.repo.delivery(old.id, old.revision, null, false)); fails(() -> f.repo.delivery(old.id, old.revision, id(1), false));
            check(f.repo.delivery(old.id, old.revision, id(2), false).files.size() == 1, "explicit valid item blocked");
            check(f.repo.delivery(old.id, old.revision, null, true).text.equals(" words "), "explicit text blocked");
            var removed = f.repo.remove(old.id, old.revision, id(1)); check(removed.success && removed.snapshot.deliverable(), "bad item not removable");
        }});
        test("text and file TTL are independent and sorting/appending do not renew", () -> { try (F f = new F()) {
            var old = f.put("old", 1); f.now.addAndGet(AtomicWorkbenchTransferPolicy.LIFETIME_MS); var added = f.repo.put(old.id, old.revision, batch("", f.now.get(), 2), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.KEEP);
            check(added.success, "boundary append"); f.now.incrementAndGet(); var partial = f.repo.load();
            check(partial.textExpired && partial.text.isEmpty() && partial.files.get(0).availability == AtomicWorkbenchPendingPayload.Availability.EXPIRED, "old TTL renewed");
            check(partial.files.get(1).availability == AtomicWorkbenchPendingPayload.Availability.READY, "new item expired with old");
            var moved = f.repo.moveBefore(partial.id, partial.revision, id(2), id(1)); check(moved.success && moved.snapshot.files.get(1).created == old.files.get(0).created, "sort renewed TTL");
        }});
        test("clear and remove never call cache catalog deletion and bounded undo retains original TTL", () -> { try (F f = new F()) {
            var old = f.put("text", 1, 2); var removed = f.repo.remove(old.id, old.revision, id(1)); check(removed.success && removed.undo != null, "undo absent");
            var restored = f.repo.undo(removed.undo); check(restored.success && restored.snapshot.files.get(0).created == old.files.get(0).created, "undo renewed TTL/order");
            var cleared = f.repo.clear(restored.snapshot.id, restored.snapshot.revision); check(cleared.success && cleared.snapshot.empty(), "clear failed");
            f.now.addAndGet(10_001); check(!f.repo.undo(cleared.undo).success, "expired undo accepted"); check(f.absent.isEmpty(), "cache mutated");
        }});
        test("later edits invalidate undo and old revision even with matching text hash", () -> { try (F f = new F()) {
            check("Aa".hashCode() == "BB".hashCode(), "fixture hash"); var old = f.put("Aa", 1); var removed = f.repo.remove(old.id, old.revision, id(1));
            var edited = f.repo.put(removed.snapshot.id, removed.snapshot.revision, batch("BB", f.now.get()), AtomicWorkbenchPendingRepository.Mode.REPLACE, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            check(edited.success && !f.repo.undo(removed.undo).success, "stale undo accepted");
            check(!f.repo.clear(old.id, old.revision).success && f.repo.load().text.equals("BB"), "hash collision stale edit");
        }});
        test("late import and simultaneous writers cannot resurrect a cleared queue", () -> { try (F f = new F()) {
            var old = f.put("original", 1); f.repo.clear(old.id, old.revision);
            var late = f.repo.put(old.id, old.revision, batch("late", f.now.get(), 2), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.REPLACE);
            check(!late.success && f.repo.load().empty(), "late source resurrected cleared queue");
            var current = f.repo.load(); ExecutorService workers = Executors.newFixedThreadPool(2);
            try { CountDownLatch start = new CountDownLatch(1); List<Future<Boolean>> writes = new ArrayList<>();
                for (int n : new int[]{3, 4}) writes.add(workers.submit(() -> { start.await(); return f.repo.put(current.id, current.revision, batch("", f.now.get(), n), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.KEEP).success; }));
                start.countDown(); int success = 0; for (Future<Boolean> write : writes) if (write.get(2, TimeUnit.SECONDS)) success++;
                check(success == 1 && f.repo.load().files.size() == 1, "simultaneous CAS overwritten");
            } finally { workers.shutdownNow(); }
        }});
        test("real storage refusal preserves revision, reports SAVE_FAILED, and emits no false success event", () -> { try (F f = new F()) {
            var old = f.put("old", 1); byte[] disk = f.disk.read(); AtomicInteger calls = new AtomicInteger(); f.repo.subscribe(value -> calls.incrementAndGet()); f.disk.fail = 1;
            var failed = f.repo.clear(old.id, old.revision); check(!failed.success && failed.snapshot.state == AtomicWorkbenchPendingPayload.State.SAVE_FAILED, "failure called empty/success");
            check(Arrays.equals(disk, f.disk.read()) && failed.snapshot.revision == old.revision && calls.get() == 0, "failed mutation published");
            f.disk.fail = 0; check(f.repo.load().text.equals("old"), "disk old text lost");
        }});
        test("unconfirmed persistence and read failure remain distinct from EMPTY", () -> { try (F f = new F()) {
            var old = f.put("old", 1); f.disk.fail = 3; var unknown = f.repo.clear(old.id, old.revision);
            check(!unknown.success && unknown.reason.equals("save_unknown") && unknown.snapshot.state == AtomicWorkbenchPendingPayload.State.READ_FAILED, "unknown save pretends rollback");
            f.disk.fail = 2; var unreadable = f.repo.load(); check(!unreadable.empty() && unreadable.state == AtomicWorkbenchPendingPayload.State.READ_FAILED, "read failure clears queue");
        }});
        test("missing manifest clears stale UI identity and old work cannot write into it", () -> { try (F f = new F()) {
            var old = f.put("old", 1); Files.delete(f.disk.path); var empty = f.repo.load(); check(empty.empty() && !empty.id.equals(old.id), "stale UI remains after external manifest loss");
            check(!f.repo.put(old.id, old.revision, batch("late", f.now.get()), AtomicWorkbenchPendingRepository.Mode.APPEND, AtomicWorkbenchPendingRepository.TextChoice.KEEP).success, "lost manifest stale import accepted");
        }});
        test("strict codec rejects corruption/trailing/duplicate/aggregate overflow without erasing prior snapshot", () -> { try (F f = new F()) {
            var old = f.put("old", 1); byte[] valid = f.disk.read();
            for (byte[] bad : List.of(new byte[0], new byte[]{1, 2, 3}, Arrays.copyOf(valid, valid.length + 1))) { Files.write(f.disk.path, bad); var state = f.repo.load(); check(state.state == AtomicWorkbenchPendingPayload.State.READ_FAILED && state.text.equals("old"), "corruption erased prior snapshot"); }
            var duplicate = new AtomicWorkbenchPendingPayload(old.id, 1, "", 0, false, List.of(file(1, f.now.get(), 1), file(1, f.now.get(), 1)), AtomicWorkbenchPendingPayload.State.READY);
            fails(() -> AtomicWorkbenchPendingRepository.decode(AtomicWorkbenchPendingRepository.encode(duplicate)));
            var over = new AtomicWorkbenchPendingPayload(old.id, 1, "", 0, false, List.of(file(1, f.now.get(), AtomicWorkbenchTransferPolicy.MAX_BYTES), file(2, f.now.get(), 1)), AtomicWorkbenchPendingPayload.State.READY);
            fails(() -> AtomicWorkbenchPendingRepository.decode(AtomicWorkbenchPendingRepository.encode(over)));
        }});
        System.out.println("PENDING REPOSITORY PASS " + cases + " cases / " + checks + " assertions");
    }
}
