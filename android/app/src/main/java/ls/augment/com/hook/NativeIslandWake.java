package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** The manager facade and permanent controller expose equivalent OEM wake routes. */
final class NativeIslandWake {
    static String synchronize(Object manager,Object permanent)throws ReflectiveOperationException {
        for(Object owner:new Object[]{manager,permanent}) {
            if(owner==null)continue;
            for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try {
                Method method=type.getDeclaredMethod("onStartedWakingUp");
                if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers()))break;
                method.setAccessible(true);method.invoke(owner);
                return owner==manager?"manager":"permanent";
            }catch(NoSuchMethodException absent){/* Continue through OEM subclasses. */}
        }
        throw new NoSuchMethodException("native wake: manager/permanent onStartedWakingUp():void unavailable");
    }
    private NativeIslandWake(){}
}
