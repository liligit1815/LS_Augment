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

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class LiquidGlassLayout extends LinearLayout {
    private static boolean capturing;
    private int surfaceTint;
    void setSurfaceTint(int color) { surfaceTint=color; invalidate(); }
    private final UiKit ui;
    private final GlassWindowBackdrop windowBackdrop;
    private final boolean contentSurface;
    private final boolean navigationLens;
    private final float density, radius;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF bounds = new RectF(), selection = new RectF();
    private final RectF lensShadow = new RectF(), lensInner = new RectF();
    private final int touchSlop;
    private final Rect visibleBounds = new Rect();
    private final int[] ownLocation = new int[2], sourceLocation = new int[2];
    private final Matrix textureMatrix = new Matrix();
    private final ViewTreeObserver.OnPreDrawListener beforeDraw = () -> { captureIfNeeded(); return true; };
    private final ViewTreeObserver.OnScrollChangedListener scrolled = this::onBackdropScroll;
    private final ViewTreeObserver.OnGlobalLayoutListener laidOut = this::onBackdropLayout;
    private Bitmap bitmap;
    private Canvas bitmapCanvas;
    private BitmapShader texture;
    private Optics optics, lensOptics;
    private boolean dirty = true, failed, captureDisabled;
    private int[] pixels, scratch;
    private int generation, selected = -1;
    private int capturedWidth, capturedHeight;
    private int captureRequest, capturedConfiguration;
    private long signature;
    private float selectionPosition = -1, stretch, lightX = .22f, pressure;
    private float downX, downY, lastX;
    private boolean dragging;
    private int pointerId = -1;
    private java.util.function.IntConsumer navigationListener;
    private java.util.function.IntConsumer focusListener;
    private int focused = -1;
    private ValueAnimator selectionAnimator, lightAnimator;
    private ViewTreeObserver observer;
    private Shader outerRim, innerRim, selectedFill;
    private int rimWidth = -1, rimHeight = -1, fillTop = -1, fillBottom = -1;
    private float rimLight = -1;

    LiquidGlassLayout(UiKit ui, int radiusDp) {
        this(ui,radiusDp,false);
    }
    LiquidGlassLayout(UiKit ui, int radiusDp, boolean contentSurface) {
        this(ui,radiusDp,contentSurface,false);
    }
    LiquidGlassLayout(UiKit ui, int radiusDp, boolean contentSurface, boolean navigationLens) {
        super(ui.activity); this.ui=ui; this.contentSurface=contentSurface; this.navigationLens=navigationLens;
        windowBackdrop = new GlassWindowBackdrop(ui.activity, this);
        density=getResources().getDisplayMetrics().density;
        touchSlop=ViewConfiguration.get(getContext()).getScaledTouchSlop();
        // Navigation is a continuous control; the card-corner setting still governs every content card.
        radius=(navigationLens?radiusDp:ui.surfaceRadiusDp(radiusDp))*density;
        setWillNotDraw(false); setBackground(null); setClickable(!contentSurface);
        setElevation(ui.dp(contentSurface?3:9));
        setOutlineProvider(new ViewOutlineProvider() {
            @Override public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0,0,getWidth(),getHeight(),radius); outline.setAlpha(.22f);
            }
        });
        setOutlineAmbientShadowColor(0x503679a8); setOutlineSpotShadowColor(0x503679a8);
        setClipToOutline(!navigationLens);
    }

    int captureGeneration() { return generation; }
    static boolean capturingBackdrop() { return capturing; }
    long backdropSignature() { return signature; }
    boolean opticalEffectActive() { return optics != null && !failed && generation > 0 && isHardwareAccelerated(); }
    void refreshBackdrop() {
        ++captureRequest;
        if(windowBackdrop!=null)windowBackdrop.cancel();
        dirty=true; invalidate();
    }
    private boolean inActivityWindow() { return getRootView()==ui.activity.getWindow().getDecorView(); }
    private void onBackdropScroll() {
        // A dialog's document scrolls in a different window from its backdrop.
        // Recapturing that unchanged Activity mutates a texture already in use by
        // the render thread and can flash during every document scroll frame.
        if(contentSurface || inActivityWindow())refreshBackdrop();
    }
    private void onBackdropLayout() {
        if(contentSurface || inActivityWindow()) { refreshBackdrop(); return; }
        int[] location=new int[2];getLocationOnScreen(location);
        if((bitmap==null && !windowBackdrop.pending() && !captureDisabled) || capturedWidth!=getWidth() || capturedHeight!=getHeight()
                || location[0]!=ownLocation[0] || location[1]!=ownLocation[1])refreshBackdrop();
    }
    void setNavigationListener(java.util.function.IntConsumer listener) { navigationListener=listener; }
    void setFocusListener(java.util.function.IntConsumer listener) { focusListener=listener; }
    private void updateFocus() {
        if(navigationLens)for(int i=0;i<getChildCount();i++){
            float influence=Math.max(0,1-Math.abs(selectionPosition-i));
            float zoom=1+(.08f+pressure*.04f)*influence;
            View child=getChildAt(i);child.setScaleX(zoom);child.setScaleY(zoom);
        }
        int next=Math.max(0,Math.min(getChildCount()-1,Math.round(selectionPosition)));
        if(next!=focused && focusListener!=null){focused=next;focusListener.accept(next);}
    }

    void select(int index, boolean animate) {
        if (index == selected && !dragging && pressure==0 && Math.abs(selectionPosition-index)<.001f) return;
        selected=index;
        if (selectionAnimator != null) selectionAnimator.cancel();
        if (!animate || selectionPosition < 0 || !ValueAnimator.areAnimatorsEnabled()) {
            selectionPosition=index; stretch=0; pressure=0;updateFocus(); invalidate(); return;
        }
        float from=selectionPosition, fromPressure=pressure, fromStretch=stretch;
        selectionAnimator=ValueAnimator.ofFloat(0,1);
        selectionAnimator.setDuration(460);
        selectionAnimator.setInterpolator(new PathInterpolator(.18f,.9f,.24f,1.08f));
        selectionAnimator.addUpdateListener(animation -> {
            float f=(float)animation.getAnimatedValue(); selectionPosition=from+(index-from)*f;
            stretch=fromStretch*(1-f)+(float)Math.sin(Math.PI*Math.min(1,f))*.12f;
            pressure=fromPressure*Math.max(0,1-f);updateFocus(); invalidate();
        });
        selectionAnimator.start();
    }

    @Override public boolean onInterceptTouchEvent(MotionEvent event) {
        if(!navigationLens || getChildCount()==0) return super.onInterceptTouchEvent(event);
        switch(event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX=lastX=event.getX();downY=event.getY();pointerId=event.getPointerId(0);dragging=false;break;
            case MotionEvent.ACTION_MOVE:
                if(pointerId>=0 && event.findPointerIndex(pointerId)>=0 &&
                        Math.abs(event.getX()-downX)>touchSlop &&
                        Math.abs(event.getX()-downX)>Math.abs(event.getY()-downY)) {
                    dragging=true;if(selectionAnimator!=null)selectionAnimator.cancel();
                    getParent().requestDisallowInterceptTouchEvent(true);return true;
                }break;
            case MotionEvent.ACTION_UP: case MotionEvent.ACTION_CANCEL: pointerId=-1;break;
        }
        return super.onInterceptTouchEvent(event);
    }

    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    @Override public boolean onTouchEvent(MotionEvent event) {
        if(!navigationLens || !dragging) return super.onTouchEvent(event);
        if(event.getActionMasked()==MotionEvent.ACTION_MOVE) {
            int pointer=event.findPointerIndex(pointerId);
            if(pointer<0){finishDrag(false);return true;}
            float x=event.getX(pointer),slot=(getWidth()-getPaddingLeft()-getPaddingRight())/(float)getChildCount();
            selectionPosition=Math.max(0,Math.min(getChildCount()-1,(x-getPaddingLeft())/slot-.5f));
            stretch=Math.min(.18f,Math.abs(x-lastX)/slot*.35f);pressure=1;lastX=x;updateFocus();invalidate();
        } else if(event.getActionMasked()==MotionEvent.ACTION_UP) {
            finishDrag(event.getY()>-getHeight()*.5f && event.getY()<getHeight()*1.5f);
        } else if(event.getActionMasked()==MotionEvent.ACTION_CANCEL || event.getActionMasked()==MotionEvent.ACTION_POINTER_DOWN) {
            finishDrag(false);
        }
        return true;
    }
    private void finishDrag(boolean commit) {
        int target=commit?Math.round(selectionPosition):selected;
        dragging=false;pointerId=-1;getParent().requestDisallowInterceptTouchEvent(false);
        select(target,true);
        if(commit && navigationListener!=null)navigationListener.accept(target);
    }

    @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
        if (event.getActionMasked()==MotionEvent.ACTION_DOWN || event.getActionMasked()==MotionEvent.ACTION_MOVE) {
            if (lightAnimator!=null) lightAnimator.cancel();
            lightX=Math.max(0,Math.min(1,event.getX()/Math.max(1,getWidth()))); invalidate();
            if(navigationLens && event.getActionMasked()==MotionEvent.ACTION_DOWN)pressure=.55f;
        } else if (event.getActionMasked()==MotionEvent.ACTION_UP || event.getActionMasked()==MotionEvent.ACTION_CANCEL) {
            if(navigationLens && !dragging)select(selected,true);
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
        ++captureRequest; windowBackdrop.cancel();
        if(selectionAnimator!=null) selectionAnimator.cancel();
        if(lightAnimator!=null) lightAnimator.cancel();
        // Let the render thread release a submitted bitmap before GC reclaims it.
        bitmap=null; bitmapCanvas=null; texture=null; optics=null; lensOptics=null; pixels=null; scratch=null; dirty=true; captureDisabled=false;
        super.onDetachedFromWindow();
    }
    @Override protected void onSizeChanged(int w,int h,int oldW,int oldH) {
        super.onSizeChanged(w,h,oldW,oldH); refreshBackdrop();
    }
    @Override public void draw(Canvas canvas) {
        // Navigation's pre-draw can run before a newly attached card's listener.
        // Sample its current position before drawing it into the navigation lens.
        if(capturing && contentSurface && dirty) { updateSharedBackdrop(); prepareOptics(); }
        if (!capturing || contentSurface) super.draw(canvas);
    }

    private void captureIfNeeded() {
        if(!contentSurface && GlassWindowBackdrop.secure(ui.activity)) {
            if(!captureDisabled || texture!=null)captureFallback("blocked","secure_window");
            return;
        }
        int configuration=getResources().getConfiguration().hashCode();
        if(capturedConfiguration!=0 && capturedConfiguration!=configuration) {
            refreshBackdrop(); bitmap=null; bitmapCanvas=null; texture=null; optics=null; captureDisabled=false;
        }
        capturedConfiguration=configuration;
        if(!dirty || captureDisabled || capturing || getWidth()==0 || getHeight()==0 || !getGlobalVisibleRect(visibleBounds)) return;
        if(contentSurface) { updateSharedBackdrop(); prepareOptics(); return; }
        View source=ui.activity.findViewById(android.R.id.content);
        if(source==null || source==this) return;
        int gutter=ui.dp(18);
        getLocationOnScreen(ownLocation);
        Rect sample=new Rect(ownLocation[0]-gutter,ownLocation[1]-gutter,
                ownLocation[0]+getWidth()+gutter,ownLocation[1]+getHeight()+gutter);
        if(GlassWindowBackdrop.needsWindow(source,sample)) {
            if(windowBackdrop.pending())return;
            int request=++captureRequest;
            capturedWidth=getWidth();capturedHeight=getHeight();dirty=false;
            windowBackdrop.diagnostic("activity_window_pixel_copy","requested","visible_surface");
            windowBackdrop.capture(gutter,ui.background,(captured,reason)->{
                if(request!=captureRequest || !isAttachedToWindow()) {
                    if(captured!=null)captured.recycle();return;
                }
                if(captured==null) { captureFallback("activity_window_pixel_copy",reason);return; }
                try {
                    bitmap=captured;bitmapCanvas=null;
                    finishCapture(gutter);
                    windowBackdrop.diagnostic("activity_window_pixel_copy","ready","none");
                    invalidate();
                } catch(RuntimeException | OutOfMemoryError failure) {
                    captureFallback("activity_window_pixel_copy","processing_failed");
                }
            });
            return;
        }
        // Half resolution preserves app icon/color detail with a small reusable strip.
        int w=(getWidth()+gutter*2+1)/2, h=(getHeight()+gutter*2+1)/2;
        if((long)w*h>GlassWindowBackdrop.MAX_PIXELS) { captureFallback("view_tree_software","size_limit");return; }
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
            finishCapture(gutter);
            windowBackdrop.diagnostic("view_tree_software","ready","none");
        } catch (RuntimeException | OutOfMemoryError failure) {
            captureFallback("view_tree_software","processing_failed");
        }
        prepareOptics();
    }

    private void finishCapture(int gutter) {
        int w=bitmap.getWidth(),h=bitmap.getHeight();
        if(pixels==null || pixels.length!=w*h) { pixels=new int[w*h];scratch=new int[w*h]; }
        signature=1469598103934665603L;
        for(int y=2;y<h;y+=7)for(int x=2;x<w;x+=7)signature=(signature^bitmap.getPixel(x,y))*1099511628211L;
        bitmap.getPixels(pixels,0,w,0,0,w,h);
        GlassBackdropBlur.blur(pixels,scratch,w,h,Math.max(1,Math.round((navigationLens?1.1f:2f)*density)));
        bitmap.setPixels(pixels,0,w,0,0,w,h);
        texture=new BitmapShader(bitmap,Shader.TileMode.CLAMP,Shader.TileMode.CLAMP);
        textureMatrix.setScale(2,2);textureMatrix.postTranslate(-gutter,-gutter);texture.setLocalMatrix(textureMatrix);
        // Optics retain the previous shader input; configure the new one on the next draw.
        capturedWidth=getWidth();capturedHeight=getHeight();generation++;dirty=false;
        prepareOptics();
    }

    private void captureFallback(String source,String reason) {
        captureDisabled=true;bitmap=null;bitmapCanvas=null;texture=null;pixels=null;scratch=null;
        dirty=false;optics=null;lensOptics=null;
        windowBackdrop.diagnostic(source,"theme_fallback",reason);invalidate();
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
        if(!failed && !captureDisabled && texture!=null && optics==null) try {
            optics=new Optics();
        } catch (RuntimeException failure) {
            failed=true; optics=null; dirty=false;
            android.util.Log.w("LS_AugmentGlass","Optical surface unavailable; using sampled translucency",failure);
        }
    }

    @Override protected void onDraw(Canvas canvas) {
        prepareRims();
        bounds.set(.6f*density,(navigationLens?6f:.6f)*density,getWidth()-.6f*density,getHeight()-(navigationLens?6f:.6f)*density);
        paint.setStyle(Paint.Style.FILL); paint.setColor(Color.WHITE);
        boolean optical=optics!=null && canvas.isHardwareAccelerated();
        if(texture!=null) {
            if(optical) {
                optics.configure(texture,getWidth(),getHeight(),radius,density,ui.dark,lightX,contentSurface,
                        contentSurface?ui.appearance.backdropEmphasis():1f,ui.backgroundEnd);
                if(navigationLens)optics.configureArea(bounds,radius,false);
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
        if(surfaceTint!=0) { paint.setShader(null);paint.setColor(surfaceTint);canvas.drawRoundRect(bounds,radius,radius,paint); }
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
            if(navigationLens) {
                selection.inset(-density*pressure*2,-density*(pressure*5+1));
                drawNavigationLens(canvas,optical);return;
            }
            if(selectedFill==null || fillTop!=getPaddingTop() || fillBottom!=getHeight()-getPaddingBottom()) {
                fillTop=getPaddingTop(); fillBottom=getHeight()-getPaddingBottom();
                selectedFill=new LinearGradient(0,fillTop,0,fillBottom,
                        ui.dark?0x4078b8f0:0x5090c9fa,ui.dark?0x3029598b:0x2875b5eb,Shader.TileMode.CLAMP);
            }
            paint.setShader(selectedFill);
            canvas.drawRoundRect(selection,Math.min(radius,selection.height()/2),Math.min(radius,selection.height()/2),paint); paint.setShader(null);
            rim.setColor(ui.dark?0x6593cfff:0x98ffffff); rim.setStrokeWidth(density*.8f);
            canvas.drawRoundRect(selection,Math.min(radius,selection.height()/2),Math.min(radius,selection.height()/2),rim);
        }
    }

    private void drawNavigationLens(Canvas canvas,boolean optical) {
        float r=selection.height()*.5f;
        paint.setShader(null);paint.setColor(ui.dark?0x30234864:0x243f6b8c);
        lensShadow.set(selection);lensShadow.offset(0,2*density);
        canvas.drawRoundRect(lensShadow,r,r,paint);
        if(optical) {
            if(lensOptics==null)lensOptics=new Optics();
            lensOptics.configure(texture,getWidth(),getHeight(),r,density,ui.dark,lightX,false,1,ui.backgroundEnd);
            lensOptics.configureArea(selection,r,true);paint.setColor(Color.WHITE);paint.setShader(lensOptics.shader);
        } else {paint.setShader(texture);paint.setColor(Color.WHITE);}
        canvas.drawRoundRect(selection,r,r,paint);paint.setShader(null);
        paint.setColor(ui.dark?0x226ab6f6:0x1238a5ff);canvas.drawRoundRect(selection,r,r,paint);
        rim.setStrokeWidth(1.1f*density);rim.setShader(outerRim);canvas.drawRoundRect(selection,r,r,rim);rim.setShader(null);
        lensInner.set(selection);lensInner.inset(1.5f*density,1.5f*density);
        rim.setStrokeWidth(.6f*density);rim.setShader(innerRim);canvas.drawRoundRect(lensInner,r-1.5f*density,r-1.5f*density,rim);rim.setShader(null);
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
    static final class Optics {
        private static final String SOURCE =
                "uniform shader backdrop; uniform float2 size; uniform float2 origin; uniform float radius; uniform float dp; uniform float dark; uniform float lightX; uniform float surface; uniform float lens; uniform float backdropAlpha; uniform float3 baseColor;\n"+
                "half4 main(float2 p) {\n"+
                " p-=origin;\n"+
                " float2 v=p-size*.5; float2 q=abs(v)-(size*.5-float2(radius));\n"+
                " float2 z=max(q,0.0); float sd=length(z)+min(max(q.x,q.y),0.0)-radius;\n"+
                " float2 n=length(z)>.001 ? normalize(z)*sign(v) : (q.x>q.y ? float2(sign(v.x),0) : float2(0,sign(v.y)));\n"+
                " float thickness=min(min(size.x,size.y)*.42,mix(12.0,9.0,surface)*dp);\n"+
                " float edge=1.0-smoothstep(0.0,thickness,-sd);\n"+
                " float bend=sin(edge*1.570796)*sin(edge*1.570796);\n"+
                " float2 uv=origin+size*.5+v*mix(.997,.92,lens)-n*(bend*mix(mix(8.0,11.0,surface),16.0,lens)*dp);\n"+
                " half4 c=backdrop.eval(uv);\n"+
                " float fringe=pow(edge,3.0)*dp*mix(.4,1.15,lens);\n"+
                " c.r=backdrop.eval(uv+n*fringe).r;c.b=backdrop.eval(uv-n*fringe).b;\n"+
                " c.rgb=mix(half3(baseColor),c.rgb,half(backdropAlpha));\n"+
                " half3 tint=mix(half3(.97,.99,1),half3(.055,.12,.22),half(dark));\n"+
                " c.rgb=mix(c.rgb,tint,half(mix(mix(.13,.20,surface),.32,dark)));\n"+
                " float2 light=normalize(float2(lightX*1.4-1.0,-.8));\n"+
                " float rim=exp(-max(0.0,-sd)/(1.2*dp));\n"+
                " float shine=pow(max(dot(n,light),0.0),3.0)*(edge*.15+rim*.24);\n"+
                " float caustic=pow(max(dot(n,-light),0.0),3.0)*exp(-pow((-sd-2.8*dp)/(1.6*dp),2.0))*.12;\n"+
                " float sheen=pow(max(0.0,1.0-abs(p.x/size.x-(.15+lightX*.4)-p.y/size.y*.22)*2.2),8.0)*.025;\n"+
                " c.rgb+=half3(shine+sheen+caustic);c.rgb-=half3(edge*.065,edge*.030,edge*.008);return half4(clamp(c.rgb,0.0,1.0),1); }";
        final RuntimeShader shader = new RuntimeShader(SOURCE);
        void configure(Shader backdrop,int w,int h,float radius,float density,boolean dark,float lightX,boolean surface,float backdropAlpha,int baseColor) {
            shader.setInputShader("backdrop",backdrop); shader.setFloatUniform("size",w,h);
            shader.setFloatUniform("radius",radius); shader.setFloatUniform("dp",density);
            shader.setFloatUniform("dark",dark?1:0); shader.setFloatUniform("lightX",lightX);
            shader.setFloatUniform("surface",surface?1:0);
            shader.setFloatUniform("origin",0,0);shader.setFloatUniform("lens",0);
            shader.setFloatUniform("backdropAlpha",backdropAlpha);
            shader.setFloatUniform("baseColor",Color.red(baseColor)/255f,Color.green(baseColor)/255f,Color.blue(baseColor)/255f);
        }
        void configureArea(RectF area,float radius,boolean lens) {
            shader.setFloatUniform("origin",area.left,area.top);shader.setFloatUniform("size",area.width(),area.height());
            shader.setFloatUniform("radius",Math.min(radius,Math.min(area.width(),area.height())*.5f));shader.setFloatUniform("lens",lens?1:0);
        }
    }
}
