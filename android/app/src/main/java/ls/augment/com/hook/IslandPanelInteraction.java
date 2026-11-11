package ls.augment.com.hook;

import android.graphics.Matrix;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Observe only registered OEM panels. Dispatch controls unchanged; empty taps use OEM dismissal. */
final class IslandPanelInteraction {
    static final long IDLE_MILLIS = 8000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, Binding> PANELS = new WeakHashMap<>();
    private static final Set<Method> HOOKS = new HashSet<>();
    private static AugmentModule module;

    static void install(AugmentModule value) { module = value; }

    static void bind(Object owner, Object manager, Object island, Object panel, boolean timed, Runnable changed) {
        if (!(panel instanceof ViewGroup) || module == null) return;
        ViewGroup root = (ViewGroup) panel;
        Binding previous = PANELS.get(root);
        if (previous != null && previous.owner.get() == owner && previous.manager.get() == manager && previous.island.get() == island) {
            previous.refresh(); return;
        }
        try {
            Method dispatch = root.getClass().getMethod("dispatchTouchEvent", MotionEvent.class);
            if (dispatch.getReturnType() != boolean.class || Modifier.isStatic(dispatch.getModifiers()))
                throw new NoSuchMethodException("panel_dispatch_signature");
            Close close = Close.resolve(manager, island);
            Field showing = NativeIslandSceneContract.field(manager.getClass(), "mDynamicPanelShowing", boolean.class);
            Method selected = NativeIslandSceneContract.method(manager.getClass(), "getPermanentIsland", Object.class);
            if (showing == null || Modifier.isStatic(showing.getModifiers()))
                throw new NoSuchFieldException("panel_showing_boolean");
            if (selected == null || Modifier.isStatic(selected.getModifiers()))
                throw new NoSuchMethodException("panel_selected_instance");
            if (!HOOKS.contains(dispatch)) {
                module.registerFeatureHook(module.prepareFeatureHook(dispatch, "rm.ui.island.panel_touch", false).intercept(chain -> {
                    Binding binding = PANELS.get(chain.getThisObject());
                    if (binding == null || binding.dispatching) return chain.proceed();
                    MotionEvent event = (MotionEvent) chain.getArgs().get(0);
                    binding.dispatching = true;
                    try {
                        boolean emptyTap = binding.before(event);
                        if (emptyTap) {
                            // Cancel the original recipient before closing. A panel-wide listener must
                            // not open the source as a side effect of tapping non-actionable content.
                            MotionEvent cancel = MotionEvent.obtain(event);
                            cancel.setAction(MotionEvent.ACTION_CANCEL);
                            try { chain.proceed(new Object[]{cancel}); } finally { cancel.recycle(); }
                            binding.after(event);
                            binding.dismiss();
                            return true;
                        }
                        Object result = chain.proceed();
                        binding.after(event);
                        // Keep an otherwise unhandled blank DOWN eligible for its matching UP.
                        return Boolean.TRUE.equals(result) || binding.blank;
                    } finally { binding.dispatching = false; }
                }));
                HOOKS.add(dispatch);
            }
            if (previous != null) previous.release();
            Binding binding = new Binding(owner, manager, island, root, close, showing, selected, timed, changed);
            PANELS.put(root, binding);
            root.addOnAttachStateChangeListener(binding);
            binding.listen(); binding.refresh();
        } catch (ReflectiveOperationException | RuntimeException missing) {
            FeatureRuntimeLog.event("ISLAND_PANEL_INTERACTION", "unavailable:" + missing.getClass().getSimpleName() + ":" + missing.getMessage());
        }
    }

    static boolean holds(Object owner) {
        for (Binding binding : new ArrayList<>(PANELS.values())) if (binding.owner.get() == owner) {
            binding.refresh(); if (binding.open) return true;
        }
        return false;
    }
    static void activity(Object owner) {
        for (Binding binding : new ArrayList<>(PANELS.values())) if (binding.owner.get() == owner) binding.activity();
    }
    static void release(Object owner) {
        for (Binding binding : new ArrayList<>(PANELS.values())) if (binding.owner.get() == owner) binding.release();
    }

