package ls.augment.com;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/**
 * Pinned OEM live-state/Watchable metadata only. Never invokes, observes, hooks,
 * deoptimizes, grants ownership or admits Root operations. The finite caller list
 * is a candidate transport chain, not proof of complete caller/inlining coverage.
 */
final class RootOwnershipProfile {
    static final int CLASS_COUNT=42, FIELD_COUNT=32, METHOD_COUNT=41;
    private static final int CLASS_KIND_FLAGS=0x7610, FIELD_FLAGS=0x50df, METHOD_FLAGS=0x1dff;
    private record ClassSpec(String name,String source,int flags,String parent,String[] interfaces) {}
    private record FieldSpec(String descriptor,int flags) {}
    private record MethodSpec(String descriptor,int flags) {}

    static final class Resolved {
        final Map<String,Class<?>> classes;
        final Map<String,Field> fields;
        final Map<String,Method> methods;
        final Map<Class<?>,RootCriticalProfile.SourceEvidence> evidence;
        final List<Method> callers;
        final Constructor<?> watcherConstructor;
        private Resolved(Resolver resolver,Constructor<?> watcherConstructor)throws ReflectiveOperationException {
            classes=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.classes));
            fields=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.fields));
            methods=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.methods));
            evidence=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.evidence));
            this.watcherConstructor=watcherConstructor;
            List<Method> selected=new ArrayList<>();
            for(String descriptor:CALLERS)selected.add(method(descriptor));
            if(selected.size()!=7 || selected.stream().distinct().count()!=7)
                throw invalid("Duplicate ownership candidate caller");
            callers=Collections.unmodifiableList(selected);
        }
        Class<?> type(String binaryName)throws ClassNotFoundException {
            Class<?> value=classes.get(binaryName);
            if(value==null)throw new ClassNotFoundException("Unattested ownership Class: "+binaryName);
            return value;
        }
        Field field(String ownerAndName)throws NoSuchFieldException {
            Field value=fields.get(ownerAndName);
            if(value==null)throw new NoSuchFieldException("Unattested ownership field: "+ownerAndName);
            return value;
        }
        Method method(String descriptor)throws NoSuchMethodException {
            Method value=methods.get(descriptor);
            if(value==null)throw invalid("Unattested ownership method: "+descriptor);
            return value;
        }
    }

    static Resolved resolve(ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins)
            throws ReflectiveOperationException {
        return new Resolver(Objects.requireNonNull(services),boot,Objects.requireNonNull(origins)).resolve();
    }
    private static final class Resolver {
        final ClassLoader services,boot;
        final RootAndroidClassOrigins origins;
        final Map<String,Class<?>> classes=new LinkedHashMap<>();
        final Map<String,Field> fields=new LinkedHashMap<>();
        final Map<String,Method> methods=new LinkedHashMap<>();
        final Map<Class<?>,RootCriticalProfile.SourceEvidence> evidence=new LinkedHashMap<>();
        Resolver(ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins) {
            this.services=services;this.boot=boot;this.origins=origins;
        }
        Resolved resolve()throws ReflectiveOperationException {
            if(CLASSES.size()!=CLASS_COUNT || FIELDS.size()!=FIELD_COUNT || METHODS.size()!=METHOD_COUNT)
                throw invalid("Incomplete fixed ownership profile");
            for(ClassSpec spec:CLASSES) {
                ClassLoader selected=spec.source.startsWith("1/")?services:boot;
                Class<?> owner=Class.forName(spec.name,false,selected);
                RootCriticalProfile.SourceEvidence proof=origins.attest(owner,spec.source);
                if(owner.getClassLoader()!=selected || !matches(proof,owner,spec.source))
                    throw invalid("Ownership Class source/loader differs: "+spec.name);
                if(classes.putIfAbsent(spec.name,owner)!=null || evidence.putIfAbsent(owner,proof)!=null)
                    throw invalid("Duplicate ownership Class");
            }
            for(ClassSpec spec:CLASSES) {
                Class<?> owner=classes.get(spec.name);
                // DEX inner-class access/static bits are not ClassDef kind bits.
                if((owner.getModifiers()&CLASS_KIND_FLAGS)!=(spec.flags&CLASS_KIND_FLAGS)
                        || owner.isSynthetic()!=((spec.flags&0x1000)!=0)
                        || owner.getSuperclass()!=(owner.isInterface()?null:type(spec.parent)))
                    throw invalid("Ownership Class kind/super differs: "+spec.name);
                Class<?>[] interfaces=new Class<?>[spec.interfaces.length];
                for(int i=0;i<interfaces.length;i++)interfaces[i]=type(spec.interfaces[i]);
                if(!Arrays.equals(owner.getInterfaces(),interfaces))
                    throw invalid("Ownership Class interfaces differ: "+spec.name);
            }
            for(FieldSpec spec:FIELDS) {
                int split=spec.descriptor.indexOf(";->"),colon=spec.descriptor.indexOf(':',split+3);
                Class<?> owner=type(spec.descriptor.substring(0,split+1));
                String name=spec.descriptor.substring(split+3,colon);
                Field field=owner.getDeclaredField(name);
                if(field.getDeclaringClass()!=owner || field.getType()!=type(spec.descriptor.substring(colon+1))
                        || (field.getModifiers()&FIELD_FLAGS)!=spec.flags
                        || field.isSynthetic()!=((spec.flags&0x1000)!=0))
                    throw new NoSuchFieldException("Ownership field flags/type/owner differ: "+spec.descriptor);
                accessible(field);
                if(fields.putIfAbsent(owner.getName()+"#"+name,field)!=null)
                    throw new NoSuchFieldException("Duplicate ownership field");
            }
            for(MethodSpec spec:METHODS) {
                RootCriticalProfile.Descriptor descriptor=RootCriticalProfile.parseDescriptor(spec.descriptor);
                Class<?> owner=classes.get(descriptor.owner);
                if(owner==null)throw invalid("Unattested ownership method owner");
                Class<?>[] parameters=new Class<?>[descriptor.parameters.size()];
                for(int i=0;i<parameters.length;i++)parameters[i]=type(descriptor.parameters.get(i));
                Class<?> result=type(descriptor.result);Method selected=null;
                for(Method method:owner.getDeclaredMethods())if(method.getName().equals(descriptor.name)
                        && method.getReturnType()==result && Arrays.equals(method.getParameterTypes(),parameters)) {
                    if(selected!=null)throw invalid("Ambiguous ownership descriptor");selected=method;
                }
                if(selected==null || selected.getDeclaringClass()!=owner
                        || (selected.getModifiers()&METHOD_FLAGS)!=spec.flags
                        || selected.isBridge()!=((spec.flags&0x40)!=0)
                        || selected.isVarArgs()!=((spec.flags&0x80)!=0)
                        || selected.isSynthetic()!=((spec.flags&0x1000)!=0))
                    throw invalid("Ownership method flags/type/owner differ: "+spec.descriptor);
                accessible(selected);
                if(methods.putIfAbsent(spec.descriptor,selected)!=null)
                    throw invalid("Duplicate ownership method");
            }
            Class<?> watcher=classes.get("com.android.server.utils.Watcher");
            Constructor<?> constructor=watcher.getDeclaredConstructor();
            if(constructor.getDeclaringClass()!=watcher || constructor.getModifiers()!=Modifier.PUBLIC
                    || constructor.isSynthetic() || constructor.isVarArgs())
                throw invalid("Ownership Watcher constructor differs");
            accessible(constructor);
            return new Resolved(this,constructor);
        }
        Class<?> type(String descriptor)throws ReflectiveOperationException {
            switch(descriptor) {
                case "V":return void.class;case "Z":return boolean.class;case "B":return byte.class;case "C":return char.class;
                case "S":return short.class;case "I":return int.class;case "J":return long.class;case "F":return float.class;case "D":return double.class;
            }
            if(descriptor.charAt(0)=='[')return Array.newInstance(type(descriptor.substring(1)),0).getClass();
            String name=descriptor.substring(1,descriptor.length()-1).replace('/','.');
            Class<?> known=classes.get(name);
            if(known!=null)return known;
            if(JAVA_TYPES.contains(descriptor))return Class.forName(name,false,null);
            throw invalid("Uncatalogued ownership signature: "+descriptor);
        }
    }
    private static void accessible(java.lang.reflect.AccessibleObject member)throws ReflectiveOperationException {
        try{member.setAccessible(true);}catch(RuntimeException e){throw new ReflectiveOperationException("Ownership member access unavailable",e);}
    }
    private static boolean matches(RootCriticalProfile.SourceEvidence proof,Class<?> owner,String source) {
        return proof!=null && proof.owner==owner && proof.definingLoader==owner.getClassLoader()
                && (source.startsWith("1/")?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256).equals(proof.archiveSha256)
                && source.substring(2).equals(proof.dexEntry);
    }
    private static NoSuchMethodException invalid(String reason){return new NoSuchMethodException(reason);}
    private static final List<ClassSpec> CLASSES=List.of(
        new ClassSpec("android.content.pm.IPackageManager$Stub","2/classes.dex",1025,"Landroid/os/Binder;",new String[]{"Landroid/content/pm/IPackageManager;"}),
        new ClassSpec("android.content.pm.IPackageManager","2/classes.dex",1537,"Ljava/lang/Object;",new String[]{"Landroid/os/IInterface;"}),
        new ClassSpec("android.content.pm.TestUtilityService","1/classes.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.content.pm.pkg.FrameworkPackageUserState","2/classes.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.Binder","2/classes3.dex",1,"Ljava/lang/Object;",new String[]{"Landroid/os/IBinder;"}),
        new ClassSpec("android.os.IBinder","2/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.IInterface","2/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.util.ArrayMap","2/classes4.dex",17,"Ljava/lang/Object;",new String[]{"Ljava/util/Map;"}),
        new ClassSpec("android.util.ArraySet","2/classes4.dex",17,"Ljava/lang/Object;",new String[]{"Ljava/util/Collection;","Ljava/util/Set;"}),
        new ClassSpec("android.util.SparseArray","2/classes4.dex",1,"Ljava/lang/Object;",new String[]{"Ljava/lang/Cloneable;"}),
        new ClassSpec("com.android.internal.content.om.OverlayConfig$PackageProvider$Package","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.AndroidPackageInternal","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/AndroidPackage;","Lcom/android/internal/content/om/OverlayConfig$PackageProvider$Package;"}),
        new ClassSpec("com.android.server.pm.IPackageManagerBase","1/classes2.dex",1025,"Landroid/content/pm/IPackageManager$Stub;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8","1/classes2.dex",4113,"Ljava/lang/Object;",new String[]{"Ljava/util/function/Consumer;"}),
        new ClassSpec("com.android.server.pm.PackageManagerService$IPackageManagerImpl","1/classes2.dex",1,"Lcom/android/server/pm/IPackageManagerBase;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/PackageSender;","Landroid/content/pm/TestUtilityService;"}),
        new ClassSpec("com.android.server.pm.PackageManagerTracedLock","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Ljava/lang/AutoCloseable;"}),
        new ClassSpec("com.android.server.pm.PackageSender","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageSetting","1/classes2.dex",1,"Lcom/android/server/pm/SettingBase;",new String[]{"Lcom/android/server/pm/pkg/PackageStateInternal;"}),
        new ClassSpec("com.android.server.pm.ResilientAtomicFile$ReadEventLogger","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.SettingBase","1/classes2.dex",1025,"Ljava/lang/Object;",new String[]{"Lcom/android/server/utils/Watchable;","Lcom/android/server/utils/Snappable;"}),
        new ClassSpec("com.android.server.pm.Settings","1/classes2.dex",17,"Ljava/lang/Object;",new String[]{"Lcom/android/server/utils/Watchable;","Lcom/android/server/utils/Snappable;","Lcom/android/server/pm/ResilientAtomicFile$ReadEventLogger;"}),
        new ClassSpec("com.android.server.pm.pkg.AndroidPackage","2/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.ArchiveState","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageState","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageStateInternal","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/PackageState;"}),
        new ClassSpec("com.android.server.pm.pkg.PackageUserState","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageUserStateImpl","1/classes2.dex",1,"Lcom/android/server/utils/WatchableImpl;",new String[]{"Lcom/android/server/pm/pkg/PackageUserStateInternal;","Lcom/android/server/utils/Snappable;"}),
        new ClassSpec("com.android.server.pm.pkg.PackageUserStateInternal","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/PackageUserState;","Landroid/content/pm/pkg/FrameworkPackageUserState;"}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateMutator$InitialState","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateMutator$Result","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;"}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateMutator$StateWriteWrapper","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/mutate/PackageStateWrite;"}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateMutator","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageStateWrite","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.mutate.PackageUserStateWrite","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.utils.Snappable","1/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.utils.Watchable","1/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.utils.WatchableImpl","1/classes3.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/utils/Watchable;"}),
        new ClassSpec("com.android.server.utils.WatchedArrayMap$1","1/classes3.dex",1,"Lcom/android/server/utils/Watcher;",new String[]{}),
        new ClassSpec("com.android.server.utils.WatchedArrayMap","1/classes3.dex",1,"Lcom/android/server/utils/WatchableImpl;",new String[]{"Ljava/util/Map;","Lcom/android/server/utils/Snappable;"}),
        new ClassSpec("com.android.server.utils.Watcher","1/classes3.dex",1025,"Ljava/lang/Object;",new String[]{})
    );
    private static final List<FieldSpec> FIELDS=List.of(
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mPackageStateWriteLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mPackages:Lcom/android/server/utils/WatchedArrayMap;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->this$0:Lcom/android/server/pm/PackageManagerService;",4113),
        new FieldSpec("Lcom/android/server/pm/Settings;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/Settings;->mPackages:Lcom/android/server/utils/WatchedArrayMap;",16),
        new FieldSpec("Lcom/android/server/pm/Settings;->mWatchable:Lcom/android/server/utils/WatchableImpl;",17),
        new FieldSpec("Lcom/android/server/pm/PackageSetting;->mUserStates:Landroid/util/SparseArray;",17),
        new FieldSpec("Lcom/android/server/pm/PackageSetting;->mName:Ljava/lang/String;",1),
        new FieldSpec("Lcom/android/server/pm/PackageSetting;->mAppId:I",1),
        new FieldSpec("Lcom/android/server/pm/PackageSetting;->pkg:Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;",1),
        new FieldSpec("Lcom/android/server/pm/SettingBase;->mPkgFlags:I",1),
        new FieldSpec("Lcom/android/server/pm/SettingBase;->mWatchable:Lcom/android/server/utils/Watchable;",17),
        new FieldSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->mBooleans:I",1),
        new FieldSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->mFirstInstallTimeMillis:J",1),
        new FieldSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->mCeDataInode:J",1),
        new FieldSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->mDeDataInode:J",1),
        new FieldSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->mWatchable:Lcom/android/server/utils/Watchable;",1),
        new FieldSpec("Lcom/android/server/utils/WatchableImpl;->mObservers:Ljava/util/ArrayList;",17),
        new FieldSpec("Lcom/android/server/utils/WatchableImpl;->mSealed:Z",1),
        new FieldSpec("Lcom/android/server/utils/WatchedArrayMap;->mStorage:Landroid/util/ArrayMap;",17),
        new FieldSpec("Lcom/android/server/utils/WatchedArrayMap;->mObserver:Lcom/android/server/utils/Watcher;",17),
        new FieldSpec("Lcom/android/server/utils/WatchedArrayMap;->mWatching:Z",65),
        new FieldSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->mState:Lcom/android/server/pm/PackageSetting;",1),
        new FieldSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->mUserStateWrite:Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper;",17),
        new FieldSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper;->mUserState:Lcom/android/server/pm/pkg/PackageUserStateImpl;",1),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8;->f$0:I",4113),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8;->f$1:Z",4113),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mPackageStateMutator:Lcom/android/server/pm/pkg/mutate/PackageStateMutator;",17),
        new FieldSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator;->mStateWrite:Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;",17),
        new FieldSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;->SUCCESS:Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;",25)
    );
    private static final List<MethodSpec> METHODS=List.of(
        new MethodSpec("Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Lcom/android/server/pm/pkg/mutate/PackageStateMutator$InitialState;Ljava/lang/String;Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->$r8$lambda$LkYZxaA-VNUTmLOD_icXu8eEv08(IZLcom/android/server/pm/pkg/mutate/PackageStateWrite;)V",4105),
        new MethodSpec("Lcom/android/server/pm/PackageSetting;->setHidden(ZI)V",1),
        new MethodSpec("Lcom/android/server/pm/PackageSetting;->setUserState(IJJIZZZZILandroid/util/ArrayMap;ZZLjava/lang/String;Landroid/util/ArraySet;Landroid/util/ArraySet;IILjava/lang/String;Ljava/lang/String;JILcom/android/server/pm/pkg/ArchiveState;)V",1),
        new MethodSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->setHidden(Z)Lcom/android/server/pm/pkg/PackageUserStateImpl;",1),
        new MethodSpec("Lcom/android/server/pm/pkg/PackageUserStateImpl;->onChanged()V",2),
        new MethodSpec("Lcom/android/server/pm/SettingBase;->onChanged()V",1),
        new MethodSpec("Lcom/android/server/pm/SettingBase;->dispatchChange(Lcom/android/server/utils/Watchable;)V",1),
        new MethodSpec("Lcom/android/server/pm/SettingBase;->registerObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/pm/SettingBase;->unregisterObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/pm/SettingBase;->isRegisteredObserver(Lcom/android/server/utils/Watcher;)Z",1),
        new MethodSpec("Lcom/android/server/utils/WatchableImpl;->dispatchChange(Lcom/android/server/utils/Watchable;)V",1),
        new MethodSpec("Lcom/android/server/utils/WatchableImpl;->registeredObserverCount()I",1),
        new MethodSpec("Lcom/android/server/utils/WatchableImpl;->registerObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/utils/WatchableImpl;->unregisterObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/utils/WatchableImpl;->isRegisteredObserver(Lcom/android/server/utils/Watcher;)Z",1),
        new MethodSpec("Lcom/android/server/utils/Watcher;->onChange(Lcom/android/server/utils/Watchable;)V",1025),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->removeAt(I)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->clear()V",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->size()I",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->keyAt(I)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->valueAt(I)Ljava/lang/Object;",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->onChanged()V",2),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->registerObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap;->unregisterObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/utils/WatchedArrayMap$1;->onChange(Lcom/android/server/utils/Watchable;)V",1),
        new MethodSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator;->forPackage(Ljava/lang/String;)Lcom/android/server/pm/pkg/mutate/PackageStateWrite;",1),
        new MethodSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->onChanged()V",1),
        new MethodSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->userState(I)Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;",1),
        new MethodSpec("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper;->setHidden(Z)Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8;->accept(Ljava/lang/Object;)V",17),
        new MethodSpec("Lcom/android/server/utils/Watchable;->registerObserver(Lcom/android/server/utils/Watcher;)V",1025),
        new MethodSpec("Lcom/android/server/utils/Watchable;->unregisterObserver(Lcom/android/server/utils/Watcher;)V",1025),
        new MethodSpec("Lcom/android/server/utils/Watchable;->isRegisteredObserver(Lcom/android/server/utils/Watcher;)Z",1025),
        new MethodSpec("Lcom/android/server/pm/Settings;->registerObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/pm/Settings;->unregisterObserver(Lcom/android/server/utils/Watcher;)V",1),
        new MethodSpec("Lcom/android/server/pm/Settings;->isRegisteredObserver(Lcom/android/server/utils/Watcher;)Z",1)
    );
    private static final Set<String> JAVA_TYPES=Set.of("Ljava/lang/AutoCloseable;","Ljava/lang/Cloneable;","Ljava/lang/Object;","Ljava/lang/String;","Ljava/util/ArrayList;","Ljava/util/Collection;","Ljava/util/Map;","Ljava/util/Set;","Ljava/util/function/Consumer;");
    private static final List<String> CALLERS=List.of(
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z",
        "Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Lcom/android/server/pm/pkg/mutate/PackageStateMutator$InitialState;Ljava/lang/String;Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;",
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->$r8$lambda$LkYZxaA-VNUTmLOD_icXu8eEv08(IZLcom/android/server/pm/pkg/mutate/PackageStateWrite;)V",
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8;->accept(Ljava/lang/Object;)V",
        "Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper;->setHidden(Z)Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;",
        "Lcom/android/server/pm/PackageSetting;->setHidden(ZI)V",
        "Lcom/android/server/pm/PackageSetting;->setUserState(IJJIZZZZILandroid/util/ArrayMap;ZZLjava/lang/String;Landroid/util/ArraySet;Landroid/util/ArraySet;IILjava/lang/String;Ljava/lang/String;JILcom/android/server/pm/pkg/ArchiveState;)V"
    );
}
