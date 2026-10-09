"""Keep opaque vendor slots discoverable without rejecting an entire runtime snapshot."""
from pathlib import Path
import hashlib
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')


def extract(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


harness = r'''import java.util.*;import java.lang.ref.WeakReference;import ls.augment.com.StatusBarIconCatalog;
public class TestInventoryIdentifiers {
 static class JSONObject {Map<String,Object> values=new HashMap<>();JSONObject put(String k,Object v){values.put(k,v);return this;}}
 static class JSONArray {JSONArray(Object values){}}
 static class View {}static class ViewGroup extends View {}
 static class StatusBarIconLayoutHook {static int observations;static View lastObserved;static void observeIcon(View view){observations++;lastObserved=view;}}
 static boolean enabled=true;static String coveringId(View view,String id,boolean virtual){return "";}
 static boolean activeRole(String id){return false;}
 static class Binding {String state="default",asset="a".repeat(64);}
 static class Resource {String error="";boolean loading,drawn;Object art;Binding binding=new Binding();}
 static class Entry {String id,unsupportedReason,instance="",stateProvenance="unknown",applicationCode="native",applicationReason="原厂";String[] states={"default"};boolean capable,virtual;WeakReference<ViewGroup> root;WeakReference<View> view;int updates,disposed;Map<String,Resource> resources=new HashMap<>();
  Entry(View view,ViewGroup parent,String id,boolean capable,String reason){this.view=new WeakReference<>(view);this.id=id;this.capable=capable;this.unsupportedReason=reason;root=new WeakReference<>(parent);}
  String surface(){return "main";}boolean suppressed(){return false;}void update(){updates++;}void dispose(){disposed++;}}
 static final Map<View,Entry> ENTRIES=new WeakHashMap<>();
 // PRODUCTION
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] args)throws Exception {
  check(unknownId("zte_fan").equals("unknown:zte_fan"),"existing legal vendor slot IDs remain stable");
  check(unknownId("a".repeat(72)).length()==80,"unknown prefix is included in maximum length");
  String hashed=unknownId("fan cooling");check(hashed.equals("EXPECTED_HASH"),"invalid vendor label uses full reproducible SHA-256");
  check(unknownId(" fan cooling ").equals(hashed),"incidental edge whitespace does not change identity");
  check(unknownId("Aa / fan").equals(unknownId("Aa / fan"))&&!unknownId("Aa / fan").equals(unknownId("BB / fan")),"invalid labels retain distinct stable identities");
  for(String label:new String[]{null,""," ","a".repeat(73),"a".repeat(10000),"fan/cooling","风扇 状态","slot;name","slot,name","line\nbreak","emoji😀"}){
   String id=unknownId(label);check(StatusBarIconCatalog.validId(id)&&id.length()<=80,"all vendor labels produce bridge-valid bounded IDs");
  }
  check(inventoryId("wifi.signal").equals("wifi.signal")&&inventoryId("unknown:mobile.type").equals("unknown:mobile.type"),"known semantic IDs and existing unknown components stay unchanged");
  View view=new View();ViewGroup root=new ViewGroup();observe(view,root,"vendor / bad",true,"");Entry entry=ENTRIES.get(view);
  check(StatusBarIconLayoutHook.observations==1&&StatusBarIconLayoutHook.lastObserved==view,"inventory observation forwards the same native view to icon layout tracking");
  check(StatusBarIconCatalog.validId(entry.id)&&!entry.capable&&entry.unsupportedReason.equals("未识别的系统图标"),"observation normalizes unexpected invalid semantic IDs as discoverable unsupported objects");
  observe(view,root,"vendor / bad",true,"");check(ENTRIES.get(view)==entry&&entry.updates==2&&entry.disposed==0,"repeated unknown observation updates same entry instead of reallocating");
  check(StatusBarIconLayoutHook.observations==2&&StatusBarIconLayoutHook.lastObserved==view,"repeated observations continue updating layout tracking without changing inventory ownership");
  Entry validEntry=new Entry(view,root,"wifi",true,"");validEntry.instance="wifi:abc";InventoryRow valid=new InventoryRow(validEntry,"visible","当前显示","whole_layers");
  Entry invalidEntry=new Entry(view,root,"vendor / bad",true,"");invalidEntry.instance="private/path/".repeat(1000);InventoryRow invalid=new InventoryRow(invalidEntry,"visible","raw label","whole_layers");
  JSONObject a=valid.json(),b=invalid.json();check(a.values.get("id").equals("wifi")&&a.values.get("capability").equals("whole_layers"),"publication preserves valid supported rows");
  check(StatusBarIconCatalog.validId((String)b.values.get("id"))&&((String)b.values.get("instance")).length()<=128&&b.values.get("state").equals("unsupported")&&b.values.get("capability").equals("observe_only"),"publication fallback bounds malformed IDs and instances without dropping unknown row");
  List<InventoryRow> rows=Arrays.asList(valid,invalid);for(InventoryRow row:rows)check(StatusBarIconCatalog.validId((String)row.json().values.get("id")),"mixed known and malformed unknown rows all satisfy provider identifier validation");
  System.out.println("Status-bar inventory identifiers: "+checks+" assertions passed");
 }
}'''

methods = '\n'.join(extract(marker) for marker in (
    'private static String unknownId(',
    'private static String inventoryId(',
    'private static void observe(',
    'private static final class InventoryRow{',
)).replace('org.json.JSONException', 'Exception')
assert 'observe(view, root, unknownId(slot), false,' in source
assert 'rows.add(new InventoryRow(' in source
expected = 'unknown:slot:' + hashlib.sha256(b'fan cooling').hexdigest()
with tempfile.TemporaryDirectory(prefix='statusbar-identifiers-') as tmp:
    work = Path(tmp)
    test = work / 'TestInventoryIdentifiers.java'
    test.write_text(harness.replace('// PRODUCTION', methods).replace('EXPECTED_HASH', expected), encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    catalog = ROOT / 'android/app/src/main/java/ls/augment/com/StatusBarIconCatalog.java'
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(test), str(catalog)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestInventoryIdentifiers'], check=True)
