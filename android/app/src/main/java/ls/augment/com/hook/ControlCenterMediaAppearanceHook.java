package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.*;
import ls.augment.com.ControlCenterAppearancePolicy;
import static ls.augment.com.ControlCenterAppearanceOptions.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Artwork is taken from the OEM-selected session; no extra sessions, network, URIs or permissions. */
final class ControlCenterMediaAppearanceHook {
    private static final String TYPE=ControlCenterAppearanceHook.MEDIA_VIEW;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private static final ThreadPoolExecutor WORKER=new ThreadPoolExecutor(1,1,20,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(4),r->{Thread t=new Thread(r,"Duo-CC-Artwork");t.setDaemon(true);return t;},new ThreadPoolExecutor.AbortPolicy());
    // Cached bitmaps are already bounded to 256px. Never recycle OEM-owned bitmaps or images still displayed.
    private static final LinkedHashMap<Key,Artwork> CACHE=new LinkedHashMap<Key,Artwork>(8,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<Key,Artwork> e){return size()>4;}
    };
    private ControlCenterMediaAppearanceHook(){ }
    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        for(String method:new String[]{"onFinishInflate","onAttachedToWindow","updateMediaResources","refreshAfterRegisterCallback","onConfigurationChanged"})
            count+=hookNamed(module,loader,"cc_media",TYPE,method,-1,null,(owner,args,result)->{if(owner instanceof View)watch((View)owner).refresh();return PASS;});
        count+=hookNamed(module,loader,"cc_media",TYPE,"setDefault",0,null,(owner,args,result)->{State state=STATES.get(owner);if(state!=null)state.clearArtwork("native_default");return PASS;});
        return count;
    }
    private static State watch(View view){State state=STATES.get(view);if(state==null){state=new State(view);STATES.put(view,state);view.addOnAttachStateChangeListener(state);}if(view.isAttachedToWindow())state.attach();return state;}
    private static final class State implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<View> ref;final Runnable changed=this::refresh;
        boolean attached,busy,refreshing;int lastWidth=-1,lastHeight=-1;long generation;Key requested,published;WeakReference<Bitmap> source=new WeakReference<>(null);
        WeakReference<Material> materialRef=new WeakReference<>(null);Artwork artwork;String lastDiagnostic="";
        Material material(){return materialRef.get();}
        State(View view){ref=new WeakReference<>(view);}
        void attach(){if(attached)return;View view=ref.get();if(view==null)return;attached=true;FeatureSettings.addSnapshotListener(view.getContext(),changed);view.getViewTreeObserver().addOnPreDrawListener(this);refresh();}
        void refresh(){
            View view=ref.get();if(refreshing||!attached||view==null)return;refreshing=true;
            try{
                boolean enabled=FeatureSettings.enabled(view.getContext(),MEDIA),rounded=FeatureSettings.enabled(view.getContext(),CORNERS);
                if(!enabled&&!rounded){clearArtwork("disabled");restore();return;}
                ensureMaterial(view);
                if(!enabled){clearArtwork("cover_disabled");updateMaterial();return;}
                Object value=field(view,"mMediaMetadata"),controller=field(view,"mMediaController");
                if(!(value instanceof MediaMetadata)||!(controller instanceof MediaController)||Boolean.TRUE.equals(field(view,"mIsMediaSessionDestroyed"))){clearArtwork("no_session");updateMaterial();return;}
                Object pkg=field(view,"mCurrentPlayPkg");
                if(!(pkg instanceof String)||!Boolean.TRUE.equals(call(view,"isSupportMediaControl",pkg))){clearArtwork("native_unsupported_session");updateMaterial();return;}
                MediaMetadata metadata=(MediaMetadata)value;
                Bitmap bitmap=metadata.getDescription().getIconBitmap();
                if(bitmap==null)bitmap=metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
                if(bitmap==null)bitmap=metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
                if(bitmap==null||bitmap.isRecycled()||bitmap.getWidth()<=0||bitmap.getHeight()<=0){clearArtwork("no_artwork");updateMaterial();return;}
                int blur=FeatureSettings.integer(view.getContext(),MEDIA_BLUR,12,0,24);
                Key next=new Key(bitmap,blur,((MediaController)controller).getSessionToken());
                if(!next.equals(requested)){generation++;requested=next;source=new WeakReference<>(bitmap);artwork=null;published=null;}
                if(!next.equals(published)&&!busy)request();
                updateMaterial();
            }catch(ReflectiveOperationException|RuntimeException|LinkageError error){clearArtwork("native_fallback:"+error.getClass().getSimpleName());updateMaterial();}
            finally{refreshing=false;}
        }
        void ensureMaterial(View view){
            Material material=material();
            if(material!=null&&view.getBackground()!=material)restore();
            if(material()!=null)return;Drawable nativeBg=view.getBackground();
            if(nativeBg!=null&&nativeBg.getClass().getName().contains("LiquidGlassControlCenterHook$"))return;
            material=new Material(nativeBg);materialRef=new WeakReference<>(material);ControlCenterAppearanceHook.collectCorners(nativeBg,material.corners,0);
            ControlCenterAppearanceHook.setBackground(view,material);material.bind();
        }
        void request(){
            Bitmap bitmap=source.get();Key key=requested;if(bitmap==null||key==null)return;
            Artwork cached; synchronized(CACHE){cached=CACHE.get(key);}
            if(cached!=null){artwork=cached;published=key;report("active_cached");return;}
            long token=generation;busy=true;WeakReference<State> weak=new WeakReference<>(this);
            try{WORKER.execute(()->{
                Artwork result=null;String failure=null;
                try{result=prepare(bitmap,key.blur);synchronized(CACHE){CACHE.put(key,result);}}
                catch(RuntimeException|OutOfMemoryError error){failure=error.getClass().getSimpleName();}
                Artwork ready=result;String error=failure;
                MAIN.post(()->{
                    State state=weak.get();if(state==null)return;state.busy=false;
                    if(!state.attached||state.generation!=token||!key.equals(state.requested)){if(state.attached)state.refresh();return;}
                    state.published=key;state.artwork=ready;state.report(ready==null?"native_fallback:"+error:"active");state.updateMaterial();
                });
            });}catch(RejectedExecutionException unavailable){busy=false;published=key;report("native_fallback:worker_busy");}
        }
        void updateMaterial(){
            View view=ref.get();Material material=material();if(view==null||material==null)return;
            lastWidth=view.getWidth();lastHeight=view.getHeight();
            boolean rounded=attached&&FeatureSettings.enabled(view.getContext(),CORNERS);
            float radius=rounded?ControlCenterAppearancePolicy.radius(FeatureSettings.integer(view.getContext(),RADIUS,24,0,48),view.getResources().getDisplayMetrics().density,view.getWidth(),view.getHeight()):-1;
            for(ControlCenterAppearanceHook.Corner corner:material.corners)if(rounded)corner.apply(radius);else corner.restore();
            if(radius<0)radius=ControlCenterAppearanceHook.nativeRadius(material.original,view.getWidth(),view.getHeight());
            Object text=field(view,"mTitleText");boolean light=text instanceof TextView&&ControlCenterAppearancePolicy.luminance(((TextView)text).getCurrentTextColor())>.5;
            int opacity=FeatureSettings.integer(view.getContext(),MEDIA_OPACITY,70,0,100);
            int glow=FeatureSettings.integer(view.getContext(),MEDIA_GLOW,0,0,1)==1?FeatureSettings.integer(view.getContext(),GLOW_OPACITY,40,0,80):0;
            float glowWidth=FeatureSettings.integer(view.getContext(),GLOW_WIDTH,12,1,32)*view.getResources().getDisplayMetrics().density;
            material.configure(artwork,radius,opacity,glow,glowWidth,light);view.invalidate();
        }
        void clearArtwork(String reason){if(requested!=null||artwork!=null){generation++;requested=null;published=null;source.clear();artwork=null;}Material material=material();if(material!=null)material.clear();report(reason);}
        void restore(){View view=ref.get();Material material=material();if(material!=null){for(ControlCenterAppearanceHook.Corner corner:material.corners)corner.restore();material.corners.clear();if(view!=null&&view.getBackground()==material)ControlCenterAppearanceHook.setBackground(view,material.original);material.release();material.clear();}materialRef.clear();}
        void report(String text){View view=ref.get();if(view!=null&&!text.equals(lastDiagnostic)){lastDiagnostic=text;FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_cc_media_state",text);}}
        @Override public boolean onPreDraw(){View view=ref.get();if(view==null)return true;Material material=material();if(material!=null&&view.getBackground()!=material)refresh();else if(material==null&&(FeatureSettings.enabled(view.getContext(),MEDIA)||FeatureSettings.enabled(view.getContext(),CORNERS)))refresh();else if(material!=null&&(lastWidth!=view.getWidth()||lastHeight!=view.getHeight()))updateMaterial();return true;}
        @Override public void onViewAttachedToWindow(View view){attach();}
        @Override public void onViewDetachedFromWindow(View view){attached=false;FeatureSettings.removeSnapshotListener(changed);view.getViewTreeObserver().removeOnPreDrawListener(this);clearArtwork("detached");restore();lastDiagnostic="";}
    }
    private static final class Key {
        final WeakReference<Bitmap> bitmap;final int identity,generation,width,height,blur;final Object token;
        Key(Bitmap source,int blur,Object token){bitmap=new WeakReference<>(source);identity=System.identityHashCode(source);generation=source.getGenerationId();width=source.getWidth();height=source.getHeight();this.blur=blur;this.token=token;}
        @Override public int hashCode(){return Objects.hash(identity,generation,width,height,blur,token);}
        @Override public boolean equals(Object other){if(this==other)return true;if(!(other instanceof Key))return false;Key k=(Key)other;Bitmap b=bitmap.get();return b!=null&&b==k.bitmap.get()&&generation==k.generation&&width==k.width&&height==k.height&&blur==k.blur&&Objects.equals(token,k.token);}
    }
    private static final class Artwork {final Bitmap bitmap;final int color;Artwork(Bitmap bitmap,int color){this.bitmap=bitmap;this.color=color;}}
    /** Called only by bounded worker. Canvas drawing reads the ready bitmap and never decodes artwork. */
    private static Artwork prepare(Bitmap source,int blur){
        if(source.isRecycled())throw new IllegalArgumentException("recycled_cover");
        int w=ControlCenterAppearancePolicy.dimension(source.getWidth(),source.getHeight(),true),h=ControlCenterAppearancePolicy.dimension(source.getWidth(),source.getHeight(),false);
        Bitmap target=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888),scaled=source,readable=source;
        try{
            // Resize a hardware cover before software readback, avoiding a full-resolution private copy.
            if(source.getConfig()==Bitmap.Config.HARDWARE){scaled=Bitmap.createScaledBitmap(source,w,h,true);readable=scaled.getConfig()==Bitmap.Config.HARDWARE?scaled.copy(Bitmap.Config.ARGB_8888,false):scaled;if(readable==null)throw new IllegalArgumentException("cover_readback");}
            new Canvas(target).drawBitmap(readable,null,new Rect(0,0,w,h),new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG));
        }finally{if(readable!=null&&readable!=source)readable.recycle();if(scaled!=source&&scaled!=readable)scaled.recycle();}
        int[] pixels=new int[w*h];target.getPixels(pixels,0,w,0,0,w,h);
        long r=0,g=0,b=0;for(int pixel:pixels){r+=(pixel>>>16)&255;g+=(pixel>>>8)&255;b+=pixel&255;}
        int color=Color.rgb((int)(r/pixels.length),(int)(g/pixels.length),(int)(b/pixels.length));
        if(blur>0){int[] temp=new int[pixels.length];box(pixels,temp,w,h,blur,true);box(temp,pixels,w,h,blur,false);box(pixels,temp,w,h,blur,true);box(temp,pixels,w,h,blur,false);target.setPixels(pixels,0,w,0,0,w,h);}
        return new Artwork(target,color);
    }
    private static void box(int[] input,int[] output,int width,int height,int radius,boolean horizontal){
        int major=horizontal?height:width,minor=horizontal?width:height,n=2*radius+1;
        for(int line=0;line<major;line++){
            int a=0,r=0,g=0,b=0;
            for(int x=-radius;x<=radius;x++){int p=input[index(line,Math.max(0,Math.min(minor-1,x)),width,horizontal)];a+=p>>>24;r+=(p>>>16)&255;g+=(p>>>8)&255;b+=p&255;}
            for(int x=0;x<minor;x++){
                output[index(line,x,width,horizontal)]=(a/n)<<24|(r/n)<<16|(g/n)<<8|b/n;
                int left=input[index(line,Math.max(0,x-radius),width,horizontal)],right=input[index(line,Math.min(minor-1,x+radius+1),width,horizontal)];
                a+=(right>>>24)-(left>>>24);r+=((right>>>16)&255)-((left>>>16)&255);g+=((right>>>8)&255)-((left>>>8)&255);b+=(right&255)-(left&255);
            }
        }
    }
    private static int index(int line,int offset,int width,boolean horizontal){return horizontal?line*width+offset:offset*width+line;}

    private static final class Material extends ControlCenterNativeDrawable {
        final List<ControlCenterAppearanceHook.Corner> corners=new ArrayList<>();
        final Paint image=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG),wash=new Paint(Paint.ANTI_ALIAS_FLAG),glowPaint=new Paint(Paint.ANTI_ALIAS_FLAG);
        final RectF destination=new RectF(),area=new RectF();final Path clip=new Path();
        Artwork art;float radius,glowWidth;int opacity,glow;boolean light;int geometryWidth=-1,geometryHeight=-1;Bitmap geometryBitmap;
        Material(Drawable original){super(original);}
        void configure(Artwork next,float radius,int opacity,int glow,float glowWidth,boolean light){boolean geometry=art!=next||this.radius!=radius||this.glowWidth!=glowWidth;art=next;this.radius=radius;this.opacity=opacity;this.glow=glow;this.glowWidth=glowWidth;this.light=light;if(geometry)geometryWidth=-1;invalidateSelf();}
        void clear(){art=null;geometryBitmap=null;image.setShader(null);glowPaint.setShader(null);invalidateSelf();}
        @Override protected void onBoundsChange(Rect bounds){super.onBoundsChange(bounds);geometryWidth=-1;}
        @Override public void draw(Canvas canvas){
            drawNative(canvas);Artwork ready=art;if(ready==null||ready.bitmap.isRecycled()||opacity<=0)return;
            Rect bounds=getBounds();if(bounds.isEmpty())return;
            if(geometryWidth!=bounds.width()||geometryHeight!=bounds.height()||geometryBitmap!=ready.bitmap){
                geometryWidth=bounds.width();geometryHeight=bounds.height();geometryBitmap=ready.bitmap;area.set(bounds);clip.reset();clip.addRoundRect(area,radius,radius,Path.Direction.CW);
                float scale=Math.max(area.width()/ready.bitmap.getWidth(),area.height()/ready.bitmap.getHeight());float w=ready.bitmap.getWidth()*scale,h=ready.bitmap.getHeight()*scale;
                destination.set(area.centerX()-w/2,area.centerY()-h/2,area.centerX()+w/2,area.centerY()+h/2);
                float outer=Math.max(1,Math.min(area.width(),area.height())/2),fraction=Math.max(.01f,Math.min(.99f,1-Math.min(glowWidth,outer)/outer));
                glowPaint.setShader(new RadialGradient(area.centerX(),area.centerY(),Math.max(area.width(),area.height())*.6f,new int[]{ready.color&0x00ffffff,ready.color&0x00ffffff,ready.color},new float[]{0,fraction,1},Shader.TileMode.CLAMP));
            }
            int save=canvas.save();try{
                canvas.clipPath(clip);image.setAlpha(Math.round(getAlpha()*opacity/100f));canvas.drawBitmap(ready.bitmap,null,destination,image);
                if(glow>0){glowPaint.setAlpha(Math.round(getAlpha()*glow/100f));canvas.drawRect(area,glowPaint);}
                // Fixed contrast veil follows OEM text polarity; controls/labels are never recolored or moved.
                wash.setColor(light?Color.BLACK:Color.WHITE);wash.setAlpha(Math.round(getAlpha()*.60f*opacity/100f));canvas.drawRect(area,wash);
            }finally{canvas.restoreToCount(save);}
        }
    }
}
