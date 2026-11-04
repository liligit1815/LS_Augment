package ls.augment.com.step;

/** Only the currently leased preview task is excluded from native keyboard/IME selection. */
public final class SideFocus {
    public static java.lang.reflect.Method imeMethod(Class<?> window) throws NoSuchMethodException {
        java.lang.reflect.Method method;
        try{method=OwnershipBridge.method(window,"canBeImeTarget");}
        catch(NoSuchMethodException olderAbsent){method=OwnershipBridge.method(window,"canBeImeLayeringTarget");}
        if(method.getReturnType()!=boolean.class||java.lang.reflect.Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("Unknown native IME candidate contract");
        return method;
    }
    public static boolean excludes(boolean active,boolean ending,int side,int id,Object saved,Object actual,boolean dirty) {
        return active&&!ending&&side>=0&&side==id&&saved!=null&&saved==actual&&dirty;
    }
}
