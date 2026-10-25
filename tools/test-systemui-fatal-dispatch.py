"""Execute the production fatal hook and journal with preferred/fallback/missing runtime methods."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('boot_core',ROOT/'tools/test-boot-crash-evidence.py')
core=importlib.util.module_from_spec(spec);spec.loader.exec_module(core)

MODULE=r'''package ls.augment.com.hook;import java.lang.reflect.Method;
class AugmentModule {
 Method method;boolean before;Hooker callback;String log="";
 interface Hooker{Object intercept(Chain chain)throws Throwable;}
 static class Chain{Object[] args;Throwable original;int calls;Chain(Object[] a,Throwable t){args=a;original=t;}Object getArg(int i){return args[i];}Object proceed()throws Throwable{calls++;throw original;}}
 class Builder{Object intercept(Hooker h){callback=h;return h;}}
 Builder prepareFeatureHook(Method m,String id,boolean before){method=m;this.before=before;return new Builder();}
 void registerFeatureHook(Object handle){}void logFeatureInfo(String text){log=text;}
}'''
TEST=r'''package ls.augment.com.hook;
import java.nio.file.*;import java.io.*;import ls.augment.com.*;
public class FatalDispatchTest {
 static int checks;static void check(boolean b,String r){checks++;if(!b)throw new AssertionError(r);}
 public static void main(String[] args)throws Throwable{
  Path data=Path.of(args[1]);Files.createDirectories(data);java.lang.Thread.UncaughtExceptionHandler previous=java.lang.Thread.getDefaultUncaughtExceptionHandler();
  AugmentModule module=new AugmentModule();SystemUiCrashCapture.install(module);
  boolean unavailable=args[0].equals("unavailable");
  if(unavailable)check(module.callback==null&&module.log.contains("unavailable"),"missing runtime methods leave fatal dispatch native");
  else check(module.callback!=null&&module.before&&module.log.contains(args[0].equals("preferred")?"thread_dispatch":"runtime_logging"),"exact runtime capability selects a before-original hook");
  android.content.pm.ApplicationInfo info=new android.content.pm.ApplicationInfo();info.packageName="com.android.systemui";info.uid=10352;info.deviceProtectedDataDir=data.toString();
  SystemUiCrashJournal.prepare(info);SystemUiCrashJournal.stage("install:core");
  RuntimeException fatal=new RuntimeException("password=never export me");fatal.setStackTrace(new StackTraceElement[]{new StackTraceElement("com.android.systemui.Keyguard","inflate","Keyguard.java",39)});
  if(!unavailable){boolean preferred=args[0].equals("preferred");AugmentModule.Chain chain=new AugmentModule.Chain(preferred?new Object[]{fatal}:new Object[]{new Thread(),fatal},fatal);
   if(args[0].equals("io_failure"))android.system.Os.failWrite=true;
   try{module.callback.intercept(chain);throw new AssertionError("fatal swallowed");}catch(Throwable original){check(original==fatal,"original fatal instance propagates unchanged");}
   check(chain.calls==1,"native dispatch is invoked exactly once even if evidence I/O fails");
   if(!args[0].equals("io_failure")){File[] logs=data.resolve("files/duo-crash-v1").toFile().listFiles();String text=new String(Files.readAllBytes(logs[0].toPath()),java.nio.charset.StandardCharsets.UTF_8);check(text.contains("capture=FATAL")&&text.contains("Keyguard.java:39")&&!text.contains("password")&&!text.contains("never export"),"actual fatal callback persisted a sanitized complete stack before native dispatch");check(android.system.Os.syncs>=2,"fatal descriptor was fsynced");}
  }
  check(java.lang.Thread.getDefaultUncaughtExceptionHandler()==previous,"no handler was replaced or removed");
  System.out.println("PASS SystemUI fatal dispatch "+args[0]+": "+checks+" assertions");
 }
}'''

def main():
    for mode in ('preferred','fallback','io_failure','unavailable'):
        with tempfile.TemporaryDirectory(prefix='duo-fatal-dispatch-') as temporary:
            folder=Path(temporary);files=[]
            thread='package ls.augment.com.hook;public class Thread extends java.lang.Thread {'+('public void dispatchUncaughtException(Throwable t){}' if mode=='preferred' else '')+'}'
            handler='public static void uncaughtException' if mode=='unavailable' else 'public void uncaughtException'
            runtime='package com.android.internal.os;public class RuntimeInit{public static class LoggingHandler{'+handler+'(ls.augment.com.hook.Thread t,Throwable e){}}}'
            sources={**core.STUBS,'ls/augment/com/hook/Thread.java':thread,
                     'android/annotation/SuppressLint.java':'package android.annotation;public @interface SuppressLint {String[] value();}',
                     'com/android/internal/os/RuntimeInit.java':runtime,'ls/augment/com/hook/AugmentModule.java':MODULE,
                     'ls/augment/com/hook/FatalDispatchTest.java':TEST}
            for name,text in sources.items():
                p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,'utf-8');files.append(p)
            files += [core.SRC/'CrashStackTrace.java',core.SRC/'SystemUiCrashJournal.java',core.SRC/'hook/SystemUiCrashCapture.java']
            subprocess.run([str(core.JDK/'javac'),'-encoding','UTF-8','--release','17','-d',temporary,*map(str,files)],check=True)
            subprocess.run([str(core.JDK/'java'),'-cp',temporary,'ls.augment.com.hook.FatalDispatchTest',mode,str(folder/'data')],check=True,timeout=15)

if __name__=='__main__':main()
