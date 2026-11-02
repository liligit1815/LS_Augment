package ls.augment.com;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Insets;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.TextView;

/** Shared phone-side sizing. Neither the editor nor renderer needs launcher diagnostics. */
public final class LauncherMemorySizing {
    private LauncherMemorySizing() {}

    public static final class Screen {
        public final int width, height;
        public final float density, fontScale;
        private final int[] portrait, landscape, reversePortrait, reverseLandscape;
        private final int displayRotation;
        private final boolean naturalLandscape;
        public Screen(int width, int height, float density, float fontScale, int[] portrait, int[] landscape) {
            this(width,height,density,fontScale,portrait,landscape,portrait,landscape,0,false);
        }
        private Screen(int width,int height,float density,float fontScale,int[] portrait,int[] landscape,
                int[] reversePortrait,int[] reverseLandscape,int rotation,boolean naturalLandscape) {
            this.width=Math.min(width,height);this.height=Math.max(width,height);
            this.density=density;this.fontScale=fontScale;
            this.portrait=portrait.clone();this.landscape=landscape.clone();
            this.reversePortrait=reversePortrait.clone();this.reverseLandscape=reverseLandscape.clone();
            displayRotation=rotation;this.naturalLandscape=naturalLandscape;
        }
        public int px(float dp) { return Math.round(dp*density); }
        public LauncherMemoryLayout region(boolean horizontal) {
            return region(horizontal,0,0,0,horizontal?height:width,horizontal?width:height);
        }
        /** Map the same logical edges into either an upright or a rotated launcher host. */
        public LauncherMemoryLayout region(boolean horizontal,int rotation,int left,int top,int right,int bottom) {
            int standard=horizontal?(naturalLandscape?0:1):(naturalLandscape?1:0);
            int effective=(displayRotation+rotation/90)%4;
            boolean reverse=effective==(standard+2)%4;
            int[] e=horizontal?(reverse?reverseLandscape:landscape):(reverse?reversePortrait:portrait);
            switch ((rotation%360+360)%360) {
                case 90: left+=e[2];top+=e[0];bottom-=e[1];break;
                case 180: left+=e[1];top+=e[2];right-=e[0];break;
                case 270: top+=e[1];right-=e[2];bottom-=e[0];break;
                default: left+=e[0];right-=e[1];bottom-=e[2];break;
            }
            return new LauncherMemoryLayout(rotation,left,top,right,bottom);
        }
    }

    public static final class Sample {
        public final Screen screen;
        public final long total, available;
        Sample(Screen screen,long total,long available) {this.screen=screen;this.total=total;this.available=available;}
    }

    /** Binder/settings reads run on the caller's worker, never on the draw thread. */
    public static Sample read(Context context,Display display) {
        Screen screen=readScreen(context,display);
        ActivityManager.MemoryInfo memory=new ActivityManager.MemoryInfo();
        ActivityManager manager=(ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);
        if(manager==null)throw new IllegalStateException("memory_service_missing");
        manager.getMemoryInfo(memory);
        if(memory.totalMem<=0)throw new IllegalStateException("memory_total_unavailable");
        return new Sample(screen,memory.totalMem,memory.availMem);
    }

    public static Screen readScreen(Context context,Display display) {
        if(display==null)throw new IllegalStateException("display_missing");
        DisplayMetrics metrics=new DisplayMetrics();display.getRealMetrics(metrics);
        if(metrics.widthPixels<=0||metrics.heightPixels<=0||metrics.density<=0)throw new IllegalStateException("display_metrics_missing");
        float font=Settings.System.getFloat(context.getContentResolver(),Settings.System.FONT_SCALE,1f);
        if(!Float.isFinite(font)||font<=0)font=1f;
        // Maximum-window insets are independent of the settings card/window size.
        Context displayContext=context.createDisplayContext(display);
        WindowManager manager=(WindowManager)displayContext.getSystemService(Context.WINDOW_SERVICE);
        Insets nav=manager==null?Insets.NONE:manager.getMaximumWindowMetrics().getWindowInsets()
                .getInsetsIgnoringVisibility(WindowInsets.Type.navigationBars());
        int navSize=Math.max(Math.max(nav.left,nav.right),nav.bottom);
        boolean currentLandscape=metrics.widthPixels>metrics.heightPixels;
        DisplayCutout cutout=display.getCutout();
        int[] edges=cutout==null?new int[4]:new int[]{cutout.getSafeInsetLeft(),cutout.getSafeInsetTop(),cutout.getSafeInsetRight(),cutout.getSafeInsetBottom()};
        // Normalize physical cutout edges to rotation zero, then to each requested orientation.
        int rotation=display.getRotation();
        int[] natural=rotate(edges,(4-rotation)%4);
        boolean naturalLandscape=(rotation%2==0)==currentLandscape;
        int[] portraitCutout=rotate(natural,naturalLandscape?1:0);
        int[] landscapeCutout=rotate(natural,naturalLandscape?0:1);
        int[] portrait=safeEdges(displayContext,metrics,false,false,navSize,portraitCutout);
        int[] landscape=safeEdges(displayContext,metrics,true,false,navSize,landscapeCutout);
        int[] reversePortrait=safeEdges(displayContext,metrics,false,true,navSize,rotate(portraitCutout,2));
        int[] reverseLandscape=safeEdges(displayContext,metrics,true,true,navSize,rotate(landscapeCutout,2));
        return new Screen(metrics.widthPixels,metrics.heightPixels,metrics.density,font,portrait,landscape,
                reversePortrait,reverseLandscape,rotation,naturalLandscape);
    }

