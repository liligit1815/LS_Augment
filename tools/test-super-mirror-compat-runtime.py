"""Exercise production GameAssist scope/qualification hooks with both inspected API shapes."""
from pathlib import Path
import subprocess, tempfile
from notification_view_runtime_facade import FILES

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
files={k:FILES[k] for k in ['ls/augment/com/hook/AugmentModule.java','io/github/libxposed/api/XposedInterface.java']}
k='ls/augment/com/hook/AugmentModule.java'
files[k]=files[k].replace('target.getClass()', '(target instanceof Class?(Class<?>)target:target.getClass())').replace('.invoke(target,a)', '.invoke(target instanceof Class?null:target,a)')
files.update({
'android/content/Context.java':'package android.content;public class Context{}',
'android/content/ContentResolver.java':'package android.content;public class ContentResolver{}',
'android/provider/Settings.java':'package android.provider;public class Settings{public static class Global{public static int getInt(android.content.ContentResolver c,String k,int d){return d;}}}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{
 public static final String GAME_MASTER="master",SUPER_MIRROR_LOW_MODE="low",SUPER_MIRROR_DIABLO_COEXIST="coexist",SUPER_MIRROR_INSTALLED="installed",SUPER_MIRROR_LAST_ERROR="error",SUPER_MIRROR_ACTIVE="active",SUPER_MIRROR_LAST_HIT="hit";
 public static final java.util.Map<String,String> values=new java.util.HashMap<>();public static android.content.Context from(Object o){return new android.content.Context();}
 public static boolean enabled(android.content.Context c,String k){return "1".equals(values.get(k));}public static void diagnostic(android.content.Context c,String k,String v){values.put(k,v);}}
''',
'cn/nubia/plugin/superresolution/SuperResolutionViewController.java':'''package cn.nubia.plugin.superresolution;import ls.augment.com.hook.AugmentModule;
public class SuperResolutionViewController{
 public boolean enabled=true,fail;public int clears,writes;
 public void i(String p,int mode){AugmentModule.invoke(this,"i",new Class<?>[]{String.class,int.class},p,mode);}
 public void native_i(String p,int mode){if(fail)throw new IllegalStateException("native");if(r(mode)){clears++;H(p,false,false);}}
 public static boolean r(int m){return (Boolean)AugmentModule.invoke(SuperResolutionViewController.class,"r",new Class<?>[]{int.class},m);}
 public static boolean native_r(int m){return m==1||m==2||m==8;}
 public void H(String p,boolean e,boolean user){enabled=e;writes++;}
}
''',
'cn/nubia/gameassist/performance/PerformanceModeController.java':'''package cn.nubia.gameassist.performance;public class PerformanceModeController{
 public int getPerformanceMode(String p){return 5;}public void j0(String p,boolean e,boolean user){}public boolean canSetPerformanceMode(boolean on){return false;}public void r0(){}}
''',
'ls/augment/com/hook/TestSuperMirror.java':'''package ls.augment.com.hook;
import cn.nubia.plugin.superresolution.SuperResolutionViewController;import cn.nubia.gameassist.performance.PerformanceModeController;
public class TestSuperMirror{static int n;static void check(boolean b,String s){n++;if(!b)throw new AssertionError(s);}
 public static void main(String[] args){AugmentModule m=new AugmentModule();AugmentModule.active=m;
  int installed=SuperMirrorDiabloHook.install(m,TestSuperMirror.class.getClassLoader());check(installed>0,"install");
  FeatureSettings.values.put("master","1");FeatureSettings.values.put("low","1");SuperResolutionViewController v=new SuperResolutionViewController();
  for(int mode:new int[]{1,2}){v.enabled=true;v.i("game",mode);check(v.enabled,"low mode retains resolution");}
  if(args.length==0){check(v.clears==0&&v.writes==0,"qualification prevents earlier destructive reset");check(SuperResolutionViewController.r(1),"outside automatic scope remains native");
   v.i("game",8);check(!v.enabled,"unrelated native veto retained");v.enabled=true;v.H("game",false,true);check(!v.enabled,"explicit off retained");
   v.fail=true;try{v.i("game",1);throw new AssertionError();}catch(RuntimeException expected){}v.fail=false;check(SuperResolutionViewController.r(1),"scope restored on exception");
  }else{v.L("game",false);check(!v.enabled,"legacy explicit off retained");}
  FeatureSettings.values.put("low","0");v.enabled=true;v.i("game",1);check(!v.enabled,"feature off remains native");
  FeatureSettings.values.put("low","1");FeatureSettings.values.put("master","0");v.enabled=true;v.i("game",2);check(!v.enabled,"master off remains native");
  check(!new PerformanceModeController().canSetPerformanceMode(true),"native power saver gate retained");
  check(m.errors==0,"no install errors");System.out.println("super mirror checks="+n);}}
'''
})
# Compile a no-op L in the modern fixture for the shared test's legacy branch;
# it must not have the legacy setter signature, or capability selection changes.
files['cn/nubia/plugin/superresolution/SuperResolutionViewController.java']=files['cn/nubia/plugin/superresolution/SuperResolutionViewController.java'].replace('public void H(', 'public void L(Object p,boolean e){H((String)p,e,true);}public void H(')
for variant in ['modern','legacy']:
    current=dict(files)
    if variant=='legacy':
        k='cn/nubia/plugin/superresolution/SuperResolutionViewController.java'
        current[k]=current[k].replace('if(r(mode)){clears++;H(p,false,false);}', 'if(mode==1||mode==2)L(p,false);').replace('public void L(Object p,boolean e){H((String)p,e,true);}', 'public void L(String p,boolean e){AugmentModule.invoke(this,"L",new Class<?>[]{String.class,boolean.class},p,e);}public void native_L(String p,boolean e){enabled=e;writes++;}')
    with tempfile.TemporaryDirectory(prefix='duo-super-mirror-') as folder:
        work=Path(folder);paths=[]
        for name,value in current.items():
            p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');paths.append(p)
        paths += [SRC/'SuperMirrorDiabloHook.java',SRC/'HookCompatibility.java']
        subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
        subprocess.run([str(JAVA/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestSuperMirror',*(['legacy'] if variant=='legacy' else [])],check=True)
