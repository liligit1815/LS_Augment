package ls.augment.com.step;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;

/** Stock GameAssist artwork, resolved by capability rather than device/version or resource id. */
final class GameSpacePanelStyle {
    static final String PACKAGE="cn.nubia.gameassist";
    static final String[] NAMES={"game_assist_neon_lamp_background","game_assist_neon_lamp_light_off",
            "game_assist_neon_lamp_balance_light","game_assist_neon_lamp_balance_light_share"};
    final Bitmap[] images=new Bitmap[4];
    final Path body=new Path();
    static final float ORIGIN=247f/576f;
    static final float[] OFFSETS={ORIGIN-.002f,ORIGIN+.007f,ORIGIN,ORIGIN-.072f};
    static final float[] STOPS={0,.053f,.062f,.113f,.121f,.172f,.18f,.23f,.239f,.289f,.299f,.348f,
            .358f,.408f,.417f,.466f,.476f,.525f,.535f,.584f,.594f,.645f,.654f,.703f,.713f,.762f,
            .772f,.822f,.832f,.88f,.89f,.94f,.95f,1};

    static GameSpacePanelStyle load(Context context)throws Exception {
        Resources resources=context.createPackageContext(PACKAGE,0).getResources();
        GameSpacePanelStyle style=new GameSpacePanelStyle();
        BitmapFactory.Options options=new BitmapFactory.Options();options.inScaled=false;
        for(int i=0;i<NAMES.length;i++){
            int id=resources.getIdentifier(NAMES[i],"drawable",PACKAGE);
            if(id==0)throw new IllegalStateException("缺少原厂 drawable/"+NAMES[i]);
            Bitmap bitmap=BitmapFactory.decodeResource(resources,id,options);
            if(bitmap==null || !bitmap.hasAlpha() || bitmap.getHeight()<128
                    || bitmap.getWidth()/(float)bitmap.getHeight()<.2f || bitmap.getWidth()/(float)bitmap.getHeight()>.8f)
                throw new IllegalStateException("原厂边框结构不可识别："+NAMES[i]);
            style.images[i]=bitmap;
        }
        // Follow the actual transparent edge of this installed resource. Do not
        // approximate the curved shell with a rectangle or stretch the texture.
        Bitmap back=style.images[0];int w=back.getWidth(),h=back.getHeight();int[] row=new int[w];
        style.body.moveTo(0,1);style.body.lineTo(0,0);
        for(int y=0;;y=Math.min(h-1,y+Math.max(1,h/140))){
            back.getPixels(row,0,w,0,y,w,1);int x=0;
            while(x<w && Color.alpha(row[x])<=10)x++;
            if(x==w)throw new IllegalStateException("原厂边框轮廓缺失：第 "+y+" 行");
            style.body.lineTo(OFFSETS[0]+(x+2f)/h,y/(float)(h-1));
            if(y==h-1)break;
        }
        style.body.lineTo(0,1);style.body.close();return style;
    }
    int stairInset(int height,int top,int width,int length,int gap){
        // Fit the full sloping control against the installed artwork's actual
        // inner edge, including the bend near the illuminated arrow.
        Bitmap back=images[0];int w=back.getWidth(),h=back.getHeight();int[] row=new int[w];
        float inset=Float.POSITIVE_INFINITY;
        for(int i=0;i<=32;i++){
            float t=i/32f;
            int y=Math.max(0,Math.min(h-1,Math.round((top+t*length)*(h-1)/height)));
            back.getPixels(row,0,w,0,y,w,1);int x=0;
            while(x<w && Color.alpha(row[x])<=10)x++;
            float edge=height*(OFFSETS[0]+(x+2f)/h);
            inset=Math.min(inset,edge-gap-width*(1-.84f*t));
        }
        return (int)Math.floor(inset);
    }
    Bitmap renderBase(int height,boolean right){
        int width=(int)Math.ceil(height*.95f);
        Bitmap result=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);
        Canvas c=new Canvas(result);Paint p=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
        if(right){c.translate(width,0);c.scale(-1,1);}
        Path outline=new Path(body);Matrix matrix=new Matrix();matrix.setScale(height,height);outline.transform(matrix);
        p.setColor(0xd9000000);c.drawPath(outline,p);
        c.save();c.clipPath(outline);p.setColor(Color.BLACK);c.drawRect(0,0,width,height*.153f,p);
        p.setShader(new LinearGradient(0,0,width,0,new int[]{0x00ffffff,0x00ffffff,0x66ffffff},new float[]{0,.1f,1},Shader.TileMode.CLAMP));
        p.setStrokeWidth(2*height/1152f);c.drawLine(0,height*.153f,width,height*.153f,p);p.setShader(null);c.restore();
        for(int i=0;i<2;i++){
            Bitmap bitmap=images[i];float x=OFFSETS[i]*height;
            c.drawBitmap(bitmap,null,new RectF(x,0,x+height*bitmap.getWidth()/(float)bitmap.getHeight(),height),p);
        }
        return result;
    }
    /** Keep the shell cached; only the two original lamp layers are redrawn during entry. */
    final class LampDrawable extends Drawable {
        final int height,width;final boolean right;final Bitmap base;
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
        float phase=1;int opacity=255;
        LampDrawable(int height,boolean right){
            this.height=height;this.right=right;width=(int)Math.ceil(height*.95f);base=renderBase(height,right);
        }
        void phase(float value){phase=GameSpacePanelMotion.clamp(value);invalidateSelf();}
        @Override public void draw(Canvas canvas){
            int save=canvas.save();canvas.translate(getBounds().left,getBounds().top);
            canvas.scale(getBounds().width()/(float)width,getBounds().height()/(float)height);
            paint.setAlpha(opacity);canvas.drawBitmap(base,0,0,paint);
            if(right){canvas.translate(width,0);canvas.scale(-1,1);}
            float level=GameSpacePanelMotion.lampLevel(phase,right?.298f:.598f);
            for(int i=2;i<images.length;i++){
                int layer=canvas.saveLayer(0,0,width,height,null);Bitmap bitmap=images[i];float x=OFFSETS[i]*height;
                canvas.drawBitmap(bitmap,null,new RectF(x,0,x+height*bitmap.getWidth()/(float)bitmap.getHeight(),height),paint);
                paint.setAlpha(255);paint.setShader(mask(height,level-(i==2?.1f:0),i==3));
                paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));canvas.drawRect(0,0,width,height,paint);
                paint.setXfermode(null);paint.setShader(null);paint.setAlpha(opacity);canvas.restoreToCount(layer);
            }
            canvas.restoreToCount(save);
        }
        @Override public void setAlpha(int value){opacity=value;invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    static LinearGradient mask(int height,float level,boolean glow){
        int[] colors=new int[STOPS.length];float amount=level*17;int full=(int)amount;float fraction=(amount-full)/6;
        for(int i=0;i<17;i++){
            float alpha=i<full?1:Math.max(0,Math.min(1,1-(i-full)/6f+fraction));
            if(!glow)alpha=Math.min(1,alpha*2);
            colors[2*i]=colors[2*i+1]=((int)(alpha*255))<<24;
        }
        return new LinearGradient(0,height,0,0,colors,STOPS,Shader.TileMode.CLAMP);
    }
}
