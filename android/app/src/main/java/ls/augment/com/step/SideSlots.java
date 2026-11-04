package ls.augment.com.step;

import java.util.Arrays;

/** Copy-on-write mapping shared by the native owner and the preview host, one copy per process. */
public final class SideSlots {
    public static final int DEFAULT_COUNT = 3, MAX_COUNT = 5, EMPTY = -1;
    public static boolean validCount(int n){return n>=1 && n<=MAX_COUNT;}
    public boolean fits(int n){
        if(!validCount(n))return false;
        int[] current=ids;
        for(int i=n;i<current.length;i++)if(current[i]!=EMPTY)return false;
        return true;
    }
    private volatile int[] ids = empty();
    private static int[] empty() {
        int[] result = new int[MAX_COUNT];
        Arrays.fill(result, EMPTY);
        return result;
    }
    public int[] snapshot() { return ids.clone(); }
    public synchronized void clear() { ids = empty(); }
    public int task(int slot) {
        if (slot < 0 || slot >= MAX_COUNT) throw new IllegalArgumentException("副格超出范围");
        return ids[slot];
    }
    public int index(int id) {
        if (id < 0) return -1;
        int[] current = ids;
        for (int slot = 0; slot < current.length; slot++) if (current[slot] == id) return slot;
        return -1;
    }
    public int count() {
        int result = 0;
        for (int id : ids) if (id != EMPTY) result++;
        return result;
    }
    public void check(int slot, int previous, int next) {
        if (task(slot) != previous || next == previous || next == 0 || next < EMPTY || (next >= 0 && index(next) >= 0))
            throw new IllegalStateException("副格任务已变化或任务重复");
    }
    public synchronized void replace(int slot, int previous, int next) {
        check(slot, previous, next);
        int[] updated = snapshot();
        updated[slot] = next;
        ids = updated;
    }
    public boolean canCollapse() { return task(3) == EMPTY && task(4) == EMPTY; }
    public static int[] compacted(int[] source){
        int[] ordered=empty();int n=0;
        for(int id:source)if(id!=EMPTY)ordered[n++]=id;
        return ordered;
    }
    public synchronized void compact(int[] expected){
        if(!Arrays.equals(ids,expected))throw new IllegalStateException("补位时任务已变化");
        ids=compacted(expected);
    }
}
