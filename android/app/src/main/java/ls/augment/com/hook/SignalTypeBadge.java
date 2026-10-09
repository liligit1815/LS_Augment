package ls.augment.com.hook;

import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import java.util.Arrays;

/** Crop only the transparent padding of the SIM's actual OEM network-type artwork. */
final class SignalTypeBadge {
    private Drawable previous;
    private int state,level;
    private Bitmap image;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final RectF target=new RectF();
    void refresh(ImageView view){
        Drawable drawable=view==null?null:view.getDrawable();
        // The layer adapter has no ConstantState. Read its current OEM source;
        // custom layers are applied separately by the combined-row renderer.
        while(drawable instanceof StatusBarAssetDrawable)drawable=((StatusBarAssetDrawable)drawable).original();
        if(drawable==null){previous=null;image=null;return;}
        int nextState=Arrays.hashCode(drawable.getState()),nextLevel=drawable.getLevel();
        if(previous==drawable&&state==nextState&&level==nextLevel)return;
        previous=drawable;state=nextState;level=nextLevel;image=null;
        Drawable.ConstantState constant=drawable.getConstantState();
        Drawable copy=constant==null?drawable:constant.newDrawable(view.getResources()).mutate();
        if(constant!=null){copy.setState(drawable.getState());copy.setLevel(nextLevel);copy.clearColorFilter();copy.setTint(0xffffffff);copy.setAlpha(255);}
        int w=Math.max(1,Math.min(256,copy.getIntrinsicWidth()>0?copy.getIntrinsicWidth():view.getWidth()));
        int h=Math.max(1,Math.min(256,copy.getIntrinsicHeight()>0?copy.getIntrinsicHeight():view.getHeight()));
        Bitmap raster=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);
        Rect original=constant==null?new Rect(copy.getBounds()):null;
        try{copy.setBounds(0,0,w,h);copy.draw(new Canvas(raster));}
        finally{if(original!=null)copy.setBounds(original);}
        int[] pixels=new int[w*h];raster.getPixels(pixels,0,w,0,0,w,h);
        int l=w,t=h,r=0,b=0;
        for(int y=0;y<h;y++)for(int x=0;x<w;x++)if((pixels[y*w+x]>>>24)>16){l=Math.min(l,x);r=Math.max(r,x+1);t=Math.min(t,y);b=Math.max(b,y+1);}
        if(r>l&&b>t)image=Bitmap.createBitmap(raster,l,t,r-l,b-t);
        if(image!=raster)raster.recycle();
    }
    float aspect(){return image==null?0:(float)image.getWidth()/image.getHeight();}
    void draw(Canvas canvas,float x,float y,float width,float height,int color){
        if(image==null)return;
        float scale=Math.min(width/image.getWidth(),height/image.getHeight());
        float w=image.getWidth()*scale,h=image.getHeight()*scale;
        paint.setColorFilter(new PorterDuffColorFilter(color,PorterDuff.Mode.SRC_IN));
        target.set(x+width-w,y+(height-h)/2,x+width,y+(height+h)/2);
        canvas.drawBitmap(image,null,target,paint);
    }
}
