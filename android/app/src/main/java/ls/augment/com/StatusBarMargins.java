package ls.augment.com;

/** Signed offsets from the OEM content rectangle, shared by preview and hook. */
public final class StatusBarMargins {
    public static final int MIN_DP=-64,MAX_DP=64;
    public static final String[] KEYS={ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP};
    public static float resolve(float nativePx,int deltaDp,float density){
        if(!Float.isFinite(nativePx)||!Float.isFinite(density)||density<=0)throw new IllegalArgumentException("invalid native margins");
        return nativePx+Math.max(MIN_DP,Math.min(MAX_DP,deltaDp))*density;
    }
    private StatusBarMargins(){}
}
