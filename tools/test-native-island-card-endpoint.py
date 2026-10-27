"""Verify authenticated, process-lifetime island host discovery and stale release handling."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
files = {
 'android/os/IBinder.java': 'package android.os;public interface IBinder {boolean isBinderAlive();}',
 'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 11000;}}',
 'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {Map<String,Object> data=new HashMap<>();
 public int size(){return data.size();}public void clear(){data.clear();}public void putString(String k,String s){data.put(k,s);}
 public String getString(String k,String d){return (String)data.getOrDefault(k,d);}public void putBinder(String k,IBinder b){data.put(k,b);}
 public IBinder getBinder(String k){return (IBinder)data.get(k);}public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}}''',
 'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo {public int uid;}',
 'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager {
 public static class NameNotFoundException extends Exception{}public ApplicationInfo getApplicationInfo(String p,int f)throws NameNotFoundException {
 ApplicationInfo a=new ApplicationInfo();if(p.equals("com.android.systemui"))a.uid=1000;else if(p.equals("zte.com.cn.alarmclock"))a.uid=12000;else if(p.equals("cn.zte.recorder"))a.uid=13000;else if(p.equals("com.zte.nebulatranslation"))a.uid=14000;else if(p.equals("com.zte.cn.zteshare"))a.uid=15000;else if(p.equals("com.zte.multscr"))a.uid=16000;else if(p.equals("com.android.dialer"))a.uid=17000;else if(p.equals("com.zte.personalagent"))a.uid=18000;else throw new NameNotFoundException();return a;}}''',
 'android/content/Context.java': 'package android.content;public class Context {public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}',
 'ls/augment/com/TestCardEndpoint.java': '''package ls.augment.com;import android.os.*;import android.content.Context;
 public class TestCardEndpoint {static int checks;static final String UI="com.android.systemui",CLOCK="zte.com.cn.alarmclock";static final Context C=new Context();
 static class Host implements IBinder {boolean alive=true;public boolean isBinderAlive(){return alive;}}
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static Bundle request(String op,Host host){Bundle b=new Bundle();b.putString("op",op);if(host!=null)b.putBinder("host",host);return b;}
 static Bundle call(String op,Host host,int uid,String pkg){return NativeIslandCardEndpoint.call(C,null,request(op,host),uid,pkg,new String[]{pkg});}
 public static void main(String[]args){Host first=new Host(),second=new Host();
 check(call("get",null,12000,CLOCK).size()==0,"no fabricated host before registration");
 check(call("register",first,12000,CLOCK).size()==0,"source cannot register display endpoint");
 check(call("register",first,1000,UI).getBoolean("ok"),"same-user SystemUI registers live endpoint");
 check(call("get",null,12000,CLOCK).getBinder("host")==first,"clock gets actual binder");
 check(call("get",null,18000,"com.zte.personalagent").getBinder("host")==first,"authenticated suggestion producer obtains live host");
 check(call("get",null,17000,"com.zte.personalagent").size()==0&&call("get",null,118000,"com.zte.personalagent").size()==0,"personal source rejects wrong UID and cross-user discovery");
 check(call("register",second,18000,"com.zte.personalagent").size()==0,"personal source cannot replace host");
 call("release",first,18000,"com.zte.personalagent");check(call("get",null,18000,"com.zte.personalagent").getBinder("host")==first,"personal source cannot release host");
 check(call("get",null,13000,"cn.zte.recorder").getBinder("host")==first,"authenticated recorder gets actual binder");
 check(call("get",null,14000,"com.zte.nebulatranslation").getBinder("host")==first,"authenticated translation obtains live host");
 check(call("get",null,15000,"com.zte.cn.zteshare").getBinder("host")==first,"authenticated transfer source obtains actual live host");
 check(call("get",null,14000,"com.zte.cn.zteshare").size()==0&&call("get",null,115000,"com.zte.cn.zteshare").size()==0,"wrong UID and cross-user transfer discovery rejected");
 check(call("register",second,15000,"com.zte.cn.zteshare").size()==0,"transfer source cannot register a display endpoint");
 check(call("get",null,16000,"com.zte.multscr").getBinder("host")==first,"authenticated NFC source obtains live host");
 check(call("get",null,15000,"com.zte.multscr").size()==0&&call("get",null,116000,"com.zte.multscr").size()==0,"NFC discovery rejects wrong UID and cross-user caller");
 check(call("register",second,16000,"com.zte.multscr").size()==0,"NFC source cannot replace display endpoint");
 call("release",first,16000,"com.zte.multscr");check(call("get",null,16000,"com.zte.multscr").getBinder("host")==first,"NFC source cannot release display endpoint");
 check(call("get",null,13000,"com.zte.nebulatranslation").size()==0,"translation UID cannot be impersonated");
 check(call("register",second,14000,"com.zte.nebulatranslation").size()==0,"translation cannot replace host");
 check(call("get",null,12000,"cn.zte.recorder").size()==0,"recorder cannot be impersonated by clock UID");
 check(call("register",second,13000,"cn.zte.recorder").size()==0,"recorder cannot replace display endpoint");
 check(call("get",null,1000,UI).size()==0,"other caller cannot obtain producer capability");
 check(call("get",null,112000,CLOCK).size()==0,"cross-user producer denied");
 check(call("get",null,12001,CLOCK).size()==0,"claimed package with different UID denied");
 check(NativeIslandCardEndpoint.call(C,null,request("get",null),12000,CLOCK,new String[]{UI}).size()==0,"package must belong to authenticated caller");
 check(NativeIslandCardEndpoint.call(C,"extra",request("get",null),12000,CLOCK,new String[]{CLOCK}).size()==0,"unexpected argument denied");
 Bundle extra=request("get",first);check(NativeIslandCardEndpoint.call(C,null,extra,12000,CLOCK,new String[]{CLOCK}).size()==0,"unexpected payload denied");
 check(call("register",second,1000,UI).getBoolean("ok"),"replacement host accepted");call("release",first,1000,UI);
 check(call("get",null,12000,CLOCK).getBinder("host")==second,"old host release cannot clear replacement");
 call("release",second,12000,CLOCK);check(call("get",null,12000,CLOCK).getBinder("host")==second,"source cannot release display host");
 second.alive=false;check(call("get",null,12000,CLOCK).size()==0,"dead display is never advertised");
 check(!call("register",second,1000,UI).getBoolean("ok"),"dead registration rejected");
 call("register",first,1000,UI);call("release",first,1000,UI);check(call("get",null,12000,CLOCK).size()==0,"matching live release retires endpoint");
 check("countdown".equals(NativeIslandCardProtocol.scene(CLOCK,CLOCK+"_timer_countdown")),"only verified sender/card mapped");
 check("record".equals(NativeIslandCardProtocol.scene("cn.zte.recorder","cn.zte.recorder_recorder_background")),"verified recorder wire card ID includes SDK sender prefix");
 check(NativeIslandCardProtocol.scene(CLOCK,"cn.zte.recorder_recorder_background")==null&&NativeIslandCardProtocol.scene("cn.zte.recorder","recorder_background")==null,"card ID must match sender and SDK wire form");
 check("cn.zte.recorder".equals(NativeIslandCardProtocol.sourcePackage("record"))&&NativeIslandCardProtocol.sourcePackage("unknown")==null,"source discovery maps only verified scenes");
 check(NativeIslandCardProtocol.scene(UI,CLOCK+"_timer_countdown")==null&&NativeIslandCardProtocol.scene(CLOCK,"unknown")==null,"unknown cards preserve native handling");
 String translation="com.zte.nebulatranslation";
 check("meeting".equals(NativeIslandCardProtocol.scene(translation,translation+"_transcription"))&&"ai".equals(NativeIslandCardProtocol.scene(translation,translation+"_call")),"meeting and AI-assistant wire identities follow source scenes");
 check(NativeIslandCardProtocol.scene(CLOCK,translation+"_call")==null&&NativeIslandCardProtocol.scene(translation,"call")==null,"source and prefixed identity required");
 check(NativeIslandCardProtocol.compactOnly("meeting")&&NativeIslandCardProtocol.compactOnly("ai")&&!NativeIslandCardProtocol.compactOnly("record")&&!NativeIslandCardProtocol.compactOnly("countdown"),"compact exception restricted to verified producers");
 check("transfer".equals(NativeIslandCardProtocol.scene("com.zte.cn.zteshare","com.zte.cn.zteshare_share_transfer"))&&!NativeIslandCardProtocol.compactOnly("transfer")&&NativeIslandCardProtocol.sceneBit("transfer")==16,"transfer maps to independent capability and requires real expanded controls");
 check(NativeIslandCardProtocol.scene("com.zte.cn.zteshare","share_transfer")==null&&NativeIslandCardProtocol.scene(translation,"com.zte.cn.zteshare_share_transfer")==null,"transfer wire identity cannot be spoofed by another source");
 check(call("register",first,1000,UI).getBoolean("ok"),"live host restored for call source checks");
 check(call("get",null,17000,"com.android.dialer").getBinder("host")==first,"authenticated dialer receives live endpoint");
 check(call("get",null,16000,"com.android.dialer").size()==0&&call("get",null,117000,"com.android.dialer").size()==0,"dialer UID and user cannot be spoofed");
 check(call("register",second,17000,"com.android.dialer").size()==0,"dialer cannot register a host");
 check("call".equals(NativeIslandCardProtocol.scene("com.android.dialer","com.android.dialer_call_background"))&&NativeIslandCardProtocol.sceneBit("call")==64&&NativeIslandCardProtocol.compactCallback("call"),"dialer compact callback has independent capability");
 check(!NativeIslandCardProtocol.compactCallback("ai")&&NativeIslandCardProtocol.scene("com.zte.nebulatranslation","com.android.dialer_call_background")==null,"AI assistance cannot impersonate dialer callback cards");
 String nfc="com.zte.multscr",wire=nfc+"_"+nfc+".share_transfer";
 check("nfc_transfer".equals(NativeIslandCardProtocol.scene(nfc,wire))&&nfc.equals(NativeIslandCardProtocol.sourcePackage("nfc_transfer"))&&NativeIslandCardProtocol.sceneBit("nfc_transfer")==32&&!NativeIslandCardProtocol.compactOnly("nfc_transfer"),"NFC has independent bit and needs original expanded controls");
 check(NativeIslandCardProtocol.scene(nfc,nfc+".share_transfer")==null&&NativeIslandCardProtocol.scene("com.zte.cn.zteshare",wire)==null,"NFC exact wire ID and sender must both match");

 String personal="com.zte.personalagent";
 for(String type:new String[]{"TRAVEL_FLIGHT_PLAN","TRAVEL_FLIGHT_AIRPORT","TRAVEL_CAROUSEL","TRAVEL_FLIGHT_SCENIC_TINY","FLIGHT_BOOK_HOTEL_CARD"})
  check("flight".equals(NativeIslandCardProtocol.scene(personal,personal+"_flight_CA1234_20261027_"+type)),"five native flight identity suffixes: "+type);
 check(NativeIslandCardProtocol.scene("other",personal+"_key_TRAVEL_FLIGHT_PLAN")==null&&NativeIslandCardProtocol.scene(personal,"key_TRAVEL_FLIGHT_PLAN")==null,"flight requires exact sender and wire package prefix");
 check(NativeIslandCardProtocol.scene(personal,personal+"__TRAVEL_FLIGHT_PLAN")==null&&NativeIslandCardProtocol.scene(personal,personal+"_key_TRAVEL_PRE_FLIGHT_BATTERY_LOW")==null,"flight rejects empty journey key and separate battery scene");
 check(NativeIslandCardProtocol.scene(personal,personal+"_"+"x".repeat(260)+"_TRAVEL_FLIGHT_PLAN")==null&&NativeIslandCardProtocol.scene(personal,personal+"_key"+(char)10+"_TRAVEL_FLIGHT_PLAN")==null,"flight rejects overlong and control-character identities");
 check(personal.equals(NativeIslandCardProtocol.sourcePackage("flight"))&&NativeIslandCardProtocol.sceneBit("flight")==2048&&!NativeIslandCardProtocol.compactOnly("flight"),"flight has independent capability and original large panel");
 check("cycling".equals(NativeIslandCardProtocol.scene(personal,personal+"_ReturnBike"))&&NativeIslandCardProtocol.scene(personal,personal+"_RETURN_BIKE")==null,"cycling uses SDK key, not database relate key");
 check(NativeIslandCardProtocol.scene("other",personal+"_ReturnBike")==null&&NativeIslandCardProtocol.scene(personal,"ReturnBike")==null&&NativeIslandCardProtocol.scene(personal,personal+"_ReturnBike_other")==null,"cycling requires exact sender and full ID");
 check(personal.equals(NativeIslandCardProtocol.sourcePackage("cycling"))&&NativeIslandCardProtocol.sceneBit("cycling")==1024&&!NativeIslandCardProtocol.compactOnly("cycling"),"cycling keeps separate live capability and original control panel");
 check("nearby_charging".equals(NativeIslandCardProtocol.scene(personal,personal+"_ChargingPowerReminder"))&&"nearby_charging".equals(NativeIslandCardProtocol.scene(personal,personal+"_ChargingReminder")),"charging upstream ID and adapter fallback preserve exact wire identities");
 check(NativeIslandCardProtocol.scene("other",personal+"_ChargingPowerReminder")==null&&NativeIslandCardProtocol.scene(personal,"ChargingPowerReminder")==null&&NativeIslandCardProtocol.scene(personal,personal+"_ChargingPowerReminder_2")==null,"charging rejects foreign sender, raw and unknown dynamic IDs");
 check(personal.equals(NativeIslandCardProtocol.sourcePackage("nearby_charging"))&&NativeIslandCardProtocol.sceneBit("nearby_charging")==512&&!NativeIslandCardProtocol.compactOnly("nearby_charging"),"charging capability is independent and requires original large panel");
 check("calendar_meeting".equals(NativeIslandCardProtocol.scene(personal,personal+"_meeting_17")),"numeric meeting ID accepted");
 check("calendar_meeting".equals(NativeIslandCardProtocol.scene(personal,personal+"_meeting_123-456-789_17")),"original meeting-code ID accepted");
 check(NativeIslandCardProtocol.scene("other",personal+"_meeting_17")==null&&NativeIslandCardProtocol.scene(personal,"meeting_17")==null,"meeting requires exact sender and wire prefix");
 check(NativeIslandCardProtocol.scene(personal,personal+"_meeting_bad")==null&&NativeIslandCardProtocol.scene(personal,personal+"_meeting__17")==null,"malformed meeting database IDs rejected");
 check(personal.equals(NativeIslandCardProtocol.sourcePackage("calendar_meeting"))&&NativeIslandCardProtocol.sceneBit("calendar_meeting")==128&&!NativeIslandCardProtocol.compactOnly("calendar_meeting"),"calendar meeting has independent source capability and original expanded panel");
 check("scenic_guide".equals(NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide_18")),"guide database-only ID accepted");
 check("scenic_guide".equals(NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide_景区_南门_18")),"Unicode scenic names and underscores preserve original ID");
 check(NativeIslandCardProtocol.scene("other",personal+"_electronic_guide_18")==null&&NativeIslandCardProtocol.scene(personal,"electronic_guide_18")==null,"guide sender and wire prefix both required");
 check(NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide__18")==null&&NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide_name_bad")==null,"malformed guide database suffix rejected");
 check(NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide_"+"x".repeat(257)+"_18")==null&&NativeIslandCardProtocol.scene(personal,personal+"_electronic_guide_"+(char)10+"_18")==null,"overlong and control-character guide identifiers rejected");
 check(personal.equals(NativeIslandCardProtocol.sourcePackage("scenic_guide"))&&NativeIslandCardProtocol.sceneBit("scenic_guide")==256&&!NativeIslandCardProtocol.compactOnly("scenic_guide"),"guide has independent live capability and original large panel");
 System.out.println("PASS native card endpoint: "+checks+" checks");}}
 '''
}
with tempfile.TemporaryDirectory(prefix='duo-card-endpoint-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com' / name) for name in
                ['NativeIslandCardEndpoint.java', 'NativeIslandCardProtocol.java']]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.TestCardEndpoint'], check=True)
