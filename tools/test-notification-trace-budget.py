"""Run the real diagnostic limiter against native setter/Debug and Xposed facades."""
from pathlib import Path
import subprocess,tempfile
from notification_view_runtime_facade import FILES

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
module=FILES['ls/augment/com/hook/AugmentModule.java']
module=module.replace('target.getClass().getMethod("native_"+method.getName()', '(target==null?method.getDeclaringClass():target.getClass()).getMethod("native_"+method.getName()')
module=module.replace('target.getClass().getDeclaredMethod(name,types)','lookup(target.getClass(),name,types)')
module=module.replace('public static Object invoke(','''static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException e){}throw new NoSuchMethodException(n);}
public static Object invokeStatic(Class<?> owner,String name,Class<?>[] types,Object...args){try{Method m=owner.getDeclaredMethod(name,types);Chain c=new Chain(null,m,args);Interceptor h=active.hooks.get(m);return h==null?c.proceed():h.run(c);}catch(RuntimeException e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
public static Object invoke(''')
files={
'ls/augment/com/hook/AugmentModule.java':module,
'io/github/libxposed/api/XposedInterface.java':'package io.github.libxposed.api;public interface XposedInterface{interface HookHandle{void unhook();}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}',
'android/os/Debug.java':'''package android.os;public class Debug{public static int captures;
public static String getCallers(int depth){return (String)ls.augment.com.hook.AugmentModule.invokeStatic(Debug.class,"getCallers",new Class<?>[]{int.class},depth);}
public static String native_getCallers(int depth){captures++;return "native stack "+depth;}}''',
'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;class FeatureSettings{static Object from(Object v){return v;}static String last;static void diagnostic(Object c,String k,String v){last=v;}}',
'com/android/systemui/statusbar/notification/stack/ViewState.java':'''package com.android.systemui.statusbar.notification.stack;
public class ViewState{
public float mYTranslation;public String mYTranslationSource,currTranslationYStack,lastTranslationYStack;public int writes;
public boolean isValidFloat(float f,String reason){return Float.isFinite(f);}
public void setYTranslation(float f,String source){ls.augment.com.hook.AugmentModule.invoke(this,"setYTranslation",new Class<?>[]{float.class,String.class},f,source);}
public void native_setYTranslation(float f,String source){
 if(!isValidFloat(f,"yTranslation")){android.os.Debug.getCallers(8);return;}
 if("nested".equals(source))setYTranslation(f+1,"inner");
 mYTranslation=f;mYTranslationSource=source;writes++;lastTranslationYStack=currTranslationYStack;
 currTranslationYStack=android.os.Debug.getCallers("depth4".equals(source)?4:8);
 if("failure".equals(source))throw new IllegalStateException("native failure");}}
''',
'ls/augment/com/hook/TestBudget.java':'''package ls.augment.com.hook;
import android.os.*;import com.android.systemui.statusbar.notification.stack.ViewState;
public class TestBudget{
static int checks;static void check(boolean v,String s){checks++;if(!v)throw new AssertionError(s);}
public static class Sub extends ViewState{}
public static void main(String[] args)throws Exception{
AugmentModule m=new AugmentModule();AugmentModule.active=m;if(args.length>0&&args[0].equals("partial"))m.failAt=2;
int installed=NotificationTraceBudgetHook.install(m,TestBudget.class.getClassLoader());
if(args.length>0){check(installed==0&&m.hooks.isEmpty(),"unsupported/partial installation leaves native methods");System.out.println("PASS native fallback "+args[0]);return;}
check(installed==2,"matched diagnostic contract");ViewState row=new Sub();
for(int i=0;i<5000;i++)row.setYTranslation(i,"native-position");
check(row.writes==5000&&row.mYTranslation==4999&&row.mYTranslationSource.equals("native-position"),"every native position/source write preserved");
check(Debug.captures==1&&row.currTranslationYStack.contains("omitted"),"full stack bounded and omission explicit");
check(Debug.getCallers(8).equals("native stack 8"),"outside stack unchanged");
row.setYTranslation(6,"depth4");check(row.currTranslationYStack.equals("native stack 4"),"unrelated depth unchanged");
int n=Debug.captures;row.setYTranslation(Float.NaN,"invalid");row.setYTranslation(Float.POSITIVE_INFINITY,"invalid");
check(Debug.captures==n+2&&row.mYTranslation==6,"invalid input and its native error diagnostics untouched");
SystemClock.now=1000;row.setYTranslation(7,"native");check(row.currTranslationYStack.equals("native stack 8"),"periodic stack retained");
row.setYTranslation(8,"nested");check(row.mYTranslation==8,"nested native setter result preserved");
try{row.setYTranslation(9,"failure");throw new AssertionError();}catch(IllegalStateException expected){}
check(Debug.getCallers(8).equals("native stack 8"),"exception releases scope");
Thread worker=new Thread(()->check(Debug.getCallers(8).equals("native stack 8"),"other thread remains native"));worker.start();worker.join();
SystemClock.now=6000;row.setYTranslation(10,"native");check(FeatureSettings.last.contains("suppressed="),"sample counters exported");
System.out.println("PASS trace budget "+checks+" checks; native geometry/privacy/animation code is never replaced");}}
''',
'ls/augment/com/hook/NotificationTraceBudgetHook.java':(ROOT/'android/app/src/main/java/ls/augment/com/hook/NotificationTraceBudgetHook.java').read_text('utf-8'),
}
for variant in ['modern','partial','missing','wrong_type','legacy']:
    with tempfile.TemporaryDirectory(prefix='duo-trace-') as folder:
        work=Path(folder);sources=[]
        for name,text in files.items():
            if name.endswith('/ViewState.java'):
                if variant=='missing':text=text.replace('lastTranslationYStack','oldDiagnostic')
                if variant=='wrong_type':text=text.replace('public float mYTranslation;', 'public double mYTranslation;')
                if variant=='legacy':text=text.replace('isValidFloat(', 'legacyValidation(')
            p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,'utf-8');sources.append(str(p))
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*sources],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestBudget',*([variant] if variant!='modern' else [])],check=True)
