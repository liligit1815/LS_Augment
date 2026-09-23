package ls.augment.com;

import java.lang.reflect.Array;
import java.lang.reflect.Executable;
import java.lang.reflect.Field;
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

/** Fixed-ROM process-group members. Resolution never invokes code or grants Root admission. */
final class RootProcessGroupProfile {
    static final int CALLER_COUNT=40, RETAINED_CALLER_COUNT=54, COMBINED_CALLER_COUNT=94;
    private static final int METHOD_FLAGS=0x1dff;
    static final class Spec {
        final String id, descriptor, source;
        final int flags;
        private Spec(String id,String descriptor,String source,int flags) {
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
        final Method hook, nativeProcessKill, traceBegin, traceEnd;
        final List<Executable> callers;
        final List<Member> evidence;
        final Map<String,Method> methodsByDescriptor;
        private final Class<?> ams,controller,legacy,modern,cached,providerHelper;
        private final Field controllerField,amsOomField,controllerOomField,serviceField,optimizerField,providerField,providerServiceField;
        private Resolved(List<Member> members,Map<String,Method> methods)throws ReflectiveOperationException {
            hook=members.get(0).method;nativeProcessKill=members.get(1).method;
            traceBegin=members.get(2).method;traceEnd=members.get(3).method;
            List<Executable> additions=new ArrayList<>();
            for(int i=4;i<members.size();i++)additions.add(members.get(i).method);
            callers=Collections.unmodifiableList(additions);
            evidence=Collections.unmodifiableList(new ArrayList<>(members));
            methodsByDescriptor=Collections.unmodifiableMap(new LinkedHashMap<>(methods));
            ams=owner("com.android.server.am.ActivityManagerService");
            controller=owner("com.android.server.am.ProcessStateController");
            legacy=owner("com.android.server.am.OomAdjuster");
            modern=owner("com.android.server.am.OomAdjusterModernImpl");
            cached=owner("com.android.server.am.CachedAppOptimizer");
            providerHelper=owner("com.android.server.am.ContentProviderHelper");
            if(!Modifier.isFinal(owner("com.android.server.am.ProcessProviderRecord").getModifiers()))
                throw invalid("Unexpected actual provider record hierarchy");
            if(modern.getSuperclass()!=legacy)throw invalid("Unexpected actual OOM hierarchy");
            controllerField=field(ams,"mProcessStateController",controller,1);
            amsOomField=field(ams,"mOomAdjuster",legacy,1);
            controllerOomField=field(controller,"mOomAdjuster",legacy,17);
            serviceField=field(legacy,"mService",ams,17);
            optimizerField=field(legacy,"mCachedAppOptimizer",cached,1);
            providerField=field(ams,"mCpHelper",providerHelper,17);
            providerServiceField=field(providerHelper,"mService",ams,17);
        }
        /** Read-only instance agreement, called after real AMS startup binding and before Root use. */
        String requireOomBinding(Object actualAms)throws ReflectiveOperationException {
            if(actualAms==null || actualAms.getClass()!=ams)
                throw invalid("Unexpected actual AMS/OOM hierarchy");
            Object control=controllerField.get(actualAms),oom=amsOomField.get(actualAms);
            if(control==null || control.getClass()!=controller || oom==null
                    || (oom.getClass()!=legacy && oom.getClass()!=modern))
                throw invalid("Unexpected actual OOM receiver Class");
            Object optimizer=optimizerField.get(oom);
            if(controllerOomField.get(control)!=oom || serviceField.get(oom)!=actualAms
                    || optimizer==null || optimizer.getClass()!=cached)
                throw invalid("Actual AMS/controller/OOM instances disagree");
            Object provider=providerField.get(actualAms);
            if(provider==null || provider.getClass()!=providerHelper || providerServiceField.get(provider)!=actualAms)
                throw invalid("Actual AMS/provider instances disagree");
            // Ordinary metadata changes are rejected. Trusted fixed framework, not an adversarial seqlock.
            if(controllerField.get(actualAms)!=control || amsOomField.get(actualAms)!=oom
                    || controllerOomField.get(control)!=oom || serviceField.get(oom)!=actualAms
                    || optimizerField.get(oom)!=optimizer || providerField.get(actualAms)!=provider
                    || providerServiceField.get(provider)!=actualAms)
                throw invalid("Actual OOM binding changed during read");
            return oom.getClass().getName();
        }
        private Class<?> owner(String name)throws NoSuchMethodException {
            for(Member member:evidence)if(member.method.getDeclaringClass().getName().equals(name))
                return member.method.getDeclaringClass();
            throw invalid("Unattested binding owner: "+name);
        }
        private static Field field(Class<?> owner,String name,Class<?> type,int flags)throws NoSuchFieldException {
            Field field=owner.getDeclaredField(name);
            if(field.getDeclaringClass()!=owner || field.getType()!=type || (field.getModifiers()&0xdf)!=flags)
                throw new NoSuchFieldException("Actual OOM binding field differs: "+owner.getName()+"."+name);
            return field;
        }
    }
    /** Concrete prepared Android origins only; the host suite replaces that class on its own classpath. */
    static Resolved resolve(ClassLoader serviceLoader,ClassLoader bootLoader,RootAndroidClassOrigins origins)
            throws ReflectiveOperationException {
        Objects.requireNonNull(origins,"Prepared actual Android origins required");
        validateSpecs(SPECS);
        Map<Class<?>,RootCriticalProfile.SourceEvidence> sources=new LinkedHashMap<>();
        Map<String,Method> methods=new LinkedHashMap<>();
        List<Member> members=new ArrayList<>();
        for(Spec spec:SPECS) {
            RootCriticalProfile.Descriptor descriptor=RootCriticalProfile.parseDescriptor(spec.descriptor);
            boolean services=spec.source.startsWith("1/");
            Class<?> owner=Class.forName(descriptor.owner,false,services?serviceLoader:bootLoader);
            RootCriticalProfile.SourceEvidence origin=sources.get(owner);
            if(origin==null) {
                origin=origins.attest(owner,spec.source);
                if(origin==null)throw invalid("Missing actual origin: "+descriptor.owner);
                sources.put(owner,origin);
            }
            String hash=services?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256;
            if(origin.owner!=owner || origin.definingLoader!=owner.getClassLoader()
                    || !hash.equals(origin.archiveSha256) || !spec.source.substring(2).equals(origin.dexEntry))
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
            if(selected==null || selected.getDeclaringClass()!=owner)
                throw invalid("Missing declaring method: "+spec.descriptor);
            int flags=selected.getModifiers();
            if((flags & METHOD_FLAGS)!=spec.flags || selected.isBridge()!=((spec.flags&0x40)!=0)
                    || selected.isSynthetic()!=((spec.flags&0x1000)!=0) || Modifier.isAbstract(flags)
                    || Modifier.isNative(flags)!=spec.id.equals("NATIVE"))
                throw invalid("Implementation flags differ: "+spec.descriptor);
            if(methods.putIfAbsent(spec.descriptor,selected)!=null)
                throw invalid("Duplicate process-group descriptor");
            members.add(new Member(spec,selected,origin));
        }
        if(members.size()!=CALLER_COUNT+4 || methods.size()!=CALLER_COUNT+4)
            throw invalid("Incomplete process-group method set");
        return new Resolved(members,methods);
    }
    /** Preserve prior ordering, reject malformed inputs, deduplicate only the identical declaring Method. */
    static List<Executable> combineCallers(List<Executable> existing54,Resolved additions)
            throws ReflectiveOperationException {
        Objects.requireNonNull(existing54);Objects.requireNonNull(additions);
        if(existing54.size()!=RETAINED_CALLER_COUNT || additions.callers.size()!=CALLER_COUNT)
            throw invalid("Unexpected retained/process-group counts");
        Map<String,Class<?>> owners=new LinkedHashMap<>();
        Map<String,Method> byDescriptor=new LinkedHashMap<>();
        LinkedHashSet<Executable> merged=new LinkedHashSet<>();
        for(Executable executable:existing54) {
            if(!(executable instanceof Method))throw invalid("Retained caller is not a method");
            Method method=(Method)executable;
            bindOwner(owners,method);
            if(!merged.add(method) || byDescriptor.putIfAbsent(describe(method),method)!=null)
                throw invalid("Duplicate retained caller");
        }
        for(Member member:additions.evidence)bindOwner(owners,member.method);
        LinkedHashSet<Executable> added=new LinkedHashSet<>();
        for(Executable executable:additions.callers) {
            Method method=(Method)executable;
            if(!added.add(method))throw invalid("Duplicate new caller");
            String descriptor=describe(method);Method previous=byDescriptor.putIfAbsent(descriptor,method);
            if(previous!=null && !previous.equals(method))throw invalid("Same descriptor changed declaring method");
            merged.add(method);
        }
        return Collections.unmodifiableList(new ArrayList<>(merged));
    }
    private static void bindOwner(Map<String,Class<?>> owners,Method method)throws NoSuchMethodException {
        Class<?> owner=method.getDeclaringClass(),previous=owners.putIfAbsent(owner.getName(),owner);
        if(previous!=null && previous!=owner)throw invalid("Declaring Class changed between profiles");
    }
    private static void validateSpecs(List<Spec> specs)throws ReflectiveOperationException {
        if(specs.size()!=CALLER_COUNT+4)throw invalid("Incomplete fixed specs");
        LinkedHashSet<String> ids=new LinkedHashSet<>(),descriptors=new LinkedHashSet<>();
        for(int i=0;i<specs.size();i++) {
            Spec spec=Objects.requireNonNull(specs.get(i));
            String id=i==0?"PG":i==1?"NATIVE":i==2?"TRACE_BEGIN":i==3?"TRACE_END":"D0"+(i+51);
            if(!id.equals(spec.id) || !ids.add(spec.id) || !descriptors.add(spec.descriptor))
                throw invalid("Duplicate or misordered fixed spec");
            if(!spec.source.equals(i==1||i==2||i==3?"2/classes3.dex":"1/classes.dex")
                    || (spec.flags&~METHOD_FLAGS)!=0)
                throw invalid("Invalid fixed source or flags");
            RootCriticalProfile.parseDescriptor(spec.descriptor);
        }
    }
    private static String describe(Method method) {
        StringBuilder out=new StringBuilder(token(method.getDeclaringClass())).append("->").append(method.getName()).append('(');
        for(Class<?> parameter:method.getParameterTypes())out.append(token(parameter));
        return out.append(')').append(token(method.getReturnType())).toString();
    }
    private static String token(Class<?> type) {
        if(type.isArray())return type.getName().replace('.','/');
        if(!type.isPrimitive())return "L"+type.getName().replace('.','/')+";";
        if(type==void.class)return "V";if(type==boolean.class)return "Z";if(type==byte.class)return "B";
        if(type==char.class)return "C";if(type==short.class)return "S";if(type==int.class)return "I";
        if(type==long.class)return "J";if(type==float.class)return "F";return "D";
    }
    private static Class<?> type(String descriptor,ClassLoader services,ClassLoader boot)throws ClassNotFoundException {
        switch(descriptor) {
            case "V":return void.class;case "Z":return boolean.class;case "B":return byte.class;
            case "C":return char.class;case "S":return short.class;case "I":return int.class;
            case "J":return long.class;case "F":return float.class;case "D":return double.class;
            default:
                if(descriptor.charAt(0)=='[')return Array.newInstance(type(descriptor.substring(1),services,boot),0).getClass();
                String binary=descriptor.substring(1,descriptor.length()-1).replace('/','.');
                if(binary.startsWith("java."))return Class.forName(binary,false,null);
                if(binary.startsWith("android."))return Class.forName(binary,false,boot);
                if(binary.startsWith("com.android.server."))return Class.forName(binary,false,services);
                throw new ClassNotFoundException("Uncatalogued signature namespace: "+binary);
        }
    }
    private static NoSuchMethodException invalid(String message){return new NoSuchMethodException(message);}
    // BEGIN FIXED SPECS
    private static final List<Spec> SPECS=Collections.unmodifiableList(Arrays.asList(
        new Spec("PG","Lcom/android/server/am/ProcessList;->killProcessGroup(II)V","1/classes.dex",9),
        new Spec("NATIVE","Landroid/os/Process;->killProcessGroup(II)I","2/classes3.dex",281),
        new Spec("TRACE_BEGIN","Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V","2/classes3.dex",9),
        new Spec("TRACE_END","Landroid/os/Trace;->traceEnd(J)V","2/classes3.dex",9),
        new Spec("D055","Lcom/android/server/am/ProcessRecord;->killProcessGroupIfNecessaryLocked(Z)V","1/classes.dex",1),
        new Spec("D056","Lcom/android/server/am/ProcessRecord;->killLocked(Ljava/lang/String;Ljava/lang/String;IIZZ)V","1/classes.dex",1),
        new Spec("D057","Lcom/android/server/am/ProcessRecord;->killLocked(Ljava/lang/String;IIZZ)V","1/classes.dex",1),
        new Spec("D058","Lcom/android/server/am/ProcessList;->removeProcessLocked(Lcom/android/server/am/ProcessRecord;ZZIILjava/lang/String;Z)Z","1/classes.dex",1),
        new Spec("D059","Lcom/android/server/am/ProcessList;->killPackageProcessesLSP(Ljava/lang/String;IIIZZZZZZIILjava/lang/String;)Z","1/classes.dex",1),
        new Spec("D060","Lcom/android/server/am/ActivityManagerService;->forceStopPackageInternalLocked(Ljava/lang/String;IZZZZZZILjava/lang/String;II)Z","1/classes.dex",17),
        new Spec("D061","Lcom/android/server/am/ActivityManagerService;->forceStopPackageLocked(Ljava/lang/String;IZZZZZZILjava/lang/String;I)Z","1/classes.dex",17),
        new Spec("D062","Lcom/android/server/am/ActivityManagerService;->forceStopPackageLocked(Ljava/lang/String;IZZZZZZILjava/lang/String;)Z","1/classes.dex",17),
        new Spec("D063","Lcom/android/server/am/ActivityManagerService;->forceStopPackage(Ljava/lang/String;IILjava/lang/String;)V","1/classes.dex",1),
        new Spec("D064","Lcom/android/server/am/ActivityManagerService;->forceStopPackage(Ljava/lang/String;I)V","1/classes.dex",1),
        new Spec("D065","Lcom/android/server/am/ActivityManagerService$LocalService;->killApplicationSync(Ljava/lang/String;IILjava/lang/String;I)V","1/classes.dex",1),
        new Spec("D066","Lcom/android/server/am/ProcessList;->removeLruProcessLocked(Lcom/android/server/am/ProcessRecord;)V","1/classes.dex",1),
        new Spec("D067","Lcom/android/server/am/ActivityManagerService;->removeLruProcessLocked(Lcom/android/server/am/ProcessRecord;)V","1/classes.dex",17),
        new Spec("D068","Lcom/android/server/am/ActivityManagerService;->cleanUpApplicationRecordLocked(Lcom/android/server/am/ProcessRecord;IZZIZZ)Z","1/classes.dex",17),
        new Spec("D069","Lcom/android/server/am/ActivityManagerService;->handleAppDiedLocked(Lcom/android/server/am/ProcessRecord;IZZZ)V","1/classes.dex",17),
        new Spec("D070","Lcom/android/server/am/ActivityManagerService;->updateOomAdjLocked(I)V","1/classes.dex",17),
        new Spec("D071","Lcom/android/server/am/CachedAppOptimizer;->unfreezeAppInternalLSP(Lcom/android/server/am/ProcessRecord;IZ)Z","1/classes.dex",17),
        new Spec("D072","Lcom/android/server/am/CachedAppOptimizer;->unfreezeAppLSP(Lcom/android/server/am/ProcessRecord;I)V","1/classes.dex",1),
        new Spec("D073","Lcom/android/server/am/CachedAppOptimizer;->unfreezeAppLSP(Lcom/android/server/am/ProcessRecord;IZ)V","1/classes.dex",1),
        new Spec("D074","Lcom/android/server/am/OomAdjuster;->applyOomAdjLSP(Lcom/android/server/am/ProcessRecord;ZJJIZ)Z","1/classes.dex",1),
        new Spec("D075","Lcom/android/server/am/OomAdjuster;->performUpdateOomAdjLSP(I)V","1/classes.dex",1),
        new Spec("D076","Lcom/android/server/am/OomAdjuster;->performUpdateOomAdjPendingTargetsLocked(I)V","1/classes.dex",1),
        new Spec("D077","Lcom/android/server/am/OomAdjuster;->postUpdateOomAdjInnerLSP(ILcom/android/server/am/ActiveUids;JJJZ)V","1/classes.dex",1),
        new Spec("D078","Lcom/android/server/am/OomAdjuster;->updateAndTrimProcessLSP(JJJLcom/android/server/am/ActiveUids;IZ)V","1/classes.dex",17),
        new Spec("D079","Lcom/android/server/am/OomAdjuster;->updateAppFreezeStateLSP(Lcom/android/server/am/ProcessRecord;IZI)V","1/classes.dex",1),
        new Spec("D080","Lcom/android/server/am/OomAdjuster;->updateOomAdjInnerLSP(ILcom/android/server/am/ProcessRecord;Ljava/util/ArrayList;Lcom/android/server/am/ActiveUids;ZZ)V","1/classes.dex",17),
        new Spec("D081","Lcom/android/server/am/OomAdjuster;->updateOomAdjLSP(I)V","1/classes.dex",17),
        new Spec("D082","Lcom/android/server/am/OomAdjuster;->updateOomAdjLocked(I)V","1/classes.dex",1),
        new Spec("D083","Lcom/android/server/am/OomAdjuster;->updateOomAdjPendingTargetsLocked(I)V","1/classes.dex",1),
        new Spec("D084","Lcom/android/server/am/OomAdjusterModernImpl;->fullUpdateLSP(I)V","1/classes.dex",17),
        new Spec("D085","Lcom/android/server/am/OomAdjusterModernImpl;->partialUpdateLSP(ILandroid/util/ArraySet;)V","1/classes.dex",17),
        new Spec("D086","Lcom/android/server/am/OomAdjusterModernImpl;->performUpdateOomAdjLSP(I)V","1/classes.dex",1),
        new Spec("D087","Lcom/android/server/am/OomAdjusterModernImpl;->performUpdateOomAdjPendingTargetsLocked(I)V","1/classes.dex",1),
        new Spec("D088","Lcom/android/server/am/ProcessRecord;->killLocked(Ljava/lang/String;IIZ)V","1/classes.dex",1),
        new Spec("D089","Lcom/android/server/am/ProcessRecord;->killLocked(Ljava/lang/String;Ljava/lang/String;IIZ)V","1/classes.dex",1),
        new Spec("D090","Lcom/android/server/am/ProcessStateController;->runFullUpdate(I)V","1/classes.dex",1),
        new Spec("D091","Lcom/android/server/am/ContentProviderHelper;->removeDyingProviderLocked(Lcom/android/server/am/ProcessRecord;Lcom/android/server/am/ContentProviderRecord;Z)Z","1/classes.dex",1),
        new Spec("D092","Lcom/android/server/am/ContentProviderHelper;->cleanupAppInLaunchingProvidersLocked(Lcom/android/server/am/ProcessRecord;Z)Z","1/classes.dex",1),
        new Spec("D093","Lcom/android/server/am/ProcessProviderRecord;->onCleanupApplicationRecordLocked(Z)Z","1/classes.dex",1),
        new Spec("D094","Lcom/android/server/am/ProcessRecord;->onCleanupApplicationRecordLSP(Lcom/android/server/am/ProcessStatsService;ZZ)Z","1/classes.dex",1)));
    // END FIXED SPECS
}
