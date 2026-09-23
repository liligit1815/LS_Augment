package ls.augment.com.hook;

import java.lang.ref.WeakReference;
import java.util.AbstractList;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

import ls.augment.com.HideTargetCodec;

/** Host tests of the production provenance core, with no replacement matching implementation. */
public final class TestSettingsEntryBindings {
    private static final String PKG = "com.example.app";
    private static int cases;
    private static int assertions;

    public static void main(String[] args) throws Exception {
        test("pending requires a fresh post-capture check", () -> {
            Fixture f = new Fixture(999, 10);
            no(f.matches(100), "pending filtered");
            yes(f.complete(10, 101), "first authorization was not reported");
            yes(f.matches(101), "normal A not filtered");
        });
        test("serial-bearing selection is required", () -> {
            Fixture f = verified(999, 10);
            no(f.match(f.info, 999, PKG, selected(999, 11), 101), "old A selected new B");
            no(f.match(f.info, 999, PKG, parsed("999:" + PKG), 101), "legacy selected");
            no(f.match(f.info, 999, PKG, parsed("p3:999:10:" + PKG), 101), "pending selected");
            no(f.match(f.info, 999, PKG, Collections.emptySet(), 101), "empty selected");
            no(f.match(f.info, 999, PKG, null, 101), "null selected");
        });
        test("user 0, dynamic 10, 999 and the upper valid user work", () -> {
            for (int user : new int[]{0, 10, 999, 99999}) {
                Fixture f = verified(user, user == 0 ? 0 : 17);
                yes(f.matches(101), "valid user lost: " + user);
            }
            Fixture f = verified(10, Integer.MAX_VALUE);
            yes(f.matches(101), "largest UserInfo serial lost");
        });
        test("same package in multiple users remains independent", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            Object zero = new Object();
            Object ten = new Object();
            Object clone = new Object();
            capture(core, owner, zero, 0, 0, 100);
            capture(core, owner, ten, 10, 3, 100);
            capture(core, owner, clone, 999, 10, 100);
            for (SettingsEntryBindings.Check check : core.checks())
                yes(core.complete(check, check.userId == 0 ? 0 : check.userId == 10 ? 3 : 10,
                        101), "per-user complete");
            yes(core.matches(owner, zero, 0, PKG, selected(0, 0), 101), "user0 lost");
            yes(core.matches(owner, ten, 10, PKG, selected(10, 3), 101), "user10 lost");
            yes(core.matches(owner, clone, 999, PKG, selected(999, 10), 101), "user999 lost");
            no(core.matches(owner, ten, 999, PKG, selected(999, 10), 101), "cross-user info");
        });
        test("a fresh B object does not inherit A authorization", () -> {
            Fixture f = verified(999, 10);
            Object b = new Object();
            no(f.match(b, 999, PKG, f.selection, 102), "new B inherited A");
            capture(f.core, f.owner, b, 999, 11, 102);
            no(f.match(b, 999, PKG, selected(999, 11), 102), "B pending filtered");
            for (SettingsEntryBindings.Check check : f.core.checks())
                f.core.complete(check, 11, 103);
            no(f.match(b, 999, PKG, f.selection, 103), "B matched old selection");
            yes(f.match(b, 999, PKG, selected(999, 11), 103), "explicit current B lost");
            no(f.matches(103), "A remained verified after B post-check");
        });
        test("Entry replacement and copied lists use exact info identity", () -> {
            Fixture f = verified(10, 7);
            Object[] entry = {f.info};
            yes(f.match(entry[0], 10, PKG, f.selection, 102), "original entry lost");
            List<Object> copy = new ArrayList<>(Collections.singletonList(entry[0]));
            yes(f.match(copy.get(0), 10, PKG, f.selection, 102), "same object in copy lost");
            entry[0] = new Object();
            no(f.match(entry[0], 10, PKG, f.selection, 102), "Entry.info replacement inherited");
        });
        test("normal incremental new info retains functional filtering", () -> {
            Fixture f = verified(0, 0);
            Object incremental = new Object();
            capture(f.core, f.owner, incremental, 0, 0, 102);
            no(f.match(incremental, 0, PKG, f.selection, 102), "incremental pending filtered");
            for (SettingsEntryBindings.Check check : f.core.checks()) f.core.complete(check, 0, 103);
            yes(f.matches(103), "old independent batch removed");
            yes(f.match(incremental, 0, PKG, f.selection, 103), "new batch never authorized");
        });
        test("equal objects and hostile equals/hashCode never stand in for identity", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new HostileObject();
            Object info = new HostileObject();
            capture(core, owner, info, 0, 0, 100);
            yes(core.complete(only(core.checks()), 0, 101), "hostile actual info lost");
            yes(core.matches(owner, info, 0, PKG, selected(0, 0), 101), "identity failed");
            no(core.matches(owner, new HostileObject(), 0, PKG, selected(0, 0), 101),
                    "nonidentical info matched");
            no(core.matches(new HostileObject(), info, 0, PKG, selected(0, 0), 101),
                    "nonidentical owner matched");
        });
        test("capture fields must still match the current row", () -> {
            Fixture f = verified(999, 10);
            no(f.match(f.info, 0, PKG, selected(0, 0), 101), "mutated uid inherited");
            no(f.match(f.info, 999, "com.example.other", selected(999, 10, "com.example.other"),
                    101), "mutated package inherited");
            no(f.match(f.info, -1, PKG, f.selection, 101), "negative user matched");
            no(f.match(f.info, 999, null, f.selection, 101), "null package matched");
        });
        test("missing, foreign and stale pre-observations cannot authorize", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            Object info = new Object();
            no(core.capture(null, items(info, 0), 100), "null observation accepted");
            no(core.capture(core.observe(owner, 0, 0), items(info, 0), 101),
                    "unknown old object rebound");
            SettingsEntryBindings other = new SettingsEntryBindings();
            no(core.capture(other.observe(owner, 0, 0), items(new Object(), 0), 101),
                    "foreign core observation accepted");
            SettingsEntryBindings.Observation stale = core.observe(owner, 0, 0);
            core.invalidateOwner(owner);
            no(core.capture(stale, items(new Object(), 0), 102), "old owner observation accepted");
            eq(0, core.checks().size(), "invalid pre-observations created checks");
        });
        test("observation input range is strict", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            yes(core.observe(null, 0, 0) == null, "null owner");
            yes(core.observe(owner, -1, 0) == null, "negative user");
            yes(core.observe(owner, 100000, 0) == null, "large user");
            yes(core.observe(owner, 0, -1) == null, "unknown serial");
            yes(core.observe(owner, 0, 1L + Integer.MAX_VALUE) == null, "overflow serial");
            yes(core.observe(owner, 0, Long.MAX_VALUE) == null, "large serial");
        });
        test("one observation cannot bless a later second raw return", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            SettingsEntryBindings.Observation before = core.observe(owner, 0, 0);
            yes(core.capture(before, items(new Object(), 0), 100), "first capture");
            no(core.capture(before, items(new Object(), 0), 101), "replayed observation");
            eq(1, core.checks().size(), "replayed observation produced a check");
        });
        test("same-batch duplicate exact objects deduplicate", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            Object info = new Object();
            yes(core.capture(core.observe(owner, 999, 10), Arrays.asList(
                    new SettingsEntryBindings.Item(info, 999, PKG),
                    new SettingsEntryBindings.Item(info, 999, PKG)), 100), "duplicate rejected");
            eq(1, core.checks().size(), "duplicate count");
            yes(core.complete(only(core.checks()), 10, 101), "duplicate cannot verify");
            yes(core.matches(owner, info, 999, PKG, selected(999, 10), 101), "duplicate lost");
        });
        test("conflicting same-reference fields within a batch reject", () -> {
            for (boolean conflictingUser : new boolean[]{true, false}) {
                SettingsEntryBindings core = new SettingsEntryBindings();
                Object info = new Object();
                no(core.capture(core.observe(new Object(), 0, 0), Arrays.asList(
                        new SettingsEntryBindings.Item(info, 0, PKG),
                        new SettingsEntryBindings.Item(info, conflictingUser ? 10 : 0,
                                conflictingUser ? PKG : "com.example.other")), 100),
                        "conflicting duplicate accepted");
                eq(0, core.checks().size(), "conflicting duplicate checks");
            }
        });
        test("a mixed-user batch does not authorize its other user", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            Object valid = new Object();
            Object wrongUser = new Object();
            yes(core.capture(core.observe(owner, 0, 0), Arrays.asList(
                    new SettingsEntryBindings.Item(valid, 0, PKG),
                    new SettingsEntryBindings.Item(wrongUser, 999, PKG)), 100), "valid row lost");
            eq(1, core.checks().size(), "mixed user got a check");
            core.complete(only(core.checks()), 0, 101);
            yes(core.matches(owner, valid, 0, PKG, selected(0, 0), 101), "valid mixed batch lost");
            no(core.matches(owner, wrongUser, 999, PKG, selected(999, 10), 101), "wrong user");
            no(core.capture(core.observe(owner, 999, 10), items(wrongUser, 999), 102),
                    "wrong-user object later rebound");
        });
        test("package validation uses the actual codec rules", () -> {
            for (String pkg : new String[]{null, "", "plain", ".com.app", "com..app", "com.app;bad",
                    "com.app-evil", "com." + String.join("", Collections.nCopies(252, "a"))}) {
                SettingsEntryBindings core = new SettingsEntryBindings();
                no(core.capture(core.observe(new Object(), 0, 0), Collections.singletonList(
                        new SettingsEntryBindings.Item(new Object(), 0, pkg)), 100),
                        "invalid package accepted: " + pkg);
                eq(0, core.checks().size(), "invalid package checks");
            }
        });
        test("a seen object cannot be rebound across batch or serial", () -> {
            for (long nextSerial : new long[]{10, 11}) {
                Fixture f = verified(999, 10);
                SettingsEntryBindings.Check old = only(f.core.checks());
                no(f.core.capture(f.core.observe(f.owner, 999, nextSerial), items(f.info, 999), 102),
                        "seen ref recaptured");
                no(f.matches(102), "seen ref retained old authorization");
                no(f.core.complete(old, 10, 103), "old batch completed after capture");
                eq(0, f.core.checks().size(), "seen ref still checkable");
                no(f.core.capture(f.core.observe(f.owner, 999, nextSerial), items(f.info, 999), 104),
                        "tombstone forgotten");
            }
        });
        test("discard is permanent for a seen reference", () -> {
            Fixture f = verified(0, 0);
            SettingsEntryBindings.Check check = only(f.core.checks());
            f.core.discard(f.info);
            f.core.discard(null);
            no(f.matches(102), "discard retained authorization");
            no(f.core.complete(check, 0, 102), "discard allowed old worker");
            no(f.core.capture(f.core.observe(f.owner, 0, 0), items(f.info, 0), 103), "discard rebound");
        });
        test("checks freeze exact records, excluding later batches", () -> {
            Fixture f = new Fixture(999, 10);
            List<SettingsEntryBindings.Check> frozen = f.core.checks();
            Object later = new Object();
            capture(f.core, f.owner, later, 999, 10, 101);
            yes(f.core.complete(only(frozen), 10, 102), "old exact check lost");
            yes(f.matches(102), "checked batch lost");
            no(f.match(later, 999, PKG, f.selection, 102), "later batch inherited old post-read");
            boolean immutable = false;
            try { frozen.clear(); } catch (UnsupportedOperationException expected) { immutable = true; }
            yes(immutable, "check collection mutable");
        });
        test("a newer check invalidates the older worker ticket", () -> {
            Fixture f = new Fixture(0, 0);
            SettingsEntryBindings.Check old = only(f.core.checks());
            SettingsEntryBindings.Check current = only(f.core.checks());
            no(f.core.complete(old, 0, 101), "superseded worker authorized");
            no(f.matches(101), "superseded check set state");
            yes(f.core.complete(current, 0, 102), "current worker lost");
        });
        test("one check can neither replay nor extend its expiration", () -> {
            Fixture f = new Fixture(0, 0);
            SettingsEntryBindings.Check check = only(f.core.checks());
            yes(f.core.complete(check, 0, 101), "initial complete");
            no(f.core.complete(check, 0, 5000), "replay reported change");
            no(f.core.complete(check, -1, 5000), "replay revoked current proof");
            yes(f.matches(10100), "certificate expired early");
            no(f.matches(10101), "replay extended TTL");
        });
        test("a wrong or unavailable post-read cannot verify", () -> {
            for (long serial : new long[]{-1, 11, 1L + Integer.MAX_VALUE}) {
                Fixture f = new Fixture(999, 10);
                SettingsEntryBindings.Check check = only(f.core.checks());
                no(f.core.complete(check, serial, 101), "failure added authorization");
                no(f.matches(101), "wrong post-read filtered");
                no(f.core.complete(check, 10, 102), "failed ticket replay resurrected");
                no(f.matches(102), "failed ticket became authorized");
            }
        });
        test("fresh revalidation includes verified records and revokes on failure", () -> {
            Fixture f = verified(999, 10);
            eq(1, f.core.checks().size(), "verified records omitted");
            yes(f.core.complete(only(f.core.checks()), -1, 102), "revocation not reported");
            no(f.matches(102), "failed recheck kept authorization");
            yes(f.core.complete(only(f.core.checks()), 10, 103), "fresh same-instance recovery lost");
            yes(f.matches(103), "fresh same-instance proof not effective");
        });
        test("fresh recheck renews TTL without spurious change or replay", () -> {
            Fixture f = verified(0, 0);
            no(f.core.complete(only(f.core.checks()), 0, 5000), "unchanged authorization reported");
            yes(f.matches(14999), "renewed certificate lost");
            no(f.matches(15000), "renewed certificate unlimited");
            yes(f.core.complete(only(f.core.checks()), 0, 15001), "expired-to-valid not reported");
            yes(f.matches(15001), "expired record cannot be freshly checked");
        });
        test("clock rollback and negative time fail closed", () -> {
            Fixture f = verified(0, 0);
            no(f.matches(100), "time before verification matched");
            no(f.matches(-1), "negative time matched");
            no(f.core.complete(only(f.core.checks()), 0, 100), "rollback reported authorization");
            no(f.matches(101), "rollback retained verification");
            no(f.core.capture(f.core.observe(f.owner, 0, 0), items(new Object(), 0), -1),
                    "negative capture accepted");
            Fixture pending = new Fixture(0, 0);
            no(pending.core.complete(only(pending.core.checks()), 0, 99), "post before capture");
            no(pending.matches(101), "post before capture authorized");
        });
        test("large timestamps do not overflow the TTL check", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            Object info = new Object();
            capture(core, owner, info, 0, 0, Long.MAX_VALUE - 50);
            yes(core.complete(only(core.checks()), 0, Long.MAX_VALUE - 40), "large clock rejected");
            yes(core.matches(owner, info, 0, PKG, selected(0, 0), Long.MAX_VALUE), "TTL overflow");
            no(core.matches(owner, info, 0, PKG, selected(0, 0), Long.MIN_VALUE), "clock wrap matched");
        });
        test("owner invalidation revokes old records and old workers", () -> {
            Fixture f = verified(0, 0);
            long before = f.core.generation(f.owner);
            SettingsEntryBindings.Check old = only(f.core.checks());
            f.core.invalidateOwner(f.owner);
            yes(f.core.generation(f.owner) > before, "owner epoch unchanged");
            no(f.matches(102), "paused owner matched");
            no(f.core.complete(old, 0, 102), "paused worker published");
            no(f.core.capture(f.core.observe(f.owner, 0, 0), items(f.info, 0), 103),
                    "resume rebound old cached info");
            Object fresh = new Object();
            capture(f.core, f.owner, fresh, 0, 0, 104);
            yes(f.core.complete(only(f.core.checks()), 0, 105), "fresh resumed row lost");
            yes(f.match(fresh, 0, PKG, f.selection, 105), "resume cannot filter new info");
        });
        test("a new owner does not inherit or revive old owner info", () -> {
            Fixture f = verified(999, 10);
            Object nextOwner = new Object();
            no(f.core.matches(nextOwner, f.info, 999, PKG, f.selection, 101), "owner inheritance");
            no(f.core.capture(f.core.observe(nextOwner, 999, 10), items(f.info, 999), 102),
                    "new owner rebound info");
            no(f.matches(102), "cross-owner capture retained old proof");
            Object fresh = new Object();
            capture(f.core, nextOwner, fresh, 999, 10, 103);
            yes(f.core.complete(only(f.core.checks()), 10, 104), "new owner fresh proof lost");
            yes(f.core.matches(nextOwner, fresh, 999, PKG, f.selection, 104), "new owner functionality");
        });
        test("retirement prevents old checks, observations and serial from returning", () -> {
            Fixture f = verified(999, 10);
            SettingsEntryBindings.Check old = only(f.core.checks());
            SettingsEntryBindings.Observation before = f.core.observe(f.owner, 999, 10);
            f.core.retireUser(999);
            no(f.matches(102), "removed user still authorized");
            no(f.core.complete(old, 10, 102), "retired worker published");
            no(f.core.capture(before, items(new Object(), 999), 102), "retired observation accepted");
            yes(f.core.observe(f.owner, 999, 10) == null, "retired serial re-observed");
            yes(f.core.observe(f.owner, 999, 9) == null, "older serial re-observed");
            Object replacement = new Object();
            capture(f.core, f.owner, replacement, 999, 11, 103);
            yes(f.core.complete(only(f.core.checks()), 11, 104), "new instance cannot verify");
            no(f.match(replacement, 999, PKG, f.selection, 104), "new instance inherited selection");
            yes(f.match(replacement, 999, PKG, selected(999, 11), 104), "new selection lost");
        });
        test("retiring one user preserves another user's certificate", () -> {
            Fixture f = verified(0, 0);
            Object clone = new Object();
            capture(f.core, f.owner, clone, 999, 10, 102);
            for (SettingsEntryBindings.Check check : f.core.checks())
                f.core.complete(check, check.userId == 0 ? 0 : 10, 103);
            f.core.retireUser(999);
            yes(f.matches(104), "unrelated user0 authorization revoked");
            no(f.match(clone, 999, PKG, selected(999, 10), 104), "retired clone matched");
            f.core.retireUser(-1);
            f.core.retireUser(100000);
            yes(f.matches(104), "invalid retirement affected user0");
        });
        test("retire before capture records the already observed serial", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            Object owner = new Object();
            SettingsEntryBindings.Observation before = core.observe(owner, 10, 5);
            core.retireUser(10);
            no(core.capture(before, items(new Object(), 10), 100), "pre-removal raw return accepted");
            yes(core.observe(owner, 10, 5) == null, "serial observation not retired");
            yes(core.observe(owner, 10, 6) != null, "future instance disabled");
        });
        test("capacity overflow revokes and blocks owner without dropping tombstones", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings(2);
            Object owner = new Object();
            Object first = new Object();
            Object second = new Object();
            capture(core, owner, first, 0, 0, 100);
            capture(core, owner, second, 0, 0, 100);
            List<SettingsEntryBindings.Check> old = core.checks();
            for (SettingsEntryBindings.Check check : old) core.complete(check, 0, 101);
            yes(core.matches(owner, first, 0, PKG, selected(0, 0), 101), "pre-limit functionality");
            no(core.capture(core.observe(owner, 0, 0), items(new Object(), 0), 102), "over limit accepted");
            no(core.matches(owner, first, 0, PKG, selected(0, 0), 102), "overflow kept old proof");
            eq(-1L, core.generation(owner), "overflow owner not visibly blocked");
            core.invalidateOwner(owner);
            yes(core.observe(owner, 0, 0) == null, "overflow resumed and forgot unknown refs");
            for (SettingsEntryBindings.Check check : old)
                no(core.complete(check, 0, 103), "overflow worker revived");
            no(core.capture(null, items(first, 0), 103), "old tombstone rebound");
        });
        test("overflow of one known owner does not silently clear another owner", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings(2);
            Object firstOwner = new Object();
            Object secondOwner = new Object();
            Object first = new Object();
            Object second = new Object();
            capture(core, firstOwner, first, 0, 0, 100);
            capture(core, secondOwner, second, 0, 0, 100);
            for (SettingsEntryBindings.Check check : core.checks()) core.complete(check, 0, 101);
            no(core.capture(core.observe(firstOwner, 0, 0), items(new Object(), 0), 102), "overflow");
            no(core.matches(firstOwner, first, 0, PKG, selected(0, 0), 102), "overflow owner retained");
            yes(core.matches(secondOwner, second, 0, PKG, selected(0, 0), 102), "unrelated owner lost");
        });
        test("observation, owner and user-history limits fail closed", () -> {
            SettingsEntryBindings observations = new SettingsEntryBindings(2);
            Object owner = new Object();
            SettingsEntryBindings.Observation first = observations.observe(owner, 0, 0);
            SettingsEntryBindings.Observation second = observations.observe(owner, 0, 0);
            yes(first != null && second != null, "before observation limit");
            yes(observations.observe(owner, 0, 0) == null, "observation limit ignored");
            no(observations.capture(first, items(new Object(), 0), 100), "over-limit old observation");
            SettingsEntryBindings owners = new SettingsEntryBindings(1);
            Object held = new Object();
            eq(0L, owners.generation(held), "initial generation");
            eq(-1L, owners.generation(new Object()), "owner bound ignored");
            eq(-1L, owners.generation(held), "owner exhaustion kept old generation");
            SettingsEntryBindings users = new SettingsEntryBindings(1);
            yes(users.observe(owner, 0, 0) != null, "first user");
            users.retireUser(999);
            yes(users.observe(owner, 0, 0) == null, "history bound ignored");
        });
        test("unknown oversized capture cannot evade tracking then rebind", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings(1);
            Object first = new Object();
            Object second = new Object();
            no(core.capture(null, Arrays.asList(new SettingsEntryBindings.Item(first, 0, PKG),
                    new SettingsEntryBindings.Item(second, 0, PKG)), 100), "unknown capture accepted");
            yes(core.observe(new Object(), 0, 0) == null, "untrackable core resumed");
        });
        test("caller collections run outside the core lock", () -> {
            Fixture f = new Fixture(0, 0);
            List<SettingsEntryBindings.Item> input = new AbstractList<SettingsEntryBindings.Item>() {
                @Override public int size() { return 1; }
                @Override public SettingsEntryBindings.Item get(int index) {
                    requireUnlocked(f.core, f.owner);
                    return new SettingsEntryBindings.Item(new Object(), 0, PKG);
                }
            };
            yes(f.core.capture(f.core.observe(f.owner, 0, 0), input, 101), "custom list not accepted");
            for (SettingsEntryBindings.Check check : f.core.checks()) f.core.complete(check, 0, 102);
            Set<HideTargetCodec.Entry> selection = new AbstractSet<HideTargetCodec.Entry>() {
                @Override public int size() { return 1; }
                @Override public Iterator<HideTargetCodec.Entry> iterator() {
                    requireUnlocked(f.core, f.owner);
                    return selected(0, 0).iterator();
                }
            };
            yes(f.match(f.info, 0, PKG, selection, 102), "custom selection changed result");
        });
        test("Entry subclass callbacks are unnecessary for matching", () -> {
            Fixture f = verified(0, 0);
            HideTargetCodec.Entry entry = new HideTargetCodec.Entry(0, 0, PKG, true) {
                @Override public boolean isBound() { throw new AssertionError("callback isBound"); }
                @Override public boolean isValid() { throw new AssertionError("callback isValid"); }
            };
            yes(f.match(f.info, 0, PKG, Collections.singleton(entry), 102), "immutable fields lost");
        });
        test("matching uses one set lookup rather than scanning every selected target", () -> {
            Fixture f = verified(0, 0);
            final int[] lookups = {0};
            Set<HideTargetCodec.Entry> indexed = new AbstractSet<HideTargetCodec.Entry>() {
                @Override public int size() { return 5000; }
                @Override public boolean contains(Object value) {
                    lookups[0]++;
                    return selected(0, 0).contains(value);
                }
                @Override public Iterator<HideTargetCodec.Entry> iterator() {
                    throw new AssertionError("per-row selection scan");
                }
            };
            yes(f.match(f.info, 0, PKG, indexed, 102), "indexed lookup lost match");
            eq(1, lookups[0], "lookup count");
        });
        test("invalidation during an external selection lookup is rechecked", () -> {
            for (int mode = 0; mode < 3; mode++) {
                Fixture f = verified(0, 0);
                final int mutation = mode;
                Set<HideTargetCodec.Entry> selection = new AbstractSet<HideTargetCodec.Entry>() {
                    @Override public int size() { return 1; }
                    @Override public boolean contains(Object ignored) {
                        if (mutation == 0) f.core.invalidateOwner(f.owner);
                        else if (mutation == 1) f.core.discard(f.info);
                        else f.core.retireUser(0);
                        return true;
                    }
                    @Override public Iterator<HideTargetCodec.Entry> iterator() {
                        throw new AssertionError("unnecessary iterator");
                    }
                };
                no(f.match(f.info, 0, PKG, selection, 102), "lookup retained revoked proof");
            }
        });
        test("null and throwing inputs cannot add authorization", () -> {
            Fixture f = verified(0, 0);
            Set<HideTargetCodec.Entry> throwing = new AbstractSet<HideTargetCodec.Entry>() {
                @Override public int size() { return 1; }
                @Override public Iterator<HideTargetCodec.Entry> iterator() {
                    throw new IllegalStateException("unavailable");
                }
            };
            no(f.match(f.info, 0, PKG, throwing, 102), "throwing selection matched");
            no(f.core.complete(null, 0, 102), "null check");
            SettingsEntryBindings other = new SettingsEntryBindings();
            no(other.complete(only(f.core.checks()), 0, 102), "foreign check");
            List<SettingsEntryBindings.Item> unavailable = new AbstractList<SettingsEntryBindings.Item>() {
                @Override public int size() { throw new IllegalStateException("unavailable"); }
                @Override public SettingsEntryBindings.Item get(int i) { return null; }
            };
            no(f.core.capture(f.core.observe(f.owner, 0, 0), unavailable, 103), "throwing input");
            no(f.matches(103), "failed raw-return copy retained owner proof");
            no(f.core.capture(null, null, 104), "null capture");
        });
        test("retained worker tickets do not strongly retain owner or info", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings();
            WeakFixture weak = weakFixture(core);
            awaitCollection(weak.owner, weak.info);
            yes(weak.owner.get() == null, "core/worker retained owner");
            yes(weak.info.get() == null, "core/worker retained info");
            no(core.complete(weak.check, 0, 101), "collected record authorized");
            no(core.capture(weak.observation, items(new Object(), 0), 101), "collected owner observation");
            eq(0, core.checks().size(), "collected records remain active");
        });
        test("collected tombstones free bounded capacity for new objects", () -> {
            SettingsEntryBindings core = new SettingsEntryBindings(1);
            Object owner = new Object();
            WeakReference<Object> gone = weakInfo(core, owner);
            awaitCollection(gone);
            yes(gone.get() == null, "seen tombstone kept info alive");
            Object fresh = new Object();
            capture(core, owner, fresh, 0, 0, 102);
            yes(core.complete(only(core.checks()), 0, 103), "freed capacity cannot verify");
            yes(core.matches(owner, fresh, 0, PKG, selected(0, 0), 103), "freed capacity functionality");
        });
        System.out.println("SettingsEntryBindings: " + cases + " cases, " + assertions
                + " behavior assertions passed; production core + production codec only");
    }

    private static Fixture verified(int userId, long serial) {
        Fixture fixture = new Fixture(userId, serial);
        yes(fixture.complete(serial, 101), "fixture verification");
        return fixture;
    }

    private static final class Fixture {
        final SettingsEntryBindings core = new SettingsEntryBindings();
        final Object owner = new Object();
        final Object info = new Object();
        final int userId;
        final long serial;
        final Set<HideTargetCodec.Entry> selection;
        Fixture(int userId, long serial) {
            this.userId = userId;
            this.serial = serial;
            selection = selected(userId, serial);
            capture(core, owner, info, userId, serial, 100);
        }
        boolean complete(long actualSerial, long now) {
            return core.complete(only(core.checks()), actualSerial, now);
        }
        boolean matches(long now) { return match(info, userId, PKG, selection, now); }
        boolean match(Object info, int user, String pkg, Set<HideTargetCodec.Entry> selected, long now) {
            return core.matches(owner, info, user, pkg, selected, now);
        }
    }

    private static final class HostileObject {
        @Override public boolean equals(Object other) { throw new AssertionError("equals callback"); }
        @Override public int hashCode() { throw new AssertionError("hashCode callback"); }
    }

    private static final class WeakFixture {
        final WeakReference<Object> owner;
        final WeakReference<Object> info;
        final SettingsEntryBindings.Observation observation;
        final SettingsEntryBindings.Check check;
        WeakFixture(Object owner, Object info, SettingsEntryBindings.Observation observation,
                SettingsEntryBindings.Check check) {
            this.owner = new WeakReference<>(owner);
            this.info = new WeakReference<>(info);
            this.observation = observation;
            this.check = check;
        }
    }

    private static WeakFixture weakFixture(SettingsEntryBindings core) {
        Object owner = new Object();
        Object info = new Object();
        SettingsEntryBindings.Observation before = core.observe(owner, 0, 0);
        yes(core.capture(before, items(info, 0), 100), "weak fixture capture");
        return new WeakFixture(owner, info, before, only(core.checks()));
    }

    private static WeakReference<Object> weakInfo(SettingsEntryBindings core, Object owner) {
        Object info = new Object();
        capture(core, owner, info, 0, 0, 100);
        core.discard(info);
        return new WeakReference<>(info);
    }

    @SafeVarargs private static void awaitCollection(WeakReference<Object>... references) {
        for (int attempt = 0; attempt < 60; attempt++) {
            boolean done = true;
            for (WeakReference<Object> ref : references) done &= ref.get() == null;
            if (done) return;
            System.gc();
            try { Thread.sleep(10); } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new AssertionError(interrupted);
            }
        }
    }

    private static void requireUnlocked(SettingsEntryBindings core, Object owner) {
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread worker = new Thread(() -> {
            try { core.generation(owner); } catch (Throwable error) { failure.set(error); }
        });
        worker.setDaemon(true);
        worker.start();
        try { worker.join(1500); } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new AssertionError(interrupted);
        }
        yes(!worker.isAlive(), "external callback executed while holding core lock");
        yes(failure.get() == null, "callback probe failed");
    }

    private static void capture(SettingsEntryBindings core, Object owner, Object info,
            int userId, long serial, long now) {
        yes(core.capture(core.observe(owner, userId, serial), items(info, userId), now),
                "valid capture rejected");
    }

    private static List<SettingsEntryBindings.Item> items(Object info, int userId) {
        return Collections.singletonList(new SettingsEntryBindings.Item(info, userId, PKG));
    }

    private static Set<HideTargetCodec.Entry> selected(int userId, long serial) {
        return selected(userId, serial, PKG);
    }

    private static Set<HideTargetCodec.Entry> selected(int userId, long serial, String pkg) {
        return Collections.singleton(new HideTargetCodec.Entry(userId, serial, pkg, true));
    }

    private static Set<HideTargetCodec.Entry> parsed(String raw) {
        HideTargetCodec.Selection selection = HideTargetCodec.parse(raw);
        yes(selection.valid, "fixture selection invalid");
        return new HashSet<>(selection.entries);
    }

    private static SettingsEntryBindings.Check only(List<SettingsEntryBindings.Check> checks) {
        eq(1, checks.size(), "expected one check");
        return checks.get(0);
    }

    private static void test(String name, Runnable action) {
        action.run();
        cases++;
        System.out.println("PASS " + cases + " " + name);
    }

    private static void yes(boolean actual, String message) {
        assertions++;
        if (!actual) throw new AssertionError(message);
    }

    private static void no(boolean actual, String message) { yes(!actual, message); }
    private static void eq(long expected, long actual, String message) {
        yes(expected == actual, message + ": expected " + expected + ", got " + actual);
    }
}
