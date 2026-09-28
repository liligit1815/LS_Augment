import ls.augment.com.LiquidGlassPolicy;

/** Boundary, contrast, and resource limits for actual optical rendering. */
public final class TestLiquidGlassPolicy {
    public static void main(String[] args){
        int[][] dimensions={{0,0},{1,1},{1080,2400},{2400,1080},{Integer.MAX_VALUE,Integer.MAX_VALUE},{1,Integer.MAX_VALUE}};
        for(int[] d:dimensions){int[] size=LiquidGlassPolicy.sampleSize(d[0],d[1]);
            check(size[0]<=512&&size[1]<=512,"edge budget");
            check((long)size[0]*size[1]<=196608,"pixel budget");
            if(d[0]>0&&d[1]>0)check(size[0]>0&&size[1]>0,"nonempty valid sample");}
        check(LiquidGlassPolicy.luminance(0xff000000)==0,"black luminance");
        check(Math.abs(LiquidGlassPolicy.luminance(0xffffffff)-1)<1e-9,"white luminance");
        for(int i=0;i<=100;i++)for(boolean high:new boolean[]{false,true}){
            double y=i/100.0;
            double lightMix=LiquidGlassPolicy.contrastMix(y,true,high);
            double darkMix=LiquidGlassPolicy.contrastMix(y,false,high);
            // Shader's maximum linear highlight is .065; white foreground remains >= 4.5:1.
            double darkBackground=y*(1-lightMix)+.065;
            check(1.05/(darkBackground+.05)>=4.5,"light foreground contrast");
            double lightBackground=y*(1-darkMix)+darkMix;
            check((lightBackground+.05)/.05>=4.5,"dark foreground contrast");
        }
        float previous=Float.POSITIVE_INFINITY;
        for(int i=0;i<=120;i++){
            float displacement=LiquidGlassPolicy.edgeDisplacement(i/10f,1,1,false);
            check(displacement>=0&&displacement<=9.441f,"finite bounded refraction");
            check(displacement<=previous+.0001f,"monotonic edge falloff");previous=displacement;
        }
        check(LiquidGlassPolicy.edgeDisplacement(20,1,1,false)==0,"interior not distorted");
        check(LiquidGlassPolicy.edgeDisplacement(0,1,0,true)==LiquidGlassPolicy.edgeDisplacement(0,1,1,true),"reduced motion ignores pressure");
        check(Float.isFinite(LiquidGlassPolicy.contrastMix(Double.NaN,true,false)),"invalid luminance bounded");
        check(LiquidGlassPolicy.contrastMix(.8,false,false)<.1,"a light backdrop is not needlessly painted white");
        check(LiquidGlassPolicy.contrastMix(.05,true,false)<.1,"a dark backdrop is not needlessly painted black");
        check(LiquidGlassPolicy.contrastMix(.2,false,true)>LiquidGlassPolicy.contrastMix(.2,false,false),
                "high contrast keeps a deliberate stronger backing");
        System.out.println("LiquidGlassPolicy: resource limits, contrast, refraction and reduced motion passed");
    }
    private static void check(boolean condition,String description){if(!condition)throw new AssertionError(description);}
}
