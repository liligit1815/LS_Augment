package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import ls.augment.com.GlassOptions;
import ls.augment.com.LayerBackdropSource;
import ls.augment.com.LiquidGlassDockPolicy;
import ls.augment.com.LiquidGlassPolicy;
import ls.augment.com.LiquidGlassDrawable;

/** NX809J OEM Hotseat: material is drawn before child icons, without changing their layout/input. */
final class LiquidGlassDockHook {
    private static final String DIAGNOSTIC="ls_augment_rm_glass_dock_state";
    private static final WeakHashMap<View,State> STATES=new WeakHashMap<>();
    private static boolean installed;
    private LiquidGlassDockHook() { }

    static synchronized void install(AugmentModule module,ClassLoader loader) {
        if(installed)return;
        int count=OemHooks.methods(module,loader,"com.android.launcher3.Hotseat","onDraw",
                void.class,1,"",chain->{
                    Object result=chain.proceed();
                    if(!(chain.getThisObject() instanceof ViewGroup)||!(chain.getArg(0) instanceof Canvas))return result;
                    ViewGroup host=(ViewGroup)chain.getThisObject();
                    if(!FeatureSettings.enabled(host.getContext(),GlassOptions.DOCK)) {
                        State old=STATES.remove(host);if(old!=null)old.release();
                        publish(host,"disabled");return result;
                    }
                    Canvas canvas=(Canvas)chain.getArg(0);
                    if(!canvas.isHardwareAccelerated()||!host.isAttachedToWindow()||!host.isShown()){
                        publish(host,"host_unavailable;hardware="+canvas.isHardwareAccelerated()
                                +";attached="+host.isAttachedToWindow()+";shown="+host.isShown());return result;
                    }
                    State state=STATES.get(host);
                    if(state==null){state=new State(module,host);STATES.put(host,state);}
                    try{state.draw(canvas);}catch(ReflectiveOperationException|RuntimeException|LinkageError error){
                        state.status("draw_exception:"+error.getClass().getSimpleName());
                        state.release();STATES.remove(host);module.logFeatureError("GLASS_DOCK_DRAW",error);
                    }
                    return result;
                });
        OemHooks.methods(module,loader,"com.android.launcher3.Hotseat","dispatchTouchEvent",
                boolean.class,1,"",chain->{
                    Object owner=chain.getThisObject();
                    if(owner instanceof View&&chain.getArg(0) instanceof MotionEvent){
                        State state=STATES.get((View)owner);
                        if(state!=null&&state.glass!=null){
                            MotionEvent event=(MotionEvent)chain.getArg(0);
                            int action=event.getActionMasked();
                            state.glass.setInteraction(event.getX(),event.getY(),
                                    action!=MotionEvent.ACTION_UP&&action!=MotionEvent.ACTION_CANCEL);
                        }
                    }
                    // Preserve the original hit testing, dragging and accessibility behavior.
                    return chain.proceed();
                });
        installed=count>0;
        module.logFeatureInfo("GLASS_DOCK hooks="+count+" default=off");
    }

    private static void publish(View view,String value){
        FeatureSettings.diagnostic(view.getContext(),DIAGNOSTIC,
                "build="+ls.augment.com.BuildConfig.VERSION_CODE+";"+value);
    }

    /** A non-null transparent theme drawable is still an empty dock, not an existing tray. */
    private static boolean emptyBackground(View view){
        Drawable background=view.getBackground();
        return background==null||background.getAlpha()==0||background.getOpacity()==PixelFormat.TRANSPARENT;
    }

