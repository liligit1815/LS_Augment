package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/** Immutable presentation geometry. Window IDs are identities, never visual indices.
 *
 * This class does not own, create, resize or release Android displays, tasks or Surfaces.
 * Topology can describe the bounded future identity pool; singleMainFour deliberately
 * renders only the current four-window, one-main contract until other modes are implemented.
 */
public final class AtomicWorkbenchWindowLayoutPlan {
    public static final int MAX_WINDOW_IDENTITIES = 8;

    /** The side rail's physical position, independent of layout direction / locale. */
    public enum RailSide { LEFT, RIGHT }
    public enum Role { MAIN, SIDE }

    /** Coordinates in the workspace parent, with exclusive right / bottom edges. */
    public static final class Rect {
        public final int left, top, right, bottom;

        public Rect(int left, int top, int right, int bottom) {
            long width = (long) right - left, height = (long) bottom - top;
            if (width < 1 || height < 1 || width > Integer.MAX_VALUE || height > Integer.MAX_VALUE)
                throw new IllegalArgumentException("non-positive or overflowing rectangle");
            this.left = left; this.top = top; this.right = right; this.bottom = bottom;
        }

        public static Rect ofSize(int left, int top, int width, int height) {
            if (width < 1 || height < 1) throw new IllegalArgumentException("non-positive size");
            return new Rect(left, top, checked((long) left + width), checked((long) top + height));
        }

        public int width() { return right - left; }
        public int height() { return bottom - top; }
        public boolean contains(Rect other) {
            return other != null && left <= other.left && top <= other.top
                    && right >= other.right && bottom >= other.bottom;
        }
        public boolean overlaps(Rect other) {
            return other != null && left < other.right && other.left < right
                    && top < other.bottom && other.top < bottom;
        }
        @Override public boolean equals(Object value) {
            if (!(value instanceof Rect)) return false;
            Rect other = (Rect) value;
            return left == other.left && top == other.top && right == other.right && bottom == other.bottom;
        }
        @Override public int hashCode() { return Objects.hash(left, top, right, bottom); }
        @Override public String toString() { return "[" + left + "," + top + "," + right + "," + bottom + "]"; }
    }

    /** Complete, explicit role partition. Visible sides are an ordered subset of side IDs.
     * All lists are defensive immutable copies. Two-main / up-to-six-side descriptions
     * are accepted here, but rejected by the current single-main renderer.
     */
    public static final class Topology {
        private final List<Integer> allWindowIds, mainWindowIds, sideWindowIds, visibleSideWindowIds;
        public final int activeMainWindowId;

        private Topology(int[] all, int[] mains, int activeMain, int[] sides, int[] visibleSides) {
            allWindowIds = identities(all, "all windows");
            mainWindowIds = identities(mains, "main windows");
            sideWindowIds = identities(sides, "side windows");
            visibleSideWindowIds = identities(visibleSides, "visible sides");
            if (allWindowIds.isEmpty() || allWindowIds.size() > MAX_WINDOW_IDENTITIES
                    || mainWindowIds.isEmpty() || mainWindowIds.size() > 2 || sideWindowIds.size() > 6)
                throw new IllegalArgumentException("unsupported identity partition size");
            Set<Integer> partition = new HashSet<>(mainWindowIds);
            for (int id : sideWindowIds) if (!partition.add(id))
                throw new IllegalArgumentException("window has overlapping roles");
            if (partition.size() != allWindowIds.size() || !partition.containsAll(allWindowIds))
                throw new IllegalArgumentException("missing or unknown window identity");
            if (!mainWindowIds.contains(activeMain)) throw new IllegalArgumentException("active window is not a main");
            int previous = -1;
            for (int id : visibleSideWindowIds) {
                int index = sideWindowIds.indexOf(id);
                if (index <= previous) throw new IllegalArgumentException("visible sides are not an ordered subset");
                previous = index;
            }
            activeMainWindowId = activeMain;
        }

        public static Topology of(int[] all, int[] mains, int activeMain, int[] sides, int[] visibleSides) {
            return new Topology(all, mains, activeMain, sides, visibleSides);
        }
        public List<Integer> allWindowIds() { return allWindowIds; }
        public List<Integer> mainWindowIds() { return mainWindowIds; }
        public List<Integer> sideWindowIds() { return sideWindowIds; }
        public List<Integer> visibleSideWindowIds() { return visibleSideWindowIds; }

        private static List<Integer> identities(int[] input, String name) {
            if (input == null || input.length > MAX_WINDOW_IDENTITIES) throw new IllegalArgumentException(name);
            List<Integer> copy = new ArrayList<>(input.length);
            Set<Integer> seen = new HashSet<>();
            for (int id : input) {
                if (id < 0 || id >= MAX_WINDOW_IDENTITIES || !seen.add(id))
                    throw new IllegalArgumentException("invalid or duplicate " + name);
                copy.add(id);
            }
            return Collections.unmodifiableList(copy);
        }
    }

    public static final class Frame {
        public final int windowId;
        public final Role role;
        /** False means an offscreen 1x1 producer, not GONE / INVISIBLE / a closed window. */
        public final boolean visible;
        public final Rect bounds;

        private Frame(int id, Role role, boolean visible, Rect bounds) {
            windowId = id; this.role = role; this.visible = visible; this.bounds = bounds;
        }
    }

