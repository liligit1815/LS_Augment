package ls.augment.com.hook;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** A native animation keeps its callback even after the selected host changes. Main-thread only. */
final class IslandPanelGuard {
    private static final WeakHashMap<Object, Ownership> OWNERS = new WeakHashMap<>();
    private static long sequence;
    private static final String CLOSE = "onPermanentIslandPanelCloseAnimationEnd";
    private static final class Ownership {
        final WeakReference<Object> manager;
        final Runnable completed;
        final long id = ++sequence;
        boolean withdrawing, ended;
        Ownership(Object owner,Runnable done) { manager=new WeakReference<>(owner);completed=done; }
    }

    static boolean prepare(Object owner,Object island,Runnable completed) {
        if (owner==null || island==null) return false;
        if (!NativeIslandPanelCompat.canExpand(owner,message -> event("ISLAND_PANEL_CAPABILITY",message,owner,island))) return false;
        if (!NativeIslandPanelCompat.ordinary(owner)) {
            event("ISLAND_PANEL_BRANCH","expand_native",owner,island);return true;
        }
        try {
            Object animation=field(owner,"mDynamicAnimation"), factory=field(animation,"mPermanentAnimation");
            if (factory==null) throw new NoSuchFieldException("mPermanentAnimation:instance");
            Field callback=find(factory.getClass(),"mCallback");
            Class<?> contract=callback.getType();
            if (!contract.isInterface() || Modifier.isStatic(callback.getModifiers()) || Modifier.isFinal(callback.getModifiers()))
                throw new NoSuchFieldException("mCallback:mutable_interface");
            Method close=null;
            for (Method method:contract.getMethods()) {
                Class<?>[] p=method.getParameterTypes();
                if (method.getName().equals(CLOSE) && method.getReturnType()==void.class && p.length==3
                        && p[0].getName().equals("com.zte.feature.dynamicisland.DynamicPermanentIsland")
                        && p[0].isInstance(island) && p[1]==boolean.class && p[2]==boolean.class) close=method;
            }
            if (close==null || !contract.isInstance(owner)) throw new NoSuchMethodException("animation_callback_close:signature");
            Object current=callback.get(factory);
            Bridge existing=current!=null && Proxy.isProxyClass(current.getClass())
                    && Proxy.getInvocationHandler(current) instanceof Bridge ? (Bridge)Proxy.getInvocationHandler(current):null;
            if (existing==null || existing.owner!=owner) {
                // Never wrap a foreign callback or infer ownership from a model/version name.
                if (current!=owner) throw new IllegalStateException("animation_callback_owner_mismatch");
                Object proxy=Proxy.newProxyInstance(contract.getClassLoader(),new Class<?>[]{contract},new Bridge(owner,close));
                callback.set(factory,proxy);
                if (callback.get(factory)!=proxy) throw new IllegalStateException("animation_callback_readback");
                FeatureRuntimeLog.event("ISLAND_PANEL_CAPABILITY","factory="+factory.getClass().getName()
                        +";callback="+contract.getName()+";route=owned_callback_bridge");
            }
            OWNERS.put(island,new Ownership(owner,completed));
            event("ISLAND_PANEL_OPEN","prepared",owner,island);
            return true;
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            FeatureRuntimeLog.event("ISLAND_PANEL_CAPABILITY","state=unavailable;exception="+FeatureRuntimeLog.failure(unavailable)
                    +";detail="+unavailable.getMessage()+";"+snapshot(owner,island));
            return false;
        }
    }

