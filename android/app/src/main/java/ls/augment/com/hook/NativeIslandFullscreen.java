package ls.augment.com.hook;

import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Selects the OEM fullscreen engine without replacing its layout, touch region or window params. */
final class NativeIslandFullscreen {
    final Object manager,permanent;
    final Field enabled,function;
    final Method update;
    final boolean original;
    NativeIslandFullscreen(Object manager,Object permanent)throws ReflectiveOperationException {
        this.manager=manager;this.permanent=permanent;
        enabled=field(manager.getClass(),"mDynamicIslandEnable",boolean.class);
        function=field(permanent.getClass(),"mDynamicIslandFuncEnable",boolean.class);
        original=enabled.getBoolean(manager);
        update=method(permanent.getClass(),"updateDynamicIslandEnabled",boolean.class);
        field(permanent.getClass(),"mDynamicIslandRoot",View.class);
        field(permanent.getClass(),"mDynamicIslandPanelRoot",View.class);
        field(permanent.getClass(),"mDynamicIslandTouchHelper",View.class);
        field(permanent.getClass(),"mStickyAnimationView",View.class);
    }
    void validateWindow()throws ReflectiveOperationException {
        if(!(field(permanent.getClass(),"mDynamicIslandRoot",View.class).get(permanent) instanceof View)
                ||!(field(permanent.getClass(),"mDynamicIslandPanelRoot",View.class).get(permanent) instanceof View)
                ||!(field(permanent.getClass(),"mDynamicIslandTouchHelper",View.class).get(permanent) instanceof View)
                ||!(field(permanent.getClass(),"mStickyAnimationView",View.class).get(permanent) instanceof View))
            throw new IllegalStateException("fullscreen_native_views_missing");
    }
    View awaitingWindow()throws ReflectiveOperationException {
        for(String name:new String[]{"mDynamicIslandRoot","mDynamicIslandPanelRoot"}){
            View view=(View)field(permanent.getClass(),name,View.class).get(permanent);
            if(!view.isAttachedToWindow())return view;
        }
        return null;
    }
    void apply(boolean value)throws ReflectiveOperationException {
        enabled.setBoolean(manager,value);
        update.invoke(permanent,value);
        if(function.getBoolean(permanent)!=value)throw new IllegalStateException("fullscreen_function_not_applied");
    }
    void restore()throws ReflectiveOperationException {apply(original);}
    private static Field field(Class<?> type,String name,Class<?> expected)throws NoSuchFieldException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{
            Field f=c.getDeclaredField(name);
            if(!expected.isAssignableFrom(f.getType())||Modifier.isStatic(f.getModifiers()))break;
            f.setAccessible(true);return f;
        }catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException("fullscreen_"+name);
    }
    private static Method method(Class<?> type,String name,Class<?>...args)throws NoSuchMethodException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{
            Method m=c.getDeclaredMethod(name,args);
            if(m.getReturnType()!=void.class||Modifier.isStatic(m.getModifiers()))break;
            m.setAccessible(true);return m;
        }catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException("fullscreen_"+name);
    }
}
