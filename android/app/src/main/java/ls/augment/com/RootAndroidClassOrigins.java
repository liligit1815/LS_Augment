package ls.augment.com;

import android.os.Looper;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.file.Paths;
import java.util.Objects;

/**
 * Actual Android Class/DexCache field reader for the pinned ROM. Requires trusted
 * VM/framework and stable pinned filesystem, with no same-process redefinition.
 * This binds runtime class metadata to hashed archive indices, not memory method
 * byte equality or ART coverage. It never initializes target classes or issues READY.
 */
final class RootAndroidClassOrigins implements RootCriticalProfile.Origins {
    static final String SERVICES="/system/framework/services.jar",FRAMEWORK="/system/framework/framework.jar";
    private final RootDexArchiveIndex services,framework;
    private final Class<?> dexCacheClass;
    private final Field ownerCache,ownerLoader,classIndex,typeIndex,cacheLoader,cacheLocation;
    private final ClassLoader publicBootLoader;

    private RootAndroidClassOrigins(RootDexArchiveIndex services,RootDexArchiveIndex framework)throws ReflectiveOperationException {
        this.services=services;this.framework=framework;
        dexCacheClass=Class.forName("java.lang.DexCache",false,null);
        ownerCache=field(Class.class,"dexCache",Object.class);
        ownerLoader=field(Class.class,"classLoader",ClassLoader.class);
        classIndex=field(Class.class,"dexClassDefIndex",int.class);
        typeIndex=field(Class.class,"dexTypeIndex",int.class);
        cacheLoader=field(dexCacheClass,"classLoader",ClassLoader.class);
        cacheLocation=field(dexCacheClass,"location",String.class);
        publicBootLoader=Object.class.getClassLoader();
        if(ownerLoader.get(Object.class)!=null || ownerLoader.get(dexCacheClass)!=null
                || dexCacheClass.getClassLoader()!=publicBootLoader || !Modifier.isFinal(dexCacheClass.getModifiers()))
            throw failure("DexCache is not the actual bootstrap-defined class",null);
    }
    /** Explicit background preparation. attest() never reads archive bytes. */
    static RootAndroidClassOrigins prepare()throws ReflectiveOperationException {
        Looper main=Looper.getMainLooper();
        if(main==null || Thread.currentThread()==main.getThread())throw failure("archive preparation requires a known non-main thread",null);
        try {
            RootDexArchiveIndex services=RootDexArchiveIndex.read(Paths.get(SERVICES),RootCriticalProfile.SERVICES_SHA256);
            RootDexArchiveIndex framework=RootDexArchiveIndex.read(Paths.get(FRAMEWORK),RootCriticalProfile.FRAMEWORK_SHA256);
            return new RootAndroidClassOrigins(services,framework);
        } catch(IOException|RuntimeException e){throw failure("pinned Android source preparation failed",e);}
    }
    @Override public RootCriticalProfile.SourceEvidence attest(Class<?> actualOwner,String expectedSource)throws ReflectiveOperationException {
        Objects.requireNonNull(actualOwner);
        if(actualOwner.isArray() || actualOwner.isPrimitive() || expectedSource==null || expectedSource.length()>32)
            throw failure("unsupported runtime owner/source",null);
        final String path;final RootDexArchiveIndex archive;
        if(expectedSource.startsWith("1/")){path=SERVICES;archive=services;}
        else if(expectedSource.startsWith("2/")){path=FRAMEWORK;archive=framework;}
        else throw failure("unknown archive source family",null);
        String entry=expectedSource.substring(2);
        try {
            Object cache=ownerCache.get(actualOwner),rawLoader=ownerLoader.get(actualOwner);
            int definition=classIndex.getInt(actualOwner),type=typeIndex.getInt(actualOwner);
            if(cache==null || cache.getClass()!=dexCacheClass)throw failure("actual owner has no exact bootstrap DexCache",null);
            Object definingCacheLoader=cacheLoader.get(cache);String location=(String)cacheLocation.get(cache);
            ClassLoader visibleLoader=actualOwner.getClassLoader();
            if(rawLoader!=definingCacheLoader || visibleLoader!=(rawLoader==null?publicBootLoader:rawLoader))
                throw failure("Class/DexCache loader identities differ",null);
            RootDexArchiveIndex.entryFromLocation(location,path,entry);
            archive.require(entry,definition,type,"L"+actualOwner.getName().replace('.','/')+";");
            // Detect ordinary concurrent metadata changes; not an adversarial seqlock.
            if(ownerCache.get(actualOwner)!=cache || ownerLoader.get(actualOwner)!=rawLoader
                    || classIndex.getInt(actualOwner)!=definition || typeIndex.getInt(actualOwner)!=type
                    || cacheLoader.get(cache)!=definingCacheLoader || !Objects.equals(cacheLocation.get(cache),location)
                    || actualOwner.getClassLoader()!=visibleLoader)
                throw failure("runtime owner metadata changed during attestation",null);
            return new RootCriticalProfile.SourceEvidence(actualOwner,visibleLoader,archive.archiveSha256,entry);
        } catch(IOException|RuntimeException e){throw failure("runtime class origin rejected",e);}
    }
    private static Field field(Class<?> declaring,String name,Class<?> type)throws ReflectiveOperationException {
        Field field=declaring.getDeclaredField(name);
        if(field.getType()!=type || Modifier.isStatic(field.getModifiers()) || !Modifier.isPrivate(field.getModifiers()))
            throw failure("unexpected private VM field shape: "+name,null);
        try{field.setAccessible(true);}catch(RuntimeException e){throw failure("private VM field unavailable: "+name,e);}
        return field;
    }
    private static ReflectiveOperationException failure(String message,Throwable cause){return new ReflectiveOperationException(message,cause);}
}
