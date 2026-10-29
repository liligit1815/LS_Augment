package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import ls.augment.com.IslandActivityPolicy;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Adapts the ROM's live_island window, scene views and animations. No overlay fallback. */
final class NativeIslandHost {
    private static final String N="com.zte.feature.dynamicisland.";
    private static final String P=SystemUiOptions.PREFIX+"island_";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());

    // The active window owns the host until release/native-owner replacement; release removes callbacks and retires ownership.
    //noinspection StaticFieldLeak
    private static NativeIslandHost active;
    private static Object initializedManager;
    private static boolean initializedByDuo;
    private static boolean panelCloseAdapterInstalled,panelTransitionsInstalled;
    private static boolean nativeSelected,baselineKnown,baselineFeature;
    private static Object nativeFeature;

    // The active window owns the host until release/native-owner replacement; release removes callbacks and retires ownership.
    //noinspection StaticFieldLeak
    private static NativeIslandHost nativeOwner;
    private static ClassLoader loader;
    private static java.lang.ref.WeakReference<View> keyguardView=new java.lang.ref.WeakReference<>(null);
    private final View phone;
    private final Context context;
    private final Runnable click,longClick;
    private final java.util.function.Consumer<Runnable> action;
    private final Map<Integer,String> dimensions=new HashMap<>();
    private final Map<View,Drawable> backgrounds=new HashMap<>();
    private final IslandPanelTransition panelTransition=new IslandPanelTransition();
    private final IslandWindowMotion windowMotion=new IslandWindowMotion();
    private String motionDiagnostic="";
    private IslandGlassBackground glassBackground;
    private String glassDiagnostic="";
    private Object feature,manager,permanent,disposable;
    private View root,container,current,music,notice,charge,chargingView,noticePanel,chargePanel;
    private boolean acquired,originalFeature,originalEnabled,flagsOverridden;
    private int width,height,offsetX,offsetY;
    private int nativeX,nativeY,nativeWidth,nativeHeight;
    private long statusBarFadeUntil;
    private String lastDiagnostic="";
    private NativeIslandScenes nativeScenes;
    private boolean nativeRequested;
    private View waitingNativeRoot;
    private View.OnAttachStateChangeListener nativeAttach;
    private final Runnable nativeAttachTimeout=()->{
        if(waitingNativeRoot!=null&&!waitingNativeRoot.isAttachedToWindow()){
            cancelNativeWait();report("native_selection_unavailable:native_window_attach_timeout");
        }
    };
    private final Runnable publish=this::publishCurrent;
    private final Runnable observe=this::observeState;
    private void observeState(){
        if(!acquired)return;
        String state="root="+describe(root)+";container="+describe(container)+";current="+describe(current)
                +";interactive="+field(permanent,"mInteractive")+";aod="+field(permanent,"mAODVisibility")
                +";keyguard="+field(permanent,"mOnKeyguard")+";enabled="+field(permanent,"mIsDynamicIslandEnable")
                +";animation="+field(permanent,"mAnimProcessing")+";panel="+expanded();
        FeatureSettings.diagnostic(context,"ls_augment_native_island_views",state);
    }

    static int install(AugmentModule module,ClassLoader classLoader){
        loader=classLoader;
        int count=hookNamed(module,loader,"native_island",N+"DynamicIslandManager","initDynamicIsland",0,(o,a,r)->
                initializedManager==o&&field(field(o,"mPermanentIslandManager"),"mDynamicIslandRoot")!=null?null:PASS,null);
        count+=hookNamed(module,loader,"native_island",N+"DynamicIslandFeature","onKeyguardStatusBarInflate",1,null,(o,a,r)->{
            if(a[0] instanceof View){keyguardView=new java.lang.ref.WeakReference<>((View)a[0]);
                if(active!=null)call(active.manager,"initKeyguardSystemIconContainer",a[0]);
                else if(nativeSelected&&initializedManager!=null)call(initializedManager,"initKeyguardSystemIconContainer",a[0]);}return PASS;
        });
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","updateKeyguardBarWidth",1,(o,a,r)->
                field(o,"mKeyguardStatus")==null?null:PASS,null);
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","onRotationStateChangedInner",1,(o,a,r)->{
            // This ROM's ordinary layout has no StickyAnimationView, but its
            // rotation runnable dereferences that full-screen-only view.
            if(o==field(initializedManager,"mPermanentIslandManager")&&field(o,"mStickyAnimationView")==null){
                set(o,"mCurRotation",a[0]);MAIN.post(()->rotateOrdinary(o,(Integer)a[0]));return null;
            }return PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","isOrientationLandscape",0,(o,a,r)->{
            NativeIslandHost h=active;return h!=null&&h.ownsSelected(o)?false:PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"islands.MediaIsland","getPanelIsland",0,(o,a,r)->{
            NativeIslandHost h=active;return h!=null&&o==h.music?field(o,"mMediaPanelIsland"):PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"DynamicPermanentIsland","updatePanelVisibility",3,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&(o==h.notice||o==h.charge)){
                boolean show=(Boolean)a[0];View panel=o==h.notice?h.noticePanel:h.chargePanel;
                try{
                    invokeStatic(N+"DynamicIslandAnimation","startPanelAlphaAnimation",new Class<?>[]{View.class,boolean.class,boolean.class},(View)o,!show,false);
                    invokeStatic(N+"DynamicIslandAnimation","startPanelAlphaAnimation",new Class<?>[]{View.class,boolean.class,boolean.class},panel,show,true);
                }catch(Exception e){h.report("panel_animation_failed:"+cause(e));}
                return null;
            }return PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","onPermanentIslandPanelCloseAnimationStart",0,(o,a,r)->{
            NativeIslandHost h=active;if(h!=null&&o==h.permanent){
                if(h.glassBackground==null)h.restoreBackgrounds();h.statusBarFadeUntil=android.os.SystemClock.uptimeMillis()+600;
                if(h.ownsSelected(o)&&NativeIslandPanelCompat.ordinary(o))
                    invokeStatic(N+"DynamicIslandAnimation","startStatusBarAnimation",new Class<?>[]{View.class,boolean.class},h.phone,true);
            }return PASS;
        },null);
        int closeAdapter=hookNamed(module,loader,"native_island_panel",N+"PermanentIslandManager","onPermanentIslandPanelCloseAnimationEnd",3,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&o==h.permanent&&h.ownsView(a[0])&&a[1] instanceof Boolean&&a[2] instanceof Boolean
                    &&NativeIslandPanelCompat.closeEnd(o,a[0],(Boolean)a[1],(Boolean)a[2],h::reportPanel)){
                MAIN.post(h::applyAppearance);MAIN.post(h.observe);return null;
            }
            return PASS;
        },null);
        panelCloseAdapterInstalled=closeAdapter>0;count+=closeAdapter;
        int closeGuard=hookNamed(module,loader,"native_island_panel",N+"DynamicIslandAnimation","startPermanentPanelCloseAnimation",3,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&o==field(h.permanent,"mDynamicAnimation")&&h.ownsView(a[0])
                    &&!h.panelTransition.prepareClose(a[0]))return null;
            return PASS;
        },null);
        count+=closeGuard;panelTransitionsInstalled=closeGuard>0;
        for(String method:new String[]{"createPermanentPanelOpenAnimation","createPermanentPanelCloseAnimation"}){
            boolean closing=method.equals("createPermanentPanelCloseAnimation");
            int tracked=hookNamed(module,loader,"native_island_panel",N+"PermanentIslandAnimation",method,-1,null,(o,a,r)->{
                NativeIslandHost h=active;
                if(h!=null&&a.length>0&&h.ownsView(a[0])&&r instanceof android.animation.Animator)
                    h.panelTransition.track(a[0],(android.animation.Animator)r,closing);
                return PASS;
            });
            count+=tracked;panelTransitionsInstalled&=tracked>0;
        }
        count+=hookNamed(module,loader,"native_island",N+"DynamicIslandAnimation","createPanelViewShapeAnimation",2,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&a[0]==field(h.music,"mDisplayImage")){
                // The stock animation accepts only RoundedBitmapDrawable. Keep its
                // position/size animation for all app artwork; our outline owns shape.
                android.animation.ValueAnimator shape=android.animation.ValueAnimator.ofFloat(0f,1f);
                shape.setDuration(350);return shape;
            }return PASS;
        },null);
        for(String method:new String[]{"onPermanentIslandPanelCloseAnimationEnd","onPermanentIslandPanelOpenAnimationEnd","onPermanentIslandAnimationEnd"})
            count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager",method,-1,null,(o,a,r)->{
                NativeIslandHost h=active;if(h!=null&&o==h.permanent){MAIN.post(h::applyAppearance);MAIN.post(h.observe);}return PASS;
            });
        count+=hookNamed(module,loader,"native_island","com.zte.utils.ResourceUtil","getDimensionPixelSizeInDefaultDpi",1,
                (o,a,r)->active==null?PASS:active.dimension((Integer)a[0]),null);
        count+=hookNamed(module,loader,"native_island","android.view.WindowManagerImpl","updateViewLayout",2,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&a[0]==h.root&&a[1] instanceof WindowManager.LayoutParams)h.window((WindowManager.LayoutParams)a[1]);
            if(a[0] instanceof View&&a[1] instanceof WindowManager.LayoutParams)
                NativeIslandScenes.adjustWindow((View)a[0],(WindowManager.LayoutParams)a[1]);
            return PASS;
        },null);
        count+=hookNamed(module,loader,"native_island_glass","android.view.View","setBackground",1,(o,a,r)->{
            NativeIslandHost h=active;
            if(h!=null&&o==h.container&&h.glassBackground!=null&&a[0]!=h.glassBackground
                    &&a[0] instanceof Drawable&&h.glassBackground.replaceNative((Drawable)a[0]))return null;
            return PASS;
        },null);
        for(String method:new String[]{"onClick","onLongClick"}){
            final boolean longPress=method.equals("onLongClick");
            count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager",method,0,(o,a,r)->{
                NativeIslandHost h=active;
                if(h!=null&&h.ownsSelected(o)){(longPress?h.longClick:h.click).run();return null;}return PASS;
            },null);
        }
        // Native observers stay registered once initialized. Gate their entry points
        // after release, and let Duo's policy own music/charging while enabled.
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","addPermanentIslandInner",1,(o,a,r)->{
            if(NativeIslandScenes.blocked(a[0]))return null;
            if(initializedByDuo&&!nativeSelected&&active==null&&o==field(initializedManager,"mPermanentIslandManager"))return null;
            NativeIslandHost h=active;
            if(h!=null&&o==h.permanent&&a[0]==field(o,"mMediaIsland"))return null;
            return PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"DisposableIslandManager","updateDynamicIslandVisibility",1,(o,a,r)->{
            if(NativeIslandScenes.blocked(a[0]))return null;
            if(initializedByDuo&&!nativeSelected&&active==null&&o==field(initializedManager,"mDisposableIslandManager"))return null;
            NativeIslandHost h=active;
            if(h!=null&&o==h.disposable&&a[0]==field(o,"mChargingIsland"))return null;
            return PASS;
        },null);
        count+=hookNamed(module,loader,"native_island",N+"PermanentIslandManager","onDynamicIslandSettingsChanged",1,null,(o,a,r)->{
            NativeIslandHost h=active;if(h!=null&&o==h.permanent){h.originalEnabled=(Boolean)a[0];set(o,"mIsDynamicIslandEnable",true);}return PASS;
        });
        return count+NativeIslandScenes.install(module,loader);
    }

    private static void rotateOrdinary(Object owner,int rotation){
        NativeIslandHost h=active;boolean ours=h!=null&&h.ownsSelected(owner);
        if(ours)h.dismiss();
        Object children=field(owner,"mDynamicPermanentContainer");
        boolean show=children instanceof ViewGroup&&((ViewGroup)children).getChildCount()>0
                &&!Boolean.TRUE.equals(field(owner,"mOnKeyguard"))
                &&!Boolean.TRUE.equals(field(owner,"mQsPanelExpanded"))
                &&!Boolean.TRUE.equals(field(owner,"mControlPanelExpanded"))
                &&(ours||rotation==0||rotation==2)&&!(initializedByDuo&&!nativeSelected&&h==null);
        for(String key:new String[]{"mDynamicIslandRoot","mDynamicIslandContainer","mDynamicPanelContainer"}){
            Object view=field(owner,key);if(view instanceof View)((View)view).setVisibility(show?View.VISIBLE:View.INVISIBLE);
        }
        try{call(owner,"updateWindowFlags",show);}catch(Exception ignored){}
        if(ours){h.geometry();h.applyAppearance();MAIN.postDelayed(h::applyAppearance,600);MAIN.postDelayed(h.observe,700);}
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    NativeIslandHost(View phone,Runnable click,Runnable longClick,java.util.function.Consumer<Runnable> action){
        this.phone=phone;context=phone.getContext();this.click=click;this.longClick=longClick;this.action=action;
        for(String name:new String[]{"dynamic_island_permanent_width","dynamic_island_layout_permanent_change_width",
                "dynamic_island_min_width","dynamic_island_layout_height","dynamic_island_layout_container_height",
                "dynamic_island_layout_container_height_status_bar","dynamic_island_app_island_text_width_long"}){
            int id=context.getResources().getIdentifier(name,"dimen","com.android.systemui");if(id!=0)dimensions.put(id,name);
        }
    }
    private Object dimension(int id){
        if(!acquired||current==null||!ownsSelected(permanent))return PASS;
        String name=dimensions.get(id);if(name==null||width<=0||height<=0)return PASS;
        if(name.endsWith("text_width_long"))return Math.max(dp(24),width-dp(56));
        return name.contains("height")?height:width;
    }
    private static Object invokeStatic(String type,String name,Class<?>[] types,Object... args)throws Exception{
        Method method=Class.forName(type,true,loader).getDeclaredMethod(name,types);method.setAccessible(true);return method.invoke(null,args);
    }
    boolean acquire(){
        if(acquired)return true;
        if(active!=null&&active!=this)return false;
        try{
            feature=invokeStatic("com.zte.base.Feature","get",new Class<?>[]{String.class},"DYNAMIC_ISLAND");
            manager=field(feature,"mDynamicIslandManager");
            permanent=field(manager,"mPermanentIslandManager");disposable=field(manager,"mDisposableIslandManager");
            if(manager==null||permanent==null||disposable==null)throw new IllegalStateException("native_manager_missing");
            Class<?> appTools=Class.forName("com.zte.tools.AppTools",true,loader);
            boolean fullscreen=appTools.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN").getBoolean(null);
            originalFeature=Boolean.TRUE.equals(call(feature,"enabled"));
            rememberBaseline(feature,originalFeature);
            android.util.Log.i("DuoNativeIsland","feature="+originalFeature+",fullscreen="+fullscreen+",root="+(field(permanent,"mDynamicIslandRoot")!=null));
            if(fullscreen)throw new IllegalStateException("fullscreen_branch_requires_adapter");
            geometry();active=this;
            if(field(permanent,"mDynamicIslandRoot")==null){
                // Remember before invoking: a partially initialized engine must never
                // be initialized a second time and register duplicate windows/listeners.
                if(initializedManager==manager)throw new IllegalStateException("native_initialization_incomplete");
                initializedManager=manager;initializedByDuo=!originalFeature;
                call(manager,"initDynamicIsland");call(manager,"registerConfigChangeListener");
            }
            root=(View)field(permanent,"mDynamicIslandRoot");container=(View)field(permanent,"mDynamicIslandContainer");
            if(root==null||container==null||!root.isAttachedToWindow())throw new IllegalStateException("native_window_missing");
            WindowManager.LayoutParams nativeParams=(WindowManager.LayoutParams)field(permanent,"mParams");
            nativeX=nativeParams.x;nativeY=nativeParams.y;nativeWidth=nativeParams.width;nativeHeight=nativeParams.height;
            originalEnabled=Boolean.TRUE.equals(field(permanent,"mIsDynamicIslandEnable"));
            call(manager,"initSystemIconContainer",phone);
            View keyguard=keyguardView.get();if(keyguard!=null)call(manager,"initKeyguardSystemIconContainer",keyguard);
            flagsOverridden=true;set(feature,"mEnabled",true);set(permanent,"mIsDynamicIslandEnable",true);
            android.os.PowerManager power=context.getSystemService(android.os.PowerManager.class);
            android.app.KeyguardManager keyguardManager=context.getSystemService(android.app.KeyguardManager.class);
            call(permanent,"onKeyguardStateChanged",keyguardManager==null||keyguardManager.isKeyguardLocked());
            if(power!=null&&power.isInteractive())NativeIslandWake.synchronize(manager,permanent);
            acquired=true;report("ready;featureBefore="+originalFeature+";bootstrapped="+initializedByDuo);
            return true;
        }catch(Exception failure){
            if(active==this)active=null;
            if(flagsOverridden){set(feature,"mEnabled",originalFeature);set(permanent,"mIsDynamicIslandEnable",originalEnabled);flagsOverridden=false;}
            if(initializedByDuo&&!originalFeature&&root!=null)root.setVisibility(View.INVISIBLE);
            android.util.Log.e("DuoNativeIsland","acquire",failure);report("unavailable:"+cause(failure));return false;
        }
    }
    private static void rememberBaseline(Object feature,boolean enabled){
        if(!baselineKnown){baselineKnown=true;baselineFeature=enabled;nativeFeature=feature;}
    }
    /** Hand back the same OEM engine without Duo events, dimensions or click handlers. */
    void selectNative(boolean selected){
        nativeRequested=selected;
        if(!selected){
            cancelNativeWait();
            if(nativeOwner==this){
                if(nativeScenes!=null){nativeScenes.close();nativeScenes=null;}
                nativeSelected=false;
                nativeOwner=null;
                set(nativeFeature,"mEnabled",baselineFeature);
                Object pm=field(initializedManager,"mPermanentIslandManager");
                if(!baselineFeature&&pm!=null)try{call(pm,"onDynamicIslandSettingsChanged",false);}catch(Exception e){report("native_exit_failed:"+cause(e));}
            }
            return;
        }
        if(nativeSelected&&nativeOwner==this){if(nativeScenes!=null)nativeScenes.configurationChanged();return;}
        if(nativeOwner!=null&&nativeOwner!=this)nativeOwner.selectNative(false);
        try{
            Object f=invokeStatic("com.zte.base.Feature","get",new Class<?>[]{String.class},"DYNAMIC_ISLAND");
            Object m=field(f,"mDynamicIslandManager"),pm=field(m,"mPermanentIslandManager");
            if(m==null||pm==null)throw new IllegalStateException("native_manager_missing");
            boolean before=Boolean.TRUE.equals(call(f,"enabled"));rememberBaseline(f,before);
            Class<?> appTools=Class.forName("com.zte.tools.AppTools",true,loader);
            if(appTools.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN").getBoolean(null))
                throw new IllegalStateException("fullscreen_branch_requires_adapter");
            if(field(pm,"mDynamicIslandRoot")==null){
                if(initializedManager==m)throw new IllegalStateException("native_initialization_incomplete");
                initializedManager=m;initializedByDuo=!before;
                call(m,"initDynamicIsland");call(m,"registerConfigChangeListener");
            }
            Object view=field(pm,"mDynamicIslandRoot");
            if(!(view instanceof View))throw new IllegalStateException("native_window_missing");
            if(!((View)view).isAttachedToWindow()){
                awaitNativeWindow((View)view);report("native_pending:window_attach");return;
            }
            cancelNativeWait();
            call(m,"initSystemIconContainer",phone);
            View keyguard=keyguardView.get();if(keyguard!=null)call(m,"initKeyguardSystemIconContainer",keyguard);
            if(!set(f,"mEnabled",true)||!Boolean.TRUE.equals(call(f,"enabled")))
                throw new IllegalStateException("native_feature_enable_not_applied");
            nativeSelected=true;nativeOwner=this;
            boolean on=android.provider.Settings.System.getInt(context.getContentResolver(),"dynamic_island_switch_state",0)!=0;
            call(pm,"onDynamicIslandSettingsChanged",on);
            android.app.KeyguardManager guard=context.getSystemService(android.app.KeyguardManager.class);
            call(pm,"onKeyguardStateChanged",guard==null||guard.isKeyguardLocked());
            android.os.PowerManager power=context.getSystemService(android.os.PowerManager.class);
            if(power!=null&&power.isInteractive())NativeIslandWake.synchronize(m,pm);
            if(nativeScenes!=null)nativeScenes.close();
            nativeScenes=null;
            if(on){nativeScenes=new NativeIslandScenes(context,loader,m,pm,(View)view);nativeScenes.start();}
            report("native_selected;enabled="+on+";feature="+call(f,"enabled")+";windowAttached=true;duo=false");
        }catch(Exception failure){
            cancelNativeWait();
            if(nativeScenes!=null){nativeScenes.close();nativeScenes=null;}
            nativeSelected=false;if(nativeOwner==this)nativeOwner=null;
            if(baselineKnown)set(nativeFeature,"mEnabled",baselineFeature);
            report("native_selection_unavailable:"+cause(failure));
        }
    }
    private void awaitNativeWindow(View view){
        if(waitingNativeRoot==view)return;
        cancelNativeWait();waitingNativeRoot=view;
        nativeAttach=new View.OnAttachStateChangeListener(){
            @Override public void onViewAttachedToWindow(View attached){
                MAIN.post(()->{if(nativeRequested&&waitingNativeRoot==attached)selectNative(true);});
            }
            @Override public void onViewDetachedFromWindow(View detached){}
        };
        view.addOnAttachStateChangeListener(nativeAttach);
        MAIN.postDelayed(nativeAttachTimeout,3000);
        if(view.isAttachedToWindow())MAIN.post(()->{if(nativeRequested)selectNative(true);});
    }
    private void cancelNativeWait(){
        MAIN.removeCallbacks(nativeAttachTimeout);
        if(waitingNativeRoot!=null&&nativeAttach!=null)waitingNativeRoot.removeOnAttachStateChangeListener(nativeAttach);
        waitingNativeRoot=null;nativeAttach=null;
    }
    void close(){selectNative(false);release();}

    void nativeForegroundChanged(){if(nativeScenes!=null)nativeScenes.foregroundChanged();}

    // Measure the host's actual system inset resource; the existing missing-ID fallback is required across OEM layouts.
    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi,InternalInsetResource
    void geometry(){
        int screen=phone.getWidth()>0?phone.getWidth():context.getResources().getDisplayMetrics().widthPixels;
        int bar=phone.getHeight();if(bar<=0){int id=context.getResources().getIdentifier("status_bar_height","dimen","android");bar=id==0?dp(34):context.getResources().getDimensionPixelSize(id);}
        width=Math.min(dp(value("width",120,96,240)),Math.max(1,screen-dp(16)));
        height=Math.min(dp(value("height",32,20,48)),Math.max(1,bar-dp(2)));
        int limit=Math.max(0,(screen-width)/2-dp(8));offsetX=Math.max(-limit,Math.min(limit,dp(value("offset_x",0,-120,120))));
        int available=Math.max(0,bar-height);offsetY=Math.max(0,Math.min(available,available/2+dp(value("offset_y",0,-24,24))));
    }
    private int value(String suffix,int fallback,int min,int max){return FeatureSettings.integer(context,P+suffix,fallback,min,max);}
    private int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private View inflate(String name)throws Exception{
        Context nativeContext=(Context)field(manager,"mContext");
        int id=nativeContext.getResources().getIdentifier(name,"layout","com.android.systemui");
        if(id==0)throw new IllegalStateException("missing_layout_"+name);
        return LayoutInflater.from(nativeContext).inflate(id,null);
    }
    private View appIsland()throws Exception{
        View view=inflate("app_island_layout");
        call(view,"initAppIsland","ls.augment.com","","",null,null,"",null,"");
        view.setContentDescription("灵动岛");return view;
    }
    private View appPanel()throws Exception{
        View view=inflate("app_island_panel_layout");call(view,"initPanelIsland","ls.augment.com","");
        view.setOnClickListener(v->click.run());return view;
    }
    boolean show(int kind,String title,String subtitle,String compact,Drawable icon,boolean playing,int battery,MediaController controller){
        if(!acquire())return false;
        try{
            geometry();View next;
            if(kind==IslandActivityPolicy.MUSIC){
                if(music==null)music=inflate("media_island_layout");
                call(music,"updateMediaData",null,playing,controller.getPackageName());
                image(music,"mDisplayImage",icon);
                Object panel=field(music,"mMediaPanelIsland");
                text(panel,"mDisplayTitle",title);text(panel,"mDisplayText",subtitle);
                Object heading=field(panel,"mDisplayTitle");
                if(heading instanceof TextView){
                    View group=(View)((TextView)heading).getParent();
                    ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)group.getLayoutParams();
                    p.setMarginStart(dp(85));p.width=dp(222);group.setLayoutParams(p);
                    ((TextView)heading).setEllipsize(android.text.TextUtils.TruncateAt.END);
                }
                set(panel,"mMediaController",controller);
                Object playPause=field(panel,"mPanelPlayPause");
                if(playPause instanceof ImageView){((ImageView)playPause).setImageResource(playing?android.R.drawable.ic_media_pause:android.R.drawable.ic_media_play);
                    ((ImageView)playPause).setImageTintList(android.content.res.ColorStateList.valueOf(android.graphics.Color.WHITE));}
                PlaybackState state=controller.getPlaybackState();long actions=state==null?0:state.getActions();
                button(panel,"mPanelPrev","上一首",(actions&PlaybackState.ACTION_SKIP_TO_PREVIOUS)!=0,()->controller.getTransportControls().skipToPrevious());
                button(panel,"mPanelNext","下一首",(actions&PlaybackState.ACTION_SKIP_TO_NEXT)!=0,()->controller.getTransportControls().skipToNext());
                button(panel,"mPanelPlayPause",playing?"暂停":"播放",(actions&(PlaybackState.ACTION_PLAY_PAUSE|(playing?PlaybackState.ACTION_PAUSE:PlaybackState.ACTION_PLAY)))!=0,
                        ()->{if(playing)controller.getTransportControls().pause();else controller.getTransportControls().play();});
                // The ROM's seek observer requires MediaData. Hide it until a native
                // session model is available; the previous Duo panel had no seek bar.
                for(String f:new String[]{"mMediaProgress","mElapsedTime","mTotalTime"}){Object v=field(panel,f);if(v instanceof View)((View)v).setVisibility(View.GONE);}
                next=music;
            }else if(kind==IslandActivityPolicy.CHARGING){
                if(charge==null){
                    charge=appIsland();chargingView=inflate("charging_island_layout");
                    ((ViewGroup)charge).removeAllViews();((ViewGroup)charge).addView(chargingView,new ViewGroup.LayoutParams(-1,-1));
                    Object views=field(charge,"mViewList");if(views instanceof java.util.List){((java.util.List)views).clear();((java.util.List)views).add(chargingView);}
                    chargePanel=appPanel();call(charge,"setPanelIsland",chargePanel);
                }
                call(chargingView,"updateViewVisibility",true,false);text(chargingView,"mDisplayTitle","充电中");text(chargingView,"mDisplayText",battery+"%");
                Object chargingIcon=field(chargingView,"mDisplayImage");
                panel(chargePanel,title,subtitle,chargingIcon instanceof ImageView?((ImageView)chargingIcon).getDrawable():icon);next=charge;
            }else{
                if(notice==null){notice=appIsland();noticePanel=appPanel();call(notice,"setPanelIsland",noticePanel);}
                call(notice,"setDisplayText",compact);image(notice,"mDisplayIcon",icon);panel(noticePanel,title,subtitle,icon);next=notice;
            }
            set(next,"mKeyguardIsland",false);set(next,"mIslandWidth",width);
            next.setContentDescription("灵动岛："+compact+"。轻点打开，长按展开");
            next.setOnClickListener(v->click.run());next.setOnLongClickListener(v->{longClick.run();return true;});
            if(current!=next){hide();current=next;MAIN.removeCallbacks(publish);MAIN.post(publish);}
            else if(next.getParent()==null&&!MAIN.hasCallbacks(publish))MAIN.post(publish);
            applyAppearance();MAIN.post(this::applyAppearance);
            MAIN.removeCallbacks(observe);MAIN.postDelayed(observe,700);
            report("native;scene="+kind+";width="+width+";height="+height+";x="+offsetX+";y="+offsetY);
            return true;
        }catch(Exception failure){android.util.Log.e("DuoNativeIsland","show",failure);hide();report("render_failed:"+cause(failure));return false;}
    }
    private void panel(View view,String title,String subtitle,Drawable icon)throws Exception{
        text(view,"mDisplayText",title);text(view,"mDisplaySecondText",subtitle);image(view,"mDisplayIcon",icon);
        Object badge=field(view,"mDisplaySmallIcon");if(badge instanceof View)((View)badge).setVisibility(View.GONE);
        for(String key:new String[]{"mDisplayText","mDisplaySecondText"}){
            Object value=field(view,key);if(value instanceof TextView){TextView t=(TextView)value;
                t.setMaxLines(key.equals("mDisplayText")?1:2);t.setEllipsize(android.text.TextUtils.TruncateAt.END);
                resize(t,dp(245),-2);
            }
        }
    }
    private void button(Object owner,String name,String description,boolean enabled,Runnable action){
        Object value=field(owner,name);if(!(value instanceof View))return;View v=(View)value;
        v.setContentDescription(description);v.setEnabled(enabled);v.setAlpha(enabled?1f:.35f);
        v.setOnClickListener(ignored->{if(acquired&&current==music&&phone.isShown())this.action.accept(action);});
    }
    private void text(Object owner,String name,String text){Object value=field(owner,name);if(value instanceof TextView){((TextView)value).setText(text);((TextView)value).setTextColor(android.graphics.Color.WHITE);}}
    private void image(Object owner,String name,Drawable icon){
        Object value=field(owner,name);if(!(value instanceof ImageView))return;ImageView v=(ImageView)value;v.setImageDrawable(icon);
        v.setOnClickListener(ignored->click.run());v.setOnLongClickListener(ignored->{longClick.run();return true;});
        applyIconShape(v,value("app_style",0,0,1)==1,dp(5));
    }
    static void applyIconShape(ImageView v,boolean circle,float corner){
        v.setOutlineProvider(new ViewOutlineProvider(){@Override public void getOutline(View view,Outline outline){
            float radius=circle?Math.min(view.getWidth(),view.getHeight())/2f:corner;outline.setRoundRect(0,0,view.getWidth(),view.getHeight(),radius);
        }});v.setClipToOutline(true);
    }
    private void window(WindowManager.LayoutParams params){
        if(!acquired)return;
        if(current==null||!ownsSelected(permanent)){
            windowMotion.restoreAll(this::reportMotion);
            params.x=nativeX;params.y=nativeY;
            if(!Boolean.TRUE.equals(field(permanent,"mDynamicPanelShowing"))){params.width=nativeWidth;params.height=nativeHeight;}
            return;
        }
        // Center-gravity width changes move the window's left edge. The OEM view animation already
        // morphs the island; a second WMS move animation replays the old left edge as a visible jump.
        windowMotion.suppress(params,this::reportMotion);
        boolean expanded=expanded();
        int screen=context.getResources().getDisplayMetrics().widthPixels;
        params.width=expanded?Math.min(dp(351),screen):Math.max(width,dp(1));
        params.x=expanded?0:offsetX;params.y=offsetY;
        if(!expanded)params.height=height;
    }
    void applyAppearance(){
        if(!acquired||current==null||active!=this||!ownsSelected(permanent))return;
        try{
            if(!expanded()){
                resize(container,width,height);resize(current,-1,-1);
                int iconSize=Math.min(dp(22),Math.max(dp(12),height-dp(4)));
                if(current==music){
                    compactView(field(music,"mDisplayImage"),iconSize,iconSize,false);
                    compactView(field(music,"mMediaContainer"),dp(27),Math.min(dp(18),height),true);
                }else if(current==notice){
                    Object icon=field(notice,"mDisplayIcon");if(icon instanceof View)resize((View)icon,iconSize,iconSize);
                }
                if(current==notice){
                    Object value=field(notice,"mDisplayText");if(value instanceof TextView){TextView text=(TextView)value;
                        text.setTextColor(android.graphics.Color.WHITE);text.setEllipsize(android.text.TextUtils.TruncateAt.END);
                        android.widget.FrameLayout.LayoutParams p=(android.widget.FrameLayout.LayoutParams)text.getLayoutParams();
                        p.width=Math.max(dp(24),width-dp(48));p.setMarginStart(dp(30));p.gravity=android.view.Gravity.START|android.view.Gravity.CENTER_VERTICAL;text.setLayoutParams(p);}
                }
            }
            int style=value("transparent",SystemUiOptions.ISLAND_BACKGROUND_CLASSIC,0,SystemUiOptions.ISLAND_BACKGROUND_GLASS);
            if(style==SystemUiOptions.ISLAND_BACKGROUND_GLASS){
                if(glassBackground==null||container.getBackground()!=glassBackground){
                    restoreBackgrounds();
                    glassBackground=IslandGlassBackground.attach(container,this::reportGlass,this::glassForeground);
                }
                if(glassBackground!=null)glassForeground(glassBackground.foregroundColor());
            }else{
                if(glassBackground!=null){glassBackground.release();glassBackground=null;}
                glassForeground(android.graphics.Color.WHITE);
                if(!expanded()&&style==SystemUiOptions.ISLAND_BACKGROUND_TRANSPARENT){
                    if(!backgrounds.containsKey(container))backgrounds.put(container,container.getBackground());container.setBackground(null);
                }else if(backgrounds.containsKey(container))container.setBackground(backgrounds.remove(container));
            }
            WindowManager.LayoutParams params=(WindowManager.LayoutParams)field(permanent,"mParams");
            if(params!=null&&root.isAttachedToWindow()){window(params);((WindowManager)field(permanent,"mWindowManager")).updateViewLayout(root,params);}
        }catch(RuntimeException failure){report("geometry_failed:"+cause(failure));}
    }
    private void compactView(Object value,int w,int h,boolean end){
        if(!(value instanceof View))return;View view=(View)value;
        if(!(view.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams))return;
        android.widget.FrameLayout.LayoutParams p=(android.widget.FrameLayout.LayoutParams)view.getLayoutParams();
        p.width=w;p.height=h;p.gravity=android.view.Gravity.TOP|(end?android.view.Gravity.END:android.view.Gravity.START);
        p.topMargin=(height-h)/2;p.bottomMargin=0;p.setMarginStart(0);p.setMarginEnd(0);view.setLayoutParams(p);
    }
    private void glassForeground(int color){
        Object mediaPanel=field(music,"mMediaPanelIsland");
        for(Object view:new Object[]{field(mediaPanel,"mDisplayTitle"),field(mediaPanel,"mDisplayText"),field(notice,"mDisplayText"),
                field(noticePanel,"mDisplayText"),field(noticePanel,"mDisplaySecondText"),field(chargePanel,"mDisplayText"),field(chargePanel,"mDisplaySecondText")}){
            if(view instanceof TextView){TextView text=(TextView)view;text.setTextColor(color);
                boolean glass=glassBackground!=null;text.setShadowLayer(glass?dp(1):0,0,0,color==android.graphics.Color.WHITE?0x88000000:0x88ffffff);}
        }
        for(String name:new String[]{"mPanelPrev","mPanelNext","mPanelPlayPause"}){
            Object view=field(mediaPanel,name);if(view instanceof ImageView)((ImageView)view).setImageTintList(android.content.res.ColorStateList.valueOf(color));
        }
    }
    private void resize(View view,int w,int h){ViewGroup.LayoutParams p=view.getLayoutParams();if(p!=null&&(p.width!=w||p.height!=h)){p.width=w;p.height=h;view.setLayoutParams(p);}}
    boolean visible(){return acquired&&current!=null&&root!=null&&root.isShown()&&(expanded()||current.isShown());}
    boolean expanded(){return ownsSelected(permanent)&&Boolean.TRUE.equals(field(permanent,"mDynamicPanelShowing"));}
    boolean ownsStatusBarFade(){return acquired&&(expanded()||android.os.SystemClock.uptimeMillis()<statusBarFadeUntil);}
    private void publishCurrent(){
        if(!acquired||current==null||active!=this)return;
        try{call(permanent,"addPermanentIslandInner",current);MAIN.post(this::applyAppearance);}
        catch(Exception e){report("publish_failed:"+cause(e));}
    }
    private boolean ownsSelected(Object owner){if(owner!=permanent||current==null)return false;try{return call(permanent,"getPermanentIsland")==current;}catch(Exception e){return false;}}
    private boolean ownsView(Object view){return view!=null&&(view==music||view==notice||view==charge);}
    void expand(){
        if(!visible()||!NativeIslandPanelCompat.canExpand(permanent,this::reportPanel))return;
        if(NativeIslandPanelCompat.ordinary(permanent)&&(!panelCloseAdapterInstalled||!panelTransitionsInstalled)){
            reportPanel("panel_capability_missing:close_hooks");return;
        }
        try{if(glassBackground==null)restoreBackgrounds();
        panelTransition.finish();
        Object panel=call(current,"getPanelIsland");
        FeatureSettings.diagnostic(context,"ls_augment_native_island_panel","request;panel="+(panel==null?"null":panel.getClass().getSimpleName())+";anim="+field(permanent,"mAnimProcessing")+";priority="+field(permanent,"mPriorityProcessing"));
        call(permanent,"showPermanentPanelIsland");MAIN.postDelayed(observe,500);
    }catch(Exception e){report("expand_failed:"+cause(e));}}
    void dismiss(){
        if(!acquired||current==null||!expanded())return;
        try{call(field(permanent,"mDynamicAnimation"),"startPermanentPanelCloseAnimation",current,false,false);}catch(Exception e){report("collapse_failed:"+cause(e));}
    }
    void hide(){
        MAIN.removeCallbacks(publish);dismiss();
        // end() dispatches the owned close callback while the manager, panel and getter hooks are still alive.
        // Removing the scene or releasing the host before that callback leaves a dangling native transition.
        try{panelTransition.finish();}catch(RuntimeException e){report("panel_finish_failed:"+cause(e));}
        restoreBackgrounds();View old=current;current=null;
        if(old!=null)try{call(permanent,"removePermanentIslandInner",old);}catch(Exception e){report("remove_failed:"+cause(e));}
    }
    private void restoreBackgrounds(){
        if(glassBackground!=null){glassBackground.release();glassBackground=null;}
        for(Map.Entry<View,Drawable> e:backgrounds.entrySet())if(e.getKey().getBackground()==null)e.getKey().setBackground(e.getValue());
        backgrounds.clear();
    }
    private void reportGlass(String value){if(!value.equals(glassDiagnostic)){glassDiagnostic=value;FeatureSettings.diagnostic(context,"ls_augment_island_glass",value);}}
    private void reportPanel(String value){
        report(value);FeatureSettings.diagnostic(context,"ls_augment_native_island_panel_lifecycle",value+";at="+android.os.SystemClock.elapsedRealtime());
    }
    private void reportMotion(String value){
        if(!value.equals(motionDiagnostic)){motionDiagnostic=value;FeatureSettings.diagnostic(context,"ls_augment_native_island_motion",value);}
    }
    void release(){
        MAIN.removeCallbacks(observe);if(!acquired)return;hide();restoreBackgrounds();
        windowMotion.restoreAll(this::reportMotion);acquired=false;if(active==this)active=null;
        set(feature,"mEnabled",originalFeature);set(permanent,"mIsDynamicIslandEnable",originalEnabled);flagsOverridden=false;
        Object params=field(permanent,"mParams");if(params instanceof WindowManager.LayoutParams){WindowManager.LayoutParams p=(WindowManager.LayoutParams)params;p.x=nativeX;p.y=nativeY;p.width=nativeWidth;p.height=nativeHeight;}
        try{call(permanent,"updateResources");call(permanent,"updateDynamicWindowParams");}catch(Exception e){report("restore_failed:"+cause(e));}
        if(initializedByDuo&&!originalFeature&&root!=null)root.setVisibility(View.INVISIBLE);
        report("released;featureRestored="+originalFeature);
        FeatureSettings.diagnostic(context,"ls_augment_native_island_views","released");
    }
    private static String cause(Throwable e){while(e.getCause()!=null)e=e.getCause();return e.getClass().getSimpleName()+":"+e.getMessage();}
    private static String describe(View v){if(v==null)return "null";int[] xy=new int[2];v.getLocationOnScreen(xy);
        return v.getClass().getSimpleName()+","+v.getVisibility()+","+v.isShown()+","+v.getAlpha()+","+xy[0]+","+xy[1]+","+v.getWidth()+"x"+v.getHeight();}
    private void report(String value){if(!value.equals(lastDiagnostic)){lastDiagnostic=value;FeatureSettings.diagnostic(context,"ls_augment_native_island",value);android.util.Log.i("DuoNativeIsland",value);}}
}