    static boolean owns(Object owner,Object island) {
        Ownership record=OWNERS.get(island);return record!=null && record.manager.get()==owner;
    }
    static void withdrawing(Object owner,Object island) {
        Ownership record=OWNERS.get(island);
        if(record!=null && record.manager.get()==owner) { record.withdrawing=true;event("ISLAND_PANEL_CLOSE_REQUEST","withdraw",owner,island); }
    }
    static boolean close(Object owner,Object island,boolean remove,boolean disposable,String source) {
        Ownership record=OWNERS.get(island);
        if(record==null || record.manager.get()!=owner) {
            event("ISLAND_PANEL_BRANCH",source+":native_unowned",owner,island);return false;
        }
        if(record.ended) { event("ISLAND_PANEL_BRANCH",source+":duplicate_end",owner,island);return true; }
        event("ISLAND_PANEL_CLOSE_END",source+":enter;remove="+remove+";withdraw="+record.withdrawing+";disposable="+disposable,owner,island);
        boolean handled=NativeIslandPanelCompat.closeEnd(owner,island,remove||record.withdrawing,disposable,
                message -> event("ISLAND_PANEL_RESULT",message,owner,island));
        if(handled)record.ended=true;
        event("ISLAND_PANEL_BRANCH",source+(handled?":owned_handled":":native_contract"),owner,island);
        if(handled && record.completed!=null) try { record.completed.run(); }
        catch(RuntimeException failure) { FeatureRuntimeLog.event("ISLAND_PANEL_OBSERVE_ERROR","exception="+FeatureRuntimeLog.failure(failure)); }
        return handled;
    }
    static void event(String stage,String reason,Object owner,Object island) {
        FeatureRuntimeLog.event(stage,"reason="+reason+";"+snapshot(owner,island));
    }
    private static String snapshot(Object owner,Object island) {
        Ownership record=OWNERS.get(island);Object selected=null;
        try { selected=call(owner,"getPermanentIsland"); } catch(ReflectiveOperationException | RuntimeException ignored) { }
        return "transition="+(record==null?0:record.id)+";owner="+identity(owner)+";island="+identity(island)
                +";owned="+(record!=null&&record.manager.get()==owner)+";selected="+(selected==island)
                +";panelRoot="+(field(owner,"mDynamicIslandPanelRoot")!=null)
                +";container="+(field(owner,"mDynamicPanelContainer")!=null)
                +";showing="+field(owner,"mDynamicPanelShowing")+";closing="+field(owner,"mDynamicPanelClosing")
                +";temporary="+(field(owner,"mTempIsland")==island);
    }
    private static String identity(Object value) { return value==null?"null":value.getClass().getSimpleName()+"@"+Integer.toHexString(System.identityHashCode(value)); }
    private static Field find(Class<?> type,String name)throws NoSuchFieldException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try { Field f=c.getDeclaredField(name);f.setAccessible(true);return f; }
        catch(NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(name);
    }

    private static final class Bridge implements InvocationHandler {
        final Object owner;
        final Method close;
        Bridge(Object owner,Method close) { this.owner=owner;this.close=close; }
        @Override public Object invoke(Object proxy,Method method,Object[] args)throws Throwable {
            if(method.getDeclaringClass()==Object.class) {
                if(method.getName().equals("equals"))return proxy==args[0];
                if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                if(method.getName().equals("toString"))return "DuoPanelCallback";
            }
            boolean ending=method.equals(close);
            if(ending && IslandPanelGuard.close(owner,args[0],(Boolean)args[1],(Boolean)args[2],"animation_callback")) return null;
            if(method.getName().equals("onPermanentIslandPanelCloseAnimationStart"))
                event("ISLAND_PANEL_CLOSE_START","native_animation",owner,field(owner,"mTempIsland")!=null?field(owner,"mTempIsland"):selected());
            try { return method.invoke(owner,args); }
            catch(InvocationTargetException failure) {
                FeatureRuntimeLog.event("ISLAND_PANEL_NATIVE_ERROR","method="+method.getName()+";exception="+FeatureRuntimeLog.failure(failure)
                        +";"+snapshot(owner,ending?args[0]:selected()));
                throw failure.getCause(); // Foreign/fullscreen failures preserve their original exception.
            }
        }
        private Object selected() { try{return call(owner,"getPermanentIsland");}catch(ReflectiveOperationException ignored){return null;} }
    }
    private IslandPanelGuard() { }
}
