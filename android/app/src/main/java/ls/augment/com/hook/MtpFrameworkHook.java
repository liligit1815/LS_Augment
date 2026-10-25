package ls.augment.com.hook;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.SystemOptions;

/** Standalone MtpService plus framework MTP. Legacy vendor server stays independent. */
final class MtpFrameworkHook {
    static final String SERVICE="com.android.mtp.MtpService";

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> service=Class.forName(SERVICE,false,loader);
            if(!Service.class.isAssignableFrom(service))throw new NoSuchMethodException("MtpService:Service");
            method(service,"onStartCommand",int.class,Intent.class,int.class,int.class);
            method(service,"onDestroy",void.class);
            Field ptp=field(service,"mPtpMode",boolean.class);
            Class<?> storage=Class.forName("android.mtp.MtpStorage",false,loader);
            Class<?> server=Class.forName("android.mtp.MtpServer",false,loader);
            Method add=method(server,"addStorage",void.class,storage);
            Method volume=method(storage,"getVolumeName",String.class);
            Method removable=method(storage,"isRemovable",boolean.class);
            Field description=field(storage,"mDescription",String.class);
            Field context=field(server,"mContext",Context.class);
            // JNI copies mDescription directly when storage is registered. Storage IDs
            // are allocation order, so external_primary is the authoritative identity.
            module.registerFeatureHook(module.prepareFeatureHook(add,"mtp.framework.storage_name",true).intercept(chain->{
                Object item=chain.getArg(0);String replacement=null;
                try {
                    Context owner=(Context)context.get(chain.getThisObject());
                    if(item!=null&&service.isInstance(owner)&&!ptp.getBoolean(owner)
                            &&FeatureSettings.hasVerifiedSnapshot(owner)
                            &&FeatureSettings.enabled(owner,SystemOptions.key("mtp_name_enabled"),false)
                            &&"external_primary".equals(volume.invoke(item))&&!Boolean.TRUE.equals(removable.invoke(item)))
                        replacement=FeatureSettings.text(owner,SystemOptions.key("mtp_name"),"内部存储");
                }catch(Throwable error){module.logFeatureError("MTP_STORAGE_IDENTITY_UNAVAILABLE",error);}
                if(replacement==null)return chain.proceed();
                synchronized(item) {
                    Object original;
                    try{original=description.get(item);description.set(item,replacement);}
                    catch(Throwable error){module.logFeatureError("MTP_STORAGE_DESCRIPTION_UNAVAILABLE",error);return chain.proceed();}
                    try{return chain.proceed();}finally{
                        try{description.set(item,original);}catch(Throwable error){module.logFeatureError("MTP_STORAGE_DESCRIPTION_RESTORE",error);}
                    }
                }
            }));
            int hooks=1+MtpStartupHook.install(module,loader,SERVICE);
            module.logFeatureInfo("MTP_FRAMEWORK_READY hooks="+hooks+";primary=external_primary;categories=native_categories_absent;ptp=native");
            return hooks;
        }catch(Throwable missing){module.logFeatureError("MTP_FRAMEWORK_CONTRACT_MISSING",missing);return 0;}
    }
    static Method method(Class<?> owner,String name,Class<?> result,Class<?>...args)throws Exception {
        for(Class<?> type=owner;type!=null;type=type.getSuperclass())try {
            Method m=type.getDeclaredMethod(name,args);
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new IllegalStateException(name);
            m.setAccessible(true);return m;
        }catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException(owner.getName()+"."+name);
    }
    static Field field(Class<?> owner,String name,Class<?> expected)throws Exception {
        for(Class<?> type=owner;type!=null;type=type.getSuperclass())try {
            Field f=type.getDeclaredField(name);
            if(f.getType()!=expected||Modifier.isStatic(f.getModifiers()))throw new IllegalStateException(name);
            f.setAccessible(true);return f;
        }catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(owner.getName()+"."+name);
    }
    private MtpFrameworkHook(){}
}
