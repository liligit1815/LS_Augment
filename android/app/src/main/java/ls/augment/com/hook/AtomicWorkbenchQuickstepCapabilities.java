package ls.augment.com.hook;

import android.content.Context;
import android.view.InputEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Native per-display repositories replace RecentsDisplayModel on newer launchers. */
final class AtomicWorkbenchQuickstepCapabilities {
    static boolean modern;
    private static Class<?> handler, observer, repository, window, manager;
    private static Method resource, repositoryGet;
    private AtomicWorkbenchQuickstepCapabilities() { }

    static Class<?> resolve(ClassLoader loader) throws Exception {
        modern=false;
        try {
            Class<?> legacy=Class.forName("com.android.quickstep.TouchInteractionService",false,loader);
            Class.forName("com.android.quickstep.fallback.window.RecentsDisplayModel",false,loader);
            HookCompatibility.inheritedMethod(legacy,void.class,false,new String[]{"onInputEvent"},InputEvent.class);
            return legacy;
        } catch (ClassNotFoundException | NoSuchMethodException absent) { /* A retained service shell is not a usable input model. */ }
        Class<?> next = Class.forName("com.android.quickstep.TouchInteractionHandler", false, loader);
        Class<?> resources = Class.forName(next.getName()+"$InputResource", false, loader);
        Class<?> repos = Class.forName("com.android.app.displaylib.PerDisplayRepository", false, loader);
        Class<?> nextObserver = Class.forName("com.android.quickstep.OverviewComponentObserver", false, loader);
        Class<?> nextWindow = Class.forName("com.android.quickstep.window.RecentsWindowManager", false, loader);
        Class<?> nextManager = Class.forName("com.android.quickstep.TaskAnimationManager", false, loader);
        if (!Context.class.isAssignableFrom(next) || !Context.class.isAssignableFrom(nextWindow))
            throw new NoSuchMethodException("per_display_context");
        HookCompatibility.method(next,void.class,false,new String[]{"onInputEvent"},InputEvent.class);
        Method nextResource=HookCompatibility.method(next,resources,false,new String[]{"getInputResource"},int.class);
        for(String name:new String[]{"mRotationTouchHelperRepository","mTaskAnimationManagerRepository","mRecentsWindowManagerRepository"})
            HookCompatibility.field(next,repos,false,name);
        HookCompatibility.field(nextObserver,repos,false,"mRecentsWindowManagerRepository");
        Method get=repos.getMethod("get",int.class);
        if(get.getReturnType()!=Object.class)throw new NoSuchMethodException("repository.get result");
        Class<?> monitor=Class.forName("com.android.systemui.shared.system.InputMonitorCompat",false,loader);
        Class<?> receiver=Class.forName("com.android.systemui.shared.system.InputChannelCompat$InputEventReceiver",false,loader);
        HookCompatibility.method(resources,monitor,true,new String[]{"f"},resources);
        HookCompatibility.method(resources,receiver,true,new String[]{"e"},resources);
        HookCompatibility.field(resources,int.class,false,"displayId");
        handler=next;observer=nextObserver;repository=repos;window=nextWindow;manager=nextManager;
        resource=nextResource;repositoryGet=get;modern=true;
        return handler;
    }

    static void installInputResources(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> type=resource.getReturnType();
        for(String name:new String[]{"e","f"}) {
            Method getter=type.getDeclaredMethod(name,type);getter.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(getter,"atomic_workbench.native_home.input_resource."+name,true).intercept(chain->{
                AtomicWorkbenchQuickstepInputHook.Route route=AtomicWorkbenchQuickstepInputHook.dispatchRoute();
                if(route!=null&&route.source==0&&route.target>0&&route.failure.isEmpty()){
                    Object owner=route.service.get();
                    if(handler.isInstance(owner)&&resource.invoke(owner,route.target)==chain.getArg(0)){
                        Object physical=resource.invoke(owner,0);
                        if(physical==null)throw new IllegalStateException("physical_input_resource_missing");
                        return chain.proceed(new Object[]{physical});
                    }
                }
                return chain.proceed();
            }));
            module.deoptimize(getter);
        }
        for(Method caller:handler.getDeclaredMethods())if(!java.lang.reflect.Modifier.isAbstract(caller.getModifiers()))module.deoptimize(caller);
    }

    static Object rotation(Object owner,int display) throws Exception {
        return repository(owner,"mRotationTouchHelperRepository",display);
    }
    static Object model(Object owner) throws Exception {
        if(!handler.isInstance(owner)&&!observer.isInstance(owner))throw new IllegalArgumentException("per_display_owner");
        return new Model(owner);
    }
    private static Object repository(Object owner,String name,int display) throws Exception {
        Class<?> type=handler.isInstance(owner)?handler:observer.isInstance(owner)?observer:null;
        if(type==null)throw new IllegalArgumentException("per_display_repository_owner");
        Field field=HookCompatibility.field(type,repository,false,name);
        Object value=field.get(owner);
        if(value==null)throw new IllegalStateException(name+" unavailable");
        return repositoryGet.invoke(value,display);
    }
    static void verifyInput(Object owner,int display) throws Exception {
        Object physical=resource.invoke(owner,0),target=resource.invoke(owner,display);
        Field id=HookCompatibility.field(resource.getReturnType(),int.class,false,"displayId");
        if(physical==null||target==null||id.getInt(physical)!=0||id.getInt(target)!=display)
            throw new IllegalStateException("per_display_input_resource_missing");
    }
    static final class Model {
        private final Object owner;
        Model(Object owner){this.owner=owner;}
        public Object getTaskAnimationManager(int display)throws Exception {
            Object value=repository(owner,"mTaskAnimationManagerRepository",display);
            if(!manager.isInstance(value))throw new IllegalStateException("native_animation_manager_missing");
            return value;
        }
        public Object getRecentsWindowManager(int display)throws Exception {
            Object value=repository(owner,"mRecentsWindowManagerRepository",display);
            if(!window.isInstance(value)||(Integer)window.getMethod("getDisplayId").invoke(value)!=display)
                throw new IllegalStateException("native_window_display_mismatch");
            return value;
        }
        public Object getFallbackWindowInterface(int display)throws Exception {
            Object value=getRecentsWindowManager(display);
            return window.getMethod("getContainerInterface").invoke(value);
        }
    }
}
