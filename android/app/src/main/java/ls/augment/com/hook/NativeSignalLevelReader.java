package ls.augment.com.hook;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Matches the available OEM level provider; all calls run on the connectivity worker. */
final class NativeSignalLevelReader {
    static final String VENDOR_CLASS = "com.android.vts.VendorTelephonyManager";
    private final Method vendorDefault, vendorLevel, legacyLevel;
    final String capabilities;

    static final class Result {
        final int level, nativeLevel;
        final String source, error;
        Result(int level, int nativeLevel, String source, String error) {
            this.level=level;this.nativeLevel=nativeLevel;this.source=source;this.error=error;
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static NativeSignalLevelReader detect(ClassLoader loader, Class<?> strengthClass) {
        Class<?> vendor=null;
        String problem="";
        try { vendor=Class.forName(VENDOR_CLASS,false,loader); }
        catch(ClassNotFoundException missing) { problem="missing_class"; }
        catch(RuntimeException | LinkageError failure) { problem=failure.getClass().getSimpleName(); }
        return new NativeSignalLevelReader(vendor,strengthClass,problem);
    }

    NativeSignalLevelReader(Class<?> vendor, Class<?> strengthClass) {
        this(vendor,strengthClass,"missing_class");
    }

    private NativeSignalLevelReader(Class<?> vendor, Class<?> strengthClass, String absentReason) {
        Method singleton=null,level=null,legacy=null;
        String vendorState=absentReason,legacyState="missing_method";
        if(vendor!=null)try {
            singleton=vendor.getMethod("getDefault");
            level=vendor.getMethod("getOperatorLevel",int.class);
            if(!Modifier.isStatic(singleton.getModifiers()) || singleton.getReturnType().isPrimitive()
                    || Modifier.isStatic(level.getModifiers()) || !integerResult(level))
                throw new NoSuchMethodException("vendor_contract");
            singleton.setAccessible(true);level.setAccessible(true);vendorState="available";
        } catch(ReflectiveOperationException | RuntimeException | LinkageError failure) {
            singleton=null;level=null;vendorState="contract:"+failure.getClass().getSimpleName();
        }
        try {
            legacy=strengthClass.getMethod("getOperatorLevel");
            if(Modifier.isStatic(legacy.getModifiers()) || !integerResult(legacy))
                throw new NoSuchMethodException("legacy_contract");
            legacy.setAccessible(true);legacyState="available";
        } catch(ReflectiveOperationException | RuntimeException | LinkageError failure) {
            legacy=null;legacyState="contract:"+failure.getClass().getSimpleName();
        }
        vendorDefault=singleton;vendorLevel=level;legacyLevel=legacy;
        capabilities="vendor="+vendorState+";legacy="+legacyState;
    }

    private static boolean integerResult(Method method) {
        return method.getReturnType()==int.class || method.getReturnType()==Integer.class;
    }

    Result read(Object strength, int slot, int standardLevel, int bars) {
        if(strength==null)return new Result(-1,-1,"unread","");
        int fallback=Math.min(bars,Math.max(0,Math.min(4,standardLevel)));
        // The new OEM path falls back to SignalStrength.getLevel() on failure.
        // A still-present legacy getter must not override the new provider.
        if(vendorLevel!=null) {
            if(slot<0)return new Result(fallback,-1,"android_fallback","slot_unknown");
            try {
                Object manager=vendorDefault.invoke(null);
                if(manager==null || !vendorLevel.getDeclaringClass().isInstance(manager))
                    return new Result(fallback,-1,"android_fallback","vendor_instance_unavailable");
                return result(vendorLevel.invoke(manager,slot),bars,fallback,"vendor");
            } catch(ReflectiveOperationException | RuntimeException | LinkageError failure) {
                return new Result(fallback,-1,"android_fallback","vendor:"+failureType(failure));
            }
        }
        if(legacyLevel!=null)try {
            return result(legacyLevel.invoke(strength),bars,fallback,"operator");
        } catch(ReflectiveOperationException | RuntimeException | LinkageError failure) {
            return new Result(fallback,-1,"android_fallback","legacy:"+failureType(failure));
        }
        return new Result(fallback,-1,"android","");
    }

    private static Result result(Object raw, int bars, int fallback, String source) {
        if(raw instanceof Integer) {
            int value=(Integer)raw;
            if(value>=0 && value<=5)return new Result(Math.min(bars,value),value,source,"");
        }
        return new Result(fallback,-1,"android_fallback",source+":invalid_level");
    }

    private static String failureType(Throwable failure) {
        if(failure instanceof InvocationTargetException && failure.getCause()!=null)
            failure=failure.getCause();
        return failure.getClass().getSimpleName();
    }
}
