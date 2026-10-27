"""Modern flight action/lifecycle contract regression. Not a live-flight or Android UI test.

The SDK, Android targets and OEM renderer are fixtures. Actual extracted OEM phase bodies
are exercised separately by test-native-island-flight-oem-policy.py.
"""
from pathlib import Path
import importlib.util

spec = importlib.util.spec_from_file_location('weather_fixture', Path(__file__).with_name('test-native-island-personal-weather.py'))
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
files = {k: v for k, v in base.files.items() if not k.startswith('ls/augment/com/hook/TestPersonal')}
wrapped = base.wrapped


def change(path, old, new):
    assert old in files[path], (path, old)
    files[path] = files[path].replace(old, new)


change('android/content/Intent.java', 'public String getPackage(){return "";}', 'public String getPackage(){return pkg;}')
change('android/content/Intent.java', 'public Intent setClassName(String p,String c){return this;}public Intent setComponent(ComponentName c){return this;}',
       'public ComponentName component;public Intent setClassName(String p,String c){component=new ComponentName(p,c);return this;}public Intent setComponent(ComponentName c){component=c;return this;}')
change('android/content/Intent.java', 'public ComponentName resolveActivity(android.content.pm.PackageManager p){',
       '''public ComponentName resolveActivity(android.content.pm.PackageManager p){
if(component!=null){try{p.getActivityInfo(component,0);return component;}catch(Exception e){return null;}}
if(pkg.equals("cn.nubia.neostore"))return p.neoStore?new ComponentName(pkg,"StoreActivity"):null;
if(pkg.equals("com.sdu.didi.psnger"))return p.didi?new ComponentName(pkg,"DidiActivity"):null;
if(pkg.equals("com.tencent.mm"))return p.wechat?new ComponentName(pkg,"WechatActivity"):null;''')
change('android/content/pm/PackageManager.java', 'public class PackageManager {', '''public class PackageManager {
public boolean neoStore=true,didi,web=true,navigation=true,finger=true;
public ActivityInfo internalInfo=new ActivityInfo(),didiInfo=new ActivityInfo(),fingerInfo=new ActivityInfo();''')
change('android/content/pm/PackageManager.java', 'return flight?new android.content.Intent("native-flight").setPackage(p):null;',
       'return (p.equals("vz.com")&&flight||p.equals("com.tencent.mm")&&wechat||p.equals("com.sdu.didi.psnger")&&didi)?new android.content.Intent("native-home").setPackage(p):null;')
change('android/content/pm/PackageManager.java', 'public ActivityInfo getActivityInfo(android.content.ComponentName n,int f){', '''public ActivityInfo getActivityInfo(android.content.ComponentName n,int f){
if(n.pkg.equals("com.zte.personalagent")){if(n.name.endsWith("CloudPushProviderWebActivity")&&!web||n.name.endsWith("FlightNavigationActionActivity")&&!navigation)throw new IllegalStateException("missing internal");return internalInfo;}
if(n.pkg.equals("com.zte.fingerflashpay")){if(!finger)throw new IllegalStateException("missing finger");return fingerInfo;}
if(n.pkg.equals("com.sdu.didi.psnger")){if(!didi)throw new IllegalStateException("missing didi");return didiInfo;}
if(n.pkg.equals("cn.nubia.neostore")){if(!neoStore)throw new IllegalStateException("missing store");return storeInfo;}''')
change('android/content/res/Resources.java', 'n.equals("btn_more_options")?31:',
       'n.equals("tv_flight_big_action_button")?41:n.equals("ll_flight_big_card_content_area")?42:n.equals("iv_flight_big_logo")?43:n.equals("btn_more_options")?31:')

