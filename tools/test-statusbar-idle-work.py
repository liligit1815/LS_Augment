"""Exercise production idle-work and visibility gates with changing settings."""
from pathlib import Path
import os,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/RedMagicLegacyUiHook.java').read_text('utf-8')
def method(marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
files={
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;import java.util.*;public class ConfigSnapshot{final Map<String,String> data;public ConfigSnapshot(Map<String,String> v){data=new HashMap<>(v);}public Map<String,String> values(){return data;}public String get(String k){return data.getOrDefault(k,"");}}''',
'ls/augment/com/ConfigSchema.java':'''package ls.augment.com;public class ConfigSchema{public static final String SYSTEMUI_MASTER="master";public static boolean truthy(String v){return "1".equals(v)||"true".equals(v);}}''',
'TestIdleWork.java':'''import java.util.*;import ls.augment.com.*;
public class TestIdleWork{
 static final String P="ls_augment_rm_";static ConfigSnapshot hidingSnapshot;static final Set<String> LEGACY_HIDING=new HashSet<>(),LEGACY_SLOTS=new HashSet<>();
 static final Map<Object,Object> HIDE_CONTEXTS=new HashMap<>();static boolean legacyHidingActive;static int legacyWifiScope,legacyMobileScope,legacyHotspotScope,expensive;
 static class View{String slot="ims_icon";Object getContext(){return this;}}
 static class ModernStatusBarMobileView extends View{}
 static class FeatureSettings{static ConfigSnapshot current;static ConfigSnapshot snapshot(Object c){return current;}static String text(Object c,String k,String d){String v=current.get(k);return v.isEmpty()?d:v;}}
 static class SystemUiHook{static String slotOf(View v){expensive++;return v.slot;}}
 static class SubscriptionManager{static int getSlotIndex(int id){expensive++;return id;}}
 static boolean preserveNativeAppearance(View v){expensive++;return false;}
 static Object call(View v,String key)throws ReflectiveOperationException{expensive++;return 0;}
 static boolean on(View v,String key){return ConfigSchema.truthy(FeatureSettings.current.get(P+key));}
 static int number(View v,String key,int def,int min,int max){String s=FeatureSettings.current.get(P+key);return s.isEmpty()?def:Integer.parseInt(s);}
 static int iconContext(View v){expensive++;return 3;}
 static void check(boolean b,String why){if(!b)throw new AssertionError(why);}
 static void config(String...items){Map<String,String> values=new HashMap<>();values.put(P+"battery_alpha_percent","100");for(int i=0;i<items.length;i+=2)values.put(items[i],items[i+1]);FeatureSettings.current=new ConfigSnapshot(values);}
 METHODS
 public static void main(String[] args){
  View icon=new View();config();check(!needsViewScan(FeatureSettings.current),"native defaults have no recurring scan");
  for(int i=0;i<5000;i++)check(!shouldHideStatusIcon(icon),"native icon stays visible");check(expensive==0,"disabled visibility performs no ancestry/slot/SIM work");
  config(P+"hide_hd_large","1");check(needsViewScan(FeatureSettings.current)&&shouldHideStatusIcon(icon),"legacy HD flag works independently of master");
  config();check(!needsViewScan(FeatureSettings.current)&&!shouldHideStatusIcon(icon),"removing flag releases cached active work");
  for(String k:new String[]{"signal_dual","statusbar_hide","keyguard_statusbar_hide","statusbar_restore_font","notification_native","battery_hide_percent","battery_colors","battery_style","battery_width_dp","battery_preset"}){
   config(P+k,"1");check(needsViewScan(FeatureSettings.current),"legacy independent setting still scanned: "+k);
  }
  config(P+"battery_alpha_percent","70");check(needsViewScan(FeatureSettings.current),"battery opacity needs restoration tracking");
  config("master","1");check(needsViewScan(FeatureSettings.current),"custom grid/appearance retain scans");
  config(P+"hidden_icon_slots","volume, ims_icon");check(shouldHideStatusIcon(icon),"custom slot list applies");
  config(P+"hide_mobile_scope","3");ModernStatusBarMobileView mobile=new ModernStatusBarMobileView();mobile.slot="mobile";check(shouldHideStatusIcon(mobile),"context-specific mobile hiding preserved");
  for(int i=0;i<50;i++){config(P+"hide_sim1","1");check(shouldHideStatusIcon(mobile),"SIM rule enabled");config();check(!shouldHideStatusIcon(mobile),"SIM rule removed");}
  System.out.println("Idle visibility: 5000 no-work calls, independent settings and repeated restoration passed");
 }
}'''
}
files['TestIdleWork.java']=files['TestIdleWork.java'].replace('METHODS','\n'.join(method(m) for m in ['private static void refreshHiding(', 'private static int legacyScope(', 'static boolean needsViewScan(', 'private static boolean shouldHideStatusIcon(']))
with tempfile.TemporaryDirectory(prefix='duo-idle-work-') as tmp:
    for name,body in files.items():
        p=Path(tmp)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,'utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac'),'-encoding','UTF-8','-d',tmp,*map(str,Path(tmp).rglob('*.java'))],check=True)
    subprocess.run([str(java/'java'),'-cp',tmp,'TestIdleWork'],check=True)
