"""Old worksheet-only assets may accompany a backup, but cannot regain active references."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'

def method(file, marker):
    source = file.read_text(encoding='utf-8')
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

HARNESS = r'''import java.util.*;import java.io.*;import java.nio.charset.StandardCharsets;
import ls.augment.com.StatusBarSheetSpec;import ls.augment.com.StatusBarAssetReferences;
import ls.augment.com.StatusBarThemeSpec;import ls.augment.com.StatusBarFontSpec;
public class TestRetiredTransfer {
 static class JSONObject {Map<String,Object> values=new LinkedHashMap<>();JSONObject put(String key,Object value){values.put(key,value);return this;}
  Object get(String key){return values.get(key);}boolean has(String key){return values.containsKey(key);}int length(){return values.size();}
  Iterator<String> keys(){return values.keySet().iterator();}public String toString(){return values.toString();}}
 static class StatusBarAssetPack {static final int MAX_FILES=512,MAX_MANIFEST_BYTES=256*1024,MAX_NOTICES_BYTES=2*1024*1024;
  // PACK_METHODS
 }
 // TRANSFER_METHODS
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static JSONObject notice(){return new JSONObject().put("name","old image").put("author","artist").put("license","CC0");}
 public static void main(String[] args)throws Exception {
  String archive="a".repeat(64),current="b".repeat(64),unrelated="c".repeat(64);
  StatusBarSheetSpec sheet=StatusBarSheetSpec.empty(1,1).withCell(new StatusBarSheetSpec.Cell(0,0,1,1,"image",20,0,0,0,0,"center","",archive));
  Map<String,String> values=new LinkedHashMap<>();values.put(StatusBarSheetSpec.KEY,sheet.serialize());values.put(StatusBarSheetSpec.MODE_KEY,"sheet");
  check(StatusBarAssetReferences.statusbarIcons(values).isEmpty(),"legacy worksheet-only backup requires no current artwork files");
  check(importedNotices(new JSONObject().put(archive,notice()),values).isEmpty(),"old worksheet notice is validated then omitted from restored active notices");
  try{importedNotices(new JSONObject().put(unrelated,notice()),values);throw new AssertionError("unrelated notice accepted");}catch(IOException expected){checks++;}
  try{importedNotices(new JSONObject().put(archive,new JSONObject().put("name","broken")),values);throw new AssertionError("malformed retired metadata accepted");}catch(IOException expected){checks++;}
  StatusBarThemeSpec theme=StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding("wifi.signal","level2","whole",current,false,100,0,0,100,false));
  values.put(StatusBarThemeSpec.KEY,theme.serialize());
  Map<String,String> result=importedNotices(new JSONObject().put(archive,notice()).put(current,notice()),values);
  check(result.keySet().equals(Set.of(current)),"mixed old backup retains only current theme provenance");
  values.put(StatusBarThemeSpec.KEY,theme.with(new StatusBarThemeSpec.Binding("wifi.signal","level3","whole",archive,false,100,0,0,100,false)).serialize());
  check(importedNotices(new JSONObject().put(archive,notice()),values).containsKey(archive),"a shared current image retains its attribution even when also in archived sheet");
  values.put(StatusBarThemeSpec.KEY,"");values.put(StatusBarFontSpec.KEY,StatusBarFontSpec.empty().with("clock","font:"+archive).serialize());
  check(importedNotices(new JSONObject().put(archive,notice()),values).containsKey(archive),"current font attribution is not lost to an archived image hash");
  check(importedNotices(null,values).isEmpty(),"older backups without notices remain importable");
  System.out.println("Retired worksheet backup compatibility: "+checks+" assertions passed");
 }
}'''
pack = JAVA / 'StatusBarAssetPack.java'
pack_methods = '\n'.join(method(pack, marker) for marker in ('public static Map<String,String> parseNotices(',
    'private static void checkNoticeHash(', 'private static void onlyKeys(', 'private static String metadata(', 'private static void validateMetadata('))
transfer = JAVA / 'ConfigTransferActivity.java'
transfer_methods = '\n'.join(method(transfer, marker) for marker in ('private static Set<String> noticeHashes(', 'private static Map<String,String> importedNotices('))
with tempfile.TemporaryDirectory(prefix='statusbar-retired-transfer-') as tmp:
    source = Path(tmp) / 'TestRetiredTransfer.java'
    source.write_text(HARNESS.replace('// PACK_METHODS', pack_methods).replace('// TRANSFER_METHODS', transfer_methods), encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '--release', '17', '-encoding', 'UTF-8', '-sourcepath', str(JAVA.parents[2]), '-d', tmp, str(source)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestRetiredTransfer'], check=True)
