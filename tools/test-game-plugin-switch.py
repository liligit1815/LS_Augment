"""Exercise production plugin registration and callbacks with the actual OEM overload shapes."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'android/app/src/main/java/ls/augment/com/hook'
source=(BASE/'GameExtrasHook.java').read_text(encoding='utf-8')
methods=source[source.index('    private void plugin('):source.index('    private void assist()')]
harness=r'''package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.*;
public class TestPluginSwitch {
 static class Context {}
 static class GameOptions {static final String PLUGINS="plugins";}
 static class Assist {
  static boolean k(Context c,String p){return false;}
  static boolean l(Context c,String p,String app){return false;}
 }
 static class LegacyAssist {
  static boolean isPluginEnable(Context c,String p){return false;}
  static boolean isPluginEnable(Context c,String p,String a){return false;}
 }
 static class Space {static boolean isPluginEnable(Context c,String p,String app,boolean region){return false;}}
 static class Wrong {static boolean isPluginEnable(Context c,Object p){return false;}}
 static class AugmentModule {
  static boolean master,enabled;static String foreground;
  static boolean isGamePluginTarget(String app){return master&&enabled&&("ordinary.app".equals(app)||"com.android.settings".equals(app));}
  static String currentFullscreenPackage(ClassLoader loader){return foreground;}
 }
 static class Chain {
  Object[] args;boolean original;int calls;
  Chain(boolean original,Object...args){this.original=original;this.args=args;}
  Object getArg(int i){return args[i];}Object proceed(){calls++;return original;}
 }
 interface Action {Object run(Chain chain)throws Throwable;}
 final Map<Method,Action> hooks=new HashMap<>();
 ClassLoader loader=TestPluginSwitch.class.getClassLoader();
 void register(String key,Method m,Action a){if(hooks.put(m,a)!=null)throw new AssertionError("duplicate hook");}
 void missing(String key,String path,Throwable error){}
 METHODS
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] ignored)throws Throwable{
  for(Class<?> owner:new Class<?>[]{Assist.class,LegacyAssist.class,Space.class}){
   TestPluginSwitch h=new TestPluginSwitch();boolean assist=owner!=Space.class;
   h.plugin(owner.getName(),assist);check(h.hooks.size()==(assist?2:1),"resolve actual contracts exactly once");
   for(int gates=0;gates<4;gates++){
    AugmentModule.master=(gates&1)!=0;AugmentModule.enabled=(gates&2)!=0;
    for(String app:new String[]{"ordinary.app","com.android.settings","uninstalled.app",null}){
     boolean expected=AugmentModule.isGamePluginTarget(app);AugmentModule.foreground=app;
     for(Map.Entry<Method,Action> hook:h.hooks.entrySet()){
      int n=hook.getKey().getParameterCount();
      for(boolean region:new boolean[]{false,true}){
       Object[] args=n==2?new Object[]{new Context(),"keylink"}:n==3?new Object[]{new Context(),"keylink",app}:new Object[]{new Context(),"keylink",app,region};
       Chain c=new Chain(false,args);Object value=hook.getValue().run(c);
       check(value.equals(expected)&&c.calls==(expected?0:1),"qualification and disabled passthrough");
      }
     }
    }
   }
   AugmentModule.master=AugmentModule.enabled=true;AugmentModule.foreground="uninstalled.app";
   for(Map.Entry<Method,Action> hook:h.hooks.entrySet())if(hook.getKey().getParameterCount()>2){
    Chain c=new Chain(false,new Context(),"keylink","ordinary.app",false);
    check(Boolean.TRUE.equals(hook.getValue().run(c)),"explicit app never borrows foreground");
   }
  }
  TestPluginSwitch bad=new TestPluginSwitch();bad.plugin(Wrong.class.getName(),true);
  check(bad.hooks.isEmpty(),"unknown method shapes never hooked");
  System.out.println("PASS game plugin OEM contracts and qualification: "+checks+" assertions");
 }
}
'''.replace('METHODS',methods)
with tempfile.TemporaryDirectory(prefix='lsa-plugin-') as directory:
    java=Path(directory)/'TestPluginSwitch.java'
    java.write_text(harness,encoding='utf-8')
    subprocess.run(['javac','-encoding','UTF-8','-d',directory,str(BASE/'ShoulderHookTargets.java'),str(java)],check=True)
    subprocess.run(['java','-cp',directory,'ls.augment.com.hook.TestPluginSwitch'],check=True)
