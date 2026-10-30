package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import static ls.augment.com.hook.AtomicWorkbenchMediaEvidenceReflect.*;

/** Resolve structure, including inherited/renamed owner fields; never trust an anonymous class number. */
final class AtomicWorkbenchNotificationAdapter {
    final Class<?> binderClass,serviceClass;
    final Field ownerField,serviceBinder;
    final Method transact;
    AtomicWorkbenchNotificationAdapter(Class<?> service,Class<?> stub,Class<?> binder,Class<?> parcel)throws ReflectiveOperationException {
        if(!stub.isAssignableFrom(binder))throw new NoSuchFieldException("notification_binder_not_native_stub:"+binder.getName());
        serviceClass=service;binderClass=binder;ownerField=ownerField(binder,service);
        serviceBinder=member(service,"mService");
        if(Modifier.isStatic(serviceBinder.getModifiers())||!serviceBinder.getType().isAssignableFrom(binder))
            throw new NoSuchFieldException("notification_mService_type:"+serviceBinder.getType().getName());
        transact=method(binder,"onTransact",int.class,parcel,parcel,int.class);
        if(transact.getReturnType()!=boolean.class||Modifier.isStatic(transact.getModifiers()))
            throw new NoSuchMethodException("notification_onTransact_signature");
    }
    static Field ownerField(Class<?> type,Class<?> service)throws NoSuchFieldException {
        Field found=null;
        for(Class<?> at=type;at!=null;at=at.getSuperclass())for(Field field:at.getDeclaredFields())
            if(!Modifier.isStatic(field.getModifiers())&&service.isAssignableFrom(field.getType())) {
                if(found!=null)throw new NoSuchFieldException("notification_owner_ambiguous:"+type.getName());
                field.setAccessible(true);found=field;
            }
        if(found==null)throw new NoSuchFieldException("notification_owner_missing:"+type.getName());
        return found;
    }
    Object owner(Object binder)throws ReflectiveOperationException {
        if(!binderClass.isInstance(binder))throw new IllegalAccessException("notification_binder_type");
        Object owner=ownerField.get(binder);
        if(!serviceClass.isInstance(owner)||serviceBinder.get(owner)!=binder)
            throw new IllegalAccessException("notification_binder_owner_identity");
        return owner;
    }
}
