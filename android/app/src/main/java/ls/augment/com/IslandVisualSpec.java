package ls.augment.com;

/** Shared native-12 geometry for live content and the explicitly labelled settings preview. */
public final class IslandVisualSpec {
    public static final float COMPACT_HEIGHT=34.5f;
    public static final int COMPACT_MIN=117,COMPACT_MAX=218,COMPACT_ICON=22,SMALL_ICON=20;
    public static final int PANEL_WIDTH=344,PANEL_RADIUS=16,PANEL_PADDING=13,PANEL_ICON=42;
    public static final int TITLE=16,DETAIL=12,COMPACT_TEXT=14,TEXT_GAP=6;
    public static int background(boolean night){return night?0xd9000000:0xd9ffffff;}
    public static int foreground(boolean night){return night?0xffffffff:0xe6000000;}
    public static int secondary(boolean night){return night?0xa6ffffff:0xa6000000;}
    private IslandVisualSpec(){}
}
