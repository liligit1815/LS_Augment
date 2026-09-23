package ls.augment.com;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;

/** One reusable snapshot of the actual page background, shared by all content lenses. */
final class GlassScene {
    static final int SCALE = 4;
    final View source;
    private final int blurRadius;
    private Bitmap bitmap;
    private int width, height;
    private boolean failed;
    GlassScene(View source, int blurRadius) { this.source=source; this.blurRadius=Math.max(1,blurRadius); }
    Bitmap cachedBitmap() { return bitmap; }
    Bitmap bitmap() {
        if (failed || source.getWidth()<=0 || source.getHeight()<=0) return null;
        if (bitmap!=null && width==source.getWidth() && height==source.getHeight()) return bitmap;
        width=source.getWidth(); height=source.getHeight();
        try {
            int w=(width+SCALE-1)/SCALE, h=(height+SCALE-1)/SCALE;
            Bitmap next=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);
            Canvas canvas=new Canvas(next); canvas.scale(1f/SCALE,1f/SCALE); source.draw(canvas);
            int[] pixels=new int[w*h], scratch=new int[w*h]; next.getPixels(pixels,0,w,0,0,w,h);
            GlassBackdropBlur.blur(pixels,scratch,w,h,blurRadius); next.setPixels(pixels,0,w,0,0,w,h);
            bitmap=next;
        } catch(RuntimeException | OutOfMemoryError error) {
            failed=true; bitmap=null;
            android.util.Log.w("LS_AugmentGlass","Shared backdrop unavailable",error);
        }
        return bitmap;
    }
}
