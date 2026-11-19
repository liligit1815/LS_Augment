package ls.augment.com;

/** User-approved opaque island roles. Settings continue to use UiKit. */
public final class IslandVisualSpec {
    public static final float COMPACT_HEIGHT=36f;
    public static final int COMPACT_MIN=117,COMPACT_MAX=218,COMPACT_ICON=22,SMALL_ICON=20;
    public static final int PANEL_WIDTH=360,PANEL_RADIUS=30,PANEL_PADDING=16,PANEL_ICON=44;
    public static final int TITLE=16,DETAIL=12,COMPACT_TEXT=14,TEXT_GAP=12;
    public static final int ACTION_HEIGHT=48,ACTION_GAP=8,PANEL_MIN_HEIGHT=88;
    public static final int SURFACE=0xff000000,PRIMARY=0xfff5f5f7,SECONDARY=0xffa9abb2;
    public static final int CONTROL=0xff242426,TRACK=0xff454549,BORDER=0xff303034;
    public static final int MUSIC=0xffd7b9ff,INFORMATION=0xff8bbfff,TIMER=0xffffb45b;
    public static final int POSITIVE=0xff70dfa5,RECORDING=0xffff8e96;
    public static int background(boolean night){return SURFACE;}
    public static int foreground(boolean night){return PRIMARY;}
    public static int secondary(boolean night){return SECONDARY;}
    private IslandVisualSpec(){}
}
