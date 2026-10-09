package ls.augment.com;

/** Pure geometry/color/cache policy, shared with host-side regression tests. */
public final class ControlCenterAppearancePolicy {
    public static final int CACHE_EDGE=256;
    private static final double[] LINEAR=new double[256];
    static {for(int i=0;i<LINEAR.length;i++){double s=i/255d;LINEAR[i]=s<=.04045?s/12.92:Math.pow((s+.055)/1.055,2.4);}}
    private ControlCenterAppearancePolicy() { }
    public static boolean activeTile(int state,boolean disabledByPolicy) { return state==2&&!disabledByPolicy; }
    public static float radius(float requestedDp,float density,int width,int height) {
        if(!Float.isFinite(requestedDp)||!Float.isFinite(density)||density<=0||width<=0||height<=0)return 0;
        return Math.min(Math.max(0,Math.min(48,requestedDp))*density,Math.min(width,height)/2f);
    }
    public static int dimension(int width,int height,boolean horizontal) {
        if(width<=0||height<=0)return 0;
        double scale=Math.min(1d,CACHE_EDGE/(double)Math.max(width,height));
        return Math.max(1,(int)Math.round((horizontal?width:height)*scale));
    }
    public static int color(String value,int fallback) {
        try {
            if(value==null||!value.matches("#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?"))return fallback;
            long parsed=Long.parseLong(value.substring(1),16);
            return value.length()==7?(int)(parsed|0xff000000L):(int)parsed;
        } catch(RuntimeException error) { return fallback; }
    }
    public static int blend(int base,int overlay,int opacity) {
        float a=Math.max(0,Math.min(100,opacity))/100f*((overlay>>>24)/255f);
        return 0xff000000|channel(base,overlay,16,a)<<16|channel(base,overlay,8,a)<<8|channel(base,overlay,0,a);
    }
    private static int channel(int base,int overlay,int shift,float a) {return Math.round(((base>>>shift)&255)*(1-a)+((overlay>>>shift)&255)*a);}
    public static double luminance(int color) {return linear((color>>>16)&255)*.2126+linear((color>>>8)&255)*.7152+linear(color&255)*.0722;}
    private static double linear(int value) {return LINEAR[value];}
    public static double contrast(int a,int b) {double x=luminance(a),y=luminance(b);return (Math.max(x,y)+.05)/(Math.min(x,y)+.05);}
    /** Correct each gradient stop against the real native foreground. Preserve hue as far as possible. */
    public static int readable(int fill,int foreground) {
        if(contrast(fill,foreground)>=4.5)return fill;
        int edge=contrast(0xff000000,foreground)>=contrast(0xffffffff,foreground)?0xff000000:0xffffffff;
        int lo=0,hi=100;
        while(lo<hi){int mid=(lo+hi)/2;if(contrast(blend(fill,edge,mid),foreground)>=4.5)hi=mid;else lo=mid+1;}
        return blend(fill,edge,lo);
    }
    /** Both endpoints and interpolated sRGB colors remain on the same side of the foreground luminance. */
    public static int[] readableGradient(int first,int last,int foreground) {
        int edge=contrast(0xff000000,foreground)>=contrast(0xffffffff,foreground)?0xff000000:0xffffffff;
        if(luminance(edge)<.5){first=darkSide(first,foreground);last=darkSide(last,foreground);}
        else {first=lightSide(first,foreground);last=lightSide(last,foreground);}
        // Interpolated saturated colors can be darker than both endpoints. Validate the ramp too.
        int a=first,b=last;
        for(int wash=0;wash<=100;wash++){
            a=blend(first,edge,wash);b=blend(last,edge,wash);boolean valid=true;
            for(int step=0;step<=100;step++)if(contrast(blend(a,b,step),foreground)<4.55){valid=false;break;}
            if(valid)break;
        }
        return new int[]{a,b};
    }
    private static int darkSide(int fill,int foreground){if(luminance(fill)<=luminance(foreground)&&contrast(fill,foreground)>=4.5)return fill;return toward(fill,foreground,0xff000000);}
    private static int lightSide(int fill,int foreground){if(luminance(fill)>=luminance(foreground)&&contrast(fill,foreground)>=4.5)return fill;return toward(fill,foreground,0xffffffff);}
    private static int toward(int fill,int foreground,int edge){for(int n=0;n<=100;n++){int candidate=blend(fill,edge,n);if(contrast(candidate,foreground)>=4.5)return candidate;}return edge;}
}
