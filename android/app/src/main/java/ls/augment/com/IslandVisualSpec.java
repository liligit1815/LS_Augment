package ls.augment.com;

/** Shared island roles, measured against the Xiaomi OS 3 device on 2026-11-13. */
public final class IslandVisualSpec {
    public static final float COMPACT_HEIGHT=34.5f;
    public static final int COMPACT_MIN=117,COMPACT_MAX=218,COMPACT_ICON=22,SMALL_ICON=20;
    public static final int PANEL_WIDTH=344,PANEL_RADIUS=30,PANEL_PADDING=16,PANEL_ICON=48;
    public static final int TITLE=17,DETAIL=13,COMPACT_TEXT=14,TEXT_GAP=12;
    public static final int ACTION_HEIGHT=48,ACTION_GAP=8,PANEL_MIN_HEIGHT=88;
    public static int background(boolean night){return night?0xd9000000:0xd9ffffff;}
    public static int foreground(boolean night){return night?0xfff5f5f5:0xe6000000;}
    public static int secondary(boolean night){return night?0xa6ffffff:0xa6000000;}
    private IslandVisualSpec(){}
}