files['com/zte/briefagent/event/scene/travel/task/TravelFlightIgnoreManager.java'] = '''package com.zte.briefagent.event.scene.travel.task;
import java.util.*;import android.content.Context;public class TravelFlightIgnoreManager {
public static Set<String> ignored=new HashSet<>();public static String resolveStateKey(Map m){return String.valueOf(m.get("flightPhase"));}
public static boolean isIgnored(Context c,String key,String state){return ignored.contains(key+"_"+state);}}'''
files['com/zte/briefagent/event/scene/travel/starryisland/FlightIslandBigCardBuilder.java'] = '''package com.zte.briefagent.event.scene.travel.starryisland;
import java.util.*;import android.content.Context;public class FlightIslandBigCardBuilder {
public static class Content {public int actionTextResId;public String action,navigationDest,taxiAddress;}
public static Content build(Context c,Map data,String phase){Content v=new Content();v.actionTextResId=1;
if(phase.equals("BEFORE_DEPARTURE_3H")){v.action="action_flight_navigation_click";v.navigationDest=(String)data.getOrDefault("fromStation","");}
else if(phase.equals("AFTER_BOOKING")||phase.equals("AFTER_ARRIVAL")){v.action="action_flight_take_taxi_click";v.taxiAddress=phase.equals("AFTER_ARRIVAL")?"":(String)data.getOrDefault("fromStation","");}
else if(phase.equals("REFUNDED"))v.action="action_flight_booking_click";else v.actionTextResId=0;
if(data.containsKey("unknownAction"))v.action=(String)data.get("unknownAction");return v;}}'''
files['com/zte/toolsdk/producer/RemoteViewsHelper.java'] = '''package com.zte.toolsdk.producer;
import android.content.*;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.widget.RemoteViews;
public class RemoteViewsHelper {final Context context;public RemoteViewsHelper(Context c){context=c;}
public void setOnClickListener(int view){RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),new Intent("native-sdk"),-1,view);}}'''
files['com/zte/briefagent/util/AppLauncher.java'] = '''package com.zte.briefagent.util;
import android.content.*;public class AppLauncher {public static String storePackage="cn.nubia.neostore";
public static boolean launchFlightAppWithJumpUrl(Context c,String a,String b,String d){return true;}public static boolean launchFlightApp(Context c){return true;}
public static boolean isAppInstalled(Context c,String p){return p.equals("vz.com")?c.pm.flight:p.equals("com.tencent.mm")?c.pm.wechat:p.equals("com.sdu.didi.psnger")&&c.pm.didi;}
public static Intent createAppStoreIntent(String p){return new Intent().setPackage(storePackage);}
public static boolean isWebUrl(String s){return s!=null&&(s.startsWith("https://")||s.startsWith("http://"));}}'''
for name in ['CloudPushProviderWebActivity', 'FlightNavigationActionActivity']:
    files[f'com/zte/briefagent/activity/{name}.java'] = f'package com.zte.briefagent.activity;public class {name} extends android.app.Activity {{}}'
files['com/zte/briefagent/event/cards/starryisland/StarryIslandActionHelper.java'] = '''package com.zte.briefagent.event.cards.starryisland;
import java.util.*;import android.content.Context;import com.zte.personalagent.database.data.model.entities.Card;
public class StarryIslandActionHelper {public static int calls;public static Card card;public static String id,operation;public static Map params;
public static void handleAction(Context c,String raw,int view,String actual,String op,Map data,Card source){calls++;card=source;id=actual;operation=op;params=new HashMap(data);}}'''
files['com/zte/briefagent/event/scene/travel/starryisland/FlightStarryIslandCardClickHandler.java'] = '''package com.zte.briefagent.event.scene.travel.starryisland;
import java.util.*;import android.content.Context;import com.zte.personalagent.database.data.model.entities.Card;public class FlightStarryIslandCardClickHandler {
public static void handleCardClick(Context c,String id,Card card){}public static void handleCardClick(Context c,String id,Card card,String jump,String wx,String web){}
public static void handleBookingClick(Context c,String id,Card card){}public static void handleNavigationClick(Context c,String id,Card card,Map p){}public static void handleTakeTaxiClick(Context c,String id,Card card,Map p){}}'''

