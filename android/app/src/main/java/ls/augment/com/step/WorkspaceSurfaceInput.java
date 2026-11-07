package ls.augment.com.step;

import android.view.SurfaceControl;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Input isolation inherited only while original tasks are under our animation band. */
final class WorkspaceSurfaceInput {
    static Method setter(Class<?> type) throws ReflectiveOperationException {
        Method method=OwnershipBridge.method(type,"setDropInputMode",SurfaceControl.class,int.class);
        if(method.getReturnType()!=SurfaceControl.Transaction.class || Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("surface input drop signature");
        return method;
    }
    static int mode(Class<?> type) throws ReflectiveOperationException {
        Field all=StepMembers.findField(type,"ALL"),none=StepMembers.findField(type,"NONE");
        if(all.getType()!=int.class || none.getType()!=int.class
                || !Modifier.isStatic(all.getModifiers()) || !Modifier.isStatic(none.getModifiers()))
            throw new NoSuchFieldException("surface input drop modes");
        int value=all.getInt(null);
        if(value==none.getInt(null))throw new IllegalStateException("surface input drop modes overlap");
        return value;
    }
    static void blockChildren(SurfaceControl.Transaction tx,SurfaceControl band) throws ReflectiveOperationException {
        Class<?> modes=Class.forName("android.gui.DropInputMode",false,SurfaceControl.class.getClassLoader());
        setter(tx.getClass()).invoke(tx,band,mode(modes));
    }
}
