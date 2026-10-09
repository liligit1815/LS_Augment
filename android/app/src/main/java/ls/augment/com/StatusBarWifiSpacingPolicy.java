package ls.augment.com;

/** The NX809J traffic artwork shares the signal canvas and paints to its right. */
public final class StatusBarWifiSpacingPolicy {
    private StatusBarWifiSpacingPolicy(){}
    public static boolean member(String id){return "wifi.signal".equals(id)||"wifi.activity_inout".equals(id)||"secondary_wifi.signal".equals(id)||"secondary_wifi.activity_inout".equals(id);}
    public static String peer(String id){if(!member(id))return "";return id.substring(0,id.indexOf('.'))+(id.endsWith(".signal")?".activity_inout":".signal");}
    public static int peerVertical(StatusBarIconSpacingSpec spec,String scope,String id){
        if(!member(id))return 0;
        if(!"all".equals(scope))return spec.resolve(scope,peer(id)).vertical();
        // An all rule is combined with each page's effective, possibly explicit peer.
        return Math.max(spec.resolve("control",peer(id)).vertical(),spec.resolve("notification",peer(id)).vertical());
    }
    public static int verticalPixels(StatusBarIconSpacingSpec.Insets signal,StatusBarIconSpacingSpec.Insets traffic,float density){
        return Math.round(signal.top*density)+Math.round(signal.bottom*density)+Math.round(traffic.top*density)+Math.round(traffic.bottom*density);
    }
    /** Logical margins in pixels. Values include shared reserve, not new persisted rules. */
    public static int[] pixels(StatusBarIconSpacingSpec.Insets signal,StatusBarIconSpacingSpec.Insets traffic,float density,boolean rtl,boolean isTraffic,boolean verticalAllowed){
        int s=Math.round(signal.start*density),e=Math.round(signal.end*density),t=verticalAllowed?Math.round(signal.top*density):0,b=verticalAllowed?Math.round(signal.bottom*density):0;
        int as=Math.round(traffic.start*density),ae=Math.round(traffic.end*density),at=verticalAllowed?Math.round(traffic.top*density):0,ab=verticalAllowed?Math.round(traffic.bottom*density):0;
        if(isTraffic)return new int[]{s+as,t+at,e+ae,b+ab};
        // Both default TOP|START children must reserve the same total extent.
        // RTL does not mirror these OEM drawables. Compensate on physical right
        // so growing the parent cannot push the fan into its right-hand arrows.
        return new int[]{s+(rtl?as+ae:0),t,e+(rtl?0:as+ae),b+at+ab};
    }
}