adapter = 'com/zte/briefagent/event/scene/travel/starryisland/FlightStarryIslandAdapter.java'
files[adapter] = '''package com.zte.briefagent.event.scene.travel.starryisland;
import java.util.*;import android.content.*;import com.zte.briefagent.event.cards.*;import com.zte.toolsdk.producer.RemoteViewsHelper;import com.zte.toolsdk.common.CardMessage;
public class FlightStarryIslandAdapter {public static Context context;public int builds,stops,nativeButtons,nativeNights;public Map<String,Map> lastBuilt=new HashMap<>();
public String getCardId(CardContext c){return c.getCardInfo().relate+"_"+c.getCardInfo().type;}
public String getActionForViewId(int v){return "action_flight_navigation_click";}
private String inferPhaseFromCardType(String type){return "BOARDING";}
private boolean shouldShowStarryIsland(String phase){return !phase.equals("IN_FLIGHT")&&!phase.equals("BEFORE_DEPARTURE_DAYS");}
private boolean shouldSkipDisplayFor10SecondPhase(String phase,Map values,Context c){Object time=values.get("lastStarryIslandDisplayTime");if(phase.equals("AFTER_BOOKING")&&time instanceof Number&&System.currentTimeMillis()-((Number)time).longValue()>10000)return true;values.put("policyProbe",true);return false;}
private boolean isPersistentIsland(String phase,Map values){return phase.equals("BOARDING")||phase.equals("BEFORE_DEPARTURE_3H")||phase.equals("AFTER_ARRIVAL");}
private boolean isAlertDisplayDurationReached(Map values,long now){return false;}
public boolean shouldRemoveCard(CardContext c,long first,long now){return c.getCardInfo().expired||c.getCardInfo().data.containsKey("expireFixture")||c.getCardInfo().data.getOrDefault("flightPhase","").equals("AFTER_BOOKING")&&now-first>10000;}
public void removeNightObserver(){stops++;}
''' + wrapped('FlightStarryIslandAdapter', 'setBigCardActionButtonClick', 'void', ['Context c', 'RemoteViewsHelper helper', 'String op', 'String id', 'String dest', 'String taxi'], 'nativeButtons++;') + wrapped(
    'FlightStarryIslandAdapter', 'lambda$startNightObserver$0', 'void', ['String phase', 'Context c', 'Map data', 'String id', 'int style', 'int[] updates', 'String action', 'Intent intent', 'boolean dark'], 'nativeNights++;') + wrapped(
    'FlightStarryIslandAdapter', 'createCardMessage', 'CardMessage', ['CardContext c'], '''builds++;Map values=c.getCardInfo().data;String phase=String.valueOf(values.getOrDefault("flightPhase","BOARDING"));String id=getCardId(c);
lastBuilt.put(id,new HashMap(values));FlightIslandBigCardBuilder.Content button=FlightIslandBigCardBuilder.build(context,values,phase);RemoteViewsHelper helper=new RemoteViewsHelper(context);
if(button.actionTextResId!=0)setBigCardActionButtonClick(context,helper,button.action,id,button.navigationDest,button.taxiAddress);
helper.setOnClickListener(42);return new CardMessage();''') + '}'

renderer = 'com/zte/briefagent/event/cards/render/StarryIslandCardRender.java'
change(renderer, 'public final Context context;', 'public final Map<String,Object> cardDataHashes=new HashMap<>();public final FlightStarryIslandAdapter sharedFlight=new FlightStarryIslandAdapter();public int periodicCalls;public final Context context;')
change(renderer, 'FlightStarryIslandAdapter a=new FlightStarryIslandAdapter();if(a.createCardMessage(cc)==null)', 'FlightStarryIslandAdapter a=sharedFlight;if(a.createCardMessage(cc)==null)')
change(renderer, 'ids.add(id);visible.add(c);', 'cardDataHashes.put(id,new Object());ids.add(id);visible.add(c);')
files[renderer] = files[renderer][:-1] + wrapped('StarryIslandCardRender', 'checkAndForceRefreshPersistentCards', 'void', [], '''periodicCalls++;
for(String id:new ArrayList<>(cardIdToICardMap.keySet())){ICard c=cardIdToICardMap.get(id);Object a=cardIdToAdapterMap.get(id);
if(a instanceof FlightStarryIslandAdapter){((FlightStarryIslandAdapter)a).createCardMessage(()->c);cardIdToPushTimeMap.put(id,System.currentTimeMillis());}}
''') + '}'

