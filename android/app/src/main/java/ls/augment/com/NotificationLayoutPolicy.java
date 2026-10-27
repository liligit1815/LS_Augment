package ls.augment.com;

/** Pure geometry. Input positions/heights come from each native algorithm pass. */
public final class NotificationLayoutPolicy {
    private NotificationLayoutPolicy() { }
    public static float unit(float value) { return Float.isFinite(value) ? Math.max(0f,Math.min(1f,value)) : 0f; }
    public static float clockSize(float expanded,float compact,float scroll,float distance) {
        float progress=unit(Math.max(0f,scroll)/Math.max(1f,distance));
        progress=progress*progress*(3f-2f*progress);
        return expanded+(Math.min(expanded,compact)-expanded)*progress;
    }
    public static float alignedX(int alignment,float parentWidth,float width,float inset,float offset) {
        float wanted=alignment==1?(parentWidth-width)/2f:alignment==2?parentWidth-width-inset:inset;
        return Math.max(0f,Math.min(Math.max(0f,parentWidth-width),wanted+offset));
    }
    public static boolean shadeAllowed(int state,boolean dozing,boolean keyguardStack,boolean expanded) {
        return state==0&&!dozing&&!keyguardStack&&expanded;
    }
}
