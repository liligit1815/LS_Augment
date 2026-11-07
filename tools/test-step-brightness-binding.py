"""Execute startup discovery against modern, inherited, wrong-display and missing OEM capabilities."""
import os
from pathlib import Path
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
sources={
'android/content/Context.java': 'package android.content; public class Context {public int display;public int getDisplayId(){return display;}}',
'ls/augment/com/step/BindingCases.java': r'''
package ls.augment.com.step;
import java.lang.reflect.*;
import java.util.*;
class StepMembers {
 static boolean bad;
 static Class<?> findClassIfExists(String name,ClassLoader loader){
  if(name.endsWith("BrightnessControllerAdapt"))return BindingCases.Adapter.class;
  return bad?BindingCases.Bad.class:BindingCases.Child.class;
 }
 static Field findField(Class<?> type,String name)throws Exception{return type.getField(name);}
}
class OwnershipBridge {static Method method(Class<?> type,String name)throws Exception{return type.getMethod(name);}}
class LocalLandscape {
 static Method exact(Class<?> type,String name,Class<?> result,Class<?>... args)throws Exception{
  Method method=type.getMethod(name,args);if(method.getReturnType()!=result)throw new NoSuchMethodException();return method;
 }
}
class StepRuntime {
 static boolean enabled;static int reports;
 static Object field(Object owner,String name){try{return owner.getClass().getField(name).get(owner);}catch(Exception e){throw new RuntimeException(e);}}
 static Object call(Object owner,String name){try{return owner.getClass().getMethod(name).invoke(owner);}catch(Exception e){throw new RuntimeException(e);}}
 static void report(Object a,int b,String c,int d){reports++;}
}
class StepHook {
 static class Discovery extends StepHook {}
 protected void afterHookedMethod(MethodHookParam p){}
 static class MethodHookParam {Object thisObject,result;boolean fail;boolean hasThrowable(){return fail;}Object getResult(){return result;}}
}
class StepHooks {
 static Map<Method,StepHook> hooks=new HashMap<>();
 static void hookMethod(Method m,StepHook hook){hooks.put(m,hook);}
 static void invoke(Object owner,Object result,boolean fail)throws Exception{
  StepHook hook=hooks.get(owner.getClass().getMethod("getAdapt"));
  if(hook==null || !StepRuntime.enabled && !(hook instanceof StepHook.Discovery))return;
  StepHook.MethodHookParam p=new StepHook.MethodHookParam();p.thisObject=owner;p.result=result;p.fail=fail;hook.afterHookedMethod(p);
 }
}
public class BindingCases {
 static int checks;static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
 public static class Adapter {
  public float convertToBrightVal(float a,float b,float c,float d){return d;}
  public int convertToSliderVal(float a,float b,float c,int d){return d;}
  public int getMax(int max){return max;}
 }
 public static class Parent {public android.content.Context mContext=new android.content.Context();public Adapter getAdapt(){return new Adapter();}}
 public static class Child extends Parent {}
 public static class Bad {public String mContext;public Object getAdapt(){return null;}}
 public static void main(String[] args)throws Exception{
  NativeBrightnessBinding.install(BindingCases.class.getClassLoader());
  Child controller=new Child();Adapter actual=controller.getAdapt();
  StepHooks.invoke(controller,actual,false);
  check(!StepRuntime.enabled && NativeBrightnessBinding.adapter==actual,"capture actual inherited OEM instance before Step switch loads");
  check(NativeBrightnessBinding.required,"OEM presence forbids uncalibrated fallback");
  controller.mContext.display=2;StepHooks.invoke(controller,new Adapter(),false);
  check(NativeBrightnessBinding.adapter==actual,"other display cannot replace physical adapter");
  controller.mContext.display=0;StepHooks.invoke(controller,null,false);
  check(NativeBrightnessBinding.adapter==actual,"null result preserves last native adapter");
  StepHooks.invoke(controller,new Adapter(),true);
  check(NativeBrightnessBinding.adapter==actual,"failed native result ignored");
  controller.mContext=null;StepHooks.invoke(controller,new Adapter(),false);
  check(NativeBrightnessBinding.adapter==actual,"missing context ignored");
  StepMembers.bad=true;StepHooks.hooks.clear();NativeBrightnessBinding.adapter=null;
  NativeBrightnessBinding.install(BindingCases.class.getClassLoader());
  check(StepHooks.hooks.isEmpty() && NativeBrightnessBinding.adapter==null && StepRuntime.reports==2,"unknown context/result stays native with diagnostics");
  System.out.println("PASS "+checks+" native brightness discovery checks");
 }
}
'''}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-brightness-binding-') as temp:
    folder=Path(temp);files=[]
    for name,content in sources.items():
        file=folder/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(content,encoding='utf8');files.append(file)
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,*files,ROOT/'android/app/src/main/java/ls/augment/com/step/NativeBrightnessBinding.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.BindingCases'],check=True)
