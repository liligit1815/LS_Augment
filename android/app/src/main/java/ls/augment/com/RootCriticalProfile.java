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

/** Fixed retained-OEM descriptor resolver only. Does not install, deoptimize, invoke or issue READY. */
final class RootCriticalProfile {
    static final String CATALOG_SHA256="e4ac9f483e40ac484dba1914de366db56b5dbf79f46f419ec2bb4e2aa2f72338";
    static final String SERVICES_SHA256="63c595f1ae0dedfaa94817190ef8a82a04a6a031cf60e3446e8dfecffabca4c0";
    static final String FRAMEWORK_SHA256="985180a74e2bb9f0e8a9492b5190be7111012a22e329c8246ebcf8d43bf9e90f";
    // Reflection-visible method flags: access, static/final/synchronized, bridge/varargs,
    // native/abstract/strict/synthetic. DEX constructor/declared-synchronized bits are not silently dropped.
    private static final int METHOD_FLAGS=0x1dff;

    interface Origins {
        /**
         * External trusted provenance boundary. Derive evidence from the actual Class/DEX mapping
         * and authenticated runtime archive bytes; copying expected hashes is NOT verification.
         * No default shape-only implementation is supplied. This is not a runtime Admission issuer.
         */
        SourceEvidence attest(Class<?> actualOwner, String expectedSource) throws ReflectiveOperationException;
    }
    static final class SourceEvidence {
        final Class<?> owner;
        final ClassLoader definingLoader;
        final String archiveSha256, dexEntry;
        SourceEvidence(Class<?> owner, ClassLoader definingLoader, String archiveSha256, String dexEntry) {
            this.owner=Objects.requireNonNull(owner); this.definingLoader=definingLoader;
            this.archiveSha256=Objects.requireNonNull(archiveSha256); this.dexEntry=Objects.requireNonNull(dexEntry);
        }
    }
    static final class MemberSpec {
        final String key, descriptor, source;
        final int flags;
        MemberSpec(String key, String descriptor, String source, int flags) {
            this.key=key; this.descriptor=descriptor; this.source=source; this.flags=flags;
        }
    }
    static final class ResolvedMember {
        final MemberSpec expected;
        final Method method;
        final SourceEvidence origin;
        ResolvedMember(MemberSpec expected, Method method, SourceEvidence origin) {
            this.expected=expected; this.method=method; this.origin=origin;
        }
    }
    static final class Unresolved {
        final String descriptor, source, reason;
        Unresolved(String descriptor, String source, String reason) {
            this.descriptor=descriptor; this.source=source; this.reason=reason;
        }
    }

    final Map<String,Method> hooks;
    final List<Executable> callers;
    final Map<String,Method> methodsByDescriptor;
    final List<ResolvedMember> evidence;
    final List<Unresolved> unresolved;

    private RootCriticalProfile(Map<String,Method> hooks,List<Executable> callers,
            Map<String,Method> methods,List<ResolvedMember> evidence) {
        this.hooks=Collections.unmodifiableMap(new LinkedHashMap<>(hooks));
        this.callers=Collections.unmodifiableList(new ArrayList<>(callers));
        this.methodsByDescriptor=Collections.unmodifiableMap(new LinkedHashMap<>(methods));
        this.evidence=Collections.unmodifiableList(new ArrayList<>(evidence));
        this.unresolved=UNRESOLVED;
    }

