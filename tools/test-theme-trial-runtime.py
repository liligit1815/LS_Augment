"""Execute the real theme hooks: hidden legacy gate, on/off, native replacement and adapter families."""
from pathlib import Path
import os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook'
S={
'android/content/Context.java':'package android.content;public class Context {}',
'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long elapsedRealtime(){return System.nanoTime()/1000000;}}',
'io/github/libxposed/api/XposedInterface.java':'''package io.github.libxposed.api;import java.lang.reflect.*;
public class XposedInterface {
 public interface Callback {Object run(Chain c)throws Throwable;}
 public static class Chain {public Method m;public Object owner;public Object[] args;public Object getArg(int i){return args[i];}public Object getThisObject(){return owner;}
 public Object proceed()throws Throwable {try{return m.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}}
 public static class HookHandle {public Method m;public Callback cb;public HookHandle(Method m){this.m=m;}public HookHandle intercept(Callback cb){this.cb=cb;return this;}}
}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
public class AugmentModule {
 public static AugmentModule active;public Map<Method,HookHandle> hooks=new HashMap<>();public List<String> errors=new ArrayList<>();
 public HookHandle prepareFeatureHook(Method m,String id,boolean safe){return new HookHandle(m);}public void registerFeatureHook(HookHandle h){hooks.put(h.m,h);}
 public void logFeatureInfo(String s){}public void logFeatureError(String s,Throwable e){errors.add(s+":"+e.getClass().getSimpleName());}
 public Object call(Class<?> cls,Object owner,String name,Class<?>[] types,Object...args)throws Throwable {
  Method m=cls.getDeclaredMethod(name,types);m.setAccessible(true);Chain c=new Chain();c.m=m;c.owner=owner;c.args=args;
  return hooks.containsKey(m)?hooks.get(m).cb.run(c):c.proceed();
 }
}''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.*;import java.util.*;
public class FeatureSettings {
 public static final String APP_MASTER="master",BEAUTIFY_UNLIMITED_TRIAL="trial",BEAUTIFY_ACTIVE="active",BEAUTIFY_LAST_HIT="hit",BEAUTIFY_LAST_ERROR="error",BEAUTIFY_INSTALLED="installed",BEAUTIFY_ADAPTER_INSTALLED="adapter";
 public static Map<String,String> diagnostics=new HashMap<>();public static boolean master,trial,verified=true;
 public static Context from(Object o){return new Context();}public static boolean hasVerifiedSnapshot(Context c){return verified;}
 public static boolean enabled(Context c,String k){return verified&&(k.equals(APP_MASTER)?master:trial);}public static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
}''',
'com/zte/beautify/view/common/preview/tryuse/TryUseJobHelper.java':'''package com.zte.beautify.view.common.preview.tryuse;public class TryUseJobHelper {
 public static int calls;public static void schedule(android.content.Context c,int type){calls++;}public static boolean StartTryResourcePage(int type){calls++;return true;}}''',
'com/zte/beautify/view/common/preview/tryuse/ResetResourceJobService.java':'''package com.zte.beautify.view.common.preview.tryuse;public class ResetResourceJobService {
 public static int calls;public static boolean processTheme(){calls++;return true;}public static boolean processFont(){calls++;return true;}public static boolean processLiveWallpaper(){calls++;return true;}}''',
'com/zte/beautify/view/common/preview/BeautyPreviewActivity.java':'''package com.zte.beautify.view.common.preview;public class BeautyPreviewActivity {public int calls;public void popTryUseExpiredDialog(){calls++;}}''',
'com/zte/beautify/view/common/preview/online/OnlineThemePreviewFragment.java':'''package com.zte.beautify.view.common.preview.online;public class OnlineThemePreviewFragment {public int calls;public void popTryUseExpiredDialog(){calls++;}}''',
}
for name in ['com.zte.beautify.view.common.preview.tryuse.RealResetResourceJobService','com.zte.beautifyadapter.tryuse.TryResourceJobService','com.zte.beautifyadapter.tryuse.ResetResourceJobService']:
    pkg,cls=name.rsplit('.',1)
    S[name.replace('.','/')+'.java']=f'package {pkg};public class {cls} {{public int calls;public boolean onStartJob(Object job){{calls++;return true;}}}}'
