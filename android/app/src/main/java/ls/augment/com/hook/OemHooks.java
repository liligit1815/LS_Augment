package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import io.github.libxposed.api.XposedInterface.Hooker;
import java.lang.reflect.*;
import java.util.*;
import org.json.JSONObject;

/** Exact named adapters, with separate registration and enabled execution evidence. */
final class OemHooks {
    private static final Map<Method,Set<String>> INSTALLED = new HashMap<>();
    private static final Map<String,String> STATUS = Collections.synchronizedMap(new LinkedHashMap<>());
    private static final Set<String> EXECUTED = Collections.synchronizedSet(new HashSet<>());
    private static boolean publishScheduled;
    private OemHooks() { }

    static int methods(AugmentModule module, ClassLoader loader, String className, String name,
            Class<?> returnType, int argc, String key, Hooker hooker) {
        int count=0;
        try {
            Class<?> type=Class.forName(className,false,loader);
            for(Method m:type.getDeclaredMethods()) {
                if(!m.getName().equals(name)||(returnType!=null&&m.getReturnType()!=returnType)
                        ||(argc>=0&&m.getParameterCount()!=argc)||Modifier.isAbstract(m.getModifiers())) continue;
                synchronized(INSTALLED) {
                    Set<String> keys=INSTALLED.computeIfAbsent(m,ignored->new HashSet<>());
                    if(keys.contains(key)){count++;continue;}
                    m.setAccessible(true);
                    module.registerFeatureHook(module.prepareFeatureHook(m,"rm."+key+"."+className+"."+name+"."+Integer.toHexString(m.toGenericString().hashCode()),false).intercept(chain->{
                        // Ungated adapters (notably SystemProperties.getInt) must filter their
                        // arguments before doing any context lookup during system bootstrap.
                        Context context=null;
                        if(!key.isEmpty()) {
                            context=context(chain.getThisObject(),chain.getArgs());
                            if(!FeatureSettings.enabled(context,key)) return chain.proceed();
                        }
                        Object result=hooker.intercept(chain);
                        if(!key.isEmpty()&&EXECUTED.add(key)) {STATUS.put(key,"executed");publish(context);}
                        return result;
                    }));
                    keys.add(key);count++;
                }
            }
        } catch(Throwable error) {module.logFeatureError("RM_LOOKUP "+className+"."+name,error);}
        if(!key.isEmpty()) {
            synchronized(STATUS) {
                if(count>0&&!EXECUTED.contains(key)) STATUS.put(key,"registered");
                else if(count==0&&!STATUS.containsKey(key)) STATUS.put(key,"unmatched");
            }
            schedulePublish();
        }
        return count;
    }
    static int result(AugmentModule module,ClassLoader loader,String type,String method,
            Class<?> resultType,int argc,String key,Object result) {
        return methods(module,loader,type,method,resultType,argc,key,chain->result);
    }
    static Context context(Object owner,List<Object> args) {
        Context c=FeatureSettings.from(owner);
        if(c==null&&args!=null) for(Object arg:args) if(arg instanceof Context){c=(Context)arg;break;}
        return c;
    }
    static Object field(Object owner,String... names) {
        if(owner==null)return null;
        for(String name:names)for(Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();c!=null;c=c.getSuperclass())try {
            Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner instanceof Class?null:owner);
        } catch(ReflectiveOperationException|RuntimeException ignored) { }
        return null;
    }
    static boolean set(Object owner,Object value,String... names) {
        if(owner==null)return false;
        for(String name:names)for(Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();c!=null;c=c.getSuperclass())try {
            Field f=c.getDeclaredField(name);f.setAccessible(true);f.set(owner instanceof Class?null:owner,value);return true;
        } catch(ReflectiveOperationException|RuntimeException ignored) { }
        return false;
    }
    static Object invoke(Object owner,String name,Object... args) throws ReflectiveOperationException {
        if(owner==null)throw new NoSuchMethodException(name);
        for(Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();c!=null;c=c.getSuperclass())
            for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&compatible(m.getParameterTypes(),args)) {
                m.setAccessible(true);return m.invoke(owner instanceof Class?null:owner,args);
            }
        throw new NoSuchMethodException(name);
    }
    private static boolean compatible(Class<?>[] types,Object[] args) {
        if(types.length!=args.length)return false;
        for(int i=0;i<types.length;i++) {
            if(args[i]==null){if(types[i].isPrimitive())return false;continue;}
            Class<?> t=types[i];
            if(t.isPrimitive())t=t==int.class?Integer.class:t==long.class?Long.class:t==boolean.class?Boolean.class:
                    t==float.class?Float.class:t==double.class?Double.class:t==byte.class?Byte.class:t==short.class?Short.class:Character.class;
            if(!t.isInstance(args[i]))return false;
        }
        return true;
    }
    static Object defaultResult(Class<?> type) {
        if(!type.isPrimitive()||type==void.class)return null;
        if(type==boolean.class)return false;if(type==long.class)return 0L;
        if(type==float.class)return 0f;if(type==double.class)return 0d;return 0;
    }
    private static synchronized void schedulePublish() {
        if(publishScheduled||Looper.getMainLooper()==null)return;publishScheduled=true;
        Handler h=new Handler(Looper.getMainLooper());
        h.postDelayed(new Runnable(){int attempts;public void run(){
            Context c=FeatureSettings.from(null);
            if(c!=null){publish(c);publishScheduled=false;}
            else if(++attempts<30)h.postDelayed(this,1000);else publishScheduled=false;
        }},1000);
    }
    private static void publish(Context context) {
        if(context==null)return;
        Map<String,String> copy; synchronized(STATUS){copy=new LinkedHashMap<>(STATUS);}
        FeatureSettings.diagnostic(context,"ls_augment_rm_support_"+context.getPackageName(),new JSONObject(copy).toString());
    }
}