    /** Null bootLoader means the VM bootstrap loader; serviceLoader may delegate to it. */
    static RootCriticalProfile resolve(ClassLoader serviceLoader,ClassLoader bootLoader,Origins origins)
            throws ReflectiveOperationException {
        Objects.requireNonNull(origins,"Actual class provenance is required");
        LinkedHashMap<String,Method> hooks=new LinkedHashMap<>(), methods=new LinkedHashMap<>();
        LinkedHashSet<Executable> callers=new LinkedHashSet<>();
        ArrayList<ResolvedMember> evidence=new ArrayList<>();
        Map<Class<?>,SourceEvidence> sources=new LinkedHashMap<>();
        for (MemberSpec spec:HOOKS) {
            ResolvedMember resolved=resolveMember(spec,serviceLoader,bootLoader,origins,sources);
            if(hooks.put(spec.key,resolved.method)!=null) throw new NoSuchMethodException("Duplicate critical hook key");
            addResolved(resolved,methods,evidence);
        }
        for (MemberSpec spec:CALLERS) {
            ResolvedMember resolved=resolveMember(spec,serviceLoader,bootLoader,origins,sources);
            addResolved(resolved,methods,evidence);callers.add(resolved.method);
        }
        if(hooks.size()!=5 || callers.size()!=35 || methods.size()!=40)
            throw new NoSuchMethodException("Incomplete fixed critical method set");
        return new RootCriticalProfile(hooks,new ArrayList<>(callers),methods,evidence);
    }
    private static void addResolved(ResolvedMember value,Map<String,Method> methods,List<ResolvedMember> evidence)
            throws NoSuchMethodException {
        Method old=methods.putIfAbsent(value.expected.descriptor,value.method);
        if(old!=null && !old.equals(value.method)) throw new NoSuchMethodException("Conflicting descriptor owner");
        if(old==null)evidence.add(value);
    }
    private static ResolvedMember resolveMember(MemberSpec spec,ClassLoader serviceLoader,ClassLoader bootLoader,
            Origins origins,Map<Class<?>,SourceEvidence> sources) throws ReflectiveOperationException {
        Descriptor descriptor=parseDescriptor(spec.descriptor);
        boolean services=spec.source.startsWith("1/");
        if(!services && !spec.source.startsWith("2/"))throw new NoSuchMethodException("Unknown source family");
        String dex=spec.source.substring(2);
        if(!dex.matches("classes[0-9]*\\.dex"))throw new NoSuchMethodException("Invalid DEX source");
        if((spec.flags & ~METHOD_FLAGS)!=0)throw new NoSuchMethodException("Unsupported DEX method flags");
        Class<?> owner=Class.forName(descriptor.owner,false,services?serviceLoader:bootLoader);
        SourceEvidence provenance=sources.get(owner);
        if(provenance==null) {
            provenance=origins.attest(owner,spec.source);
            if(provenance==null)throw new ClassNotFoundException("Missing actual owner provenance: "+descriptor.owner);
            sources.put(owner,provenance);
        }
        String expectedHash=services?SERVICES_SHA256:FRAMEWORK_SHA256;
        if(provenance.owner!=owner || provenance.definingLoader!=owner.getClassLoader()
                || !expectedHash.equals(provenance.archiveSha256) || !dex.equals(provenance.dexEntry))
            throw new ClassNotFoundException("Unmatched declaring-class source: "+descriptor.owner);
        Class<?>[] parameters=new Class<?>[descriptor.parameters.size()];
        for(int i=0;i<parameters.length;i++)parameters[i]=resolveType(descriptor.parameters.get(i),serviceLoader,bootLoader);
        Class<?> result=resolveType(descriptor.result,serviceLoader,bootLoader);
        Method selected=null;
        // getDeclaredMethod omits return type and can pick the wrong bridge/covariant method.
        for(Method method:owner.getDeclaredMethods()) {
            if(!method.getName().equals(descriptor.name) || method.getReturnType()!=result
                    || !Arrays.equals(method.getParameterTypes(),parameters))continue;
            if(selected!=null)throw new NoSuchMethodException("Ambiguous exact descriptor: "+spec.descriptor);
            selected=method;
        }
        if(selected==null || selected.getDeclaringClass()!=owner)
            throw new NoSuchMethodException("Missing declared descriptor: "+spec.descriptor);
        int actual=selected.getModifiers();
        if((actual & METHOD_FLAGS)!=spec.flags
                || selected.isBridge()!=((spec.flags&0x40)!=0)
                || selected.isSynthetic()!=((spec.flags&0x1000)!=0)
                || Modifier.isNative(actual) || Modifier.isAbstract(actual))
            throw new NoSuchMethodException("Method implementation flags differ: "+spec.descriptor);
        return new ResolvedMember(spec,selected,provenance);
    }
    private static Class<?> resolveType(String type,ClassLoader serviceLoader,ClassLoader bootLoader)
            throws ClassNotFoundException {
        switch(type) {
            case "V":return void.class; case "Z":return boolean.class; case "B":return byte.class;
            case "C":return char.class; case "S":return short.class; case "I":return int.class;
            case "J":return long.class; case "F":return float.class; case "D":return double.class;
            default:
                if(type.charAt(0)=='[')return Array.newInstance(resolveType(type.substring(1),serviceLoader,bootLoader),0).getClass();
                String binary=type.substring(1,type.length()-1).replace('/','.');
                if(binary.startsWith("java."))return Class.forName(binary,false,null);
                if(binary.startsWith("android."))return Class.forName(binary,false,bootLoader);
                if(binary.startsWith("com.android.server."))return Class.forName(binary,false,serviceLoader);
                throw new ClassNotFoundException("Uncatalogued signature namespace: "+binary);
        }
    }

