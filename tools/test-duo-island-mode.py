"""Exercise actual configuration normalization and the single native host owner."""
from pathlib import Path
import os
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
_temporary=tempfile.TemporaryDirectory(prefix='duo-island-mode-')
OUT=Path(_temporary.name)
src=ROOT/'android/app/src/main/java/ls/augment/com'
text=(src/'hook/DynamicIslandHook.java').read_text(encoding='utf-8')
start=text.index('        void configure(){');end=text.index('{',start)+1;depth=1
while depth:
    depth+=(text[end]=='{')-(text[end]=='}');end+=1
configure=text[start:end]
config=(src/'AppConfig.java').read_text(encoding='utf-8')
start=config.index('            DuoIslandPolicy.normalizeSelection(clean, next);')
end=config.index('            // Both entry points publish',start)
selection=config[start:end]
files={
'ls/augment/com/ConfigSchema.java':'''package ls.augment.com;public class ConfigSchema{public static final String NATIVE_ISLAND_SELECTED="native";public static boolean truthy(String s){return "1".equals(s);}}''',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static String ISLAND="duo";}',
'ls/augment/com/DuoIslandPolicy.java':(src/'DuoIslandPolicy.java').read_text(encoding='utf-8'),
'ls/augment/com/IslandNoticeRules.java':(src/'IslandNoticeRules.java').read_text(encoding='utf-8'),
'ls/augment/com/IslandDownloadConfig.java':(src/'IslandDownloadConfig.java').read_text(encoding='utf-8'),
'TestDuoModes.java':'''import java.util.*;import ls.augment.com.ConfigSchema;import ls.augment.com.DuoIslandPolicy;
import ls.augment.com.IslandNoticeRules;
public class TestDuoModes{
static int checks;static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
static class SystemUiOptions{static String ISLAND="duo";}
static class FeatureSettings{static Map<String,String> values=new HashMap<>();static boolean enabled(Object c,String k){return "1".equals(values.get(k));}static String text(Object c,String k,String d){return values.getOrDefault(k,d);}}
static class Host{boolean nativeOn;List<String> events=new ArrayList<>();void selectNative(boolean value){nativeOn=value;events.add("owner="+value);}void release(){events.add("release");}}
static class Activity{void clear(){}void configure(){}}
static class State{boolean closed,enabled;Object context=new Object();Host nativeHost=new Host();Activity chargeActivity=new Activity(),downloads=new Activity();void downloadSnapshot(){}Map<String,String> mediaActivities=new HashMap<>();boolean option(String suffix){return true;}void listen(){}void stopListening(){}void clearNotice(){}void dismiss(){}void refresh(){}
Object notice;IslandNoticeRules noticeRules;int noticeMode(Object n){return IslandNoticeRules.OFF;}void restoreDownloadSnapshot(){}void cancelFirst(){}
// CONFIGURE
}
static void save(Map<String,String> clean,Map<String,String> next){next.putAll(clean);
// SELECTION
}
public static void main(String[] args){
Map<String,String> next=new HashMap<>(Map.of("duo","1","native","0","width","132"));
save(new HashMap<>(Map.of("native","1")),next);check(next.get("duo").equals("1")&&next.get("native").equals("0"),"legacy selection not merged");
save(new HashMap<>(Map.of("duo","1")),next);check(next.get("duo").equals("1")&&next.get("native").equals("0")&&next.get("width").equals("132"),"unified selection lost saved parameters");
save(new HashMap<>(Map.of("duo","0","native","1")),next);check(next.get("duo").equals("0")&&next.get("native").equals("0"),"legacy alias overrode explicit OFF");
State s=new State();FeatureSettings.values=new HashMap<>(Map.of("duo","1","native","0"));s.configure();check(s.nativeHost.nativeOn,"unified owner not started");
FeatureSettings.values.put("duo","0");FeatureSettings.values.put("native","1");s.configure();check(!s.nativeHost.nativeOn,"retired alias revived runtime owner");
FeatureSettings.values.put("duo","1");s.configure();check(s.nativeHost.nativeOn,"unified ON not honored");
FeatureSettings.values.put("duo","0");FeatureSettings.values.put("native","0");s.configure();check(!s.nativeHost.nativeOn,"OFF not respected");
System.out.println("PASS actual AppConfig and DynamicIslandHook.configure: "+checks+" assertions; unified owner, old imports, explicit OFF and parameter preservation");
}}
'''.replace('// CONFIGURE',configure).replace('// SELECTION',selection)}
folder=OUT/'duo-mode-fixture'
for name,content in files.items():
    path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8')
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
result=subprocess.run([str(java/'java.exe'),'-cp',str(folder),'TestDuoModes'],capture_output=True,text=True,check=True)
print(result.stdout)
_temporary.cleanup()
