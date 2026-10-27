"""Exercise the real hook against an OEM event/render lifecycle, without fabricating phone evidence."""
from pathlib import Path
import ast, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
base=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets)))
files={k:v for k,v in base.items() if k.startswith('android/') or k.startswith('ls/augment/com/') and not k.endswith('TestClockSource.java')}
tree=ast.parse((ROOT/'tools/test-native-island-transfer-cards.py').read_text(encoding='utf-8'))
extra=ast.literal_eval(next(n.value.args[0] for n in tree.body if isinstance(n,ast.Expr) and isinstance(n.value,ast.Call) and isinstance(n.value.func,ast.Attribute) and n.value.func.attr=='update'))
for k in ['android/net/Uri.java','android/content/ContentProviderClient.java','android/content/ContentResolver.java','android/content/Context.java','ls/augment/com/BuildConfig.java']:
    files[k]=extra[k]
files['android/content/Context.java']=files['android/content/Context.java'].replace('com.zte.cn.zteshare','com.zte.personalagent').replace('public static final int RECEIVER_EXPORTED', 'public android.content.res.Resources resources=new android.content.res.Resources();public android.content.res.Resources getResources(){return resources;}public static final int RECEIVER_EXPORTED')
files['android/content/res/Resources.java']='package android.content.res;public class Resources {public String missing="";public int getIdentifier(String n,String t,String p){if(n.equals("tv_meeting_address")&&!n.equals(missing))return 61;if(n.equals("tv_meeting_organizer")&&!n.equals(missing))return 62;return n.equals(missing)?0:1;}}'
files['android/content/Intent.java']='''package android.content;import java.util.*;public class Intent {private final String action;public final Map<String,String> extras=new HashMap<>();public final Set<String> categories=new HashSet<>();public Intent(String a){action=a;}public Intent(Intent i){action=i.action;extras.putAll(i.extras);categories.addAll(i.categories);}public String getAction(){return action;}public Intent putExtra(String k,String v){extras.put(k,v);return this;}public String getStringExtra(String k){return extras.get(k);}public Intent addCategory(String c){categories.add(c);return this;}}'''
files['android/app/Activity.java']='package android.app;public class Activity {}'
files['android/content/ComponentName.java']='package android.content;public class ComponentName {public ComponentName(String p,String c){}}'
files['android/content/pm/ActivityInfo.java']='package android.content.pm;public class ActivityInfo {public boolean enabled=true;}'
files['android/content/pm/PackageManager.java']='package android.content.pm;public class PackageManager {public boolean missing;public ActivityInfo info=new ActivityInfo();public ActivityInfo getActivityInfo(android.content.ComponentName n,int f){if(missing)throw new IllegalStateException("missing_activity");return info;}}'
files['android/content/Context.java']=files['android/content/Context.java'].replace('public class Context {','public class Context {public android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public android.content.pm.PackageManager getPackageManager(){return pm;}')
files['android/content/ComponentName.java']='package android.content;public class ComponentName {public final String pkg,name;public ComponentName(String p,String c){pkg=p;name=c;}}'
files['android/content/pm/ApplicationInfo.java']='package android.content.pm;public class ApplicationInfo {public boolean enabled=true;}'
files['android/content/pm/ActivityInfo.java']='package android.content.pm;public class ActivityInfo {public boolean enabled=true,exported=true;public String permission;public ApplicationInfo applicationInfo=new ApplicationInfo();}'
files['android/content/pm/PackageManager.java']='''package android.content.pm;public class PackageManager {public boolean missing,mini=true,wechat=true;public ActivityInfo info=new ActivityInfo(),miniInfo=new ActivityInfo(),wechatInfo=new ActivityInfo();public ActivityInfo getActivityInfo(android.content.ComponentName n,int f){if(missing||n.pkg.equals("com.zte.mifavor.miboard")&&!mini||n.pkg.equals("com.tencent.mm")&&!wechat)throw new IllegalStateException("missing_activity");return n.pkg.equals("com.zte.mifavor.miboard")?miniInfo:n.pkg.equals("com.tencent.mm")?wechatInfo:info;}}'''
files['android/content/Intent.java']=files['android/content/Intent.java'].replace('public String getAction()', 'public Intent setPackage(String p){return this;}public ComponentName resolveActivity(android.content.pm.PackageManager p){return p.mini?new ComponentName("com.zte.mifavor.miboard","MiniActivity"):null;}public String getAction()')
files['android/content/pm/PackageManager.java']=files['android/content/pm/PackageManager.java'].replace('public boolean missing,','public boolean receiverMissing;public ActivityInfo receiver=new ActivityInfo();public ActivityInfo getReceiverInfo(android.content.ComponentName n,int f){if(receiverMissing)throw new IllegalStateException("missing_receiver");return receiver;}public boolean missing,')
files['android/content/Context.java']=files['android/content/Context.java'].replace('public class Context {','public class Context {public int permission;public int checkSelfPermission(String p){return permission;}')
files['android/content/Intent.java']=files['android/content/Intent.java'].replace('public Intent(String a)', 'public Intent(){action=null;}public Intent setData(android.net.Uri data){return this;}public Intent(String a)')
files['android/content/pm/PackageManager.java']=files['android/content/pm/PackageManager.java'].replace('public boolean missing,', 'public android.content.Intent getLaunchIntentForPackage(String p){return null;}public boolean missing,')
files['android/content/Context.java']=files['android/content/Context.java'].replace('public class Context {','public class Context {public Object getSystemService(String name){return null;}')
files['android/content/IntentFilter.java']=files['android/content/IntentFilter.java'].replace('public class IntentFilter {','public class IntentFilter {public void addAction(String action){}')
files['android/content/ComponentName.java']=files['android/content/ComponentName.java'].replace('public final String pkg,name;', 'public String getPackageName(){return pkg;}public final String pkg,name;')
files['android/content/pm/ActivityInfo.java']=files['android/content/pm/ActivityInfo.java'].replace('public String permission;', 'public String packageName,permission;')
files['android/content/Intent.java']=files['android/content/Intent.java'].replace('public String getAction()', 'public String getPackage(){return "";}public Intent setClassName(String p,String c){return this;}public Intent setComponent(ComponentName c){return this;}public String getAction()')
files['android/net/Uri.java']=files['android/net/Uri.java'].replace('public class Uri {','public class Uri {public static String encode(String s){return s;}')
files['android/content/pm/ResolveInfo.java']='package android.content.pm;public class ResolveInfo {public ActivityInfo activityInfo;}'
files['android/content/pm/PackageManager.java']=files['android/content/pm/PackageManager.java'].replace('public class PackageManager {','public class PackageManager {public java.util.List<ResolveInfo> queryBroadcastReceivers(android.content.Intent intent,int flags){return java.util.List.of();}')
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('static void diagnostic(Context c,String k,String v){}','static final Map<String,String> diagnostics=new HashMap<>();static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}')
files['ls/augment/com/hook/AugmentModule.java']='''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
public class AugmentModule {public static final Map<Method,Callback> hooks=new HashMap<>();public int errors;
public interface Callback {Object run(Chain c)throws Throwable;}
public static class Chain {Method method;Object receiver;Object[] args;Chain(Method m,Object r,Object[] a){method=m;receiver=r;args=a;}
Object proceed(Object[] a)throws Throwable{Method original=method.getDeclaringClass().getDeclaredMethod(method.getName()+"$original",method.getParameterTypes());original.setAccessible(true);return original.invoke(receiver,a);}
Object getThisObject(){return receiver;}List<Object> getArgs(){return Arrays.asList(args);}}
static class Hook {Method method;Hook(Method m){method=m;}Hook intercept(Callback c){hooks.put(method,c);return this;}}
Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}void registerFeatureHook(Hook h){}
void logFeatureInfo(String s){}void logFeatureError(String s,Throwable e){errors++;}
public static Object invoke(Object target,Class<?> type,String name,Class<?>[] signature,Object...args){try{
Method m=type.getDeclaredMethod(name,signature);m.setAccessible(true);Callback c=hooks.get(m);
if(c!=null)return c.run(new Chain(m,target,args));return new Chain(m,target,args).proceed(args);
}catch(Throwable e){throw new RuntimeException(name,e);}}}'''