    static final class Descriptor {
        final String owner,name,result;
        final List<String> parameters;
        Descriptor(String owner,String name,List<String> parameters,String result) {
            this.owner=owner;this.name=name;this.parameters=Collections.unmodifiableList(new ArrayList<>(parameters));this.result=result;
        }
    }
    static Descriptor parseDescriptor(String text) throws NoSuchMethodException {
        if(text==null || text.length()>2048)throw invalid();
        int ownerEnd=text.indexOf(";->"), open=text.indexOf('(',ownerEnd+3), close=text.indexOf(')',open+1);
        if(ownerEnd<2 || open<ownerEnd+4 || close<open || text.charAt(0)!='L')throw invalid();
        String owner=text.substring(1,ownerEnd),name=text.substring(ownerEnd+3,open);
        if(!validClassName(owner) || !name.matches("[A-Za-z0-9_$-]+"))throw invalid();
        ArrayList<String> parameters=new ArrayList<>();int cursor=open+1;
        while(cursor<close) {
            int end=typeEnd(text,cursor,false);
            if(end>close)throw invalid();parameters.add(text.substring(cursor,end));cursor=end;
        }
        if(cursor!=close || close+1>=text.length())throw invalid();
        int end=typeEnd(text,close+1,true);if(end!=text.length())throw invalid();
        return new Descriptor(owner.replace('/','.'),name,parameters,text.substring(close+1));
    }
    private static int typeEnd(String text,int start,boolean allowVoid) throws NoSuchMethodException {
        int cursor=start,dimensions=0;
        while(cursor<text.length() && text.charAt(cursor)=='[') {cursor++;if(++dimensions>255)throw invalid();}
        if(cursor>=text.length())throw invalid();char kind=text.charAt(cursor);
        if(kind=='V') {if(!allowVoid || dimensions!=0)throw invalid();return cursor+1;}
        if("ZBCSIJFD".indexOf(kind)>=0)return cursor+1;
        if(kind!='L')throw invalid();int end=text.indexOf(';',cursor+1);
        if(end<0 || !validClassName(text.substring(cursor+1,end)))throw invalid();return end+1;
    }
    private static boolean validClassName(String name) {return name.matches("[A-Za-z0-9_$]+(?:/[A-Za-z0-9_$]+)*");}
    private static NoSuchMethodException invalid() {return new NoSuchMethodException("Invalid complete DEX method descriptor");}

