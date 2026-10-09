package ls.augment.com;

import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.View;

/** Shared app-only lens for real native controls. Never captures a screen or its foreground. */
final class IceGlassControlDrawable extends Drawable {
    static final int NEUTRAL=0, TONAL=1, ACCENT=2, DANGER=3, TRACK=4, THUMB=5;
    private final UiKit ui;
    private final View owner;
    private final float radius,density;
    private final int role;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final RectF rect=new RectF();
    private final Matrix matrix=new Matrix();
    private final int[] own=new int[2],source=new int[2];
    private Bitmap image;
    private BitmapShader backdrop;
    private LiquidGlassLayout.Optics optics;
    private boolean shaderFailed;
    private int alpha=255;
    IceGlassControlDrawable(UiKit ui,View owner,int radiusDp,int role){
        this.ui=ui;this.owner=owner;this.role=role;
        density=owner.getResources().getDisplayMetrics().density;radius=radiusDp*density;
    }
    private boolean state(int target){for(int s:getState())if(s==target)return true;return false;}
    @Override public boolean isStateful(){return true;}
    @Override protected boolean onStateChange(int[] states){invalidateSelf();return true;}
    @Override public int getIntrinsicWidth(){return role==TRACK?ui.dp(46):role==THUMB?ui.dp(22):-1;}
    @Override public int getIntrinsicHeight(){return role==TRACK?ui.dp(28):role==THUMB?ui.dp(22):-1;}
    @Override public void draw(Canvas canvas){
        Rect b=getBounds();if(b.isEmpty())return;
        canvas.save();canvas.translate(b.left,b.top);
        float w=b.width(),h=b.height();
        // Android gives the thumb the track's height. Keep its visible lens square and centered.
        float thumbOffset=role==THUMB?Math.max(0,(h-w)*.5f):0;
        if(role==THUMB){canvas.translate(0,thumbOffset);h=Math.min(w,h);}
        float r=Math.min(radius,Math.min(w,h)*.5f);
        rect.set(.65f*density,.65f*density,w-.65f*density,h-.65f*density);
        paint.setShader(null);paint.setColor(ui.dark?0xff243c55:0xffeaf6ff);paint.setAlpha(alpha);
        GlassScene scene=ui.appearance.glassScene;
        Bitmap next=scene==null?null:scene.bitmap();
        if(next!=null){
            if(image!=next){image=next;backdrop=new BitmapShader(next,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP);}
            owner.getLocationInWindow(own);scene.source.getLocationInWindow(source);
            matrix.setScale(GlassScene.SCALE,GlassScene.SCALE);
            matrix.postTranslate(source[0]-own[0]-b.left,source[1]-own[1]-b.top-thumbOffset);backdrop.setLocalMatrix(matrix);
            if(!shaderFailed&&canvas.isHardwareAccelerated())try{
                if(optics==null)optics=new LiquidGlassLayout.Optics();
                optics.configure(backdrop,Math.round(w),Math.round(h),r,density,ui.dark,.25f,true,ui.appearance.backdropEmphasis(),ui.backgroundEnd);
                paint.setShader(optics.shader);
            }catch(RuntimeException failure){shaderFailed=true;optics=null;paint.setShader(backdrop);}
            else paint.setShader(backdrop);
        }
        canvas.drawRoundRect(rect,r,r,paint);paint.setShader(null);
        boolean active=role==ACCENT||(role==TRACK&&state(android.R.attr.state_checked));
        int tint=active?(ui.dark?0xec328cef:0xf02c8df0):role==DANGER?(ui.dark?0xc05d303f:0xc0ffe5e9)
                :role==THUMB?(ui.dark?0xefdeeeff:0xeffbfeff):role==TONAL?(ui.dark?0xa0376895:0x803493df)
                :role==TRACK?(ui.dark?0xca48617b:0xb0b8d2e4):(ui.dark?0x70304760:0x8affffff);
        paint.setColor(tint);paint.setAlpha(Color.alpha(tint)*alpha/255);canvas.drawRoundRect(rect,r,r,paint);
        paint.setAlpha(alpha);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.8f*density);
        paint.setShader(new LinearGradient(0,0,w,h,ui.dark?0x9ad2edff:0xfaffffff,active?0x905291d2:0x608eb8d9,Shader.TileMode.CLAMP));
        canvas.drawRoundRect(rect,r,r,paint);paint.setShader(null);paint.setStyle(Paint.Style.FILL);
        if(!state(android.R.attr.state_enabled)&&getState().length>0){paint.setColor(ui.dark?0x80334659:0x709cacb9);canvas.drawRoundRect(rect,r,r,paint);}
        canvas.restore();
    }
    @Override public void setAlpha(int value){alpha=value;invalidateSelf();}
    @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
