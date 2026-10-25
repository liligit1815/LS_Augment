package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import static ls.augment.com.AtomicWorkbenchWindowLayoutPlan.*;

public final class AtomicWorkbenchWindowLayoutPlanTest {
    private static int cases, assertions;
    private interface Body { void run(); }
    private static void check(boolean value, String message) {
        assertions++;
        if (!value) throw new AssertionError(message);
    }
    private static void equal(Object expected, Object actual, String message) {
        check(expected.equals(actual), message + ": expected=" + expected + ", actual=" + actual);
    }
    private static void test(String name, Body body) {
        body.run(); cases++; System.out.println("PASS " + name);
    }
    private static void rejects(Body body, String message) {
        boolean rejected = false;
        try { body.run(); } catch (IllegalArgumentException expected) { rejected = true; }
        check(rejected, message);
    }
    private static void immutable(Body body, String message) {
        boolean rejected = false;
        try { body.run(); } catch (UnsupportedOperationException expected) { rejected = true; }
        check(rejected, message);
    }
    private static Topology topology(int main, int[] sides, int[] visible) {
        return Topology.of(new int[]{0, 1, 2, 3}, new int[]{main}, main, sides, visible);
    }
    private static Topology ordinary(int[] visible) { return topology(0, new int[]{1, 2, 3}, visible); }
    private static AtomicWorkbenchWindowLayoutPlan plan(Topology t, RailSide side, boolean expanded) {
        return singleMainFour(Rect.ofSize(0, 0, 1000, 901), 4, t, side, expanded);
    }
    private static void geometry(AtomicWorkbenchWindowLayoutPlan p) {
        check(p.framesByWindowId().size() == 4, "all four producer identities retained");
        List<Frame> shown = new ArrayList<>();
        for (int id : p.topology.allWindowIds()) {
            Frame frame = p.frameFor(id);
            check(frame.windowId == id, "frame is keyed by identity");
            check(frame.bounds.width() > 0 && frame.bounds.height() > 0, "producer is never zero-sized");
            if (frame.visible) {
                check(p.viewport.contains(frame.bounds), "visible frame inside viewport");
                for (Frame before : shown) check(!frame.bounds.overlaps(before.bounds), "visible frames disjoint");
                shown.add(frame);
            } else {
                check(frame.bounds.width() == 1 && frame.bounds.height() == 1, "hidden producer is 1x1");
                check(!p.viewport.overlaps(frame.bounds), "hidden producer outside viewport");
            }
        }
        equal(p.mainBounds(), p.frameFor(p.topology.activeMainWindowId).bounds, "active main identity");
        check(p.mainBounds() == p.desktopBounds() && p.mainBounds() == p.coverBounds()
                && p.mainBounds() == p.statusBounds(), "all main overlays share one immutable anchor");
    }

