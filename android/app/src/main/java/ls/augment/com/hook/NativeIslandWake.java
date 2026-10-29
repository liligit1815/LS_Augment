package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/** Resolve OEM wake contracts without fabricating lifecycle state. */
final class NativeIslandWake {
    static String synchronize(Object manager,Object permanent)throws ReflectiveOperationException {
        boolean incompatibleWake=false;
        for(Object owner:new Object[]{manager,permanent}) {
            if(owner==null)continue;
            for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try {
                Method method=type.getDeclaredMethod("onStartedWakingUp");
                if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers())){incompatibleWake=true;break;}
                method.setAccessible(true);method.invoke(owner);
                return owner==manager?"manager":"permanent";
            }catch(NoSuchMethodException absent){/* Continue through OEM subclasses. */}
        }
        // Older OEM engines have no interactive flag or wake callback. Their
        // visibility is driven by AOD, rotation and policy through this method.
        // Do not use it on a newer/unknown engine: refreshing visibility alone
        // cannot update the newer engine's mInteractive state.
        if(!incompatibleWake&&permanent!=null&&!hasField(permanent.getClass(),"mInteractive")) {
            Class<?> type=permanent.getClass();
            field(type,"mAODVisibility",boolean.class);
            field(type,"mIsDynamicIslandEnable",boolean.class);
            field(type,"mPayJoyControlled",boolean.class);
            field(type,"mCurRotation",int.class);
            method(type,"setAODVisibility",boolean.class);
            method(type,"updateRooterVisibility").invoke(permanent);
            return "permanent_visibility";
        }
        throw new NoSuchMethodException("native wake: manager/permanent onStartedWakingUp():void and legacy AOD visibility contract unavailable");
    }
    private static boolean hasField(Class<?> type,String name) {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try {c.getDeclaredField(name);return true;}
        catch(NoSuchFieldException absent){/* Search inherited contracts. */}
        return false;
    }
    private static Field field(Class<?> type,String name,Class<?> expected)throws NoSuchMethodException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try {
            Field field=c.getDeclaredField(name);
            if(field.getType()==expected&&!Modifier.isStatic(field.getModifiers()))return field;
            break;
        }catch(NoSuchFieldException absent){/* Search inherited contracts. */}
        throw new NoSuchMethodException("native wake: legacy "+name+":"+expected.getSimpleName()+" unavailable");
    }
    private static Method method(Class<?> type,String name,Class<?>...args)throws NoSuchMethodException {
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try {
            Method method=c.getDeclaredMethod(name,args);
            if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers()))break;
            method.setAccessible(true);return method;
        }catch(NoSuchMethodException absent){/* Search inherited contracts. */}
        throw new NoSuchMethodException("native wake: legacy "+name+":void unavailable");
    }
    private NativeIslandWake(){}
}
