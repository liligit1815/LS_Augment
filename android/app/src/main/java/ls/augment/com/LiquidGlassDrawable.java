package ls.augment.com;

import android.animation.ValueAnimator;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowManager;
import java.lang.ref.WeakReference;

/** Optical background only: callers draw native foreground afterwards, with no touch changes. */
public final class LiquidGlassDrawable extends Drawable {
    /** Canvas origin is Drawable.bounds' top-left; dimensions are that rect in host pixels.
     * A source must draw only a verified backdrop and return false if stale/unavailable. */
    public interface BackdropSource {
        boolean draw(Canvas canvas,int width,int height);
        /** Rechecked even while the material's texture is cached. */
        default boolean isValid(){return true;}
        /** Stable generation for unchanged pixels, or -1 for an unversioned source. */
        default long revision(){return -1;}
    }

    private final WeakReference<View> host;
    private final BackdropSource source;
    private final float radius,density;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    private final Paint rimPaint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF shape=new RectF();
    private final Matrix textureMatrix=new Matrix();
    private Bitmap bitmap;
    private Canvas sampleCanvas;
    private BitmapShader texture;
    private RuntimeShader optics;
    private LinearGradient rimGradient,fallbackGradient;
    private int gradientWidth,gradientHeight,fallbackTop,fallbackBottom;
    private int[] pixels,scratch;
    private int alpha=255;
    private boolean reduceTransparency,reduceMotion,highContrast,failed,ready,released,lightForeground;
    private boolean iconOnly,controlSurface;
    private int materialTint=Color.TRANSPARENT;
    private float tintStrength;
    private float lightX=.24f,lightY=.06f,pressure;
    private long sampledAt,lastAccessibilityRead,sampledRevision=-1,revealStartedAt=-1;
    private ValueAnimator releaseAnimation;
    private String failure="not_prepared";

    public LiquidGlassDrawable(View view,BackdropSource backdrop,float radiusDp) {
        if(view==null||backdrop==null)throw new IllegalArgumentException("Host and verified backdrop required");
        host=new WeakReference<>(view);source=backdrop;
        density=view.getResources().getDisplayMetrics().density;
        radius=Math.max(0,radiusDp)*density;
        lightForeground=(view.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)
                ==Configuration.UI_MODE_NIGHT_YES;
    }
    public void setForegroundIsLight(boolean value) { if(lightForeground!=value){lightForeground=value;redraw();} }
    /** A Dock or icon well has no text requiring an opaque dark backing. */
    public void setIconOnly(boolean value) { if(iconOnly!=value){iconOnly=value;redraw();} }
    /** Controls need a calmer backdrop than the clear tray below opaque application icons. */
    public void setControlSurface(boolean value) {
        if(controlSurface==value)return;
        controlSurface=value;ready=false;sampledAt=0;sampledRevision=-1;revealStartedAt=-1;redraw();
    }
    public void setMaterialTint(int color,float strength) {
        float amount=Math.min(.65f,LiquidGlassPolicy.clamp01(strength));
        if(materialTint!=color||tintStrength!=amount){materialTint=color;tintStrength=amount;redraw();}
    }
    public void updatePreferences(boolean lessTransparency,boolean lessMotion) {
        if(reduceTransparency!=lessTransparency){ready=false;sampledAt=0;revealStartedAt=-1;}
        reduceTransparency=lessTransparency;reduceMotion=lessMotion;
        if(motionReduced()){cancelAnimation();pressure=0;lightX=.24f;lightY=.06f;revealStartedAt=-1;}
    }
    public String failureReason() { return failure; }
    public boolean isReady() { return ready&&!failed&&!released; }
    public boolean isFailed() { return failed; }
    public void invalidateBackdrop() { sampledAt=0;sampledRevision=-1; }

