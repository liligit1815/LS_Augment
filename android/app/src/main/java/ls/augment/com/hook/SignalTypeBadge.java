package ls.augment.com.hook;

import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import java.util.Arrays;
import java.util.WeakHashMap;

/** Crop only the transparent padding of the SIM's actual OEM network-type artwork. */
final class SignalTypeBadge {
    private Drawable previous;
    private static final WeakHashMap<ImageView,Long> REVISIONS=new WeakHashMap<>();
    private int state,level,sourceWidth,sourceHeight;
    private long revision;
    private String observation="absent";
    private float drawnWidth,drawnHeight,drawnX,drawnY;
    private long drawnRevision=-1;
    private Bitmap image;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final RectF target=new RectF();
    static void invalidated(ImageView view){
        synchronized(REVISIONS){Long value=REVISIONS.get(view);if(value!=null)REVISIONS.put(view,value+1);}
    }
    private static long revision(ImageView view){
        synchronized(REVISIONS){return REVISIONS.computeIfAbsent(view,ignored->0L);}
    }
    void refresh(ImageView view){
        Drawable drawable=view==null?null:view.getDrawable();
        // The layer adapter has no ConstantState. Read its current OEM source;
        // custom layers are applied separately by the combined-row renderer.
        while(drawable instanceof StatusBarAssetDrawable)drawable=((StatusBarAssetDrawable)drawable).original();
        if(drawable==null){previous=null;image=null;observation="absent";drawnRevision=-1;return;}
        int nextState=Arrays.hashCode(drawable.getState()),nextLevel=drawable.getLevel();
        int nativeW=drawable.getIntrinsicWidth()>0?drawable.getIntrinsicWidth():view.getWidth();
        int nativeH=drawable.getIntrinsicHeight()>0?drawable.getIntrinsicHeight():view.getHeight();
        long nextRevision=revision(view);
        if(previous==drawable&&state==nextState&&level==nextLevel&&sourceWidth==nativeW&&sourceHeight==nativeH&&revision==nextRevision)return;
        sourceWidth=nativeW;sourceHeight=nativeH;
        previous=drawable;state=nextState;level=nextLevel;image=null;
        Drawable.ConstantState constant=drawable.getConstantState();
        Drawable copy=constant==null?drawable:constant.newDrawable(view.getResources()).mutate();
        if(constant!=null){copy.setState(drawable.getState());copy.setLevel(nextLevel);copy.clearColorFilter();copy.setTint(0xffffffff);copy.setAlpha(255);}
        // Tiny OEM vectors can contain only 6-20 ink pixels at intrinsic size.
        // Cropping that raster first magnifies a one-pixel edge error per SIM.
        // Measure and retain the actual artwork at subpixel resolution instead.
        float sample=Math.min(8f,1024f/Math.max(1,Math.max(nativeW,nativeH)));
        int w=Math.max(1,Math.round(nativeW*sample)),h=Math.max(1,Math.round(nativeH*sample));
        Bitmap raster=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);
        Rect original=constant==null?new Rect(copy.getBounds()):null;
        try{copy.setBounds(0,0,w,h);copy.draw(new Canvas(raster));}
        finally{if(original!=null)copy.setBounds(original);}
        int[] pixels=new int[w*h];raster.getPixels(pixels,0,w,0,0,w,h);
        int l=w,t=h,r=0,b=0;
        for(int y=0;y<h;y++)for(int x=0;x<w;x++)if((pixels[y*w+x]>>>24)>16){l=Math.min(l,x);r=Math.max(r,x+1);t=Math.min(t,y);b=Math.max(b,y+1);}
        if(r>l&&b>t)image=Bitmap.createBitmap(raster,l,t,r-l,b-t);
        if(image!=raster)raster.recycle();
        revision=revision(view);
        observation="source="+drawable.getClass().getSimpleName()+",native="+nativeW+"x"+nativeH
                +",sample="+w+"x"+h+",crop="+l+":"+t+":"+r+":"+b+",aspect="+aspect()+",revision="+revision
                +",state="+state+",level="+level+",pixels="+Integer.toHexString(Arrays.hashCode(pixels));
    }
    String observation(){return observation+",last_draw="+drawnWidth+"x"+drawnHeight+"@"+drawnX+":"+drawnY+",draw_revision="+drawnRevision;}
    float aspect(){return image==null?0:(float)image.getWidth()/image.getHeight();}
    void draw(Canvas canvas,float x,float y,float width,float height,int color){
        if(image==null)return;
        float scale=Math.min(width/image.getWidth(),height/image.getHeight());
        float w=image.getWidth()*scale,h=image.getHeight()*scale;
        paint.setColorFilter(new PorterDuffColorFilter(color,PorterDuff.Mode.SRC_IN));
        target.set(x+width-w,y+(height-h)/2,x+width,y+(height+h)/2);
        drawnWidth=w;drawnHeight=h;drawnX=target.left;drawnY=target.top;drawnRevision=revision;
        canvas.drawBitmap(image,null,target,paint);
    }
}