    private static int[] rotate(int[] edges,int turns) {
        int[] result=edges.clone();
        for(int n=0;n<turns;n++)result=new int[]{result[1],result[2],result[3],result[0]};
        return result;
    }

    // These are framework overlay resources, not module resources. Keep a measured-inset fallback.
    @SuppressWarnings("DiscouragedApi")
    private static int[] safeEdges(Context context,DisplayMetrics metrics,boolean horizontal,boolean reverse,int navSize,int[] cutout) {
        Configuration config=new Configuration(context.getResources().getConfiguration());
        config.orientation=horizontal?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
        config.densityDpi=Math.round(metrics.density*160);
        Resources resources=context.createConfigurationContext(config).getResources();
        int left=cutout[0],right=cutout[2],bottom=cutout[3];
        if(navSize>0){
            int mode=resource(resources,"config_navBarInteractionMode","integer");
            int move=resource(resources,"config_navBarCanMove","bool");
            boolean side=horizontal&&move!=0&&resources.getBoolean(move)&&mode!=0&&resources.getInteger(mode)==0;
            String dimension=side?"navigation_bar_width":horizontal?"navigation_bar_height_landscape":"navigation_bar_height";
            int id=resource(resources,dimension,"dimen");
            int size=id==0?navSize:resources.getDimensionPixelSize(id);
            if(side){if(reverse)left=Math.max(left,size);else right=Math.max(right,size);}
            else bottom=Math.max(bottom,size);
        }
        // Preserve the established distance-from-top origin (the screen's top edge).
        return new int[]{left,right,bottom};
    }
    private static int resource(Resources resources,String name,String type) {return resources.getIdentifier(name,type,"android");}

    public static final class Result {
        public final int width,height,endInset,centerPx,maximumLeftPx,maximumTopPx;
        public final int centerDp,maximumDp,maximumTopDp;
        Result(LauncherMemoryLayout region,TextView label,int width,int height,int inset,float density) {
            this.width=width;this.height=height;endInset=inset;
            maximumLeftPx=Math.max(0,region.textWidth(inset)-width);
            maximumTopPx=Math.max(0,region.height-height);
            centerPx=region.centeredTextLeft(width,label.getPaddingLeft(),label.getPaddingRight(),inset);
            maximumDp=Math.min(2000,(int)Math.floor(maximumLeftPx/density));
            maximumTopDp=Math.min(2000,(int)Math.floor(maximumTopPx/density));
            centerDp=Math.min(maximumDp,Math.round(centerPx/density));
        }
    }

    /** Use explicit typography so app-local themes/font overrides cannot change the two calculations. */
    public static Result measure(TextView label,Screen screen,LauncherMemoryLayout region,long total,long available,
            int style,int content,float size,int heightDp) {
        label.setTypeface(Typeface.DEFAULT);
        label.setTextScaleX(1f);label.setLetterSpacing(0f);label.setFontFeatureSettings("tnum");
        label.setIncludeFontPadding(true);label.setLineSpacing(0f,1f);
        label.setTextDirection(View.TEXT_DIRECTION_LOCALE);
        label.setGravity((style==1&&content==LauncherMemoryPresentation.FULL_LABELS?Gravity.CENTER_HORIZONTAL:Gravity.LEFT)|Gravity.TOP);
        // Both processes use the system font scale, not the settings app's local appearance scale.
        float pixels=size*screen.density*screen.fontScale;
        label.setTextSize(TypedValue.COMPLEX_UNIT_PX,pixels);
        String text=LauncherMemoryPresentation.format(total,available,style,content);
        if(!text.contentEquals(label.getText()))label.setText(text);
        int inset=Math.max(1,screen.px(2));
        int height=Math.min(screen.px(heightDp),region.height);
        int width=measureLabel(label,text,region.textWidth(inset),inset);
        if(label.getMeasuredHeight()>height){
            float fitted=Math.max(6*screen.density*screen.fontScale,pixels*height/label.getMeasuredHeight());
            if(fitted<pixels){label.setTextSize(TypedValue.COMPLEX_UNIT_PX,fitted);width=measureLabel(label,text,region.textWidth(inset),inset);}
        }
        return new Result(region,label,width,height,inset,screen.density);
    }

    private static int measureLabel(TextView label,String text,int maximum,int inset) {
        Paint paint=label.getPaint();Rect ink=new Rect();float advance=0;int left=0,right=0;
        for(int start=0;start<text.length();){
            int end=text.indexOf('\n',start);if(end<0)end=text.length();
            advance=Math.max(advance,paint.measureText(text,start,end));paint.getTextBounds(text,start,end,ink);
            left=Math.min(left,ink.left);right=Math.max(right,ink.right);start=end+1;
        }
        label.setPadding(Math.max(0,-left),0,inset,0);
        int width=Math.min(maximum,LauncherMemoryLayout.drawingWidth(advance,left,right,inset));
        label.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        return width;
    }
}