    public static void main(String[] ignored) {
        test("Duo current right-rail rectangles and last-row remainder", () -> {
            AtomicWorkbenchWindowLayoutPlan p = plan(ordinary(new int[]{1, 2, 3}), RailSide.RIGHT, false);
            equal(new Rect(0, 0, 747, 901), p.mainBounds(), "existing main 3/4 proportion");
            equal(new Rect(751, 0, 1000, 297), p.frameFor(1).bounds, "first side");
            equal(new Rect(751, 301, 1000, 598), p.frameFor(2).bounds, "second side");
            equal(new Rect(751, 602, 1000, 901), p.frameFor(3).bounds, "last side absorbs remainder");
            geometry(p);
        });
        test("left rail is a physical mirror with aligned overlays", () -> {
            AtomicWorkbenchWindowLayoutPlan p = plan(ordinary(new int[]{1, 2, 3}), RailSide.LEFT, false);
            equal(new Rect(253, 0, 1000, 901), p.mainBounds(), "main origin moves with rail");
            equal(new Rect(0, 0, 249, 297), p.frameFor(1).bounds, "left side origin");
            geometry(p);
        });
        test("all identity permutations / sparse visible subsets / both rails", () -> {
            int[] ids = {0, 1, 2, 3};
            for (int main : ids) for (int a : ids) for (int b : ids) for (int c : ids) {
                if (main == a || main == b || main == c || a == b || a == c || b == c) continue;
                int[] sides = {a, b, c};
                for (int mask = 0; mask < 8; mask++) {
                    int[] visible = new int[Integer.bitCount(mask)]; int next = 0;
                    for (int i = 0; i < 3; i++) if ((mask & (1 << i)) != 0) visible[next++] = sides[i];
                    for (RailSide rail : RailSide.values()) {
                        AtomicWorkbenchWindowLayoutPlan p = plan(topology(main, sides, visible), rail, false);
                        geometry(p);
                        equal(Arrays.stream(visible).boxed().toList(), p.presentedSideWindowIds(), "side visual order retains IDs");
                        for (int index = 0; index < visible.length; index++) {
                            check(p.frameFor(visible[index]).visible, "selected side identity shown");
                            check(p.frameFor(visible[index]).role == Role.SIDE, "side role independent of identity number");
                            if (index > 0) check(p.frameFor(visible[index]).bounds.top
                                    == p.frameFor(visible[index - 1]).bounds.bottom + 4, "exact inter-row gap");
                        }
                        AtomicWorkbenchWindowLayoutPlan opposite = plan(topology(main, sides, visible),
                                rail == RailSide.LEFT ? RailSide.RIGHT : RailSide.LEFT, false);
                        for (int id : ids) if (p.frameFor(id).visible) {
                            Rect first = p.frameFor(id).bounds, second = opposite.frameFor(id).bounds;
                            check(first.left == 1000 - second.right && first.right == 1000 - second.left,
                                    "mirror is symmetric by stable identity");
                            check(first.top == second.top && first.bottom == second.bottom, "mirror retains vertical geometry");
                        }
                    }
                }
            }
        });
        test("non-sequential future pool IDs do not become visual array indices", () -> {
            Topology t = Topology.of(new int[]{7, 1, 5, 3}, new int[]{5}, 5,
                    new int[]{3, 7, 1}, new int[]{7, 1});
            AtomicWorkbenchWindowLayoutPlan p = plan(t, RailSide.LEFT, false);
            geometry(p);
            check(p.frameFor(5).role == Role.MAIN, "active ID 5 is main");
            check(p.frameFor(3).bounds.equals(new Rect(-2, -2, -1, -1)), "hidden ID3 retained");
            check(p.frameFor(7).bounds.top == 0 && p.frameFor(1).bounds.top > 0, "ordered IDs7 then1");
            rejects(() -> p.frameFor(0), "undeclared identity rejected");
        });
        test("fullscreen hides every side producer and exact collapse restores role geometry", () -> {
            for (RailSide side : RailSide.values()) {
                Topology t = topology(2, new int[]{3, 0, 1}, new int[]{3, 1});
                AtomicWorkbenchWindowLayoutPlan before = plan(t, side, false);
                AtomicWorkbenchWindowLayoutPlan full = plan(t, side, true);
                equal(new Rect(0, 0, 1000, 901), full.mainBounds(), "fullscreen main spans viewport");
                check(full.presentedSideWindowIds().isEmpty(), "fullscreen has no presented sides");
                equal(Arrays.asList(3, 1), t.visibleSideWindowIds(), "fullscreen does not mutate configured visibility");
                geometry(full);
                AtomicWorkbenchWindowLayoutPlan after = plan(t, side, false);
                for (int id : t.allWindowIds()) {
                    equal(before.frameFor(id).bounds, after.frameFor(id).bounds, "collapse restores identity rect");
                    check(before.frameFor(id).visible == after.frameFor(id).visible, "collapse restores visibility");
                }
            }
        });
        test("no visible sides uses full viewport without losing three hidden consumers", () -> {
            AtomicWorkbenchWindowLayoutPlan p = plan(ordinary(new int[]{}), RailSide.LEFT, false);
            equal(p.viewport, p.mainBounds(), "main uses all space"); geometry(p);
        });
        test("inset content does not hide retained producers in visible parent chrome", () -> {
            Rect parent = Rect.ofSize(0, 0, 1200, 1600);
            Rect content = new Rect(100, 100, 1100, 1500);
            Rect topChrome = new Rect(0, 0, 1200, 100);
            Rect leftChrome = new Rect(0, 100, 100, 1600);
            for (RailSide side : RailSide.values()) for (boolean expanded : new boolean[]{false, true}) {
                AtomicWorkbenchWindowLayoutPlan p = singleMainFour(content, 4, ordinary(new int[]{1}), side, expanded);
                geometry(p);
                for (Frame frame : p.framesByWindowId().values()) if (!frame.visible) {
                    equal(new Rect(-2, -2, -1, -1), frame.bounds, "hidden rect is parent-local constant");
                    check(!parent.overlaps(frame.bounds), "hidden consumer cannot paint inside parent");
                    check(!topChrome.overlaps(frame.bounds) && !leftChrome.overlaps(frame.bounds),
                            "hidden consumer cannot paint in inset chrome");
                }
                check(parent.contains(p.mainBounds()), "visible content remains inside parent");
            }
        });
        test("workspace insets and nonzero top are part of every shared anchor", () -> {
            Rect bounds = Rect.ofSize(17, 29, 1000, 901);
            AtomicWorkbenchWindowLayoutPlan p = singleMainFour(bounds, 4,
                    ordinary(new int[]{1, 3}), RailSide.LEFT, false);
            equal(new Rect(270, 29, 1017, 930), p.mainBounds(), "inset mirrored main");
            equal(new Rect(17, 29, 266, 477), p.frameFor(1).bounds, "inset first side");
            equal(new Rect(17, 481, 266, 930), p.frameFor(3).bounds, "inset second side");
            equal(new Rect(-2, -2, -1, -1), p.frameFor(2).bounds, "hidden producer outside parent origin");
            geometry(p);
        });
        test("positive minimum-size viewports and zero divider never overlap", () -> {
            AtomicWorkbenchWindowLayoutPlan p = singleMainFour(Rect.ofSize(0, 0, 2, 3), 0,
                    ordinary(new int[]{1, 2, 3}), RailSide.LEFT, false);
            equal(new Rect(1, 0, 2, 3), p.mainBounds(), "minimum positive main"); geometry(p);
        });
        test("rect boundaries, containment and edge touching use exclusive edges", () -> {
            Rect one = new Rect(-2, -2, -1, -1), two = new Rect(-1, -2, 0, -1);
            check(!one.overlaps(two), "touching edges do not overlap");
            check(one.contains(one) && !one.contains(two), "containment exact");
            rejects(() -> new Rect(1, 0, 1, 1), "zero width rejected");
            rejects(() -> new Rect(0, 1, 1, 0), "negative height rejected");
            rejects(() -> new Rect(Integer.MIN_VALUE, 0, Integer.MAX_VALUE, 1), "width overflow rejected");
            rejects(() -> Rect.ofSize(Integer.MAX_VALUE, 0, 1, 1), "right overflow rejected");
            rejects(() -> Rect.ofSize(0, Integer.MAX_VALUE, 1, 1), "bottom overflow rejected");
            rejects(() -> Rect.ofSize(0, 0, -1, 1), "negative size rejected");
            equal(one, new Rect(-2, -2, -1, -1), "value equality");
            check(one.hashCode() == new Rect(-2, -2, -1, -1).hashCode(), "equal hash");
        });
        test("impossible width and height reject instead of clipping or overlapping", () -> {
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 5, 20), 4, ordinary(new int[]{1}), RailSide.RIGHT, false), "width only1 left");
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 100, 10), 4, ordinary(new int[]{1, 2, 3}), RailSide.RIGHT, false), "height only2 left");
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 100, 20), Integer.MAX_VALUE,
                    ordinary(new int[]{1, 2, 3}), RailSide.RIGHT, false), "gap multiplication does not overflow");
            rejects(() -> singleMainFour(Rect.ofSize(-1, 0, 100, 20), 4, ordinary(new int[]{1}), RailSide.RIGHT, false), "negative viewport origin unsupported");
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 100, 20), -1, ordinary(new int[]{1}), RailSide.RIGHT, false), "negative gap rejected");
            rejects(() -> singleMainFour(null, 4, ordinary(new int[]{1}), RailSide.RIGHT, false), "missing viewport rejected");
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 100, 20), 4, null, RailSide.RIGHT, false), "missing topology rejected");
            rejects(() -> singleMainFour(Rect.ofSize(0, 0, 100, 20), 4, ordinary(new int[]{1}), null, false), "missing rail rejected");
        });
        test("full viewport remains valid near coordinate limit when rail is unused", () -> {
            Rect edge = new Rect(Integer.MAX_VALUE - 100, Integer.MAX_VALUE - 50, Integer.MAX_VALUE, Integer.MAX_VALUE);
            AtomicWorkbenchWindowLayoutPlan p = singleMainFour(edge, Integer.MAX_VALUE,
                    ordinary(new int[]{1, 2, 3}), RailSide.RIGHT, true);
            equal(edge, p.mainBounds(), "unused rail has no overflowing coordinate"); geometry(p);
        });
        test("complete role partition rejects missing, duplicate and foreign identities", () -> {
            rejects(() -> Topology.of(new int[]{0, 1, 2, 3}, new int[]{0}, 0, new int[]{1, 2}, new int[]{}), "missing side identity");
            rejects(() -> Topology.of(new int[]{0, 1, 2, 3}, new int[]{0}, 0, new int[]{1, 2, 4}, new int[]{}), "foreign side identity");
            rejects(() -> Topology.of(new int[]{0, 1, 2, 2}, new int[]{0}, 0, new int[]{1, 2, 3}, new int[]{}), "duplicate all identity");
            rejects(() -> topology(0, new int[]{0, 1, 2}, new int[]{}), "main cannot also be side");
            rejects(() -> topology(0, new int[]{1, 1, 3}, new int[]{}), "duplicate side identity");
            rejects(() -> Topology.of(new int[]{0, 1, 2, 3}, new int[]{0}, 3, new int[]{1, 2, 3}, new int[]{}), "active side cannot be main");
            rejects(() -> ordinary(new int[]{0}), "visible main is not side");
            rejects(() -> ordinary(new int[]{2, 1}), "visible order cannot contradict side order");
            rejects(() -> ordinary(new int[]{1, 1}), "duplicate visible identity");
            rejects(() -> Topology.of(new int[]{0, 1, 2, 8}, new int[]{0}, 0, new int[]{1, 2, 8}, new int[]{}), "identity pool bounded");
            rejects(() -> Topology.of(new int[]{0, 1, 2, -1}, new int[]{0}, 0, new int[]{1, 2, -1}, new int[]{}), "negative ID rejected");
            rejects(() -> Topology.of(null, new int[]{0}, 0, new int[]{1, 2, 3}, new int[]{}), "missing declared identity list");
        });
        test("future topology is explicit but unsupported geometry is fail-closed", () -> {
            Topology dual = Topology.of(new int[]{0, 1, 2, 3, 4, 5, 6, 7}, new int[]{0, 1}, 1,
                    new int[]{2, 3, 4, 5, 6, 7}, new int[]{2, 3, 4});
            check(dual.mainWindowIds().size() == 2 && dual.sideWindowIds().size() == 6, "future contract can name both main IDs");
            rejects(() -> plan(dual, RailSide.RIGHT, false), "dual layout is not silently rendered as single");
            Topology six = Topology.of(new int[]{0, 1, 2, 3, 4, 5, 6}, new int[]{0}, 0,
                    new int[]{1, 2, 3, 4, 5, 6}, new int[]{1, 2, 3, 4, 5, 6});
            rejects(() -> plan(six, RailSide.LEFT, false), "six-side renderer not falsely implemented");
        });
        test("caller mutations cannot alter a plan or topology", () -> {
            int[] all = {0, 1, 2, 3}, main = {2}, side = {3, 0, 1}, visible = {3, 1};
            Topology t = Topology.of(all, main, 2, side, visible);
            AtomicWorkbenchWindowLayoutPlan p = plan(t, RailSide.RIGHT, false);
            all[0] = 7; main[0] = 7; side[0] = 7; visible[0] = 7;
            equal(Arrays.asList(0, 1, 2, 3), t.allWindowIds(), "all array copied");
            equal(Arrays.asList(2), t.mainWindowIds(), "main array copied");
            equal(Arrays.asList(3, 0, 1), t.sideWindowIds(), "side array copied");
            equal(Arrays.asList(3, 1), p.presentedSideWindowIds(), "visible array copied");
            immutable(() -> t.allWindowIds().clear(), "all list immutable");
            immutable(() -> t.mainWindowIds().add(1), "main list immutable");
            immutable(() -> t.sideWindowIds().set(0, 1), "side list immutable");
            immutable(() -> t.visibleSideWindowIds().clear(), "visible list immutable");
            immutable(() -> p.framesByWindowId().clear(), "frame map immutable");
            immutable(() -> p.presentedSideWindowIds().clear(), "presented list immutable");
            geometry(p);
        });
        test("deterministic varied dimensions / density-scaled gaps / inset mirror", () -> {
            Random random = new Random(0xD009L);
            for (int n = 0; n < 3000; n++) {
                int gap = random.nextInt(17), count = random.nextInt(4), x = random.nextInt(101), y = random.nextInt(101);
                int width = gap + 2 + random.nextInt(4000), height = 3 + 2 * gap + random.nextInt(4000);
                int[] visible = Arrays.copyOf(new int[]{1, 2, 3}, count);
                Rect bounds = Rect.ofSize(x, y, width, height);
                AtomicWorkbenchWindowLayoutPlan right = singleMainFour(bounds, gap, ordinary(visible), RailSide.RIGHT, false);
                AtomicWorkbenchWindowLayoutPlan left = singleMainFour(bounds, gap, ordinary(visible), RailSide.LEFT, false);
                geometry(right); geometry(left);
                for (int id : right.topology.allWindowIds()) if (right.frameFor(id).visible) {
                    Rect a = right.frameFor(id).bounds, b = left.frameFor(id).bounds;
                    check((long) a.left + b.right == (long) bounds.left + bounds.right, "inset mirror axis");
                    check(a.width() == b.width() && a.height() == b.height(), "mirror dimensions exact");
                }
                if (count > 0) check(right.frameFor(visible[count - 1]).bounds.bottom == bounds.bottom, "last row reaches bottom exactly");
            }
        });
        System.out.println("RESULT cases=" + cases + " assertions=" + assertions);
    }
}
