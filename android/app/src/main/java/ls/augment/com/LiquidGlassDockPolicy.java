package ls.augment.com;

/** Geometry independent of Android: never let a dock material cover the workspace or gestures. */
public final class LiquidGlassDockPolicy {
    private LiquidGlassDockPolicy() { }

    public static int[] bounds(int width,int height,int left,int top,int right,int bottom,
            int padding,int minimumHeight,int maximumHeight) {
        if(width<=0||height<=0||right<=left||bottom<=top||padding<0
                ||minimumHeight<=0||maximumHeight<minimumHeight)return null;
        long l=Math.max(0L,(long)left-padding), t=Math.max(0L,(long)top-padding);
        long r=Math.min((long)width,(long)right+padding), b=Math.min((long)height,(long)bottom+padding);
        if(r<=l||b<=t||b-t<minimumHeight||b-t>maximumHeight)return null;
        return new int[]{(int)l,(int)t,(int)r,(int)b};
    }

    /** A hidden label's layout cell can be much taller than its visible top drawable.
     * OEM BubbleTextView centers that drawable horizontally at paddingTop. */
    public static int[] iconBounds(int cellWidth,int cellHeight,int drawableWidth,int drawableHeight,int paddingTop) {
        if(cellWidth<=0||cellHeight<=0||drawableWidth<=0||drawableHeight<=0||paddingTop<0
                ||drawableWidth>cellWidth||(long)paddingTop+drawableHeight>cellHeight)return null;
        int left=(cellWidth-drawableWidth)/2;
        return new int[]{left,paddingTop,left+drawableWidth,paddingTop+drawableHeight};
    }
}
