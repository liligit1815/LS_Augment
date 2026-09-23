package ls.augment.com;

import java.lang.reflect.Array;
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

/** Fixed OEM request-entry metadata. No invocation, hook, deopt or ownership authority. */
final class RootHiddenRequestProfile {
    static final int CLASS_COUNT=52, FIELD_COUNT=10, METHOD_COUNT=21, CALLER_COUNT=19;
    private static final int CLASS_KIND_FLAGS=0x7610, FIELD_FLAGS=0x50df, METHOD_FLAGS=0x1dff;
    private record ClassSpec(String name,String source,int flags,String parent,String[] interfaces) {}
    private record FieldSpec(String descriptor,int flags) {}
    private record MethodSpec(String descriptor,int flags) {}

    static final class Resolved {
        final Method hook;
        final Method permission;
        final Method copy;
        final Method lookup;
        final List<Method> callers;
        final Map<String,Class<?>> classes;
        final Map<String,Field> fields;
        final Map<String,Method> methods;
        final Map<Class<?>,RootCriticalProfile.SourceEvidence> evidence;
        // Shared dispatch, additional loaded code and its compiled copies remain unproven.
        // Successful resolution/deoptimization of this finite list cannot change this fact.
        final boolean allCoverageProven=false;
        private Resolved(Resolver resolver)throws ReflectiveOperationException {
            classes=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.classes));
            fields=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.fields));
            methods=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.methods));
            evidence=Collections.unmodifiableMap(new LinkedHashMap<>(resolver.evidence));
            hook=methods.get(HOOK);
            permission=methods.get(PERMISSION);
            copy=methods.get(COPY);
            lookup=methods.get(LOOKUP);
            List<Method> selected=new ArrayList<>();
            for(String descriptor:CALLERS) {
                Method method=methods.get(descriptor);
                if(method==null || method.equals(permission) || method.equals(lookup) || selected.contains(method))
                    throw invalid("Incomplete/duplicate hidden-request caller");
                selected.add(method);
            }
            if(hook==null || permission==null || copy==null || lookup==null || hook.equals(permission)
                    || copy.equals(hook) || copy.equals(permission) || lookup.equals(hook)
                    || lookup.equals(permission) || lookup.equals(copy) || !selected.contains(hook)
                    || !selected.contains(copy) || selected.size()!=CALLER_COUNT)
                throw invalid("Incomplete hidden-request profile");
            callers=Collections.unmodifiableList(selected);
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
            if(CLASSES.size()!=CLASS_COUNT || FIELDS.size()!=FIELD_COUNT
                    || METHODS.size()!=METHOD_COUNT || CALLERS.size()!=CALLER_COUNT)
                throw invalid("Incomplete fixed hidden-request metadata");
            for(ClassSpec spec:CLASSES) {
                ClassLoader selected=spec.source.startsWith("1/")?services:boot;
                Class<?> owner=Class.forName(spec.name,false,selected);
                RootCriticalProfile.SourceEvidence proof=origins.attest(owner,spec.source);
                if(owner.getClassLoader()!=selected || proof==null || proof.owner!=owner
                        || proof.definingLoader!=owner.getClassLoader()
                        || !(spec.source.startsWith("1/")?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256).equals(proof.archiveSha256)
                        || !spec.source.substring(2).equals(proof.dexEntry))
                    throw invalid("Hidden-request Class source/loader differs: "+spec.name);
                if(classes.putIfAbsent(spec.name,owner)!=null || evidence.putIfAbsent(owner,proof)!=null)
                    throw invalid("Duplicate hidden-request Class");
            }
            for(ClassSpec spec:CLASSES) {
                Class<?> owner=classes.get(spec.name);
                if((owner.getModifiers()&CLASS_KIND_FLAGS)!=(spec.flags&CLASS_KIND_FLAGS)
                        || owner.isSynthetic()!=((spec.flags&0x1000)!=0)
                        || owner.getSuperclass()!=(owner.isInterface()?null:type(spec.parent)))
                    throw invalid("Hidden-request Class kind/super differs: "+spec.name);
                Class<?>[] interfaces=new Class<?>[spec.interfaces.length];
                for(int i=0;i<interfaces.length;i++)interfaces[i]=type(spec.interfaces[i]);
                if(!Arrays.equals(owner.getInterfaces(),interfaces))
                    throw invalid("Hidden-request Class interfaces differ: "+spec.name);
            }
            for(FieldSpec spec:FIELDS) {
                int split=spec.descriptor.indexOf(";->"),colon=spec.descriptor.indexOf(':',split+3);
                Class<?> owner=classes.get(spec.descriptor.substring(1,split).replace('/','.'));
                if(owner==null)throw new NoSuchFieldException("Unattested hidden-request field owner");
                String name=spec.descriptor.substring(split+3,colon);
                Field field=owner.getDeclaredField(name);
                if(field.getDeclaringClass()!=owner || field.getType()!=type(spec.descriptor.substring(colon+1))
                        || (field.getModifiers()&FIELD_FLAGS)!=spec.flags
                        || field.isSynthetic()!=((spec.flags&0x1000)!=0))
                    throw new NoSuchFieldException("Hidden-request field flags/type/owner differ: "+spec.descriptor);
                try{field.setAccessible(true);}catch(RuntimeException failure){
                    throw new ReflectiveOperationException("Hidden-request field access unavailable",failure);
                }
                if(fields.putIfAbsent(owner.getName()+"#"+name,field)!=null)
                    throw new NoSuchFieldException("Duplicate hidden-request field");
            }
            for(MethodSpec spec:METHODS) {
                RootCriticalProfile.Descriptor descriptor=RootCriticalProfile.parseDescriptor(spec.descriptor);
                Class<?> owner=classes.get(descriptor.owner);
                if(owner==null)throw invalid("Unattested hidden-request owner");
                Class<?>[] parameters=new Class<?>[descriptor.parameters.size()];
                for(int i=0;i<parameters.length;i++)parameters[i]=type(descriptor.parameters.get(i));
                Class<?> result=type(descriptor.result);Method selected=null;
                for(Method method:owner.getDeclaredMethods())if(method.getName().equals(descriptor.name)
                        && method.getReturnType()==result && Arrays.equals(method.getParameterTypes(),parameters)) {
                    if(selected!=null)throw invalid("Ambiguous hidden-request descriptor");selected=method;
                }
                if(selected==null || selected.getDeclaringClass()!=owner
                        || (selected.getModifiers()&METHOD_FLAGS)!=spec.flags
                        || selected.isBridge()!=((spec.flags&0x40)!=0)
                        || selected.isVarArgs()!=((spec.flags&0x80)!=0)
                        || selected.isSynthetic()!=((spec.flags&0x1000)!=0)
                        || Modifier.isNative(selected.getModifiers()) || Modifier.isAbstract(selected.getModifiers()))
                    throw invalid("Hidden-request method flags/type/owner differ: "+spec.descriptor);
                try{selected.setAccessible(true);}catch(RuntimeException failure){
                    throw new ReflectiveOperationException("Hidden-request method access unavailable",failure);
                }
                if(methods.putIfAbsent(spec.descriptor,selected)!=null)throw invalid("Duplicate hidden-request method");
            }
            return new Resolved(this);
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
            throw invalid("Uncatalogued hidden-request signature: "+descriptor);
        }
    }
    private static NoSuchMethodException invalid(String reason){return new NoSuchMethodException(reason);}
    private static final String HOOK="Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z";
    private static final String PERMISSION="Landroid/content/pm/IPackageManager$Stub;->setApplicationHiddenSettingAsUser_enforcePermission()V";
    private static final String COPY="Lcom/android/server/pm/InstallPackageHelper;->prepareInitialScanRequest(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IILandroid/os/UserHandle;Ljava/lang/String;)Lcom/android/server/pm/ScanRequest;";
    private static final String LOOKUP="Lcom/android/server/pm/Settings;->getPackageLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;";
    private static final List<ClassSpec> CLASSES=List.of(
        new ClassSpec("android.app.ApplicationPackageManager","2/classes.dex",1,"Landroid/content/pm/PackageManager;",new String[]{}),
        new ClassSpec("android.app.admin.PolicyKey","2/classes.dex",1025,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.app.admin.PolicyValue","2/classes.dex",1025,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.content.Context","2/classes.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.content.pm.IPackageManager$Stub","2/classes.dex",1025,"Landroid/os/Binder;",new String[]{"Landroid/content/pm/IPackageManager;"}),
        new ClassSpec("android.content.pm.IPackageManager","2/classes.dex",1537,"Ljava/lang/Object;",new String[]{"Landroid/os/IInterface;"}),
        new ClassSpec("android.content.pm.PackageManager","2/classes.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.content.pm.TestUtilityService","1/classes.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.Binder","2/classes3.dex",1,"Ljava/lang/Object;",new String[]{"Landroid/os/IBinder;"}),
        new ClassSpec("android.os.IBinder","2/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.IInterface","2/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.Parcel","2/classes3.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.Parcelable","2/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.os.ResultReceiver","2/classes3.dex",1,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.os.ShellCallback","2/classes3.dex",1,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.os.ShellCommand","2/classes3.dex",1025,"Lcom/android/modules/utils/BasicShellCommandHandler;",new String[]{}),
        new ClassSpec("android.os.UserHandle","2/classes3.dex",17,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.util.Pair","2/classes4.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.content.om.OverlayConfig$PackageProvider$Package","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.infra.AndroidFuture","2/classes5.dex",1,"Ljava/util/concurrent/CompletableFuture;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.AndroidPackageHidden","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.AndroidPackageInternal","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/AndroidPackage;","Lcom/android/internal/content/om/OverlayConfig$PackageProvider$Package;"}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.PackageImpl","2/classes5.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/internal/pm/parsing/pkg/ParsedPackage;","Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;","Lcom/android/internal/pm/parsing/pkg/AndroidPackageHidden;","Lcom/android/internal/pm/pkg/parsing/ParsingPackage;","Lcom/android/internal/pm/pkg/parsing/ParsingPackageHidden;","Landroid/os/Parcelable;"}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.ParsedPackage","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/AndroidPackage;"}),
        new ClassSpec("com.android.internal.pm.pkg.parsing.ParsingPackage","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.pm.pkg.parsing.ParsingPackageHidden","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.internal.util.FunctionalUtils$ThrowingSupplier","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{"Ljava/util/function/Supplier;"}),
        new ClassSpec("com.android.internal.util.function.QuadFunction","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.modules.utils.BasicShellCommandHandler","2/classes5.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.devicepolicy.DevicePolicyEngine","1/classes.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.devicepolicy.PolicyDefinition$$ExternalSyntheticLambda2","1/classes.dex",4113,"Ljava/lang/Object;",new String[]{"Lcom/android/internal/util/function/QuadFunction;"}),
        new ClassSpec("com.android.server.devicepolicy.PolicyDefinition","1/classes.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.devicepolicy.PolicyEnforcerCallbacks$$ExternalSyntheticLambda6","1/classes.dex",4113,"Ljava/lang/Object;",new String[]{"Lcom/android/internal/util/FunctionalUtils$ThrowingSupplier;"}),
        new ClassSpec("com.android.server.devicepolicy.PolicyEnforcerCallbacks","1/classes.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.IPackageManagerBase","1/classes2.dex",1025,"Landroid/content/pm/IPackageManager$Stub;",new String[]{}),
        new ClassSpec("com.android.server.pm.InstallPackageHelper","1/classes2.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService$IPackageManagerImpl","1/classes2.dex",1,"Lcom/android/server/pm/IPackageManagerBase;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/PackageSender;","Landroid/content/pm/TestUtilityService;"}),
        new ClassSpec("com.android.server.pm.PackageManagerShellCommand","1/classes2.dex",1,"Landroid/os/ShellCommand;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerTracedLock","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Ljava/lang/AutoCloseable;"}),
        new ClassSpec("com.android.server.pm.PackageSender","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageSetting","1/classes2.dex",1,"Lcom/android/server/pm/SettingBase;",new String[]{"Lcom/android/server/pm/pkg/PackageStateInternal;"}),
        new ClassSpec("com.android.server.pm.ResilientAtomicFile$ReadEventLogger","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.ScanRequest","1/classes2.dex",16,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.ScanResult","1/classes2.dex",16,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.SettingBase","1/classes2.dex",1025,"Ljava/lang/Object;",new String[]{"Lcom/android/server/utils/Watchable;","Lcom/android/server/utils/Snappable;"}),
        new ClassSpec("com.android.server.pm.Settings","1/classes2.dex",17,"Ljava/lang/Object;",new String[]{"Lcom/android/server/utils/Watchable;","Lcom/android/server/utils/Snappable;","Lcom/android/server/pm/ResilientAtomicFile$ReadEventLogger;"}),
        new ClassSpec("com.android.server.pm.pkg.AndroidPackage","2/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageState","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageStateInternal","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/PackageState;"}),
        new ClassSpec("com.android.server.utils.Snappable","1/classes3.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.utils.Watchable","1/classes3.dex",1537,"Ljava/lang/Object;",new String[]{})
    );
    private static final List<FieldSpec> FIELDS=List.of(
        new FieldSpec("Lcom/android/server/pm/InstallPackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mPackageStateWriteLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->this$0:Lcom/android/server/pm/PackageManagerService;",4113),
        new FieldSpec("Lcom/android/internal/pm/parsing/pkg/PackageImpl;->packageName:Ljava/lang/String;",4),
        new FieldSpec("Lcom/android/internal/pm/parsing/pkg/PackageImpl;->originalPackages:Ljava/util/List;",4),
        new FieldSpec("Lcom/android/internal/pm/parsing/pkg/PackageImpl;->mBooleans:J",2),
        new FieldSpec("Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;",17),
        new FieldSpec("Lcom/android/server/pm/Settings;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;",17),
        new FieldSpec("Lcom/android/server/pm/PackageSetting;->mName:Ljava/lang/String;",1)
    );
    private static final List<MethodSpec> METHODS=List.of(
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z",1),
        new MethodSpec("Landroid/content/pm/IPackageManager$Stub;->setApplicationHiddenSettingAsUser_enforcePermission()V",4),
        new MethodSpec("Landroid/content/pm/IPackageManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerShellCommand;->runSetHiddenSetting(Z)I",17),
        new MethodSpec("Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks;->$r8$lambda$D1RBEpFVJNTU1BZDBtLcWbDin4w(Landroid/app/admin/PolicyKey;Ljava/lang/Boolean;I)Lcom/android/internal/infra/AndroidFuture;",4105),
        new MethodSpec("Landroid/app/ApplicationPackageManager;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZLandroid/os/UserHandle;)Z",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerShellCommand;->onCommand(Ljava/lang/String;)I",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onShellCommand(Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)V",1),
        new MethodSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z",1),
        new MethodSpec("Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks$$ExternalSyntheticLambda6;->getOrThrow()Ljava/lang/Object;",17),
        new MethodSpec("Landroid/os/Binder;->withCleanCallingIdentity(Lcom/android/internal/util/FunctionalUtils$ThrowingSupplier;)Ljava/lang/Object;",25),
        new MethodSpec("Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks;->setApplicationHidden(Ljava/lang/Boolean;Landroid/content/Context;ILandroid/app/admin/PolicyKey;)Ljava/util/concurrent/CompletableFuture;",9),
        new MethodSpec("Lcom/android/server/devicepolicy/PolicyDefinition$$ExternalSyntheticLambda2;->apply(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",17),
        new MethodSpec("Lcom/android/server/devicepolicy/PolicyDefinition;->enforcePolicy(Ljava/lang/Object;Landroid/content/Context;I)Ljava/util/concurrent/CompletableFuture;",1),
        new MethodSpec("Lcom/android/server/devicepolicy/DevicePolicyEngine;->enforcePolicy(Lcom/android/server/devicepolicy/PolicyDefinition;Landroid/app/admin/PolicyValue;I)Ljava/util/concurrent/CompletableFuture;",17),
        new MethodSpec("Landroid/os/ShellCommand;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)I",1),
        new MethodSpec("Lcom/android/modules/utils/BasicShellCommandHandler;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;)I",1),
        new MethodSpec("Lcom/android/server/pm/InstallPackageHelper;->prepareInitialScanRequest(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IILandroid/os/UserHandle;Ljava/lang/String;)Lcom/android/server/pm/ScanRequest;",17),
        new MethodSpec("Lcom/android/server/pm/InstallPackageHelper;->scanPackageForInitLI(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IILandroid/os/UserHandle;)Landroid/util/Pair;",17),
        new MethodSpec("Lcom/android/server/pm/InstallPackageHelper;->scanPackageNew(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IIJLandroid/os/UserHandle;Ljava/lang/String;)Lcom/android/server/pm/ScanResult;",17),
        new MethodSpec("Lcom/android/server/pm/Settings;->getPackageLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;",1)
    );
    private static final List<String> CALLERS=List.of(
        "Landroid/content/pm/IPackageManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z",
        "Lcom/android/server/pm/PackageManagerShellCommand;->runSetHiddenSetting(Z)I",
        "Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks;->$r8$lambda$D1RBEpFVJNTU1BZDBtLcWbDin4w(Landroid/app/admin/PolicyKey;Ljava/lang/Boolean;I)Lcom/android/internal/infra/AndroidFuture;",
        "Landroid/app/ApplicationPackageManager;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZLandroid/os/UserHandle;)Z",
        "Lcom/android/server/pm/PackageManagerShellCommand;->onCommand(Ljava/lang/String;)I",
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onShellCommand(Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)V",
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z",
        "Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks$$ExternalSyntheticLambda6;->getOrThrow()Ljava/lang/Object;",
        "Landroid/os/Binder;->withCleanCallingIdentity(Lcom/android/internal/util/FunctionalUtils$ThrowingSupplier;)Ljava/lang/Object;",
        "Lcom/android/server/devicepolicy/PolicyEnforcerCallbacks;->setApplicationHidden(Ljava/lang/Boolean;Landroid/content/Context;ILandroid/app/admin/PolicyKey;)Ljava/util/concurrent/CompletableFuture;",
        "Lcom/android/server/devicepolicy/PolicyDefinition$$ExternalSyntheticLambda2;->apply(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "Lcom/android/server/devicepolicy/PolicyDefinition;->enforcePolicy(Ljava/lang/Object;Landroid/content/Context;I)Ljava/util/concurrent/CompletableFuture;",
        "Lcom/android/server/devicepolicy/DevicePolicyEngine;->enforcePolicy(Lcom/android/server/devicepolicy/PolicyDefinition;Landroid/app/admin/PolicyValue;I)Ljava/util/concurrent/CompletableFuture;",
        "Landroid/os/ShellCommand;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)I",
        "Lcom/android/modules/utils/BasicShellCommandHandler;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;)I",
        "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z",
        "Lcom/android/server/pm/InstallPackageHelper;->prepareInitialScanRequest(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IILandroid/os/UserHandle;Ljava/lang/String;)Lcom/android/server/pm/ScanRequest;",
        "Lcom/android/server/pm/InstallPackageHelper;->scanPackageForInitLI(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IILandroid/os/UserHandle;)Landroid/util/Pair;",
        "Lcom/android/server/pm/InstallPackageHelper;->scanPackageNew(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;IIJLandroid/os/UserHandle;Ljava/lang/String;)Lcom/android/server/pm/ScanResult;"
    );
    private static final Set<String> JAVA_TYPES=Set.of("Ljava/io/FileDescriptor;","Ljava/lang/AutoCloseable;","Ljava/lang/Boolean;","Ljava/lang/Object;","Ljava/lang/String;","Ljava/util/List;","Ljava/util/concurrent/CompletableFuture;","Ljava/util/function/Supplier;");
}
