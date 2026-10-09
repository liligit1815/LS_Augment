"""Compile the production SystemUiAdapter against minimal JVM facades.

Checks reflection semantics across cached hits and misses without Android, ADB,
or a mirrored adapter implementation. This does not measure shade rendering.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/hook/SystemUiAdapter.java"

FILES = {
    "android/content/Context.java": "package android.content; public class Context {}",
    "android/view/View.java": """package android.view;
public class View { private final android.content.Context context;
public View(android.content.Context context){this.context=context;}
public android.content.Context getContext(){return context;} }""",
    "android/util/Log.java": """package android.util;
public class Log {public static String getStackTraceString(Throwable error){return error.toString();}}""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
final class FeatureSettings {
static final android.content.Context fallback=new android.content.Context();
static android.content.Context from(Object owner){return fallback;}
static void diagnostic(android.content.Context context,String key,String message){}
}""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.Method; import java.util.List;
final class AugmentModule {
interface Interceptor {Object run(Chain chain)throws Throwable;}
static final class Chain {
List<Object> getArgs(){return List.of();} Object getThisObject(){return null;}
Object proceed(Object[] args)throws Throwable{return null;}
}
static final class Registration {Registration intercept(Interceptor interceptor){return this;}}
Registration prepareFeatureHook(Method method,String id,boolean once){return new Registration();}
void registerFeatureHook(Registration registration){}
void logFeatureInfo(String message){} void logFeatureError(String message,Throwable error){}
}""",
    "ls/augment/com/hook/TestSystemUiReflectionCache.java": r"""package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class TestSystemUiReflectionCache {
static int checks;
static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
static class Parent {
 private String parentValue="parent-live";
 private String shadow="parent-shadow";
 private String parentAlias="parent-alias";
 private int zeroCalls;
 private String inheritedZero(){return "parent-zero-"+(++zeroCalls);}
 private String overridden(){return "parent-override";}
 private String differentArity(){return "parent-zero-arity";}
 private String inheritedArgument(String value){return "parent-arg:"+value;}
 private String parentValue(){return parentValue;}
 private String parentShadow(){return shadow;}
}
static final class Child extends Parent {
 private String shadow="child-shadow";
 private String childAlias="child-alias";
 private String empty=null;
 private int mutable=4;
 private int nullCalls;
 private int throwingCalls;
 private String overridden(){return "child-override";}
 private String differentArity(int value){return "child-one-arity:"+value;}
 private Object returnsNull(){nullCalls++;return null;}
 private Object throwing(){throwingCalls++;throw new IllegalStateException("expected-invocation-failure");}
 private String overloaded(){return "zero";}
 private String overloaded(String value){return "string:"+value;}
 private String overloaded(int value){return "integer:"+value;}
 private String nullable(CharSequence value){return value==null?"null-argument":"chars:"+value;}
 private String primitive(boolean a,long b,float c,double d){return a+":"+b+":"+c+":"+d;}
}
static final class Sibling extends Parent {
 private String shadow="sibling-shadow";
 private String overridden(){return "sibling-override";}
}
interface Action {void run()throws Exception;}
static void missing(Action action,String message)throws Exception {
 boolean threw=false;try{action.run();}catch(NoSuchMethodException expected){threw=true;}
 check(threw,message);
}
static void invocationFailure(Action action,String message)throws Exception {
 boolean threw=false;try{action.run();}catch(InvocationTargetException expected){
  threw=expected.getCause() instanceof IllegalStateException&&"expected-invocation-failure".equals(expected.getCause().getMessage());
 }
 check(threw,message);
}
static List<ClassValue<?>> classCaches()throws Exception {
 List<ClassValue<?>> caches=new ArrayList<>();
 for(Field field:SystemUiAdapter.class.getDeclaredFields()) {
  if(Modifier.isStatic(field.getModifiers())&&ClassValue.class.isAssignableFrom(field.getType())) {
   field.setAccessible(true);caches.add((ClassValue<?>)field.get(null));
  }
 }
 return caches;
}
static Object metadataEntry(List<?> holders,Class<?> member,String name)throws Exception {
 for(Object holder:holders)for(Field field:holder.getClass().getDeclaredFields()) {
  if(!Map.class.isAssignableFrom(field.getType()))continue;
  field.setAccessible(true);Object entry=((Map<?,?>)field.get(holder)).get(name);
  if(entry!=null&&entry.getClass().isArray()&&entry.getClass().getComponentType()==member)return entry;
 }
 throw new AssertionError("Missing cached reflection metadata for "+member.getSimpleName()+" "+name);
}
public static void main(String[] args)throws Exception {
 Child child=new Child();Child other=new Child();Sibling sibling=new Sibling();
 check(SystemUiAdapter.field(null,"anything")==null,"null owner has no field");
 check(!SystemUiAdapter.set(null,"anything","value"),"null owner cannot be changed");
 check(SystemUiAdapter.call(null,"anything")==null,"null owner has no method result");
 check(SystemUiAdapter.callIfPresent(null,"anything")==null,"optional method tolerates null owner");
 check(SystemUiAdapter.field(child,"absent")==null,"missing field returns null");
 check(!SystemUiAdapter.set(child,"absent","value"),"missing setter returns false");
 check("parent-live".equals(SystemUiAdapter.field(child,"parentValue")),"private inherited field resolves");
 check("child-shadow".equals(SystemUiAdapter.field(child,"shadow")),"nearest same-name field wins");
 check("sibling-shadow".equals(SystemUiAdapter.field(sibling,"shadow")),"class cache does not leak a sibling field");
 check("child-shadow".equals(SystemUiAdapter.field(child,"absent","shadow")),"missing alias proceeds to an available name");
 check("parent-alias".equals(SystemUiAdapter.field(child,"parentAlias","childAlias")),"alias priority precedes inheritance depth");
 check(SystemUiAdapter.field(child,"empty","childAlias")==null,"existing null field does not fall through to another alias");
 check(SystemUiAdapter.set(child,"parentValue","updated-parent"),"private inherited field is writable");
 check("updated-parent".equals(SystemUiAdapter.field(child,"parentValue")),"cached Field reads the current value");
 check("parent-live".equals(SystemUiAdapter.field(other,"parentValue")),"field cache never caches an instance value");
 check(SystemUiAdapter.set(child,"shadow","updated-child"),"shadow field is writable");
 check("updated-child".equals(SystemUiAdapter.field(child,"shadow")),"shadow write updates the subclass");
 check("parent-shadow".equals(SystemUiAdapter.call(child,"parentShadow")),"shadow write leaves the hidden parent field intact");
 check(SystemUiAdapter.set(child,"empty","now-present"),"null field may become nonnull after a cache hit");
 check("now-present".equals(SystemUiAdapter.field(child,"empty","childAlias")),"alias read follows live null-to-value transition");
 check("parent-zero-1".equals(SystemUiAdapter.call(child,"inheritedZero")),"no-argument lookup inherits private methods");
 check("parent-zero-2".equals(SystemUiAdapter.call(child,"inheritedZero")),"cached Method invokes rather than caching results");
 check("child-override".equals(SystemUiAdapter.call(child,"overridden")),"nearest no-argument method wins");
 check("sibling-override".equals(SystemUiAdapter.call(sibling,"overridden")),"no-argument cache is scoped to the actual class");
 check("parent-zero-arity".equals(SystemUiAdapter.call(child,"differentArity")),"wrong-arity shadow does not hide an inherited no-argument method");
 check("child-one-arity:6".equals(SystemUiAdapter.call(child,"differentArity",6)),"argument lookup keeps its separate overload path");
 check(SystemUiAdapter.callIfPresent(child,"optionalMissing")==null,"missing optional method returns null");
 check(SystemUiAdapter.call(child,"returnsNull")==null,"existing method may return null");
 check(SystemUiAdapter.callIfPresent(child,"returnsNull")==null,"optional existing-null method is still invoked");
 check(child.nullCalls==2,"null result must not act as a negative lookup cache");
 missing(()->SystemUiAdapter.call(child,"mandatoryMissing"),"mandatory missing method still throws");
 missing(()->SystemUiAdapter.call(child,"mandatoryMissing"),"negative cache retains mandatory lookup semantics");
 invocationFailure(()->SystemUiAdapter.call(child,"throwing"),"mandatory invocation exception is propagated");
 invocationFailure(()->SystemUiAdapter.callIfPresent(child,"throwing"),"optional invocation exception is never treated as absence");
 check(child.throwingCalls==2,"throwing methods remain invocable after the first failure");
 check("zero".equals(SystemUiAdapter.call(child,"overloaded")),"overload family resolves the cached no-argument member");
 check("string:value".equals(SystemUiAdapter.call(child,"overloaded","value")),"String overload is preserved");
 check("integer:9".equals(SystemUiAdapter.call(child,"overloaded",9)),"primitive int overload keeps boxed argument matching");
 check("parent-arg:live".equals(SystemUiAdapter.call(child,"inheritedArgument","live")),"argument lookup still visits inherited methods");
 check("null-argument".equals(SystemUiAdapter.call(child,"nullable",(Object)null)),"null argument remains accepted by a compatible overload");
 check("chars:abc".equals(SystemUiAdapter.call(child,"nullable",new StringBuilder("abc"))),"interface-typed argument keeps assignable matching");
 check("true:7:2.5:3.25".equals(SystemUiAdapter.call(child,"primitive",true,7L,2.5f,3.25d)),"supported primitive boxing is preserved");
 missing(()->SystemUiAdapter.call(child,"overloaded",new Object()),"incompatible argument type still throws");
 missing(()->SystemUiAdapter.call(child,"overloaded","a","b"),"incompatible argument count still throws");
 List<ClassValue<?>> caches=classCaches();
 check(!caches.isEmpty(),"reflection metadata uses a class-scoped cache");
 List<?> first=caches.stream().map(cache->cache.get(Child.class)).toList();
 Object fieldHit=metadataEntry(first,Field.class,"shadow"),fieldMiss=metadataEntry(first,Field.class,"absent");
 Object methodHit=metadataEntry(first,Method.class,"overloaded"),methodMiss=metadataEntry(first,Method.class,"optionalMissing");
 check(Array.getLength(fieldHit)==1&&((Field)Array.get(fieldHit,0)).getDeclaringClass()==Child.class,"positive field cache retains the nearest declaring class");
 check(Array.getLength(fieldMiss)==0,"field cache stores a negative lookup as empty metadata");
 check(Array.getLength(methodHit)==1&&((Method)Array.get(methodHit,0)).getParameterCount()==0,"positive method cache contains only a no-argument accessor");
 check(Array.getLength(methodMiss)==0,"optional method absence has explicit negative metadata");
 check(Array.getLength(metadataEntry(first,Method.class,"returnsNull"))==1,"null invocation result still has positive method metadata");
 for(int i=0;i<2000;i++) {
  check(SystemUiAdapter.set(child,"mutable",i),"repeated cached field writes stay live");
  check(Integer.valueOf(i).equals(SystemUiAdapter.field(child,"mutable")),"repeated cached field reads stay live");
  check(SystemUiAdapter.field(child,"absent","mutable").equals(i),"repeated field misses preserve alias fallback");
  check(SystemUiAdapter.callIfPresent(child,"optionalMissing")==null,"repeated optional misses remain harmless");
  check("zero".equals(SystemUiAdapter.callIfPresent(child,"overloaded")),"repeated optional hits select the no-argument member");
 }
 for(int i=0;i<caches.size();i++)check(caches.get(i).get(Child.class)==first.get(i),"cache holder is reused across hits, misses and changing instance values");
 check(metadataEntry(first,Field.class,"shadow")==fieldHit&&metadataEntry(first,Field.class,"absent")==fieldMiss,"cached field hits and misses retain the same resolved metadata");
 check(metadataEntry(first,Method.class,"overloaded")==methodHit&&metadataEntry(first,Method.class,"optionalMissing")==methodMiss,"cached method hits and misses retain the same resolved metadata");
 AtomicInteger failures=new AtomicInteger();ExecutorService worker=Executors.newFixedThreadPool(4);
 List<Future<?>> futures=new ArrayList<>();
 for(int task=0;task<4;task++)futures.add(worker.submit(()->{
  Child local=new Child();
  try{for(int i=0;i<500;i++)if(!SystemUiAdapter.set(local,"mutable",i)||!Integer.valueOf(i).equals(SystemUiAdapter.field(local,"missingAlias","mutable"))||!"zero".equals(SystemUiAdapter.call(local,"overloaded"))||SystemUiAdapter.callIfPresent(local,"parallelMissing")!=null)failures.incrementAndGet();}
  catch(Throwable error){failures.incrementAndGet();}
 }));
 try{for(Future<?> future:futures)future.get(10,TimeUnit.SECONDS);}finally{worker.shutdownNow();}
 check(failures.get()==0,"shared class metadata supports independent owners and concurrent cache lookups");
 android.content.Context viewContext=new android.content.Context();
 check(SystemUiAdapter.context(new android.view.View(viewContext))==viewContext,"view context behavior remains unchanged");
 check(SystemUiAdapter.context(child)==FeatureSettings.fallback,"non-view context fallback remains unchanged");
 System.out.println("PASS production SystemUiAdapter reflection cache: "+checks+" checks; live/shadowed/inherited fields, metadata reuse, negative/nullable/throwing methods, argument overloads and concurrent independent owners; JVM facade only");
}
}
""",
}


def java_tools():
    homes = [os.environ.get("JAVA_HOME"), "C:/Program Files/Android/openjdk/jdk-21.0.8"]
    executable = ".exe" if os.name == "nt" else ""
    for home in homes:
        if home:
            binary = Path(home) / "bin"
            if (binary / ("javac" + executable)).is_file():
                return str(binary / ("javac" + executable)), str(binary / ("java" + executable))
    compiler, runtime = shutil.which("javac"), shutil.which("java")
    if not compiler or not runtime:
        raise RuntimeError("A JDK with javac and java is required for the reflection facade test")
    return compiler, runtime


def main():
    compiler, runtime = java_tools()
    with tempfile.TemporaryDirectory(prefix="lsa-systemui-reflection-") as temporary:
        folder = Path(temporary)
        sources = [SOURCE]
        for name, code in FILES.items():
            destination = folder / name
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_text(code, encoding="utf-8")
            sources.append(destination)
        subprocess.run([compiler, "-encoding", "UTF-8", "--release", "17", "-d", temporary,
                        *map(str, sources)], check=True, timeout=60)
        subprocess.run([runtime, "-cp", temporary, "ls.augment.com.hook.TestSystemUiReflectionCache"],
                       check=True, timeout=20)


if __name__ == "__main__":
    main()
