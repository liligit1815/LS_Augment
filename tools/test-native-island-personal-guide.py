"""OEM guide lifecycle regression; these fixtures are not phone business evidence."""
from pathlib import Path
import importlib.util

spec=importlib.util.spec_from_file_location('personal_fixture',Path(__file__).with_name('test-native-island-personal-cards.py'))
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
files=dict(base.files);wrapped=base.wrapped
files.pop('ls/augment/com/hook/TestPersonalCards.java')
files['com/zte/briefagent/event/cards/CardType.java']='package com.zte.briefagent.event.cards;public enum CardType {MEETING_CARD,ELECTRONIC_GUIDE_CARD,TRAVEL_FLIGHT_PLAN}'
files['com/zte/personalagent/scenic/ScenicDetailActivity.java']='package com.zte.personalagent.scenic;public class ScenicDetailActivity extends android.app.Activity {}'
files['com/zte/briefagent/event/cards/DefaultCardContext.java']='''package com.zte.briefagent.event.cards;public class DefaultCardContext {public static CardContext of(android.content.Context c,com.zte.personalagent.database.data.model.entities.Card e,ICard card){return ()->card;}}'''
files['com/zte/briefagent/event/scene/electronicguide/card/ElectronicGuideCard.java']='''package com.zte.briefagent.event.scene.electronicguide.card;import com.zte.briefagent.event.cards.*;import com.zte.personalagent.database.data.model.entities.Card;public class ElectronicGuideCard implements ICard {public Card info=new Card();public String id="electronic_guide_Garden_1";public CardType getType(){return CardType.ELECTRONIC_GUIDE_CARD;}public Card getCardEntity(){return info;}public void call(String a,java.util.Map m){}}'''
files['com/zte/briefagent/event/cards/starryisland/CardStarryIslandAdapter.java']='''package com.zte.briefagent.event.cards.starryisland;import com.zte.briefagent.event.cards.CardContext;import com.zte.briefagent.event.scene.electronicguide.starryisland.ElectronicGuideStarryIslandAdapter;public interface CardStarryIslandAdapter {default boolean shouldRemoveCard(CardContext c,long first,long now){return now-first>ElectronicGuideStarryIslandAdapter.lifetime;}}'''
files['com/zte/briefagent/event/scene/electronicguide/starryisland/ElectronicGuideStarryIslandAdapter.java']='''package com.zte.briefagent.event.scene.electronicguide.starryisland;import android.content.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.starryisland.CardStarryIslandAdapter;import com.zte.briefagent.event.scene.electronicguide.card.ElectronicGuideCard;import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.widget.RemoteViews;
public class ElectronicGuideStarryIslandAdapter implements CardStarryIslandAdapter {public static Context context;public static long lifetime=65000;public String getCardId(CardContext c){return ((ElectronicGuideCard)c.getCard()).id;}public String getActionForViewId(int n){return n==3||n==4||n==0?"guide_details":null;}
'''+wrapped('ElectronicGuideStarryIslandAdapter','createCardMessage','CardMessage',['CardContext c'],'''Intent i=new Intent("native-guide");RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),i,-1,3);RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),i,-1,4);return new CardMessage();''')+'}'
files['com/zte/briefagent/event/scene/electronicguide/starryisland/ElectronicGuideStarryIslandCardClickHandler.java']='''package com.zte.briefagent.event.scene.electronicguide.starryisland;public class ElectronicGuideStarryIslandCardClickHandler {public static void handleCardClick(android.content.Context c,String id,com.zte.personalagent.database.data.model.entities.Card e){}}'''
files['com/zte/briefagent/event/cards/render/StarryIslandCardRender.java']='''package com.zte.briefagent.event.cards.render;import android.content.Context;import java.util.*;import com.zte.briefagent.event.cards.*;import com.zte.toolsdk.producer.CardPusher;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.scene.meeting.starryisland.MeetingStarryIslandAdapter;import com.zte.briefagent.event.scene.electronicguide.card.ElectronicGuideCard;import com.zte.briefagent.event.scene.electronicguide.starryisland.ElectronicGuideStarryIslandAdapter;
public class StarryIslandCardRender implements CardRender {public final Context context;public CardPusher mCardPusher;public int actions,expires,stops;public String lastAction;public List<?> selected=List.of();public final Map<String,ICard> cardIdToICardMap=new HashMap<>();public final Map<String,Object> cardIdToAdapterMap=new HashMap<>();public final Map<String,Long> cardIdToPushTimeMap=new HashMap<>(),cardIdToFinishedTimeMap=new HashMap<>();public static Long nextPush,nextFinish;
public StarryIslandCardRender(Context c){context=c;initCardPusher();}public boolean isCardExpired(com.zte.personalagent.database.data.model.entities.Card c){return c.expired;}
private String getCardStarryIslandId(ICard c){return c instanceof ElectronicGuideCard?((ElectronicGuideCard)c).id:((MeetingCard)c).id;}
public void stopExpireCheck(){stops++;}
'''+wrapped('StarryIslandCardRender','initCardPusher','void',[],'mCardPusher=CardPusher.getInstance(context,"com.android.systemui");mCardPusher.connect();mCardPusher.listener=this;')+wrapped('StarryIslandCardRender','render','void',['List cards'],'''
List<ICard> visible=new ArrayList<>();Set<String> ids=new HashSet<>();for(Object o:cards){ICard c=(ICard)o;if(c.getCardEntity().hidden||c.getCardEntity().expired||!c.supportsChannel(8))continue;
String id=getCardStarryIslandId(c);CardContext cc=()->c;Object adapter;
if(c instanceof ElectronicGuideCard){ElectronicGuideStarryIslandAdapter.context=context;ElectronicGuideStarryIslandAdapter a=new ElectronicGuideStarryIslandAdapter();a.createCardMessage(cc);adapter=a;}
else{MeetingStarryIslandAdapter.context=context;MeetingStarryIslandAdapter a=new MeetingStarryIslandAdapter();a.createCardMessage(cc);adapter=a;}
ids.add(id);visible.add(c);cardIdToICardMap.put(id,c);cardIdToAdapterMap.put(id,adapter);cardIdToPushTimeMap.putIfAbsent(id,nextPush==null?System.currentTimeMillis():nextPush);if(nextFinish!=null)cardIdToFinishedTimeMap.put(id,nextFinish);
}cardIdToICardMap.keySet().retainAll(ids);cardIdToAdapterMap.keySet().retainAll(ids);cardIdToPushTimeMap.keySet().retainAll(ids);cardIdToFinishedTimeMap.keySet().retainAll(ids);selected=visible;
''')+wrapped('StarryIslandCardRender','checkAndRemoveExpiredCards','void',[],'''expires++;for(String id:new ArrayList<>(cardIdToICardMap.keySet())){ICard card=cardIdToICardMap.get(id);Object adapter=cardIdToAdapterMap.get(id);if(adapter instanceof ElectronicGuideStarryIslandAdapter&&((ElectronicGuideStarryIslandAdapter)adapter).shouldRemoveCard(()->card,cardIdToFinishedTimeMap.getOrDefault(id,cardIdToPushTimeMap.get(id)),System.currentTimeMillis())){cardIdToICardMap.remove(id);cardIdToAdapterMap.remove(id);cardIdToPushTimeMap.remove(id);cardIdToFinishedTimeMap.remove(id);}}''')+wrapped('StarryIslandCardRender','handleCardAction','void',['String id','int position','int viewId','Object state'],'actions++;lastAction=id;')+'}'
files['ls/augment/com/hook/TestPersonalGuide.java']='''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.*;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.scene.electronicguide.card.ElectronicGuideCard;import com.zte.briefagent.event.scene.electronicguide.starryisland.ElectronicGuideStarryIslandAdapter;import com.zte.toolsdk.producer.*;import com.zte.toolsdk.utils.RemoteViewsUtil;
public class TestPersonalGuide {
static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static StarryIslandCardRender start(Context c,CardManager m){new EventProcessor().registerCardRenders(m,c);Handler.flush();return m.renders.isEmpty()?null:(StarryIslandCardRender)m.renders.get(0);}
static void recover(Context c){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION));Handler.flush();}
static ClassLoader missing(String suffix){return new ClassLoader(TestPersonalGuide.class.getClassLoader()){@Override protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException {if(n.endsWith(suffix))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};}
static class ChildGuide extends ElectronicGuideCard {}
public static void main(String[] args)throws Exception {
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestPersonalGuide.class.getClassLoader());
check(module.errors==0&&AugmentModule.hooks.size()==17,"two adapters share one inherited channel hook");
Context context=new Context();CardManager manager=new CardManager();StarryIslandCardRender renderer=start(context,manager);
FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("calendar_meeting",true);
MeetingCard meeting=new MeetingCard();ElectronicGuideCard guide=new ChildGuide();
renderer.render(List.of(meeting,guide));check(renderer.selected.equals(List.of(meeting)),"guide remains off independently of calendar");
FeatureSettings.change("scenic_guide",true);check(renderer.selected.equals(List.of(meeting,guide)),"guide enable uses actual current source card and inherited card class");
check(FeatureSettings.diagnostics.get("scenic_guide_source_capability").startsWith("ready:"),"guide readiness follows source registration and resource checks");
check(guide.info.channel==4&&!guide.supportsChannel(8)&&guide.supportsChannel(4),"guide channel override never escapes own rendering or alters stored selection");
RemoteViewsUtil.clicks.clear();renderer.render(List.of(guide));String token=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");
new UserTask(context,token,3).execute();check(renderer.actions==1&&renderer.lastAction.equals(guide.id),"guide body follows exact native source callback");
Long original=renderer.cardIdToPushTimeMap.get(guide.id);recover(context);
check(renderer.selected.equals(List.of(guide))&&renderer.cardIdToPushTimeMap.get(guide.id).equals(original),"host recovery preserves OEM first display timestamp");
new UserTask(context,token,3).execute();check(renderer.actions==1,"old guide control retired after reconstruction");
FeatureSettings.change("scenic_guide",false);check(renderer.selected.isEmpty(),"guide selection withdraws its card");
FeatureSettings.change("scenic_guide",true);check(renderer.cardIdToPushTimeMap.get(guide.id).equals(original),"reenable within native lifetime never resets timeout");
renderer.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-66000L;renderer.render(List.of(guide));
RemoteViewsUtil.clicks.clear();renderer.render(List.of(guide));String expiredToken=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");
new UserTask(context,expiredToken,3).execute();check(renderer.actions==1,"expired native display blocks actions before timer callback runs");
renderer.checkAndRemoveExpiredCards();check(!renderer.cardIdToICardMap.containsKey(guide.id),"original expiry timer removes old guide");recover(context);
check(renderer.selected.isEmpty(),"expired guide not replayed by host recovery");
FeatureSettings.change("scenic_guide",false);FeatureSettings.change("scenic_guide",true);check(renderer.selected.isEmpty(),"expired guide not replayed by selection changes");
StarryIslandCardRender.nextPush=null;renderer.render(List.of(guide));check(renderer.selected.equals(List.of(guide)),"fresh original source event retains native ability to publish again");
renderer.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-2000L;ElectronicGuideStarryIslandAdapter.lifetime=1000;renderer.render(List.of(guide));recover(context);
check(renderer.selected.isEmpty(),"replay asks actual OEM expiry method rather than hardcoding 65 seconds");ElectronicGuideStarryIslandAdapter.lifetime=65000;
renderer.render(List.of());StarryIslandCardRender.nextPush=System.currentTimeMillis()-90000L;StarryIslandCardRender.nextFinish=System.currentTimeMillis()-1000L;renderer.render(List.of(guide));
Long finish=renderer.cardIdToFinishedTimeMap.get(guide.id);recover(context);
check(renderer.selected.equals(List.of(guide))&&renderer.cardIdToFinishedTimeMap.get(guide.id).equals(finish),"original finished-state timestamp has same precedence during recovery");
StarryIslandCardRender.nextPush=StarryIslandCardRender.nextFinish=null;
renderer.render(List.of(meeting,guide));FeatureSettings.change("calendar_meeting",false);check(renderer.selected.equals(List.of(guide)),"calendar off does not disable guide");
FeatureSettings.change("calendar_meeting",true);FeatureSettings.change("scenic_guide",false);check(renderer.selected.equals(List.of(meeting)),"guide off does not disable calendar");
FeatureSettings.change("scenic_guide",true);guide.info.hidden=true;renderer.render(List.of(meeting,guide));check(renderer.selected.equals(List.of(meeting)),"hidden guide remains hidden");guide.info.hidden=false;
guide.info.channel=0;renderer.render(List.of(guide));check(renderer.selected.isEmpty(),"zero-channel guide cannot be enabled by Duo");guide.info.channel=4;
guide.info.expired=true;renderer.render(List.of(guide));check(renderer.selected.isEmpty(),"expired database card retains native filtering");guide.info.expired=false;
renderer.render(List.of());recover(context);check(renderer.selected.isEmpty(),"removed source card is not cached for replay");
renderer.render(List.of(meeting,guide));((Map)renderer.cardIdToPushTimeMap).put(guide.id,"unknown timestamp type");renderer.render(List.of(meeting,guide));Handler.flush();
check(renderer.selected.equals(List.of(meeting))&&FeatureSettings.diagnostics.get("scenic_guide_source_capability").contains("scenic_runtime_contract"),"unknown runtime timestamp retires only guide and records concrete failure");manager.cleanup();
Context missingResource=new Context();missingResource.resources.missing="starryisland_electronic_guide_big";CardManager missingManager=new CardManager();StarryIslandCardRender legacy=start(missingResource,missingManager);
legacy.render(List.of(meeting,guide));check(legacy.selected.equals(List.of(meeting)),"missing guide resource leaves old calendar path functional");
check(FeatureSettings.diagnostics.get("scenic_guide_source_capability").contains("starryisland_electronic_guide_big"),"missing concrete resource is diagnosed");missingManager.cleanup();
Context missingActivity=new Context();missingActivity.pm.missing=true;CardManager activityManager=new CardManager();StarryIslandCardRender activityFallback=start(missingActivity,activityManager);activityFallback.render(List.of(meeting,guide));check(activityFallback.selected.equals(List.of(meeting)),"missing registered detail activity rejects only guide");activityManager.cleanup();
Context disabledActivity=new Context();disabledActivity.pm.info.enabled=false;CardManager disabledManager=new CardManager();StarryIslandCardRender disabledFallback=start(disabledActivity,disabledManager);disabledFallback.render(List.of(meeting,guide));check(disabledFallback.selected.equals(List.of(meeting)),"disabled detail activity is not advertised as a working guide");disabledManager.cleanup();
Context missingMeeting=new Context();missingMeeting.resources.missing="btn_join_meeting";CardManager guideManager=new CardManager();StarryIslandCardRender guideOnly=start(missingMeeting,guideManager);guideOnly.render(List.of(meeting,guide));check(guideOnly.selected.equals(List.of(guide)),"missing calendar resource does not prevent verified guide support");guideManager.cleanup();
AugmentModule.hooks.clear();NativeIslandPersonalCards.install(module,missing("ElectronicGuideStarryIslandCardClickHandler"));CardManager onlyOld=new CardManager();StarryIslandCardRender old=start(context,onlyOld);old.render(List.of(meeting,guide));check(old.selected.equals(List.of(meeting))&&AugmentModule.hooks.size()==16,"missing guide callback retains legacy hooks");onlyOld.cleanup();
AugmentModule.hooks.clear();NativeIslandPersonalCards.install(module,missing("MeetingStarryIslandCardClickHandler"));CardManager onlyGuide=new CardManager();StarryIslandCardRender standalone=start(context,onlyGuide);standalone.render(List.of(meeting,guide));check(standalone.selected.equals(List.of(guide)),"guide can run without calendar classes");onlyGuide.cleanup();
check(module.errors==0,"optional missing capabilities do not produce partial-hook failures");
System.out.println("Personal scenic guide: "+checks+" checks");}}
'''
if __name__=='__main__':base.run_fixture(files,'ls.augment.com.hook.TestPersonalGuide')
