package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/** Modern thumbnails cache child RenderNodes, bypassing inherited dispatchDraw
 * on unchanged frames. A native overlay participates in that same display list. */
final class RecentsPrivacyOverlay {
    interface Painter { boolean paint(View view,Canvas canvas)throws ReflectiveOperationException; }
    private final Map<View,State> states=new WeakHashMap<>();
    private final AugmentModule module;private final Painter painter;
    private RecentsPrivacyOverlay(AugmentModule module,Painter painter){this.module=module;this.painter=painter;}
    static boolean install(AugmentModule module,Class<?> type,Class<?> stateType,Painter painter)throws ReflectiveOperationException{
        Method attach,update,recycle;
        try{
            attach=HookCompatibility.method(type,void.class,false,new String[]{"onAttachedToWindow"});
            update=HookCompatibility.method(type,void.class,false,new String[]{"setState"},stateType,Integer.class);
            recycle=HookCompatibility.method(type,void.class,false,new String[]{"onRecycle"});
        }catch(NoSuchMethodException legacy){return false;}
        RecentsPrivacyOverlay adapter=new RecentsPrivacyOverlay(module,painter);
        for(Method method:new Method[]{attach,update,recycle}){
            boolean reset=method==recycle;
            module.registerFeatureHook(module.prepareFeatureHook(method,"launcher.recents.privacy.overlay."+method.getName(),false).intercept(chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();
                try{
                    if(reset){State old=adapter.states.remove(view);if(old!=null)old.detach();}
                    else adapter.bind(view);
                }catch(RuntimeException error){module.logFeatureError("RECENTS_PRIVACY_OVERLAY_BIND",error);}
                return result;
            }));module.deoptimize(method);
        }
        return true;
    }
    private void bind(View view){
        State state=states.get(view);
        if(state==null){state=new State(view);states.put(view,state);view.addOnAttachStateChangeListener(state);}
        if(view.isAttachedToWindow())state.attach();view.invalidate();
    }
    private final class State extends Drawable implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener{
        final WeakReference<View> reference;boolean attached,owned,drawLogged,errorLogged;
        State(View view){reference=new WeakReference<>(view);}
        void attach(){View view=reference.get();if(view==null)return;
            if(!attached){attached=true;view.getViewTreeObserver().addOnPreDrawListener(this);}onPreDraw();}
        void detach(){View view=reference.get();if(view==null)return;
            attached=false;if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);
            view.removeOnAttachStateChangeListener(this);if(owned)view.getOverlay().remove(this);owned=false;states.remove(view);
        }
        @Override public boolean onPreDraw(){View view=reference.get();if(view==null)return true;
            try{
                boolean selected=painter.paint(view,null);
                if(selected!=owned){owned=selected;if(owned)view.getOverlay().add(this);else view.getOverlay().remove(this);
                    FeatureSettings.diagnostic(view.getContext(),"ls_augment_recents_privacy_runtime",owned?"overlay_selected":"native_unselected");}
                if(owned)setBounds(0,0,view.getWidth(),view.getHeight());
            }catch(ReflectiveOperationException|RuntimeException error){
                // A recycled/unknown task contract must not retain the previous
                // task's mask. Fall back to the native thumbnail and report once.
                if(owned){view.getOverlay().remove(this);owned=false;}
                if(!errorLogged){errorLogged=true;module.logFeatureError("RECENTS_PRIVACY_OVERLAY_FRAME",error);}
            }
            return true;
        }
        @Override public void draw(Canvas canvas){View view=reference.get();if(view==null)return;
            try{if(painter.paint(view,canvas)&&!drawLogged){drawLogged=true;FeatureSettings.diagnostic(view.getContext(),"ls_augment_recents_privacy_runtime","overlay_drawn");}}
            catch(ReflectiveOperationException|RuntimeException error){if(!errorLogged){errorLogged=true;module.logFeatureError("RECENTS_PRIVACY_OVERLAY_DRAW",error);}}
        }
        @Override public void onViewAttachedToWindow(View view){attach();}
        @Override public void onViewDetachedFromWindow(View view){detach();}
        @Override public void setAlpha(int alpha){}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
