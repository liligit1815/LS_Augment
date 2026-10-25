package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Insets;
import android.os.Handler;
import android.os.Looper;
import android.view.WindowManager;
import android.view.View;
import android.view.WindowInsets;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;

/** Updates both the status-bar window and its WM-provided application insets. */
final class StatusBarWindowSizingHook {
    private static final Map<Object,Watch> WINDOWS=new WeakHashMap<>();
    private static final Map<Object,Boolean> OWNED_HEIGHTS=new WeakHashMap<>();
    // InsetsFrameProvider.hashCode includes the mutable sizes. Track weak
    // identities instead of hash keys so repeated adjustments remain reversible.
    private static final java.util.List<ProviderSizes> PROVIDER_SIZES=new java.util.ArrayList<>();
    private static final ThreadLocal<Boolean> NATIVE_DIMENSION=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Boolean> WINDOW_DIMENSION=ThreadLocal.withInitial(()->false);

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int nativeHeight(Context context){
        boolean previous=NATIVE_DIMENSION.get();NATIVE_DIMENSION.set(true);
        try{return ((Number)TargetReflection.call(Class.forName("com.android.internal.policy.SystemBarUtils"),"getStatusBarHeight",context)).intValue();}
        catch(Exception unavailable){return 0;}finally{NATIVE_DIMENSION.set(previous);}
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static int nativeHeight(Context context,int rotation)throws ReflectiveOperationException{
        boolean previous=NATIVE_DIMENSION.get();NATIVE_DIMENSION.set(true);
        try{return ((Number)TargetReflection.call(Class.forName("com.android.internal.policy.SystemBarUtils"),"getStatusBarHeightForRotation",context,rotation)).intValue();}
        finally{NATIVE_DIMENSION.set(previous);}
    }
    private static int configuredHeight(Context context){
        return FeatureSettings.enabled(context,ConfigSchema.SYSTEMUI_MASTER)
                ?FeatureSettings.integer(context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,ConfigSchema.STATUSBAR_HEIGHT_MIN_DP,ConfigSchema.STATUSBAR_HEIGHT_MAX_DP):0;
    }
    private static void applyLayoutHeight(WindowManager.LayoutParams params,int nativePx,int target,boolean launch,boolean enabled)throws ReflectiveOperationException{
        params.height=launch?WindowManager.LayoutParams.MATCH_PARENT:target;
        Object providers=TargetReflection.field(params,"providedInsets");
        if(providers instanceof Object[])for(Object provider:(Object[])providers){
            if(provider==null)continue;
            TargetReflection.call(provider,"setInsetsSize",Insets.of(0,target,0,0));
            int type=((Number)TargetReflection.call(provider,"getType")).intValue();
            // A larger gesture touch region is independent of the application
            // status-bar inset and must retain the ROM's cutout safety minimum.
            if((type&(WindowInsets.Type.statusBars()|WindowInsets.Type.tappableElement()))==0)continue;
            ProviderSizes sizes=providerSizes(provider);
            if(enabled&&sizes==null){sizes=new ProviderSizes(provider,nativePx);PROVIDER_SIZES.add(sizes);}
            if(sizes!=null){sizes.apply(provider,target,enabled);if(!enabled)PROVIDER_SIZES.remove(sizes);}
        }
    }
    private static ProviderSizes providerSizes(Object provider){
        ProviderSizes found=null;
        for(java.util.Iterator<ProviderSizes> it=PROVIDER_SIZES.iterator();it.hasNext();){
            ProviderSizes sizes=it.next();Object current=sizes.owner.get();
            if(current==null)it.remove();else if(current==provider)found=sizes;
        }
        return found;
    }
    private static void synchronizeWindow(Object owner,boolean submit)throws ReflectiveOperationException{
        Context context=(Context)TargetReflection.field(owner,"mContext");int configured=configuredHeight(context);
        boolean enabled=configured!=0;if(!enabled&&!OWNED_HEIGHTS.containsKey(owner))return;
        int nativePx=nativeHeight(context);if(nativePx<=0)throw new IllegalStateException("native_statusbar_height_unavailable");
        float density=context.getResources().getDisplayMetrics().density;
        int target=ConfigSchema.statusBarHeightPx(nativePx,configured,density);
        java.lang.reflect.Field barHeight=owner.getClass().getDeclaredField("mBarHeight");barHeight.setAccessible(true);barHeight.setInt(owner,target);
        Object state=TargetReflection.field(owner,"mCurrentState");
        boolean launch=Boolean.TRUE.equals(TargetReflection.field(state,"mIsLaunchAnimationRunning"));
        WindowManager.LayoutParams params=(WindowManager.LayoutParams)TargetReflection.field(owner,"mLpChanged");
        applyLayoutHeight(params,nativePx,target,launch,enabled);
        Object rotations=TargetReflection.field(params,"paramsForRotation");
        if(rotations instanceof WindowManager.LayoutParams[])for(int rotation=0;rotation<((WindowManager.LayoutParams[])rotations).length;rotation++){
            WindowManager.LayoutParams item=((WindowManager.LayoutParams[])rotations)[rotation];if(item==null)continue;
            int baseline=nativeHeight(context,rotation);
            applyLayoutHeight(item,baseline,ConfigSchema.statusBarHeightPx(baseline,configured,density),launch,enabled);
        }
        boolean committed=false;
        if(submit){
            // LayoutParams.copyFrom shares provider objects on these ROMs. A
            // provider-only mutation can compare equal after it already changed
            // mLp; explicitly submit the complete parameters on config refresh.
            WindowManager.LayoutParams attached=(WindowManager.LayoutParams)TargetReflection.field(owner,"mLp");
            View view=(View)TargetReflection.field(owner,"mStatusBarWindowView");
            if(attached!=null&&view.isAttachedToWindow()){
                attached.copyFrom(params);
                ((WindowManager)TargetReflection.field(owner,"mWindowManager")).updateViewLayout(view,attached);
                committed=true;
            }
        }
        if(enabled)OWNED_HEIGHTS.put(owner,true);else if(submit)OWNED_HEIGHTS.remove(owner);
        FeatureSettings.diagnostic(context,"ls_augment_statusbar_window_geometry","native="+nativePx+";target="+target+";submitted="+committed+";rotation_insets=1");
    }
    private static final class ProviderSizes {
        final WeakReference<Object> owner;final int nativePx;final Insets minimum;final Object overrides;
        ProviderSizes(Object provider,int nativePx)throws ReflectiveOperationException{
            owner=new WeakReference<>(provider);this.nativePx=nativePx;minimum=(Insets)TargetReflection.call(provider,"getMinimalInsetsSizeInDisplayCutoutSafe");
            overrides=TargetReflection.call(provider,"getInsetsSizeOverrides");
        }
        void apply(Object provider,int target,boolean enabled)throws ReflectiveOperationException{
            Insets limited=enabled&&minimum!=null?Insets.of(minimum.left,Math.min(minimum.top,target),minimum.right,minimum.bottom):minimum;
            TargetReflection.call(provider,"setMinimalInsetsSizeInDisplayCutoutSafe",limited);
            if(overrides==null)return;
            Object values=overrides;
            if(enabled){
                int count=java.lang.reflect.Array.getLength(overrides);Class<?> type=overrides.getClass().getComponentType();
                values=java.lang.reflect.Array.newInstance(type,count);
                for(int i=0;i<count;i++){
                    Object original=java.lang.reflect.Array.get(overrides,i);Insets inset=(Insets)TargetReflection.call(original,"getInsetsSize");
                    Insets changed=inset==null||inset.top==0?inset:Insets.of(inset.left,Math.max(1,inset.top+target-nativePx),inset.right,inset.bottom);
                    java.lang.reflect.Array.set(values,i,type.getConstructor(int.class,Insets.class).newInstance(((Number)TargetReflection.call(original,"getWindowType")).intValue(),changed));
                }
            }
            TargetReflection.call(provider,"setInsetsSizeOverrides",values);
        }
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader){
        int installed=0;
        try{
            Class<?> utils=Class.forName("com.android.internal.policy.SystemBarUtils",false,loader);
            for(Method m:utils.getDeclaredMethods()){
                if(!(m.getName().equals("getStatusBarHeight")||m.getName().equals("getStatusBarHeightForRotation"))
                        ||m.getReturnType()!=int.class||m.getParameterCount()<1||m.getParameterTypes()[0]!=Context.class)continue;
                module.registerFeatureHook(module.prepareFeatureHook(m,"statusbar.window."+m.getName()+m.getParameterCount(),true).intercept(chain->{
                    // Framework helpers may call one another. An offset must be
                    // applied once to the outer result, never once per nested helper.
                    boolean nativeCall=NATIVE_DIMENSION.get();int original;
                    NATIVE_DIMENSION.set(true);
                    try{original=(Integer)chain.proceed();}finally{NATIVE_DIMENSION.set(nativeCall);}
                    Context c=(Context)chain.getArg(0);
                    // OEM icon padding and keyguard also call this helper. Only the
                    // status-bar window may see our adjusted application inset.
                    if(nativeCall||!WINDOW_DIMENSION.get())return original;
                    if(!FeatureSettings.enabled(c,ConfigSchema.SYSTEMUI_MASTER))return original;
                    int height=FeatureSettings.integer(c,ConfigSchema.STATUSBAR_HEIGHT_DP,0,ConfigSchema.STATUSBAR_HEIGHT_MIN_DP,ConfigSchema.STATUSBAR_HEIGHT_MAX_DP);
                    // Component layout never changes the application inset;
                    // only the explicit status-bar height setting does.
                    return ConfigSchema.statusBarHeightPx(original,height,c.getResources().getDisplayMetrics().density);
                }));installed++;
            }
            Class<?> controller=SystemUiCompatibility.windowController(loader);
            module.logFeatureInfo("STATUSBAR_WINDOW_ADAPTER " + controller.getName());
            for(Method m:controller.getDeclaredMethods()){
                // Deoptimize callers as well as the hooked methods: apply can
                // inline applyHeight, and attach can inline the rotation builder.
                if(SystemUiCompatibility.windowSizingCaller(m))module.deoptimize(m);
                if(SystemUiCompatibility.windowSizing(m)){
                    // Compiled callers can inline the framework dimension helper.
                    module.deoptimize(m);
                    boolean applyHeight=m.getName().equals("applyHeight")&&m.getParameterCount()==1;
                    module.registerFeatureHook(module.prepareFeatureHook(m,"statusbar.window.sizing."+m.getName(),false).intercept(chain->{
                        boolean previous=WINDOW_DIMENSION.get();WINDOW_DIMENSION.set(true);
                        try {
                        Object result=chain.proceed(),owner=chain.getThisObject();
                        try{
                            if(m.getName().equals("getBarLayoutParamsForRotation")&&result instanceof WindowManager.LayoutParams){
                                Context context=(Context)TargetReflection.field(owner,"mContext");int configured=configuredHeight(context);
                                if(configured!=0){int baseline=nativeHeight(context,((Number)chain.getArg(0)).intValue());
                                    applyLayoutHeight((WindowManager.LayoutParams)result,baseline,ConfigSchema.statusBarHeightPx(baseline,configured,context.getResources().getDisplayMetrics().density),false,true);
                                }
                            }else if(applyHeight||m.getName().equals("refreshStatusBarHeight")){
                                synchronizeWindow(owner,!applyHeight);
                            }
                        }catch(Exception e){module.logFeatureError("STATUSBAR_WINDOW_INSETS",e);}
                        return result;
                        }finally{WINDOW_DIMENSION.set(previous);}
                    }));installed++;
                }
                if(!(m.getName().equals("attach")||m.getName().equals("stop"))||m.getParameterCount()!=0||m.getReturnType()!=void.class)continue;
                boolean attach=m.getName().equals("attach");
                module.registerFeatureHook(module.prepareFeatureHook(m,"statusbar.window."+m.getName(),false).intercept(chain->{
                    Object result=chain.proceed(),owner=chain.getThisObject();
                    try{
                        if(attach){Watch previous=WINDOWS.remove(owner);if(previous!=null)previous.close();
                            Watch watch=new Watch(owner,(Context)TargetReflection.field(owner,"mContext"));WINDOWS.put(owner,watch);watch.refresh();}
                        else{Watch watch=WINDOWS.remove(owner);if(watch!=null)watch.close();}
                    }catch(Exception e){module.logFeatureError("STATUSBAR_WINDOW",e);}
                    return result;
                }));installed++;
            }
        }catch(Throwable e){module.logFeatureError("STATUSBAR_WINDOW_INSTALL",e);}
        return installed;
    }
    private static final class Watch {
        final WeakReference<Object> owner;final Context context;final Handler main=new Handler(Looper.getMainLooper());
        final Runnable snapshotListener=this::refresh;final Runnable update;boolean closed;
        Watch(Object owner,Context context){this.owner=new WeakReference<>(owner);this.context=context;
            update=()->{if(closed)return;Object window=this.owner.get();if(window==null){close();return;}
                try{TargetReflection.call(window,"refreshStatusBarHeight");
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_window_height",""+TargetReflection.call(window,"getStatusBarHeight"));
                }catch(Exception e){FeatureSettings.diagnostic(context,"ls_augment_statusbar_window_error",e.getClass().getSimpleName());}};
            FeatureSettings.addSnapshotListener(context,snapshotListener);
        }
        void refresh(){main.removeCallbacks(update);main.post(update);}
        void close(){closed=true;main.removeCallbacks(update);FeatureSettings.removeSnapshotListener(snapshotListener);}
    }
}