files['ls/augment/com/hook/TestPersonalModernFlight.java'] = '''package ls.augment.com.hook;
import java.util.*;import android.content.*;import android.os.Handler;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.impl.*;import com.zte.briefagent.event.cards.render.*;
import com.zte.briefagent.event.scene.travel.starryisland.*;import com.zte.briefagent.event.scene.travel.task.TravelFlightIgnoreManager;import com.zte.briefagent.event.cards.starryisland.StarryIslandActionHelper;
import com.zte.briefagent.data.config.EnvironmentConfig;import com.zte.briefagent.util.AppLauncher;import com.zte.toolsdk.producer.*;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.widget.util.NavigateUtil;
public class TestPersonalModernFlight {
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
static StarryIslandCardRender start(Context c,CardManager m){new EventProcessor().registerCardRenders(m,c);Handler.flush();return (StarryIslandCardRender)m.renders.get(0);}
static class ChildFlight extends DefaultCard {}
public static class ChildAdapter extends FlightStarryIslandAdapter {}
static class ChildTask extends UserTask {ChildTask(Context c,String id,int view){super(c,id,view);}}
static DefaultCard card(String key,String phase){DefaultCard c=new ChildFlight();c.info.type="TRAVEL_FLIGHT_AIRPORT";c.info.relate=key;c.info.data.put("flightPhase",phase);c.info.data.put("fromStation",key+"机场机场");return c;}
static String id(DefaultCard c){return c.info.relate+"_"+c.info.type;}
static String token(int index){return RemoteViewsUtil.clicks.get(index).getStringExtra("cardId");}
static void night(FlightStarryIslandAdapter a,Context c){a.lambda$startNightObserver$0("stale",c,Map.of("fromStation","old"),"old",2,new int[0],"old",new Intent("old"),true);}
public static void main(String[] args)throws Exception {
ClassLoader loader=TestPersonalModernFlight.class.getClassLoader();AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,loader);check(module.errors==0,"complete modern contracts install");
NativeIslandPersonalScene scene=new NativeIslandPersonalScene(loader,"flight");check(scene.flight.modern!=null,"modern adapter selected by signatures");
check(new NativeIslandPersonalFlight(loader,ChildAdapter.class,com.zte.personalagent.database.data.model.entities.Card.class).modern!=null,"inherited modern methods and synthetic callback supported");
Context c=new Context();EnvironmentConfig.full=true;CardManager nativeManager=new CardManager();StarryIslandCardRender nativeRenderer=start(c,nativeManager);
DefaultCard nativeCard=card("Native","BEFORE_DEPARTURE_3H");nativeCard.info.channel=8;nativeRenderer.render(List.of(nativeCard));night(nativeRenderer.sharedFlight,c);nativeRenderer.checkAndForceRefreshPersistentCards();
check(nativeRenderer.sharedFlight.nativeButtons==2&&nativeRenderer.sharedFlight.nativeNights==1&&nativeRenderer.periodicCalls==1,"full native renderer buttons theme and periodic calls unchanged");
EnvironmentConfig.full=false;CardManager manager=new CardManager();StarryIslandCardRender r=start(c,manager);
for(String key:List.of("native","master","flight"))FeatureSettings.change(key,true);
DefaultCard a=card("Airport A","BEFORE_DEPARTURE_3H"),b=card("Airport B","AFTER_BOOKING");
RemoteViewsUtil.clicks.clear();r.render(List.of(a,b));
check(r.selected.equals(List.of(a,b))&&r.sharedFlight.nativeButtons==0,"modern flight uses original layouts with scoped SDK buttons");
check(RemoteViewsUtil.clicks.size()==4&&!token(0).equals(token(2)),"two cards keep distinct button identity");
check(!a.info.data.containsKey("policyProbe")&&!b.info.data.containsKey("policyProbe"),"phase preflight does not mutate source or start clock");
String nav=token(0),body=token(1),taxi=token(2);int nativeActions=StarryIslandActionHelper.calls;
r.handleCardAction(id(a),-1,41,null);check(NavigateUtil.calls==0,"raw ID cannot bypass modern button ticket identity");
new ChildTask(c,nav,41).execute();check(NavigateUtil.calls==1&&NavigateUtil.command.equals("extract_address_navi_by_drive")&&NavigateUtil.address.equals("Airport A机场"),"navigation fallback uses latest source and one airport suffix");
new UserTask(c,taxi,41).execute();check(NavigateUtil.calls==2&&NavigateUtil.command.equals("extract_address_navi_take_taxi")&&NavigateUtil.address.equals("Airport B机场机场"),"booking taxi uses OEM builder action rather than generic navigation lookup");
new UserTask(c,body,42).execute();check(StarryIslandActionHelper.calls==nativeActions+1&&StarryIslandActionHelper.card==a.info&&StarryIslandActionHelper.id.equals(id(a)),"body delegates with exact current entity through seven-argument OEM helper");
a.info.data.put("fromStation","Changed机场");new UserTask(c,nav,41).execute();check(NavigateUtil.calls==2,"stale destination ticket rejected");
b.info.data.put("flightPhase","REFUNDED");new UserTask(c,taxi,41).execute();check(StarryIslandActionHelper.calls==nativeActions+1,"stale phase/action ticket rejected");
Handler.flush();RemoteViewsUtil.clicks.clear();r.render(List.of(a,b));String book=token(2);new UserTask(c,book,41).execute();
check(StarryIslandActionHelper.operation.equals("action_flight_booking_click")&&StarryIslandActionHelper.card==b.info,"refund button opens original booking action for second card");
Handler.flush();b.info.data.put("flightPhase","AFTER_ARRIVAL");RemoteViewsUtil.clicks.clear();r.render(List.of(a,b));new UserTask(c,token(2),41).execute();check(NavigateUtil.address.equals(""),"arrival taxi keeps OEM empty destination semantics");Handler.flush();
c.pm.voice=true;RemoteViewsUtil.clicks.clear();r.render(List.of(a));String nativeNav=token(0);new UserTask(c,nativeNav,41).execute();
check(StarryIslandActionHelper.operation.equals("action_flight_navigation_click")&&StarryIslandActionHelper.params.get("dest").equals("Changed"),"available original voice navigation uses native helper");Handler.flush();
r.handleCardAction(id(a),-1,0,null);check(StarryIslandActionHelper.operation.equals("action_flight_card_click"),"raw native launch callback remains available");Handler.flush();
c.pm.voice=false;c.pm.didi=true;RemoteViewsUtil.clicks.clear();r.render(List.of(b));new UserTask(c,token(0),41).execute();check(StarryIslandActionHelper.operation.equals("action_flight_take_taxi_click")&&StarryIslandActionHelper.card==b.info,"installed accessible taxi app uses OEM helper");Handler.flush();c.pm.didi=false;
RemoteViewsUtil.clicks.clear();r.render(List.of(a));String current=token(0);c.pm.amapRoute=false;c.pm.store=false;int calls=NavigateUtil.calls;new UserTask(c,current,41).execute();check(NavigateUtil.calls==calls,"lost target blocks queued navigation immediately");c.pm.amapRoute=true;c.pm.store=true;
RemoteViewsUtil.clicks.clear();r.render(List.of(a));String disabled=token(0);FeatureSettings.change("flight",false);Handler.flush();new UserTask(c,disabled,41).execute();check(r.selected.isEmpty()&&NavigateUtil.calls==calls,"disabled scene removes cards and rejects queued action");FeatureSettings.change("flight",true);Handler.flush();new UserTask(c,disabled,41).execute();check(NavigateUtil.calls==calls,"reenable does not revive old tickets");
// Original cached adapter observes one theme callback; all its active cards must rebuild.
a.info.data.put("flightPhase","BOARDING");b.info.data.put("flightPhase","BOARDING");r.render(List.of(a,b));r.cardDataHashes.put("foreign",new Object());int builds=r.sharedFlight.builds;
night(r.sharedFlight,c);check(!r.cardDataHashes.containsKey(id(a))&&!r.cardDataHashes.containsKey(id(b))&&r.cardDataHashes.containsKey("foreign"),"theme invalidates only all active cards of the cached adapter");
a.info.data.put("fromStation","Fresh after callback");Handler.flush();check(r.sharedFlight.builds==builds+2&&r.sharedFlight.lastBuilt.get(id(a)).get("fromStation").equals("Fresh after callback")&&r.sharedFlight.nativeNights==0,"theme rebuild uses latest data and owned renderer");
long first=System.currentTimeMillis()-5000;r.cardIdToPushTimeMap.put(id(a),first);r.cardIdToPushTimeMap.put(id(b),first);RemoteViewsUtil.clicks.clear();r.render(List.of(a,b));String oldBody=token(0);
r.checkAndForceRefreshPersistentCards();check(r.periodicCalls==1&&r.cardIdToPushTimeMap.get(id(a))==first&&r.cardIdToPushTimeMap.get(id(b))==first,"periodic refresh preserves original display deadlines");
int actions=StarryIslandActionHelper.calls;new UserTask(c,oldBody,42).execute();check(StarryIslandActionHelper.calls==actions,"periodic refresh retires replaced button tickets");
a.info.hidden=true;r.checkAndForceRefreshPersistentCards();check(!r.cardIdToICardMap.containsKey(id(a))&&r.cardIdToICardMap.containsKey(id(b)),"periodic refresh removes hidden source and retains other card");a.info.hidden=false;
TravelFlightIgnoreManager.ignored.add(b.info.relate+"_BOARDING");r.checkAndForceRefreshPersistentCards();check(r.cardIdToICardMap.containsKey(id(a))&&!r.cardIdToICardMap.containsKey(id(b)),"periodic refresh honors native per-state ignore");TravelFlightIgnoreManager.ignored.clear();
a.info.data.put("expireFixture",true);r.checkAndRemoveExpiredCards();r.checkAndForceRefreshPersistentCards();check(!r.cardIdToICardMap.containsKey(id(a)),"expired native display is not revived by periodic recovery");a.info.data.remove("expireFixture");
r.render(List.of(a));FlightStarryIslandAdapter retired=r.sharedFlight;int stopped=retired.stops;r.render(List.of());check(retired.stops>stopped,"last card removal stops cached theme observer");builds=retired.builds;night(retired,c);Handler.flush();check(retired.builds==builds&&retired.nativeNights==0,"removed adapter cannot republish stale captured card");
r.render(List.of(a));stopped=retired.stops;manager.cleanup();check(retired.stops>stopped,"service cleanup stops remaining observer");night(retired,c);r.checkAndForceRefreshPersistentCards();Handler.flush();check(r.selected.isEmpty(),"late theme and periodic callbacks after cleanup are inert");
FlightStarryIslandAdapter foreign=new FlightStarryIslandAdapter();night(foreign,c);check(foreign.nativeNights==1,"unowned adapter retains native theme callback");
// Target checks follow the original launch order and never launch during detection.
NativeIslandPersonalFlightModern modern=scene.flight.modern;DefaultCard detail=card("Detail","BOARDING");c.pm.flight=false;c.pm.store=false;c.pm.neoStore=false;c.pm.wechat=false;c.pm.web=true;
detail.info.data.put("webURL","https://example.invalid/flight");check(modern.valid(c,detail.info),"actual web URL supports native web fallback without flight app");
detail.info.data.put("webURL","javascript:noop");check(!modern.valid(c,detail.info),"non-web URL and missing app targets rejected");
detail.info.data.put("webURL","https://example.invalid/flight");c.pm.internalInfo.enabled=false;check(!modern.valid(c,detail.info),"disabled internal activity rejected");c.pm.internalInfo.enabled=true;c.pm.internalInfo.exported=false;check(modern.valid(c,detail.info),"same-app activity need not be exported");
c.pm.web=false;c.pm.wechat=true;c.pm.finger=false;detail.info.data.put("wxappURL","wx-native");check(modern.valid(c,detail.info),"WeChat home fallback matches original launcher when mini-program target is absent");c.pm.wechatInfo.exported=false;check(!modern.valid(c,detail.info),"inaccessible WeChat component rejected");c.pm.wechatInfo.exported=true;
c.pm.wechat=false;c.pm.neoStore=true;check(modern.valid(c,detail.info),"actual NeoStore branch accepted");AppLauncher.storePackage="zte.com.market";c.pm.neoStore=false;c.pm.store=true;check(modern.valid(c,detail.info),"legacy native store branch retained");AppLauncher.storePackage="unknown.store";check(!modern.valid(c,detail.info),"unknown store implementation not guessed");AppLauncher.storePackage="cn.nubia.neostore";c.pm.flight=true;
detail.info.data.put("flightPhase","BEFORE_DEPARTURE_3H");detail.info.data.put("fromStation","机场");check(modern.action(c,detail.info,41)==null,"empty airport base has no invented navigation target");
detail.info.data.put("fromStation","Valid");detail.info.data.put("unknownAction","unrecognized");try{modern.action(c,detail.info,41);throw new AssertionError();}catch(IllegalStateException expected){check(true,"unknown builder action fails closed");}detail.info.data.remove("unknownAction");
check(modern.action(c,detail.info,999)==null,"unknown view does not become a flight action");
Context missingResource=new Context();missingResource.resources.missing="tv_flight_big_action_button";try{scene.validateResources(missingResource);throw new AssertionError();}catch(IllegalStateException expected){check(true,"missing modern button resource rejected before enabling");}
for(String missing:List.of("FlightIslandBigCardBuilder$Content","RemoteViewsHelper","StarryIslandActionHelper","AppLauncher","FlightNavigationActionActivity")){
ClassLoader limited=new ClassLoader(loader){@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {if(n.endsWith(missing))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
try{new NativeIslandPersonalScene(limited,"flight");throw new AssertionError(missing);}catch(ClassNotFoundException expected){check(true,"missing modern capability rejected: "+missing);}}
System.out.println("Personal modern flight: "+checks+" checks");}}
'''

