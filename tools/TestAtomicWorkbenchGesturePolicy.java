package ls.augment.com;

public final class TestAtomicWorkbenchGesturePolicy {
    private static final AtomicWorkbenchGesturePolicy.Geometry PHONE = geometry(400, 900, 1, 24);
    private static int checks;

    public static void main(String[] args) {
        AtomicWorkbenchGesturePolicy.Detector left = detector();
        point(left, 0, 10, 40, 100, 0, "left DOWN only arms");
        point(left, 2, 11, 39, 120, 0, "small initial jitter");
        point(left, 2, 38, 60, 180, 0, "inward path");
        point(left, 2, 79, 88, 240, 0, "historical path sample");
        point(left, 2, 77, 90, 260, 0, "small reverse jitter");
        point(left, 2, 120, 120, 320, 0, "threshold never triggers before release");
        point(left, 1, 120, 120, 350, 1, "left release triggers");
        point(left, 1, 120, 120, 360, 0, "single trigger per gesture");
        point(left, 0, 10, 40, 500, 0, "cooldown DOWN ignored");
        point(left, 1, 120, 120, 700, 0, "cooldown gesture ignored");
        point(left, 0, 10, 40, 1550, 0, "cooldown boundary re-arms");
        point(left, 1, 120, 120, 1750, 1, "gesture after cooldown works");
        point(left, 0, 10, 40, 1700, 0, "backwards clock cannot bypass cooldown");
        point(left, 1, 120, 120, 1900, 0, "backwards DOWN stays cancelled");

        AtomicWorkbenchGesturePolicy.Detector right = detector();
        point(right, 0, 390, 40, 100, 0, "right DOWN");
        point(right, 2, 365, 61, 160, 0, "right path");
        point(right, 2, 310, 91, 220, 0, "right continued");
        point(right, 1, 280, 120, 300, 2, "right inward release");

        noGesture(30, 40, 140, 120, "outside narrow side band");
        noGesture(10, 20, 120, 100, "status bar excluded");
        noGesture(10, 150, 120, 230, "middle side excluded");
        noGesture(10, 40, 140, 45, "horizontal back rejected");
        noGesture(10, 40, 15, 180, "vertical notification pull rejected");
        noGesture(10, 40, 200, 100, "shallow diagonal rejected");
        noGesture(10, 40, 100, 260, "steep diagonal rejected");
        noGesture(10, 40, 80, 100, "short accidental swipe rejected");
        noGesture(390, 40, 399, 130, "right outward swipe rejected");

        AtomicWorkbenchGesturePolicy.Detector multi = armed();
        equal(event(multi, 2, 0, 2, true, true, 60, 80, 160, PHONE), 0, "second finger cancels");
        point(multi, 1, 120, 120, 300, 0, "lifting extra finger does not revive gesture");
        AtomicWorkbenchGesturePolicy.Detector display = armed();
        equal(event(display, 2, 1, 1, true, true, 60, 80, 160, PHONE), 0, "secondary display cancels");
        point(display, 1, 120, 120, 300, 0, "returning to default display does not revive");
        AtomicWorkbenchGesturePolicy.Detector disabled = armed();
        equal(event(disabled, 2, 0, 1, true, false, 60, 80, 160, PHONE), 0, "disable during gesture cancels");
        point(disabled, 1, 120, 120, 300, 0, "re-enable cannot revive old DOWN");
        AtomicWorkbenchGesturePolicy.Detector mouse = detector();
        equal(event(mouse, 0, 0, 1, false, true, 10, 40, 100, PHONE), 0, "mouse cannot arm");
        point(mouse, 1, 120, 120, 300, 0, "mouse DOWN never owns touch UP");
        AtomicWorkbenchGesturePolicy.Detector rotation = armed();
        equal(event(rotation, 2, 0, 1, true, true, 60, 80, 160, geometry(900, 400, 1, 24)), 0, "rotation cancels");
        point(rotation, 1, 120, 120, 300, 0, "old geometry cannot resume");
        AtomicWorkbenchGesturePolicy.Detector density = armed();
        equal(event(density, 1, 0, 1, true, true, 120, 120, 300, geometry(400, 900, 1.1f, 24)), 0, "density change cancels");
        AtomicWorkbenchGesturePolicy.Detector bar = armed();
        equal(event(bar, 1, 0, 1, true, true, 120, 120, 300, geometry(400, 900, 1, 30)), 0, "inset change cancels");
        AtomicWorkbenchGesturePolicy.Detector reverse = armed();
        point(reverse, 2, 100, 110, 200, 0, "long forward path");
        point(reverse, 2, 50, 75, 230, 0, "substantial reversal cancels");
        point(reverse, 1, 120, 120, 300, 0, "forward again remains cancelled");
        AtomicWorkbenchGesturePolicy.Detector upward = armed();
        point(upward, 2, 40, 20, 150, 0, "upward detour cancels");
        point(upward, 1, 120, 120, 300, 0, "downward ending cannot hide upward path");
        AtomicWorkbenchGesturePolicy.Detector nonmonotonic = armed();
        point(nonmonotonic, 2, 60, 75, 200, 0, "ordered sample");
        point(nonmonotonic, 2, 80, 90, 180, 0, "stale historical sample cancels");
        point(nonmonotonic, 1, 120, 120, 300, 0, "nonmonotonic path cannot revive");
        AtomicWorkbenchGesturePolicy.Detector timeout = armed();
        point(timeout, 1, 120, 120, 901, 0, "long hold rejected");
        AtomicWorkbenchGesturePolicy.Detector fast = armed();
        point(fast, 1, 120, 120, 150, 0, "instant movement rejected");
        AtomicWorkbenchGesturePolicy.Detector cancelled = armed();
        point(cancelled, 3, 50, 70, 160, 0, "CANCEL");
        point(cancelled, 1, 120, 120, 300, 0, "cancelled UP ignored");
        AtomicWorkbenchGesturePolicy.Detector malformed = armed();
        point(malformed, 2, Float.NaN, 70, 160, 0, "nonfinite movement cancels");
        point(malformed, 1, 120, 120, 300, 0, "nonfinite path cannot revive");
        AtomicWorkbenchGesturePolicy.Detector boundary = armed();
        point(boundary, 2, -1, 70, 160, 0, "out of screen cancels");
        point(boundary, 1, 120, 120, 300, 0, "out of screen path cannot revive");
        AtomicWorkbenchGesturePolicy.Detector pointerAction = armed();
        point(pointerAction, 5, 40, 70, 160, 0, "pointer down action cancels");
        point(pointerAction, 1, 120, 120, 300, 0, "pointer action cannot revive");
        AtomicWorkbenchGesturePolicy.Geometry highDensity = geometry(1200, 2700, 3, 72);
        AtomicWorkbenchGesturePolicy.Detector scaled = detector();
        equal(event(scaled, 0, 0, 1, true, true, 30, 120, 100, highDensity), 0, "density-scaled DOWN");
        equal(event(scaled, 1, 0, 1, true, true, 360, 360, 300, highDensity), 1, "same physical dp path works");
        rejects(() -> geometry(0, 900, 1, 24));
        rejects(() -> geometry(400, 900, Float.NaN, 24));
        rejects(() -> geometry(400, 900, 0, 24));
        rejects(() -> geometry(400, 900, 1, 900));
        rejects(() -> geometry(400, 900, 1, -1));
        rejects(() -> geometry(400, 240, 3, 200));
        entryParameters();
        readiness();
        queuedRequests();
        System.out.println("Atomic workbench gesture checks: " + checks + " OK");
    }

