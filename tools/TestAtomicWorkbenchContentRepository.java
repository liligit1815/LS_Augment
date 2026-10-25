package ls.augment.com;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

public final class TestAtomicWorkbenchContentRepository {
    static int assertions, cases;
    static final AtomicWorkbenchContentItem.Kind MEDIA = AtomicWorkbenchContentItem.Kind.MEDIA;
    static final AtomicWorkbenchContentItem.Kind FILES = AtomicWorkbenchContentItem.Kind.FILES;
    static final AtomicWorkbenchContentItem.Kind CLIP = AtomicWorkbenchContentItem.Kind.CLIPBOARD;
    static final AtomicWorkbenchContentPermissionState FULL = AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.FULL);
    static final class Queue implements Executor {
        final ArrayDeque<Runnable> tasks = new ArrayDeque<>();
        @Override public void execute(Runnable command) { tasks.addLast(command); }
        void one() { check(!tasks.isEmpty(), "expected pending operation"); tasks.removeFirst().run(); }
        void all() { int count = 0; while (!tasks.isEmpty()) { if (++count > 1000) throw new AssertionError("unbounded work"); one(); } }
    }
    static final class Source implements AtomicWorkbenchContentSource {
        Result result = new Result(List.of(), FULL, State.READY);
        int scans, starts, stops, closes; Runnable during, changed;
        @Override public Result scan(AtomicWorkbenchContentItem.Kind kind) { scans++; if (during != null) { Runnable action = during; during = null; action.run(); } return result; }
        @Override public void start(Runnable hint) { starts++; changed = hint; }
        @Override public void stop() { stops++; changed = null; }
        @Override public void close() { closes++; changed = null; }
    }
    static final class Fixture implements AutoCloseable {
        final File folder; final Source source = new Source(); final Queue work = new Queue(), callbacks = new Queue();
        final AtomicWorkbenchContentRepository repo; long now = 1_800_000_000_000L;
        Fixture() throws IOException { this(Files.createTempDirectory("duo-content-").toFile()); }
        Fixture(File folder) { this.folder = folder; repo = new AtomicWorkbenchContentRepository(source,
                new AtomicWorkbenchContentStore(folder), work, callbacks, () -> now); work.all(); }
        void ready(AtomicWorkbenchContentItem.Kind kind, List<AtomicWorkbenchContentItem> items) {
            source.result = new AtomicWorkbenchContentSource.Result(items, FULL, AtomicWorkbenchContentSource.State.READY);
            repo.refresh(kind, true); work.all(); callbacks.all();
        }
        @Override public void close() { repo.close(); work.all(); callbacks.all(); }
    }
    interface Test { void run() throws Exception; }
    static void test(String name, Test test) throws Exception { test.run(); cases++; System.out.println("PASS content repository: " + name); }
    static void check(boolean value, String message) { assertions++; if (!value) throw new AssertionError(message); }
    static void fails(Test operation, String message) throws Exception {
        try { operation.run(); throw new AssertionError(message); }
        catch (IOException | IllegalArgumentException | UnsupportedOperationException expected) { assertions++; }
    }
    static AtomicWorkbenchContentItem file(AtomicWorkbenchContentItem.Kind kind, int id, long time) {
        return AtomicWorkbenchContentItem.file(kind, AtomicWorkbenchContentItem.Source.MEDIA_STORE,
                "content://media/external/file/" + id, kind == MEDIA ? "image/png" : "application/pdf",
                "private-name-" + id + ".png", time, id + 1, 0);
    }

    public static void main(String[] args) throws Exception {
        test("immutable metadata and private diagnostics", () -> {
            AtomicWorkbenchContentItem item = file(MEDIA, 1, 900);
            check(item.key.length() == 64 && item.revision.length() == 64, "stable opaque keys");
            check(item.key.equals(file(MEDIA, 1, 901).key) && !item.revision.equals(file(MEDIA, 1, 901).revision), "identity is independent of revision");
            check(!item.toString().contains("private") && !item.toString().contains("content://"), "item string leaks private source");
            check(AtomicWorkbenchContentItem.clipboard("  private text\n", 1).text().equals("  private text\n"), "intentional text spacing lost");
            check(!AtomicWorkbenchContentItem.clipboard("private", 1).toString().contains("private"), "clipboard string leaks text");
            fails(() -> AtomicWorkbenchContentItem.file(MEDIA, AtomicWorkbenchContentItem.Source.MEDIA_STORE, "file:///sdcard/a", "image/png", "a", 1, 0, 0), "filesystem URI accepted");
            fails(() -> AtomicWorkbenchContentItem.clipboard("x".repeat(32769), 1), "oversized clip silently truncated");
            fails(() -> AtomicWorkbenchContentItem.clipboard(" \n ", 1), "blank clip recorded");
            check(AtomicWorkbenchContentPolicy.name("a/b\\c\n.png").equals("a_b_c_.png"), "display names carry path separators");
            check(AtomicWorkbenchContentPolicy.copiedAt(1, 1_800_000_000_000L) == 1, "old clip was given an arbitrary expiry");
            check(AtomicWorkbenchContentPolicy.copiedAt(0, 1000) == 1000 && AtomicWorkbenchContentPolicy.copiedAt(-1, 1000) == 1000, "missing timestamp fallback");
            check(AtomicWorkbenchContentPolicy.copiedAt(301000, 1000) == 301000 && AtomicWorkbenchContentPolicy.copiedAt(301001, 1000) == 1000, "future timestamp boundary");
            check(AtomicWorkbenchContentPolicy.copiedAt(Long.MAX_VALUE, Long.MAX_VALUE - 1) == Long.MAX_VALUE, "timestamp tolerance overflow");
        });
        test("real permission scopes are independent of row count", () -> {
            check(AtomicWorkbenchContentAccess.permission(MEDIA, true, true, false, false, false, 0).scope == AtomicWorkbenchContentPermissionState.Scope.FULL, "full visual permission");
            check(AtomicWorkbenchContentAccess.permission(MEDIA, true, false, false, false, false, 0).scope == AtomicWorkbenchContentPermissionState.Scope.LIMITED, "one media family overclaims full");
            check(AtomicWorkbenchContentAccess.permission(MEDIA, false, false, false, true, false, 0).scope == AtomicWorkbenchContentPermissionState.Scope.SELECTED, "selected visuals lost");
            check(AtomicWorkbenchContentAccess.permission(FILES, false, false, true, false, false, 0).scope == AtomicWorkbenchContentPermissionState.Scope.LIMITED, "audio permission implies all files");
            check(AtomicWorkbenchContentAccess.permission(FILES, false, false, false, false, false, 1).scope == AtomicWorkbenchContentPermissionState.Scope.SELECTED, "SAF grant lost");
            check(AtomicWorkbenchContentAccess.permission(FILES, false, false, false, false, false, 0).scope == AtomicWorkbenchContentPermissionState.Scope.DENIED, "no grant pretends readable empty");
        });
        test("calendar grouping respects DST and midnight", () -> {
            ZoneId zone = ZoneId.of("America/Los_Angeles");
            long now = ZonedDateTime.of(2026, 11, 2, 0, 15, 0, 0, zone).toInstant().toEpochMilli();
            long yesterday = ZonedDateTime.of(2026, 11, 1, 0, 10, 0, 0, zone).toInstant().toEpochMilli();
            check(now - yesterday > 24L * 3600 * 1000, "DST fixture not crossing long day");
            check(AtomicWorkbenchContentPolicy.dateGroup(yesterday, now, zone) == AtomicWorkbenchContentPolicy.DateGroup.YESTERDAY, "yesterday measured as 24-hour duration");
            check(AtomicWorkbenchContentPolicy.dateGroup(now + 100, now, zone) == AtomicWorkbenchContentPolicy.DateGroup.TODAY, "future date group");
        });
        test("query-sized lists deduplicate and retain recent order", () -> {
            ArrayList<AtomicWorkbenchContentItem> media = new ArrayList<>(), files = new ArrayList<>();
            for (int index = 0; index < 1100; index++) { media.add(file(MEDIA, index, index)); files.add(file(FILES, index, index)); }
            media.add(file(MEDIA, 1099, 1099));
            List<AtomicWorkbenchContentItem> result = AtomicWorkbenchContentPolicy.merge(MEDIA, media, Set.of());
            check(result.size() == 600 && result.get(0).modifiedMillis == 1099, "600 recent media limit");
            check(AtomicWorkbenchContentPolicy.merge(FILES, files, Set.of()).size() == 1000, "1000 recent files limit");
            check(AtomicWorkbenchContentPolicy.merge(MEDIA, result, Set.of(result.get(0).historyKey())).size() == 599, "hidden revision still visible");
            fails(() -> result.add(file(MEDIA, 1, 1)), "snapshot is mutable");
        });
        test("private atomic history roundtrip and snapshot bounds", () -> {
            File directory = Files.createTempDirectory("duo-content-store-").toFile();
            AtomicWorkbenchContentStore store = new AtomicWorkbenchContentStore(directory);
            AtomicWorkbenchContentStore.Stored value = new AtomicWorkbenchContentStore.Stored();
            ArrayList<AtomicWorkbenchContentItem> media = new ArrayList<>(), clips = new ArrayList<>();
            for (int index = 0; index < 600; index++) media.add(file(MEDIA, index, index));
            for (int index = 0; index < 50; index++) clips.add(AtomicWorkbenchContentItem.clipboard("synthetic-" + index, 1));
            value.items.put(MEDIA, media); value.items.put(CLIP, clips);
            value.hidden.put(FILES, Set.of(file(FILES, 1, 1).historyKey())); value.clearedThrough.put(FILES, 99L);
            store.write(value); AtomicWorkbenchContentStore.Stored copy = store.read();
            check(copy.items.get(MEDIA).size() == 200 && copy.items.get(CLIP).size() == 50, "saved snapshot limit/clip count");
            check(copy.items.get(CLIP).get(49).text().equals("synthetic-49"), "history text lost or auto-expired");
            check(copy.hidden.get(FILES).size() == 1 && copy.clearedThrough.get(FILES) == 99L, "clear/delete markers not durable");
            check(java.util.Arrays.stream(directory.listFiles()).noneMatch(f -> f.getName().endsWith("pending")), "temporary private content retained");
            Files.write(new File(directory, "workbench-content-v1.bin").toPath(), new byte[]{0, 1, 2});
            fails(store::read, "corrupt snapshot accepted as fresh empty history");
        });
        test("clipboard persists 50 entries without unrequested expiry", () -> {
            File directory;
            try (Fixture fixture = new Fixture()) {
                directory = fixture.folder;
                for (int index = 0; index < 55; index++) fixture.repo.recordClipboard("sample-" + index, 1,
                        false, AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ);
                fixture.work.all();
                List<AtomicWorkbenchContentItem> entries = fixture.repo.snapshot(CLIP).items;
                check(entries.size() == 50 && entries.get(0).text().equals("sample-54") && entries.get(49).text().equals("sample-5"), "history bound/order");
                fixture.repo.recordClipboard("sample-5", 1, false, AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ); fixture.work.all();
                check(fixture.repo.snapshot(CLIP).items.get(0).text().equals("sample-5"), "duplicate not moved to front");
                fixture.repo.recordClipboard("sensitive-synthetic", 2, true, AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ); fixture.work.all();
                check(fixture.repo.snapshot(CLIP).items.stream().noneMatch(i -> i.text().contains("sensitive")), "sensitive clip retained");
            }
            try (Fixture restored = new Fixture(directory)) {
                check(restored.repo.snapshot(CLIP).items.size() == 50, "old timestamp history expired on restart");
                AtomicWorkbenchContentItem item = restored.repo.snapshot(CLIP).items.get(0);
                restored.repo.clipboardAccess(AtomicWorkbenchContentPermissionState.Scope.DENIED, AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED); restored.work.all();
                check(restored.repo.selection(CLIP, List.of(item.key)).get(0).text().equals(item.text()), "current system clip denial blocks private stored history");
                restored.repo.clipboardAccess(AtomicWorkbenchContentPermissionState.Scope.LOCKED, AtomicWorkbenchContentSource.State.LOCKED); restored.work.all();
                fails(() -> restored.repo.selection(CLIP, List.of(item.key)), "locked user reads private clipboard history");
            }
        });
        test("media restore is cached until source revalidation", () -> {
            File directory;
            try (Fixture fixture = new Fixture()) { fixture.ready(MEDIA, List.of(file(MEDIA, 1, fixture.now))); directory = fixture.folder; }
            try (Fixture restored = new Fixture(directory)) {
                check(restored.repo.snapshot(MEDIA).cached && restored.repo.snapshot(MEDIA).items.size() == 1, "metadata cold restore lost");
                fails(() -> restored.repo.selection(MEDIA, List.of(file(MEDIA, 1, restored.now).key)), "unvalidated restored source selectable");
                restored.ready(MEDIA, List.of(file(MEDIA, 1, restored.now)));
                check(restored.repo.selection(MEDIA, List.of(file(MEDIA, 1, restored.now).key)).size() == 1, "validated source remains blocked");
            }
        });
        test("permission withdrawal never exposes stale readable items", () -> {
            try (Fixture fixture = new Fixture()) {
                AtomicWorkbenchContentItem item = file(MEDIA, 1, fixture.now); fixture.ready(MEDIA, List.of(item));
                fixture.source.result = new AtomicWorkbenchContentSource.Result(List.of(), AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.DENIED), AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED);
                fixture.repo.refresh(MEDIA, true); fixture.work.all();
                check(fixture.repo.snapshot(MEDIA).items.isEmpty() && fixture.repo.snapshot(MEDIA).state == AtomicWorkbenchContentSource.State.PERMISSION_REQUIRED, "revoked permission masquerades as fresh library");
                fails(() -> fixture.repo.selection(MEDIA, List.of(item.key)), "revoked source selectable");
                fixture.ready(MEDIA, List.of());
                check(fixture.repo.snapshot(MEDIA).items.isEmpty() && fixture.repo.snapshot(MEDIA).state == AtomicWorkbenchContentSource.State.READY, "valid empty source confused with denied source");
            }
        });
        test("single removal persists but a changed file can reappear", () -> {
            File directory; long time;
            try (Fixture fixture = new Fixture()) {
                time = fixture.now; directory = fixture.folder; AtomicWorkbenchContentItem item = file(FILES, 1, time);
                fixture.ready(FILES, List.of(item)); fixture.repo.removeHistory(FILES, item.key); fixture.work.all(); fixture.ready(FILES, List.of(item));
                check(fixture.repo.snapshot(FILES).items.isEmpty(), "removed file revived on refresh");
            }
            try (Fixture restored = new Fixture(directory)) {
                restored.ready(FILES, List.of(file(FILES, 1, time))); check(restored.repo.snapshot(FILES).items.isEmpty(), "removed revision revived after restart");
                restored.ready(FILES, List.of(file(FILES, 1, time + 1000))); check(restored.repo.snapshot(FILES).items.size() == 1, "new revision permanently hidden");
            }
        });
        test("clear invalidates a scan already in flight", () -> {
            try (Fixture fixture = new Fixture()) {
                fixture.ready(MEDIA, List.of(file(MEDIA, 1, fixture.now - 100)));
                fixture.source.result = new AtomicWorkbenchContentSource.Result(List.of(file(MEDIA, 2, fixture.now - 50)), FULL, AtomicWorkbenchContentSource.State.READY);
                fixture.source.during = () -> fixture.repo.clearHistory(MEDIA);
                fixture.repo.refresh(MEDIA, true); fixture.work.one();
                check(fixture.repo.snapshot(MEDIA).items.stream().noneMatch(i -> i.uri.endsWith("/2")), "late pre-clear scan published private content after invalidation");
                fixture.work.all(); check(fixture.repo.snapshot(MEDIA).items.isEmpty(), "clear left items");
                fixture.ready(MEDIA, List.of(file(MEDIA, 2, fixture.now - 50), file(MEDIA, 3, fixture.now + 100)));
                check(fixture.repo.snapshot(MEDIA).items.size() == 1 && fixture.repo.snapshot(MEDIA).items.get(0).uri.endsWith("/3"), "clear marker hides new content or revives old content");
            }
        });
        test("coalesced refresh retains a provider change during scan", () -> {
            try (Fixture fixture = new Fixture()) {
                fixture.source.during = () -> fixture.repo.refresh(MEDIA, true);
                fixture.repo.refresh(MEDIA, true); fixture.work.all();
                check(fixture.source.scans == 2, "change during scan was dropped or looped forever");
                fixture.repo.refresh(MEDIA, false); fixture.work.all(); check(fixture.source.scans == 2, "TTL ignored");
                fixture.now += 30000; fixture.repo.refresh(MEDIA, false); fixture.work.all(); check(fixture.source.scans == 3, "TTL expiry did not refresh");
            }
        });
        test("selection preserves order and rejects changed or duplicate items", () -> {
            try (Fixture fixture = new Fixture()) {
                AtomicWorkbenchContentItem a = file(FILES, 1, fixture.now), b = file(FILES, 2, fixture.now + 1);
                fixture.ready(FILES, List.of(a, b));
                check(fixture.repo.selection(FILES, List.of(a.key, b.key)).get(0).key.equals(a.key), "selection sorted instead of user order");
                fails(() -> fixture.repo.selection(FILES, List.of(a.key, a.key)), "duplicate selected twice");
                fails(() -> fixture.repo.selection(FILES, List.of("missing")), "stale item silently skipped");
            }
        });
        test("hidden observers can resume and closed subscriptions receive nothing", () -> {
            Fixture fixture = new Fixture();
            ArrayList<AtomicWorkbenchContentSnapshot> delivered = new ArrayList<>();
            AtomicWorkbenchContentRepository.Subscription observer = fixture.repo.observe(MEDIA, delivered::add);
            observer.close(); fixture.callbacks.all(); check(delivered.isEmpty(), "removed subscription received queued private snapshot");
            fixture.repo.setVisible(true); fixture.work.all(); fixture.repo.setVisible(false); fixture.work.all(); fixture.repo.setVisible(true); fixture.work.all();
            check(fixture.source.starts == 2 && fixture.source.stops == 1 && fixture.source.closes == 0, "hide permanently closed source");
            fixture.close(); fixture.repo.recordClipboard("after-close", 1, false, AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ);
            check(fixture.source.closes == 1 && fixture.work.tasks.isEmpty(), "closed repository enqueues callbacks or double closes");
        });
        test("storage failure remains visible and does not pretend durable success", () -> {
            File blocked = Files.createTempFile("duo-content-blocked-", ".bin").toFile();
            try (Fixture fixture = new Fixture(blocked)) {
                fixture.repo.recordClipboard("synthetic-unsaved", 1, false, AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ); fixture.work.all();
                check(!fixture.repo.snapshot(CLIP).storageAvailable && fixture.repo.snapshot(CLIP).items.size() == 1, "save failure hidden or content discarded");
            }
        });
        System.out.println("CONTENT REPOSITORY RESULT " + cases + " cases; " + assertions + " assertions");
    }
}
