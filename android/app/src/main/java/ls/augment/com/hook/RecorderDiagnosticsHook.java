package ls.augment.com.hook;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.StartupDiagnostics;

/** Read-only lifecycle witnesses. No intent contents, display titles, or frame data. */
final class RecorderDiagnosticsHook {
    private static final Set<Method> INSTALLED=Collections.newSetFromMap(new WeakHashMap<>());
    private static final java.util.Map<IBinder,Integer> DISPLAYS=new WeakHashMap<>();
    private static int events;
    private RecorderDiagnosticsHook(){}
    static synchronized void install(AugmentModule module,ClassLoader loader,boolean server){
        String[] owners=server?new String[]{"com.android.server.display.DisplayManagerService","com.android.server.display.VirtualDisplayAdapter$VirtualDisplayDevice"}
                :new String[]{"com.android.ztescreenshot.recordscreen.RecordscreenService","com.android.ztescreenshot.recordscreen.RecordscreenServiceNew"};
        for(String name:owners)try{
            Class<?> type=Class.forName(name,false,loader);
            for(Method method:type.getDeclaredMethods()){
                if(!(server?displayMethod(method):serviceMethod(method))||!INSTALLED.add(method))continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"recorder.diagnostics."+method.getName(),true).intercept(chain->{
                    Object[] args=chain.getArgs().toArray();
                    if(method.getName().equals("binderDied")||method.getName().equals("destroyLocked"))args=new Object[]{ownedToken(chain.getThisObject())};
                    String detail=describe(method,args);
                    record("RECORDER_LIFECYCLE_ENTER",detail,null);
                    Object result;
                    try{result=chain.proceed();}
                    catch(Throwable nativeFailure){record("RECORDER_LIFECYCLE_THROW",detail,nativeFailure);throw nativeFailure;}
                    try{
                        if(method.getName().equals("createVirtualDisplayInternal")&&result instanceof Integer id){
                            IBinder token=token(args);if(token!=null&&id>=0)synchronized(DISPLAYS){DISPLAYS.put(token,id);}
                            detail+=";display="+id;
                        }else if(method.getName().equals("releaseVirtualDisplayInternal")||method.getName().equals("binderDied")||method.getName().equals("destroyLocked")){
                            IBinder token=token(args);synchronized(DISPLAYS){detail+=";display="+DISPLAYS.remove(token);}
                        }
                    }catch(RuntimeException ignored){detail+=";identity=unavailable";}
                    record("RECORDER_LIFECYCLE_RETURN",detail,null);return result;
                }));
            }
        }catch(ReflectiveOperationException missing){record("RECORDER_DIAGNOSTICS_MISSING",name,missing);}
    }
    static boolean displayMethod(Method m){
        if(java.lang.reflect.Modifier.isStatic(m.getModifiers()))return false;
        Class<?>[] p=m.getParameterTypes();
        if(m.getDeclaringClass().getName().equals("com.android.server.display.VirtualDisplayAdapter$VirtualDisplayDevice"))
            return m.getReturnType()==void.class&&(m.getName().equals("binderDied")&&p.length==0
                    ||m.getName().equals("destroyLocked")&&p.length==1&&p[0]==boolean.class);
        if(m.getName().equals("releaseVirtualDisplayInternal"))return m.getReturnType()==void.class&&p.length==1&&p[0]==IBinder.class;
        if(!m.getName().equals("createVirtualDisplayInternal")||m.getReturnType()!=int.class||p.length<4)return false;
        return p[0].getName().equals("android.hardware.display.VirtualDisplayConfig")
                &&p[1].getName().equals("android.hardware.display.IVirtualDisplayCallback");
    }
    static boolean serviceMethod(Method m){
        if(java.lang.reflect.Modifier.isStatic(m.getModifiers()))return false;
        Class<?>[] p=m.getParameterTypes();String n=m.getName();
        return (n.equals("onCreate")||n.equals("onDestroy"))&&p.length==0&&m.getReturnType()==void.class
                ||n.equals("onStartCommand")&&m.getReturnType()==int.class&&p.length==3&&p[0]==android.content.Intent.class&&p[1]==int.class&&p[2]==int.class
                ||n.equals("onTaskRemoved")&&m.getReturnType()==void.class&&p.length==1&&p[0]==android.content.Intent.class;
    }
    private static IBinder token(Object[] args){
        for(Object arg:args)if(arg instanceof IInterface i)return i.asBinder();else if(arg instanceof IBinder b)return b;
        return null;
    }
    private static IBinder ownedToken(Object owner){
        if(owner==null)return null;
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{
            java.lang.reflect.Field f=type.getDeclaredField("mAppToken");
            if(!IBinder.class.isAssignableFrom(f.getType()))return null;
            f.setAccessible(true);return (IBinder)f.get(owner);
        }catch(ReflectiveOperationException|RuntimeException missing){/* Keep native death/cleanup even without token metadata. */}
        return null;
    }
    private static String describe(Method m,Object[] args){
        try{
            StringBuilder d=new StringBuilder("owner=").append(m.getDeclaringClass().getName()).append(";method=").append(m.getName()).append(";callerUid=").append(Binder.getCallingUid());
            IBinder token=token(args);if(token!=null){d.append(";token=").append(System.identityHashCode(token));
                synchronized(DISPLAYS){Integer id=DISPLAYS.get(token);if(id!=null)d.append(";knownDisplay=").append(id);}}
            if(m.getName().equals("createVirtualDisplayInternal")){
                for(Object a:args)if(a instanceof String s&&s.matches("[a-zA-Z][a-zA-Z0-9_.]{0,180}"))d.append(";package=").append(s);
                Object config=args[0];for(String field:new String[]{"getFlags","getDisplayIdToMirror","getWidth","getHeight"})try{
                    Method read=config.getClass().getMethod(field);if(read.getReturnType()==int.class)d.append(';').append(field).append('=').append(read.invoke(config));
                }catch(ReflectiveOperationException unavailable){d.append(';').append(field).append("=unknown");}
            }
            return d.toString();
        }catch(RuntimeException failure){return "method="+m.getName()+";metadata=unavailable";}
    }
    private static synchronized void record(String stage,String detail,Throwable error){
        if(events++<512)StartupDiagnostics.record(stage,detail,error);
        else if(events==513)StartupDiagnostics.record("RECORDER_DIAGNOSTICS_LIMIT","limit=512;remaining_events_omitted=true",null);
    }
}