    private static final class Close {
        final Object target; final Method method; final Object[] args;
        Close(Object target, Method method, Object... args) { this.target=target;this.method=method;this.args=args; }
        static Close resolve(Object manager, Object island) throws ReflectiveOperationException {
            if (field(manager, "mDynamicIslandPanelRoot") instanceof View) {
                Method hide = NativeIslandSceneContract.method(manager.getClass(), "hidePanelIsland", void.class, boolean.class);
                if (hide == null || Modifier.isStatic(hide.getModifiers())) throw new NoSuchMethodException("fullscreen_hide_panel");
                return new Close(manager, hide, false);
            }
            Object animation = field(manager, "mDynamicAnimation");
            if (animation != null) for (Class<?> type=animation.getClass();type!=null;type=type.getSuperclass())
                for (Method method : type.getDeclaredMethods()) {
                    Class<?>[] args = method.getParameterTypes();
                    if (method.getName().equals("startPermanentPanelCloseAnimation") && method.getReturnType()==void.class
                            && !Modifier.isStatic(method.getModifiers()) && args.length==3 && args[0].isInstance(island)
                            && args[1]==boolean.class && args[2]==boolean.class) {
                        method.setAccessible(true);return new Close(animation,method,island,false,false);
                    }
                }
            throw new NoSuchMethodException("ordinary_close_panel");
        }
        void run() throws ReflectiveOperationException { method.invoke(target,args); }
    }