    private static final class State implements View.OnAttachStateChangeListener,Runnable {
        final WeakReference<ViewGroup> host;
        final AugmentModule module;
        final Handler handler=new Handler(Looper.getMainLooper());
        LayerBackdropSource source;
        LiquidGlassDrawable glass;
        String lastStatus="",geometry="";
        boolean released,opaqueMode;
        State(AugmentModule module,ViewGroup view){
            this.module=module;host=new WeakReference<>(view);
            view.addOnAttachStateChangeListener(this);
            handler.postDelayed(this,250);
        }
        void draw(Canvas canvas)throws ReflectiveOperationException{
            ViewGroup view=host.get();if(released||view==null)return;
            geometry=";host="+view.getWidth()+"x"+view.getHeight();
            Object children=OemHooks.invoke(view,"getShortcutsAndWidgets");
            if(!(children instanceof ViewGroup)){clearMaterial();status("unsupported_icon_container");return;}
            Rect union=new Rect(),item=new Rect();boolean found=false;
            Boolean lightLabels=null;
            ViewGroup cells=(ViewGroup)children;
            int visibleIcons=0;
            for(int i=0;i<cells.getChildCount();i++){
                View icon=cells.getChildAt(i);
                if(icon.getVisibility()!=View.VISIBLE||icon.getWidth()<=0||icon.getHeight()<=0)continue;
                item.set(0,0,icon.getWidth(),icon.getHeight());
                if(icon instanceof TextView){
                    TextView label=(TextView)icon;int color=label.getCurrentTextColor();
                    if(label.getText().length()>0&&label.getTextSize()>0&&(color>>>24)>=128){
                        boolean light=LiquidGlassPolicy.luminance(color)>.5;
                        if(lightLabels!=null&&lightLabels!=light){clearMaterial();status("mixed_label_contrast");return;}
                        lightLabels=light;
                    }else{
                        // Hotseat hides the text, but the native cell still reserves label space.
                        // Match its visible top drawable; do not stretch the capsule into that space.
                        Drawable[] compound=label.getCompoundDrawables();
                        if(compound[0]==null&&compound[1]!=null&&compound[2]==null&&compound[3]==null){
                            Rect image=compound[1].getBounds();
                            int[] visible=LiquidGlassDockPolicy.iconBounds(icon.getWidth(),icon.getHeight(),
                                    image.width(),image.height(),label.getPaddingTop());
                            if(visible!=null)item.set(visible[0],visible[1],visible[2],visible[3]);
                        }
                    }
                }
                view.offsetDescendantRectToMyCoords(icon,item);
                if(!found){union.set(item);found=true;}else union.union(item);
                visibleIcons++;
            }
            geometry+=";container="+cells.getClass().getName()+";children="+cells.getChildCount()
                    +";visible_icons="+visibleIcons+";icons="+union.toShortString();
            if(!found){clearMaterial();status("no_visible_dock_icons");return;}
            float density=view.getResources().getDisplayMetrics().density;
            int[] region=LiquidGlassDockPolicy.bounds(view.getWidth(),view.getHeight(),union.left,union.top,
                    union.right,union.bottom,Math.round(12*density),Math.round(36*density),Math.round(180*density));
            if(region==null){clearMaterial();status("unsupported_dock_geometry:"+view.getWidth()+"x"+view.getHeight()
                    +":density="+density+":icons="+union.toShortString());return;}
            Rect bounds=new Rect(region[0],region[1],region[2],region[3]);
            geometry+=";region="+bounds.toShortString()+";density="+density;
            boolean opaque=FeatureSettings.enabled(view.getContext(),GlassOptions.DOCK_REDUCE_TRANSPARENCY);
            if(glass!=null&&opaqueMode!=opaque)clearMaterial();
            opaqueMode=opaque;
            if(glass==null){
                source=new LayerBackdropSource(view);
                glass=new LiquidGlassDrawable(view,source,38f);
            }
            // Follow native dark-label/easy-mode variants without repainting their text or icons.
            glass.setForegroundIsLight(lightLabels==null||lightLabels);
            glass.setIconOnly(lightLabels==null);
            glass.setBounds(bounds);source.setRegion(bounds);
            glass.updatePreferences(opaque,
                    FeatureSettings.enabled(view.getContext(),GlassOptions.DOCK_REDUCE_MOTION));
            if(!opaque)source.request();
            if(!glass.prepare()){
                if(glass.isFailed())source.release();
                fallback(canvas,view,bounds);return;
            }
            int save=canvas.save();
            try{canvas.clipRect(bounds);glass.draw(canvas);}finally{canvas.restoreToCount(save);}
            if(glass.isFailed()){
                source.release();fallback(canvas,view,bounds);return;
            }
            status(glass.isReady()?(opaque?"reduced_transparency":"active"):glass.failureReason());
        }
        void fallback(Canvas canvas,ViewGroup view,Rect bounds){
            boolean drawn=false;
            // Keep a visible theme tray. Transparent ColorDrawable/empty state drawables
            // must not suppress the only visible dock material merely because they exist.
            boolean empty=emptyBackground(view);
            if(empty){
                int save=canvas.save();
                try{canvas.clipRect(bounds);drawn=glass.drawFallback(canvas);}
                finally{canvas.restoreToCount(save);}
            }
            status((drawn?"translucent_fallback:":"oem_fallback:")+glass.failureReason()+":"+source.failureReason()
                    +(!empty?";preserved_native_background":!drawn?";material_rejected":""));
        }
        void status(String value){
            ViewGroup view=host.get();
            if(view!=null){
                Drawable background=view.getBackground();
                value+=geometry+";background="+(background==null?"null":background.getClass().getName()
                        +",alpha="+background.getAlpha()+",opacity="+background.getOpacity());
                for(View node=view;node!=null;){
                    if(node.getScaleX()!=1||node.getScaleY()!=1||node.getRotation()!=0
                            ||node.getRotationX()!=0||node.getRotationY()!=0){
                        value+=";transform="+node.getClass().getName()+","+node.getScaleX()+","+node.getScaleY()
                                +","+node.getRotation()+","+node.getRotationX()+","+node.getRotationY();break;
                    }
                    ViewParent parent=node.getParent();node=parent instanceof View?(View)parent:null;
                }
            }
            if(value.equals(lastStatus))return;lastStatus=value;
            module.logFeatureInfo("GLASS_DOCK "+value);
            if(view!=null)publish(view,value);
        }
        @Override public void run(){
            ViewGroup view=host.get();
            if(released||view==null)return;
            if(!view.isAttachedToWindow()||!FeatureSettings.enabled(view.getContext(),GlassOptions.DOCK)){
                STATES.remove(view);release();view.invalidate();return;
            }
            if(view.isShown()&&view.getWindowVisibility()==View.VISIBLE)view.invalidate();
            handler.postDelayed(this,250);
        }
        void release(){
            if(released)return;released=true;handler.removeCallbacks(this);
            clearMaterial();ViewGroup view=host.get();
            if(view!=null){view.removeOnAttachStateChangeListener(this);view.invalidate();}
        }
        void clearMaterial(){
            if(source!=null)source.release();if(glass!=null)glass.release();source=null;glass=null;
        }
        @Override public void onViewAttachedToWindow(View view){ }
        @Override public void onViewDetachedFromWindow(View view){STATES.remove(view);release();}
    }
}