    private static void entryParameters() {
        for (int area : new int[]{50, 100, 120}) for (int sensitivity : new int[]{60, 100, 160}) {
            AtomicWorkbenchGesturePolicy.Geometry g = AtomicWorkbenchGesturePolicy.Geometry.create(1216, 2688, 3.25f, 90, area, sensitivity);
            require(g.minY == 116f && g.maxY > g.minY && g.maxY <= 2688f * .28f, "real phone safe area");
            require(g.side(g.edge, g.minY) == 1 && g.side(1216-g.edge, g.maxY) == 2, "both actual region boundaries");
            require(g.side(g.edge+1f, g.minY) == 0 && g.side(1216-g.edge-1f, g.maxY) == 0, "outside both regions");
            require(g.side(1f, g.minY-1f) == 0 && g.side(1215f, g.maxY+1f) == 0, "status bar and lower edge excluded");
            require(Math.abs(g.minInward - 8800f/sensitivity) < .001f
                    && Math.abs(g.minDownward - 5600f/sensitivity) < .001f, "inverse sensitivity formula");
        }
        require(PHONE.same(AtomicWorkbenchGesturePolicy.Geometry.create(400, 900, 1, 24, 100, 100)), "old geometry exact default");
        AtomicWorkbenchGesturePolicy.Geometry small = AtomicWorkbenchGesturePolicy.Geometry.create(400, 900, 1, 24, 50, 100);
        AtomicWorkbenchGesturePolicy.Geometry large = AtomicWorkbenchGesturePolicy.Geometry.create(400, 900, 1, 24, 120, 100);
        require(small.edge==12f && small.maxY==80f && large.edge==28.8f && large.maxY>PHONE.maxY, "area scales both usable dimensions");
        for (int sensitivity : new int[]{60, 100, 160}) {
            AtomicWorkbenchGesturePolicy.Geometry g=AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,sensitivity);
            AtomicWorkbenchGesturePolicy.Detector d=detector();
            event(d,0,0,1,true,true,10,40,100,g);
            int result=event(d,1,0,1,true,true,80,90,300,g);
            equal(result,sensitivity==160?1:0,"sensitivity changes real gesture threshold");
        }
        for (AtomicWorkbenchGesturePolicy.Geometry changed : new AtomicWorkbenchGesturePolicy.Geometry[]{small,large,
                AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,160)}) {
            AtomicWorkbenchGesturePolicy.Detector d=armed();
            equal(event(d,1,0,1,true,true,120,120,300,changed),0,"parameter change cancels in-flight gesture");
        }
        for (int value:new int[]{49,121}) rejects(()->AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,value,100));
        for (int value:new int[]{59,161}) rejects(()->AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,value));
        AtomicWorkbenchGesturePolicy.Geometry landscape=AtomicWorkbenchGesturePolicy.Geometry.create(2688,1216,3.25f,90,120,160);
        require(landscape.maxY<=1216*.28f&&landscape.side(2687,landscape.maxY)==2,"landscape keeps current phone limits");
    }

    private static void readiness() {
        require("atomic_workbench_enabled".equals(AtomicWorkbenchConfig.ENABLED), "stable persisted enable key");
        String current = AtomicWorkbenchConfig.evidence(true, 20554, 987, 8, 100000, "");
        ready(current, 20554, 8, 987, 100010, true, "current evidence");
        ready(current, 20554, 8, 0, 100010, true, "display without root PID read");
        ready(current, 20553, 8, 987, 100010, false, "different installed build");
        ready(current, 20554, 9, 987, 100010, false, "previous boot");
        ready(current, 20554, 8, 988, 100010, false, "different live system_server PID");
        ready(current, 20554, 8, 987, 145001, false, "expired heartbeat");
        ready(current, 20554, 8, 987, 99999, false, "future elapsed time");
        ready(current, 20554, -1, 987, 100010, false, "unknown boot cannot pass");
        ready(current + ";pid=987", 20554, 8, 987, 100010, false, "duplicate field");
        ready("", 20554, 8, 987, 100010, false, "missing key is unavailable");
        ready("x".repeat(513), 20554, 8, 987, 100010, false, "bounded diagnostics");
        ready(AtomicWorkbenchConfig.evidence(true, 20554, 0, 8, 100000, ""), 20554, 8, 0, 100010, false, "nonpositive PID");
        String failed = AtomicWorkbenchConfig.evidence(false, 20554, 987, 8, 100000, "本机接口不可用;\n重启检查");
        String reason = AtomicWorkbenchConfig.readinessProblem(failed, 20554, 8, 987, 100010);
        require(reason.contains("本机接口不可用") && !reason.contains(";") && !reason.contains("\n"), "real failure reason and safe field format");
    }

    private static void queuedRequests() {
        String sum = "a".repeat(64), changed = "b".repeat(64);
        require(request(100, sum, 100, sum, true, 10000, 10000, 20554, 20554), "new request admitted");
        require(request(100, sum, 100, sum, true, 10000, 13000, 20554, 20554), "TTL boundary admitted");
        require(!request(100, sum, 100, sum, true, 10000, 13001, 20554, 20554), "queued request expires");
        require(!request(100, sum, 100, sum, true, 10000, 9999, 20554, 20554), "future trigger rejected");
        require(!request(100, sum, 100, sum, false, 10000, 10001, 20554, 20554), "off before first provider read rejected");
        require(!request(100, sum, 101, changed, false, 10000, 10001, 20554, 20554), "disable invalidates original generation");
        require(!request(100, sum, 102, changed, true, 10000, 10002, 20554, 20554), "off-on ABA cannot execute old gesture");
        require(!request(100, sum, 100, changed, true, 10000, 10002, 20554, 20554), "same revision after reset requires original checksum");
        require(!request(100, sum, 99, sum, true, 10000, 10002, 20554, 20554), "rollback cannot execute old gesture");
        require(!request(100, sum, 100, sum, true, 10000, 10002, 20553, 20554), "old entry module build rejected");
        require(!request(0, sum, 0, sum, true, 10000, 10002, 20554, 20554), "unknown generation rejected");
        require(!request(100, sum, 100, sum, true, -1, 10002, 20554, 20554), "missing monotonic trigger rejected");
        require(!request(100, "", 100, "", true, 10000, 10002, 20554, 20554), "missing checksum rejected");
        require(!request(100, null, 100, sum, true, 10000, 10002, 20554, 20554), "null checksum rejected");
        require(!request(100, "g".repeat(64), 100, "g".repeat(64), true, 10000, 10002, 20554, 20554), "malformed checksum rejected");
        require(!request(100, sum, 100, sum, true, 0, Long.MAX_VALUE, 20554, 20554), "extreme delay cannot overflow TTL");
        // A passing first read is insufficient: the second read immediately before start must pass too.
        require(request(100, sum, 100, sum, true, 10000, 11000, 20554, 20554)
                && !request(100, sum, 102, changed, true, 10000, 11001, 20554, 20554), "second read catches ABA during task capture");
    }

    private static boolean request(long requested, String requestedChecksum, long current, String currentChecksum,
            boolean enabled, long triggered, long now, int entryBuild, int build) {
        return AtomicWorkbenchConfig.requestCurrent(requested, requestedChecksum, current, currentChecksum,
                enabled, triggered, now, entryBuild, build);
    }

    private static void ready(String raw, int build, int boot, int pid, long now, boolean expected, String message) {
        require(AtomicWorkbenchConfig.readinessProblem(raw, build, boot, pid, now).isEmpty() == expected, message);
    }
    private static AtomicWorkbenchGesturePolicy.Geometry geometry(float width, float height, float density, float bar) {
        return AtomicWorkbenchGesturePolicy.Geometry.create(width, height, density, bar);
    }
    private static AtomicWorkbenchGesturePolicy.Detector detector() { return new AtomicWorkbenchGesturePolicy.Detector(); }
    private static AtomicWorkbenchGesturePolicy.Detector armed() {
        AtomicWorkbenchGesturePolicy.Detector value = detector();
        point(value, 0, 10, 40, 100, 0, "arm");
        return value;
    }
    private static void noGesture(float x, float y, float endX, float endY, String message) {
        AtomicWorkbenchGesturePolicy.Detector value = detector();
        point(value, 0, x, y, 100, 0, message + " DOWN");
        point(value, 1, endX, endY, 300, 0, message);
    }
    private static int event(AtomicWorkbenchGesturePolicy.Detector value, int action, int display, int pointers,
            boolean touch, boolean enabled, float x, float y, long time, AtomicWorkbenchGesturePolicy.Geometry geometry) {
        return value.event(action, display, pointers, touch, enabled, x, y, time, geometry);
    }
    private static void point(AtomicWorkbenchGesturePolicy.Detector value, int action, float x, float y,
            long time, int expected, String message) {
        equal(event(value, action, 0, 1, true, true, x, y, time, PHONE), expected, message);
    }
    private static void equal(int actual, int expected, String message) { require(actual == expected, message + ": " + actual); }
    private static void rejects(Runnable operation) {
        try { operation.run(); }
        catch (IllegalArgumentException expected) { checks++; return; }
        throw new AssertionError("invalid geometry accepted");
    }
    private static void require(boolean passed, String message) {
        checks++;
        if (!passed) throw new AssertionError(message);
    }
}
