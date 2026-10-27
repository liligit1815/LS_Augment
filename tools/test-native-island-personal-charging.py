"""Charging source contracts and lifecycle; synthetic fixtures are not phone business evidence."""
from pathlib import Path
import importlib.util

spec=importlib.util.spec_from_file_location('guide_fixture',Path(__file__).with_name('test-native-island-personal-guide.py'))
guide=importlib.util.module_from_spec(spec);spec.loader.exec_module(guide)
files=dict(guide.files);wrapped=guide.wrapped
files.pop('ls/augment/com/hook/TestPersonalGuide.java')
files['com/zte/briefagent/event/cards/CardType.java']=files['com/zte/briefagent/event/cards/CardType.java'].replace('MEETING_CARD,','CHARGING_REMINDER,MEETING_CARD,')
files['com/zte/briefagent/event/scene/charge/card/ChargingReminderCard.java']='''package com.zte.briefagent.event.scene.charge.card;import com.zte.briefagent.event.cards.*;import com.zte.personalagent.database.data.model.entities.Card;public class ChargingReminderCard implements ICard {public Card info=new Card();public String id="ChargingPowerReminder";public CardType type=CardType.CHARGING_REMINDER;public CardType getType(){return type;}public Card getCardEntity(){return info;}}'''
files['com/zte/briefagent/util/WeChatMiniprogramLauncher.java']='''package com.zte.briefagent.util;public class WeChatMiniprogramLauncher {public static boolean launchMonsterChargingMiniprogram(android.content.Context c){return true;}}'''
files['com/zte/briefagent/event/scene/charge/starryisland/ChargingReminderStarryIslandCardClickHandler.java']='''package com.zte.briefagent.event.scene.charge.starryisland;public class ChargingReminderStarryIslandCardClickHandler {public boolean handleAction(android.content.Context c,String action,com.zte.briefagent.event.cards.CardContext cc){return com.zte.briefagent.util.WeChatMiniprogramLauncher.launchMonsterChargingMiniprogram(c);}}'''
files['com/zte/briefagent/event/scene/charge/starryisland/ChargingReminderStarryIslandAdapter.java']='''package com.zte.briefagent.event.scene.charge.starryisland;import android.content.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.scene.charge.card.ChargingReminderCard;import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.widget.RemoteViews;
public class ChargingReminderStarryIslandAdapter {public static Context context;public String getCardId(CardContext c){return ((ChargingReminderCard)c.getCard()).id;}public String getActionForViewId(int n){return n==5?"action_nearby_charging":n==6||n==7?"action_charging_reminder_card_click":null;}public boolean shouldRemoveCard(CardContext c,long first,long now){return false;}
'''+wrapped('ChargingReminderStarryIslandAdapter','createCardMessage','CardMessage',['CardContext c'],'''Intent i=new Intent("native-charging");for(int n=5;n<=7;n++)RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),i,-1,n);return new CardMessage();''')+'}'
renderer='com/zte/briefagent/event/cards/render/StarryIslandCardRender.java'
files[renderer]=files[renderer].replace('public class StarryIslandCardRender','import com.zte.briefagent.event.scene.charge.card.ChargingReminderCard;import com.zte.briefagent.event.scene.charge.starryisland.ChargingReminderStarryIslandAdapter;public class StarryIslandCardRender')
files[renderer]=files[renderer].replace('return c instanceof ElectronicGuideCard?', 'return c instanceof ChargingReminderCard?((ChargingReminderCard)c).id:c instanceof ElectronicGuideCard?')
files[renderer]=files[renderer].replace('if(c instanceof ElectronicGuideCard){','if(c instanceof ChargingReminderCard){ChargingReminderStarryIslandAdapter.context=context;ChargingReminderStarryIslandAdapter a=new ChargingReminderStarryIslandAdapter();if(a.createCardMessage(cc)==null)continue;adapter=a;}else if(c instanceof ElectronicGuideCard){')
files['ls/augment/com/hook/TestPersonalCharging.java']='''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.*;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.scene.electronicguide.card.ElectronicGuideCard;import com.zte.briefagent.event.scene.charge.card.ChargingReminderCard;import com.zte.briefagent.event.scene.charge.starryisland.*;import com.zte.toolsdk.producer.*;import com.zte.toolsdk.utils.RemoteViewsUtil;
public class TestPersonalCharging {
static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static StarryIslandCardRender start(Context c,CardManager m){new EventProcessor().registerCardRenders(m,c);Handler.flush();return m.renders.isEmpty()?null:(StarryIslandCardRender)m.renders.get(0);}
static void recover(Context c){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION));Handler.flush();}
static ClassLoader missing(String suffix){return new ClassLoader(TestPersonalCharging.class.getClassLoader()){@Override protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException {if(n.endsWith(suffix))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};}
static class ChildCharging extends ChargingReminderCard {}
public static void main(String[] args)throws Exception {
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestPersonalCharging.class.getClassLoader());
check(module.errors==0&&AugmentModule.hooks.size()==18,"three adapters share inherited channel hook; charging requires its actual instance callback");
Context context=new Context();CardManager manager=new CardManager();StarryIslandCardRender renderer=start(context,manager);
FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("calendar_meeting",true);FeatureSettings.change("scenic_guide",true);
MeetingCard meeting=new MeetingCard();ElectronicGuideCard scenic=new ElectronicGuideCard();ChargingReminderCard charging=new ChildCharging();
renderer.render(List.of(meeting,scenic,charging));check(renderer.selected.equals(List.of(meeting,scenic)),"charging defaults off independently");
FeatureSettings.change("nearby_charging",true);check(renderer.selected.equals(List.of(meeting,scenic,charging)),"charging enable reuses real source card including subclass");
check(FeatureSettings.diagnostics.get("nearby_charging_source_capability").startsWith("ready:"),"readiness waits for source registration and verified resources/launcher");
check(charging.info.channel==4&&!charging.supportsChannel(8)&&charging.supportsChannel(4),"no stored native channel change or global override");
RemoteViewsUtil.clicks.clear();renderer.render(List.of(charging));List<Intent> clicks=new ArrayList<>(RemoteViewsUtil.clicks);
check(clicks.size()==3&&new HashSet<>(clicks.stream().map(i->i.getStringExtra("cardId")).toList()).size()==3,"body/icon/button have distinct pending intent identities");
for(int i=0;i<3;i++)new UserTask(context,clicks.get(i).getStringExtra("cardId"),5+i).execute();
check(renderer.actions==3&&renderer.lastAction.equals(charging.id),"each control reaches exact original charging card");
new UserTask(context,clicks.get(0).getStringExtra("cardId"),6).execute();check(renderer.actions==3,"token cannot target another charging control");
recover(context);check(renderer.selected.equals(List.of(charging)),"live original card recovers after host restart");
new UserTask(context,clicks.get(0).getStringExtra("cardId"),5).execute();check(renderer.actions==3,"old control retired during reconstruction");
renderer.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-120000L;renderer.render(List.of(charging));renderer.checkAndRemoveExpiredCards();recover(context);
check(renderer.selected.equals(List.of(charging)),"charging never inherits scenic 65-second timeout");StarryIslandCardRender.nextPush=null;
renderer.render(List.of(meeting,scenic,charging));FeatureSettings.change("nearby_charging",false);check(renderer.selected.equals(List.of(meeting,scenic)),"charging off preserves calendar and guide");
FeatureSettings.change("nearby_charging",true);FeatureSettings.change("scenic_guide",false);FeatureSettings.change("calendar_meeting",false);check(renderer.selected.equals(List.of(charging)),"other scene switches do not gate charging");
charging.info.hidden=true;renderer.render(List.of(charging));check(renderer.selected.isEmpty(),"native hidden card stays hidden");charging.info.hidden=false;
charging.info.channel=0;renderer.render(List.of(charging));check(renderer.selected.isEmpty(),"zero native channel not bypassed");charging.info.channel=4;
charging.info.expired=true;renderer.render(List.of(charging));check(renderer.selected.isEmpty(),"native database expiration retained");charging.info.expired=false;
charging.type=CardType.MEETING_CARD;renderer.render(List.of(charging));check(renderer.selected.isEmpty(),"matching class with wrong CardType rejected");charging.type=CardType.CHARGING_REMINDER;
charging.id="ChargingReminder";renderer.render(List.of(charging));check(renderer.selected.equals(List.of(charging)),"verified adapter fallback ID remains supported");
charging.id="unknown_other_scene";renderer.render(List.of(charging));check(renderer.selected.isEmpty()&&FeatureSettings.diagnostics.get("ls_augment_native_island_personal_cards").contains("unsupported_card_id:nearby_charging"),"unknown identity does not create an unusable card and is diagnosed");charging.id="ChargingPowerReminder";
renderer.render(List.of(charging));renderer.render(List.of());recover(context);check(renderer.selected.isEmpty(),"native charging/battery deletion list is not replayed");
manager.cleanup();FeatureSettings.change("calendar_meeting",true);FeatureSettings.change("scenic_guide",true);
for(String resource:new String[]{"notification_charging_reminder_custom","btn_nearby_charging","power_bank"}){
Context missing=new Context();missing.resources.missing=resource;CardManager m=new CardManager();StarryIslandCardRender r=start(missing,m);r.render(List.of(meeting,scenic,charging));
check(r.selected.equals(List.of(meeting,scenic))&&FeatureSettings.diagnostics.get("nearby_charging_source_capability").contains(resource),"missing charging resource isolates scene: "+resource);m.cleanup();}
Context fallback=new Context();fallback.pm.mini=false;CardManager fm=new CardManager();StarryIslandCardRender fr=start(fallback,fm);fr.render(List.of(charging));check(fr.selected.equals(List.of(charging)),"original WeChat-home fallback accepted when mini launcher absent");fm.cleanup();
for(int mode=0;mode<5;mode++){
Context missing=new Context();missing.pm.mini=false;
if(mode==0)missing.pm.wechat=false;if(mode==1)missing.pm.wechatInfo.enabled=false;if(mode==2)missing.pm.wechatInfo.exported=false;if(mode==3)missing.pm.wechatInfo.applicationInfo.enabled=false;if(mode==4)missing.pm.wechatInfo.applicationInfo=null;
CardManager m=new CardManager();StarryIslandCardRender r=start(missing,m);r.render(List.of(meeting,scenic,charging));check(r.selected.equals(List.of(meeting,scenic))&&FeatureSettings.diagnostics.get("nearby_charging_source_capability").contains("missing_charging_launch_target"),"missing/disabled/non-exported launcher cannot advertise working button: "+mode);m.cleanup();}
for(String dependency:new String[]{"WeChatMiniprogramLauncher","ChargingReminderStarryIslandCardClickHandler"}){
AugmentModule.hooks.clear();NativeIslandPersonalCards.install(module,missing(dependency));CardManager m=new CardManager();StarryIslandCardRender r=start(context,m);r.render(List.of(meeting,scenic,charging));check(r.selected.equals(List.of(meeting,scenic))&&AugmentModule.hooks.size()==17,"missing charging class preserves older scenes: "+dependency);m.cleanup();}
AugmentModule.hooks.clear();NativeIslandPersonalCards.install(module,missing("MeetingStarryIslandCardClickHandler"));CardManager only=new CardManager();StarryIslandCardRender r=start(context,only);r.render(List.of(meeting,scenic,charging));check(r.selected.equals(List.of(scenic,charging)),"charging can work without calendar path");only.cleanup();
check(module.errors==0,"optional scenes never leave failed partial hook installation");
System.out.println("Personal nearby charging: "+checks+" checks");}}
'''
if __name__=='__main__':guide.base.run_fixture(files,'ls.augment.com.hook.TestPersonalCharging')
