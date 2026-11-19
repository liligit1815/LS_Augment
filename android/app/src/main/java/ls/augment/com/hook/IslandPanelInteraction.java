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
        bind(owner,manager,island,panel,timed,changed,null);
    }
    static void bind(Object owner, Object manager, Object island, Object panel, boolean timed, Runnable changed,
            java.util.function.Supplier<IslandGestureActions.Target> target) {
        if (!(panel instanceof ViewGroup) || module == null) return;
        ViewGroup root = (ViewGroup) panel;
        Binding previous = PANELS.get(root);
        if (previous != null && previous.owner.get() == owner && previous.manager.get() == manager && previous.island.get() == island) {
            previous.target=target;previous.refresh(); return;
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
                        if (binding.before(event)) {
                            IslandGestureActions.Capture swipe=binding.upSwipe?binding.captured:null;
                            // Cancel the original recipient before closing. A panel-wide listener must
                            // not open the source as a side effect of tapping non-actionable content.
                            MotionEvent cancel = MotionEvent.obtain(event);
                            cancel.setAction(MotionEvent.ACTION_CANCEL);
                            try { chain.proceed(new Object[]{cancel}); } finally { cancel.recycle(); }
                            binding.after(event);
                            if(binding.dismiss())binding.completeSwipe(swipe);
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
            binding.target=target;
            PANELS.put(root, binding);
            binding.observeCompletion();
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
        return IslandGestureActions.holds(owner);
    }
    static void actionFinished(Object owner){
        for(Binding binding:new ArrayList<>(PANELS.values()))
            if(!binding.released&&binding.owner.get()==owner&&binding.changed!=null)binding.changed.run();
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
        boolean upCandidate,upSwipe;
        java.util.function.Supplier<IslandGestureActions.Target> target;
        IslandGestureActions.Capture captured;
        Field closingField;
        boolean callbackCompletion;
        long closeSequence,completedSequence=-1;
        Object presentation=new Object();
        long idleAt, downAt;
        float downX, downY;
        Binding(Object owner,Object manager,Object island,ViewGroup root,Close close,Field showing,Method selected,boolean timed,Runnable changed) {
            this.owner=new WeakReference<>(owner);this.manager=new WeakReference<>(manager);this.island=new WeakReference<>(island);
            this.root=new WeakReference<>(root);this.close=close;this.timed=timed;this.changed=changed;
            this.showing=showing;this.selected=selected;
            slop=ViewConfiguration.get(root.getContext()).getScaledTouchSlop();
        }
        void observeCompletion(){
            Object engine=manager.get(),scene=island.get();
            try{
                // A present but incompatible modern field is not a legacy contract.
                for(Class<?> type=engine.getClass();type!=null;type=type.getSuperclass()){
                    Field value;
                    try{value=type.getDeclaredField("mDynamicPanelClosing");}catch(NoSuchFieldException absent){continue;}
                    if(value.getType()!=boolean.class||Modifier.isStatic(value.getModifiers()))
                        throw new NoSuchFieldException("panel_closing_boolean");
                    value.setAccessible(true);closingField=value;return;
                }
                Method end=NativeIslandSceneContract.method(engine.getClass(),"onPermanentIslandPanelCloseAnimationEnd",
                        void.class,scene.getClass(),boolean.class,boolean.class);
                if(end==null||Modifier.isStatic(end.getModifiers())||!View.class.isAssignableFrom(end.getParameterTypes()[0]))
                    throw new NoSuchMethodException("legacy_panel_close_end");
                if(!HOOKS.contains(end)){
                    module.registerFeatureHook(module.prepareFeatureHook(end,"rm.ui.island.panel_close_observed",false).intercept(chain->{
                        ArrayList<Runnable> completed=new ArrayList<>();
                        for(Binding binding:new ArrayList<>(PANELS.values()))
                            if(binding.callbackCompletion&&binding.closing&&binding.manager.get()==chain.getThisObject()
                                    &&binding.island.get()==chain.getArgs().get(0)
                                    &&Boolean.FALSE.equals(chain.getArgs().get(1))&&Boolean.FALSE.equals(chain.getArgs().get(2))){
                                long sequence=binding.closeSequence;Object token=binding.presentation;
                                completed.add(()->binding.closeObserved(sequence,token));
                            }
                        Object result=chain.proceed();
                        for(Runnable finish:completed)finish.run();
                        return result;
                    }));HOOKS.add(end);
                }
                callbackCompletion=true;
            }catch(ReflectiveOperationException|RuntimeException unavailable){
                FeatureRuntimeLog.event("ISLAND_PANEL_INTERACTION","completion_unavailable:"+unavailable.getMessage());
            }
        }
        void closeObserved(long sequence,Object token){
            ViewGroup view=root.get();Object engine=manager.get();
            try{if(!released&&closeSequence==sequence&&presentation==token&&engine!=null&&view!=null
                    &&!showing.getBoolean(engine)&&!view.isAttachedToWindow())completedSequence=sequence;}
            catch(ReflectiveOperationException unavailable){ /* No observed completion. */ }
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
            boolean wasOpen=open;open=false;touching=false;blank=false;closing=false;captured=null;upCandidate=false;
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
            if(open){presentation=new Object();activity();}
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
            if(IslandMessageControls.inside(root.get())){activity();return;}
            long remaining=idleAt-SystemClock.elapsedRealtime();
            if(remaining>0){MAIN.postDelayed(timeout,remaining);return;}
            dismiss();
        }
        boolean dismiss(){
            refresh();Object engine=manager.get();
            if(!open||released||closing||Boolean.TRUE.equals(field(engine,"mDynamicPanelClosing")))return false;
            closing=true;closeSequence++;MAIN.removeCallbacks(timeout);
            try{close.run();}
            catch(ReflectiveOperationException|RuntimeException failure){
                closing=false;FeatureRuntimeLog.event("ISLAND_PANEL_INTERACTION","close_failed:"+failure.getClass().getSimpleName());
                return false;
            }
            return true;
        }
        void completeSwipe(IslandGestureActions.Capture swipe){
            if(swipe==null)return;
            Object engine=manager.get(),scene=island.get();
            Object generation=field(engine,"mPanelGen");
            long sequence=closeSequence;Object token=presentation;
            IslandGestureActions.completeWhen(swipe,()->{
                try{return !showing.getBoolean(engine)&&(closingField!=null?!closingField.getBoolean(engine)
                        :callbackCompletion&&completedSequence==sequence);}
                catch(ReflectiveOperationException missing){return false;}
            },()->!released&&manager.get()==engine&&island.get()==scene
                    &&closeSequence==sequence&&presentation==token
                    &&stillSelected(engine,scene)
                    &&java.util.Objects.equals(generation,field(engine,"mPanelGen"))
                    &&(field(engine,"mTempIsland")==null||field(engine,"mTempIsland")==scene));
        }
        boolean stillSelected(Object engine,Object scene){
            try{return selected.invoke(engine)==scene;}
            catch(ReflectiveOperationException unavailable){return false;}
        }
        boolean before(MotionEvent event){
            refresh();if(!open||closing||Boolean.TRUE.equals(field(manager.get(),"mDynamicPanelClosing")))return false;
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){
                touching=true;MAIN.removeCallbacks(timeout);downX=event.getX();downY=event.getY();downAt=event.getEventTime();moved=false;
                ViewGroup view=root.get();blank=event.getPointerCount()==1&&view!=null&&!controlAt(view,downX,downY);
                upCandidate=blank&&!controlAt(view,downX,downY,true);upSwipe=false;
                captured=upCandidate&&target!=null?IslandGestureActions.capture(target.get(),true):null;
            }else if(action==MotionEvent.ACTION_POINTER_DOWN||event.getPointerCount()>1){moved=true;upCandidate=false;captured=null;}
            else if(action==MotionEvent.ACTION_MOVE||action==MotionEvent.ACTION_UP){
                if(Math.abs(event.getX()-downX)>slop||Math.abs(event.getY()-downY)>slop)moved=true;
            }
            upSwipe=action==MotionEvent.ACTION_UP&&touching&&upCandidate&&blank
                    &&downY-event.getY()>slop*4&&downY-event.getY()>2*Math.abs(event.getX()-downX)
                    &&event.getEventTime()-downAt<1000;
            // Swiping the expanded notification sideways dismisses this presentation only.
            // The compact island and the expanded-up action retain their own source policies.
            float dx=Math.abs(event.getX()-downX),dy=Math.abs(event.getY()-downY);
            boolean sideways=action==MotionEvent.ACTION_UP&&touching&&upCandidate&&blank
                    &&dx>slop*4&&dx>dy*2&&event.getEventTime()-downAt<ViewConfiguration.getLongPressTimeout();
            return upSwipe||sideways||action==MotionEvent.ACTION_UP&&touching&&blank&&!moved
                    &&event.getEventTime()-downAt<ViewConfiguration.getLongPressTimeout()
                    &&root.get()!=null&&!controlAt(root.get(),event.getX(),event.getY());
        }
        void after(MotionEvent event){
            if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL){
                touching=false;blank=false;captured=null;upCandidate=false;activity();
            }
        }
        void release(){
            if(released)return;released=true;MAIN.removeCallbacks(timeout);
            if(owner.get()!=null)IslandGestureActions.release(owner.get());captured=null;
            ViewGroup view=root.get();if(view!=null){if(PANELS.get(view)==this)PANELS.remove(view);view.removeOnAttachStateChangeListener(this);}
            if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;
            boolean wasOpen=open;open=false;touching=false;blank=false;
            if(wasOpen&&changed!=null)changed.run();
        }
    }

    /** Respect transformed children, disabled controls and touch delegates; scrolling is never a tap. */
    private static boolean controlAt(ViewGroup parent,float x,float y){
        return controlAt(parent,x,y,false);
    }
    private static boolean controlAt(ViewGroup parent,float x,float y,boolean scrolling){
        if(parent.getTouchDelegate()!=null || scrolling && (parent.canScrollVertically(1)
                ||parent.canScrollVertically(-1)||parent.canScrollHorizontally(1)||parent.canScrollHorizontally(-1)))return true;
        for(int i=parent.getChildCount()-1;i>=0;i--){
            View child=parent.getChildAt(i);if(child.getVisibility()!=View.VISIBLE)continue;
            float[] point={x+parent.getScrollX()-child.getLeft(),y+parent.getScrollY()-child.getTop()};
            Matrix matrix=child.getMatrix();
            if(!matrix.isIdentity()){Matrix inverse=new Matrix();if(!matrix.invert(inverse))return true;inverse.mapPoints(point);}
            if(point[0]<0||point[1]<0||point[0]>=child.getWidth()||point[1]>=child.getHeight())continue;
            if(child.isClickable()||child.isLongClickable()||child instanceof android.widget.AbsSeekBar
                    ||child instanceof android.widget.EditText||child instanceof android.webkit.WebView)return true;
            if(scrolling&&(child.canScrollVertically(1)||child.canScrollVertically(-1)
                    ||child.canScrollHorizontally(1)||child.canScrollHorizontally(-1)))return true;
            if(child instanceof ViewGroup&&controlAt((ViewGroup)child,point[0],point[1],scrolling))return true;
        }
        return false;
    }
    private IslandPanelInteraction(){}
}
