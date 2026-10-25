package ls.augment.com;

/** Shared bounds and gesture policy. Native input dispatch never depends on an extraction result. */
public final class AtomicWorkbenchExtractionPolicy {
    public static final String ENABLED = "atomic_workbench_extraction_enabled";
    public static final String TEXT_ENABLED = "atomic_workbench_extraction_text";
    public static final String LANDSCAPE = "atomic_workbench_extraction_landscape";
    public static final String BLACKLIST = "atomic_workbench_extraction_blacklist";
    public static final int MAX_TEXT = 32768, MAX_NODES = 4000, MAX_DEPTH = 64, MAX_TREE_TEXT = 262144;
    public static final long NODE_BUDGET_MS = 120;
    private AtomicWorkbenchExtractionPolicy() { }
    public static boolean password(int t) { int c=t&15,v=t&4080; return c==1&&(v==128||v==144||v==224)||c==2&&v==16; }

    public static final class Detector {
        private long generation, down, due;
        private float x, y, slop;
        private boolean pending, active;
        public long generation() { return generation; }
        public void cancel() { pending=false; active=false; }
        public long down(int display, int pointers, boolean touchscreen, float x, float y, long at, int timeout, float slop) {
            generation++; cancel();
            if (display!=0||pointers!=1||!touchscreen||!Float.isFinite(x)||!Float.isFinite(y)||at<0||timeout<250||timeout>1200||!Float.isFinite(slop)||slop<=0) return generation;
            this.x=x;this.y=y;down=at;due=at+timeout;this.slop=slop;pending=true;return generation;
        }
        public boolean move(long expected, int pointers, float x, float y, long at) {
            if(expected!=generation||(!pending&&!active))return false;
            if(pointers!=1||!Float.isFinite(x)||!Float.isFinite(y)||at<down||(x-this.x)*(x-this.x)+(y-this.y)*(y-this.y)>slop*slop) { cancel();return false; }
            return true;
        }
        public boolean fire(long expected, long now, boolean allowed) {
            if(expected!=generation||!pending||now<due)return false;
            pending=false;active=allowed;return active;
        }
        public boolean active(long expected) { return expected==generation&&active; }
    }
}
