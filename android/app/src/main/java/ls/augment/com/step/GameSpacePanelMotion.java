package ls.augment.com.step;

/** GameAssist PanelSlideAnimation: 300 ms, default Android accelerate/decelerate, alpha = position. */
final class GameSpacePanelMotion {
    static final int DURATION_MS=300;
    static final int LAMP_DURATION_MS=1800;
    static float lampLevel(float progress,float resting){
        float p=clamp(progress);
        // Decorative entry only. Do not present the lamp as a CPU/GPU load reading.
        if(p<.12f)return -.5f;
        if(p<.42f)return -.5f+(p-.12f)/.30f*2f;
        if(p<.50f)return 1.5f;
        return 1.5f+(resting-1.5f)*(p-.5f)/.5f;
    }
    static float translation(float height,float progress,boolean right){
        return (right?1:-1)*height*(335f/1152f)*(1-clamp(progress));
    }
    static float clamp(float progress){return Math.max(0,Math.min(1,progress));}
    static long duration(float from,float to){return Math.max(1,Math.round(DURATION_MS*Math.abs(clamp(to)-clamp(from))));}
    static boolean inward(float dx,float dy,boolean right,float slop){
        return (right?-dx:dx)>slop && Math.abs(dx)>Math.abs(dy)*1.5f;
    }
    static boolean outward(float dx,float dy,boolean right,float slop){return inward(dx,dy,!right,slop);}
}
