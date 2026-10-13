"""Offline production inventory validation, provider authorization and safe rejection diagnostics."""
from pathlib import Path
import argparse, importlib.util, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
spec=importlib.util.spec_from_file_location('automation_fixture',ROOT/'tools/test-automation-diagnostics-runtime.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)

def extract(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

FIXTURE=r'''package ls.augment.com;
import android.os.Bundle;import org.json.*;
public final class InventoryDiagnosticFixture {
 static int checks,notifications,lookups;static String[] callers={"com.android.systemui"};
 static class Binder {static int uid=10331;static int getCallingUid(){return uid;}}
 static class Process {static int myUid(){return 10558;}}
 static class Uri {static String parse(String value){return value;}}
 static class Resolver {void notifyChange(String uri,Object observer){notifications++;}}
 static class Manager {String[] getPackagesForUid(int uid){lookups++;return callers;}}
 static class Context {Manager getPackageManager(){return new Manager();}Resolver getContentResolver(){return new Resolver();}}
 static Context getContext(){return new Context();}
 static Bundle call(String method,Bundle extras){Bundle result=new Bundle();
 // PROVIDER
 return result;}
 // FORMATTER
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static JSONObject payload(long at)throws Exception {
  return new JSONObject().put("version",1).put("session","fixture").put("observedAt",at)
   .put("surfaces",new JSONObject().put("main",new JSONArray().put(new JSONObject().put("id","wifi"))));
 }
 static void reject(String input,String reason)throws Exception {
  String before=StatusBarInventoryBridge.read().getString("payload");
  Bundle result=StatusBarInventoryBridge.publishDetailed(input);
  check(!result.getBoolean("ok",false)&&reason.equals(result.getString("reason")),"precise rejection: "+reason);
  check(before.equals(StatusBarInventoryBridge.read().getString("payload")),"rejection preserves accepted inventory: "+reason);
  String diagnostic=inventoryRejection(result);
  check(diagnostic.contains(reason)&&diagnostic.length()<300&&!diagnostic.contains("PRIVATE_PAYLOAD"),"bounded private-safe diagnostic: "+reason);
 }
 public static void main(String[] args)throws Exception {
  check(StatusBarInventoryBridge.publish(payload(100).toString()),"valid initial inventory accepted");
  reject(null,"payload_missing");reject("x".repeat(StatusBarInventoryBridge.MAX_PAYLOAD+1),"payload_too_large");reject("PRIVATE_PAYLOAD","json_invalid");
  reject(payload(101).put("version",2).toString(),"version_invalid");
  JSONObject p=payload(101);p.remove("session");reject(p.toString(),"session_or_time_missing");
  reject(payload(101).put("session","PRIVATE_PAYLOAD /").toString(),"session_invalid");
  reject(payload(0).toString(),"observed_at_invalid");
  reject(payload(101).put("surfaces","PRIVATE_PAYLOAD").toString(),"surfaces_invalid");
  reject(payload(101).put("surfaces",new JSONObject().put("PRIVATE_PAYLOAD",new JSONArray())).toString(),"surface_invalid");
  reject(payload(101).put("surfaces",new JSONObject().put("main","PRIVATE_PAYLOAD")).toString(),"surface_rows_invalid");
  JSONArray rows=new JSONArray();for(int i=0;i<257;i++)rows.put(new JSONObject().put("id","wifi"));
  reject(payload(101).put("surfaces",new JSONObject().put("main",rows)).toString(),"too_many_rows");
  reject(payload(101).put("surfaces",new JSONObject().put("main",new JSONArray().put("PRIVATE_PAYLOAD"))).toString(),"row_invalid");
  reject(payload(101).put("surfaces",new JSONObject().put("main",new JSONArray().put(new JSONObject()))).toString(),"row_id_missing");
  reject(payload(101).put("surfaces",new JSONObject().put("main",new JSONArray().put(new JSONObject().put("id","PRIVATE_PAYLOAD /")))).toString(),"row_id_invalid");
  reject(payload(101).put("surfaces",new JSONObject().put("main",new JSONArray().put(new JSONObject().put("id","wifi").put("label","PRIVATE_PAYLOAD".repeat(400))))).toString(),"row_too_large");
  reject(payload(99).toString(),"observation_out_of_order");
  check(StatusBarInventoryBridge.publish(payload(100).toString()),"same-time retry remains idempotently acceptable");
  check(StatusBarInventoryBridge.publish(payload(1).put("session","new-session").toString()),"fresh process session can start new observation clock");
  Bundle extras=new Bundle();extras.putString("payload",payload(102).toString());
  Binder.uid=110331;Bundle denied=call("statusbar_inventory_publish",extras);
  check("caller_user_mismatch".equals(denied.getString("reason"))&&notifications==0&&lookups==0,"cross-user caller rejected before payload or package work");
  Binder.uid=10331;callers=new String[]{"untrusted.app"};denied=call("statusbar_inventory_publish",extras);
  check("caller_not_systemui".equals(denied.getString("reason"))&&notifications==0&&denied.getInt("payloadChars",0)==-1,"untrusted caller gets no payload-derived metadata");
  callers=null;check("caller_not_systemui".equals(call("statusbar_inventory_publish",extras).getString("reason")),"unknown UID remains unauthorized");
  callers=new String[]{"com.android.systemui"};check("payload_missing".equals(call("statusbar_inventory_publish",null).getString("reason")),"authorized missing extras has explicit reason");
  check(call("statusbar_inventory_publish",extras).getBoolean("ok",false)&&notifications==1,"authorized valid publication stores and notifies exactly once");
  check(inventoryRejection(new Bundle()).equals("inventory_rejected:reason_unavailable"),"legacy response remains explicit unknown reason");
  Bundle hostile=new Bundle();hostile.putString("reason","PRIVATE_PAYLOAD");check(!inventoryRejection(hostile).contains("PRIVATE_PAYLOAD"),"arbitrary provider text cannot enter logs");
  System.out.println("PASS inventory rejection diagnostics: "+checks+" assertions; offline production provider branch and validation");
 }
}'''

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk',type=Path,default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
    parser.add_argument('--json-jar',type=Path)
    args=parser.parse_args()
    jars=list((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json/20240303').glob('*/json-20240303.jar'))
    jar=args.json_jar or (jars[0] if jars else None)
    if jar is None or not jar.is_file():parser.error('Pass --json-jar with the cached org.json 20240303 test runtime.')
    provider=extract((SRC/'LSConfigProvider.java').read_text(encoding='utf-8'),'if ("statusbar_inventory_publish".equals(method)) {')
    formatter=extract((SRC/'hook/StatusBarAssetsHook.java').read_text(encoding='utf-8'),'private static String inventoryRejection(Bundle response){')
    with tempfile.TemporaryDirectory(prefix='lsa-inventory-diagnostics-') as tmp:
        out=Path(tmp);stub=out/'android/os/Bundle.java';stub.parent.mkdir(parents=True)
        stub.write_text(base.STUBS['android/os/Bundle.java'],encoding='utf-8')
        fixture=out/'InventoryDiagnosticFixture.java';fixture.write_text(FIXTURE.replace('// PROVIDER',provider).replace('// FORMATTER',formatter),encoding='utf-8')
        suffix='.exe' if os.name=='nt' else ''
        sources=[stub,fixture,*[SRC/name for name in ['StatusBarInventoryBridge.java','StatusBarSurfaceSpec.java','StatusBarIconCatalog.java']]]
        subprocess.run([str(args.jdk/'bin'/('javac'+suffix)),'-encoding','UTF-8','-cp',str(jar),'-d',str(out/'classes'),*map(str,sources)],check=True,cwd=ROOT)
        subprocess.run([str(args.jdk/'bin'/('java'+suffix)),'-cp',str(out/'classes')+os.pathsep+str(jar),'ls.augment.com.InventoryDiagnosticFixture'],check=True,cwd=ROOT)

if __name__=='__main__':main()
