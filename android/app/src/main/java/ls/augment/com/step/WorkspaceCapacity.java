package ls.augment.com.step;

/** Five side slots and one independent upper slot; the main task is not a slot. */
public final class WorkspaceCapacity {
    public static boolean fitsLayout(int sideCount,boolean upper){
        return SideSlots.validCount(sideCount);
    }
    public static boolean canAdd(int sideCount,boolean hasUpper){
        return sideCount>=0 && sideCount<=SideSlots.MAX_COUNT && sideCount+(hasUpper?1:0)<SideSlots.MAX_COUNT+1;
    }
}
