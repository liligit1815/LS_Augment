package ls.augment.com;

/** Full-canvas cells. No inference about transparent pixels or a future animation frame. */
public final class StatusBarWifiAssetSpacingPolicy {
    private StatusBarWifiAssetSpacingPolicy(){}
    public static final class Plan {
        public final int width,height,signalX,signalY,activityX,activityY;
        public final int[] signalMargins,activityMargins;
        public final boolean signalPresent,activityPresent;
        Plan(int w,int h,int sx,int sy,int ax,int ay,int[] sm,int[] am,boolean s,boolean a){
            width=w;height=h;signalX=sx;signalY=sy;activityX=ax;activityY=ay;
            signalMargins=sm;activityMargins=am;signalPresent=s;activityPresent=a;
        }
        public boolean fits(int availableWidth,int availableHeight){return availableWidth>=width&&availableHeight>=height;}
    }
    /** units = display density / the user's normal icon-size scale. Margins remain real dp. */
    public static Plan plan(int canvasWidth,int canvasHeight,StatusBarIconSpacingSpec.Insets signal,
            StatusBarIconSpacingSpec.Insets activity,float units,boolean rtl,boolean signalPresent,boolean activityPresent){
        if(canvasWidth<=0||canvasHeight<=0||!Float.isFinite(units)||units<=0||units>100)throw new IllegalArgumentException("invalid canvas");
        int[] s=pixels(signal,units),a=pixels(activity,units);
        int sw=signalPresent?canvasWidth+s[0]+s[2]:0,aw=activityPresent?canvasWidth+a[0]+a[2]:0;
        int width=sw+aw,height=Math.max(signalPresent?canvasHeight+s[1]+s[3]:0,activityPresent?canvasHeight+a[1]+a[3]:0);
        int ss=signalPresent?s[0]:0,as=activityPresent?sw+a[0]:0;
        int sx=rtl?width-ss-canvasWidth:ss,ax=rtl?width-as-canvasWidth:as;
        return new Plan(width,height,sx,s[1],ax,a[1],
                signalPresent?new int[]{ss,s[1],width-canvasWidth-ss,height-canvasHeight-s[1]}:new int[4],
                activityPresent?new int[]{as,a[1],width-canvasWidth-as,height-canvasHeight-a[1]}:new int[4],signalPresent,activityPresent);
    }
    private static int[] pixels(StatusBarIconSpacingSpec.Insets e,float unit){return new int[]{Math.round(e.start*unit),Math.round(e.top*unit),Math.round(e.end*unit),Math.round(e.bottom*unit)};}
    /** Shared edits change only pages which inherit this particular child rule. */
    public static boolean affected(StatusBarIconSpacingSpec spec,String editedScope,String surface,String id){
        return editedScope.equals(surface)||editedScope.equals("all")&&spec.explicit(surface,id)==null;
    }
}