    private static final class Binding implements View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener {
        final WeakReference<Object> owner, manager, island;
        final WeakReference<ViewGroup> root;
        final Close close;
        final Field showing;
        final Method selected;
        final boolean timed;
        final Runnable changed;
        final int slop;
        final Runnable timeout=this::timeout;
        ViewTreeObserver observer;
        boolean open, touching, blank, moved, closing, dispatching, released;
        long idleAt, downAt;
        float downX, downY;
        Binding(Object owner,Object manager,Object island,ViewGroup root,Close close,Field showing,Method selected,boolean timed,Runnable changed) {
            this.owner=new WeakReference<>(owner);this.manager=new WeakReference<>(manager);this.island=new WeakReference<>(island);
            this.root=new WeakReference<>(root);this.close=close;this.timed=timed;this.changed=changed;
            this.showing=showing;this.selected=selected;
            slop=ViewConfiguration.get(root.getContext()).getScaledTouchSlop();
        }
        void listen() {
            ViewGroup view=root.get();
            if(view!=null&&view.isAttachedToWindow()&&observer==null){observer=view.getViewTreeObserver();observer.addOnPreDrawListener(this);}
        }
        @Override public boolean onPreDraw(){refresh();return true;}
        @Override public void onViewAttachedToWindow(View view){listen();refresh();}
        @Override public void onViewDetachedFromWindow(View view){
            // OEM expansion can reparent a panel. Keep its registration, but never
            // carry a live gesture or deadline across the detached interval.
            MAIN.removeCallbacks(timeout);
            if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;
            boolean wasOpen=open;open=false;touching=false;blank=false;closing=false;
            if(wasOpen&&changed!=null)changed.run();
        }
        void refresh() {
            if(released)return;
            Object engine=manager.get(),scene=island.get();ViewGroup view=root.get();
            boolean visible=false;
            try { visible=engine!=null&&scene!=null&&view!=null&&view.isAttachedToWindow()&&view.isShown()
                    &&showing.getBoolean(engine)
                    &&(selected.invoke(engine)==scene||field(engine,"mTempIsland")==scene); }
            catch(ReflectiveOperationException ignored){ /* Unknown state cannot retain an expired source. */ }
            if(visible==open)return;
            open=visible;touching=false;blank=false;closing=false;
            MAIN.removeCallbacks(timeout);
            if(open)activity();
            if(changed!=null)changed.run();
        }
        void activity(){
            if(!open||released||closing)return;
            idleAt=SystemClock.elapsedRealtime()+IDLE_MILLIS;
            MAIN.removeCallbacks(timeout);
            if(timed&&!touching)MAIN.postDelayed(timeout,IDLE_MILLIS);
        }
        void timeout(){
            refresh();if(!open||touching||released||closing)return;
            long remaining=idleAt-SystemClock.elapsedRealtime();
            if(remaining>0){MAIN.postDelayed(timeout,remaining);return;}
            dismiss();
        }
        void dismiss(){
            refresh();Object engine=manager.get();
            if(!open||released||closing||Boolean.TRUE.equals(field(engine,"mDynamicPanelClosing")))return;
            closing=true;MAIN.removeCallbacks(timeout);
            try{close.run();}
            catch(ReflectiveOperationException|RuntimeException failure){
                closing=false;FeatureRuntimeLog.event("ISLAND_PANEL_INTERACTION","close_failed:"+failure.getClass().getSimpleName());
            }
        }
        boolean before(MotionEvent event){
            refresh();if(!open||closing||Boolean.TRUE.equals(field(manager.get(),"mDynamicPanelClosing")))return false;
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){
                touching=true;MAIN.removeCallbacks(timeout);downX=event.getX();downY=event.getY();downAt=event.getEventTime();moved=false;
                ViewGroup view=root.get();blank=event.getPointerCount()==1&&view!=null&&!controlAt(view,downX,downY);
            }else if(action==MotionEvent.ACTION_POINTER_DOWN||event.getPointerCount()>1)moved=true;
            else if(action==MotionEvent.ACTION_MOVE||action==MotionEvent.ACTION_UP){
                if(Math.abs(event.getX()-downX)>slop||Math.abs(event.getY()-downY)>slop)moved=true;
            }
            return action==MotionEvent.ACTION_UP&&touching&&blank&&!moved
                    &&event.getEventTime()-downAt<ViewConfiguration.getLongPressTimeout()
                    &&root.get()!=null&&!controlAt(root.get(),event.getX(),event.getY());
        }
        void after(MotionEvent event){
            if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL){
                touching=false;blank=false;activity();
            }
        }
        void release(){
            if(released)return;released=true;MAIN.removeCallbacks(timeout);
            ViewGroup view=root.get();if(view!=null){if(PANELS.get(view)==this)PANELS.remove(view);view.removeOnAttachStateChangeListener(this);}
            if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;
            boolean wasOpen=open;open=false;touching=false;blank=false;
            if(wasOpen&&changed!=null)changed.run();
        }
    }

    /** Respect transformed children, disabled controls and touch delegates; scrolling is never a tap. */
    private static boolean controlAt(ViewGroup parent,float x,float y){
        if(parent.getTouchDelegate()!=null)return true;
        for(int i=parent.getChildCount()-1;i>=0;i--){
            View child=parent.getChildAt(i);if(child.getVisibility()!=View.VISIBLE)continue;
            float[] point={x+parent.getScrollX()-child.getLeft(),y+parent.getScrollY()-child.getTop()};
            Matrix matrix=child.getMatrix();
            if(!matrix.isIdentity()){Matrix inverse=new Matrix();if(!matrix.invert(inverse))return true;inverse.mapPoints(point);}
            if(point[0]<0||point[1]<0||point[0]>=child.getWidth()||point[1]>=child.getHeight())continue;
            if(child.isClickable()||child.isLongClickable()||child instanceof android.widget.AbsSeekBar
                    ||child instanceof android.widget.EditText||child instanceof android.webkit.WebView)return true;
            if(child instanceof ViewGroup&&controlAt((ViewGroup)child,point[0],point[1]))return true;
        }
        return false;
    }
    private IslandPanelInteraction(){}
}
