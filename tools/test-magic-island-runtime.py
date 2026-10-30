"""Execute production mode/selection and native scene hooks; no device state or fabricated business orders."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
files={
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler{
 public static List<Runnable> q=new ArrayList<>();public Handler(){}public Handler(Looper l){}public void post(Runnable r){q.add(r);}
 public void postDelayed(Runnable r,long t){q.add(r);}public void removeCallbacks(Runnable r){q.removeIf(x->x==r);}
 public static void drain(){int n=0;while(!q.isEmpty()){if(++n>100)throw new AssertionError("callback loop");q.remove(0).run();}}}''',
'android/os/Process.java':'package android.os;public class Process{public static int myUid(){return 10001;}}',
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle extends HashMap<String,Object>{
 public void putBoolean(String k,boolean v){put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(get(k));}
 public void putString(String k,String v){put(k,v);}public String getString(String k,String d){return containsKey(k)?(String)get(k):d;}}''',
'android/net/Uri.java':'package android.net;public class Uri{public static Uri parse(String s){return new Uri();}}',
'android/content/ComponentName.java':'package android.content;public class ComponentName{public String pkg,name;public ComponentName(String p,String n){pkg=p;name=n;}}',
'android/content/SharedPreferences.java':'''package android.content;import java.util.*;public class SharedPreferences{
 public Map<String,String> values=new HashMap<>();public String getString(String k,String d){return values.getOrDefault(k,d);}
 public Editor edit(){return new Editor();}public class Editor{public Editor putString(String k,String v){values.put(k,v);return this;}public boolean commit(){return true;}}}''',
'android/content/ContentResolver.java':'''package android.content;import java.util.*;public class ContentResolver{public Map<String,Integer> settings=new HashMap<>();}''',
'android/content/Context.java':'''package android.content;import android.content.pm.*;public class Context{
 public String packageName="test";public String getPackageName(){return packageName;}
 public ContentResolver resolver=new ContentResolver();public PackageManager pm=new PackageManager();public SharedPreferences prefs=new SharedPreferences();
 public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}
 public PackageManager getPackageManager(){return pm;}public SharedPreferences getSharedPreferences(String k,int m){return prefs;}}''',
'android/content/pm/ApplicationInfo.java':'package android.content.pm;public class ApplicationInfo{public boolean enabled=true;public int uid=1000;}',
'android/content/pm/ActivityInfo.java':'package android.content.pm;public class ActivityInfo{public boolean enabled;public ApplicationInfo applicationInfo=new ApplicationInfo();}',
'android/content/pm/PackageInfo.java':'package android.content.pm;public class PackageInfo{public long lastUpdateTime=42;}',
'android/content/pm/PackageManager.java':'''package android.content.pm;import android.content.*;import java.util.*;public class PackageManager{
 public static int MATCH_DISABLED_COMPONENTS=1,COMPONENT_ENABLED_STATE_DEFAULT=0,COMPONENT_ENABLED_STATE_ENABLED=1;
 public Map<String,ActivityInfo> pages=new HashMap<>();public Map<String,Integer> states=new HashMap<>();public PackageInfo pkg=new PackageInfo();
 public static class NameNotFoundException extends Exception{}
 public ApplicationInfo getApplicationInfo(String n,int f)throws NameNotFoundException{return new ApplicationInfo();}
 public PackageInfo getPackageInfo(String n,int f)throws NameNotFoundException{return pkg;}
 public ActivityInfo getActivityInfo(ComponentName n,int f)throws NameNotFoundException{if(!pages.containsKey(n.name))throw new NameNotFoundException();return pages.get(n.name);}
 public int getComponentEnabledSetting(ComponentName n){return states.getOrDefault(n.name,0);}}''',
'android/provider/Settings.java':'''package android.provider;import android.content.*;public class Settings{public static class System{
 public static int getInt(ContentResolver r,String k,int d){return r.settings.getOrDefault(k,d);}}}''',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig{public static int VERSION_CODE=42;}',
'ls/augment/com/AppConfig.java':'''package ls.augment.com;import android.content.*;import java.util.*;public class AppConfig{
 public static String DIAGNOSTICS="diagnostics";public static Map<String,String> config=new HashMap<>();AppConfig(Context c){}
 public SaveResult save(Map<String,String> m){config.putAll(m);if("1".equals(m.get(ConfigSchema.NATIVE_ISLAND_SELECTED)))config.put(SystemUiOptions.ISLAND,"0");return new SaveResult();}
 public static class SaveResult{public boolean success=true;public String message="";}}''',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema{public static String NATIVE_ISLAND_SELECTED="native";}',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static String ISLAND="duo";}',
'ls/augment/com/NativeIslandSceneOptions.java':'package ls.augment.com;public class NativeIslandSceneOptions{public static String ENABLED="scenes";public static String key(String id){return ENABLED+"_"+id;}}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.*;import java.util.*;public class FeatureSettings{
 public static Map<String,Boolean> flags=new HashMap<>();public static Map<String,String> diagnostics=new HashMap<>();public static List<Runnable> listeners=new ArrayList<>();
 public static boolean enabled(Context c,String k){return flags.getOrDefault(k,false);}public static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
 public static String diagnosticValue(Context c,String k){return diagnostics.getOrDefault(k,"");}
 public static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}public static void removeSnapshotListener(Runnable r){listeners.remove(r);}
 public static void changed(){for(Runnable r:new ArrayList<>(listeners))r.run();android.os.Handler.drain();}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class AugmentModule{
 public interface Callback{Object run(Chain c)throws Throwable;}public static class Chain{final Method method;final Object owner;Object[] args;
  Chain(Method m,Object o,Object[] a){method=m;owner=o;args=a;}public Object getArg(int i){return args[i];}public Object getThisObject(){return owner;}
  public Object proceed()throws Throwable{return proceed(args);}public Object proceed(Object...a)throws Throwable{method.setAccessible(true);return method.invoke(owner,a);}}
 public static class Hook{Method method;Callback callback;Hook(Method m){method=m;}public Hook intercept(Callback c){callback=c;return this;}}
 public Map<Method,Callback> hooks=new HashMap<>();public Hook prepareFeatureHook(Method m,String id,boolean safe){return new Hook(m);}
 public void registerFeatureHook(Hook h){hooks.put(h.method,h.callback);}public void logFeatureError(String s,Throwable e){throw new AssertionError(s,e);}public void logFeatureInfo(String s){}
 public Object call(Object o,String n,Class<?>[] types,Object...args)throws Throwable{Method m=null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{m=c.getDeclaredMethod(n,types);break;}catch(NoSuchMethodException ignored){}
 if(m==null)throw new NoSuchMethodException(n);Callback cb=hooks.get(m);return cb==null?new Chain(m,o,args).proceed():cb.run(new Chain(m,o,args));}}''',
'com/zte/tools/AppTools.java':'package com.zte.tools;public class AppTools{public static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=true;}',
'com/zte/toolsdk/common/CardMessage.java':'''package com.zte.toolsdk.common;public class CardMessage{public String id;public Object view=new Object(),action=new Object();public CardMessage(String id){this.id=id;}public String getCardId(){return id;}}''',
'com/zte/feature/dynamicisland/PermanentIslandManager.java':'''package com.zte.feature.dynamicisland;import java.util.*;import com.zte.toolsdk.common.*;public class PermanentIslandManager{
 public Map<String,Object> mAppIslandList=new LinkedHashMap<>();public Set<String> nativeDisabled=new HashSet<>();public List<String> removed=new ArrayList<>();public String panel;
 public boolean isDynamicIslandDisabled(String id){return nativeDisabled.contains(id);}public void handleRemoveIsland(String id){mAppIslandList.remove(id);removed.add(id);if(id.equals(panel))panel=null;}
 public void handleCardMessage(CardMessage c,boolean create){if(!nativeDisabled.contains(c.id)&&(create||mAppIslandList.containsKey(c.id)))mAppIslandList.put(c.id,c);}}''',
'com/zte/briefagent/data/config/EnvironmentConfig.java':'package com.zte.briefagent.data.config;import android.content.*;public class EnvironmentConfig{public static boolean nativeSupport=true;public static boolean isFeatureStarryIslandSupported(Context c){return nativeSupport;}}',
'com/zte/briefagent/event/cards/CardContext.java':'package com.zte.briefagent.event.cards;import android.content.*;public class CardContext{public Context c;public CardContext(Context c){this.c=c;}public Context getContext(){return c;}}',
'com/zte/briefagent/event/EventProcessor.java':'package com.zte.briefagent.event;import android.content.*;public class EventProcessor{public void deInit(Context c){}}',
'com/zte/briefagent/event/cards/render/StarryIslandCardRender.java':'''package com.zte.briefagent.event.cards.render;import android.content.*;import java.util.*;public class StarryIslandCardRender{
 public Context context;public Map<String,Object> cardIdToAdapterMap=new LinkedHashMap<>();public List<String> removals=new ArrayList<>();
 public StarryIslandCardRender(Context c){context=c;}public void initCardPusher(){}public void render(List<?> list){}
 private void removeCard(String id){removals.add(id);cardIdToAdapterMap.remove(id);}}''',
}
adapters=[('calendar_meeting','meeting.starryisland.Meeting'),('scenic_guide','electronicguide.starryisland.ElectronicGuide'),
('nearby_charging','charge.starryisland.ChargingReminder'),('cycling','cycling.starryisland.ReturnBike'),('flight','travel.starryisland.Flight'),
('preflight_battery','travel.starryisland.BatteryCharging'),('weather_travel','weather.starryisland.Weather'),('taxi','taxi.starryisland.Taxi'),
('takeout','takeout.notification.Takeout'),('train_12306','travel.starryisland.Train12306'),('train_travel','travel.starryisland.TravelToolTrain')]
for scene,stem in adapters:
    name='com.zte.briefagent.event.scene.'+stem+'StarryIslandAdapter'
    pkg,cls=name.rsplit('.',1)
    files[name.replace('.','/')+'.java']=f'''package {pkg};import com.zte.toolsdk.common.*;import com.zte.briefagent.event.cards.*;
 public class {cls}{{public CardMessage result=new CardMessage("arbitrary_{scene}_id");public String getCardId(CardContext c){{return result.id;}}
 public CardMessage createCardMessage(CardContext c){{return result;}}}}'''
for name in ['NativeIslandMode','NativeIslandControl','MagicIslandPolicy','NativeIslandCardProtocol','hook/MagicIslandScenes','hook/MagicIslandPersonalCards','hook/MagicIslandAppCards','hook/MagicIslandMemorySource']:
    files['ls/augment/com/'+name+'.java']=(SRC/(name+'.java')).read_text(encoding='utf-8')
files['ls/augment/com/TestMagicSelection.java']='''package ls.augment.com;import android.content.*;import android.content.pm.*;import android.os.*;
public class TestMagicSelection{static void check(boolean b,String s){if(!b)throw new AssertionError(s);}public static void run(){
 Context c=new Context();c.pm.pages.put(NativeIslandMode.OLD_PAGE,new ActivityInfo());c.pm.pages.put(NativeIslandMode.NEW_PAGE,new ActivityInfo());
 check(NativeIslandMode.detect(c).equals("unknown"),"both packaged but disabled is not capability");
 c.pm.pages.get(NativeIslandMode.OLD_PAGE).enabled=true;check(NativeIslandMode.detect(c).equals("ordinary"),"legacy entry lost");
 c.pm.pages.get(NativeIslandMode.NEW_PAGE).enabled=true;check(NativeIslandMode.detect(c).equals("fullscreen"),"modern entry not selected");
 c.resolver.settings.put("dynamic_island_switch_state",0);c.resolver.settings.put("dynamic_island_function_switch",1);
 check(NativeIslandMode.enabled(c,"fullscreen")&&!NativeIslandMode.enabled(c,"ordinary"),"independent state keys conflated");
 Bundle b=new Bundle();b.putBoolean("enabled",true);b.putString("mode","fullscreen");AppConfig.config.put("duo","1");
 check(NativeIslandControl.call(c,null,b,1000,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"modern selection rejected because old key is off");
 check("1".equals(AppConfig.config.get("native"))&&"0".equals(AppConfig.config.get("duo")),"selection not exclusive");
 check(!NativeIslandControl.call(c,null,b,101000,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"cross-user caller allowed");
 check(!NativeIslandControl.call(c,null,b,1000,"other",new String[]{"other"}).getBoolean("ok"),"wrong caller allowed");
 c.resolver.settings.put("dynamic_island_function_switch",0);check(!NativeIslandControl.call(c,null,b,1000,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"stale event allowed");
 b.putBoolean("enabled",false);check(NativeIslandControl.call(c,null,b,1000,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"modern OFF rejected");
 b.remove("mode");c.resolver.settings.put("dynamic_island_switch_state",1);b.putBoolean("enabled",true);
 check(NativeIslandControl.call(c,null,b,1000,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"old selection payload lost");
 check(NativeIslandMode.detect(c).equals("ordinary"),"runtime mode publication not authoritative");c.pm.pkg.lastUpdateTime++;
 check(NativeIslandMode.detect(c).equals("fullscreen"),"stale firmware publication reused");
 System.out.println("PASS mode and authenticated selection: branch, setting keys, boot metadata, caller/user, stale events, old protocol");}}
'''
files['ls/augment/com/hook/TestMagicIsland.java']='''package ls.augment.com.hook;
import java.util.*;import android.content.*;import ls.augment.com.*;import com.zte.feature.dynamicisland.*;import com.zte.toolsdk.common.*;
import com.zte.briefagent.event.cards.*;import com.zte.briefagent.event.cards.render.*;import com.zte.briefagent.data.config.*;
public class TestMagicIsland{
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static class Child extends PermanentIslandManager{}static class Bad extends PermanentIslandManager{public String mAppIslandList;}
 public static void main(String[] args)throws Throwable{
 TestMagicSelection.run();Context c=new Context();c.resolver.settings.put("dynamic_island_function_switch",1);
 FeatureSettings.flags.put("native",true);FeatureSettings.flags.put("scenes",true);
 AugmentModule mod=new AugmentModule();check(MagicIslandScenes.install(mod,TestMagicIsland.class.getClassLoader())==2,"receiver contract missing");
 Child host=new Child();MagicIslandScenes gate=new MagicIslandScenes(c,host);gate.start();
 for(String id:new String[]{"charging_island","media_island","zte.com.cn.alarmclock_timer_countdown","com.zte.cn.zteshare_share_transfer","cn.zte.aigcinput_notebook_ai_text_generation_progress",
 "cn.zte.recorder_recorder_background","com.android.dialer_call_background","com.zte.nebulatranslation_transcription","com.zte.nebulatranslation_call","com.zte.multscr_com.zte.multscr.share_transfer","com.zte.ai.knowledge_aik_island_main_card"}){
  String scene=MagicIslandPolicy.scene(id);check(scene!=null,"missing core scene");
  check(Boolean.TRUE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},id)),"OFF not enforced");
  FeatureSettings.flags.put("scenes_"+scene,true);CardMessage message=new CardMessage(id);
  mod.call(host,"handleCardMessage",new Class[]{CardMessage.class,boolean.class},message,false);
  check(host.mAppIslandList.get(id)==message,"live UPDATE not restored or native payload changed");host.panel=id;
  FeatureSettings.flags.put("scenes_"+scene,false);FeatureSettings.changed();check(!host.mAppIslandList.containsKey(id)&&host.panel==null,"active card/panel not removed");
  FeatureSettings.flags.put("scenes_"+scene,true);FeatureSettings.changed();check(!host.mAppIslandList.containsKey(id),"stale card replayed");
  host.nativeDisabled.add(id);check(Boolean.TRUE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},id)),"OEM gate overridden");host.nativeDisabled.clear();
 }
 CardMessage unknown=new CardMessage("unknown_scene");mod.call(host,"handleCardMessage",new Class[]{CardMessage.class,boolean.class},unknown,true);
 check(host.mAppIslandList.get(unknown.id)==unknown,"unknown card modified");
 host.nativeDisabled.add("com.zte.multscr.share_transfer");FeatureSettings.flags.put("scenes_nfc_transfer",true);
 check(Boolean.TRUE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},"com.zte.multscr_com.zte.multscr.share_transfer")),"NFC prefixed wire ID bypassed native shared-transfer switch");
 host.nativeDisabled.clear();
 FeatureSettings.flags.put("scenes",false);FeatureSettings.flags.put("scenes_media",false);
 check(Boolean.FALSE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},"media_island")),"master OFF did not restore native behavior");
 CardMessage absent=new CardMessage("zte.com.cn.alarmclock_timer_countdown");mod.call(host,"handleCardMessage",new Class[]{CardMessage.class,boolean.class},absent,false);
 check(!host.mAppIslandList.containsKey(absent.id),"master OFF altered native UPDATE semantics");
 FeatureSettings.flags.put("scenes",true);FeatureSettings.flags.put("duo",true);
 check(Boolean.FALSE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},"media_island")),"inactive owner still filters");FeatureSettings.flags.put("duo",false);
 gate.close();check(Boolean.FALSE.equals(mod.call(host,"isDynamicIslandDisabled",new Class[]{String.class},"media_island")),"closed host still filters");
 boolean rejected=false;try{new MagicIslandScenes(c,new Bad());}catch(NoSuchFieldException expected){rejected=true;}check(rejected,"shadowed incompatible field accepted");
 rejected=false;try{new MagicIslandScenes(c,new Object());}catch(NoSuchMethodException expected){rejected=true;}check(rejected,"unknown host accepted");
 AugmentModule source=new AugmentModule();MagicIslandPersonalCards.install(source,TestMagicIsland.class.getClassLoader());
 StarryIslandCardRender renderer=new StarryIslandCardRender(c);source.call(renderer,"initCardPusher",new Class[]{});android.os.Handler.drain();
 String[][] specs=// ADAPTERS
 for(String[] spec:specs){Object a=Class.forName("com.zte.briefagent.event.scene."+spec[1]+"StarryIslandAdapter").getConstructor().newInstance();CardContext cc=new CardContext(c);
  check(source.call(a,"createCardMessage",new Class[]{CardContext.class},cc)==null,"disabled producer returned a card");
  FeatureSettings.flags.put("scenes_"+spec[0],true);Object result=source.call(a,"createCardMessage",new Class[]{CardContext.class},cc);
  check(result==a.getClass().getField("result").get(a),"source views/actions changed");
  String key="arbitrary-not-inferred-"+spec[0];renderer.cardIdToAdapterMap.put(key,a);
  FeatureSettings.flags.put("scenes_"+spec[0],false);FeatureSettings.changed();check(renderer.removals.contains(key),"existing producer card not removed via OEM");
  FeatureSettings.flags.put("scenes_"+spec[0],true);FeatureSettings.changed();check(!renderer.cardIdToAdapterMap.containsKey(key),"expired business data replayed");
 }
 Object other=new Object();renderer.cardIdToAdapterMap.put("unregistered",other);FeatureSettings.changed();check(renderer.cardIdToAdapterMap.containsKey("unregistered"),"unknown adapter withdrawn");
 Object taxi=Class.forName("com.zte.briefagent.event.scene.taxi.starryisland.TaxiStarryIslandAdapter").getConstructor().newInstance();
 FeatureSettings.flags.put("scenes_taxi",false);EnvironmentConfig.nativeSupport=false;
 check(source.call(taxi,"createCardMessage",new Class[]{CardContext.class},new CardContext(c))!=null,"legacy source changed");
 source.call(new com.zte.briefagent.event.EventProcessor(),"deInit",new Class[]{Context.class},c);
 check(FeatureSettings.listeners.isEmpty(),"source/host lifecycle leaked listeners");
 TestMagicApp.run();
 TestMagicMemory.run();
 System.out.println("PASS production magic island receiver/personal hooks: "+checks+" assertions; active withdrawal, native gates, payload identity, lifecycle and no stale replay");
 }}'''.replace('// ADAPTERS','new String[][]{'+','.join('{"'+s+'","'+n+'"}' for s,n in adapters)+'};')
files.update({
'com/zte/toolsdk/widget/RemoteViews.java':'package com.zte.toolsdk.widget;public class RemoteViews{}',
'com/zte/toolsdk/producer/CardPusher.java':'''package com.zte.toolsdk.producer;import android.content.*;import com.zte.toolsdk.common.*;
public class CardPusher{private Context mContext;private String mTargetPackage;public boolean connects=true;public CardMessage last;public int pushes,updates,removes;
 public CardPusher(Context c,String t){mContext=c;mTargetPackage=t;}public boolean connect(){return connects;}public boolean isConnected(){return connects;}public void disconnect(){}
 public boolean pushCard(CardMessage c){last=c;pushes++;return connects;}public boolean updateCard(CardMessage c){last=c;updates++;return connects;}
 public boolean removeCard(String id){removes++;return true;}public interface OnCardMessageActionListener{void action(String id,int p,int v,Object o);}
 public void setOnCardMessageActionListener(OnCardMessageActionListener l){} }''',
'cn/zte/recorder/common/helper/CardPusherHelper.java':'''package cn.zte.recorder.common.helper;public class CardPusherHelper{
 public enum CardType{TYPE_RECORD}public enum RecordState{IDLE,RECORDING,SAVED}public interface CardActionListener{void onCardItemClick(CardType t,int i);}
 public static void updateCard(CardType c,RecordState s,long t,boolean camera,boolean dark){}public static void removeCard(CardType t){}
 public static void setCardActionListener(CardActionListener l){} }''',
'cn/zte/recorder/common/config/CommonConfig.java':'package cn.zte.recorder.common.config;public class CommonConfig{public static boolean supportFullScreenLiveIsland(){return true;}}',
'com/android/incallui/zte/island/IslandCardManager.java':'''package com.android.incallui.zte.island;import com.zte.toolsdk.widget.*;public class IslandCardManager{
 private RemoteViews createSmallRemoteViews(){return new RemoteViews();}private RemoteViews createLargeRemoteViews(){return new RemoteViews();}
 private RemoteViews createMiniRemoteViews(){return new RemoteViews();}private void handleLargeIslandClick(int id){}private void handleSmallIslandClick(){}public void removeAllCards(){} }''',
'kotlin/coroutines/Continuation.java':'package kotlin.coroutines;public interface Continuation{}',
'com/zte/nebulatranslation/data/entity/IsLandCardData.java':'package com.zte.nebulatranslation.data.entity;public class IsLandCardData{}',
'com/zte/nebulatranslation/ui/IslandManager.java':'''package com.zte.nebulatranslation.ui;import kotlin.coroutines.*;import com.zte.toolsdk.common.*;import com.zte.toolsdk.producer.*;
public class IslandManager{public Object notify(String id,CardMessage c,Continuation k){return null;}public Object cancel(String id,Continuation k){return null;}
public void setCardMessageActionListener(CardPusher.OnCardMessageActionListener l){} }''',
'com/zte/multscr/nfc/NfcFileTransCardMgr.java':'''package com.zte.multscr.nfc;import android.content.*;import com.zte.toolsdk.common.*;import java.util.*;
public class NfcFileTransCardMgr{private void pushOrUpdateCard(Context c,CardMessage m){}public void handleCardAction(Context c,int v){}public void removeCard(String c,List<?> l){}
 public void showProgressCard(Context c,Integer p,boolean s,boolean ios){}public void showSucceedCard(Context c,String t,boolean s){}public void showFailedCard(Context c,String t,boolean s){}
 public void showWaitReceiveCard(Context c,boolean ios){}public void showRefusedCanceledCard(Context c,boolean s,boolean self,boolean ios){}
 public void showAcceptOrNotCard(Context c){}public void showIosConnectingCard(Context c){} }''',
'com/zte/zmemory/foundation/card/CardInfo.java':'''package com.zte.zmemory.foundation.card;import android.os.*;public class CardInfo{
 public int state;public Bundle jump=new Bundle();public CardInfo(String key,int s){state=s;jump.putString("guid",key);}public int getStatus(){return state;}public Bundle getJumpExtras(){return jump;} }''',
'com/zte/zmemory/foundation/card/BaseCardPusher.java':'''package com.zte.zmemory.foundation.card;public class BaseCardPusher{
 public CardInfo current;public int inits;public boolean init(){inits++;return true;}public CardInfo getCardInfo(String id){return current;}
 private static final String FIXED_ISLAND_CARD_ID="aik_island_main_card";public boolean pushCard(CardInfo c){return true;}
 public CardInfo removeCardImmediately(String id){return null;}private void handleCardClickInternal(String id,int view){} }''',
'com/zte/zmemory/foundation/card/CardIslandPusher.java':'''package com.zte.zmemory.foundation.card;import com.zte.toolsdk.widget.*;public class CardIslandPusher extends BaseCardPusher{
 public static final CardIslandPusher INSTANCE=new CardIslandPusher();public static CardIslandPusher getInstance(android.content.Context c){return INSTANCE;}
 protected RemoteViews createLargeCard(CardInfo c){return new RemoteViews();}protected RemoteViews createSmallCard(CardInfo c){return new RemoteViews();}
 protected RemoteViews createMiniCard(CardInfo c){return new RemoteViews();}public boolean onCardClick(CardInfo c){return true;} }''',
'com/zte/zmemory/foundation/card/ClickFavoriteCardPusher.java':'''package com.zte.zmemory.foundation.card;import android.content.*;import java.util.*;public class ClickFavoriteCardPusher{
 private Context mContext;public static List<String> events=new ArrayList<>();public boolean fail;public ClickFavoriteCardPusher(Context c){mContext=c;}
 private void emit(String k,int state){if(fail)throw new IllegalStateException("fixture");events.add(k+":"+state);CardIslandPusher.INSTANCE.current=new CardInfo(k,state);}
 public void pushProcessingCard(String k,String t,String s){emit(k,1);}public void pushSuccessCard(String k,String t,String s,String u){emit(k,0);}
 public void pushFailedCard(String k,String r){emit(k,2);}public void pushCancelledCard(String k){emit(k,3);} }''',
'com/zte/zmemory/memorycore/generation/IShortTermToLongTermPipeline.java':'''package com.zte.zmemory.memorycore.generation;import java.util.*;
public interface IShortTermToLongTermPipeline{class RawData{public Map<String,String> data=new HashMap<>();public String getMetadata(String key){return data.get(key);}}}''',
'com/zte/zmemory/memorycore/generation/pipeline/source/ClickFavoritePipelineSource.java':'''package com.zte.zmemory.memorycore.generation.pipeline.source;
import java.util.*;import com.zte.zmemory.foundation.card.*;public class ClickFavoritePipelineSource{
 private final ClickFavoriteCardPusher cardPusher;public List<?> rows;public int calls;public ClickFavoritePipelineSource(ClickFavoriteCardPusher p){cardPusher=p;}
 public List<?> getPending(int limit){calls++;return rows;} }''',
'com/zte/zmemory/memorycore/generation/operator/production/ClickFavoriteIslandNotifyOperator.java':'''package com.zte.zmemory.memorycore.generation.operator.production;
import java.util.*;import com.zte.zmemory.foundation.card.*;public class ClickFavoriteIslandNotifyOperator{
 private final ClickFavoriteCardPusher notifier;public int calls;public ClickFavoriteIslandNotifyOperator(ClickFavoriteCardPusher p){notifier=p;}
 public List<?> process(List<?> rows){calls++;return rows;} }''',
})
for factory in ['Transcription','CallAssistant']:
    files['com/zte/nebulatranslation/domain/'+factory+'IslandCardMessageFactory.java']='''package com.zte.nebulatranslation.domain;
import kotlin.coroutines.*;import com.zte.nebulatranslation.data.entity.*;public class %sIslandCardMessageFactory{public Object create(IsLandCardData d,Continuation c){return null;}}'''%factory
files['ls/augment/com/hook/TestMagicApp.java']='''package ls.augment.com.hook;
import java.util.*;import android.content.*;import android.content.pm.*;import ls.augment.com.*;import com.zte.toolsdk.common.*;import com.zte.toolsdk.producer.*;
public class TestMagicApp{static int n;static void check(boolean b,String s){n++;if(!b)throw new AssertionError(s);}
public static void run()throws Throwable{
 ClassLoader loader=TestMagicApp.class.getClassLoader();
 for(String[] item:new String[][]{{"record","cn.zte.recorder","recorder_background"},{"call","com.android.dialer","call_background"},
 {"meeting","com.zte.nebulatranslation","transcription"},{"ai","com.zte.nebulatranslation","call"},{"nfc_transfer","com.zte.multscr","com.zte.multscr.share_transfer"},{"ai_memory","com.zte.ai.knowledge","aik_island_main_card"}}){
  String scene=item[0],pkg=item[1],id=item[2];MagicIslandAppCards.verify(loader,scene);
  Context c=new Context();c.packageName=pkg;c.resolver.settings.put("dynamic_island_function_switch",1);ActivityInfo entry=new ActivityInfo();entry.enabled=true;c.pm.pages.put(NativeIslandMode.NEW_PAGE,entry);
  FeatureSettings.flags.clear();FeatureSettings.flags.put("native",true);FeatureSettings.flags.put("scenes",true);
  AugmentModule m=new AugmentModule();MagicIslandAppCards.install(m,loader,pkg);CardPusher p=new CardPusher(c,"com.android.systemui");
  m.call(p,"connect",new Class[]{});check("ready:42:42".equals(FeatureSettings.diagnostics.get("scenes_"+scene+"_magic_source_capability")),"connected source not ready");
  CardMessage card=new CardMessage(id);Object action=card.action,view=card.view;
  check(Boolean.FALSE.equals(m.call(p,"pushCard",new Class[]{CardMessage.class},card))&&p.pushes==0,"disabled PUSH reached SDK");
  check(Boolean.FALSE.equals(m.call(p,"updateCard",new Class[]{CardMessage.class},card))&&p.updates==0,"disabled UPDATE reached SDK");
  FeatureSettings.flags.put("scenes_"+scene,true);m.call(p,"pushCard",new Class[]{CardMessage.class},card);m.call(p,"updateCard",new Class[]{CardMessage.class},card);
  check(p.last==card&&p.last.action==action&&p.last.view==view&&p.pushes==1&&p.updates==1,"native content/action/lifecycle replaced");
  m.call(p,"removeCard",new Class[]{String.class},id);check(p.removes==1,"native remove blocked");
  check(scene.equals(MagicIslandAppCards.scene(pkg,pkg+"_"+id)),"full SDK ID mapping failed");
  FeatureSettings.flags.put("scenes_"+scene,false);CardMessage other=new CardMessage("unregistered");m.call(p,"pushCard",new Class[]{CardMessage.class},other);check(p.last==other,"unknown scene blocked");
  CardPusher launcher=new CardPusher(c,"com.zte.mifavor.launcher");m.call(launcher,"pushCard",new Class[]{CardMessage.class},card);check(launcher.last==card,"unrelated target altered");
  FeatureSettings.flags.put("scenes",false);m.call(p,"pushCard",new Class[]{CardMessage.class},card);check(p.last==card,"master OFF did not restore native");
  FeatureSettings.flags.put("scenes",true);entry.enabled=false;m.call(p,"updateCard",new Class[]{CardMessage.class},card);check(p.updates==2,"old/unknown mode intercepted");entry.enabled=true;
  entry.enabled=false;FeatureSettings.diagnostics.put(NativeIslandMode.DIAGNOSTIC,NativeIslandMode.stamp(c,NativeIslandMode.MODERN));
  m.call(p,"pushCard",new Class[]{CardMessage.class},card);check(p.pushes==3,"foreign source ignored live SystemUI mode publication");
  FeatureSettings.diagnostics.put(NativeIslandMode.DIAGNOSTIC,"fullscreen:41:42");entry.enabled=true;
  m.call(p,"updateCard",new Class[]{CardMessage.class},card);check(p.updates==3,"stale mode publication accepted");FeatureSettings.diagnostics.remove(NativeIslandMode.DIAGNOSTIC);
  m.call(p,"disconnect",new Class[]{});check(FeatureSettings.diagnostics.get("scenes_"+scene+"_magic_source_capability").equals("unavailable:disconnected"),"disconnect left ready");
  p.connects=false;m.call(p,"connect",new Class[]{});check(!FeatureSettings.diagnostics.get("scenes_"+scene+"_magic_source_capability").startsWith("ready:"),"failed connection accepted");
 }
 ClassLoader missing=new ClassLoader(loader){public Class<?> loadClass(String name)throws ClassNotFoundException{if(name.endsWith("TranscriptionIslandCardMessageFactory"))throw new ClassNotFoundException(name);return super.loadClass(name);}};
 boolean rejected=false;try{MagicIslandAppCards.verify(missing,"meeting");}catch(ClassNotFoundException expected){rejected=true;}check(rejected,"missing factory accepted");
 MagicIslandAppCards.verify(missing,"ai");check(true,"one missing scene must not reject another valid factory");
 check(MagicIslandAppCards.scene("com.android.dialer","com.zte.nebulatranslation_call")==null,"sender mismatch accepted");
 for(String id:new String[]{"face","torch","low_power","bluetooth","headset"})check(!MagicIslandPolicy.managed(id)&&!MagicIslandPolicy.unavailable(id).isEmpty(),"unsupported branch selectable");
 check(MagicIslandAppCards.scene("com.zte.vlm_agent","auto_execute")==null,"one-step AI misclassified as memory");
 System.out.println("PASS production app source hooks: "+n+" assertions; identity, dispatch, removal, native-only fallback, disconnect and missing contracts");
}}'''
files['ls/augment/com/hook/TestMagicMemory.java']='''package ls.augment.com.hook;
import java.util.*;import android.content.*;import com.zte.zmemory.foundation.card.*;
import com.zte.zmemory.memorycore.generation.IShortTermToLongTermPipeline.RawData;
import com.zte.zmemory.memorycore.generation.pipeline.source.*;import com.zte.zmemory.memorycore.generation.operator.production.*;
public class TestMagicMemory{static int n;static boolean selected=true;static void check(boolean b,String s){n++;if(!b)throw new AssertionError(s);}
 static RawData row(String key,String content){RawData r=new RawData();if(key!=null)r.data.put("l1_memory_id",key);if(content!=null)r.data.put("ai_content",content);return r;}
 public static void run()throws Throwable{
  Context c=new Context();AugmentModule m=new AugmentModule();new MagicIslandMemorySource(m,TestMagicMemory.class.getClassLoader(),ctx->selected);
  ClickFavoriteCardPusher p=new ClickFavoriteCardPusher(c);ClickFavoritePipelineSource source=new ClickFavoritePipelineSource(p);
  ClickFavoriteIslandNotifyOperator op=new ClickFavoriteIslandNotifyOperator(p);RawData raw=row("real-guid-1",null);List<?> rows=Arrays.asList(raw);
  source.rows=rows;FeatureSettings.flags.put("scenes",true);FeatureSettings.flags.put("scenes_ai_memory",false);
  Object result=m.call(source,"getPending",new Class[]{int.class},10);check(result==rows&&source.calls==1,"native collection/identity changed");
  check(ClickFavoriteCardPusher.events.isEmpty()&&CardIslandPusher.INSTANCE.inits==1,"disabled source fabricated a card or cannot discover transport");
  FeatureSettings.flags.put("scenes_ai_memory",true);m.call(source,"getPending",new Class[]{int.class},10);
  check(ClickFavoriteCardPusher.events.equals(Arrays.asList("real-guid-1:1")),"real pending collection not sent to native factory");
  m.call(source,"getPending",new Class[]{int.class},10);check(ClickFavoriteCardPusher.events.size()==1,"duplicate pending reset native timeout");
  raw.data.put("ai_content","fixture result");result=m.call(op,"process",new Class[]{List.class},rows);
  check(result==rows&&op.calls==1&&ClickFavoriteCardPusher.events.get(1).equals("real-guid-1:0"),"real completion not preserved/published");
  m.call(source,"getPending",new Class[]{int.class},10);check(ClickFavoriteCardPusher.events.size()==2,"completed collection regressed to processing");
  List<?> missing=Arrays.asList(row(null,"fixture result"));m.call(op,"process",new Class[]{List.class},missing);check(ClickFavoriteCardPusher.events.size()==2,"invented missing identity");
  List<?> failed=Arrays.asList(row("real-guid-2",null));m.call(op,"process",new Class[]{List.class},failed);check(ClickFavoriteCardPusher.events.get(2).equals("real-guid-2:2"),"missing result claimed success");
  CardIslandPusher.INSTANCE.current=new CardInfo("native-already-sent",0);m.call(op,"process",new Class[]{List.class},Arrays.asList(row("native-already-sent","fixture")));
  check(ClickFavoriteCardPusher.events.size()==3,"duplicate native producer invocation");
  m.call(p,"pushCancelledCard",new Class[]{String.class},"cancelled");m.call(op,"process",new Class[]{List.class},Arrays.asList(row("cancelled","fixture")));
  check(ClickFavoriteCardPusher.events.equals(Arrays.asList("real-guid-1:1","real-guid-1:0","real-guid-2:2","cancelled:3")),"cancellation overwritten");
  selected=false;source.rows=Arrays.asList(row("legacy",null));m.call(source,"getPending",new Class[]{int.class},10);check(ClickFavoriteCardPusher.events.size()==4,"legacy path supplemented");
  selected=true;p.fail=true;source.rows=Arrays.asList(row("failing",null));result=m.call(source,"getPending",new Class[]{int.class},10);check(result==source.rows,"card failure broke collection");
  System.out.println("PASS production memory pipeline bridge: "+n+" assertions; true source identity, processing/result/cancel, native expiry ownership, de-duplication, no invented data, legacy and failure fallback");
 }}'''
with tempfile.TemporaryDirectory(prefix='duo-magic-') as temp:
    folder=Path(temp)
    for name,source in files.items():
        target=folder/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(source,encoding='utf-8')
    java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestMagicIsland'],check=True,timeout=30)
