package ls.augment.com.hook;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/** A terminated OEM sampler cannot be the current thread. Never restart or move its work. */
final class WifiSampleThreadHook {
    private static final String OWNER="com.android.server.wifi.WifiSpeedTestLowLatencyController";
    private static final Set<Class<?>> INSTALLED=Collections.newSetFromMap(new WeakHashMap<>());
    // Method reflection objects are ephemeral; deduplicate by the defining Class,
    // which stays live for as long as the hooked service-manager loader does.
    private static final Set<Class<?>> DISCOVERY=Collections.newSetFromMap(new WeakHashMap<>());


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized int install(AugmentModule module,ClassLoader loader) {
        int count=installController(module,loader);
        try {
            Class<?> manager=Class.forName("com.android.server.SystemServiceManager",false,loader);
            Class<?> service=Class.forName("com.android.server.SystemService",false,loader);
            Method start=manager.getDeclaredMethod("startServiceFromJar",String.class,String.class);
            if(start.getReturnType()!=service||Modifier.isStatic(start.getModifiers())||Modifier.isAbstract(start.getModifiers()))
                throw new NoSuchMethodException("startServiceFromJar(String,String):SystemService");
            if(DISCOVERY.contains(manager))return count;
            module.registerFeatureHook(module.prepareFeatureHook(start,"wifi.sampler.apex_loader",false).intercept(chain->{
                Object result=chain.proceed();
                if(result!=null&&result.getClass().getName().startsWith("com.android.server.wifi."))
                    installController(module,result.getClass().getClassLoader());
                return result;
            }));
            DISCOVERY.add(manager);count++;
        }catch(ClassNotFoundException absent){/* Direct loader path is enough on older monolithic services. */}
        catch(Throwable missing){module.logFeatureError("WIFI_SAMPLER_LOADER_CONTRACT",missing);}
        return count;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static synchronized int installController(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> type=Class.forName(OWNER,false,loader);
            if(INSTALLED.contains(type))return 0;
            Method query=type.getDeclaredMethod("isOnSampleThread");
            Method dispatch=type.getDeclaredMethod("runOnSampleThread",Runnable.class);
            if(query.getReturnType()!=boolean.class||dispatch.getReturnType()!=void.class
                    ||Modifier.isStatic(query.getModifiers())||Modifier.isAbstract(query.getModifiers())
                    ||Modifier.isStatic(dispatch.getModifiers())||Modifier.isAbstract(dispatch.getModifiers()))
                throw new NoSuchMethodException("Wi-Fi sample-thread query/dispatch");
            Field thread=type.getDeclaredField("mSampleThread"),handler=type.getDeclaredField("mSampleHandler");
            if(thread.getType()!=HandlerThread.class||handler.getType()!=Handler.class
                    ||Modifier.isStatic(thread.getModifiers())||Modifier.isStatic(handler.getModifiers()))
                throw new NoSuchFieldException("Wi-Fi sample-thread ownership");
            thread.setAccessible(true);handler.setAccessible(true);
            AtomicBoolean reported=new AtomicBoolean();
            // Finish deoptimization before publishing the hook: a failure cannot leave
            // an untracked partial installation that is registered again on discovery.
            for(Method caller:type.getDeclaredMethods())if(!Modifier.isNative(caller.getModifiers())
                    &&!Modifier.isAbstract(caller.getModifiers())&&!module.deoptimize(caller))
                throw new IllegalStateException("Wi-Fi sampler deoptimization rejected: "+caller.toGenericString());
            module.registerFeatureHook(module.prepareFeatureHook(query,"wifi.sampler.terminated",true).intercept(chain->{
                Object owner=chain.getThisObject();
                if(terminated(owner,thread,handler)) { report(module,reported);return false; }
                try{return chain.proceed();}
                catch(NullPointerException race) {
                    // quitSafely may finish between the first check and OEM getLooper().
                    if(!terminated(owner,thread,handler))throw race;
                    report(module,reported);return false;
                }
            }));
            INSTALLED.add(type);module.logFeatureInfo("WIFI_SAMPLER_READY terminated_thread_only=true");return 1;
        }catch(ClassNotFoundException absent){
            try { module.logFeatureInfo("WIFI_SAMPLER_CLASS_NOT_VISIBLE owner="+OWNER
                    +" loader="+(loader==null?"boot":loader.getClass().getName())); }
            catch(Throwable unavailable){ /* A missing optional contract must remain native. */ }
            return 0;
        }
        catch(Throwable missing){module.logFeatureError("WIFI_SAMPLER_CONTRACT_MISSING",missing);return 0;}
    }

    static boolean terminated(Object owner,Field threadField,Field handlerField) {
        try {
            HandlerThread thread=(HandlerThread)threadField.get(owner);
            Handler handler=(Handler)handlerField.get(owner);
            Looper retained=handler==null?null:handler.getLooper();
            return thread!=null&&retained!=null&&retained.getThread()==thread
                    &&thread.getState()==Thread.State.TERMINATED&&!thread.isAlive()&&thread.getLooper()==null;
        }catch(ReflectiveOperationException|RuntimeException unavailable){return false;}
    }
    private static void report(AugmentModule module,AtomicBoolean reported) {
        if(reported.compareAndSet(false,true)) {
            try {
                module.logFeatureInfo("WIFI_SAMPLER_TERMINATED native_post_remains_closed=true");
                FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_wifi_sampler_guard","terminated;native_post_remains_closed=1");
            } catch (Throwable unavailable) { /* Reporting must not reintroduce a system-server crash. */ }
        }
    }
    private WifiSampleThreadHook(){}
}
