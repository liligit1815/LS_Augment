"""Exercise the compiled production scene migration and displayed-instance ownership policies."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
CLASSES=ROOT/'android/app/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
if not (CLASSES/'ls/augment/com/IslandSceneRegistry.class').exists():
    raise SystemExit('Run :app:compileReleaseJavaWithJavac before this test.')
SOURCE='''import ls.augment.com.*;import java.util.*;
public final class TestIslandRebuildCore {
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 public static void main(String[] args){
  Set<String> ids=new HashSet<>(),keys=new HashSet<>();
  for(IslandSceneRegistry.Scene scene:IslandSceneRegistry.scenes()){
   check(ids.add(scene.id)&&keys.add(scene.key),"each scene has one unique key");
   check(ConfigSchema.defaults().containsKey(scene.key),"scene participates in config validation and backup");
  }
  check(ids.size()==32,"27 existing scenes, notifications, transfers and three new sources");
  for(boolean fullscreen:new boolean[]{false,true})for(boolean completion:new boolean[]{false,true})for(boolean child:new boolean[]{false,true}){
   Map<String,String> old=new HashMap<>();old.put(NativeIslandSceneOptions.ENABLED,completion?"1":"0");
   old.put(IslandSceneRegistry.key("media"),"0");old.put(IslandSceneRegistry.key("charging"),"0");
   for(String scene:NativeIslandSceneOptions.IDS)old.put(NativeIslandSceneOptions.key(scene),child?"1":"0");
   Map<String,String> changed=IslandSceneRegistry.migrate(old,fullscreen);Map<String,String> next=new HashMap<>(old);next.putAll(changed);
   for(int i=0;i<NativeIslandSceneOptions.IDS.length;i++){
    String scene=NativeIslandSceneOptions.IDS[i];
    if(scene.equals("media")||scene.equals("charging")){check("0".equals(next.get(IslandSceneRegistry.key(scene))),"explicit old music/charging OFF survives");continue;}
    boolean expected=i<NativeIslandSceneOptions.TYPES.length||fullscreen&&MagicIslandPolicy.managed(scene)||completion&&child;
    check((expected?"1":"0").equals(next.get(IslandSceneRegistry.key(scene))),"old effective source semantics migrate: "+scene);
   }
   check(IslandSceneRegistry.migrate(next,!fullscreen).isEmpty(),"migration is idempotent across backend changes");
   next.put(IslandSceneRegistry.key("record"),"0");check(IslandSceneRegistry.migrate(next,fullscreen).isEmpty(),"new explicit scene OFF is never re-enabled");
   for(String scene:new String[]{"navigation","screen_record","hotspot"})check("0".equals(ConfigSchema.defaults().get(IslandSceneRegistry.key(scene))),"new scenes default OFF");
  }
  Map<String,String> defaults=new HashMap<>(ConfigSchema.defaults());
  for(String retired:new String[]{"ls_augment_island_custom_appearance","ls_augment_rm_island_width","ls_augment_rm_island_height","ls_augment_rm_island_offset_x","ls_augment_rm_island_offset_y","ls_augment_rm_island_transparent","ls_augment_rm_island_app_style",NativeIslandSceneOptions.key("media"),NativeIslandSceneOptions.key("charging")}) {
   check(!defaults.containsKey(retired),"retired appearance absent from schema");
   check(!Arrays.asList(IslandSceneRegistry.parameterKeys()).contains(retired),"retired appearance absent from page");
   check(!IslandSceneRegistry.migrate(Map.of(retired,"1"),false).containsKey(retired),"migration cannot resurrect retired appearance");
  }
  check(defaults.containsKey(IslandNoticeBlacklist.KEY),"blacklist included in common config");
  IslandOwnershipRegistry registry=new IslandOwnershipRegistry();Object first=new Object(),replacement=new Object();
  registry.reconcile(Map.of(),Map.of("record",first),0);check(!registry.owns("record",0),"a switch/queued transition cannot claim a capsule");
  registry.reconcile(Map.of("record",first,"call",replacement),Map.of(),10);check(registry.owns("record",10)&&registry.owns("call",10),"only displayed instances claim ownership");
  registry.reconcile(Map.of("call",replacement),Map.of("record",first),20);
  registry.reconcile(Map.of("call",replacement),Map.of("record",first),500);
  check(registry.owns("record",619)&&!registry.owns("record",620),"repeated updates cannot extend a transition indefinitely");
  check(registry.nextExpiry()==620,"restoration uses the original transition deadline");
  check(!registry.owns("record",19),"clock reversal fails closed");
  registry.reconcile(Map.of("record",first),Map.of(),700);registry.reconcile(Map.of(),Map.of("record",replacement),701);
  check(!registry.owns("record",701),"another instance cannot inherit ownership without drawing");
  registry.reconcile(Map.of("record",replacement),Map.of(),800);check(registry.owns("record",800),"replacement may claim after its own draw");
  registry.clear();check(registry.scenes(801).isEmpty(),"shutdown clears ownership");
  System.out.println("PASS scene migration and ownership: "+checks+" checks");
 }
}'''
with tempfile.TemporaryDirectory(prefix='duo-island-core-') as directory:
    source=Path(directory)/'TestIslandRebuildCore.java';source.write_text(SOURCE,'utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-cp',str(CLASSES),'-d',directory,str(source)],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',os.pathsep.join((directory,str(CLASSES))),'TestIslandRebuildCore'],check=True)
