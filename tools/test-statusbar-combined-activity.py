"""Exercise production semantic mapping, scoped parent hiding and active-data inventory indexing."""
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

HARNESS = r'''import java.util.*;import ls.augment.com.*;
public class TestCombinedActivity {
 static class View {String family="wifi";boolean hideMobile;}
 static boolean on(View view,String key){return key.equals("hide_mobile_activity")&&view.hideMobile;}
 static boolean[] legacyMobile(String id,boolean enabled){View view=new View();view.hideMobile=enabled;boolean hide=false,managed=false;
  // LEGACY_MOBILE
  return new boolean[]{hide,managed};}
 static String wifiId(View view){return view.family;}static String mobileId(View view){return view.family;}
 static boolean enabled=true,visibilityActive=true;static StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.empty();
 static ConnectivityIconState radioState(int slot){return new ConnectivityIconState(50,false,false,0,false,slot<0?-1:41+slot,
  Arrays.asList(new ConnectivityIconState.Sim(41,0,3),new ConnectivityIconState.Sim(42,1,4)));}
 static class ConnectivityIconSource{ConnectivityIconState state=radioState(1);}
 static class ConnectivityIconView extends View{final ConnectivityIconState state;ConnectivityIconView(int activeSlot){state=radioState(activeSlot);}ConnectivityIconState sourceState(){return state;}}
 static ConnectivityIconSource connectivity=new ConnectivityIconSource();
 static class JSONObject {Map<String,Object> values=new HashMap<>();JSONObject put(String key,Object value){values.put(key,value);return this;}
  String optString(String key){Object value=values.get(key);return value instanceof String?(String)value:"";}
  JSONObject optJSONObject(String key){return (JSONObject)values.get(key);}JSONArray optJSONArray(String key){return (JSONArray)values.get(key);}}
 static class JSONArray {List<JSONObject> rows=new ArrayList<>();JSONArray add(JSONObject row){rows.add(row);return this;}
  int length(){return rows.size();}JSONObject optJSONObject(int index){return rows.get(index);}}
 static final Map<String,List<JSONObject>> observed=new HashMap<>();static JSONObject inventory;static String surface="control";
 // METHODS
 static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 public static void main(String[] args){
  View view=new View();
  for(String id:new String[]{"mobile_in","mobile_out","mobile_inout","data_inout"}){
   boolean[] hidden=legacyMobile(id,true),restored=legacyMobile(id,false);
   check(hidden[0]&&hidden[1],"legacy mobile activity switch covers native alias: "+id);
   check(!restored[0]&&restored[1],"disabling legacy hiding restores managed native alias: "+id);
  }
  for(String id:new String[]{"wifi_inout","mobile_type","other_inout"}){
   boolean[] unrelated=legacyMobile(id,true);check(!unrelated[0]&&!unrelated[1],"mobile activity switch leaves other native content alone: "+id);
  }
  check(semantic(view,"wifi_inout",null).equals("wifi.activity_inout"),"combined WiFi image is not mislabeled as one direction");
  view.family="secondary_wifi";check(semantic(view,"wifi_inout",null).equals("secondary_wifi.activity_inout"),"secondary WiFi keeps family identity");
  view.family="mobile2";check(semantic(view,"data_inout",null).equals("mobile2.activity_inout"),"OEM combined mobile data maps to actual physical card");
  check(semantic(view,"mobile_inout",null).equals("mobile2.activity_inout"),"combined mobile alias is explicit");
  check(semantic(view,"mobile_in",null).equals("mobile2.activity_in")&&semantic(view,"mobile_out",null).equals("mobile2.activity_out"),"independent arrows remain independent");
  visibility=visibility.with("control","wifi",true);
  check(scopedHidden(view,"wifi.activity_inout","control")&&scopedHidden(view,"wifi.signal","control"),"parent hiding covers signal and combined activity");
  check(!scopedHidden(view,"wifi.activity_inout","notification"),"control hiding cannot bleed into notification header");
  visibility=StatusBarVisibilitySpec.empty().with("control","mobile_data",true);
  check(scopedHidden(view,"mobile2.activity_inout","control")&&!scopedHidden(view,"mobile1.activity_inout","control"),"active-data parent hide follows actual card role");
  connectivity.state=radioState(0);
  check(scopedHidden(view,"mobile1.activity_inout","control")&&!scopedHidden(view,"mobile2.activity_inout","control"),"native view follows changed active physical card");
  View owner=new ConnectivityIconView(1);
  check(scopedHidden(owner,"mobile2.activity_inout","control")&&!scopedHidden(owner,"mobile1.activity_inout","control"),"connectivity owner uses its source state instead of unrelated global radio state");
  View unknownOwner=new ConnectivityIconView(-1);
  check(!scopedHidden(unknownOwner,"mobile1.activity_inout","control")&&!scopedHidden(unknownOwner,"mobile2.activity_inout","control"),"unknown owner active subscription does not guess a card role");
  connectivity=null;
  check(!scopedHidden(view,"mobile1.activity_inout","control")&&!scopedHidden(view,"mobile2.activity_inout","control"),"missing global radio state leaves native card roles unchanged");
  check(!scopedHidden(owner,"mobile2.activity_inout","notification"),"owner-specific active card hiding still respects surface scope");
  connectivity=new ConnectivityIconSource();
  String asset="a".repeat(64);
  for(String id:new String[]{"wifi.activity_inout","secondary_wifi.activity_inout","mobile1.activity_inout","mobile2.activity_inout","mobile_data.activity_inout"}){
   check(StatusBarIconCatalog.find(id)!=null,"combined indicator is an honest catalogue entry: "+id);
   StatusBarThemeSpec theme=StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding(id,"default","whole",asset,false,100,0,0,100,false));
   check(StatusBarAssetPolicy.resolve(theme,id,new String[]{"default"},"whole","control").code.equals("native_composite"),"whole cannot freeze unknown combined directions: "+id);
   theme=theme.with(new StatusBarThemeSpec.Binding(id,"default","foreground",asset,false,100,0,0,100,false));
   check(StatusBarAssetPolicy.resolve(theme,id,new String[]{"default"},"foreground","control").binding!=null,"combined indicator retains decoration support: "+id);
  }
  JSONObject active=new JSONObject().put("id","mobile2.signal").put("activeDataRole","mobile_data.signal");
  JSONObject other=new JSONObject().put("id","mobile1.signal").put("activeDataRole","");
  JSONObject bad=new JSONObject().put("id","wifi.signal").put("activeDataRole","wifi");
  JSONObject lock=new JSONObject().put("id","mobile1.signal").put("activeDataRole","mobile_data.signal");
  JSONObject surfaces=new JSONObject().put("control",new JSONArray().add(active).add(other).add(bad)).put("lock",new JSONArray().add(lock));
  inventory=new JSONObject().put("surfaces",surfaces);new TestCombinedActivity().indexInventory();
  check(observed.get("mobile_data.signal").size()==1&&observed.get("mobile_data.signal").get(0)==active,"role inventory shares actual current card evidence");
  check(observed.get("mobile2.signal").get(0)==active&&observed.get("mobile1.signal").get(0)==other,"role indexing preserves physical card entries");
  check(!observed.containsKey("wifi"),"unrelated role strings cannot create misleading aliases");
  surface="lock";new TestCombinedActivity().indexInventory();
  check(observed.get("mobile_data.signal").get(0)==lock&&!observed.containsKey("mobile2.signal"),"surface switch replaces old role evidence");
  System.out.println("Status-bar combined activity and role inventory: "+checks+" assertions passed");
 }
}'''
members = '\n'.join((method(JAVA / 'hook/StatusBarAssetsHook.java', 'private static String semantic('),
                     method(JAVA / 'hook/StatusBarAssetsHook.java', 'private static boolean scopedHidden('),
                     method(JAVA / 'hook/StatusBarAssetsHook.java', 'private static int mobileSlot('),
                     method(JAVA / 'hook/StatusBarAssetsHook.java', 'private static boolean activeRole(String id,View owner)'),
                     method(JAVA / 'StatusBarAssetsActivity.java', 'private void indexInventory(')))
with tempfile.TemporaryDirectory(prefix='statusbar-combined-activity-') as tmp:
    work = Path(tmp)
    source = work / 'TestCombinedActivity.java'
    source.write_text(HARNESS.replace('// METHODS', members).replace('// LEGACY_MOBILE',
                     method(JAVA / 'hook/RedMagicLegacyUiHook.java', 'if (id.equals("mobile_in")')), encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(source),
                    *(str(JAVA / name) for name in ('StatusBarIconCatalog.java', 'StatusBarSurfaceSpec.java', 'StatusBarThemeSpec.java',
                                                   'StatusBarAssetPolicy.java', 'StatusBarVisibilitySpec.java', 'ConnectivityIconState.java'))], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestCombinedActivity'], check=True)