# A mock Hook framework routes reflective calls too, as the real runtime does.
def wrapped(owner,name,result,args,body,static=False):
    pairs=[a.rsplit(' ',1) for a in args]
    signature=','.join(t+'.class' for t,_ in pairs)
    actual=','.join(n for _,n in pairs)
    call=f'ls.augment.com.hook.AugmentModule.invoke({"null" if static else "this"},{owner}.class,"{name}",new Class<?>[]{{{signature}}}'+(','+actual if actual else '')+')'
    ret=call+';' if result=='void' else 'return '+({'boolean':'(Boolean)','int':'(Integer)'}.get(result,'('+result+')'))+call+';'
    declaration=f'public {"static " if static else ""}{result} {name}('+','.join(args)+')'
    return declaration+'{'+ret+'}\n'+declaration.replace(name+'(',name+'$original(')+'{'+body+'}\n'

files.update({
'ls/augment/com/hook/NativeIslandCardClient.java':'''package ls.augment.com.hook;public class NativeIslandCardClient {public static boolean live=true;public static int invalidations;static boolean available(android.content.Context c,String s){return live;}static void invalidate(){invalidations++;}}''',
'com/zte/briefagent/event/cards/CardType.java':'package com.zte.briefagent.event.cards;public enum CardType {MEETING_CARD,TRAVEL_FLIGHT_PLAN}',
'com/zte/briefagent/event/cards/CardContext.java':'package com.zte.briefagent.event.cards;public interface CardContext {ICard getCard();}',
'com/zte/briefagent/event/cards/CardRender.java':'package com.zte.briefagent.event.cards;public interface CardRender {void render(java.util.List<?> cards);}',
'com/zte/personalagent/database/data/model/entities/Card.java':'''package com.zte.personalagent.database.data.model.entities;import java.util.*;public class Card {public boolean hidden,expired;public int getStatus(){return hidden?1:0;}public int channel=4;public int getChannel(){return channel;}public Map<String,Object> data=new HashMap<>();public Card(){data.put("toTime",System.currentTimeMillis()+60000L);}public Map<String,Object> getExtraData(){return data;}}''',
'com/zte/briefagent/event/cards/ICard.java':'''package com.zte.briefagent.event.cards;public interface ICard {CardType getType();com.zte.personalagent.database.data.model.entities.Card getCardEntity();default boolean supportsChannel(int c){return (Boolean)ls.augment.com.hook.AugmentModule.invoke(this,ICard.class,"supportsChannel",new Class<?>[]{int.class},c);}default boolean supportsChannel$original(int c){return (getCardEntity().getChannel() & c)!=0;}}''',
'com/zte/briefagent/event/scene/meeting/card/MeetingCard.java':'''package com.zte.briefagent.event.scene.meeting.card;import com.zte.briefagent.event.cards.*;import com.zte.personalagent.database.data.model.entities.Card;public class MeetingCard implements ICard {public Card info=new Card();public String id="meeting_1";public boolean channel=true;public CardType type=CardType.MEETING_CARD;public CardType getType(){return type;}public Card getCardEntity(){return info;}public void call(String action,java.util.Map values){}}''',
'com/zte/briefagent/event/scene/meeting/starryisland/MeetingStarryIslandAdapter.java':'''package com.zte.briefagent.event.scene.meeting.starryisland;import com.zte.briefagent.event.cards.CardContext;public class MeetingStarryIslandAdapter {public com.zte.toolsdk.common.CardMessage createCardMessage(CardContext c){return null;}public String getCardId(CardContext c){return "meeting_1";}public String getActionForViewId(int n){return "action";}public boolean shouldRemoveCard(CardContext c,long a,long b){return false;}}''',
'com/zte/briefagent/event/scene/meeting/starryisland/MeetingStarryIslandCardClickHandler.java':'''package com.zte.briefagent.event.scene.meeting.starryisland;public class MeetingStarryIslandCardClickHandler {public static void handleCardClick(android.content.Context c,String key,com.zte.personalagent.database.data.model.entities.Card card){}}''',
'com/zte/toolsdk/common/CardMessage.java':'package com.zte.toolsdk.common;public class CardMessage {public com.zte.toolsdk.widget.RemoteViews views=new com.zte.toolsdk.widget.RemoteViews();public com.zte.toolsdk.widget.RemoteViews getRemoteViews(){return views;}}',
'com/zte/toolsdk/common/CardProviderContract.java':'package com.zte.toolsdk.common;public class CardProviderContract {public static android.net.Uri getProviderUri(String p){return android.net.Uri.parse(p);}}',
'com/zte/toolsdk/common/Constants.java':'package com.zte.toolsdk.common;public class Constants {public static class DataKey {public static final String CARD_ID="cardId";}}',
'com/zte/toolsdk/widget/RemoteViews.java':'package com.zte.toolsdk.widget;public class RemoteViews {public java.util.Map<Integer,Integer> visibility=new java.util.HashMap<>();public void setViewVisibility(int id,int value){visibility.put(id,value);}}',
})
files['com/zte/toolsdk/utils/RemoteViewsUtil.java']='''package com.zte.toolsdk.utils;import android.content.*;import java.util.*;import com.zte.toolsdk.widget.RemoteViews;public class RemoteViewsUtil {public static final List<Intent> clicks=new ArrayList<>();
'''+wrapped('RemoteViewsUtil','setOnClickListener','void',['Context c','RemoteViews r','Intent i','int p','int v'],'clicks.add(i);',True)+'}'
files['com/zte/briefagent/event/scene/meeting/starryisland/MeetingStarryIslandAdapter.java']='''package com.zte.briefagent.event.scene.meeting.starryisland;import android.content.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.toolsdk.common.CardMessage;import com.zte.toolsdk.utils.RemoteViewsUtil;import com.zte.toolsdk.widget.RemoteViews;
public class MeetingStarryIslandAdapter {public static Context context;public static boolean fail;public static Intent original;public static CardMessage lastMessage;public String getCardId(CardContext c){return ((MeetingCard)c.getCard()).id;}public String getActionForViewId(int n){return "action";}public boolean shouldRemoveCard(CardContext c,long a,long b){return false;}
'''+wrapped('MeetingStarryIslandAdapter','createCardMessage','CardMessage',['CardContext c'],'''original=new Intent("native-action").addCategory("native-category").putExtra("unrelated","keep");RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),original,-1,1);RemoteViewsUtil.setOnClickListener(context,new RemoteViews(),original,-1,2);if(fail)throw new IllegalStateException("build");lastMessage=new CardMessage();return lastMessage;''')+'}'
files['com/zte/toolsdk/producer/UserTask.java']='''package com.zte.toolsdk.producer;import android.content.Context;public class UserTask {public final Context mContext;public final String mCardId,mPackageName;public final int mViewId,mPosition;public final boolean mIsPushCard;public static int executions;public static boolean fail;
public UserTask(Context c,String id,int v){this(c,id,v,-1,true,"com.android.systemui");}public UserTask(Context c,String id,int v,int p,boolean push,String pkg){mContext=c;mCardId=id;mViewId=v;mPosition=p;mIsPushCard=push;mPackageName=pkg;}
'''+wrapped('UserTask','execute','void',[],'''executions++;CardPusher p=CardPusher.getInstance(mContext,mPackageName);if(fail)throw new IllegalStateException("execute");if(p.listener!=null)p.listener.handleCardAction(mCardId,mPosition,mViewId,null);''')+'}'
files['com/zte/briefagent/data/config/EnvironmentConfig.java']='''package com.zte.briefagent.data.config;import android.content.Context;public class EnvironmentConfig {public static boolean full;public static boolean isFeatureStarryIslandSupported(Context c){return full;}
'''+wrapped('EnvironmentConfig','enableStarryIsland','boolean',['Context c'],'return full;',True)+'}'
files['com/zte/briefagent/event/cards/CardManager.java']='''package com.zte.briefagent.event.cards;import java.util.*;public class CardManager {public List<CardRender> renders=new ArrayList<>();public List<CardRender> cardRenders=renders;public int cleanups;public void registerCardRender(CardRender r){renders.add(r);}public void unregisterCardRender(CardRender r){renders.remove(r);}
'''+wrapped('CardManager','cleanup','void',[],'cleanups++;')+'}'
files['com/zte/toolsdk/producer/CardPusher.java']='''package com.zte.toolsdk.producer;import android.content.*;public class CardPusher {
public static CardPusher singleton;public com.zte.briefagent.event.cards.render.StarryIslandCardRender listener;public ContentProviderClient mClient;public Context mContext;public String mTargetPackage;public int registered,unregistered,originalConnections;
public CardPusher(Context c,String p){mContext=c;mTargetPackage=p;}public void registerCallback(){registered++;}public void unregisterCallback(){unregistered++;}
'''+wrapped('CardPusher','getInstance','CardPusher',['Context c','String p'],'if(singleton==null)singleton=new CardPusher(c,p);return singleton;',True)+wrapped('CardPusher','connect','boolean',[],'originalConnections++;mClient=new ContentProviderClient();return true;')+wrapped('CardPusher','disconnect','void',[],'if(mClient!=null)mClient.close();mClient=null;')+'}'
files['com/zte/briefagent/event/cards/render/StarryIslandCardRender.java']='''package com.zte.briefagent.event.cards.render;import android.content.Context;import java.util.*;import com.zte.briefagent.event.cards.*;import com.zte.toolsdk.producer.CardPusher;
public class StarryIslandCardRender implements CardRender {public final Context context;public CardPusher mCardPusher;public int actions,expires,stops,renders;public String lastAction;public final Map<String,ICard> cardIdToICardMap=new HashMap<>();public List<?> selected=List.of();public boolean isCardExpired(com.zte.personalagent.database.data.model.entities.Card c){return c.expired;}
public StarryIslandCardRender(Context c){context=c;initCardPusher();}
'''+wrapped('StarryIslandCardRender','initCardPusher','void',[],'mCardPusher=CardPusher.getInstance(context,"com.android.systemui");mCardPusher.connect();mCardPusher.listener=this;')+wrapped('StarryIslandCardRender','render','void',['List cards'],'''renders++;cardIdToICardMap.clear();List<ICard> visible=new ArrayList<>();com.zte.briefagent.event.scene.meeting.starryisland.MeetingStarryIslandAdapter.context=context;for(Object o:cards){ICard c=(ICard)o;if(!c.getCardEntity().hidden&&!c.getCardEntity().expired&&c.supportsChannel(8)){com.zte.briefagent.event.scene.meeting.starryisland.MeetingStarryIslandAdapter a=new com.zte.briefagent.event.scene.meeting.starryisland.MeetingStarryIslandAdapter();CardContext cc=()->c;a.createCardMessage(cc);cardIdToICardMap.put(a.getCardId(cc),c);visible.add(c);}}selected=visible;''')+wrapped('StarryIslandCardRender','checkAndRemoveExpiredCards','void',[],'expires++;')+wrapped('StarryIslandCardRender','handleCardAction','void',['String id','int position','int viewId','Object state'],'actions++;lastAction=id;')+'public void stopExpireCheck(){stops++;}}'
files['com/zte/briefagent/event/EventProcessor.java']='''package com.zte.briefagent.event;import android.content.Context;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.data.config.EnvironmentConfig;public class EventProcessor {public int deinitializations;
'''+wrapped('EventProcessor','registerCardRenders','void',['CardManager manager','Context context'],'if(EnvironmentConfig.enableStarryIsland(context))manager.registerCardRender(new StarryIslandCardRender(context));')+wrapped('EventProcessor','deInit','void',['Context c'],'deinitializations++;')+'}'
entity_path='com/zte/personalagent/database/data/model/entities/Card.java'
files[entity_path]=files[entity_path].replace('public int getChannel(){return channel;}',
    wrapped('Card','getChannel','int',[],'return channel;'))
