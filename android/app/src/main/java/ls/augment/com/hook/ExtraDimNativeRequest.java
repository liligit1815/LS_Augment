package ls.augment.com.hook;

import android.content.ContentResolver;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.function.BooleanSupplier;

/** A fresh owned request, scoped to one native color callback's Settings read. */
final class ExtraDimNativeRequest {
    private static final ThreadLocal<Read> CURRENT = new ThreadLocal<>();
    private static final class Read {
        final ContentResolver resolver;
        final int user, value;
        final String key;
        final BooleanSupplier current;
        boolean consumed;
        Read(ContentResolver resolver, int user, String key, int value, BooleanSupplier current) {
            this.resolver=resolver;this.user=user;this.key=key;this.value=value;this.current=current;
        }
    }

    static ExtraDimNativeRequest install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> secure=Class.forName("android.provider.Settings$Secure",false,loader);
            Method getter=secure.getDeclaredMethod("getIntForUser",ContentResolver.class,String.class,int.class,int.class);
            if(getter.getReturnType()!=int.class || !Modifier.isStatic(getter.getModifiers()))
                throw new NoSuchMethodException("Secure.getIntForUser contract");
            getter.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(getter,"extra_dim.scoped_native_read",false).intercept(chain -> {
                Read read=CURRENT.get();
                if(read==null || read.consumed || chain.getArg(0)!=read.resolver
                        || !read.key.equals(chain.getArg(1)) || !Integer.valueOf(read.user).equals(chain.getArg(3)))
                    return chain.proceed();
                if(!read.current.getAsBoolean())throw new IllegalStateException("Extra Dim request superseded");
                Object nativeValue=chain.proceed();
                if(!read.current.getAsBoolean())throw new IllegalStateException("Extra Dim request superseded");
                read.consumed=true;
                String detail="user="+read.user+";key="+read.key+";native="+nativeValue+";requested="+read.value;
                FeatureRuntimeLog.state("EXTRA_DIM_NATIVE_READ",detail,detail);
                return read.value;
            }));
            return new ExtraDimNativeRequest();
        }catch(ReflectiveOperationException | RuntimeException | LinkageError absent){
            module.logFeatureInfo("EXTRA_DIM_SCOPED_READ_UNAVAILABLE "+absent.getClass().getSimpleName());
            return null;
        }
    }

    void invoke(Method callback,Object service,ContentResolver resolver,int user,String key,int value,
            BooleanSupplier current,Object... arguments) throws ReflectiveOperationException {
        if(!current.getAsBoolean())throw new IllegalStateException("Extra Dim request superseded");
        Read previous=CURRENT.get(),read=new Read(resolver,user,key,value,current);
        CURRENT.set(read);
        try {
            callback.invoke(service,arguments);
            if(!read.consumed)FeatureRuntimeLog.event("EXTRA_DIM_NATIVE_READ_UNAVAILABLE",
                    "method="+callback.getName()+";key="+key+";action=preserved_native");
        }finally{
            if(previous==null)CURRENT.remove();else CURRENT.set(previous);
        }
    }
}
