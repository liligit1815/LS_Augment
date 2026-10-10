package ls.augment.com.hook;

import android.content.Context;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

/** Reflection is isolated so an absent vendor method cannot abort another feature. */
final class SystemUiAdapter {
    static final Object PASS = new Object();
    // Lookups depend on the receiver's class, while values always remain live.
    // ClassValue also keeps accessors isolated across vendor class loaders.
    private static final ClassValue<Accessors> ACCESSORS = new ClassValue<>() {
        @Override protected Accessors computeValue(Class<?> type) { return new Accessors(type); }
    };
    private static final class Accessors {
        final Class<?> type;
        final ConcurrentHashMap<String,Field[]> fields = new ConcurrentHashMap<>();
        final ConcurrentHashMap<String,Method[]> noArguments = new ConcurrentHashMap<>();
        Accessors(Class<?> type) { this.type=type; }
        Field[] fields(String name) {
            Field[] cached=fields.get(name);if(cached!=null)return cached;
            ArrayList<Field> found=new ArrayList<>();
            for(Class<?> current=type;current!=null;current=current.getSuperclass())try {
                Field field=current.getDeclaredField(name);field.setAccessible(true);found.add(field);break;
            } catch(ReflectiveOperationException absent) { }
            Field[] resolved=found.toArray(new Field[0]);
            Field[] raced=fields.putIfAbsent(name,resolved);return raced==null?resolved:raced;
        }
        Method[] noArguments(String name) {
            Method[] cached=noArguments.get(name);if(cached!=null)return cached;
            ArrayList<Method> found=new ArrayList<>();
            lookup: for(Class<?> current=type;current!=null;current=current.getSuperclass())
                for(Method method:current.getDeclaredMethods())if(method.getName().equals(name)&&method.getParameterCount()==0) {
                    method.setAccessible(true);found.add(method);break lookup;
                }
            Method[] resolved=found.toArray(new Method[0]);
            Method[] raced=noArguments.putIfAbsent(name,resolved);return raced==null?resolved:raced;
        }
    }
    interface Patch { Object apply(Object target, Object[] arguments, Object result) throws Throwable; }
    private SystemUiAdapter() { }
    static int hook(AugmentModule module, ClassLoader loader, String className, String methodName,
                    int argumentCount, Patch before, Patch after) {
        return hookNamed(module,loader,"",className,methodName,argumentCount,before,after);
    }
    /** API 102 identifies interceptors by ID; independent features must not replace one another. */
    static int hookNamed(AugmentModule module, ClassLoader loader, String namespace, String className, String methodName,
                    int argumentCount, Patch before, Patch after) {
        int count = 0;
        try {
            Class<?> type = Class.forName(className, false, loader);
            for (Method method : type.getDeclaredMethods()) {
                if (!method.getName().equals(methodName) || method.isSynthetic()
                        || (argumentCount >= 0 && method.getParameterCount() != argumentCount)) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "rm.ui." + (namespace.isEmpty()?"":namespace+".") + className + "." + methodName + "." + method.getParameterCount(), false)
                        .intercept(chain -> {
                            Object[] args = chain.getArgs().toArray();
                            if (before != null) try {
                                Object replacement = before.apply(chain.getThisObject(), args, null);
                                if (replacement != PASS) return replacement;
                            } catch (Throwable error) {
                                if("liftarc".equals(namespace))LiftArcLog.e("原厂接口 before "+className+"."+methodName,error);
                                else module.logFeatureError("RM_UI_BEFORE_" + methodName, error);
                                args = chain.getArgs().toArray();
                            }
                            Object result = chain.proceed(args);
                            if (after != null) try {
                                Object replacement = after.apply(chain.getThisObject(), args, result);
                                if (replacement != PASS) return replacement;
                            } catch (Throwable error) {
                                boolean recordDiagnostic=true;
                                if("liftarc".equals(namespace))recordDiagnostic=LiftArcLog.e("原厂接口 after "+className+"."+methodName,error);
                                else module.logFeatureError("RM_UI_AFTER_" + methodName, error);
                                if(recordDiagnostic)FeatureSettings.diagnostic(context(chain.getThisObject()),"ls_augment_rm_ui_callback_error",
                                        className+"."+methodName+": "+android.util.Log.getStackTraceString(error));
                            }
                            return result;
                        }));
                count++;
            }
            if (count == 0) {
                if("liftarc".equals(namespace))LiftArcLog.w("原厂接口 unavailable "+className+"."+methodName,null);
                module.logFeatureInfo("RM_UI_UNAVAILABLE " + className + "." + methodName);
            }
        } catch (ClassNotFoundException absent) {
            if("liftarc".equals(namespace))LiftArcLog.w("原厂接口 unavailable "+className,absent);
            module.logFeatureInfo("RM_UI_UNAVAILABLE " + className);
        }
        catch (Throwable error) {
            if("liftarc".equals(namespace))LiftArcLog.e("原厂接口 install "+className+"."+methodName,error);
            module.logFeatureError("RM_UI_INSTALL_" + className + "." + methodName, error);
        }
        return count;
    }
    static Object field(Object owner, String... names) {
        if (owner == null) return null;
        Accessors access=ACCESSORS.get(owner.getClass());
        for (String name : names) for (Field field : access.fields(name)) try {
            return field.get(owner);
        } catch (ReflectiveOperationException ignored) { }
        return null;
    }
    static boolean set(Object owner, String name, Object value) {
        if (owner == null) return false;
        for (Field field : ACCESSORS.get(owner.getClass()).fields(name)) try {
            field.set(owner, value); return true;
        } catch (ReflectiveOperationException ignored) { }
        return false;
    }
    static Object call(Object owner, String name, Object... args) throws ReflectiveOperationException {
        if (owner == null) return null;
        if(args.length==0) {
            Method[] methods=ACCESSORS.get(owner.getClass()).noArguments(name);
            if(methods.length>0)return methods[0].invoke(owner);
            throw new NoSuchMethodException(owner.getClass().getName()+"."+name);
        }
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Method method : type.getDeclaredMethods()) {
                if (!method.getName().equals(name) || method.getParameterCount() != args.length) continue;
                boolean matches = true;
                for (int i = 0; i < args.length; i++) if (args[i] != null) {
                    Class<?> expected = method.getParameterTypes()[i];
                    if (expected.isPrimitive()) expected = box(expected);
                    if (!expected.isInstance(args[i])) matches = false;
                }
                if (!matches) continue;
                method.setAccessible(true); return method.invoke(owner, args);
            }
        }
        throw new NoSuchMethodException(owner.getClass().getName() + "." + name);
    }
    /** Optional vendor access avoids constructing an exception for a known-absent method. */
    static Object callIfPresent(Object owner, String name) throws ReflectiveOperationException {
        if(owner==null)return null;
        Method[] methods=ACCESSORS.get(owner.getClass()).noArguments(name);
        return methods.length==0?null:methods[0].invoke(owner);
    }
    private static Class<?> box(Class<?> type) {
        if (type == int.class) return Integer.class;
        if (type == boolean.class) return Boolean.class;
        if (type == long.class) return Long.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        return type;
    }
    static Context context(Object owner) { return owner instanceof View ? ((View) owner).getContext() : FeatureSettings.from(owner); }
}
