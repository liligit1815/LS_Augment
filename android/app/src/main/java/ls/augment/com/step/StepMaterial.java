package ls.augment.com.step;

import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.*;
import android.graphics.drawable.*;
import android.os.ParcelFileDescriptor;
import android.view.Gravity;
import android.widget.*;

final class StepMaterial {
    // TYPE_STATUS_BAR_SUB_PANEL is the SystemUI window above the scaled main pane.
    // Android exposes createWindowContext but omits this privileged type from its SDK IntDef.
    static final int STATUS_BAR_SUB_PANEL = 2017;
    @android.annotation.SuppressLint("WrongConstant")
    static Context statusBarPanelContext(Context base, android.view.Display display) {
        return base.createDisplayContext(display).createWindowContext(STATUS_BAR_SUB_PANEL, null);
    }
    static int dp(Context c,float n){return Math.round(c.getResources().getDisplayMetrics().density*n);}
    static boolean dark(Context c){return (c.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;}
    static int ink(Context c){return dark(c)?0xfff1f4f7:0xff1a2634;}
    static void feedback(android.view.View view){
        Context c=view.getContext();GradientDrawable mask=new GradientDrawable();
        mask.setColor(Color.WHITE);mask.setCornerRadius(dp(c,8));
        view.setForeground(ls.augment.com.ControlFeedback.ripple(dark(c)?0xff72bbff:0xff1f74c5,null,mask));
    }
    static GradientDrawable glass(Context c,boolean solid,int radius) {
        int[] colors=dark(c)?new int[]{solid?0xf0414954:0xb048525c,solid?0xfa272e38:0xbb293440}
                             :new int[]{solid?0xf4f3f7fc:0xccf4f7fa,solid?0xf2d9e2ed:0xc4d5e2ee};
        GradientDrawable g=new GradientDrawable(GradientDrawable.Orientation.TL_BR,colors);
        g.setCornerRadius(dp(c,radius));g.setStroke(1,dark(c)?0x447d8694:0xbaffffff);return g;
    }
    static void slot(Button cell,boolean empty){
        cell.setPadding(0,0,0,0);
        cell.setText(empty?"＋":"");cell.setTextSize(34);cell.setTextColor(ink(cell.getContext()));
        if(empty)cell.setBackground(glass(cell.getContext(),true,0));else cell.setBackgroundColor(Color.TRANSPARENT);
    }
    static TextView label(Context c,String text,float sp,boolean bold){
        TextView v=new TextView(c);v.setText(text);v.setTextColor(ink(c));v.setTextSize(sp);
        v.setGravity(Gravity.CENTER);v.setIncludeFontPadding(false);
        if(bold)v.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));return v;
    }
    /** Decode a bounded wallpaper thumbnail. Live wallpapers without a readable image use the color material. */
    static Bitmap wallpaper(Context c) {
        return wallpaper(c,320);
    }
    static Bitmap wallpaper(Context c,int maxSize) {
        WallpaperManager manager=c.getSystemService(WallpaperManager.class);
        try {
            BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
            try(ParcelFileDescriptor file=manager.getWallpaperFile(WallpaperManager.FLAG_SYSTEM)){
                if(file==null)return null;BitmapFactory.decodeFileDescriptor(file.getFileDescriptor(),null,options);
            }
            if(options.outWidth<=0 || options.outHeight<=0)return null;
            options.inJustDecodeBounds=false;
            options.inSampleSize=1;
            while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>maxSize)options.inSampleSize*=2;
            try(ParcelFileDescriptor file=manager.getWallpaperFile(WallpaperManager.FLAG_SYSTEM)){
                return file==null?null:BitmapFactory.decodeFileDescriptor(file.getFileDescriptor(),null,options);
            }
        } catch(Exception unavailable){return null;}
    }
    static ImageView wallView(Context c) {
        ImageView view=new ImageView(c);view.setScaleType(ImageView.ScaleType.CENTER_CROP);
        view.setRenderEffect(RenderEffect.createBlurEffect(dp(c,20),dp(c,20),Shader.TileMode.CLAMP));return view;
    }
}
