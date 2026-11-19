package ls.augment.com;

/** Shared setting values. A swipe action never changes the source's business controls. */
public final class IslandGestureConfig {
    public static final String EXPANDED=SystemUiOptions.PREFIX+"island_swipe_expanded";
    public static final String COMPACT=SystemUiOptions.PREFIX+"island_swipe_compact";
    public static final String PROTECT=SystemUiOptions.PREFIX+"island_swipe_protect";
    public static final int NONE=0,HIDE=1,CANCEL=2;
    private IslandGestureConfig(){}
}
