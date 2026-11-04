package ls.augment.com.step;

/** Identity is supplied by ActivityManager, never by an Intent extra or a fixed ROM UID. */
public final class WorkspaceCaller {
    private WorkspaceCaller() { }
    public static boolean trusted(int systemUiUid,int deliveredUid) {
        return systemUiUid >= 1000 && deliveredUid == systemUiUid;
    }
}
