package ls.augment.com;

/** Retries only idempotent inventory publication; never a privileged user operation. */
public final class InventoryRetryPolicy {
    private InventoryRetryPolicy() { }
    public static long delay(int failures,long ageMillis) {
        if(failures<=0||failures>=6||ageMillis<0||ageMillis>=60_000L)return -1;
        long delay=Math.min(15_000L,1000L<<(failures-1));
        return ageMillis+delay>=60_000L?-1:delay;
    }
}
