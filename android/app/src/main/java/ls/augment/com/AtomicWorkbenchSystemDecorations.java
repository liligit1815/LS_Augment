package ls.augment.com;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Attested mutable (older WMS) and creation-flag (newer WMS) display policies. */
public final class AtomicWorkbenchSystemDecorations {
    private AtomicWorkbenchSystemDecorations() {}
    private static Method method(Object service,String name,Class<?> result,Class<?>... parameters) throws Exception {
        Method m=service.getClass().getMethod(name,parameters);
        if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(name+" signature");
        m.setAccessible(true);return m;
    }
    private static Method setter(Object service) throws Exception {
        try{return method(service,"setShouldShowSystemDecors",void.class,int.class,boolean.class);}
        catch(NoSuchMethodException absent){
            // A changed signature is not a supported immutable-policy interface.
            for(Method m:service.getClass().getMethods())if(m.getName().equals("setShouldShowSystemDecors"))throw absent;
            return null;
        }
    }
    public static boolean requiresCreationFlag(Object service) throws Exception {
        method(service,"shouldShowSystemDecors",boolean.class,int.class);
        return setter(service)==null;
    }
    public static void enable(Object service,int display) throws Exception {
        Method read=method(service,"shouldShowSystemDecors",boolean.class,int.class),write=setter(service);
        if(write!=null)write.invoke(service,display,true);
        if(!Boolean.TRUE.equals(read.invoke(service,display)))throw new IllegalStateException("系统未启用该工作区的原生导航栏");
    }
    public static void release(Object service,int display) throws Exception {
        Method write=setter(service);
        if(write!=null)write.invoke(service,display,false);
        else {
            // Creation flags last for the owned display's lifetime. HOME has already
            // returned to display 0; the owner releases the virtual display itself.
            method(service,"shouldShowSystemDecors",boolean.class,int.class).invoke(service,display);
        }
    }
    public static Object windowService() throws Exception {
        try {
            Class<?> manager=Class.forName("android.os.ServiceManager");
            Class<?> binder=Class.forName("android.os.IBinder");
            Class<?> window=Class.forName("android.view.IWindowManager");
            Method get=manager.getDeclaredMethod("getService",String.class);
            Method wrap=Class.forName("android.view.IWindowManager$Stub").getDeclaredMethod("asInterface",binder);
            get.setAccessible(true);wrap.setAccessible(true);
            Object token=get.invoke(null,"window");
            if(token==null||!binder.isInstance(token))throw new IllegalStateException("窗口 Binder 服务不可用");
            Object service=wrap.invoke(null,token);
            if(service==null||!window.isInstance(service))throw new IllegalStateException("窗口 Binder 接口不匹配");
            return service;
        }catch(ClassNotFoundException|NoSuchMethodException unavailable){
            // Retain the older interface. Do not turn a failed service call into a
            // second call through WindowManagerGlobal's app-only initialization.
            Object service=Class.forName("android.view.WindowManagerGlobal").getDeclaredMethod("getWindowManagerService").invoke(null);
            if(service==null)throw new IllegalStateException("窗口服务不可用");return service;
        }
    }
}
