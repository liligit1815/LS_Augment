"""Only Xposed registration/configuration ports are doubled. Android UI classes are real."""
SOURCES={
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;public final class ConfigSnapshot {public long revision=1;final java.util.Map<String,String> values;public ConfigSnapshot(java.util.Map<String,String> map){values=new java.util.HashMap<>(map);}public String get(String key){return values.getOrDefault(key,"");}}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;
public final class FeatureSettings {public static final java.util.Map<String,String> values=new java.util.HashMap<>(),diagnostics=new java.util.HashMap<>();static ls.augment.com.ConfigSnapshot cached;
 public static void put(String key,String value){values.put(key,value);cached=null;}
 public static void clear(){values.clear();diagnostics.clear();cached=null;}
 static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){if(cached==null)cached=new ls.augment.com.ConfigSnapshot(values);return cached;}
 static boolean enabled(android.content.Context c,String k){return "1".equals(values.get(k));}
 static int integer(android.content.Context c,String k,int fallback,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(values.get(k))));}catch(Exception e){return fallback;}}
 static String text(android.content.Context c,String k,String fallback){return values.getOrDefault(k,fallback);}
 static boolean addSnapshotListener(android.content.Context c,Runnable r){return true;}static void removeSnapshotListener(Runnable r){}
 static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}static android.content.Context from(Object o){return o instanceof android.view.View?((android.view.View)o).getContext():null;}
}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;public final class AugmentModule {
 public int errors;public void logFeatureError(String name,Throwable e){errors++;throw new AssertionError(name,e);}public void logFeatureInfo(String text){}
 interface Interceptor {Object run(Chain c)throws Throwable;}interface Chain{java.util.List<Object> getArgs();Object getThisObject();Object proceed(Object[] args)throws Throwable;}
 final java.util.Map<java.lang.reflect.Method,java.util.List<Interceptor>> hooks=new java.util.HashMap<>();
 static final class Builder {java.lang.reflect.Method method;Interceptor callback;Builder(java.lang.reflect.Method m){method=m;}Builder intercept(Interceptor i){callback=i;return this;}}
 Builder prepareFeatureHook(java.lang.reflect.Method m,String key,boolean observer){return new Builder(m);}void registerFeatureHook(Builder builder){hooks.computeIfAbsent(builder.method,k->new java.util.ArrayList<>()).add(builder.callback);}
 final java.util.Set<java.lang.reflect.Method> originalCalls=new java.util.HashSet<>();
 private java.lang.reflect.Method method(Object target,String name,int count)throws Exception{for(Class<?> c=target.getClass();c!=null;c=c.getSuperclass())for(java.lang.reflect.Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==count){m.setAccessible(true);return m;}throw new NoSuchMethodException(name);}
 public boolean isOriginal(Object target,String name,int count)throws Exception{return originalCalls.contains(method(target,name,count));}
 public Object invoke(Object target,String name,Object...initial)throws Exception{java.lang.reflect.Method method=method(target,name,initial.length);java.util.List<Interceptor> list=hooks.getOrDefault(method,java.util.Collections.emptyList());Chain chain=new Chain(){int index;public java.util.List<Object> getArgs(){return java.util.Arrays.asList(initial);}public Object getThisObject(){return target;}public Object proceed(Object[] args)throws Throwable{if(index<list.size())return list.get(index++).run(this);originalCalls.add(method);try{return method.invoke(target,args);}finally{originalCalls.remove(method);}}};try{return chain.proceed(initial);}catch(Throwable t){throw new AssertionError(name,t);}}
}''',
'ls/augment/com/hook/OemNotificationClearHook.java':'''package ls.augment.com.hook;final class OemNotificationClearHook{static int install(AugmentModule m,ClassLoader l){return 0;}}''',
'ls/augment/com/hook/CarrierTextHook.java':'''package ls.augment.com.hook;final class CarrierTextHook{static void bindHeader(Object header){}}''',
'ls/augment/com/BuildConfig.java':'''package ls.augment.com;public final class BuildConfig{public static final int VERSION_CODE=20455;}''',
'ls/augment/com/hook/StatusBarAssetsHook.java':'''package ls.augment.com.hook;final class StatusBarAssetsHook{static String surfaceFor(android.view.View v){return "control";}}''',
'ls/augment/com/hook/StatusBarIconLayoutHook.java':'''package ls.augment.com.hook;import android.view.*;import java.util.*;import ls.augment.com.StatusBarIconSpacingSpec;
public final class StatusBarIconLayoutHook {public static int extra;static boolean hasChildWork(ViewGroup v){return extra!=0;}static void restoreInactiveComposites(ViewGroup v){}static void refreshHeaderComposites(ViewGroup v){}static java.util.List<View> spacingChildren(ViewGroup v){return Collections.emptyList();}static int headerExtraHeight(ViewGroup v){return extra;}static StatusBarIconSpacingSpec.Insets insets(View v){return new StatusBarIconSpacingSpec.Insets(0,0,0,0);}static String semanticId(View v){return "wifi.signal";}static String marginDiagnostic(View v){return "";}}
''',
}
