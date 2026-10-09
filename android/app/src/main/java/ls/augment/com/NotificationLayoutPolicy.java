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
    /** Absolute scroll needed to bring the native content end through the compact stack boundary.
     * expandedEnd is the algorithm's full flow coordinate, before shelf/row projection.
     * Undoing native scroll makes the result stable while the user moves through the list. */
    public static int stackScrollRange(float expandedEnd,int nativeScrollY,float stackY,float border) {
        double range=(double)expandedEnd+Math.max(0,nativeScrollY)+stackY-border;
        if(!Double.isFinite(range)||range<=0d)return 0;
        return (int)Math.min(Integer.MAX_VALUE,Math.ceil(range));
    }
    public static int scrollRange(int nativeRange,int stackRange,boolean active) {
        return active?Math.max(nativeRange,stackRange):nativeRange;
    }
    public static final class Row {
        public final float y,scaleX,alpha;
        public final int clipTop,clipBottom;
        public final boolean hidden;
        Row(float y,float scaleX,float alpha,int clipTop,int clipBottom,boolean hidden) {
            this.y=y;this.scaleX=scaleX;this.alpha=alpha;this.clipTop=clipTop;this.clipBottom=clipBottom;this.hidden=hidden;
        }
    }
    /** Reveal the native content from its top without changing the projected visible rectangle.
     * Clipping the bottom keeps the title ahead of the body, including a stationary crossing row.
     * The real row and both native clips remain the source of drawing and native hit testing. */
    public static Row stacked(float nativeY,int height,float width,float border,float depth,
            float step,float inset,int nativeClipTop,int nativeClipBottom,float nativeAlpha) {
        if(height<=0||nativeY+height<=border||depth<=0f)
            return new Row(nativeY,1f,nativeAlpha,nativeClipTop,nativeClipBottom,false);
        float d=Math.max(0f,depth),partial=unit(d),shown=unit(4f-d);
        float bottom=border+Math.min(3f,d)*step;
        int clip=Math.max(nativeClipTop,Math.round(partial*Math.max(0f,height-step)));
        int revealOffset=clip-nativeClipTop;
        float scale=Math.max(.5f,1f-(2f*inset*Math.min(3f,d))/Math.max(1f,width));
        return new Row(bottom-height+revealOffset,scale,nativeAlpha*shown,
                nativeClipTop,nativeClipBottom+revealOffset,d>=4f);
    }
}
