package ls.augment.com;

/** Bounded optics and readable linear-light contrast; independent of Android/GPU APIs. */
public final class LiquidGlassPolicy {
    public static final int MAX_EDGE = 512;
    public static final int MAX_PIXELS = 196608;
    public static final long SAMPLE_INTERVAL_MS = 50L;
    private LiquidGlassPolicy() { }

    public static int[] sampleSize(int width,int height) {
        if(width<=0||height<=0)return new int[]{0,0};
        double scale=Math.min(.5,Math.min((double)MAX_EDGE/width,(double)MAX_EDGE/height));
        scale=Math.min(scale,Math.sqrt((double)MAX_PIXELS/((long)width*height)));
        return new int[]{Math.max(1,(int)Math.floor(width*scale)),Math.max(1,(int)Math.floor(height*scale))};
    }
    public static float clamp01(float value) { return Float.isFinite(value)?Math.max(0,Math.min(1,value)):0; }
    public static double linear(int component) {
        double n=Math.max(0,Math.min(255,component))/255.0;
        return n<=.04045?n/12.92:Math.pow((n+.055)/1.055,2.4);
    }
    public static double luminance(int color) {
        return .2126*linear((color>>>16)&255)+.7152*linear((color>>>8)&255)+.0722*linear(color&255);
    }
    /** Mix in linear light toward black/white, leaving a contrast margin for highlights. */
    public static float contrastMix(double luminance,boolean lightForeground,boolean highContrast) {
        double y=Double.isFinite(luminance)?Math.max(0,Math.min(1,luminance)):.5;
        if(lightForeground) {
            double ceiling=highContrast?.08:.115;
            return (float)Math.max(.06,y>ceiling?1-ceiling/y:0);
        }
        double floor=highContrast?.72:.38;
        return (float)Math.max(.06,y<floor?(floor-y)/(1-y):0);
    }
    public static float edgeDisplacement(float distanceInside,float density,float pressure,boolean reduceMotion) {
        if(!Float.isFinite(distanceInside)||!Float.isFinite(density)||density<=0)return 0;
        float t=clamp01(distanceInside/(12*density));
        float edge=1-t*t*(3-2*t);
        return edge*edge*8*density*(1+(reduceMotion?0:clamp01(pressure)*.18f));
    }
}