files['ls/augment/com/hook/TestPersonalCards.java']='''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import com.zte.briefagent.event.*;import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.event.scene.meeting.card.MeetingCard;import com.zte.briefagent.event.scene.meeting.starryisland.MeetingStarryIslandAdapter;import com.zte.briefagent.data.config.EnvironmentConfig;import com.zte.toolsdk.producer.CardPusher;import com.zte.toolsdk.producer.UserTask;import com.zte.toolsdk.utils.RemoteViewsUtil;import java.util.*;
public class TestPersonalCards {
static int checks;static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
static StarryIslandCardRender start(Context c,CardManager m,EventProcessor p){p.registerCardRenders(m,c);Handler.flush();return m.renders.isEmpty()?null:(StarryIslandCardRender)m.renders.get(0);}
public static class Child extends EventProcessor {}
public static class ChildTask extends UserTask {ChildTask(Context c,String id,int v){super(c,id,v);}}
public static void main(String[] args)throws Exception {
ClassLoader loader=TestPersonalCards.class.getClassLoader();AugmentModule broken=new AugmentModule();
NativeIslandPersonalCards.install(broken,new ClassLoader(loader){@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {if(n.endsWith("MeetingStarryIslandCardClickHandler"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}});
check(broken.errors==1&&AugmentModule.hooks.isEmpty(),"missing callback contract installs no partial hooks");
NativeIslandPersonalCards.install(broken,new ClassLoader(loader){@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {if(n.endsWith("UserTask"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}});
check(broken.errors==2&&AugmentModule.hooks.isEmpty(),"missing actual SDK button task preserves original registration");
AugmentModule module=new AugmentModule();NativeIslandPersonalCards.install(module,loader);check(module.errors==0&&AugmentModule.hooks.size()==16,"complete contract installs expected hooks");
Context context=new Context();CardManager manager=new CardManager();EventProcessor processor=new Child();
check(!EnvironmentConfig.enableStarryIsland(context),"gate unchanged outside renderer registration");
Context wrong=new Context();wrong.pkg="other";check(start(wrong,new CardManager(),new EventProcessor())==null,"wrong context preserves native registration");
Context missing=new Context();missing.resources.missing="btn_ignore_meeting";check(start(missing,new CardManager(),new EventProcessor())==null,"missing action resource keeps original path");
EnvironmentConfig.full=true;CardManager nativeManager=new CardManager();StarryIslandCardRender original=start(context,nativeManager,processor);
check(original!=null&&original.mCardPusher==CardPusher.singleton&&original.mCardPusher.originalConnections==1,"full screen path keeps native renderer and connection");
EnvironmentConfig.full=false;StarryIslandCardRender renderer=start(context,manager,processor);
check(renderer!=null&&renderer.mCardPusher!=CardPusher.singleton,"ordinary path owns private producer only");
check(renderer.mCardPusher.mClient==null&&context.resolver.unstable==0,"disabled scene does not connect");
check(context.requiredPermission.equals("android.permission.STATUS_BAR_SERVICE"),"recovery receiver requires SystemUI permission");
check(context.resolver.observers==1&&FeatureSettings.listeners.size()==1,"single lifecycle observer set");
check(!EnvironmentConfig.enableStarryIsland(context),"registration override not leaked");
FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("calendar_meeting",true);
MeetingCard live=new MeetingCard(),expired=new MeetingCard(),other=new MeetingCard(),hidden=new MeetingCard(),noChannel=new MeetingCard();
expired.info.data.put("toTime",System.currentTimeMillis()-1);other.type=CardType.TRAVEL_FLIGHT_PLAN;hidden.info.hidden=true;noChannel.info.channel=0;
check(!live.supportsChannel(8)&&live.supportsChannel(4),"native reminder channels remain unchanged before rendering");
renderer.render(List.of(live,expired,other,hidden,noChannel));
check(renderer.selected.equals(List.of(live)),"Duo supplies island channel only to active unexpired meeting while retaining hidden and zero-channel gates");
check(MeetingStarryIslandAdapter.lastMessage.views.visibility.equals(Map.of(61,8,62,8)),"missing optional meeting data hides OEM sample address and organizer");
live.info.data.put("address","Local room");live.info.data.put("organizer","Local tester");renderer.render(List.of(live));
check(MeetingStarryIslandAdapter.lastMessage.views.visibility.equals(Map.of(61,0,62,0))&&live.info.data.get("address").equals("Local room"),"supplied fields remain visible without rewriting source data");
live.info.data.put("address","   ");live.info.data.put("organizer",42);renderer.render(List.of(live));
check(MeetingStarryIslandAdapter.lastMessage.views.visibility.equals(Map.of(61,8,62,8)),"blank and malformed optional fields cannot reveal sample labels");
live.info.data.remove("address");live.info.data.remove("organizer");
check(live.info.channel==4&&!live.supportsChannel(8)&&live.supportsChannel(4),"display-channel override never changes stored selection or leaks outside owned renderer");
long storedEnd=System.currentTimeMillis()+60000L;
for(Object value:new Object[]{Double.valueOf(storedEnd),String.valueOf(storedEnd)}){
live.info.data.put("toTime",value);renderer.render(List.of(live));
check(renderer.selected.equals(List.of(live))&&live.info.data.get("toTime")==value,"stored numeric or text timestamp renders without rewriting original data");
}
for(Object value:new Object[]{Double.valueOf(System.currentTimeMillis()-1),String.valueOf(System.currentTimeMillis()-1),Double.NaN,Double.POSITIVE_INFINITY,Double.NEGATIVE_INFINITY,0x1p63,"invalid",null}){
live.info.data.put("toTime",value);renderer.render(List.of(live));
check(renderer.selected.isEmpty(),"expired or invalid stored timestamp cannot display a meeting");
}
live.info.data.put("toTime",Double.valueOf(storedEnd));renderer.render(List.of(live));
check(renderer.mCardPusher.registered==1&&context.resolver.unstable==1,"owned unstable connection registered once");
renderer.handleCardAction("meeting_1",0,1,null);check(renderer.actions==1,"native action callback invoked once");
FeatureSettings.change("calendar_meeting",false);check(renderer.selected.isEmpty()&&renderer.mCardPusher.mClient==null,"disable retracts cards and releases connection");
renderer.handleCardAction("meeting_1",0,1,null);check(renderer.actions==1,"disabled stale action cannot run");
FeatureSettings.change("calendar_meeting",true);check(renderer.selected.equals(List.of(live)),"reenable rebuilds from real card entities");
ContentProviderClient old=renderer.mCardPusher.mClient;
context.receiver.onReceive(context,new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION));Handler.flush();
check(old.closed&&renderer.mCardPusher.mClient!=old&&renderer.selected.equals(List.of(live)),"host reconstruction replaces owned connection and rebuilds current business cards");
live.info.data.put("toTime",System.currentTimeMillis()-1);
context.receiver.onReceive(context,new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION));Handler.flush();
check(renderer.selected.isEmpty(),"ended meeting is not replayed after host recovery");
live.info.data.put("toTime",System.currentTimeMillis()+60000L);renderer.render(List.of(live));renderer.render(List.of());
FeatureSettings.change("calendar_meeting",false);FeatureSettings.change("calendar_meeting",true);check(renderer.selected.isEmpty(),"removed business does not reappear");
NativeIslandCardClient.live=false;renderer.render(List.of(live));check(renderer.selected.isEmpty(),"unavailable host gets no fabricated card");
NativeIslandCardClient.live=true;FeatureSettings.change("duo",true);check(renderer.selected.isEmpty(),"custom island selection excludes native cards");FeatureSettings.change("duo",false);
ContentProviderClient owned=renderer.mCardPusher.mClient,foreign=new ContentProviderClient();renderer.mCardPusher.mClient=foreign;int callbacks=renderer.mCardPusher.unregistered;
FeatureSettings.change("calendar_meeting",false);check(owned.closed&&!foreign.closed&&renderer.mCardPusher.mClient==foreign&&callbacks==renderer.mCardPusher.unregistered,"replacement connection and its callback belong to external installer");
FeatureSettings.change("calendar_meeting",true);check(renderer.selected.isEmpty(),"foreign connection cannot be adopted");
processor.deInit(context);check(manager.renders.isEmpty()&&renderer.stops==1&&context.receiver==null&&context.resolver.observers==0&&FeatureSettings.listeners.isEmpty(),"service deinit removes owned renderer timer listeners and receiver");
check(!foreign.closed&&CardPusher.singleton.mClient!=null,"cleanup leaves unrelated producer and replacement connection untouched");
renderer.render(List.of(live));renderer.handleCardAction("meeting_1",0,1,null);check(renderer.selected.isEmpty()&&renderer.actions==1,"queued rendering and actions after deinit are inert");
CardManager rebuilt=new CardManager();StarryIslandCardRender next=start(context,rebuilt,processor);check(next!=renderer&&FeatureSettings.listeners.size()==1,"later service startup registers fresh lifecycle");
renderer.render(List.of(live));renderer.handleCardAction("meeting_1",0,1,null);check(renderer.selected.isEmpty()&&renderer.actions==1,"old callbacks remain retired after a new binding replaces them");
check(!renderer.mCardPusher.connect()&&!foreign.closed,"retired private producer cannot reconnect or close a replacement");
rebuilt.cleanup();check(rebuilt.renders.isEmpty()&&next.stops==1&&rebuilt.cleanups==1,"manager cleanup keeps original action and stops owned lifecycle");

CardManager actionsManager=new CardManager();StarryIslandCardRender actions=start(context,actionsManager,processor);
MeetingCard first=new MeetingCard(),second=new MeetingCard();second.id="meeting_2";
RemoteViewsUtil.clicks.clear();actions.render(List.of(first,second));
Intent firstIntent=RemoteViewsUtil.clicks.get(0),firstOther=RemoteViewsUtil.clicks.get(1),secondIntent=RemoteViewsUtil.clicks.get(2);
String firstToken=firstIntent.getStringExtra("cardId"),secondToken=secondIntent.getStringExtra("cardId");
check(firstToken!=null&&!firstToken.equals(secondToken)&&!firstIntent.categories.equals(secondIntent.categories),"same control in two cards receives distinct PendingIntent identities");
check(!firstIntent.categories.equals(firstOther.categories),"each control gets its own identity");
check(firstIntent.getAction().equals("native-action")&&firstIntent.categories.contains("native-category")&&firstIntent.getStringExtra("unrelated").equals("keep"),"OEM intent action categories and unrelated extras preserved");
check(MeetingStarryIslandAdapter.original.getStringExtra("cardId")==null&&MeetingStarryIslandAdapter.original.categories.size()==1,"OEM mutable helper intent not contaminated");
int nativeActions=original.actions;
new UserTask(context,firstToken,1).execute();check(actions.actions==1&&"meeting_1".equals(actions.lastAction)&&original.actions==nativeActions,"SDK queued task reaches private renderer and exact first card");
new ChildTask(context,secondToken,1).execute();check(actions.actions==2&&"meeting_2".equals(actions.lastAction),"inherited task method routes the second card without scanning");
check(CardPusher.getInstance(context,"com.android.systemui")==CardPusher.singleton,"private producer override ends with task execution");
new UserTask(context,"unrelated_native",1).execute();check(original.actions==nativeActions+1&&actions.actions==2,"untagged native SDK tasks retain shared producer");
new UserTask(context,firstToken,2).execute();new UserTask(context,firstToken,1,7,true,"com.android.systemui").execute();
new UserTask(context,firstToken,1,-1,false,"com.android.systemui").execute();new UserTask(context,firstToken,1,-1,true,"other").execute();new UserTask(new Context(),firstToken,1).execute();
check(actions.actions==2,"wrong view position push mode target and context cannot use another ticket");
actions.handleCardAction(firstToken,-1,1,null);actions.handleCardAction(null,-1,1,null);actions.handleCardAction("",-1,1,null);actions.handleCardAction("meeting_missing",-1,1,null);
check(actions.actions==2,"direct tokens null IDs and unknown cards cannot trigger adapter scanning");
actions.handleCardAction("meeting_2",-1,0,null);check(actions.actions==3&&actions.lastAction.equals("meeting_2"),"native launch action for an active card still works");
first.info.hidden=true;new UserTask(context,firstToken,1).execute();first.info.hidden=false;
first.info.expired=true;new UserTask(context,firstToken,1).execute();first.info.expired=false;
first.info.channel=0;new UserTask(context,firstToken,1).execute();first.info.channel=4;
first.info.data.put("toTime",System.currentTimeMillis()-1);new UserTask(context,firstToken,1).execute();first.info.data.put("toTime",System.currentTimeMillis()+60000L);
check(actions.actions==3,"hidden expired disabled-channel and ended meetings immediately stop button actions");
UserTask.fail=true;try{new UserTask(context,firstToken,1).execute();throw new AssertionError();}catch(RuntimeException expected){}finally{UserTask.fail=false;}
check(CardPusher.getInstance(context,"com.android.systemui")==CardPusher.singleton,"task exception restores singleton lookup semantics");
RemoteViewsUtil.clicks.clear();actions.render(List.of(first,second));String currentToken=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");
new UserTask(context,firstToken,1).execute();check(actions.actions==3,"replaced card controls retire their old tickets");
new UserTask(context,currentToken,1).execute();check(actions.actions==4&&actions.lastAction.equals("meeting_1"),"new card controls still dispatch after update");
FeatureSettings.change("calendar_meeting",false);new UserTask(context,currentToken,1).execute();check(actions.actions==4,"disabled scene cannot execute an already queued SDK task");
FeatureSettings.change("calendar_meeting",true);new UserTask(context,currentToken,1).execute();check(actions.actions==4,"reenabling the same card never revives stale PendingIntents");
RemoteViewsUtil.clicks.clear();actions.render(List.of(first));String removedToken=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");actions.cardIdToICardMap.clear();new UserTask(context,removedToken,1).execute();
check(actions.actions==4,"OEM expiry removal blocks task even before next render/pruning");
RemoteViewsUtil.clicks.clear();actions.render(List.of(first));String oldGeneration=RemoteViewsUtil.clicks.get(0).getStringExtra("cardId");
processor.deInit(context);CardManager latestManager=new CardManager();StarryIslandCardRender latest=start(context,latestManager,processor);latest.render(List.of(first));new UserTask(context,oldGeneration,1).execute();
check(latest.actions==0,"renderer replacement cannot accept old generation tickets even for the same card");
RemoteViewsUtil.clicks.clear();new MeetingStarryIslandAdapter().createCardMessage(()->first);
check(RemoteViewsUtil.clicks.get(0).getStringExtra("cardId")==null,"adapter calls outside owned rendering preserve native callbacks");
check(MeetingStarryIslandAdapter.lastMessage.views.visibility.isEmpty(),"presentation adjustment is limited to the owned renderer");
MeetingStarryIslandAdapter.fail=true;try{latest.render(List.of(first));throw new AssertionError();}catch(RuntimeException expected){}finally{MeetingStarryIslandAdapter.fail=false;}
RemoteViewsUtil.clicks.clear();new MeetingStarryIslandAdapter().createCardMessage(()->first);
check(RemoteViewsUtil.clicks.get(0).getStringExtra("cardId")==null,"adapter exception cannot leak scoped callback customization");
latestManager.cleanup();
System.out.println("Personal calendar cards: "+checks+" checks");}}
'''
def run_fixture(fixtures,main='ls.augment.com.hook.TestPersonalCards'):
    with tempfile.TemporaryDirectory(prefix='duo-personal-cards-') as folder:
        sources=[]
        for name,value in fixtures.items():
            path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');sources.append(str(path))
        sources += [str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/name) for name in ['NativeIslandPersonalCards.java','NativeIslandPersonalScene.java','NativeIslandPersonalCycling.java','NativeIslandPersonalFlight.java','NativeIslandPersonalFlightState.java','NativeIslandPersonalFlightModern.java','NativeIslandPersonalBattery.java','NativeIslandPersonalWeather.java','NativeIslandPersonalNavigation.java','NativeIslandSceneContract.java','NativeIslandScenePolicy.java']]
        sources.append(str(ROOT/'android/app/src/main/java/ls/augment/com/NativeIslandCardProtocol.java'))
        java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
        subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*sources],check=True)
        subprocess.run([str(java/('java'+suffix)),'-cp',folder,main],check=True)

if __name__=='__main__':run_fixture(files)
