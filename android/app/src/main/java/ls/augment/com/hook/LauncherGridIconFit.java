package ls.augment.com.hook;

/** Pixel budget for native workspace glyphs and one native label line. Never enlarges OEM content. */
final class LauncherGridIconFit {
    static final class Fit {
        final int icon,text;
        Fit(int icon,int text){this.icon=icon;this.text=text;}
    }
    static Fit fit(int icon,int text,int gap,int width,int height,float density){
        if(icon<=0||width<=0||height<=0||!Float.isFinite(density)||density<=0)return new Fit(icon,text);
        double margin=Math.min(4d*density,Math.min(width,height)*.08d);
        int label=text<=0?0:Math.max(1,Math.min(text,(int)Math.floor(Math.min(width*.46d,height*.25d))));
        double labelHeight=label*1.3d;
        double vertical=height-labelHeight-Math.max(0,gap)-2d*margin;
        int maxIcon=Math.max(1,(int)Math.floor(Math.min(width-2d*margin,vertical)));
        return new Fit(Math.min(icon,maxIcon),label);
    }
    private LauncherGridIconFit(){}
}
