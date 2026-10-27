"""Exercise OEM single-source combination before the owned island renderer.

Reference: DefaultCardCombiner, TravelSceneGroupCardCombiner, Base4x2Card and
ICard4x2 from the device APK. This is a host fixture, not a business event test.
"""
from pathlib import Path
import importlib.util

spec = importlib.util.spec_from_file_location('personal_fixture', Path(__file__).with_name('test-native-island-personal-cards.py'))
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
files = dict(base.files)
wrapper = 'com/zte/briefagent/event/cards/shape/Base4x2Card.java'
files[wrapper] = '''package com.zte.briefagent.event.cards.shape;
import com.zte.briefagent.event.cards.*;import com.zte.personalagent.database.data.model.entities.Card;
public class Base4x2Card implements ICard {
public ICard left,right;public Base4x2Card(ICard l,ICard r){left=l;right=r;}
public ICard getLeft(){return left;}public ICard getRight(){return right;}
public Card getCardEntity(){return left.getCardEntity();}public CardType getType(){return right.getType();}
public boolean supportsChannel(int n){return right.supportsChannel(n);}
}'''
# The real adapter reads the entity; let the small fixture derive its identity from
# that same source too, so the untouched native-renderer comparison accepts wrappers.
adapter = 'com/zte/briefagent/event/scene/meeting/starryisland/MeetingStarryIslandAdapter.java'
files[adapter] = files[adapter].replace('return ((MeetingCard)c.getCard()).id;',
    'ICard value=c.getCard();if(value instanceof com.zte.briefagent.event.cards.shape.Base4x2Card)value=((com.zte.briefagent.event.cards.shape.Base4x2Card)value).getLeft();return ((MeetingCard)value).id;')
