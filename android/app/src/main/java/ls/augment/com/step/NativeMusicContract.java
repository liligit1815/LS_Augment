package ls.augment.com.step;

import java.lang.reflect.*;

/** Capability checks use assignable field types and inherited methods, never firmware numbers. */
final class NativeMusicContract {
    static Field field(Class<?> owner,String name,Class<?> type){
        Field value=StepMembers.findField(owner,name);
        if(Modifier.isStatic(value.getModifiers()) || !type.isAssignableFrom(value.getType()))
            throw new IllegalStateException(owner.getName()+"."+name+" type="+value.getType().getName());
        return value;
    }
    static Method method(Class<?> owner,String name,Class<?> result,Class<?>... args){
        Method value=StepMembers.findMethodExact(owner,name,args);
        if(Modifier.isStatic(value.getModifiers()) || !result.isAssignableFrom(value.getReturnType()))
            throw new IllegalStateException(owner.getName()+"."+name+" return="+value.getReturnType().getName());
        return value;
    }
}
