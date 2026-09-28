package ls.augment.com;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

/** Physical screen edges, independent of layout direction and hover action. */
public final class BackGestureIconPolicy {
    public static final String PREFIX = "ls_augment_rm_back_icon_";
    public static final String ENABLED = PREFIX + "enabled";
    public static final String[] SIDES = {"left", "right"};
    public static final String[] FIELDS = {"mode", "asset", "background_asset", "background_scale_percent", "scale_percent", "opacity_percent", "mirror", "inset_dp", "offset_y_dp"};
    private BackGestureIconPolicy() { }
    public static String key(int side, String field) {
        if (side < 0 || side > 1) throw new IllegalArgumentException("Not a side edge");
        return PREFIX + SIDES[side] + "_" + field;
    }
    public static String[] parameterKeys() {
        List<String> keys = new ArrayList<>();
        for (int side=0; side<2; side++) for (String field:FIELDS) keys.add(key(side, field));
        return keys.toArray(new String[0]);
    }
    public static boolean validAsset(String hash) { return hash != null && hash.matches("[0-9a-f]{64}"); }
    public static boolean eligible(int position, boolean hover, boolean returnsBackBitmap) {
        return (position == 0 || position == 1) && !hover && returnsBackBitmap;
    }
    public static final class Side {
        public final String hash, backgroundHash;
        public final boolean custom, mirror;
        public final int scale, backgroundScale, opacity, inset, offsetY;
        public Side(Function<String,String> value, int side) {
            hash = value.apply(key(side,"asset"));
            backgroundHash = value.apply(key(side,"background_asset"));
            custom = "1".equals(value.apply(key(side,"mode"))) && validAsset(hash);
            mirror = "1".equals(value.apply(key(side,"mirror")));
            scale = number(value.apply(key(side,"scale_percent")),100,10,1000);
            backgroundScale = number(value.apply(key(side,"background_scale_percent")),100,10,1000);
            opacity = number(value.apply(key(side,"opacity_percent")),100,10,100);
            inset = number(value.apply(key(side,"inset_dp")),0,-256,512);
            offsetY = number(value.apply(key(side,"offset_y_dp")),0,-512,512);
        }
    }
    private static int number(String value,int fallback,int min,int max) {
        try { return Math.max(min,Math.min(max,Integer.parseInt(value))); }
        catch (RuntimeException ignored) { return fallback; }
    }
    public static int alpha(int original,int opacity) {
        return Math.max(0,Math.min(255,original))*Math.max(0,Math.min(100,opacity))/100;
    }
    /** Writes into a reused array; does not allocate on the render thread. */
    public static void bounds(float left,float top,float right,float bottom,int viewWidth,int viewHeight,
                              float density,int position,Side side,int[] output) {
        float baseWidth=Math.max(1,right-left),baseHeight=Math.max(1,bottom-top);
        float factor=Math.min(side.scale/100f,Math.min(viewWidth/baseWidth,viewHeight/baseHeight));
        float width=Math.max(1,baseWidth*factor),height=Math.max(1,baseHeight*factor);
        float x=(left+right)/2 + side.inset*density*(position==0?1:-1);
        float y=(top+bottom)/2 + side.offsetY*density;
        int w=Math.max(1,Math.round(width)),h=Math.max(1,Math.round(height));
        output[0]=Math.max(0,Math.min(viewWidth-w,Math.round(x-w/2f)));
        output[1]=Math.max(0,Math.min(viewHeight-h,Math.round(y-h/2f)));
        output[2]=output[0]+w;output[3]=output[1]+h;
    }
}
