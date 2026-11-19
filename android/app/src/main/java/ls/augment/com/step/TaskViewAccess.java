package ls.augment.com.step;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Shell exposes the same controller through an accessor or an instance field. */
final class TaskViewAccess {
    static Object controller(Object view, ClassLoader loader) throws ReflectiveOperationException {
        Class<?> type = Class.forName("com.android.wm.shell.taskview.TaskViewTaskController", false, loader);
        Class<?> organizer = Class.forName("com.android.wm.shell.ShellTaskOrganizer", false, loader);
        Class<?> surface = Class.forName("android.view.SurfaceControl", false, loader);
        Class<?> token = Class.forName("android.window.WindowContainerToken", false, loader);
        instanceField(type, "mTaskOrganizer", organizer);
        instanceField(type, "mSurfaceCreated", boolean.class);
        instanceField(type, "mSurfaceControl", surface);
        instanceField(type, "mTaskToken", token);
        Method getter = null;
        try {
            getter = OwnershipBridge.method(view.getClass(), "getController");
        } catch (NoSuchMethodException legacy) {
            // Android 15 TaskView holds the controller without exposing a getter.
        }
        Object value = getter != null && !Modifier.isStatic(getter.getModifiers())
                && type.isAssignableFrom(getter.getReturnType())
                ? getter.invoke(view) : instanceField(view.getClass(), "mTaskViewTaskController", type).get(view);
        if (!type.isInstance(value)) throw new IllegalStateException("TaskView controller unavailable");
        return value;
    }

    private static Field instanceField(Class<?> owner, String name, Class<?> type) throws NoSuchFieldException {
        for (Class<?> at = owner; at != null; at = at.getSuperclass()) {
            Field field;
            try { field = at.getDeclaredField(name); }
            catch (NoSuchFieldException inherited) { continue; }
            if (Modifier.isStatic(field.getModifiers()) || !type.isAssignableFrom(field.getType())) break;
            field.setAccessible(true);
            return field;
        }
        throw new NoSuchFieldException(owner.getName() + "." + name + " expected " + type.getName());
    }
    private TaskViewAccess() {}
}
