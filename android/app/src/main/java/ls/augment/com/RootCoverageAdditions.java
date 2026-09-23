package ls.augment.com;

import java.lang.reflect.Array;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/** Fixed additional declaring methods only; never invokes, hooks, deopts or grants admission. */
final class RootCoverageAdditions {
    static final int RETAINED_CALLER_COUNT=35, ADDITIONAL_CALLER_COUNT=19, TOTAL_CALLER_COUNT=54;
    private static final int METHOD_FLAGS=0x1dff;
    static final class Spec {
        final String id, descriptor, source;
        final int flags;
        Spec(String id,String descriptor,String source,int flags) {
            this.id=id;this.descriptor=descriptor;this.source=source;this.flags=flags;
        }
    }
    static final class Member {
        final Spec expected;
        final Method method;
        final RootCriticalProfile.SourceEvidence origin;
        private Member(Spec expected,Method method,RootCriticalProfile.SourceEvidence origin) {
            this.expected=expected;this.method=method;this.origin=origin;
        }
    }
    static final class Resolved {
        final List<Member> evidence;
        final List<Executable> callers;
        final Map<String,Method> methodsByDescriptor;
        private Resolved(List<Member> evidence,Map<String,Method> methods) {
            this.evidence=Collections.unmodifiableList(new ArrayList<>(evidence));
            this.methodsByDescriptor=Collections.unmodifiableMap(new LinkedHashMap<>(methods));
            this.callers=Collections.unmodifiableList(new ArrayList<Executable>(methods.values()));
        }
    }
    static Resolved resolveAdditional(ClassLoader serviceLoader,ClassLoader bootLoader,
            RootCriticalProfile.Origins origins) throws ReflectiveOperationException {
        Objects.requireNonNull(origins,"Actual class provenance is required");
        Map<Class<?>,RootCriticalProfile.SourceEvidence> sources=new LinkedHashMap<>();
        Map<String,Method> methods=new LinkedHashMap<>();
        List<Member> evidence=new ArrayList<>();
        for(Spec spec:SPECS) {
            RootCriticalProfile.Descriptor descriptor=RootCriticalProfile.parseDescriptor(spec.descriptor);
            boolean services=spec.source.startsWith("1/");
            if(!services && !spec.source.startsWith("2/"))throw invalid("Unknown source family");
            String dex=spec.source.substring(2);
            if(!dex.matches("classes[0-9]*\\.dex") || (spec.flags & ~METHOD_FLAGS)!=0)
                throw invalid("Invalid fixed source or flags");
            Class<?> owner=Class.forName(descriptor.owner,false,services?serviceLoader:bootLoader);
            RootCriticalProfile.SourceEvidence origin=sources.get(owner);
            if(origin==null) {
                origin=origins.attest(owner,spec.source);
                if(origin==null)throw invalid("Missing actual origin: "+descriptor.owner);
                sources.put(owner,origin);
            }
            String hash=services?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256;
            if(origin.owner!=owner || origin.definingLoader!=owner.getClassLoader()
                    || !hash.equals(origin.archiveSha256) || !dex.equals(origin.dexEntry))
                throw invalid("Unmatched actual origin: "+descriptor.owner);
            Class<?>[] parameters=new Class<?>[descriptor.parameters.size()];
            for(int i=0;i<parameters.length;i++)parameters[i]=type(descriptor.parameters.get(i),serviceLoader,bootLoader);
            Class<?> result=type(descriptor.result,serviceLoader,bootLoader);
            Method selected=null;
            for(Method method:owner.getDeclaredMethods()) {
                if(!method.getName().equals(descriptor.name) || method.getReturnType()!=result
                        || !Arrays.equals(method.getParameterTypes(),parameters))continue;
                if(selected!=null)throw invalid("Ambiguous complete descriptor: "+spec.descriptor);
                selected=method;
            }
            if(selected==null || selected.getDeclaringClass()!=owner)throw invalid("Missing declaring method: "+spec.descriptor);
            int flags=selected.getModifiers();
            if((flags & METHOD_FLAGS)!=spec.flags || selected.isBridge()!=((spec.flags&0x40)!=0)
                    || selected.isSynthetic()!=((spec.flags&0x1000)!=0)
                    || Modifier.isNative(flags) || Modifier.isAbstract(flags))
                throw invalid("Implementation flags differ: "+spec.descriptor);
            if(methods.putIfAbsent(spec.descriptor,selected)!=null)throw invalid("Duplicate additional descriptor");
            evidence.add(new Member(spec,selected,origin));
        }
        if(methods.size()!=ADDITIONAL_CALLER_COUNT)throw invalid("Incomplete additional method set");
        return new Resolved(evidence,methods);
    }
    /** Combines resolved objects only. This does not consume the 11 boundary conditions or grant readiness. */
    static List<Executable> combine(RootCriticalProfile retained,Resolved additions) throws ReflectiveOperationException {
        Objects.requireNonNull(retained);Objects.requireNonNull(additions);
        if(retained.hooks.size()!=5 || retained.callers.size()!=RETAINED_CALLER_COUNT
                || retained.methodsByDescriptor.size()!=40 || additions.callers.size()!=ADDITIONAL_CALLER_COUNT)
            throw invalid("Unexpected retained/additional method set");
        LinkedHashSet<Executable> combined=new LinkedHashSet<>(retained.callers);
        Map<String,Class<?>> owners=new LinkedHashMap<>();
        for(Method method:retained.methodsByDescriptor.values())
            owners.put(method.getDeclaringClass().getName(),method.getDeclaringClass());
        for(Map.Entry<String,Method> entry:additions.methodsByDescriptor.entrySet()) {
            Class<?> owner=entry.getValue().getDeclaringClass();
            Class<?> previous=owners.putIfAbsent(owner.getName(),owner);
            if(previous!=null && previous!=owner)throw invalid("Declaring Class changed between profiles");
            if(retained.methodsByDescriptor.containsKey(entry.getKey()) || !combined.add(entry.getValue()))
                throw invalid("Overlapping retained/additional method");
        }
        if(combined.size()!=TOTAL_CALLER_COUNT)throw invalid("Incomplete combined deopt list");
        return Collections.unmodifiableList(new ArrayList<>(combined));
    }
    private static Class<?> type(String descriptor,ClassLoader serviceLoader,ClassLoader bootLoader)
            throws ClassNotFoundException {
        switch(descriptor) {
            case "V":return void.class;case "Z":return boolean.class;case "B":return byte.class;
            case "C":return char.class;case "S":return short.class;case "I":return int.class;
            case "J":return long.class;case "F":return float.class;case "D":return double.class;
            default:
                if(descriptor.charAt(0)=='[')return Array.newInstance(type(descriptor.substring(1),serviceLoader,bootLoader),0).getClass();
                String binary=descriptor.substring(1,descriptor.length()-1).replace('/','.');
                if(binary.startsWith("java."))return Class.forName(binary,false,null);
                if(binary.startsWith("android."))return Class.forName(binary,false,bootLoader);
                if(binary.equals("com.android.internal.util.FunctionalUtils$ThrowingSupplier"))
                    return Class.forName(binary,false,bootLoader);
                if(binary.startsWith("com.android.server."))return Class.forName(binary,false,serviceLoader);
                throw new ClassNotFoundException("Uncatalogued signature namespace: "+binary);
        }
    }
    private static NoSuchMethodException invalid(String message) { return new NoSuchMethodException(message); }

