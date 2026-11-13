"""Verify backup and checksummed snapshot retirement without resetting active island settings."""
import os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
CLASSES=ROOT/'android/app/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
JSON=next((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
source=(SRC/'ConfigTransferActivity.java').read_text('utf-8');start=source.index('    static LinkedHashMap<String,String> importSettings(');end=source.index('{',start)+1;depth=1
while depth:
 depth+=(source[end]=='{')-(source[end]=='}');end+=1
method=source[start:end]
body=r'''package ls.augment.com;import java.util.*;import org.json.*;import java.io.*;
public class TestRetiredImport{
 static final Set<String> EXCLUDED=Set.of("excluded.test");static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 METHOD
 public static void main(String[]args)throws Exception{
  JSONObject old=new JSONObject().put(SystemUiOptions.ISLAND,"1").put(IslandSceneRegistry.key("navigation"),"0").put(IslandNoticeBlacklist.KEY,"0|org.test.chat");
  for(String key:new String[]{"ls_augment_island_custom_appearance","ls_augment_rm_island_width","ls_augment_rm_island_height","ls_augment_rm_island_offset_x","ls_augment_rm_island_offset_y","ls_augment_rm_island_transparent","ls_augment_rm_island_app_style",NativeIslandSceneOptions.key("media"),NativeIslandSceneOptions.key("charging")}){
   old.put(key,"150");check(IslandSceneRegistry.retiredSetting(key),"known retired key");check(!ConfigSchema.contains(key),"retired key not re-registered");
  }
  Map<String,String> imported=importSettings(old);check(imported.size()==3,"only current keys import");check("0".equals(imported.get(IslandSceneRegistry.key("navigation"))),"explicit scene OFF preserved");check("0|org.test.chat".equals(imported.get(IslandNoticeBlacklist.KEY)),"current blacklist preserved");
  for(JSONObject invalid:List.of(new JSONObject().put("unknown_future_key","1"),new JSONObject().put("ls_augment_rm_island_width_extra","1"),new JSONObject().put(SystemUiOptions.ISLAND,1),new JSONObject().put(IslandNoticeBlacklist.KEY,"broken"))){
   boolean rejected=false;try{importSettings(invalid);}catch(IOException expected){rejected=true;}check(rejected,"unknown or invalid active keys still rejected");
  }
  check(importSettings(new JSONObject().put("excluded.test",new JSONObject())).isEmpty(),"existing exclusions unchanged");
  JSONObject legacy=new JSONObject().put(NativeIslandSceneOptions.ENABLED,"1").put(SystemUiOptions.PREFIX+"island_music","0").put(SystemUiOptions.PREFIX+"island_charging","1");
  check(importSettings(legacy).size()==3,"old master remains available only for migration; current choices retained");
  snapshots();
  System.out.println("PASS retired island backup and snapshot import: "+checks+" checks");
 }
 static String signed(String body)throws Exception{
  byte[] bytes=body.getBytes(java.nio.charset.StandardCharsets.UTF_8);
  String digest=java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(bytes));
  return "LSA1."+digest+"."+Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
 }
 static String line(String key,String value){return key+"="+Base64.getUrlEncoder().withoutPadding().encodeToString(value.getBytes(java.nio.charset.StandardCharsets.UTF_8))+"\n";}
 static void snapshots()throws Exception{
  Map<String,String> current=new LinkedHashMap<>(ConfigSchema.runtimeDefaults());current.put(SystemUiOptions.ISLAND,"1");
  current.put(IslandSceneRegistry.key("media"),"0");current.put(IslandSceneRegistry.key("charging"),"1");current.put(IslandSceneRegistry.key("navigation"),"0");
  current.put(IslandNoticeBlacklist.KEY,"0|org.test.chat");
  ConfigSnapshot snapshot=ConfigSnapshot.create(29,12345,current);check(snapshot!=null,"current snapshot created");
  String body=new String(Base64.getUrlDecoder().decode(snapshot.serialize().split("\\.",3)[2]),java.nio.charset.StandardCharsets.UTF_8);
  if(!body.endsWith("\n"))body+="\n";
  Map<String,String> retired=new LinkedHashMap<>();
  retired.put("ls_augment_island_custom_appearance","1");retired.put("ls_augment_rm_island_width","120");retired.put("ls_augment_rm_island_height","32");
  retired.put("ls_augment_rm_island_offset_x","-120");retired.put("ls_augment_rm_island_offset_y","24");
  retired.put("ls_augment_rm_island_transparent","2");retired.put("ls_augment_rm_island_app_style","1");
  retired.put(NativeIslandSceneOptions.key("media"),"1");retired.put(NativeIslandSceneOptions.key("charging"),"0");
  String oldBody=body;for(Map.Entry<String,String> entry:retired.entrySet())oldBody+=line(entry.getKey(),entry.getValue());
  String oldSigned=signed(oldBody);ConfigSnapshot parsed=ConfigSnapshot.parse(oldSigned);
  check(parsed!=null,"older complete snapshot survives retired keys");check(parsed.serialize().equals(oldSigned),"original checksum and bytes retained");
  for(Map.Entry<String,String> entry:current.entrySet())check(entry.getValue().equals(parsed.get(entry.getKey())),"unrelated and current settings preserved: "+entry.getKey());
  for(String key:retired.keySet()){
   check(parsed.get(key)==null,"retired value not exposed to runtime");
   check(ConfigSnapshot.parse(signed(body+line(key,"99999")))==null,"invalid retired value rejected");
   check(ConfigSnapshot.parse(signed(body+line(key,retired.get(key))+line(key,retired.get(key))))==null,"duplicate retired key rejected");
  }
  check(ConfigSnapshot.parse(signed(body+line("ls_augment_native_island_scene_support_media_extra","1")))==null,"unknown key still rejected");
  check(ConfigSnapshot.parse(oldSigned.replace("LSA1.","LSA1.0"))==null,"corrupt checksum still rejected");
  check(ConfigSnapshot.parse(signed(body.replace(line(SystemUiOptions.ISLAND,"1"),"")))==null,"missing active setting still rejected");
 }
}'''.replace('METHOD',method)
with tempfile.TemporaryDirectory(prefix='duo-retired-import-') as tmp:
 p=Path(tmp)/'TestRetiredImport.java';p.write_text(body,'utf-8');cp=os.pathsep.join(map(str,(CLASSES,JSON)))
 subprocess.run([JDK/'javac','-encoding','UTF-8','-cp',cp,'-d',tmp,p,SRC/'IslandSceneRegistry.java'],check=True)
 subprocess.run([JDK/'java','-cp',os.pathsep.join((tmp,cp)),'ls.augment.com.TestRetiredImport'],check=True)
