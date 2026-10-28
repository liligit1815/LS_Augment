package ls.augment.com;

/** Continuous projection and reachability of privacy-filtered OEM notification coordinates. */
public final class NotificationCascadePolicy {
    /** Last row must be able to reach the uncompressed area, even when native content fits. */
    public static int requiredScroll(float lastNativeY, int scroll, float start) {
        if (!Float.isFinite(lastNativeY) || !Float.isFinite(start)) return 0;
        return (int)Math.min(Integer.MAX_VALUE, Math.max(0, Math.ceil((double)lastNativeY + Math.max(0,scroll) - start)));
    }
    public static final class Card {
        public final float y,scale,alpha,blur;
        Card(float y,float scale,float alpha,float blur){this.y=y;this.scale=scale;this.alpha=alpha;this.blur=blur;}
    }
    public static Card project(float y,float height,float previousBottom,float start,float end,float density,boolean gradient){
        if(!Float.isFinite(y)||!Float.isFinite(height)||height<=0||end<=start||density<=0)
            throw new IllegalArgumentException("notification geometry");
        if(y<=start)return new Card(y,1,1,0);
        float progress=Math.max(0,(y-start)/(end-start));
        float depth=Math.min(1,progress);
        float scale=1-.20f*depth;
        float blend=(float)(1-Math.exp(-3*depth));
        float edge=density*(18-12*depth);
        float anchor=Float.isFinite(previousBottom)?previousBottom:y+height;
        float projected=y+(anchor+edge-height*scale-y)*blend;
        float alpha=progress>=1.25f?0:progress>1?Math.max(0,(1.25f-progress)*4)*(gradient?.75f:1):gradient?1-.25f*depth:1;
        return new Card(projected,scale,alpha,gradient?Math.max(0,depth-.2f)*10*density:0);
    }
    private NotificationCascadePolicy(){}
}