    public final Rect viewport;
    public final Topology topology;
    public final RailSide railSide;
    public final boolean expanded;
    public final int gapPx;
    private final Rect mainBounds;
    private final Map<Integer, Frame> frames;
    private final List<Integer> presentedSideWindowIds;

    private AtomicWorkbenchWindowLayoutPlan(Rect viewport, Topology topology, RailSide side,
            boolean expanded, int gapPx, Rect mainBounds, Map<Integer, Frame> frames, List<Integer> presented) {
        this.viewport = viewport; this.topology = topology; railSide = side;
        this.expanded = expanded; this.gapPx = gapPx; this.mainBounds = mainBounds;
        this.frames = Collections.unmodifiableMap(new LinkedHashMap<>(frames));
        presentedSideWindowIds = Collections.unmodifiableList(new ArrayList<>(presented));
        verifyGeometry();
    }

    /** gapPx is the existing Duo ui.dp(4); no density / new visual proportions live here. */
    public static AtomicWorkbenchWindowLayoutPlan singleMainFour(Rect viewport, int gapPx,
            Topology topology, RailSide railSide, boolean expanded) {
        if (viewport == null || topology == null || railSide == null || gapPx < 0
                || viewport.left < 0 || viewport.top < 0) throw new IllegalArgumentException("invalid layout input");
        if (topology.allWindowIds().size() != 4 || topology.mainWindowIds().size() != 1
                || topology.sideWindowIds().size() != 3)
            throw new IllegalArgumentException("only four identities / one main is implemented");
        List<Integer> visible = expanded ? Collections.emptyList() : topology.visibleSideWindowIds();
        int count = visible.size(), width = viewport.width(), height = viewport.height();
        int sideWidth = 0, mainWidth = width, sideHeight = 1;
        if (count > 0) {
            long availableWidth = (long) width - gapPx;
            long availableHeight = (long) height - (long) (count - 1) * gapPx;
            if (availableWidth < 2 || availableHeight < count)
                throw new IllegalArgumentException("viewport cannot contain non-overlapping positive frames");
            sideWidth = Math.max(1, (int) (availableWidth / 4));
            mainWidth = (int) availableWidth - sideWidth;
            sideHeight = (int) (availableHeight / count);
        }
        int mainLeft = viewport.left + (count > 0 && railSide == RailSide.LEFT ? sideWidth + gapPx : 0);
        Rect main = Rect.ofSize(mainLeft, viewport.top, mainWidth, height);
        int railLeft = count == 0 || railSide == RailSide.LEFT ? viewport.left : checked((long) main.right + gapPx);
        Map<Integer, Frame> frames = new LinkedHashMap<>();
        for (int id : topology.allWindowIds()) {
            if (id == topology.activeMainWindowId) {
                frames.put(id, new Frame(id, Role.MAIN, true, main));
                continue;
            }
            int index = visible.indexOf(id);
            Rect rect;
            if (index < 0) rect = hiddenProducer();
            else {
                int top = checked((long) viewport.top + (long) index * (sideHeight + (long) gapPx));
                int frameHeight = index == count - 1 ? viewport.bottom - top : sideHeight;
                rect = Rect.ofSize(railLeft, top, sideWidth, frameHeight);
            }
            frames.put(id, new Frame(id, Role.SIDE, index >= 0, rect));
        }
        return new AtomicWorkbenchWindowLayoutPlan(viewport, topology, railSide, expanded, gapPx, main, frames, visible);
    }

    public Rect mainBounds() { return mainBounds; }
    public Rect desktopBounds() { return mainBounds; }
    public Rect coverBounds() { return mainBounds; }
    /** Bounds anchoring the existing wrap-content status at this rectangle's bottom edge. */
    public Rect statusBounds() { return mainBounds; }
    public List<Integer> presentedSideWindowIds() { return presentedSideWindowIds; }
    public Map<Integer, Frame> framesByWindowId() { return frames; }
    public Frame frameFor(int windowId) {
        Frame frame = frames.get(windowId);
        if (frame == null) throw new IllegalArgumentException("window not in this plan");
        return frame;
    }

    private static Rect hiddenProducer() {
        // Parent-local, outside its origin, not merely outside an inset content viewport.
        // The Android adapter must preserve the existing parent clipping behavior.
        return Rect.ofSize(-2, -2, 1, 1);
    }

    private void verifyGeometry() {
        if (frames.size() != topology.allWindowIds().size()) throw new IllegalArgumentException("missing frame");
        List<Frame> visible = new ArrayList<>();
        for (int id : topology.allWindowIds()) {
            Frame frame = frameFor(id);
            if (frame.windowId != id) throw new IllegalArgumentException("frame identity mismatch");
            if (frame.visible) {
                if (!viewport.contains(frame.bounds)) throw new IllegalArgumentException("visible frame outside viewport");
                for (Frame previous : visible) if (frame.bounds.overlaps(previous.bounds))
                    throw new IllegalArgumentException("visible frames overlap");
                visible.add(frame);
            } else if (!frame.bounds.equals(hiddenProducer()) || frame.bounds.overlaps(viewport))
                throw new IllegalArgumentException("hidden producer must remain 1x1 outside the parent origin");
        }
    }

    private static int checked(long value) {
        if (value < Integer.MIN_VALUE || value > Integer.MAX_VALUE) throw new IllegalArgumentException("coordinate overflow");
        return (int) value;
    }
}
