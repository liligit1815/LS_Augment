"""Flight stages, shared DefaultCard types and native expiry; fixtures are not real itinerary evidence."""
from pathlib import Path
import importlib.util

spec=importlib.util.spec_from_file_location('cycling_fixture',Path(__file__).with_name('test-native-island-personal-cycling.py'))
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
files=dict(base.files);wrapped=base.wrapped
files.pop('ls/augment/com/hook/TestPersonalCycling.java')
types=['TRAVEL_FLIGHT_PLAN','TRAVEL_FLIGHT_AIRPORT','TRAVEL_CAROUSEL','TRAVEL_FLIGHT_SCENIC_TINY','FLIGHT_BOOK_HOTEL_CARD']
files['com/zte/briefagent/event/cards/CardType.java']=files['com/zte/briefagent/event/cards/CardType.java'].replace('TRAVEL_FLIGHT_PLAN',','.join(types)+',OTHER_DEFAULT')
files['com/zte/briefagent/event/cards/CardContext.java']=files['com/zte/briefagent/event/cards/CardContext.java'].replace('ICard getCard();','ICard getCard();default com.zte.personalagent.database.data.model.entities.Card getCardInfo(){return getCard().getCardEntity();}')
entity='com/zte/personalagent/database/data/model/entities/Card.java'
files[entity]=files[entity].replace('public boolean hidden,expired;', 'public String type="TRAVEL_FLIGHT_PLAN",relate="flight_A";public String getType(){return type;}public String getRelateKey(){return relate;}public boolean hidden,expired;')
files['com/zte/briefagent/event/cards/impl/DefaultCard.java']='''package com.zte.briefagent.event.cards.impl;import com.zte.briefagent.event.cards.*;import com.zte.personalagent.database.data.model.entities.Card;public class DefaultCard implements ICard {public Card info=new Card();public Card getCardEntity(){return info;}public CardType getType(){return CardType.valueOf(info.type);}public DefaultCard(){info.data.put("flightPhase","AFTER_BOOKING");info.data.put("departureTimeMillis",System.currentTimeMillis()+600000L);}}'''
files['com/zte/briefagent/util/AttributeHelper.java']='''package com.zte.briefagent.util;import java.util.*;public class AttributeHelper {public static Object getExtra(Map m,String k,Object fallback){Object value=m==null?null:m.get(k);if(value==null)return fallback;if(fallback instanceof String)return value.toString();if(fallback instanceof Long){if(value instanceof Number)return ((Number)value).longValue();try{return Long.parseLong(value.toString());}catch(Exception e){return 0L;}}return value;}}'''
files['com/zte/briefagent/util/FlightAppLauncher.java']='''package com.zte.briefagent.util;public class FlightAppLauncher {public static boolean launchFlightApp(android.content.Context c){throw new AssertionError("preflight cannot launch another app");}}'''
files['com/zte/briefagent/event/scene/travel/starryisland/FlightStarryIslandCardClickHandler.java']='''package com.zte.briefagent.event.scene.travel.starryisland;public class FlightStarryIslandCardClickHandler {public static void handleCardClick(android.content.Context c,String id,com.zte.personalagent.database.data.model.entities.Card e){}}'''
intent='android/content/Intent.java'
files[intent]=files[intent].replace('public Intent setPackage(String p){return this;}','public String pkg="";public Intent setPackage(String p){pkg=p;return this;}')
files[intent]=files[intent].replace('return p.mini?new ComponentName("com.zte.mifavor.miboard","MiniActivity"):null;', 'if(pkg.equals("vz.com"))return p.flight?new ComponentName(pkg,"FlightActivity"):null;if(pkg.equals("zte.com.market"))return p.store?new ComponentName(pkg,"StoreActivity"):null;return p.mini?new ComponentName("com.zte.mifavor.miboard","MiniActivity"):null;')
pm='android/content/pm/PackageManager.java'
files[pm]=files[pm].replace('public android.content.Intent getLaunchIntentForPackage(String p){return null;}', 'public boolean flight=true,store=true;public ActivityInfo flightInfo=new ActivityInfo(),storeInfo=new ActivityInfo();public android.content.Intent getLaunchIntentForPackage(String p){return flight?new android.content.Intent("native-flight").setPackage(p):null;}')
files[pm]=files[pm].replace('if(missing||', 'if(n.pkg.equals("vz.com"))return flightInfo;if(n.pkg.equals("zte.com.market"))return storeInfo;if(missing||')
files['android/content/res/Resources.java']=files['android/content/res/Resources.java'].replace('n.equals("btn_return_bike")?8:1','n.equals("btn_return_bike")?8:n.equals("btn_flight_detail")?11:1')
adapter='com/zte/briefagent/event/scene/travel/starryisland/FlightStarryIslandAdapter.java'
files[adapter]='''package com.zte.briefagent.event.scene.travel.starryisland;
import android.content.*;import java.util.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.impl.DefaultCard;import com.zte.briefagent.util.AttributeHelper;import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.widget.RemoteViews;
public class FlightStarryIslandAdapter {
public static Context context;public static long shortLifetime=10000;public static boolean suppress;public static int nativePolicyCalls;public static String lastPhase;
public String getCardId(CardContext c){return c.getCardInfo().getRelateKey()+"_"+c.getCardInfo().getType();}
public String getActionForViewId(int v){return "action_flight_card_click";}
private String inferPhaseFromCardType(String t){return t.contains("CAROUSEL")?"AFTER_ARRIVAL":t.contains("PLAN")?"BEFORE_DEPARTURE_24H":t.contains("AIRPORT")?"AT_AIRPORT":"BEFORE_DEPARTURE_DAYS";}
private String phase(CardContext c){String s=(String)AttributeHelper.getExtra(c.getCardInfo().data,"flightPhase","");return s.isEmpty()?inferPhaseFromCardType(c.getCardInfo().type):s;}
private boolean shouldShowStarryIsland(String p){nativePolicyCalls++;return !suppress&&!p.equals("BEFORE_DEPARTURE_DAYS")&&!p.equals("IN_FLIGHT");}
private boolean shouldSkipDisplayFor10SecondPhase(String p,Map data){if(!List.of("AFTER_BOOKING","BEFORE_DEPARTURE_24H","DELAYED","AFTER_ARRIVAL").contains(p)||!p.equals(AttributeHelper.getExtra(data,"lastFlightPhase","")))return false;long previous=(Long)AttributeHelper.getExtra(data,"lastStarryIslandDisplayTime",0L);return previous>0&&System.currentTimeMillis()-previous>=shortLifetime;}
public boolean shouldRemoveCard(CardContext c,long first,long now){String p=(String)AttributeHelper.getExtra(c.getCardInfo().data,"flightPhase","");if(p.equals("AT_AIRPORT")||p.equals("BOARDING")){long departure=(Long)AttributeHelper.getExtra(c.getCardInfo().data,"departureTimeMillis",0L);return departure>0&&now>=departure;}return now-first>shortLifetime;}
'''+wrapped('FlightStarryIslandAdapter','createCardMessage','CardMessage',['CardContext c'],'''String p=phase(c);if(!shouldShowStarryIsland(p)||shouldSkipDisplayFor10SecondPhase(p,c.getCardInfo().data))return null;lastPhase=p;if(p.equals("AFTER_BOOKING"))RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),new Intent("native-flight-detail"),-1,11);return new CardMessage();''')+'}'
renderer='com/zte/briefagent/event/cards/render/StarryIslandCardRender.java'
files[renderer]=files[renderer].replace('public class StarryIslandCardRender','import com.zte.briefagent.event.cards.impl.DefaultCard;import com.zte.briefagent.event.scene.travel.starryisland.FlightStarryIslandAdapter;public class StarryIslandCardRender')
files[renderer]=files[renderer].replace('return c instanceof ReturnBikeCard?', 'return c instanceof DefaultCard?new FlightStarryIslandAdapter().getCardId(()->c):c instanceof ReturnBikeCard?')
files[renderer]=files[renderer].replace('if(c instanceof ReturnBikeCard){','if(c instanceof DefaultCard){FlightStarryIslandAdapter.context=context;FlightStarryIslandAdapter a=new FlightStarryIslandAdapter();if(a.createCardMessage(cc)==null)continue;adapter=a;}else if(c instanceof ReturnBikeCard){')
files[renderer]=files[renderer].replace('if(adapter instanceof ReturnBikeStarryIslandAdapter&&','if(adapter instanceof FlightStarryIslandAdapter&&((FlightStarryIslandAdapter)adapter).shouldRemoveCard(()->card,cardIdToFinishedTimeMap.getOrDefault(id,cardIdToPushTimeMap.get(id)),System.currentTimeMillis())||adapter instanceof ReturnBikeStarryIslandAdapter&&')
files['ls/augment/com/hook/TestPersonalFlight.java']='''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.*;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.event.cards.impl.DefaultCard;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.scene.electronicguide.card.ElectronicGuideCard;import com.zte.briefagent.event.scene.charge.card.ChargingReminderCard;import com.zte.briefagent.event.scene.cycling.card.ReturnBikeCard;import com.zte.briefagent.event.scene.travel.starryisland.FlightStarryIslandAdapter;import com.zte.toolsdk.common.ToolsCapabilityHandler;import com.zte.toolsdk.producer.*;import com.zte.toolsdk.utils.RemoteViewsUtil;
public class TestPersonalFlight {
static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static StarryIslandCardRender start(Context c,CardManager m){new EventProcessor().registerCardRenders(m,c);Handler.flush();return m.renders.isEmpty()?null:(StarryIslandCardRender)m.renders.get(0);}
static void recover(Context c){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION));Handler.flush();}
static ClassLoader missing(String suffix){return new ClassLoader(TestPersonalFlight.class.getClassLoader()){@Override protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException {if(n.endsWith(suffix))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};}
static class ChildFlight extends DefaultCard {}
static String id(DefaultCard c){return c.info.relate+"_"+c.info.type;}
public static void main(String[] args)throws Exception {
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestPersonalFlight.class.getClassLoader());
check(module.errors==0&&AugmentModule.hooks.size()==21,"five optional scenes share inherited channel hook");
Context context=new Context();CardManager manager=new CardManager();StarryIslandCardRender r=start(context,manager);
for(String s:List.of("native","master","calendar_meeting","scenic_guide","nearby_charging","cycling"))FeatureSettings.change(s,true);
ToolsCapabilityHandler.getInstance().parseToolsCapability("native.return.provider");Handler.flush();
MeetingCard meeting=new MeetingCard();ElectronicGuideCard guide=new ElectronicGuideCard();ChargingReminderCard charging=new ChargingReminderCard();ReturnBikeCard bike=new ReturnBikeCard();DefaultCard flight=new ChildFlight();
List<ICard> others=List.of(meeting,guide,charging,bike),all=List.of(meeting,guide,charging,bike,flight);
r.render(all);check(r.selected.equals(others),"flight defaults off");FeatureSettings.change("flight",true);check(r.selected.equals(all),"flight switch reuses genuine pending source data");
check(flight.info.channel==4&&!flight.supportsChannel(8)&&flight.supportsChannel(4),"source channel unchanged outside owned render");
check(FeatureSettings.diagnostics.get("flight_source_capability").startsWith("ready:"),"source capability requires usable original target");
for(String type:List.of("TRAVEL_FLIGHT_PLAN","TRAVEL_FLIGHT_AIRPORT","TRAVEL_CAROUSEL","TRAVEL_FLIGHT_SCENIC_TINY","FLIGHT_BOOK_HOTEL_CARD")){flight.info.type=type;r.render(all);check(r.selected.equals(all),"all five registered native flight types: "+type);}
flight.info.type="OTHER_DEFAULT";r.render(all);check(r.selected.equals(others),"other shared DefaultCards never become flight");flight.info.type="TRAVEL_FLIGHT_PLAN";
DefaultCard second=new DefaultCard();second.info.type="TRAVEL_FLIGHT_AIRPORT";r.render(List.of(flight,second));check(r.cardIdToICardMap.size()==2,"same journey with different card types keeps distinct identities");
RemoteViewsUtil.clicks.clear();r.render(List.of(flight,second));List<Intent> clicks=new ArrayList<>(RemoteViewsUtil.clicks);check(clicks.size()==2&&!clicks.get(0).getStringExtra("cardId").equals(clicks.get(1).getStringExtra("cardId")),"same detail control on two flight cards cannot collide");
new UserTask(context,clicks.get(1).getStringExtra("cardId"),11).execute();check(r.actions==1&&r.lastAction.equals(id(second)),"detail reaches exact second original source card");
second.info.data.put("flightPhase","BOARDING");new UserTask(context,clicks.get(1).getStringExtra("cardId"),11).execute();check(r.actions==1,"stale booking-only detail button cannot run after phase transition");
r.handleCardAction(id(second),-1,0,null);check(r.actions==2,"native launch callback remains available without detail button");
for(String phase:List.of("AFTER_BOOKING","BEFORE_DEPARTURE_24H","AT_AIRPORT","BOARDING","DELAYED","AFTER_ARRIVAL")){
 flight.info.data.put("flightPhase",phase);RemoteViewsUtil.clicks.clear();r.render(List.of(flight));check(r.selected.equals(List.of(flight))&&phase.equals(FlightStarryIslandAdapter.lastPhase),"actual phase reaches native layout: "+phase);check(RemoteViewsUtil.clicks.size()==(phase.equals("AFTER_BOOKING")?1:0),"detail visibility follows native phase: "+phase);
}
for(String phase:List.of("BEFORE_DEPARTURE_DAYS","IN_FLIGHT")){flight.info.data.put("flightPhase",phase);r.render(all);check(r.selected.equals(others),"native no-island phase: "+phase);}
flight.info.data.put("flightPhase","UNKNOWN");r.render(all);check(r.selected.equals(others)&&FeatureSettings.diagnostics.get("ls_augment_native_island_personal_cards").contains("unsupported_flight_phase"),"unknown phases retain original notification/widget behavior with diagnosis");
flight.info.data.remove("flightPhase");flight.info.type="TRAVEL_CAROUSEL";r.render(List.of(flight));check(r.selected.equals(List.of(flight))&&FlightStarryIslandAdapter.lastPhase.equals("AFTER_ARRIVAL"),"missing phase uses actual OEM type inference");
flight.info.type="TRAVEL_FLIGHT_PLAN";flight.info.data.put("flightPhase","AFTER_BOOKING");FlightStarryIslandAdapter.suppress=true;r.render(all);check(r.selected.equals(others),"runtime native display decision respected instead of forced phase table");FlightStarryIslandAdapter.suppress=false;
flight.info.data.put("lastFlightPhase","AFTER_BOOKING");flight.info.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-11000));r.render(all);check(r.selected.equals(others),"native short-stage suppression accepts serialized timestamps");
flight.info.data.put("lastFlightPhase","DELAYED");r.render(all);check(r.selected.equals(all),"different prior phase does not suppress new original event");flight.info.data.remove("lastFlightPhase");flight.info.data.remove("lastStarryIslandDisplayTime");
r.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-2000;r.render(List.of(flight));Long first=r.cardIdToPushTimeMap.get(id(flight));recover(context);check(r.cardIdToPushTimeMap.get(id(flight)).equals(first),"host recovery does not restart short flight reminder");
FeatureSettings.change("flight",false);FeatureSettings.change("flight",true);check(r.cardIdToPushTimeMap.get(id(flight)).equals(first),"selection changes preserve short-stage start");
r.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-11000;r.render(List.of(flight));r.checkAndRemoveExpiredCards();recover(context);check(r.selected.isEmpty(),"expired short-stage cache cannot replay");
StarryIslandCardRender.nextPush=null;r.render(List.of(flight));check(r.selected.equals(List.of(flight)),"fresh upstream update can publish again");
for(String phase:List.of("AT_AIRPORT","BOARDING")){
 r.render(List.of());flight.info.data.put("flightPhase",phase);flight.info.data.put("departureTimeMillis",String.valueOf(System.currentTimeMillis()+60000));StarryIslandCardRender.nextPush=System.currentTimeMillis()-90000;r.render(List.of(flight));recover(context);check(r.selected.equals(List.of(flight)),"airport phase survives short-window threshold: "+phase);
 flight.info.data.put("departureTimeMillis",String.valueOf(System.currentTimeMillis()-1));recover(context);check(r.selected.isEmpty(),"departure deadline removes phase: "+phase);
}
flight.info.data.put("departureTimeMillis",System.currentTimeMillis()+60000L);flight.info.data.put("flightPhase","AFTER_BOOKING");StarryIslandCardRender.nextPush=null;
r.render(all);context.pm.flight=false;recover(context);check(r.selected.equals(all),"original store fallback remains usable without flight app");context.pm.store=false;recover(context);check(r.selected.equals(others)&&FeatureSettings.diagnostics.get("flight_source_capability").contains("missing_flight_launch_target"),"no target prevents ineffective detail support");context.pm.flight=true;recover(context);check(r.selected.equals(all),"restored target recovers current valid source without executing app");
context.pm.flightInfo.permission="native.FLIGHT";context.permission=-1;recover(context);check(r.selected.equals(others),"target permission checked without granting or bypassing");context.pm.flightInfo.permission=null;context.permission=0;context.pm.store=true;
for(int mode=0;mode<3;mode++){
 context.pm.store=false;if(mode==0)context.pm.flightInfo.enabled=false;if(mode==1)context.pm.flightInfo.exported=false;if(mode==2)context.pm.flightInfo.applicationInfo.enabled=false;
 r.render(all);check(r.selected.equals(others),"disabled/nonexported target rejected: "+mode);context.pm.flightInfo.enabled=true;context.pm.flightInfo.exported=true;context.pm.flightInfo.applicationInfo.enabled=true;
}context.pm.store=true;
flight.info.hidden=true;r.render(all);check(r.selected.equals(others),"hidden native flight remains hidden");flight.info.hidden=false;
flight.info.channel=0;r.render(all);check(r.selected.equals(others),"zero travel preparation channel not overridden");flight.info.channel=4;
flight.info.expired=true;r.render(all);check(r.selected.equals(others),"native database expiry respected");flight.info.expired=false;
flight.info.relate="";r.render(List.of(flight));check(r.selected.isEmpty(),"unrecognized wire identity is not fabricated");flight.info.relate="flight_A";
r.render(all);FeatureSettings.change("flight",false);check(r.selected.equals(others),"flight off preserves all four previous scenes");FeatureSettings.change("flight",true);
r.render(others);recover(context);check(r.selected.equals(others),"source-deleted flight cannot reappear");
r.render(all);((Map)r.cardIdToPushTimeMap).put(id(flight),"unknown");r.render(all);Handler.flush();check(r.selected.equals(others)&&FeatureSettings.diagnostics.get("flight_source_capability").contains("flight_runtime_contract"),"unknown flight timestamp disables only flight");manager.cleanup();
for(String resource:List.of("notification_flight_scene_custom","starryisland_flight","btn_flight_detail")){Context c=new Context();c.resources.missing=resource;CardManager m=new CardManager();StarryIslandCardRender old=start(c,m);old.render(all);check(old.selected.equals(others),"missing flight resource preserves earlier paths: "+resource);m.cleanup();}
for(String dependency:List.of("FlightStarryIslandCardClickHandler","FlightAppLauncher","AttributeHelper")){
 AugmentModule.hooks.clear();NativeIslandPersonalCards.install(module,missing(dependency));CardManager m=new CardManager();StarryIslandCardRender old=start(context,m);old.render(all);check(old.selected.equals(others)&&AugmentModule.hooks.size()==20,"missing flight contract preserves earlier sources: "+dependency);m.cleanup();
}
check(module.errors==0,"optional flight contract failures do not break existing hooks");
System.out.println("Personal flight: "+checks+" checks");}}
'''
if __name__=='__main__':
    base.base.guide.base.run_fixture(files,'ls.augment.com.hook.TestPersonalFlight')
    # A newer suppression signature cannot silently receive the older path's semantics.
    changed=dict(files)
    changed[adapter]=changed[adapter].replace('String p,Map data)', 'String p,Map data,Context unused)').replace('shouldSkipDisplayFor10SecondPhase(p,c.getCardInfo().data)', 'shouldSkipDisplayFor10SecondPhase(p,c.getCardInfo().data,context)')
    changed['ls/augment/com/hook/TestPersonalFlight.java']='''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.*;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.event.cards.impl.DefaultCard;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.data.config.EnvironmentConfig;
public class TestPersonalFlight {
public static void main(String[] args){AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestPersonalFlight.class.getClassLoader());
if(module.errors!=0||AugmentModule.hooks.size()!=20)throw new AssertionError("unknown phase contract must not install partial flight hooks");
Context context=new Context();CardManager manager=new CardManager();new EventProcessor().registerCardRenders(manager,context);Handler.flush();
for(String flag:List.of("native","master","calendar_meeting","flight"))FeatureSettings.change(flag,true);
MeetingCard meeting=new MeetingCard();StarryIslandCardRender r=(StarryIslandCardRender)manager.renders.get(0);r.render(List.of(meeting,new DefaultCard()));if(!r.selected.equals(List.of(meeting)))throw new AssertionError("unknown flight contract must preserve previous calendar path");manager.cleanup();
EnvironmentConfig.full=true;CardManager nativeManager=new CardManager();new EventProcessor().registerCardRenders(nativeManager,context);Handler.flush();StarryIslandCardRender original=(StarryIslandCardRender)nativeManager.renders.get(0);DefaultCard flight=new DefaultCard();flight.info.channel=8;original.render(List.of(flight));if(!original.selected.equals(List.of(flight)))throw new AssertionError("original full-capability renderer remains native");
System.out.println("Personal flight unknown contract: 3 checks");}}
'''
    base.base.guide.base.run_fixture(changed,'ls.augment.com.hook.TestPersonalFlight')