    /** UI thread only. Does not capture, draw the root tree or read back GPU buffers. */
    public boolean prepare() {
        View view=host.get();Rect b=getBounds();
        if(released){ready=false;failure="released";return false;}
        if(failed){ready=false;return false;}
        if(view==null||!view.isAttachedToWindow()||!view.isHardwareAccelerated()
                ||b.width()<=0||b.height()<=0||!validHost(view)){ready=false;revealStartedAt=-1;failure="host_unavailable";return false;}
        long now=SystemClock.uptimeMillis();
        if(now-lastAccessibilityRead>1000){
            lastAccessibilityRead=now;
            try{highContrast=Settings.Secure.getInt(view.getContext().getContentResolver(),
                    "high_text_contrast_enabled",0)!=0;}catch(RuntimeException ignored){highContrast=false;}
        }
        if(reduceTransparency){ready=true;failure="reduced_transparency";return true;}
        if(!source.isValid()){ready=false;revealStartedAt=-1;failure="backdrop_unavailable";return false;}
        long revision=source.revision();
        if(ready&&revision>=0&&revision==sampledRevision)return true;
        if(ready&&now-sampledAt<LiquidGlassPolicy.SAMPLE_INTERVAL_MS)return true;
        try {
            if(optics==null)optics=new RuntimeShader(SHADER);
            int[] size=LiquidGlassPolicy.sampleSize(b.width(),b.height());
            if(bitmap==null||bitmap.getWidth()!=size[0]||bitmap.getHeight()!=size[1]){
                bitmap=Bitmap.createBitmap(size[0],size[1],Bitmap.Config.ARGB_8888);
                sampleCanvas=new Canvas(bitmap);pixels=new int[size[0]*size[1]];scratch=new int[pixels.length];
                texture=new BitmapShader(bitmap,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP);
            }
            bitmap.eraseColor(Color.TRANSPARENT);
            int save=sampleCanvas.save();
            boolean valid;
            try{sampleCanvas.scale(size[0]/(float)b.width(),size[1]/(float)b.height());
                valid=source.draw(sampleCanvas,b.width(),b.height());}
            finally{sampleCanvas.restoreToCount(save);}
            if(!valid){ready=false;revealStartedAt=-1;failure="backdrop_unavailable";return false;}
            bitmap.getPixels(pixels,0,size[0],0,0,size[0],size[1]);
            // Transparent holes could reveal feedback or hide failed capture: reject them.
            for(int i=0;i<pixels.length;i+=Math.max(1,pixels.length/256))
                if((pixels[i]>>>24)<250){ready=false;revealStartedAt=-1;failure="incomplete_backdrop";return false;}
            // Three running-sum passes stay bounded by pixels, not by the blur kernel area.
            int blurRadius=Math.max(1,Math.min(controlSurface?18:6,
                    Math.round((controlSurface?10:3)*density*size[0]/b.width())));
            GlassBackdropBlur.blur(pixels,scratch,size[0],size[1],blurRadius);
            bitmap.setPixels(pixels,0,size[0],0,0,size[0],size[1]);
            textureMatrix.setScale(b.width()/(float)size[0],b.height()/(float)size[1]);
            texture.setLocalMatrix(textureMatrix);
            if(!ready)revealStartedAt=controlSurface&&!motionReduced()?now:-1;
            sampledAt=now;sampledRevision=revision;ready=true;failure="";return true;
        }catch(RuntimeException|OutOfMemoryError error){
            failed=true;ready=false;failure="renderer_unavailable";clearTexture();return false;
        }
    }

