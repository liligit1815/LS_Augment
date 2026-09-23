package ls.augment.com;

import android.animation.ValueAnimator;
import android.graphics.*;
import android.os.Build;
import android.view.*;
import android.view.animation.PathInterpolator;
import android.widget.LinearLayout;

/**
 * A floating optical layer, sampling only the clipped area of the real view tree.
 * Capture excludes glass surfaces to avoid feedback. Text and controls are drawn
 * afterwards at full resolution. No screen recording permission or external data.
 */
final class LiquidGlassLayout extends LinearLayout {
    private static boolean capturing;
    private final UiKit ui;
    private final boolean contentSurface;
    private final float density, radius;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF bounds = new RectF(), selection = new RectF();
    private final Rect visibleBounds = new Rect();
    private final int[] ownLocation = new int[2], sourceLocation = new int[2];
    private final Matrix textureMatrix = new Matrix();
    private final ViewTreeObserver.OnPreDrawListener beforeDraw = () -> { captureIfNeeded(); return true; };
    private final ViewTreeObserver.OnScrollChangedListener scrolled = this::refreshBackdrop;
    private final ViewTreeObserver.OnGlobalLayoutListener laidOut = this::refreshBackdrop;
    private Bitmap bitmap;
    private Canvas bitmapCanvas;
    private BitmapShader texture;
    private Optics optics;
    private boolean dirty = true, failed, captureDisabled;
    private int[] pixels, scratch;
    private int generation, selected = -1;
    private long signature;
    private float selectionPosition = -1, stretch, lightX = .22f;
    private ValueAnimator selectionAnimator, lightAnimator;
    private ViewTreeObserver observer;
    private Shader outerRim, innerRim, selectedFill;
    private int rimWidth = -1, rimHeight = -1, fillTop = -1, fillBottom = -1;
    private float rimLight = -1;

