"""Execute production capability callbacks and all-app scope, separately from native ON/OFF."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/AugmentModule.java'


def body(source, start):
    start = source.index('{', start) + 1
    end, depth = start, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end - 1]


def callback(source, target):
    start = source.index('.setId("ls_augment.api102.shoulder.' + target + '")')
    return body(source, source.index('.intercept(chain ->', start))


HARNESS = r'''
import java.lang.reflect.*;
import java.util.*;
public class TestShoulderRuntime {
 static boolean master, shoulder, plugins, helperProcess;
 static String foreground;
 static int assertions;
 static ClassLoader classLoader=TestShoulderRuntime.class.getClassLoader();
 static final String SHOULDER_LAST_HIT_KEY="hit",GAME_HELPER_PACKAGE="helper",GAME_HELPER_LINE_PACKAGE="helperline";
 static class ApplicationInfo {
  static final int FLAG_INSTALLED=0x800000,FLAG_SYSTEM=1,FLAG_UPDATED_SYSTEM_APP=128;
  int flags=FLAG_INSTALLED;boolean enabled=true;
 }
 static final Map<String,ApplicationInfo> apps=new HashMap<>();
 static class Context {
  Context getPackageManager(){return this;}
  ApplicationInfo getApplicationInfo(String p,int f){if(!apps.containsKey(p))throw new IllegalArgumentException();return apps.get(p);}
  String getPackageName(){return helperProcess?GAME_HELPER_PACKAGE:"assist";}
 }
 static Context currentApplicationContext(){return new Context();}
 static class FeatureSettings {
  static final String GAME_MASTER="master",SHOULDER_ENABLED="shoulder";
  static boolean enabled(Context c,String k){return k.equals(GAME_MASTER)?master:k.equals(SHOULDER_ENABLED)?shoulder:plugins;}
 }
 static class MapPanel {String mGameAppPackageName;boolean mSupportedGameKeyLink,checked;MapPanel(String p){mGameAppPackageName=p;}}
 static class Chain {
  Object result,owner;Object[] args;int calls;
  Chain(Object r,Object...a){result=r;args=a;}
  Object proceed(){calls++;if(owner instanceof MapPanel)((MapPanel)owner).mSupportedGameKeyLink=Boolean.TRUE.equals(result);return result;}
  Object getArg(int i){return args[i];}Object getThisObject(){return owner;}
 }
 static String invokeStringMethod(Object o,String n){return (String)o;}
 static String stringArg(Chain c,int i){return c.args[i] instanceof String?(String)c.args[i]:"";}
 static String currentFullscreenPackage(ClassLoader l){return foreground;}
 static boolean isBooleanFalse(Object v){return Boolean.FALSE.equals(v);}
 static void writeShoulderProbe(String k,String v){}static void logInfo(String v){}static void logError(String v,Throwable e){}
 static void check(boolean b,String m){assertions++;if(!b)throw new AssertionError(m);}
 static List<?> list(Context c,String p){return null;}static void marker(){}
 // METHODS
 // CALLBACKS
 public static void main(String[] args)throws Throwable{
  String[] installed={"target.app","ordinary.app","com.android.settings","updated.system","ls.augment.com"};
  for(String p:installed)apps.put(p,new ApplicationInfo());
  apps.get("com.android.settings").flags|=ApplicationInfo.FLAG_SYSTEM;
  apps.get("updated.system").flags|=ApplicationInfo.FLAG_UPDATED_SYSTEM_APP;
  apps.put("disabled.app",new ApplicationInfo());apps.get("disabled.app").enabled=false;
  apps.put("removed.app",new ApplicationInfo());apps.get("removed.app").flags=0;
  Method marker=TestShoulderRuntime.class.getDeclaredMethod("marker");
  Method list=TestShoulderRuntime.class.getDeclaredMethod("list",Context.class,String.class);
  Field pkg=MapPanel.class.getDeclaredField("mGameAppPackageName"),support=MapPanel.class.getDeclaredField("mSupportedGameKeyLink");
  for(int gates=0;gates<8;gates++){
   master=(gates&1)!=0;shoulder=(gates&2)!=0;plugins=(gates&4)!=0;boolean on=master&&shoulder;
   for(String app:installed){
    check(isShoulderTarget(app)==on,"all installed apps without OEM allowlist");
    check(isGamePluginTarget(app)==(master&&plugins),"independent plugin switch");foreground=app;
    for(boolean region:new boolean[]{false,true}){
     Chain c=new Chain(false,null,"keylink",app,region);
     check(display(c,marker).equals(on)&&c.calls==(on?0:1),"assist eligibility and switch-off passthrough");
     c=new Chain(false,null,"keylink",app,region);
     check(space(c).equals(on)&&c.calls==(on?0:1),"space supports both region contracts without getter");
    }
    Chain c=new Chain(false,null,"keylink");
    check(availability(c,marker).equals(on)&&c.calls==(on?0:1),"vendor availability unlock");
    c=new Chain(false);c.owner=app;
    check(macro(c).equals(on)&&c.calls==(on?0:1),"macro capability scope");
    for(boolean checked:new boolean[]{false,true}){
     MapPanel panel=new MapPanel(app);panel.checked=checked;c=new Chain(false);c.owner=panel;foreground="uninstalled.app";
     map(c,pkg,support);
     check(panel.mSupportedGameKeyLink==on&&panel.checked==checked&&c.calls==1,"panel app capability preserves checked state");
    }
    List<String> oem=Collections.singletonList("record");c=new Chain(oem,null,app);Object r=pluginList(c,list);
    check(on?r.equals(Arrays.asList("record","keylink")):r==oem,"all-app plugin list");
    check(c.calls==1&&oem.size()==1,"no repeated OEM call or input mutation");
   }
   for(String app:new String[]{null,"","bad/name","uninstalled.app","disabled.app","removed.app"}){
    check(!isShoulderTarget(app)&&!isGamePluginTarget(app),"invalid/unavailable app excluded");
    Chain c=new Chain(false,null,"keylink",app,false);
    check(Boolean.FALSE.equals(space(c))&&c.calls==1,"unavailable app stays native");
   }
  }
  master=shoulder=plugins=true;foreground="target.app";
  for(String p:new String[]{"record","","unknown"}){
   Chain c=new Chain(false,null,p,"target.app",false);
   check(Boolean.FALSE.equals(space(c))&&c.calls==1,"shoulder scope leaves other plugins alone");
  }
  helperProcess=true;check(isShoulderTarget("hidden.app",true),"trusted helper visibility fallback");
  check(!isGamePluginTarget("hidden.app"),"plugin has no helper fallback");
  shoulder=false;check(!isShoulderTarget("hidden.app",true),"fallback respects OFF");
  System.out.println("PASS shoulder callbacks and all-app scope: "+assertions+" assertions");
 }
}
'''


def main():
    source = SOURCE.read_text(encoding='utf-8')
    assert 'ls_augment.api102.shoulder.gameassist.one_key_link' not in source
    assert 'findPublicNoArgBooleanMethod' not in source
    targets = [
        ('gameassist.display_eligibility', 'display', 'Method displayEligibility'),
        ('gameassist.plugin_list', 'pluginList', 'Method pluginList'),
        ('gameassist.plugin_enable', 'availability', 'Method pluginEnabled'),
        ('gamehelper.macro_enable', 'macro', ''),
        ('gamespace.plugin_eligibility', 'space', ''),
        ('gamespace.link_capability', 'map', 'Field mapPackage,Field mapSupported'),
    ]
    callbacks = ['static Object '+name+'(Chain chain'+(', '+param if param else '')+') throws Throwable {'+callback(source,target)+'}' for target,name,param in targets]
    signatures = ['private static boolean isShoulderTarget(String', 'private static boolean isShoulderTarget(\n',
                  'static boolean isGamePluginTarget(', 'private static boolean isGameUnlockTarget(',
                  'private static boolean isGameHelperVisibilityFallbackProcess(', 'private static boolean isShoulderBlacklistPlugin(']
    methods = []
    for signature in signatures:
        start = source.index(signature)
        methods.append(source[start:source.index('{',start)+1]+body(source,start)+'}')
    with tempfile.TemporaryDirectory(prefix='ls-shoulder-runtime-') as temp:
        java = Path(temp)/'TestShoulderRuntime.java'
        java.write_text(HARNESS.replace('// METHODS','\n'.join(methods)).replace('// CALLBACKS','\n'.join(callbacks)),encoding='utf-8')
        opts=Path(temp)/'GameOptions.java'
        opts.write_text('package ls.augment.com; public class GameOptions {public static final String PLUGINS="plugins";}',encoding='utf-8')
        subprocess.run(['javac','-encoding','UTF-8','-d',temp,str(java),str(opts)],check=True)
        subprocess.run(['java','-cp',temp,'TestShoulderRuntime'],check=True)


if __name__ == '__main__':
    main()