    // Generated only from the frozen catalog; generation and all original source hashes are audited.
    // BEGIN FROZEN CATALOG
    private static final List<MemberSpec> HOOKS=Collections.unmodifiableList(Arrays.asList(
        new MemberSpec("G1", "Lcom/android/server/pm/UserManagerService;->createUserInternalUnchecked(Ljava/lang/String;Ljava/lang/String;IIZ[Ljava/lang/String;Ljava/lang/Object;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 17),
        new MemberSpec("G2", "Lcom/android/server/pm/UserManagerService;->removeUserState(I)V", "1/classes2.dex", 17),
        new MemberSpec("G3", "Lcom/android/server/devicepolicy/DevicePolicyManagerService;->createAndManageUser(Landroid/content/ComponentName;Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/PersistableBundle;I)Landroid/os/UserHandle;", "1/classes.dex", 1),
        new MemberSpec("R4", "Lcom/android/server/pm/UserManagerService;->removeUserUnchecked(I)Z", "1/classes2.dex", 17),
        new MemberSpec("K", "Lcom/android/server/pm/PackageManagerService;->killApplication(Ljava/lang/String;IILjava/lang/String;I)V", "1/classes2.dex", 1)));
    private static final List<MemberSpec> CALLERS=Collections.unmodifiableList(Arrays.asList(
        new MemberSpec("Lcom/android/server/pm/UserManagerService$LocalService;->createUserEvenWhenDisallowed(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/Object;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService$LocalService;->createUserEvenWhenDisallowed(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/Object;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mcreateUserInternalUnchecked(Lcom/android/server/pm/UserManagerService;Ljava/lang/String;Ljava/lang/String;IIZ[Ljava/lang/String;Ljava/lang/Object;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mcreateUserInternalUnchecked(Lcom/android/server/pm/UserManagerService;Ljava/lang/String;Ljava/lang/String;IIZ[Ljava/lang/String;Ljava/lang/Object;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createProfileForUserEvenWhenDisallowedWithThrow(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->createProfileForUserEvenWhenDisallowedWithThrow(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createUserInternal(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->createUserInternal(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->preCreateUserWithThrow(Ljava/lang/String;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->preCreateUserWithThrow(Ljava/lang/String;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createProfileForUserWithThrow(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->createProfileForUserWithThrow(Ljava/lang/String;Ljava/lang/String;II[Ljava/lang/String;)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createUserWithAttributes(Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Landroid/os/PersistableBundle;)Landroid/os/UserHandle;", "Lcom/android/server/pm/UserManagerService;->createUserWithAttributes(Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Landroid/os/PersistableBundle;)Landroid/os/UserHandle;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createUserWithThrow(Ljava/lang/String;Ljava/lang/String;I)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->createUserWithThrow(Ljava/lang/String;Ljava/lang/String;I)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->createRestrictedProfileWithThrow(Ljava/lang/String;I)Landroid/content/pm/UserInfo;", "Lcom/android/server/pm/UserManagerService;->createRestrictedProfileWithThrow(Ljava/lang/String;I)Landroid/content/pm/UserInfo;", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$7;->lambda$performReceive$0(I)V", "Lcom/android/server/pm/UserManagerService$7;->lambda$performReceive$0(I)V", "1/classes2.dex", 4113),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mremoveUserState(Lcom/android/server/pm/UserManagerService;I)V", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mremoveUserState(Lcom/android/server/pm/UserManagerService;I)V", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->cleanupPartialUsers()V", "Lcom/android/server/pm/UserManagerService;->cleanupPartialUsers()V", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->cleanupPreCreatedUsers()V", "Lcom/android/server/pm/UserManagerService;->cleanupPreCreatedUsers()V", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->finishRemoveUser(I)V", "Lcom/android/server/pm/UserManagerService;->finishRemoveUser(I)V", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$7;->$r8$lambda$HsDpeSmsJXl5f6TgKfzr72gGBAQ(Lcom/android/server/pm/UserManagerService$7;I)V", "Lcom/android/server/pm/UserManagerService$7;->$r8$lambda$HsDpeSmsJXl5f6TgKfzr72gGBAQ(Lcom/android/server/pm/UserManagerService$7;I)V", "1/classes2.dex", 4105),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mcleanupPartialUsers(Lcom/android/server/pm/UserManagerService;)V", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mcleanupPartialUsers(Lcom/android/server/pm/UserManagerService;)V", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mcleanupPreCreatedUsers(Lcom/android/server/pm/UserManagerService;)V", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mcleanupPreCreatedUsers(Lcom/android/server/pm/UserManagerService;)V", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mfinishRemoveUser(Lcom/android/server/pm/UserManagerService;I)V", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mfinishRemoveUser(Lcom/android/server/pm/UserManagerService;I)V", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$6;->userStopped(I)V", "Lcom/android/server/pm/UserManagerService$6;->userStopped(I)V", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$7$$ExternalSyntheticLambda0;->run()V", "Lcom/android/server/pm/UserManagerService$7$$ExternalSyntheticLambda0;->run()V", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$LifeCycle;->onBootPhase(I)V", "Lcom/android/server/pm/UserManagerService$LifeCycle;->onBootPhase(I)V", "1/classes2.dex", 1),
        new MemberSpec("Landroid/app/admin/DevicePolicyManager;->createAndManageUser(Landroid/content/ComponentName;Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/PersistableBundle;I)Landroid/os/UserHandle;", "Landroid/app/admin/DevicePolicyManager;->createAndManageUser(Landroid/content/ComponentName;Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/PersistableBundle;I)Landroid/os/UserHandle;", "2/classes.dex", 1),
        new MemberSpec("Landroid/app/admin/IDevicePolicyManager$Stub;->onTransact$createAndManageUser$(Landroid/os/Parcel;Landroid/os/Parcel;)Z", "Landroid/app/admin/IDevicePolicyManager$Stub;->onTransact$createAndManageUser$(Landroid/os/Parcel;Landroid/os/Parcel;)Z", "2/classes.dex", 2),
        new MemberSpec("Landroid/app/admin/IDevicePolicyManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "Landroid/app/admin/IDevicePolicyManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes.dex", 1),
        new MemberSpec("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z", "Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZI)Z", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->removeUserWithProfilesUnchecked(I)Z", "Lcom/android/server/pm/UserManagerService;->removeUserWithProfilesUnchecked(I)Z", "1/classes2.dex", 17),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->-$$Nest$mremoveUserWithProfilesUnchecked(Lcom/android/server/pm/UserManagerService;I)Z", "Lcom/android/server/pm/UserManagerService;->-$$Nest$mremoveUserWithProfilesUnchecked(Lcom/android/server/pm/UserManagerService;I)Z", "1/classes2.dex", 4169),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->removeUser(I)Z", "Lcom/android/server/pm/UserManagerService;->removeUser(I)Z", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->removeUserEvenWhenDisallowed(I)Z", "Lcom/android/server/pm/UserManagerService;->removeUserEvenWhenDisallowed(I)Z", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService;->removeUserWhenPossible(IZ)I", "Lcom/android/server/pm/UserManagerService;->removeUserWhenPossible(IZ)I", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/am/UserController;->finishUserStopped(Lcom/android/server/am/UserState;Z)V", "Lcom/android/server/am/UserController;->finishUserStopped(Lcom/android/server/am/UserState;Z)V", "1/classes.dex", 1),
        new MemberSpec("Lcom/android/server/pm/UserManagerService$LocalService;->removeUserEvenWhenDisallowed(I)Z", "Lcom/android/server/pm/UserManagerService$LocalService;->removeUserEvenWhenDisallowed(I)Z", "1/classes2.dex", 1),
        new MemberSpec("Lcom/android/server/am/UserController;->lambda$finishUserStopping$9(ILcom/android/server/am/UserState;Z)V", "Lcom/android/server/am/UserController;->lambda$finishUserStopping$9(ILcom/android/server/am/UserState;Z)V", "1/classes.dex", 4113),
        new MemberSpec("Lcom/android/server/am/UserController;->$r8$lambda$7HDljRD7qQE4RI26031lSu3_BrA(Lcom/android/server/am/UserController;ILcom/android/server/am/UserState;Z)V", "Lcom/android/server/am/UserController;->$r8$lambda$7HDljRD7qQE4RI26031lSu3_BrA(Lcom/android/server/am/UserController;ILcom/android/server/am/UserState;Z)V", "1/classes.dex", 4105),
        new MemberSpec("Lcom/android/server/am/UserController$$ExternalSyntheticLambda25;->run()V", "Lcom/android/server/am/UserController$$ExternalSyntheticLambda25;->run()V", "1/classes.dex", 17)));
    private static final List<Unresolved> UNRESOLVED=Collections.unmodifiableList(Arrays.asList(
        new Unresolved("Landroid/app/IStopUserCallback$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Binder;->execTransact(IJJI)Z", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Binder;->execTransactInternal(ILandroid/os/Parcel;Landroid/os/Parcel;II)Z", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Binder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Handler;->handleCallback(Landroid/os/Message;)V", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/IUserManager$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Looper;->loop()V", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Landroid/os/Looper;->loopOnce(Landroid/os/Looper;JI)Z", "2/classes3.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V", "1/classes.dex", "Shared dispatch, compiled copies and active frames remain unverified"),
        new Unresolved("Ljava/lang/Thread;->run()V", "missing", "Boot method source absent from both retained inputs")));
    // END FROZEN CATALOG
}