    /** Coordinates are host-local (same coordinates as Drawable.bounds); never consumes input. */
    public void setInteraction(float x,float y,boolean pressed) {
        if(released||motionReduced())return;
        cancelAnimation();Rect b=getBounds();
        if(pressed){lightX=LiquidGlassPolicy.clamp01((x-b.left)/Math.max(1,b.width()));
            lightY=LiquidGlassPolicy.clamp01((y-b.top)/Math.max(1,b.height()));pressure=1;redraw();}
        else{
            float fromX=lightX,fromY=lightY,fromPressure=pressure;
            releaseAnimation=ValueAnimator.ofFloat(0,1);releaseAnimation.setDuration(260);
            releaseAnimation.addUpdateListener(a->{float f=(float)a.getAnimatedValue();
                lightX=fromX+(.24f-fromX)*f;lightY=fromY+(.06f-fromY)*f;pressure=fromPressure*(1-f);redraw();});
            releaseAnimation.start();
        }
    }
    @Override public void draw(Canvas canvas) {
        if(!isReady()||!canvas.isHardwareAccelerated())return;
        View view=host.get();
        if(view==null||!view.isAttachedToWindow()||!validHost(view)
                ||(!reduceTransparency&&!source.isValid())){ready=false;revealStartedAt=-1;failure="backdrop_or_host_unavailable";return;}
        Rect b=getBounds();if(b.isEmpty())return;
        int save=canvas.save();canvas.translate(b.left,b.top);
        try{
            shape.set(0,0,b.width(),b.height());float round=Math.min(radius,Math.min(b.width(),b.height())*.5f);
            paint.setAlpha(alpha);paint.setShader(null);
            if(reduceTransparency){paint.setColor(lightForeground?0xff202126:0xfff1f2f4);paint.setAlpha(alpha);}
            else if(optics!=null&&texture!=null){
                float reveal=backdropReveal();
                if(reveal<1)drawFallbackBody(canvas,b.width(),b.height(),round,Math.round(alpha*(1-reveal)));
                optics.setInputShader("backdrop",texture);optics.setFloatUniform("size",b.width(),b.height());
                optics.setFloatUniform("radius",round);optics.setFloatUniform("dp",density);
                optics.setFloatUniform("light",lightX,lightY);
                optics.setFloatUniform("pressure",motionReduced()?0:pressure);
                optics.setFloatUniform("whiteText",lightForeground?1:0);
                optics.setFloatUniform("highContrast",highContrast?1:0);
                optics.setFloatUniform("iconOnly",iconOnly?1:0);
                optics.setFloatUniform("controlSurface",controlSurface?1:0);
                optics.setFloatUniform("tint",Color.red(materialTint)/255f,Color.green(materialTint)/255f,Color.blue(materialTint)/255f);
                optics.setFloatUniform("tintAmount",tintStrength);
                paint.setColor(Color.WHITE);paint.setAlpha(Math.round(alpha*reveal));paint.setShader(optics);
                if(reveal<1)redraw();
            }else return;
            canvas.drawRoundRect(shape,round,round,paint);
            drawRim(canvas,b.width(),b.height(),round);
        }catch(RuntimeException error){failed=true;ready=false;failure="gpu_draw_failed";}
        finally{paint.setShader(null);canvas.restoreToCount(save);}
    }

