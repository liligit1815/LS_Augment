package ls.augment.com;

public final class TestAtomicWorkbenchGesturePolicy {
    private static final AtomicWorkbenchGesturePolicy.Geometry PHONE = geometry(400, 900, 1, 24);
    private static int checks;

    public static void main(String[] args) {
        AtomicWorkbenchGesturePolicy.Detector left=detector();
        point(left,0,10,40,100,0,"left DOWN arms");
        point(left,2,11,39,120,0,"initial jitter allowed");
        point(left,2,38,44,180,0,"horizontal inward path");
        point(left,2,79,48,240,0,"inward sample");
        point(left,2,77,46,260,0,"minor reverse jitter");
        point(left,2,120,50,320,0,"wait for release");
        point(left,1,120,50,350,1,"left release triggers");
        point(left,1,120,50,360,0,"one trigger per gesture");
        point(left,0,10,40,500,0,"cooldown DOWN ignored");
        point(left,1,120,40,700,0,"cooldown UP ignored");
        point(left,0,10,40,1550,0,"cooldown boundary re-arms");
        point(left,1,120,40,1750,1,"next gesture triggers");
        point(left,0,10,40,1700,0,"backwards clock cannot bypass cooldown");
        point(left,1,120,40,1900,0,"invalid DOWN stays cancelled");
        AtomicWorkbenchGesturePolicy.Detector right=detector();
        point(right,0,390,40,100,0,"right DOWN");
        point(right,2,365,44,160,0,"right inward path");
        point(right,2,310,40,220,0,"right continued");
        point(right,1,280,35,300,2,"right release triggers");
        noGesture(60,40,170,40,"outside top corner band");
        noGesture(10,20,120,20,"status bar excluded");
        noGesture(10,150,120,150,"middle side excluded");
        noGesture(10,40,15,180,"vertical control-center pull rejected");
        noGesture(10,40,120,120,"old diagonal gesture rejected");
        noGesture(10,40,200,100,"shallow diagonal rejected");
        noGesture(10,40,100,260,"steep diagonal rejected");
        noGesture(10,40,80,40,"short accidental swipe rejected");
        noGesture(390,40,399,40,"right outward swipe rejected");
        AtomicWorkbenchGesturePolicy.Detector d=armed();
        equal(event(d,2,0,2,true,true,60,40,160,PHONE),0,"second finger cancels");
        point(d,1,120,40,300,0,"second-finger path cannot revive");
        d=armed();equal(event(d,2,1,1,true,true,60,40,160,PHONE),0,"secondary display cancels");
        point(d,1,120,40,300,0,"display path cannot revive");
        d=armed();equal(event(d,2,0,1,true,false,60,40,160,PHONE),0,"disable cancels");
        point(d,1,120,40,300,0,"enable cannot revive old gesture");
        d=detector();equal(event(d,0,0,1,false,true,10,40,100,PHONE),0,"mouse cannot arm");
        point(d,1,120,40,300,0,"mouse DOWN never owns touch UP");
        for(AtomicWorkbenchGesturePolicy.Geometry g:new AtomicWorkbenchGesturePolicy.Geometry[]{
                geometry(900,400,1,24),geometry(400,900,1.1f,24),geometry(400,900,1,30)}){
            d=armed();equal(event(d,2,0,1,true,true,60,40,160,g),0,"display change cancels");
            point(d,1,120,40,300,0,"old geometry cannot resume");
        }
        d=armed();point(d,2,100,40,200,0,"forward path");point(d,2,50,40,230,0,"reversal cancels");
        point(d,1,120,40,300,0,"reversed path cannot revive");
        d=armed();point(d,2,40,20,150,0,"upward detour cancels");point(d,1,120,40,300,0,"ending cannot hide detour");
        d=armed();point(d,2,60,40,200,0,"ordered sample");point(d,2,80,40,180,0,"stale sample cancels");
        point(d,1,120,40,300,0,"nonmonotonic path cannot revive");
        point(armed(),1,120,40,901,0,"long hold rejected");point(armed(),1,120,40,150,0,"instant movement rejected");
        for(int action:new int[]{3,5}){d=armed();point(d,action,50,40,160,0,"cancel or pointer action");point(d,1,120,40,300,0,"cancelled UP ignored");}
        for(float x:new float[]{Float.NaN,-1}){d=armed();point(d,2,x,40,160,0,"malformed point cancels");point(d,1,120,40,300,0,"malformed path cannot revive");}
        AtomicWorkbenchGesturePolicy.Geometry high=geometry(1200,2700,3,72);d=detector();
        equal(event(d,0,0,1,true,true,30,120,100,high),0,"density-scaled DOWN");
        equal(event(d,1,0,1,true,true,360,150,300,high),1,"same physical dp path");
        rejects(()->geometry(0,900,1,24));rejects(()->geometry(400,900,Float.NaN,24));
        rejects(()->geometry(400,900,0,24));rejects(()->geometry(400,900,1,900));
        rejects(()->geometry(400,900,1,-1));rejects(()->geometry(400,240,3,200));
        entryParameters();readiness();queuedRequests();
        System.out.println("Atomic workbench gesture checks: "+checks+" OK");
    }
    private static void entryParameters(){
        for(int area:new int[]{50,100,120})for(int sensitivity:new int[]{60,100,160}){
            var g=AtomicWorkbenchGesturePolicy.Geometry.create(1216,2688,3.25f,90,area,sensitivity);
            require(g.minY==116f&&g.maxY>g.minY&&g.maxY<=2688*.20f,"safe top band");
            require(g.side(g.edge,g.minY)==1&&g.side(1216-g.edge,g.maxY)==2,"both boundaries");
            require(g.side(g.edge+1,g.minY)==0&&g.side(1216-g.edge-1,g.maxY)==0,"outside regions");
            require(g.side(1,g.minY-1)==0&&g.side(1215,g.maxY+1)==0,"status bar and lower edge excluded");
            require(Math.abs(g.minInward-8800f/sensitivity)<.001f,"inverse sensitivity formula");
        }
        require(PHONE.same(AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,100)),"default geometry");
        var small=AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,50,100);
        var large=AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,120,100);
        require(small.edge==24f&&small.maxY==56f&&Math.abs(large.edge-57.6f)<.001f&&large.maxY>PHONE.maxY,"area scales corner dimensions");
        for(int sensitivity:new int[]{60,100,160}){
            var g=AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,sensitivity);var d=detector();
            event(d,0,0,1,true,true,10,40,100,g);
            equal(event(d,1,0,1,true,true,80,40,300,g),sensitivity==160?1:0,"sensitivity threshold");
        }
        for(var changed:new AtomicWorkbenchGesturePolicy.Geometry[]{small,large,
                AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,160)})
            equal(event(armed(),1,0,1,true,true,120,40,300,changed),0,"config change cancels gesture");
        for(int v:new int[]{49,121})rejects(()->AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,v,100));
        for(int v:new int[]{59,161})rejects(()->AtomicWorkbenchGesturePolicy.Geometry.create(400,900,1,24,100,v));
        var landscape=AtomicWorkbenchGesturePolicy.Geometry.create(2688,1216,3.25f,90,120,160);
        require(landscape.maxY<=1216*.20f&&landscape.side(2687,landscape.maxY)==2,"landscape band");
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