if __name__ == '__main__':
    base.base.base.base.base.guide.base.run_fixture(files, 'ls.augment.com.hook.TestPersonalModernFlight')
    unknown = dict(files)
    unknown.pop('ls/augment/com/hook/TestPersonalModernFlight.java')
    builder = 'com/zte/briefagent/event/scene/travel/starryisland/FlightIslandBigCardBuilder.java'
    unknown[builder] = unknown[builder].replace('public int actionTextResId;', 'public long actionTextResId;')
    unknown['ls/augment/com/hook/TestUnknownModernFlight.java'] = '''package ls.augment.com.hook;
import java.util.*;import android.content.Context;import android.os.Handler;import com.zte.briefagent.event.EventProcessor;
import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.StarryIslandCardRender;
import com.zte.briefagent.event.cards.impl.DefaultCard;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;
public class TestUnknownModernFlight {public static void main(String[] args)throws Exception {
ClassLoader loader=TestUnknownModernFlight.class.getClassLoader();try{new NativeIslandPersonalScene(loader,"flight");throw new AssertionError();}catch(NoSuchFieldException expected){}
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,loader);if(module.errors!=0||AugmentModule.hooks.keySet().stream().anyMatch(m->m.getDeclaringClass().getSimpleName().equals("FlightStarryIslandAdapter")))throw new AssertionError("partial modern hooks");
Context c=new Context();CardManager manager=new CardManager();new EventProcessor().registerCardRenders(manager,c);Handler.flush();for(String s:List.of("native","master","flight","calendar_meeting"))FeatureSettings.change(s,true);
StarryIslandCardRender r=(StarryIslandCardRender)manager.renders.get(0);MeetingCard meeting=new MeetingCard();r.render(List.of(meeting,new DefaultCard()));if(!r.selected.equals(List.of(meeting)))throw new AssertionError("unrelated scene lost");
System.out.println("Personal modern flight unknown contract: 3 checks");}}
'''
    base.base.base.base.base.guide.base.run_fixture(unknown, 'ls.augment.com.hook.TestUnknownModernFlight')
