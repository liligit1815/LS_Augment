package ls.augment.com.step;

/** One physical main task plus at most five additional tasks, including the upper window. */
public final class WorkspaceCapacity {
    public static boolean fitsLayout(int sideCount,boolean upper){
        return SideSlots.validCount(sideCount) && sideCount+(upper?1:0)<=SideSlots.MAX_COUNT;
    }
    public static boolean canAdd(int sideCount,boolean hasUpper){
        return sideCount>=0 && sideCount+(hasUpper?1:0)<SideSlots.MAX_COUNT;
    }
}
