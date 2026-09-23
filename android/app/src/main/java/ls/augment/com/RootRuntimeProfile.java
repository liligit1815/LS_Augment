package ls.augment.com;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;

/** Fixed synchronous Bridge/Compatibility/Entry sources. No hooks, deopts or admission. */
final class RootRuntimeProfile {
    static final int CLASS_COUNT=31;
    static final String COMMAND_DESCRIPTOR="Lcom/android/server/pm/PackageManagerShellCommand;->onCommand(Ljava/lang/String;)I";
    private static final int CLASS_KIND_FLAGS=0x7610,METHOD_FLAGS=0x1dff;
    private record ClassSpec(String name,String source,int flags,String parent,String[] interfaces) {}
    private record MethodSpec(String descriptor,String source,int flags) {}
    static final class Resolved {
        final Method command;
        final Class<?> shellClass;
        final Map<String,Class<?>> classes;
        final Map<Class<?>,RootCriticalProfile.SourceEvidence> evidence;
        final Map<String,Method> executionBoundaries;
        private Resolved(Resolver value,Method command) {
            this.command=command;shellClass=command.getDeclaringClass();
            classes=Collections.unmodifiableMap(new LinkedHashMap<>(value.classes));
            evidence=Collections.unmodifiableMap(new LinkedHashMap<>(value.evidence));
            executionBoundaries=Collections.unmodifiableMap(new LinkedHashMap<>(value.boundaries));
        }
    }
    static Resolved resolve(ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins,
                            RootCoverageAdditions.Resolved additions)throws ReflectiveOperationException {
        return new Resolver(Objects.requireNonNull(services),boot,Objects.requireNonNull(origins))
            .resolve(Objects.requireNonNull(additions));
    }
    private static final class Resolver {
        final ClassLoader services,boot;final RootAndroidClassOrigins origins;
        final Map<String,Class<?>> classes=new LinkedHashMap<>();
        final Map<Class<?>,RootCriticalProfile.SourceEvidence> evidence=new LinkedHashMap<>();
        final Map<String,Method> boundaries=new LinkedHashMap<>();
        Resolver(ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins){this.services=services;this.boot=boot;this.origins=origins;}
        Resolved resolve(RootCoverageAdditions.Resolved additions)throws ReflectiveOperationException {
            if(CLASSES.size()!=CLASS_COUNT || EXECUTION.size()!=5)throw invalid("Fixed runtime table count");
            for(ClassSpec spec:CLASSES) {
                ClassLoader selected=spec.source.startsWith("1/")?services:boot;
                Class<?> owner=Class.forName(spec.name,false,selected);
                RootCriticalProfile.SourceEvidence proof=origins.attest(owner,spec.source);
                if(owner.getClassLoader()!=selected || !matches(proof,owner,spec.source))
                    throw invalid("Runtime Class source/loader differs: "+spec.name);
                if(classes.putIfAbsent(spec.name,owner)!=null || evidence.putIfAbsent(owner,proof)!=null)
                    throw invalid("Duplicate runtime Class");
            }
            for(ClassSpec spec:CLASSES) {
                Class<?> owner=classes.get(spec.name);
                if((owner.getModifiers()&CLASS_KIND_FLAGS)!=(spec.flags&CLASS_KIND_FLAGS)
                        || owner.isSynthetic()!=((spec.flags&0x1000)!=0)
                        || owner.getSuperclass()!=(owner.isInterface()?null:type(spec.parent)))
                    throw invalid("Runtime Class kind/super differs: "+spec.name);
                Class<?>[] expected=new Class<?>[spec.interfaces.length];
                for(int i=0;i<expected.length;i++)expected[i]=type(spec.interfaces[i]);
                if(!Arrays.equals(owner.getInterfaces(),expected))throw invalid("Runtime Class interfaces differ: "+spec.name);
            }
            // D041 is already in the 94-member deopt plan. Retain that exact Method object.
            Method command=additions.methodsByDescriptor.get(COMMAND_DESCRIPTOR);
            RootCoverageAdditions.Member row=null;
            for(RootCoverageAdditions.Member candidate:additions.evidence) {
                Class<?> runtime=classes.get(candidate.method.getDeclaringClass().getName());
                if(runtime!=null && runtime!=candidate.method.getDeclaringClass())throw invalid("Additional declaring Class differs from runtime profile");
                if(candidate.expected.id.equals("D041")) {
                    if(row!=null)throw invalid("Duplicate D041 evidence");row=candidate;
                }
            }
            Class<?> shell=classes.get("com.android.server.pm.PackageManagerShellCommand");
            if(row==null || command==null || row.method!=command || !COMMAND_DESCRIPTOR.equals(row.expected.descriptor)
                    || !"1/classes2.dex".equals(row.expected.source) || row.expected.flags!=1
                    || !matches(row.origin,shell,"1/classes2.dex") || command.getDeclaringClass()!=shell
                    || !"onCommand".equals(command.getName()) || command.getReturnType()!=int.class
                    || !Arrays.equals(command.getParameterTypes(),new Class<?>[]{String.class}) || command.getModifiers()!=1)
                throw invalid("Exact retained D041 identity/shape differs");
            for(MethodSpec spec:EXECUTION) {
                RootCriticalProfile.Descriptor d=RootCriticalProfile.parseDescriptor(spec.descriptor);
                Class<?> owner=classes.get(d.owner);Class<?>[] parameters=new Class<?>[d.parameters.size()];
                if(owner==null || !matches(evidence.get(owner),owner,spec.source))throw invalid("Execution boundary owner source differs");
                for(int i=0;i<parameters.length;i++)parameters[i]=type(d.parameters.get(i));
                Method selected=null;Class<?> result=type(d.result);
                for(Method method:owner.getDeclaredMethods())if(method.getName().equals(d.name)
                        && method.getReturnType()==result && Arrays.equals(method.getParameterTypes(),parameters)) {
                    if(selected!=null)throw invalid("Ambiguous execution descriptor");selected=method;
                }
                if(selected==null || selected.getDeclaringClass()!=owner
                        || (selected.getModifiers()&METHOD_FLAGS)!=spec.flags || selected.isBridge() || selected.isSynthetic()
                        || selected.isVarArgs() || Modifier.isNative(selected.getModifiers()) || Modifier.isAbstract(selected.getModifiers()))
                    throw invalid("Runtime execution boundary differs: "+spec.descriptor);
                if(boundaries.putIfAbsent(spec.descriptor,selected)!=null)throw invalid("Duplicate execution boundary");
            }
            return new Resolved(this,command);
        }
        Class<?> type(String descriptor)throws ReflectiveOperationException {
            switch(descriptor) {
                case "V":return void.class;case "Z":return boolean.class;case "B":return byte.class;case "C":return char.class;
                case "S":return short.class;case "I":return int.class;case "J":return long.class;case "F":return float.class;case "D":return double.class;
            }
            if(descriptor.charAt(0)=='[')return Array.newInstance(type(descriptor.substring(1)),0).getClass();
            String name=descriptor.substring(1,descriptor.length()-1).replace('/','.');Class<?> known=classes.get(name);
            if(known!=null)return known;
            for(String[] row:SIGNATURE_TYPES)if(descriptor.equals(row[0]))
                return Class.forName(name,false,row[1].equals("BOOT_JAVA")?null:row[1].startsWith("1/")?services:boot);
            throw invalid("Uncatalogued runtime signature: "+descriptor);
        }
    }
    private static boolean matches(RootCriticalProfile.SourceEvidence proof,Class<?> owner,String source) {
        return proof!=null && proof.owner==owner && proof.definingLoader==owner.getClassLoader()
            && (source.startsWith("1/")?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256).equals(proof.archiveSha256)
            && source.substring(2).equals(proof.dexEntry);
    }
    private static NoSuchMethodException invalid(String reason){return new NoSuchMethodException(reason);}
    private static final List<ClassSpec> CLASSES=List.of(
        new ClassSpec("android.app.ActivityManagerInternal","2/classes.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.content.pm.IPackageManager$Stub","2/classes.dex",1025,"Landroid/os/Binder;",new String[]{"Landroid/content/pm/IPackageManager;"}),
        new ClassSpec("android.content.pm.IPackageManager","2/classes.dex",1537,"Ljava/lang/Object;",new String[]{"Landroid/os/IInterface;"}),
        new ClassSpec("android.content.pm.PackageManagerInternal","1/classes.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("android.content.pm.UserInfo","2/classes.dex",1,"Ljava/lang/Object;",new String[]{"Landroid/os/Parcelable;"}),
        new ClassSpec("android.os.ShellCommand","2/classes3.dex",1025,"Lcom/android/modules/utils/BasicShellCommandHandler;",new String[]{}),
        new ClassSpec("com.android.internal.pm.parsing.pkg.AndroidPackageInternal","2/classes5.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/AndroidPackage;","Lcom/android/internal/content/om/OverlayConfig$PackageProvider$Package;"}),
        new ClassSpec("com.android.modules.utils.BasicShellCommandHandler","2/classes5.dex",1025,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.LocalServices","2/classes.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.am.ActivityManagerService$LocalService","1/classes.dex",17,"Landroid/app/ActivityManagerInternal;",new String[]{"Lcom/android/server/am/ActivityManagerLocal;"}),
        new ClassSpec("com.android.server.am.ActivityManagerService$MainHandler","1/classes.dex",17,"Landroid/os/Handler;",new String[]{}),
        new ClassSpec("com.android.server.am.ActivityManagerService","1/classes.dex",1,"Landroid/app/IActivityManager$Stub;",new String[]{"Lcom/android/server/Watchdog$Monitor;","Lcom/android/server/power/stats/BatteryStatsImpl$BatteryCallback;","Lcom/android/server/am/ActivityManagerGlobalLock;"}),
        new ClassSpec("com.android.server.pm.BroadcastHelper","1/classes2.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.Computer","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/snapshot/PackageDataSnapshot;"}),
        new ClassSpec("com.android.server.pm.IPackageManagerBase","1/classes2.dex",1025,"Landroid/content/pm/IPackageManager$Stub;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageInstallerService","1/classes2.dex",1,"Landroid/content/pm/IPackageInstaller$Stub;",new String[]{"Lcom/android/server/pm/PackageSessionProvider;"}),
        new ClassSpec("com.android.server.pm.PackageManagerInternalBase","1/classes2.dex",1025,"Landroid/content/pm/PackageManagerInternal;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService$IPackageManagerImpl","1/classes2.dex",1,"Lcom/android/server/pm/IPackageManagerBase;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService$PackageManagerInternalImpl","1/classes2.dex",1,"Lcom/android/server/pm/PackageManagerInternalBase;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerService","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/PackageSender;","Landroid/content/pm/TestUtilityService;"}),
        new ClassSpec("com.android.server.pm.PackageManagerServiceZteHook","1/classes2.dex",17,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerShellCommand","1/classes2.dex",1,"Landroid/os/ShellCommand;",new String[]{}),
        new ClassSpec("com.android.server.pm.PackageManagerTracedLock","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{"Ljava/lang/AutoCloseable;"}),
        new ClassSpec("com.android.server.pm.PrivateSpaceHelper","1/classes2.dex",1,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.UserManagerService$UserData","1/classes2.dex",0,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.UserManagerService","1/classes2.dex",1,"Landroid/os/IUserManager$Stub;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.AndroidPackage","2/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageState","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageStateInternal","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/PackageState;"}),
        new ClassSpec("com.android.server.pm.pkg.PackageUserState","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{}),
        new ClassSpec("com.android.server.pm.pkg.PackageUserStateInternal","1/classes2.dex",1537,"Ljava/lang/Object;",new String[]{"Lcom/android/server/pm/pkg/PackageUserState;","Landroid/content/pm/pkg/FrameworkPackageUserState;"})
    );
    private static final List<MethodSpec> EXECUTION=List.of(
        new MethodSpec("Landroid/os/ShellCommand;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)I","2/classes3.dex",1),
        new MethodSpec("Lcom/android/modules/utils/BasicShellCommandHandler;->exec(Landroid/os/Binder;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;)I","2/classes5.dex",1),
        new MethodSpec("Lcom/android/modules/utils/BasicShellCommandHandler;->getNextArg()Ljava/lang/String;","2/classes5.dex",1),
        new MethodSpec("Lcom/android/modules/utils/BasicShellCommandHandler;->getOutPrintWriter()Ljava/io/PrintWriter;","2/classes5.dex",1),
        new MethodSpec("Landroid/content/pm/IPackageManager$Stub;->setApplicationHiddenSettingAsUser_enforcePermission()V","2/classes.dex",4)
    );
    private static final String[][] SIGNATURE_TYPES={
        {"Landroid/app/IActivityManager$Stub;","2/classes.dex"},
        {"Landroid/content/pm/IPackageInstaller$Stub;","2/classes.dex"},
        {"Landroid/content/pm/TestUtilityService;","1/classes.dex"},
        {"Landroid/content/pm/pkg/FrameworkPackageUserState;","2/classes.dex"},
        {"Landroid/os/Binder;","2/classes3.dex"},
        {"Landroid/os/Handler;","2/classes3.dex"},
        {"Landroid/os/IInterface;","2/classes3.dex"},
        {"Landroid/os/IUserManager$Stub;","2/classes3.dex"},
        {"Landroid/os/Parcelable;","2/classes3.dex"},
        {"Landroid/os/ResultReceiver;","2/classes3.dex"},
        {"Landroid/os/ShellCallback;","2/classes3.dex"},
        {"Lcom/android/internal/content/om/OverlayConfig$PackageProvider$Package;","2/classes5.dex"},
        {"Lcom/android/server/Watchdog$Monitor;","1/classes.dex"},
        {"Lcom/android/server/am/ActivityManagerGlobalLock;","1/classes.dex"},
        {"Lcom/android/server/am/ActivityManagerLocal;","1/classes.dex"},
        {"Lcom/android/server/pm/PackageSender;","1/classes2.dex"},
        {"Lcom/android/server/pm/PackageSessionProvider;","1/classes2.dex"},
        {"Lcom/android/server/pm/snapshot/PackageDataSnapshot;","1/classes2.dex"},
        {"Lcom/android/server/power/stats/BatteryStatsImpl$BatteryCallback;","1/classes2.dex"},
        {"Ljava/io/FileDescriptor;","BOOT_JAVA"},
        {"Ljava/io/PrintWriter;","BOOT_JAVA"},
        {"Ljava/lang/AutoCloseable;","BOOT_JAVA"},
        {"Ljava/lang/Object;","BOOT_JAVA"},
        {"Ljava/lang/String;","BOOT_JAVA"}
    };
}
