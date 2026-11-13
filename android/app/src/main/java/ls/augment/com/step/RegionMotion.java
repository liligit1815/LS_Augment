package ls.augment.com.step;

import android.graphics.RectF;

/** Shared continuous geometry; temporary center cropping keeps content proportional and fills the moving region. */
final class RegionMotion {
    static void interpolate(RectF from,RectF to,float progress,RectF out){
        float p=Math.max(0,Math.min(1,progress));
        out.set(from.left+(to.left-from.left)*p,from.top+(to.top-from.top)*p,
                from.right+(to.right-from.right)*p,from.bottom+(to.bottom-from.bottom)*p);
    }
    static void cover(int width,int height,RectF box,RectF out){
        if(width<=0 || height<=0 || box.isEmpty())throw new IllegalArgumentException("Invalid region frame");
        float scale=Math.max(box.width()/width,box.height()/height),w=width*scale,h=height*scale;
        out.set(box.centerX()-w/2,box.centerY()-h/2,box.centerX()+w/2,box.centerY()+h/2);
    }
}
