package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Insets;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
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
            module.registerFeatureHook(module.prepareFeatureHook(params,"volume.position.entrance",false).intercept(chain->{
                Object result=chain.proceed();
                try{
                    Object raw=field(chain.getThisObject(),"mView");
                    if(raw instanceof View&&result instanceof WindowManager.LayoutParams){
                        View view=(View)raw;Entrance binding=ENTRANCES.get(view);
                        if(binding==null){binding=new Entrance(view,(WindowManager)manager.invoke(chain.getThisObject()));ENTRANCES.put(view,binding);binding.watch();}
                        latestEntrance=new WeakReference<>(binding);binding.prepare((WindowManager.LayoutParams)result);
                        binding.adjust((WindowManager.LayoutParams)result);
                    }
                }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("VOLUME_POSITION_ENTRANCE",error);}
                return result;
            }));module.deoptimize(params);
            return 3;
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
                    int gap=Math.round(VolumeEntrancePlacement.GAP_DP*view.getResources().getDisplayMetrics().density);
                    int vertical=nativePosition.gravity&Gravity.VERTICAL_GRAVITY_MASK;
                    int top=vertical==Gravity.TOP?nativePosition.y:vertical==Gravity.BOTTOM?available-view.getHeight()-nativePosition.y:(available-view.getHeight())/2+nativePosition.y;
                    int placed=VolumeEntrancePlacement.panelTop(top,available,view.getHeight(),button.getMeasuredHeight(),gap);
                    if(placed<0){
                        nativePosition.apply(p);panel.apply(view,false,false);owned=false;
                        set(owner.get(),"mWindowGravity",p.gravity);return;
                    }
                    p.gravity=Gravity.TOP|(left?Gravity.LEFT:Gravity.RIGHT);p.y=placed;
                }
                owned=true;
            }else if(owned){nativePosition.apply(p);owned=false;}
            set(owner.get(),"mWindowGravity",p.gravity);
        }
        @Override void update(){View view=reference.get();Window w=window.get();if(view==null||w==null||!view.isAttachedToWindow())return;
            WindowManager.LayoutParams p=w.getAttributes();Position before=new Position(p);adjust(p);if(!before.same(p))w.setAttributes(p);
            // The OEM can attach its assist button before the main dialog. Its
            // first pre-draw then has no anchor and never redraws by itself.
            // Retry from the main panel's measured frame, without showing it.
            Entrance entrance=latestEntrance.get();if(entrance!=null)entrance.refresh();
        }
    }
    private static final class Entrance extends Binding{
        final WindowManager manager;
        // Reuse the verified framework move-animation contract used by the island.
        final IslandWindowMotion motion=new IslandWindowMotion();
        boolean firstFrame,nativeOnly,positionChanged;
        long waitingSince;
        int nativeAnimations;
        EntranceStyle style;
        Entrance(View view,WindowManager manager){super(view);this.manager=manager;}
        void prepare(WindowManager.LayoutParams params){
            nativePosition=new Position(params);nativeAnimations=params.windowAnimations;
            firstFrame=true;nativeOnly=false;positionChanged=false;waitingSince=-1;
            View view=reference.get();
            if(view!=null&&enabled(view.getContext())){
                if(motion.suppress(params,value->status(view,value)))params.windowAnimations=0;
                else nativeOnly=true;
            }
        }
        void restoreMotion(View view,WindowManager.LayoutParams params){
            motion.restore(params,value->status(view,value));params.windowAnimations=nativeAnimations;
        }
        @Override public boolean onPreDraw(){
            if(waitingSince<0)waitingSince=android.os.SystemClock.uptimeMillis();
            refresh();View view=reference.get();
            if(view==null||!firstFrame||nativeOnly||!enabled(view.getContext()))return true;
            // Never submit the stock location or the old measured size as a visible
            // first frame. The main dialog may attach after this separate window.
            if(!failed&&(!owned||view.isLayoutRequested()||!dimensionsReady(view)||positionChanged)
                    &&android.os.SystemClock.uptimeMillis()-waitingSince<500){
                positionChanged=false;view.postInvalidateOnAnimation();return false;
            }
            firstFrame=false;
            if(failed||!owned||view.isLayoutRequested()||!dimensionsReady(view)||positionChanged){
                String reason="native_fallback:first_frame_unavailable;owned="+owned+";layout="+view.isLayoutRequested()+";measured="+dimensionsReady(view)+";position="+positionChanged+";failed="+failed;
                nativeOnly=true;restoreNative(view);status(view,reason);
                return false;
            }
            // The inspected OEM show animator only fades/translates this entrance.
            // Cancel it before the first submitted frame; keep native hide/timers/clicks.
            view.animate().cancel();view.setTranslationX(0f);view.setAlpha(1f);
            return true;
        }
        boolean dimensionsReady(View view){return view.getWidth()>0&&view.getHeight()>0&&view.getWidth()==view.getMeasuredWidth()&&view.getHeight()==view.getMeasuredHeight();}
        boolean settled(View view){
            // The OEM adapter may animate the dialog root or an ancestor. Wait
            // for that existing entrance to finish before exposing this window.
            for(View item=view;item!=null;item=item.getParent() instanceof View?(View)item.getParent():null)
                if(item.isLayoutRequested()||item.getTranslationX()!=0f||item.getTranslationY()!=0f)return false;
            return true;
        }
        void restoreNative(View view){
            if(!(view.getLayoutParams() instanceof WindowManager.LayoutParams))return;
            WindowManager.LayoutParams params=(WindowManager.LayoutParams)view.getLayoutParams();
            nativePosition.apply(params);restoreMotion(view,params);owned=false;
            if(style!=null)style.restore();manager.updateViewLayout(view,params);view.postInvalidateOnAnimation();
        }
        @android.annotation.SuppressLint("RtlHardcoded") // Physical side selected by the user.
        void adjust(WindowManager.LayoutParams p){
            View view=reference.get();Main main=latest.get();View root=main==null?null:main.reference.get();
            if(view==null||nativePosition==null)return;
            if(nativeOnly)return;
            if(enabled(view.getContext())){
                if(!motion.suppress(p,value->status(view,value))){nativeOnly=true;return;}
                p.windowAnimations=0;
            }
            if(!enabled(view.getContext())||main==null||!main.owned||root==null||!root.isAttachedToWindow()){
                status(view,"native_fallback:main_pending;enabled="+enabled(view.getContext())+";main="+(main!=null)+";owned="+(main!=null&&main.owned)+";attached="+(root!=null&&root.isAttachedToWindow()));
                if(style!=null)style.restore();
                if(owned){nativePosition.apply(p);owned=false;}
                if(!enabled(view.getContext()))restoreMotion(view,p);
                return;
            }
            Window w=main.window.get();if(w==null)return;
            Object ringRaw=field(main.owner.get(),"mRinger"),sliderRaw=field(main.owner.get(),"mDialogMain");
            Object iconRaw=field(main.owner.get(),"mRingerIcon");
            if(!(ringRaw instanceof View)||!(sliderRaw instanceof View)||!(iconRaw instanceof ImageView)){
                status(view,"native_fallback:main_views;ringer="+(ringRaw!=null)+";slider="+(sliderRaw!=null)+";icon="+(iconRaw!=null));return;}
            View ringer=(View)ringRaw,slider=(View)sliderRaw;
            if(firstFrame&&(!settled(ringer)||!settled(slider))){owned=false;return;}
            Rect ringBounds=new Rect(),sliderBounds=new Rect();
            if(!ringer.getGlobalVisibleRect(ringBounds)||!slider.getGlobalVisibleRect(sliderBounds)
                    ||ringBounds.width()<=0||Math.abs(ringBounds.width()-ringBounds.height())>4*view.getResources().getDisplayMetrics().density){
                status(view,"native_fallback:ringer_geometry;ringer="+ringBounds+";slider="+sliderBounds);return;}
            // getGlobalVisibleRect uses this window's root coordinates. The
            // assist is a separate window, so anchor it in physical screen space.
            int[] location=new int[2];ringer.getLocationOnScreen(location);
            ringBounds.set(location[0],location[1],location[0]+ringer.getWidth(),location[1]+ringer.getHeight());
            slider.getLocationOnScreen(location);
            sliderBounds.set(location[0],location[1],location[0]+slider.getWidth(),location[1]+slider.getHeight());
            if(style==null)style=EntranceStyle.create(view);
            if(style==null){status(view,"native_fallback:entrance_views");return;}
            if(!style.apply(ringer,(ImageView)iconRaw)){status(view,"native_fallback:ringer_surface");return;}
            if(view.isLayoutRequested()){owned=false;return;}
            Rect screen=manager.getCurrentWindowMetrics().getBounds();Insets edge=insets(root);
            int height=view.getHeight(),width=view.getWidth();
            if(height<=0||width<=0){owned=false;return;}
            int gap=Math.max(Math.round(VolumeEntrancePlacement.GAP_DP*view.getResources().getDisplayMetrics().density),ringBounds.top-sliderBounds.bottom);
            int top=VolumeEntrancePlacement.entranceTop(sliderBounds.top,ringBounds.height(),height,gap);
            if(root.getHeight()<=0||top<screen.top+edge.top||top+height>screen.bottom-edge.bottom){
                // Insufficient landscape space: keep the stock window until the
                // native main panel has a usable measured frame; never overlap it.
                if(owned){nativePosition.apply(p);owned=false;}
                if(style!=null)style.restore();
                status(view,"native_fallback:no_room_above_panel");return;
            }
            boolean left=left(view.getContext());
            int center=ringBounds.centerX();
            p.gravity=Gravity.TOP|(left?Gravity.LEFT:Gravity.RIGHT);
            // Coordinates in screen space; fit-inset origin is excluded by WM.
            p.x=Math.max(0,left?center-width/2-screen.left-edge.left:screen.right-edge.right-center-width/2);
            p.y=Math.max(0,top-screen.top-edge.top);
            owned=true;
        }
        String lastStatus="";
        void status(View view,String value){if(!value.equals(lastStatus)){lastStatus=value;FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime",value);}}
        @Override void update(){View view=reference.get();if(view==null||!view.isAttachedToWindow()||!(view.getLayoutParams() instanceof WindowManager.LayoutParams))return;
            WindowManager.LayoutParams p=(WindowManager.LayoutParams)view.getLayoutParams();Position before=new Position(p);int animations=p.windowAnimations;adjust(p);
            if(!before.same(p)||animations!=p.windowAnimations){positionChanged=true;manager.updateViewLayout(view,p);FeatureSettings.diagnostic(view.getContext(),"ls_augment_volume_position_runtime",owned?"same_side_above;side="+(left(view.getContext())?"left":"right"):"native_restored");}
        }
    }
    /** Reuses OEM surface and tint while retaining the native clickable view and icon. */
    private static final class EntranceStyle{
        final WeakReference<View> root,outer,container,blue;
        final WeakReference<ImageView> background,note;
        final Drawable originalBackground;final android.content.res.ColorStateList originalTint;
        final int outerWidth,outerHeight,innerWidth,innerHeight,blueVisibility;
        boolean applied;Drawable sourceBackground,fallbackSurface;
        EntranceStyle(View root,View outer,View container,View blue,ImageView background,ImageView note){
            this.root=new WeakReference<>(root);this.outer=new WeakReference<>(outer);this.container=new WeakReference<>(container);
            this.blue=new WeakReference<>(blue);this.background=new WeakReference<>(background);this.note=new WeakReference<>(note);
            originalBackground=background.getDrawable();originalTint=note.getImageTintList();blueVisibility=blue.getVisibility();
            outerWidth=outer.getLayoutParams().width;outerHeight=outer.getLayoutParams().height;
            innerWidth=container.getLayoutParams().width;innerHeight=container.getLayoutParams().height;
        }
        @android.annotation.SuppressLint("DiscouragedApi")
        static EntranceStyle create(View root){
            android.content.res.Resources r=root.getResources();
            View container=root.findViewById(r.getIdentifier("volume_assist_icon_container","id","com.android.systemui"));
            View bg=root.findViewById(r.getIdentifier("volume_assist_bg","id","com.android.systemui"));
            View blue=root.findViewById(r.getIdentifier("volume_assist_icon","id","com.android.systemui"));
            if(!(container instanceof ViewGroup)||!(container.getParent() instanceof View)||!(bg instanceof ImageView)||blue==null)return null;
            ImageView note=null;ViewGroup group=(ViewGroup)container;
            for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child instanceof ImageView&&child!=bg&&child!=blue)note=(ImageView)child;}
            if(note==null)return null;
            return new EntranceStyle(root,(View)container.getParent(),container,blue,(ImageView)bg,note);
        }
        @android.annotation.SuppressLint("DiscouragedApi")
        boolean apply(View ringer,ImageView icon){
            View out=outer.get(),in=container.get(),fill=blue.get();ImageView bg=background.get(),music=note.get();
            Drawable nativeBg=ringer.getBackground();
            // Newer ROMs paint the ringer surface in VolumeDialogBackView instead
            // of assigning a background to the ringer FrameLayout itself.
            if(nativeBg==null){
                if(fallbackSurface==null){
                    int resource=ringer.getResources().getIdentifier("volume_dialog_ringer_background","drawable","com.android.systemui");
                    if(resource!=0)fallbackSurface=ringer.getContext().getDrawable(resource);
                }
                nativeBg=fallbackSurface;
            }
            if(out==null||in==null||fill==null||bg==null||music==null||nativeBg==null||nativeBg.getConstantState()==null)return false;
            int size=ringer.getWidth(),pad=Math.max(0,outerWidth-innerWidth);
            resize(out,size+pad,size+pad);resize(in,size,size);
            if(sourceBackground!=nativeBg){bg.setImageDrawable(nativeBg.getConstantState().newDrawable(ringer.getResources()).mutate());sourceBackground=nativeBg;}
            bg.getDrawable().setState(ringer.getDrawableState());fill.setVisibility(View.INVISIBLE);
            music.setImageTintList(icon.getImageTintList());music.setColorFilter(icon.getColorFilter());
            applied=true;return true;
        }
        void restore(){
            if(!applied)return;View out=outer.get(),in=container.get(),fill=blue.get();ImageView bg=background.get(),music=note.get();
            if(out!=null)resize(out,outerWidth,outerHeight);if(in!=null)resize(in,innerWidth,innerHeight);
            if(fill!=null)fill.setVisibility(blueVisibility);if(bg!=null)bg.setImageDrawable(originalBackground);
            if(music!=null){music.setImageTintList(originalTint);music.clearColorFilter();}
            applied=false;sourceBackground=null;
        }
        static void resize(View v,int width,int height){ViewGroup.LayoutParams p=v.getLayoutParams();if(p.width!=width||p.height!=height){p.width=width;p.height=height;v.setLayoutParams(p);}}
    }
}
