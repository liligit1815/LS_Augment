"""Execute production render/dispatch/lifecycle methods with deterministic OEM view contracts."""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/NativeIslandCards.java').read_text(encoding='utf-8')
def extract(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

tree = ast.parse((ROOT / 'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
base = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign)
                             and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets)))
files = {k: base[k] for k in ['android/os/Handler.java', 'android/os/Looper.java', 'ls/augment/com/ConfigSchema.java',
                            'ls/augment/com/NativeIslandSceneOptions.java', 'ls/augment/com/SystemUiOptions.java']}
files.update({
 'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 1000;}}',
 'android/content/Context.java': '''package android.content;public class Context {public Resources getResources(){return new Resources();}public Object getContentResolver(){return this;}
 public static class Resources {public Metrics getDisplayMetrics(){return new Metrics();}}public static class Metrics {public int heightPixels=2000;}}''',
 'android/provider/Settings.java': 'package android.provider;public class Settings {public static class System {public static int value=1;public static int getInt(Object r,String k,int d){return value;}}}',
 'android/view/View.java': '''package android.view;public class View {public Object parent;public int measured=100;public boolean attached=true;public ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
 public boolean clickable=true,listener=true;public int taps;public String resourcePackage="com.android.dialer",resourceName="call_island_layout";
 public boolean hasOnClickListeners(){return listener;}public boolean performClick(){taps++;return listener;}public int getId(){return 1;}
 public Resources getResources(){return new Resources();}public class Resources {public String getResourcePackageName(int id){return resourcePackage;}public String getResourceEntryName(int id){return resourceName;}}
 public void setOnClickListener(Object v){listener=v!=null;}public void setClickable(boolean b){clickable=b;}public void setLongClickable(boolean b){}
 public Object getParent(){return parent;}public void measure(int w,int h){if(h>0)measured=h;}public int getMeasuredHeight(){return measured;}public boolean isAttachedToWindow(){return attached;}
 public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}
 public static class MeasureSpec {public static final int EXACTLY=1,UNSPECIFIED=0;public static int makeMeasureSpec(int a,int b){return a;}}}''',
 'android/view/ViewGroup.java': '''package android.view;import java.util.*;public class ViewGroup extends View {public java.util.List<View> children=new ArrayList<>();
 public static class LayoutParams {public int height;}public void removeAllViews(){for(View v:children)v.parent=null;children.clear();}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
 public void addView(View v){if(v.parent!=null)throw new IllegalStateException("parent");children.add(v);v.parent=this;}}''',
 'android/view/LayoutInflater.java': '''package android.view;public class LayoutInflater {public static boolean wrong;public static LayoutInflater from(android.content.Context c){return new LayoutInflater();}
 public View inflate(int id,Object root){return wrong?new ViewGroup():new ls.augment.com.hook.TestCardHost.Island();}}''',
 'android/appwidget/AppWidgetHostView.java': 'package android.appwidget;public class AppWidgetHostView extends android.view.ViewGroup {public AppWidgetHostView(android.content.Context c){}}',
 'android/widget/TextView.java': 'package android.widget;public class TextView extends android.view.View {public int getCurrentTextColor(){return -1;}}',
 'ls/augment/com/hook/NativeIslandCardContrast.java': 'package ls.augment.com.hook;class NativeIslandCardContrast {static void apply(android.view.View v,int c){}}',
})
harness = '''package ls.augment.com.hook;import android.content.*;import android.view.*;import android.appwidget.AppWidgetHostView;import android.os.Handler;
import android.os.Looper;import android.os.Process;import android.provider.Settings;import java.lang.reflect.*;import java.util.*;import ls.augment.com.*;
public class TestCardHost {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static TestCardHost selected;static final Handler MAIN=new Handler(Looper.getMainLooper());
 final Context context=new Context();final Manager permanent=new Manager();final View root=new View();final User userIsland=new User();
 final android.widget.TextView foregroundReference=new android.widget.TextView();
 final Map<String,Card> cards=new LinkedHashMap<>();final Map<Object,Card> owned=new IdentityHashMap<>();
 boolean closed,failed,ready,registered=true;int requests,enabledScenes;Card pending;String diagnostic;
 final Set<String> failedScenes=new HashSet<>();
 final Field currentUser;final Class<?> islandType=Island.class,panelType=Island.class;final int islandLayout=1,panelLayout=2,panelWidth=344;
 final Method cardId,sender,small,large,launch,priority,apply,initialize,setPanel,add,remove,show,throttle,click,windowHeight;
 Listener previousListener=new Listener();
 public static class FeatureSettings {static final Map<String,Boolean> flags=new HashMap<>();static boolean enabled(Context c,String k){return flags.getOrDefault(k,false);}static void diagnostic(Context c,String k,String v){}}
 public static class User {public int mCurrentUser;}
 public static class Island extends ViewGroup {public String action;public ViewGroup panel;public int clicks;
 public void initIsland(String p,String id,String a,int type){action=a;}public void setPanelIsland(ViewGroup p){panel=p;}public boolean handleIslandClick(){clicks++;return true;}}
 public static class Remote {View content=new View();boolean fail;public View apply(Context c,ViewGroup parent){if(fail)throw new IllegalStateException("inflate failed");return content;}}
 public static class Message {String id="zte.com.cn.alarmclock_timer_countdown",pkg="zte.com.cn.alarmclock",action="open";Remote compact=new Remote(),expanded=new Remote();int p=2;
 public String getCardId(){return id;}public String getSenderPackage(){return pkg;}public Remote getSmallRemoteViews(){return compact;}
 public Remote getRemoteViews(){return expanded;}public String getLaunchAction(){return action;}public int getDisplayPriority(){return p;}}
 public static class Listener {int calls;public void onCardCreated(Object message){calls++;}public void onCardRemoved(String id){calls++;}}
 public static class Manager {public boolean mIsDynamicIslandEnable=true,mDynamicPanelShowing,mAnimProcessing,mPriorityProcessing,mOnKeyguard,mQsPanelExpanded,mControlPanelExpanded;
 public View mDynamicIslandContainer=new View();public Object current;public int adds,removes,opens,resizes;public boolean limited;
 public Object getPermanentIsland(){return current;}public void addPermanentIslandInner(ViewGroup v){if(mOnKeyguard)return;adds++;current=v;v.parent=this;}
 public void removePermanentIsland(ViewGroup v){removes++;v.parent=null;if(current==v)current=null;}
 public void showPermanentPanelIsland(){opens++;mDynamicPanelShowing=true;}public boolean forceNotClick(){return limited;}
 public void updateDynamicWindowHeightParams(boolean b){resizes++;}}
 static Object field(Object o,String n){try{return o.getClass().getField(n).get(o);}catch(Exception e){return null;}}
 static Object call(Object o,String n)throws Exception{return o.getClass().getMethod(n).invoke(o);}
 void report(String value){diagnostic=value;}void requestSource(){requests++;}
 TestCardHost()throws Exception {currentUser=User.class.getField("mCurrentUser");cardId=Message.class.getMethod("getCardId");sender=Message.class.getMethod("getSenderPackage");
 small=Message.class.getMethod("getSmallRemoteViews");large=Message.class.getMethod("getRemoteViews");launch=Message.class.getMethod("getLaunchAction");priority=Message.class.getMethod("getDisplayPriority");
 apply=Remote.class.getMethod("apply",Context.class,ViewGroup.class);initialize=Island.class.getMethod("initIsland",String.class,String.class,String.class,int.class);
 setPanel=Island.class.getMethod("setPanelIsland",ViewGroup.class);click=Island.class.getMethod("handleIslandClick");
 add=Manager.class.getMethod("addPermanentIslandInner",ViewGroup.class);remove=Manager.class.getMethod("removePermanentIsland",ViewGroup.class);
 show=Manager.class.getMethod("showPermanentPanelIsland");throttle=Manager.class.getMethod("forceNotClick");windowHeight=Manager.class.getMethod("updateDynamicWindowHeightParams",boolean.class);
 selected=this;FeatureSettings.flags.put("native",true);FeatureSettings.flags.put("master",true);FeatureSettings.flags.put("countdown",true);configurationChanged();}
 // PRODUCTION
 public static void main(String[] args)throws Exception {TestCardHost h=new TestCardHost();check(h.ready,"fully selected live host ready");
 Message unknown=new Message();unknown.pkg="other";Method callback=Listener.class.getMethod("onCardCreated",Object.class);h.dispatch(callback,new Object[]{unknown});
 check(h.previousListener.calls==1&&h.cards.isEmpty(),"unverified sender forwarded once, no view created");
 Message first=new Message();h.receive(first);Handler.flush();Card c=h.cards.get(first.id);
 check(c!=null&&h.permanent.adds==1&&c.panelHeight==100&&c.island.children.get(0)==first.compact.content,"real small and large views installed, measured native content");
 Message broken=new Message();broken.expanded.fail=true;try{h.receive(broken);throw new AssertionError();}catch(InvocationTargetException expected){}
 check(c.panel.children.get(0)==first.expanded.content&&c.island.children.get(0)==first.compact.content,"failed update preserves previous complete view tree");
 Message tooTall=new Message();tooTall.expanded.content.measured=2001;try{h.receive(tooTall);throw new AssertionError();}catch(IllegalStateException expected){}
 check(c.panelHeight==100&&h.permanent.adds==1,"invalid measured height cannot partially update host");
 h.handleClick(false);check(h.permanent.opens==1,"tap invokes actual native panel opening");h.handleClick(true);check(((Island)c.island).clicks==1,"hold invokes OEM source launch");
 h.permanent.limited=true;h.handleClick(false);check(h.permanent.opens==1,"native click throttle honored");h.permanent.limited=false;
 Message expired=new Message();expired.p=1;expired.expanded.content.measured=160;h.receive(expired);Handler.flush();
 check(h.permanent.adds==1&&c.panelHeight==160&&h.permanent.resizes==1&&h.permanent.mDynamicIslandContainer.params.height==160,"same card update resizes expanded ordinary window to actual new content");
 h.removeCard(first.id);h.stateChanged();check(h.cards.isEmpty()&&h.owned.isEmpty()&&h.pending==null,"removal retires native view and detached ownership");
 h.permanent.mOnKeyguard=true;h.receive(new Message());Handler.flush();check(!h.handleClick(false)&&h.permanent.current==null,"locked card remains pending and cannot launch/open");h.permanent.mOnKeyguard=false;
 h.stateChanged();check(h.permanent.current!=null&&h.cards.size()==1,"unlock attaches previously received real paused card without requiring another source event");
 FeatureSettings.flags.put("record",true);h.configurationChanged();Message recording=new Message();recording.pkg="cn.zte.recorder";recording.id="cn.zte.recorder_recorder_background";h.receive(recording);Handler.flush();
 FeatureSettings.flags.put("countdown",false);h.configurationChanged();check(h.ready&&!h.supportsScene("countdown")&&h.supportsScene("record")&&h.cards.size()==1&&h.cards.containsKey(recording.id),"clock off removes only clock cards, transcription remains enabled");
 FeatureSettings.flags.put("record",false);h.configurationChanged();check(h.cards.isEmpty()&&!h.supportsScene("record")&&!h.supportsScene("unknown"),"record scene off independently withdraws recorder cards");
 FeatureSettings.flags.put("countdown",true);h.configurationChanged();h.userIsland.mCurrentUser=10;h.configurationChanged();check(!h.ready,"different current user cannot obtain host capability");
 h.userIsland.mCurrentUser=0;h.configurationChanged();h.dispatch(callback,new Object[]{broken});
 FeatureSettings.flags.put("record",true);h.configurationChanged();
 check(!h.failed&&h.ready&&!h.supportsScene("countdown")&&h.supportsScene("record")&&h.cards.isEmpty(),"clock render contract failure retires only clock capability, recorder remains available");
 recording.compact=new Remote();recording.expanded=new Remote();h.receive(recording);Handler.flush();check(h.cards.containsKey(recording.id),"healthy recorder still renders after clock failure");
 TestCardHost second=new TestCardHost();LayoutInflater.wrong=true;try{second.receive(new Message());throw new AssertionError();}catch(IllegalStateException expected){}
 check(second.cards.isEmpty()&&second.owned.isEmpty()&&second.permanent.adds==0,"wrong OEM layout type rejected before ownership or native insertion");
 LayoutInflater.wrong=false;FeatureSettings.flags.put("meeting",true);FeatureSettings.flags.put("ai",true);second.configurationChanged();
 Message meeting=new Message();meeting.pkg="com.zte.nebulatranslation";meeting.id=meeting.pkg+"_transcription";meeting.expanded=null;meeting.p=1;
 second.receive(meeting);Handler.flush();Card compact=second.cards.get(meeting.id);
 check(compact!=null&&compact.panel==null&&compact.panelHeight==0&&second.pending==null,"known transcription compact card does not fabricate or auto-open a panel");
 check(!meeting.compact.content.clickable,"SDK child callback relinquishes touch to actual OEM source action");
 second.handleClick(false);second.handleClick(true);check(((Island)compact.island).clicks==2&&second.permanent.opens==0,"both gestures return through source launch action without panel");
 second.permanent.mDynamicPanelShowing=true;second.stateChanged();check(second.permanent.resizes==0,"compact cards cannot resize window to zero-height panel");
 Message assist=new Message();assist.pkg=meeting.pkg;assist.id=meeting.pkg+"_call";assist.expanded=null;second.receive(assist);
 FeatureSettings.flags.put("meeting",false);second.configurationChanged();check(!second.cards.containsKey(meeting.id)&&second.cards.containsKey(assist.id),"meeting and call assistant scene gates remain independent");
 Message noPanel=new Message();noPanel.expanded=null;try{second.receive(noPanel);throw new AssertionError();}catch(IllegalArgumentException expected){}
 check(!second.cards.containsKey(noPanel.id),"clock still requires its validated large controls");
 FeatureSettings.flags.put("meeting",true);second.configurationChanged();meeting.expanded=new Remote();try{second.receive(meeting);throw new AssertionError();}catch(IllegalArgumentException expected){}
 check(!second.cards.containsKey(meeting.id),"unexpected translation panel shape remains unsupported");
 FeatureSettings.flags.put("transfer",true);second.configurationChanged();Message transfer=new Message();transfer.pkg="com.zte.cn.zteshare";transfer.id=transfer.pkg+"_share_transfer";transfer.action=null;
 second.receive(transfer);Handler.flush();Card transferView=second.cards.get(transfer.id);
 check(transferView!=null&&transferView.panel!=null&&transfer.compact.content.clickable,"transfer retains source controls and accepts original no-launch-action card");
 FeatureSettings.flags.put("nfc_transfer",true);second.configurationChanged();Message nfc=new Message();nfc.pkg="com.zte.multscr";nfc.id=nfc.pkg+"_"+nfc.pkg+".share_transfer";nfc.action=null;
 second.receive(nfc);Handler.flush();Card nfcView=second.cards.get(nfc.id);
 check(nfcView!=null&&nfcView.panel!=null&&nfc.compact.content.clickable,"NFC original controls and full panel remain connected");
 FeatureSettings.flags.put("transfer",false);second.configurationChanged();check(!second.cards.containsKey(transfer.id)&&second.cards.containsKey(assist.id),"transfer switch does not remove AI call card");
 check(second.cards.containsKey(nfc.id),"ordinary transfer switch cannot remove NFC business");
 FeatureSettings.flags.put("nfc_transfer",false);second.configurationChanged();check(!second.cards.containsKey(nfc.id)&&second.cards.containsKey(assist.id),"NFC switch removes only its own card");
 FeatureSettings.flags.put("call",true);second.configurationChanged();Message phone=new Message();phone.pkg="com.android.dialer";phone.id=phone.pkg+"_call_background";phone.expanded=null;phone.action=null;
 second.receive(phone);Handler.flush();Card callCard=second.cards.get(phone.id);check(callCard!=null&&callCard.panel==null&&phone.compact.content.listener,"call compact root retains actual SDK callback, no fake panel");
 second.handleClick(false);second.handleClick(true);check(phone.compact.content.taps==1&&((Island)callCard.island).clicks==0,"tap forwards source callback once, long press has no fabricated launch action");
 Message invalidCall=new Message();invalidCall.pkg=phone.pkg;invalidCall.id=phone.id;invalidCall.expanded=null;invalidCall.action=null;invalidCall.compact.content.resourceName="unknown";
 try{second.receive(invalidCall);throw new AssertionError();}catch(IllegalArgumentException expected){}check(callCard.island.children.get(0)==phone.compact.content,"unknown call action resource cannot replace valid card");
 invalidCall.compact.content.resourceName="call_island_layout";invalidCall.compact.content.listener=false;
 try{second.receive(invalidCall);throw new AssertionError();}catch(IllegalArgumentException expected){}check(callCard.island.children.get(0)==phone.compact.content,"missing original callback rejected before replacement");
 invalidCall.compact.content.listener=true;invalidCall.compact.content.resourcePackage="other";
 try{second.receive(invalidCall);throw new AssertionError();}catch(IllegalArgumentException expected){}check(callCard.island.children.get(0)==phone.compact.content,"foreign package root cannot masquerade as dialer control");
 FeatureSettings.flags.put("call",false);second.configurationChanged();check(!second.cards.containsKey(phone.id)&&second.cards.containsKey(assist.id),"phone selection remains independent of AI call assistance");
 FeatureSettings.flags.put("calendar_meeting",true);second.configurationChanged();Message calendar=new Message();calendar.pkg="com.zte.personalagent";calendar.id=calendar.pkg+"_meeting_17";calendar.action="action_meeting_card_click";
 second.receive(calendar);Handler.flush();Card calendarCard=second.cards.get(calendar.id);check(calendarCard!=null&&calendarCard.panel!=null,"calendar reminder retains native large panel");
 check(calendar.expanded.content.listener,"calendar action buttons retain their SDK callbacks");
 FeatureSettings.flags.put("calendar_meeting",false);second.configurationChanged();check(!second.cards.containsKey(calendar.id)&&second.cards.containsKey(assist.id),"calendar selection does not remove AI call assistance");
 FeatureSettings.flags.put("calendar_meeting",true);FeatureSettings.flags.put("scenic_guide",true);second.configurationChanged();calendar.compact=new Remote();calendar.expanded=new Remote();second.receive(calendar);
 Message guide=new Message();guide.pkg="com.zte.personalagent";guide.id=guide.pkg+"_electronic_guide_Garden_18";guide.action="action_electronic_guide_card_click";
 second.receive(guide);Handler.flush();Card guideCard=second.cards.get(guide.id);
 check(guideCard!=null&&guideCard.panel!=null&&guide.expanded.content.listener,"guide keeps OEM full panel and SDK body callback");
 FeatureSettings.flags.put("scenic_guide",false);second.configurationChanged();check(!second.cards.containsKey(guide.id)&&second.cards.containsKey(calendar.id),"guide off removes no calendar card");
 FeatureSettings.flags.put("scenic_guide",true);second.configurationChanged();guide.compact=new Remote();guide.expanded=new Remote();second.receive(guide);FeatureSettings.flags.put("calendar_meeting",false);second.configurationChanged();check(second.cards.containsKey(guide.id)&&!second.cards.containsKey(calendar.id),"calendar off removes no guide card");
 FeatureSettings.flags.put("nearby_charging",true);second.configurationChanged();Message charging=new Message();charging.pkg="com.zte.personalagent";charging.id=charging.pkg+"_ChargingPowerReminder";charging.action="action_charging_reminder_card_click";
 second.receive(charging);Handler.flush();check(second.cards.containsKey(charging.id)&&second.cards.get(charging.id).panel!=null&&charging.expanded.content.listener,"charging preserves full original panel and button callbacks");
 FeatureSettings.flags.put("nearby_charging",false);second.configurationChanged();check(!second.cards.containsKey(charging.id)&&second.cards.containsKey(guide.id),"charging switch does not withdraw guide");
 FeatureSettings.flags.put("nearby_charging",true);second.configurationChanged();charging.compact=new Remote();charging.expanded=new Remote();second.receive(charging);second.removeCard(charging.id);check(!second.cards.containsKey(charging.id)&&second.cards.containsKey(guide.id),"native charging removal only withdraws original charging identity");
 Message unknownCharging=new Message();unknownCharging.pkg=charging.pkg;unknownCharging.id=charging.id+"_other";check(!second.receive(unknownCharging),"unknown charging identity stays with original listener");
 FeatureSettings.flags.put("cycling",true);second.configurationChanged();Message bike=new Message();bike.pkg="com.zte.personalagent";bike.id=bike.pkg+"_ReturnBike";bike.action="action_card_click";
 second.receive(bike);Handler.flush();check(second.cards.containsKey(bike.id)&&second.cards.get(bike.id).panel!=null&&bike.expanded.content.listener,"cycling keeps original large panel and return callbacks");
 FeatureSettings.flags.put("cycling",false);second.configurationChanged();check(!second.cards.containsKey(bike.id)&&second.cards.containsKey(guide.id),"cycling off preserves other suggestions");
 FeatureSettings.flags.put("cycling",true);second.configurationChanged();bike.compact=new Remote();bike.expanded=new Remote();second.receive(bike);second.removeCard(bike.id);check(!second.cards.containsKey(bike.id)&&second.cards.containsKey(guide.id),"native bike expiration removes only its own card");
 Message invalidBike=new Message();invalidBike.pkg=bike.pkg;invalidBike.id=bike.pkg+"_RETURN_BIKE";check(!second.receive(invalidBike),"database identity is not silently treated as SDK bike card");
 FeatureSettings.flags.put("flight",true);second.configurationChanged();Message flight=new Message();flight.pkg="com.zte.personalagent";flight.id=flight.pkg+"_flight_A_TRAVEL_FLIGHT_AIRPORT";flight.action="action_flight_card_click";
 second.receive(flight);Handler.flush();check(second.cards.containsKey(flight.id)&&second.cards.get(flight.id).panel!=null&&flight.expanded.content.listener,"flight retains native panel and callbacks");
 FeatureSettings.flags.put("flight",false);second.configurationChanged();check(!second.cards.containsKey(flight.id)&&second.cards.containsKey(guide.id),"flight off preserves other suggestions");
 FeatureSettings.flags.put("flight",true);second.configurationChanged();flight.compact=new Remote();flight.expanded=new Remote();second.receive(flight);second.removeCard(flight.id);check(!second.cards.containsKey(flight.id)&&second.cards.containsKey(guide.id),"native flight stage expiry only removes its own identity");
 Message notFlight=new Message();notFlight.pkg=flight.pkg;notFlight.id=flight.pkg+"_flight_A_TRAVEL_PRE_FLIGHT_BATTERY_LOW";check(!second.receive(notFlight),"preflight battery cannot masquerade as flight itinerary");
 FeatureSettings.flags.put("preflight_battery",true);second.configurationChanged();Message battery=new Message();battery.pkg=flight.pkg;battery.id=battery.pkg+"_duo_preflight_battery_"+"a".repeat(64);battery.action="action_card_click";
 second.receive(battery);Handler.flush();check(second.cards.containsKey(battery.id)&&second.cards.get(battery.id).panel!=null&&battery.expanded.content.listener,"typed battery retains native panel and original callbacks");
 FeatureSettings.flags.put("preflight_battery",false);second.configurationChanged();check(!second.cards.containsKey(battery.id)&&second.cards.containsKey(guide.id),"battery off preserves other suggestion cards");
 Message badBattery=new Message();badBattery.pkg=flight.pkg;badBattery.id=battery.id+"x";check(!second.receive(badBattery),"malformed battery wire identity rejected");
 FeatureSettings.flags.put("weather_travel",true);second.configurationChanged();Message weather=new Message();weather.pkg=flight.pkg;weather.id=weather.pkg+"_duo_weather_900";
 second.receive(weather);Handler.flush();check(second.cards.containsKey(weather.id)&&second.cards.get(weather.id).panel!=null&&weather.expanded.content.listener,"weather receives native full panel with button callbacks");
 FeatureSettings.flags.put("weather_travel",false);second.configurationChanged();check(!second.cards.containsKey(weather.id)&&second.cards.containsKey(guide.id),"weather off preserves earlier cards");
 Message badWeather=new Message();badWeather.pkg=flight.pkg;badWeather.id=weather.pkg+"_900";check(!second.receive(badWeather),"untyped numeric personal card cannot become weather");
 TestCardHost geometry=new TestCardHost();Message fixed=new Message();fixed.expanded.content.params.height=221;fixed.expanded.content.measured=137;
 geometry.receive(fixed);Handler.flush();Card sized=geometry.cards.get(fixed.id);
 check(sized.panelHeight==221,"OEM fixed root height preserved instead of measuring only shorter transfer children");
 Message oversized=new Message();oversized.expanded.content.params.height=2001;
 try{geometry.receive(oversized);throw new AssertionError();}catch(IllegalStateException expected){}
 check(sized.panelHeight==221&&sized.panel.children.get(0)==fixed.expanded.content,"oversized declared root rejected without replacing visible card");
 Message wrapping=new Message();wrapping.expanded.content.params.height=-2;wrapping.expanded.content.measured=150;geometry.receive(wrapping);
 check(sized.panelHeight==150,"wrap-content older cards still use actual content height");
 Message noParams=new Message();noParams.expanded.content.params=null;geometry.receive(noParams);
 check(sized.panelHeight==100,"missing root parameters retain intrinsic measurement");
 System.out.println("PASS native card host: "+checks+" checks");}}
'''
harness = harness.replace('// PRODUCTION', '\n'.join(extract(m) for m in [
    'private void dispatch(', 'void configurationChanged(', 'private boolean supportsScene(', 'private boolean sameUser(', 'private boolean receive(',
    'private boolean removeCard(', 'void stateChanged(', 'View panel(', 'private Card current(',
    'private boolean handleClick(', 'private static void clearCompactClicks(', 'private static final class Card ']))
files['ls/augment/com/hook/TestCardHost.java'] = harness
with tempfile.TemporaryDirectory(prefix='duo-card-host-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources.append(str(ROOT / 'android/app/src/main/java/ls/augment/com/NativeIslandCardProtocol.java'))
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestCardHost'], check=True)