files['ls/augment/com/hook/TestPersonalComposite.java'] = '''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.*;
import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;
import com.zte.briefagent.event.cards.shape.Base4x2Card;
import com.zte.briefagent.event.cards.render.StarryIslandCardRender;
import com.zte.briefagent.event.scene.meeting.card.MeetingCard;
import com.zte.briefagent.data.config.EnvironmentConfig;
import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.producer.UserTask;
public class TestPersonalComposite {
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
public static class Child extends Base4x2Card {Child(ICard c){super(c,c);}}
public static class CopiedDefault extends MeetingCard {public boolean supportsChannel(int c){return (info.getChannel()&c)!=0;}}
public static class EqualCard extends MeetingCard {public boolean equals(Object o){return o instanceof EqualCard;}public int hashCode(){return 1;}}
public static void main(String[] args)throws Exception {
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestPersonalComposite.class.getClassLoader());
check(module.errors==0,"optional wrapper contract installs without errors");
Context context=new Context();CardManager manager=new CardManager();EventProcessor processor=new EventProcessor();
FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("calendar_meeting",true);
processor.registerCardRenders(manager,context);Handler.flush();StarryIslandCardRender renderer=(StarryIslandCardRender)manager.renders.get(0);
MeetingCard live=new MeetingCard();live.info.data.put("toTime",Double.valueOf(System.currentTimeMillis()+60000));
CopiedDefault copied=new CopiedDefault();renderer.render(List.of(new Base4x2Card(copied,copied)));
check(renderer.selected.equals(List.of(copied)),"copied interface default uses scoped concrete entity channel");
check(copied.info.getChannel()==4&&!copied.supportsChannel(8),"concrete channel override ends with owned rendering");
copied.info.channel=0;renderer.render(List.of(copied));check(renderer.selected.isEmpty(),"concrete channel hook cannot enable disabled source");
copied.info.channel=4;FeatureSettings.change("calendar_meeting",false);renderer.render(List.of(copied));
check(renderer.selected.isEmpty()&&copied.info.getChannel()==4,"disabled scene retains original concrete channel");FeatureSettings.change("calendar_meeting",true);
Base4x2Card wrapped=new Base4x2Card(live,live);List<ICard> incoming=List.of(wrapped);
renderer.render(incoming);check(renderer.selected.equals(List.of(live)),"OEM combination plus JSON numeric time reaches real source adapter");
check(incoming.get(0)==wrapped&&wrapped.getLeft()==live&&wrapped.getRight()==live,"original notification/widget composition is unchanged");
check(live.info.channel==4&&!wrapped.supportsChannel(8),"stored/native channels are unchanged");
RemoteViewsUtil.clicks.clear();renderer.render(List.of(new Child(live)));
check(renderer.selected.equals(List.of(live)),"inherited wrapper methods use same source");
String token=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");new UserTask(context,token,1).execute();
check(renderer.actions==1&&"meeting_1".equals(renderer.lastAction),"wrapper action reaches exact source identity");
FeatureSettings.change("calendar_meeting",false);check(renderer.selected.isEmpty(),"disable retracts wrapped business");
new UserTask(context,token,1).execute();check(renderer.actions==1,"disabled wrapped action cannot run");
FeatureSettings.change("calendar_meeting",true);check(renderer.selected.equals(List.of(live)),"enable replays same current source");
new UserTask(context,token,1).execute();check(renderer.actions==1,"enable does not revive stale wrapper token");
MeetingCard second=new MeetingCard();second.id="meeting_2";
renderer.render(List.of(new Base4x2Card(live,second)));check(renderer.selected.isEmpty(),"mixed composition cannot choose wrong entity or actions");
check(FeatureSettings.diagnostics.get("ls_augment_native_island_personal_cards").startsWith("unsupported_composite_source:"),"unknown composition reports missing capability");
renderer.render(List.of(new Base4x2Card(null,null)));check(renderer.selected.isEmpty(),"empty composition cannot render");
renderer.render(List.of(new Base4x2Card(live,live){public CardType getType(){return CardType.TRAVEL_FLIGHT_PLAN;}}));
check(renderer.selected.isEmpty(),"mismatched wrapper type cannot be reinterpreted");
renderer.render(List.of(new Base4x2Card(live,live){public com.zte.personalagent.database.data.model.entities.Card getCardEntity(){return second.info;}}));
check(renderer.selected.isEmpty(),"mismatched wrapper entity cannot be reinterpreted");
live.info.hidden=true;renderer.render(incoming);check(renderer.selected.isEmpty(),"hidden source retains native suppression");live.info.hidden=false;
live.info.expired=true;renderer.render(incoming);check(renderer.selected.isEmpty(),"expired source retains native suppression");live.info.expired=false;
live.info.channel=0;renderer.render(incoming);check(renderer.selected.isEmpty(),"disabled source channels cannot be widened");live.info.channel=4;
live.info.data.put("toTime",0L);renderer.render(incoming);check(renderer.selected.isEmpty(),"ended wrapped meeting remains rejected");live.info.data.put("toTime",System.currentTimeMillis()+60000L);
renderer.render(List.of(live,wrapped,new Child(live)));check(renderer.selected.size()==1&&renderer.selected.get(0)==live,"same source deduplicates by object identity");
EqualCard a=new EqualCard(),b=new EqualCard();b.id="meeting_2";renderer.render(List.of(new Base4x2Card(a,a),new Base4x2Card(b,b)));
check(renderer.selected.size()==2,"distinct sources with custom equality are not merged");
renderer.render(List.of());FeatureSettings.change("calendar_meeting",false);FeatureSettings.change("calendar_meeting",true);
check(renderer.selected.isEmpty(),"removed wrapper does not reappear");
EnvironmentConfig.full=true;CardManager nativeManager=new CardManager();processor.registerCardRenders(nativeManager,context);
StarryIslandCardRender nativeRenderer=(StarryIslandCardRender)nativeManager.renders.get(0);live.info.channel=8;nativeRenderer.render(incoming);
check(nativeRenderer.selected.size()==1&&nativeRenderer.selected.get(0)==wrapped,"complete native path keeps original wrapper");
System.out.println("Personal composite cards: "+checks+" checks");}}
'''
files['ls/augment/com/hook/TestUnknownComposite.java'] = '''package ls.augment.com.hook;
import android.content.Context;import android.os.Handler;import java.util.*;
import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;
import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.cards.shape.Base4x2Card;
public class TestUnknownComposite {public static void main(String[] args){
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,TestUnknownComposite.class.getClassLoader());
if(module.errors!=0)throw new AssertionError("optional wrapper must not break direct cards");
FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("calendar_meeting",true);
Context c=new Context();CardManager m=new CardManager();new EventProcessor().registerCardRenders(m,c);Handler.flush();
StarryIslandCardRender r=(StarryIslandCardRender)m.renders.get(0);MeetingCard card=new MeetingCard();r.render(List.of(card));
if(!r.selected.equals(List.of(card)))throw new AssertionError("direct path lost");
r.render(List.of(new Base4x2Card(card,card)));if(!r.selected.isEmpty())throw new AssertionError("unknown wrapper was guessed");
System.out.println("Personal composite unknown contract: 3 checks");}}
'''

if __name__ == '__main__':
    base.run_fixture(files, 'ls.augment.com.hook.TestPersonalComposite')
    unknown = dict(files)
    unknown[wrapper] = unknown[wrapper].replace('public ICard getRight()', 'public Object getRight()')
    base.run_fixture(unknown, 'ls.augment.com.hook.TestUnknownComposite')