    // BEGIN GENERATED ADDITIONAL SPECS
    private static final List<Spec> SPECS=Collections.unmodifiableList(Arrays.asList(
        new Spec("D036", "Landroid/app/IStopUserCallback$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes.dex", 1),
        new Spec("D037", "Landroid/os/IUserManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes3.dex", 1),
        new Spec("D038", "Lcom/android/server/am/UserController;->$r8$lambda$nWwxMxcB3bDFcnNaVn88ZowSjgk(Landroid/app/IStopUserCallback;I)V", "1/classes.dex", 4105),
        new Spec("D039", "Lcom/android/server/am/UserController$$ExternalSyntheticLambda0;->run()V", "1/classes.dex", 17),
        new Spec("D040", "Lcom/android/server/pm/PackageManagerShellCommand;->runCreateUser()I", "1/classes2.dex", 1),
        new Spec("D041", "Lcom/android/server/pm/PackageManagerShellCommand;->onCommand(Ljava/lang/String;)I", "1/classes2.dex", 1),
        new Spec("D042", "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onShellCommand(Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;[Ljava/lang/String;Landroid/os/ShellCallback;Landroid/os/ResultReceiver;)V", "1/classes2.dex", 1),
        new Spec("D043", "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "1/classes2.dex", 1),
        new Spec("D044", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->createProfileForUser(Landroid/app/admin/ManagedProfileProvisioningParams;I)Landroid/content/pm/UserInfo;", "1/classes.dex", 17),
        new Spec("D045", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->createManagedProfileInternal(Landroid/app/admin/ManagedProfileProvisioningParams;Lcom/android/server/devicepolicy/CallerIdentity;)Landroid/os/UserHandle;", "1/classes.dex", 17),
        new Spec("D046", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->lambda$createManagedProfile$176(Landroid/app/admin/ManagedProfileProvisioningParams;Lcom/android/server/devicepolicy/CallerIdentity;)Landroid/os/UserHandle;", "1/classes.dex", 4113),
        new Spec("D047", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->$r8$lambda$tdO9lpeDpT0_5KfKmqLSgVaUjqk(Lcom/android/server/devicepolicy/DevicePolicyManagerService;Landroid/app/admin/ManagedProfileProvisioningParams;Lcom/android/server/devicepolicy/CallerIdentity;)Landroid/os/UserHandle;", "1/classes.dex", 4105),
        new Spec("D048", "Lcom/android/server/devicepolicy/DevicePolicyManagerService$$ExternalSyntheticLambda71;->getOrThrow()Ljava/lang/Object;", "1/classes.dex", 17),
        new Spec("D049", "Lcom/android/server/devicepolicy/DevicePolicyManagerService$Injector;->binderWithCleanCallingIdentity(Lcom/android/internal/util/FunctionalUtils$ThrowingSupplier;)Ljava/lang/Object;", "1/classes.dex", 17),
        new Spec("D050", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->createManagedProfile(Landroid/app/admin/ManagedProfileProvisioningParams;Ljava/lang/String;)Landroid/os/UserHandle;", "1/classes.dex", 1),
        new Spec("D051", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->lambda$createAndProvisionManagedProfile$175(Landroid/app/admin/ManagedProfileProvisioningParams;Lcom/android/server/devicepolicy/CallerIdentity;Ljava/lang/String;)Landroid/os/UserHandle;", "1/classes.dex", 4113),
        new Spec("D052", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->$r8$lambda$bWTSbNPGIcBsCouvt0btSW6tAoA(Lcom/android/server/devicepolicy/DevicePolicyManagerService;Landroid/app/admin/ManagedProfileProvisioningParams;Lcom/android/server/devicepolicy/CallerIdentity;Ljava/lang/String;)Landroid/os/UserHandle;", "1/classes.dex", 4105),
        new Spec("D053", "Lcom/android/server/devicepolicy/DevicePolicyManagerService$$ExternalSyntheticLambda107;->getOrThrow()Ljava/lang/Object;", "1/classes.dex", 17),
        new Spec("D054", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->createAndProvisionManagedProfile(Landroid/app/admin/ManagedProfileProvisioningParams;Ljava/lang/String;)Landroid/os/UserHandle;", "1/classes.dex", 1)));
    // END GENERATED ADDITIONAL SPECS
}