test='''package ls.augment.com.hook;import java.lang.reflect.*;import com.zte.beautifyadapter.ThemeApplyService;
public class TestThemeTrialRuntime {
 static int checks;static void yes(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static Object invoke(AugmentModule m,String cls,String name,Class<?>[] types,Object...args)throws Throwable {
  Class<?> c=Class.forName(cls);return m.call(c,Modifier.isStatic(c.getDeclaredMethod(name,types).getModifiers())?null:c.getConstructor().newInstance(),name,types,args);
 }
 public static void main(String[] args)throws Throwable {
  AugmentModule m=new AugmentModule();AugmentModule.active=m;ClassLoader loader=TestThemeTrialRuntime.class.getClassLoader();
  yes(BeautifyHook.install(m,loader)==8,"all main trial paths installed");
  yes(BeautifyAdapterHook.install(m,loader)==9,"full adapter and jobs installed");yes(m.errors.isEmpty(),"no adapter errors");
  FeatureSettings.master=false;FeatureSettings.trial=true;
  String helper="com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper",reset="com.zte.beautify.view.common.preview.tryuse.ResetResourceJobService";
  for(int type:new int[]{1,4,6})yes(Boolean.FALSE.equals(invoke(m,helper,"StartTryResourcePage",new Class[]{int.class},type)),"trial child works with old master off");
  yes(Boolean.TRUE.equals(invoke(m,helper,"StartTryResourcePage",new Class[]{int.class},99)),"unknown trial type keeps native behavior");
  for(String name:new String[]{"processTheme","processFont","processLiveWallpaper"})yes(Boolean.FALSE.equals(invoke(m,reset,name,new Class[0])),"local reset blocked");
  ThemeServiceContract c=ThemeServiceContract.resolve(ThemeApplyService.class);
  for(Method method:new Method[]{c.combined,c.async,c.theme,c.wallpaper,c.font,c.trialFlag}){
   int before=ThemeApplyService.resets;Object[] a=method.getParameterCount()==0?new Object[0]:new Object[]{1};
   m.call(method.getDeclaringClass(),null,method.getName(),method.getParameterTypes(),a);
   yes(ThemeApplyService.resets==before,"adapter reset blocked: "+method.getName());
  }
  yes(FeatureSettings.diagnostics.get("ls_augment_beautify_runtime").contains("enabled=true")&&FeatureSettings.diagnostics.get("ls_augment_beautify_runtime").contains("legacy_app_master=false"),"effective state logged");
  int before=ThemeApplyService.resets;
  m.call(ThemeApplyService.class,new ThemeApplyService(),c.apply.getName(),c.apply.getParameterTypes(),1,"theme","path");
  yes(ThemeApplyService.resets==before+1,"deliberate resource replacement remains native");
  for(String cls:new String[]{"com.zte.beautify.view.common.preview.tryuse.RealResetResourceJobService","com.zte.beautifyadapter.tryuse.TryResourceJobService","com.zte.beautifyadapter.tryuse.ResetResourceJobService"}){
   yes(Boolean.FALSE.equals(invoke(m,cls,"onStartJob",new Class[]{Object.class},new Object())),"enabled expiry blocked");
   FeatureSettings.trial=false;yes(Boolean.TRUE.equals(invoke(m,cls,"onStartJob",new Class[]{Object.class},new Object())),"disabled expiry native");FeatureSettings.trial=true;
  }
  FeatureSettings.master=true;FeatureSettings.trial=false;
  yes(Boolean.TRUE.equals(invoke(m,reset,"processTheme",new Class[0])),"explicit feature off wins over old master");
  before=ThemeApplyService.resets;m.call(ThemeApplyService.class,null,c.combined.getName(),new Class[]{int.class},1);
  yes(ThemeApplyService.resets==before+1,"disabled adapter reset native");
  FeatureSettings.trial=true;FeatureSettings.verified=false;
  yes(!BeautifyTrialGate.enabled(new android.content.Context()),"unknown configuration never enables feature");
  System.out.println("PASS theme "+args[0]+": "+checks+" runtime checks");
 }
}'''
S['ls/augment/com/hook/TestThemeTrialRuntime.java']=test
bin=Path(os.environ['JAVA_HOME'])/'bin';exe='.exe' if os.name=='nt' else ''
for mode,names in [('legacy',['X','a0','Y','Z','U','b0','x']),('modern',['Z','c0','a0','b0','W','d0','y'])]:
    combined,async_name,theme,wallpaper,font,flag,apply=names
    service=f'''package com.zte.beautifyadapter;import ls.augment.com.hook.AugmentModule;
public class ThemeApplyService {{public static int resets;
 public static int {combined}(int t){{resets++;return 1;}}public static void {async_name}(int t){{resets++;}}
 public static int {theme}(){{resets++;return 1;}}public static int {wallpaper}(){{resets++;return 1;}}public static int {font}(){{resets++;return 1;}}
 public static void {flag}(int t){{resets++;}}
 public int {apply}(int type,String name,String path)throws Throwable {{AugmentModule.active.call(ThemeApplyService.class,null,"{flag}",new Class[]{{int.class}},1);return 1;}}
}}'''
    with tempfile.TemporaryDirectory(prefix='duo-theme-runtime-') as temp:
        files=dict(S);files['com/zte/beautifyadapter/ThemeApplyService.java']=service;paths=[]
        for name,code in files.items():
            path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf8');paths.append(path)
        paths.extend(SRC/(n+'.java') for n in ['BeautifyTrialGate','BeautifyHook','BeautifyAdapterHook','ThemeServiceContract'])
        subprocess.run([str(bin/('javac'+exe)),'-encoding','UTF-8','--release','17','-d',temp,*map(str,paths)],check=True)
        subprocess.run([str(bin/('java'+exe)),'-cp',temp,'ls.augment.com.hook.TestThemeTrialRuntime',mode],check=True)
