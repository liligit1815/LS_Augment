package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.graphics.Insets;
import android.os.Handler;
import android.os.Looper;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;

/** Updates both the status-bar window and its WM-provided application insets. */
final class StatusBarWindowSizingHook {
    private static final Map<Object,Watch> WINDOWS=new WeakHashMap<>();
    private static final Map<Object,Boolean> OWNED_HEIGHTS=new WeakHashMap<>();
    private static final ThreadLocal<Boolean> NATIVE_DIMENSION=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Boolean> WINDOW_DIMENSION=ThreadLocal.withInitial(()->false);
    static int nativeHeight(Context context){
        boolean previous=NATIVE_DIMENSION.get();NATIVE_DIMENSION.set(true);
        try{return ((Number)TargetReflection.call(Class.forName("com.android.internal.policy.SystemBarUtils"),"getStatusBarHeight",context)).intValue();}
        catch(Exception unavailable){return 0;}finally{NATIVE_DIMENSION.set(previous);}
    }
    static int install(AugmentModule module,ClassLoader loader){
        int installed=0;
        try{
            Class<?> utils=Class.forName("com.android.internal.policy.SystemBarUtils",false,loader);
            for(Method m:utils.getDeclaredMethods()){
                if(!(m.getName().equals("getStatusBarHeight")||m.getName().equals("getStatusBarHeightForRotation"))
                        ||m.getReturnType()!=int.class||m.getParameterCount()<1||m.getParameterTypes()[0]!=Context.class)continue;
                module.registerFeatureHook(module.prepareFeatureHook(m,"statusbar.window."+m.getName()+m.getParameterCount(),true).intercept(chain->{
                    int original=(Integer)chain.proceed();Context c=(Context)chain.getArg(0);
                    // OEM icon padding and keyguard also call this helper. Only the
                    // status-bar window may see our enlarged application inset.
                    if(NATIVE_DIMENSION.get()||!WINDOW_DIMENSION.get())return original;
                    if(!FeatureSettings.enabled(c,ConfigSchema.SYSTEMUI_MASTER))return original;
                    int height=FeatureSettings.integer(c,ConfigSchema.STATUSBAR_HEIGHT_DP,0,0,80);
                    return height<=0?original:Math.max(original,Math.round(height*c.getResources().getDisplayMetrics().density));
                }));installed++;
            }
            Class<?> controller=SystemUiCompatibility.windowController(loader);
            module.logFeatureInfo("STATUSBAR_WINDOW_ADAPTER " + controller.getName());
            for(Method m:controller.getDeclaredMethods()){
                if(SystemUiCompatibility.windowSizing(m)){
                    // Compiled callers can inline the framework dimension helper.
                    module.deoptimize(m);
                    boolean applyHeight=m.getName().equals("applyHeight")&&m.getParameterCount()==1;
                    module.registerFeatureHook(module.prepareFeatureHook(m,"statusbar.window.sizing."+m.getName(),false).intercept(chain->{
                        boolean previous=WINDOW_DIMENSION.get();WINDOW_DIMENSION.set(true);
                        try {
                        Object result=chain.proceed(),owner=chain.getThisObject();
                        if(!applyHeight)return result;
                        try{
                            Context context=(Context)TargetReflection.field(owner,"mContext");
                            boolean enabled=FeatureSettings.enabled(context,ConfigSchema.SYSTEMUI_MASTER)
                                    &&FeatureSettings.integer(context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,0,80)>0;
                            if(enabled||OWNED_HEIGHTS.containsKey(owner)){
                                // This ROM refreshes only paramsForRotation, while WM consumes the
                                // base providedInsets for the already attached display as well.
                                WindowManager.LayoutParams params=(WindowManager.LayoutParams)TargetReflection.field(owner,"mLpChanged");
                                int height=((Number)TargetReflection.field(owner,"mBarHeight")).intValue();
                                Object providers=TargetReflection.field(params,"providedInsets");
                                if(android.os.Build.VERSION.SDK_INT>=29&&providers instanceof Object[])for(Object provider:(Object[])providers)
                                    TargetReflection.call(provider,"setInsetsSize",Insets.of(0,height,0,0));
                                if(enabled)OWNED_HEIGHTS.put(owner,true);else OWNED_HEIGHTS.remove(owner);
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
