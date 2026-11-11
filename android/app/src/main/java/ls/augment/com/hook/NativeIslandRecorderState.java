package ls.augment.com.hook;

/** One recorder service generation, with ordered model/time snapshots. No provider cache inference. */
final class NativeIslandRecorderState {
    static final long LEASE_MS = 4000;
    static final class Snapshot {
        final long generation, sequence, observed;
        final int state;
        final boolean foreground;
        final String count;
        Snapshot(long generation, long sequence, long observed, int state, boolean foreground, String count) {
            this.generation=generation; this.sequence=sequence; this.observed=observed;
            this.state=state; this.foreground=foreground; this.count=count;
        }
        boolean fresh(long now) { return observed>=0 && now >= observed && now-observed < LEASE_MS; }
        boolean active() { return (state==1 || state==2) && count!=null && !count.isEmpty(); }
        boolean complete() { return state==0 || active(); }
        boolean visible(boolean recorderForeground) { return active() && !foreground && !recorderForeground; }
    }
    private volatile Snapshot latest;
    synchronized boolean accept(Snapshot next, long now) {
        if (next.generation<=0 || next.sequence<=0 || !next.fresh(now)
                || next.state<0 || next.state>2 || (next.count!=null && next.count.length()>128)) return false;
        Snapshot old=latest;
        if (old!=null && (next.generation<old.generation
                || (next.generation==old.generation && next.sequence<=old.sequence))) return false;
        latest=next; return true;
    }
    Snapshot current(long now) { Snapshot value=latest; return value!=null && value.fresh(now)?value:null; }
}
