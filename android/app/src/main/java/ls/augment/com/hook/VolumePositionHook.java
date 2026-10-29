package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Insets;
import android.graphics.Rect;
import android.view.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.VolumePositionSettings;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Repositions the two inspected OEM windows; keeps their views, input and timers. */
final class VolumePositionHook {
    private static final String ASSIST="com.zte.feature.volume.zsound.ZSoundWindowManager";
    private static final Map<View,Main> MAINS=new WeakHashMap<>();
    private static final Map<View,Entrance> ENTRANCES=new WeakHashMap<>();
    private static WeakReference<Main> latest=new WeakReference<>(null);
    private static WeakReference<Entrance> latestEntrance=new WeakReference<>(null);
    private VolumePositionHook(){}
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> assist=Class.forName(ASSIST,false,loader);
            Method params=HookCompatibility.method(assist,WindowManager.LayoutParams.class,false,new String[]{"getWindowParams"},Context.class);
            Method manager=HookCompatibility.method(assist,WindowManager.class,false,new String[]{"getMWindowManager"});
            // The base volume implementation moved packages; the OEM subclass keeps
            // the same update contract. Only use an actual Window/LayoutParams pair.
            Class<?> dialog=Class.forName("com.zte.feature.volume.MfvVolumeDialogImpl",false,loader);
            Method update=HookCompatibility.inheritedMethod(dialog,void.class,false,new String[]{"updateWindowParams"},WindowManager.LayoutParams.class);
            Method init=HookCompatibility.inheritedMethod(dialog,void.class,false,new String[]{"initDialog"},int.class);
            Method show=HookCompatibility.inheritedMethod(dialog,void.class,false,new String[]{"showH"},int.class,boolean.class,int.class);
            Class<?> feature=Class.forName("com.zte.feature.volume.MfvVolumeDialog",false,loader);
            Method showEntrance=HookCompatibility.method(feature,void.class,false,new String[]{"showVolumeAssistWindow"});
            java.lang.reflect.Field nativeFeature=HookCompatibility.field(dialog,feature,true,"sMfvVolumeDialog");
            module.registerFeatureHook(module.prepareFeatureHook(update,"volume.position.main",false).intercept(chain->{
                Object result=chain.proceed();
                try{bindMain(chain.getThisObject(),(WindowManager.LayoutParams)chain.getArg(0));}
                catch(RuntimeException error){module.logFeatureError("VOLUME_POSITION_MAIN",error);}
                return result;
            }));module.deoptimize(update);
            // updateWindowParams runs before setContentView on first creation.
            // Bind the completed root before its first show/layout, not the old root.
            module.registerFeatureHook(module.prepareFeatureHook(init,"volume.position.init",false).intercept(chain->{
                Object result=chain.proceed();Object owner=chain.getThisObject();
                try{Object raw=field(owner,"mWindow");if(raw instanceof Window){Window w=(Window)raw;bindMain(owner,w.getAttributes());w.setAttributes(w.getAttributes());}}
                catch(RuntimeException error){module.logFeatureError("VOLUME_POSITION_INIT",error);}return result;
            }));module.deoptimize(init);
            module.registerFeatureHook(module.prepareFeatureHook(show,"volume.position.show",false).intercept(chain->{
                Object result=chain.proceed();
                try{Object raw=field(chain.getThisObject(),"mDialogView");
                    if(raw instanceof View){View view=(View)raw;
                        // Dialog.show schedules attachment; immediately reading
                        // isAttachedToWindow here misses the first visible frame.
                        view.post(()->{try{
                            Main main=MAINS.get(view);
                            if(view.isAttachedToWindow()&&main!=null&&enabled(view.getContext()))
                                showEntrance.invoke(nativeFeature.get(null));
                        }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("VOLUME_POSITION_SHOW",error);}});
                    }
                }catch(RuntimeException error){module.logFeatureError("VOLUME_POSITION_SHOW",error);}return result;
            }));module.deoptimize(show);
            module.registerFeatureHook(module.prepareFeatureHook(params,"volume.position.entrance",false).intercept(chain->{
                Object result=chain.proceed();
                try{
                    Object raw=field(chain.getThisObject(),"mView");
                    if(raw instanceof View&&result instanceof WindowManager.LayoutParams){
                        View view=(View)raw;Entrance binding=ENTRANCES.get(view);
                        if(binding==null){binding=new Entrance(view,(WindowManager)manager.invoke(chain.getThisObject()));ENTRANCES.put(view,binding);binding.watch();}
                        latestEntrance=new WeakReference<>(binding);binding.nativePosition=new Position((WindowManager.LayoutParams)result);
                        binding.adjust((WindowManager.LayoutParams)result);
                    }
                }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("VOLUME_POSITION_ENTRANCE",error);}
                return result;
            }));module.deoptimize(params);
            return 4;
        }catch(ReflectiveOperationException|LinkageError error){module.logFeatureError("VOLUME_POSITION_CAPABILITY",error);return 0;}
    }
    private static boolean enabled(Context context){return VolumePositionSettings.multiAppEnabled(context)&&FeatureSettings.enabled(context,SystemUiOptions.VOLUME_SAME_SIDE);}
    private static boolean left(Context context){return "0".equals(FeatureSettings.snapshot(context).get(SystemUiOptions.VOLUME_POSITION));}
    private static Insets insets(View view){WindowInsets value=view.getRootWindowInsets();return value==null?Insets.NONE:value.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());}
    private static void bindMain(Object owner,WindowManager.LayoutParams params){
        Object w=field(owner,"mWindow"),v=field(owner,"mDialogView");
        if(!(w instanceof Window)||!(v instanceof View))return;
        View root=(View)v;Main binding=MAINS.get(root);
        if(binding==null){
            Panel panel=Panel.create(root);
            if(panel==null)return;
            binding=new Main(root,(Window)w,owner,panel);MAINS.put(root,binding);binding.watch();
        }
        binding.nativePosition=new Position(params);latest=new WeakReference<>(binding);binding.adjust(params);
    }
    private static final class Position{
        final int gravity,x,y;
        Position(WindowManager.LayoutParams p){gravity=p.gravity;x=p.x;y=p.y;}
        void apply(WindowManager.LayoutParams p){p.gravity=gravity;p.x=x;p.y=y;}
        boolean same(WindowManager.LayoutParams p){return gravity==p.gravity&&x==p.x&&y==p.y;}
    }
    /** The OEM window reserves the expanded width even when its visible panel
     * is narrow. Move its actual constrained child as well as the window. */
    private static final class Panel{
        final java.lang.reflect.Field start,end;
        final int nativeStart,nativeEnd,paddingLeft,paddingTop,paddingRight,paddingBottom;
        final WeakReference<View> parent;
        boolean owned;
        private Panel(View view,java.lang.reflect.Field start,java.lang.reflect.Field end)throws IllegalAccessException{
            this.start=start;this.end=end;Object params=view.getLayoutParams();
            nativeStart=start.getInt(params);nativeEnd=end.getInt(params);
            View container=(View)view.getParent();parent=new WeakReference<>(container);
            paddingLeft=container.getPaddingLeft();paddingTop=container.getPaddingTop();paddingRight=container.getPaddingRight();paddingBottom=container.getPaddingBottom();
        }
        static Panel create(View view){
            try{
                if(!(view.getParent() instanceof View)||view.getLayoutParams()==null)return null;
                Class<?> type=view.getLayoutParams().getClass();
                java.lang.reflect.Field start=HookCompatibility.field(type,int.class,false,"startToStart");
                java.lang.reflect.Field end=HookCompatibility.field(type,int.class,false,"endToEnd");
                // Only the inspected parent-edge constraint; other arrangements
                // retain their native layout until a matching adapter is known.
                if(start.getInt(view.getLayoutParams())!=-1||end.getInt(view.getLayoutParams())!=0)
                    throw new NoSuchFieldException("volume panel is not end-constrained to parent");
                return new Panel(view,start,end);
            }catch(ReflectiveOperationException|RuntimeException error){
                FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime","native_fallback:panel_constraints:"+error.getClass().getSimpleName());return null;
            }
        }
        void apply(View view,boolean enabled,boolean left){
            View container=parent.get();if(container==null)return;
            try{
                ViewGroup.LayoutParams params=view.getLayoutParams();
                boolean startSide=left==(container.getLayoutDirection()==View.LAYOUT_DIRECTION_LTR);
                int a=enabled?(startSide?0:-1):nativeStart,b=enabled?(startSide?-1:0):nativeEnd;
                if(enabled||owned){
                    if(start.getInt(params)!=a||end.getInt(params)!=b){start.setInt(params,a);end.setInt(params,b);view.setLayoutParams(params);}
                    int l=enabled&&left?paddingRight:paddingLeft,r=enabled&&left?paddingLeft:paddingRight;
                    if(container.getPaddingLeft()!=l||container.getPaddingRight()!=r)container.setPadding(l,paddingTop,r,paddingBottom);
                }
                owned=enabled;
            }catch(IllegalAccessException error){throw new IllegalStateException("volume panel constraints",error);}
        }
    }
    private abstract static class Binding implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener{
        final WeakReference<View> reference;final Runnable changed=this::refresh;
        Position nativePosition;boolean attached,owned,failed;
        Binding(View view){reference=new WeakReference<>(view);}
        void watch(){View view=reference.get();if(view==null)return;view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        @Override public void onViewAttachedToWindow(View view){if(attached)return;attached=true;view.getViewTreeObserver().addOnPreDrawListener(this);FeatureSettings.addSnapshotListener(view.getContext(),changed);}
        @Override public void onViewDetachedFromWindow(View view){attached=false;FeatureSettings.removeSnapshotListener(changed);if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);}
        @Override public boolean onPreDraw(){refresh();return true;}
        void refresh(){try{if(!failed)update();}catch(RuntimeException error){failed=true;View view=reference.get();if(view!=null)FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime","native_fallback:"+error.getClass().getSimpleName());}}
        abstract void update();
    }
    private static final class Main extends Binding{
        final WeakReference<Window> window;final WeakReference<Object> owner;final Panel panel;
        Main(View root,Window w,Object owner,Panel panel){super(root);window=new WeakReference<>(w);this.owner=new WeakReference<>(owner);this.panel=panel;}
        // The labels select physical left/right; preserve all other native gravity
        // bits while clearing the relative-direction mask before assigning them.
        @android.annotation.SuppressLint({"WrongConstant","RtlHardcoded"})
        void adjust(WindowManager.LayoutParams p){View view=reference.get();if(view==null||nativePosition==null)return;
            panel.apply(view,enabled(view.getContext()),left(view.getContext()));
            if(enabled(view.getContext())){
                boolean left=left(view.getContext());Insets edge=insets(view);
                Insets cutout=view.getRootWindowInsets()==null?Insets.NONE:view.getRootWindowInsets().getInsetsIgnoringVisibility(WindowInsets.Type.displayCutout());
                int verticalAndFlags=p.gravity&~(Gravity.HORIZONTAL_GRAVITY_MASK|Gravity.RELATIVE_LAYOUT_DIRECTION);
                p.gravity=verticalAndFlags|(left?Gravity.LEFT:Gravity.RIGHT);
                p.x=Math.max(0,nativePosition.x-cutout.right)+(left?cutout.left:cutout.right);
                Entrance entrance=latestEntrance.get();View button=entrance==null?null:entrance.reference.get();Window w=window.get();
                if(button!=null&&w!=null&&view.getHeight()>0&&button.getMeasuredHeight()>0){
                    int available=w.getWindowManager().getCurrentWindowMetrics().getBounds().height()-edge.top-edge.bottom;
                    int gap=Math.round(8*view.getResources().getDisplayMetrics().density);
                    int limit=available-view.getHeight()-button.getMeasuredHeight()-gap;
                    if(limit<0){
                        nativePosition.apply(p);panel.apply(view,false,false);owned=false;
                        set(owner.get(),"mWindowGravity",p.gravity);return;
                    }
                    int vertical=nativePosition.gravity&Gravity.VERTICAL_GRAVITY_MASK;
                    int top=vertical==Gravity.TOP?nativePosition.y:vertical==Gravity.BOTTOM?available-view.getHeight()-nativePosition.y:(available-view.getHeight())/2+nativePosition.y;
                    p.gravity=Gravity.TOP|(left?Gravity.LEFT:Gravity.RIGHT);p.y=Math.max(0,Math.min(top,limit));
                }
                owned=true;
            }else if(owned){nativePosition.apply(p);owned=false;}
            set(owner.get(),"mWindowGravity",p.gravity);
        }
        @Override void update(){View view=reference.get();Window w=window.get();if(view==null||w==null||!view.isAttachedToWindow())return;
            WindowManager.LayoutParams p=w.getAttributes();Position before=new Position(p);adjust(p);if(!before.same(p))w.setAttributes(p);
        }
    }
    private static final class Entrance extends Binding{
        final WindowManager manager;
        Entrance(View view,WindowManager manager){super(view);this.manager=manager;}
        @android.annotation.SuppressLint("RtlHardcoded") // Physical side selected by the user.
        void adjust(WindowManager.LayoutParams p){
            View view=reference.get();Main main=latest.get();View root=main==null?null:main.reference.get();
            if(view==null||nativePosition==null)return;
            if(!enabled(view.getContext())||main==null||!main.owned||root==null||!root.isAttachedToWindow()){
                if(owned){nativePosition.apply(p);owned=false;}return;
            }
            Window w=main.window.get();if(w==null)return;
            Rect screen=manager.getCurrentWindowMetrics().getBounds();Insets edge=insets(root);
            int[] point=new int[2];root.getLocationOnScreen(point);
            int height=view.getHeight()>0?view.getHeight():view.getMeasuredHeight();
            int width=view.getWidth()>0?view.getWidth():view.getMeasuredWidth();
            if(height<=0||width<=0){view.measure(View.MeasureSpec.makeMeasureSpec(screen.width(),View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(screen.height(),View.MeasureSpec.AT_MOST));height=view.getMeasuredHeight();width=view.getMeasuredWidth();}
            int gap=Math.round(8*view.getResources().getDisplayMetrics().density);
            int bottom=point[1]+root.getHeight()+gap;
            if(root.getHeight()<=0||height<=0||bottom+height>screen.bottom-edge.bottom){
                // Insufficient landscape space: keep the stock window until the
                // native main panel has a usable measured frame; never overlap it.
                if(owned){nativePosition.apply(p);owned=false;}
                FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime","awaiting_room_below_panel");return;
            }
            boolean left=left(view.getContext());
            int center=point[0]+root.getWidth()/2;
            p.gravity=Gravity.TOP|(left?Gravity.LEFT:Gravity.RIGHT);
            // Coordinates in screen space; fit-inset origin is excluded by WM.
            p.x=Math.max(0,left?center-width/2-screen.left-edge.left:screen.right-edge.right-center-width/2);
            p.y=Math.max(0,bottom-screen.top-edge.top);
            owned=true;
        }
        @Override void update(){View view=reference.get();if(view==null||!view.isAttachedToWindow()||!(view.getLayoutParams() instanceof WindowManager.LayoutParams))return;
            WindowManager.LayoutParams p=(WindowManager.LayoutParams)view.getLayoutParams();Position before=new Position(p);adjust(p);
            if(!before.same(p)){manager.updateViewLayout(view,p);FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime",owned?"same_side_below;side="+(left(view.getContext())?"left":"right"):"native_restored");}
        }
    }
}