    LiquidGlassLayout(UiKit ui, int radiusDp) {
        this(ui,radiusDp,false);
    }
    LiquidGlassLayout(UiKit ui, int radiusDp, boolean contentSurface) {
        super(ui.activity); this.ui=ui; this.contentSurface=contentSurface;
        density=getResources().getDisplayMetrics().density; radius=radiusDp*density;
        setWillNotDraw(false); setBackground(null); setClickable(!contentSurface);
        setElevation(ui.dp(contentSurface?3:9));
        setOutlineProvider(new ViewOutlineProvider() {
            @Override public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0,0,getWidth(),getHeight(),radius); outline.setAlpha(.22f);
            }
        });
        setOutlineAmbientShadowColor(0x503679a8); setOutlineSpotShadowColor(0x503679a8);
        setClipToOutline(true);
    }

    int captureGeneration() { return generation; }
    static boolean capturingBackdrop() { return capturing; }
    long backdropSignature() { return signature; }
    boolean opticalEffectActive() { return optics != null && !failed && generation > 0 && isHardwareAccelerated(); }
    void refreshBackdrop() { dirty=true; invalidate(); }

    void select(int index, boolean animate) {
        if (index == selected) return;
        selected=index;
        if (selectionAnimator != null) selectionAnimator.cancel();
        if (!animate || selectionPosition < 0 || !ValueAnimator.areAnimatorsEnabled()) {
            selectionPosition=index; stretch=0; invalidate(); return;
        }
        float from=selectionPosition;
        selectionAnimator=ValueAnimator.ofFloat(0,1);
        selectionAnimator.setDuration(360);
        selectionAnimator.setInterpolator(new PathInterpolator(.2f,.8f,.2f,1));
        selectionAnimator.addUpdateListener(animation -> {
            float f=(float)animation.getAnimatedValue(); selectionPosition=from+(index-from)*f;
            stretch=(float)Math.sin(Math.PI*f)*.09f; invalidate();
        });
        selectionAnimator.start();
    }

    @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
        if (event.getActionMasked()==MotionEvent.ACTION_DOWN || event.getActionMasked()==MotionEvent.ACTION_MOVE) {
            if (lightAnimator!=null) lightAnimator.cancel();
            lightX=Math.max(0,Math.min(1,event.getX()/Math.max(1,getWidth()))); invalidate();
        } else if (event.getActionMasked()==MotionEvent.ACTION_UP || event.getActionMasked()==MotionEvent.ACTION_CANCEL) {
            if (ValueAnimator.areAnimatorsEnabled()) {
                lightAnimator=ValueAnimator.ofFloat(lightX,.22f); lightAnimator.setDuration(420);
                lightAnimator.addUpdateListener(a -> { lightX=(float)a.getAnimatedValue(); invalidate(); }); lightAnimator.start();
            } else { lightX=.22f; invalidate(); }
        }
        return super.dispatchTouchEvent(event);
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow(); observer=getViewTreeObserver();
        observer.addOnPreDrawListener(beforeDraw); observer.addOnScrollChangedListener(scrolled);
        observer.addOnGlobalLayoutListener(laidOut); dirty=true;
    }
    @Override protected void onDetachedFromWindow() {
        if(observer!=null && observer.isAlive()) { observer.removeOnPreDrawListener(beforeDraw);
            observer.removeOnScrollChangedListener(scrolled); observer.removeOnGlobalLayoutListener(laidOut); }
        observer=null;
        if(selectionAnimator!=null) selectionAnimator.cancel();
        if(lightAnimator!=null) lightAnimator.cancel();
        // Let the render thread release a submitted bitmap before GC reclaims it.
        bitmap=null; bitmapCanvas=null; texture=null; optics=null; pixels=null; scratch=null; dirty=true; captureDisabled=false;
        super.onDetachedFromWindow();
    }
    @Override protected void onSizeChanged(int w,int h,int oldW,int oldH) { super.onSizeChanged(w,h,oldW,oldH); dirty=true; }
    @Override public void draw(Canvas canvas) {
        // Navigation's pre-draw can run before a newly attached card's listener.
        // Sample its current position before drawing it into the navigation lens.
        if(capturing && contentSurface && dirty) { updateSharedBackdrop(); prepareOptics(); }
        if (!capturing || contentSurface) super.draw(canvas);
    }

    private void captureIfNeeded() {
        if(!dirty || captureDisabled || capturing || getWidth()==0 || getHeight()==0 || !getGlobalVisibleRect(visibleBounds)) return;
        if(contentSurface) { updateSharedBackdrop(); prepareOptics(); return; }
        View source=ui.activity.findViewById(android.R.id.content);
        if(source==null || source==this) return;
        int gutter=ui.dp(18);
        // Half resolution preserves app icon/color detail with a small reusable strip.
        int w=(getWidth()+gutter*2+1)/2, h=(getHeight()+gutter*2+1)/2;
        try {
            // The software navigation capture must see the same prepared page backdrop.
            if(ui.appearance.glassScene!=null) ui.appearance.glassScene.bitmap();
            if(bitmap==null || bitmap.getWidth()!=w || bitmap.getHeight()!=h) {
                bitmap=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888); bitmapCanvas=new Canvas(bitmap);
                pixels=new int[w*h]; scratch=new int[w*h];
                texture=new BitmapShader(bitmap,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP);
                textureMatrix.setScale(2,2); textureMatrix.postTranslate(-gutter,-gutter); texture.setLocalMatrix(textureMatrix);
            }
            // Dialog glass and the sampled Activity occupy different windows.
            getLocationOnScreen(ownLocation); source.getLocationOnScreen(sourceLocation);
            bitmap.eraseColor(ui.background);
            bitmapCanvas.save(); bitmapCanvas.scale(.5f,.5f);
            bitmapCanvas.translate(sourceLocation[0]-ownLocation[0]+gutter,sourceLocation[1]-ownLocation[1]+gutter);
            capturing=true;
            try { source.draw(bitmapCanvas); } finally { capturing=false; bitmapCanvas.restore(); }
            signature=1469598103934665603L;
            for(int y=2;y<h;y+=7) for(int x=2;x<w;x+=7) signature=(signature ^ bitmap.getPixel(x,y))*1099511628211L;
            bitmap.getPixels(pixels,0,w,0,0,w,h);
            GlassBackdropBlur.blur(pixels,scratch,w,h,Math.max(1,Math.round(2.5f*density)));
            bitmap.setPixels(pixels,0,w,0,0,w,h);
            generation++; dirty=false;
        } catch (RuntimeException | OutOfMemoryError failure) {
            captureDisabled=true; bitmap=null; bitmapCanvas=null; texture=null; pixels=null; scratch=null;
            dirty=false; optics=null;
            android.util.Log.w("LS_AugmentGlass","Backdrop unavailable; using a readable tinted surface",failure);
        }
        prepareOptics();
    }

    private void updateSharedBackdrop() {
        GlassScene scene=ui.appearance.glassScene;
        if(scene==null) return;
        Bitmap shared=scene.bitmap();
        if(shared==null) return;
        if(bitmap!=shared) { bitmap=shared; texture=new BitmapShader(shared,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP); }
        getLocationInWindow(ownLocation); scene.source.getLocationInWindow(sourceLocation);
        textureMatrix.setScale(GlassScene.SCALE,GlassScene.SCALE);
        textureMatrix.postTranslate(sourceLocation[0]-ownLocation[0],sourceLocation[1]-ownLocation[1]);
        texture.setLocalMatrix(textureMatrix);
        generation++; signature=((long)ownLocation[0]<<32)^ownLocation[1]; dirty=false;
    }

    private void prepareOptics() {
        if(Build.VERSION.SDK_INT>=33 && !failed && !captureDisabled && texture!=null && optics==null) try {
            optics=new Optics();
        } catch (RuntimeException failure) {
            failed=true; optics=null; dirty=false;
            android.util.Log.w("LS_AugmentGlass","Optical surface unavailable; using sampled translucency",failure);
        }
    }

    @Override protected void onDraw(Canvas canvas) {
        prepareRims();
        bounds.set(.6f*density,.6f*density,getWidth()-.6f*density,getHeight()-.6f*density);
        paint.setStyle(Paint.Style.FILL); paint.setColor(Color.WHITE);
        boolean optical=Build.VERSION.SDK_INT>=33 && optics!=null && canvas.isHardwareAccelerated();
        if(texture!=null) {
            if(optical) {
                optics.configure(texture,getWidth(),getHeight(),radius,density,ui.dark,lightX,contentSurface,
                        contentSurface?ui.appearance.backdropEmphasis():1f,ui.backgroundEnd);
                paint.setShader(optics.shader);
            } else {
                if(contentSurface) {
                    paint.setShader(null); paint.setColor(ui.backgroundEnd);
                    canvas.drawRoundRect(bounds,radius,radius,paint);
                    paint.setColor(Color.WHITE); paint.setAlpha(Math.round(255*ui.appearance.backdropEmphasis()));
                }
                paint.setShader(texture);
            }
        } else { paint.setShader(null); paint.setColor(ui.dark?0xe626405a:0xcce6f3ff); }
        canvas.drawRoundRect(bounds,radius,radius,paint); paint.setShader(null); paint.setAlpha(255);
        if(!optical) { paint.setColor(ui.dark?0x9030455c:contentSurface?0x68f8fcff:0x60e9f6ff); canvas.drawRoundRect(bounds,radius,radius,paint); }
        rim.setStyle(Paint.Style.STROKE); rim.setStrokeWidth(density);
        rim.setShader(outerRim);
        canvas.drawRoundRect(bounds,radius,radius,rim); rim.setShader(null);
        // A narrow inner rim and a softer lower caustic convey the thickness of the lens.
        RectF inner=selection; inner.set(bounds); inner.inset(1.7f*density,1.7f*density);
        rim.setStrokeWidth(.65f*density);
        rim.setShader(innerRim);
        canvas.drawRoundRect(inner,Math.max(0,radius-1.7f*density),Math.max(0,radius-1.7f*density),rim);rim.setShader(null);
        if(selectionPosition>=0 && getChildCount()>0) {
            float slot=(getWidth()-getPaddingLeft()-getPaddingRight())/(float)getChildCount();
            float cx=getPaddingLeft()+slot*(selectionPosition+.5f), half=slot*(.5f+stretch)-density*3;
            selection.set(cx-half,getPaddingTop(),cx+half,getHeight()-getPaddingBottom());
            if(selectedFill==null || fillTop!=getPaddingTop() || fillBottom!=getHeight()-getPaddingBottom()) {
                fillTop=getPaddingTop(); fillBottom=getHeight()-getPaddingBottom();
                selectedFill=new LinearGradient(0,fillTop,0,fillBottom,
                        ui.dark?new int[]{0x4078b8f0,0x3029598b}:new int[]{0x5090c9fa,0x2875b5eb},null,Shader.TileMode.CLAMP);
            }
            paint.setShader(selectedFill);
            canvas.drawRoundRect(selection,selection.height()/2,selection.height()/2,paint); paint.setShader(null);
            rim.setColor(ui.dark?0x6593cfff:0x98ffffff); rim.setStrokeWidth(density*.8f);
            canvas.drawRoundRect(selection,selection.height()/2,selection.height()/2,rim);
        }
    }

    private void prepareRims() {
        boolean resized=rimWidth!=getWidth() || rimHeight!=getHeight();
        if(resized || rimLight!=lightX || outerRim==null) {
            outerRim=new LinearGradient(0,0,getWidth()*(.5f+lightX),getHeight(),
                    ui.dark?new int[]{0xb9d4efff,0x184e88b3,0x827da9cf}:new int[]{0xfaffffff,0x28ffffff,0xa985bada},null,Shader.TileMode.CLAMP);
            rimLight=lightX;
        }
        if(resized || innerRim==null) innerRim=new LinearGradient(0,0,0,getHeight(),
                ui.dark?new int[]{0x807ec3eb,0x10487090,0x589ac5eb}:new int[]{0xccffffff,0x06ffffff,0x8095c7ea},
                new float[]{0,.5f,1},Shader.TileMode.CLAMP);
        rimWidth=getWidth(); rimHeight=getHeight();
    }

    /** Kept behind an API guard so Android 9–12 can still load the layout. */
    private static final class Optics {
        private static final String SOURCE =
                "uniform shader backdrop; uniform float2 size; uniform float radius; uniform float dp; uniform float dark; uniform float lightX; uniform float surface; uniform float backdropAlpha; uniform float3 baseColor;\n"+
                "half4 main(float2 p) {\n"+
                " float2 v=p-size*.5; float2 q=abs(v)-(size*.5-float2(radius));\n"+
                " float2 z=max(q,0.0); float sd=length(z)+min(max(q.x,q.y),0.0)-radius;\n"+
                " float2 n=length(z)>.001 ? normalize(z)*sign(v) : (q.x>q.y ? float2(sign(v.x),0) : float2(0,sign(v.y)));\n"+
                " float edge=1.0-smoothstep(0.0,mix(13.0,10.0,surface)*dp,-sd);\n"+
                " float2 uv=size*.5+v*.99-n*(edge*edge*mix(10.0,14.0,surface)*dp);\n"+
                " half4 c=backdrop.eval(uv);\n"+
                " c.rgb=mix(half3(baseColor),c.rgb,half(backdropAlpha));\n"+
                " half3 tint=mix(half3(.97,.99,1),half3(.055,.12,.22),half(dark));\n"+
                " c.rgb=mix(c.rgb,tint,half(mix(mix(.25,.40,surface),.56,dark)));\n"+
                " float2 light=normalize(float2(lightX*1.4-1.0,-.8));\n"+
                " float shine=pow(max(dot(n,light),0.0),5.0)*edge*.28;\n"+
                " float sheen=pow(max(0.0,1.0-abs(p.x/size.x-(.15+lightX*.4)-p.y/size.y*.22)*2.2),8.0)*.045;\n"+
                " c.rgb+=half3(shine+sheen); c.rgb-=half3(edge*.070,edge*.025,0); return half4(clamp(c.rgb,0.0,1.0),1); }";
        final RuntimeShader shader = new RuntimeShader(SOURCE);
        void configure(Shader backdrop,int w,int h,float radius,float density,boolean dark,float lightX,boolean surface,float backdropAlpha,int baseColor) {
            shader.setInputShader("backdrop",backdrop); shader.setFloatUniform("size",w,h);
            shader.setFloatUniform("radius",radius); shader.setFloatUniform("dp",density);
            shader.setFloatUniform("dark",dark?1:0); shader.setFloatUniform("lightX",lightX);
            shader.setFloatUniform("surface",surface?1:0);
            shader.setFloatUniform("backdropAlpha",backdropAlpha);
            shader.setFloatUniform("baseColor",Color.red(baseColor)/255f,Color.green(baseColor)/255f,Color.blue(baseColor)/255f);
        }
    }
}