    /** Explicit translucent fallback, not simulated capture or a claim of working refraction. */
    public boolean drawFallback(Canvas canvas) {
        View view=host.get();Rect b=getBounds();
        if(released||view==null||!view.isAttachedToWindow()||!view.isShown()||!view.isHardwareAccelerated()
                ||!canvas.isHardwareAccelerated()||b.isEmpty()||!validFallbackHost(view))return false;
        int save=canvas.save();canvas.translate(b.left,b.top);
        try{
            float round=Math.min(radius,Math.min(b.width(),b.height())*.5f);
            shape.set(0,0,b.width(),b.height());
            drawFallbackBody(canvas,b.width(),b.height(),round,alpha);
            drawRim(canvas,b.width(),b.height(),round);
            return true;
        }catch(RuntimeException error){return false;}
        finally{paint.setShader(null);canvas.restoreToCount(save);}
    }
    private float backdropReveal(){
        if(!controlSurface||motionReduced()||revealStartedAt<0)return 1;
        float progress=LiquidGlassPolicy.clamp01((SystemClock.uptimeMillis()-revealStartedAt)/180f);
        if(progress>=1)revealStartedAt=-1;
        return progress*progress*(3-2*progress);
    }
    private void drawFallbackBody(Canvas canvas,int width,int height,float round,int opacity){
        int top=iconOnly?0x38ffffff:lightForeground?0x86303b50:0xb8ffffff;
        int bottom=iconOnly?0x1895a2b5:lightForeground?0x98202a3c:0x948d9fb5;
        ensureGradients(width,height);
        if(fallbackGradient==null||fallbackTop!=top||fallbackBottom!=bottom){
            fallbackGradient=new LinearGradient(0,0,width*.3f,height,top,bottom,Shader.TileMode.CLAMP);
            fallbackTop=top;fallbackBottom=bottom;
        }
        paint.setShader(fallbackGradient);paint.setColor(Color.WHITE);paint.setAlpha(opacity);
        canvas.drawRoundRect(shape,round,round,paint);paint.setShader(null);
        if(tintStrength>0){paint.setColor(materialTint);paint.setAlpha(Math.round(opacity*tintStrength));
            canvas.drawRoundRect(shape,round,round,paint);}
    }
    private void drawRim(Canvas canvas,int width,int height,float round){
        // The paired light/dark edge remains visible on both white and dark wallpapers.
        float inset=.65f*density;
        shape.set(inset,inset,width-inset,height-inset);
        rimPaint.setStyle(Paint.Style.STROKE);rimPaint.setStrokeWidth(1.1f*density);
        ensureGradients(width,height);
        rimPaint.setShader(rimGradient);
        rimPaint.setAlpha(alpha);
        canvas.drawRoundRect(shape,Math.max(0,round-inset),Math.max(0,round-inset),rimPaint);
        rimPaint.setShader(null);rimPaint.setStyle(Paint.Style.FILL);
    }
    private void ensureGradients(int width,int height){
        if(rimGradient!=null&&gradientWidth==width&&gradientHeight==height)return;
        gradientWidth=width;gradientHeight=height;fallbackGradient=null;
        rimGradient=new LinearGradient(0,0,width*.65f,height,
                new int[]{0xb8ffffff,0x3dffffff,0x25152a42,0x78ffffff},
                new float[]{0,.38f,.7f,1},Shader.TileMode.CLAMP);
    }
    public void release() { released=true;ready=false;cancelAnimation();clearTexture();setCallback(null); }
    private void clearTexture(){bitmap=null;sampleCanvas=null;texture=null;pixels=null;scratch=null;optics=null;rimGradient=null;fallbackGradient=null;revealStartedAt=-1;}
    private void cancelAnimation(){if(releaseAnimation!=null){releaseAnimation.cancel();releaseAnimation=null;}}
    private boolean motionReduced(){return reduceMotion||!ValueAnimator.areAnimatorsEnabled();}
    private void redraw(){invalidateSelf();View view=host.get();if(view!=null)view.invalidate(getBounds());}
    private static boolean validHost(View view){
        for(View v=view;v!=null;){
            if(v.getScaleX()!=1||v.getScaleY()!=1||v.getRotation()!=0||v.getRotationX()!=0||v.getRotationY()!=0)return false;
            ViewParent parent=v.getParent();v=parent instanceof View?(View)parent:null;
        }
        android.view.ViewGroup.LayoutParams params=view.getRootView().getLayoutParams();
        return !(params instanceof WindowManager.LayoutParams)
                ||((((WindowManager.LayoutParams)params).flags&WindowManager.LayoutParams.FLAG_SECURE)==0);
    }
    private boolean validFallbackHost(View view){
        if(!controlSurface)return validHost(view);
        // This path draws no captured pixels. Normal 2-D opening scale is applied by
        // the caller's Canvas, so its local gradient can appear with the native controls.
        // Real capture/texture coordinates still require validHost() with unit scale.
        for(View v=view;v!=null;){
            float sx=v.getScaleX(),sy=v.getScaleY();
            if(!Float.isFinite(sx)||!Float.isFinite(sy)||sx<.5f||sx>1.5f||sy<.5f||sy>1.5f
                    ||v.getRotation()!=0||v.getRotationX()!=0||v.getRotationY()!=0)return false;
            ViewParent parent=v.getParent();v=parent instanceof View?(View)parent:null;
        }
        android.view.ViewGroup.LayoutParams params=view.getRootView().getLayoutParams();
        return !(params instanceof WindowManager.LayoutParams)
                ||((((WindowManager.LayoutParams)params).flags&WindowManager.LayoutParams.FLAG_SECURE)==0);
    }
    @Override protected void onBoundsChange(Rect bounds){sampledAt=0;ready=false;revealStartedAt=-1;}
    @Override public void setAlpha(int value){alpha=Math.max(0,Math.min(255,value));redraw();}
    @Override public int getAlpha(){return alpha;}
    @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);redraw();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}

    // The texture is the backdrop alone. Lensing changes sampling coordinates, never glyphs.
    private static final String SHADER=
            "uniform shader backdrop; uniform float2 size; uniform float radius; uniform float dp;"+
            "uniform float2 light; uniform float pressure; uniform float whiteText; uniform float highContrast;"+
            "uniform float iconOnly; uniform float controlSurface; uniform float3 tint; uniform float tintAmount;"+
            "float3 linearize(float3 c){return mix(c/12.92,pow((c+.055)/1.055,float3(2.4)),step(float3(.04045),c));}"+
            "float3 encode(float3 c){return mix(c*12.92,1.055*pow(max(c,0.0),float3(1.0/2.4))-.055,step(float3(.0031308),c));}"+
            "half4 main(float2 p){"+
            "float2 v=p-size*.5;float2 q=abs(v)-(size*.5-float2(radius));float2 z=max(q,0.0);"+
            "float sd=length(z)+min(max(q.x,q.y),0.0)-radius;"+
            "float2 n=length(z)>.001?normalize(z)*sign(v):(q.x>q.y?float2(sign(v.x),0):float2(0,sign(v.y)));"+
            "float edge=1.0-smoothstep(0.0,12.0*dp,max(0.0,-sd));"+
            "float2 uv=p-n*edge*edge*8.0*dp*(1.0+pressure*.18);"+
            "float3 rgb=linearize(float3(backdrop.eval(clamp(uv,float2(0),size)).rgb));"+
            "float baseY=dot(rgb,float3(.2126,.7152,.0722));"+
            "float3 calm=mix(float3(baseY),rgb,.45);calm=mix(calm,float3(.52,.57,.64),.22);"+
            "rgb=mix(rgb,calm,controlSurface);"+
            "rgb=mix(rgb,linearize(tint),tintAmount);"+
            "float y=dot(rgb,float3(.2126,.7152,.0722));"+
            "float ceiling=mix(.115,.08,highContrast);float floor=mix(.38,.72,highContrast);"+
            "float mixDark=max(.06,1.0-ceiling/max(.001,y));float mixLight=max(.06,(floor-y)/max(.001,1.0-y));"+
            "float a=clamp(mix(mixLight,mixDark,whiteText),0.0,1.0);"+
            "float3 readable=mix(rgb,float3(1.0-whiteText),a);"+
            "float3 clearGlass=mix(rgb,float3(.9,.94,1.0),mix(.055,.2,highContrast));"+
            "rgb=mix(readable,clearGlass,iconOnly);"+
            "float2 l=normalize((light-float2(.5)) * float2(1.0,.65)+float2(.001,-.3));"+
            "float rim=pow(max(dot(n,l),0.0),4.0)*edge*(.032+pressure*.018);"+
            "float caustic=exp(-pow((-sd-2.2*dp)/(1.1*dp),2.0))*.015;"+
            "float shade=pow(max(dot(n,-l),0.0),3.0)*edge*.12;"+
            "rgb=clamp(rgb*(1.0-shade)+float3(rim+caustic),0.0,1.0);return half4(encode(rgb),1);}";
}
