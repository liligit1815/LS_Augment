package ls.augment.com.step;

import java.lang.reflect.*;

/** Exact old/new layer-capture policies; a missing protection control disables sampling. */
final class CaptureSafety {
    static String configure(Object builder,ClassLoader loader)throws ReflectiveOperationException {
        Class<?> type=builder.getClass();
        try {
            Method secure=OwnershipBridge.method(type,"setCaptureSecureLayers",boolean.class);
            Method protectedContent=OwnershipBridge.method(type,"setAllowProtected",boolean.class);
            secure.invoke(builder,false);protectedContent.invoke(builder,false);return "boolean_redact";
        } catch(NoSuchMethodException absent) {
            Method secure=OwnershipBridge.method(type,"setSecureContentPolicy",int.class);
            Method protectedContent=OwnershipBridge.method(type,"setProtectedContentPolicy",int.class);
            Class<?> policy=Class.forName("android.window.ScreenCapture$ScreenCaptureParams",false,loader);
            secure.invoke(builder,constant(policy,"SECURE_CONTENT_POLICY_REDACT"));
            protectedContent.invoke(builder,constant(policy,"PROTECTED_CONTENT_POLICY_REDACT"));
            return "enum_redact";
        }
    }
    static int constant(Class<?> type,String name)throws ReflectiveOperationException {
        Field field=type.getField(name);
        if(field.getType()!=int.class || !Modifier.isStatic(field.getModifiers()) || !Modifier.isFinal(field.getModifiers()))
            throw new NoSuchFieldException(type.getName()+"#"+name+" must be a constant int");
        return field.getInt(null);
    }
}
