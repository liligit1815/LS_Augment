"""Dialer card selection, original notifications, actual-state recovery and owned connections."""
from pathlib import Path
import ast, os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
base=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets)))
tree=ast.parse((ROOT/'tools/test-native-island-transfer-cards.py').read_text(encoding='utf-8'))
extra=ast.literal_eval(next(n.value.args[0] for n in tree.body if isinstance(n,ast.Expr) and isinstance(n.value,ast.Call) and isinstance(n.value.func,ast.Attribute) and n.value.func.attr=='update'))
base.update(extra)
files={k:v for k,v in base.items() if (k.startswith('android/') or k.startswith('ls/augment/com/')) and 'TestClockSource' not in k and 'TestTransferCards' not in k}
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('class AugmentModule {','public class AugmentModule {').replace('static Object invoke(', 'public static Object invoke(').replace('type.getMethod(name,signature);','type.getDeclaredMethod(name,signature);m.setAccessible(true);')
files['android/content/Context.java']=files['android/content/Context.java'].replace('com.zte.cn.zteshare','com.android.dialer').replace('public static final int','public Resources getResources(){return new Resources();}public static class Resources {public static boolean missing;public int getIdentifier(String n,String t,String p){return missing?0:1;}}public static final int')
files['android/content/Intent.java']=files['android/content/Intent.java'].replace('public class Intent {','public class Intent {public boolean from;public boolean getBooleanExtra(String k,boolean d){return from;}')
for key in ['com/zte/toolsdk/common/CardMessage.java','com/zte/toolsdk/common/CardProviderContract.java','com/zte/toolsdk/producer/CardPusher.java']:
    files[key]=extra[key].replace('m.sender="com.zte.cn.zteshare"','m.sender=mContext.getPackageName()')
files.update({
'com/android/incallui/Bridge.java':'''package com.android.incallui;public class Bridge {public static Object call(Object o,Class<?> t,String n,Class<?>[] p,Object...a){try{return ls.augment.com.hook.AugmentModule.invoke(o,t,n,p,a);}catch(Throwable e){throw new RuntimeException(e);}}public static boolean mode(){return (Boolean)call(null,com.android.incallui.zte.Feature.class,"isSupportIslandCardMode",new Class<?>[0]);}}''',
'com/android/incallui/InCallApp.java':'''package com.android.incallui;public class InCallApp extends android.content.Context {public static android.content.Context context;public void onCreate(){context=this;}public static android.content.Context getAppContext(){return context;}}''',
'com/android/incallui/zte/Feature.java':'''package com.android.incallui.zte;public class Feature {public static boolean ZTE_FEATURE_ISLAND_CARD_MODE,nativeSetting;public static boolean isSupportIslandCardMode(){return ZTE_FEATURE_ISLAND_CARD_MODE&&nativeSetting;}}''',
'com/android/incallui/Call.java':'''package com.android.incallui;public class Call {public int getState(){return 3;}public long getConnectTimeMillis(){return 100;}}''',
'com/android/incallui/CallList.java':'''package com.android.incallui;public class CallList {public static CallList INSTANCE=new CallList();public Call actual;public int count;public static CallList getInstance(){return INSTANCE;}public int getLiveCallCount(){return count;}}''',
'com/android/incallui/ContactInfoCache.java':'''package com.android.incallui;public class ContactInfoCache {public static class ContactCacheEntry{}}''',
'com/android/incallui/StatusBarNotifier.java':'''package com.android.incallui;public class StatusBarNotifier {public boolean hasActions,throwing;private void buildAndSendNotification(Call c,ContactInfoCache.ContactCacheEntry e){hasActions=!Bridge.mode();if(throwing)throw new IllegalStateException("native notification error");}}''',
'com/android/incallui/zte/FloatWindowService.java':'''package com.android.incallui.zte;import android.content.*;public class FloatWindowService {public static boolean running;public static int stops;public int onStartCommand(Intent i,int f,int s){running=true;return 1;}public void onDestroy(){running=false;}public static boolean isFloatWindowServiceRunning(){return running;}public static void stopMyService(Context c){stops++;}}''',
'com/android/incallui/zte/FloatViewManager.java':'''package com.android.incallui.zte;import android.content.Context;import com.android.incallui.*;import com.android.incallui.zte.island.IslandCardManager;
class BaseFloat {public Context mContext;}
public class FloatViewManager extends BaseFloat {public static FloatViewManager sInstance=new FloatViewManager(){};public boolean legacy,foreground,game;public int resync,stoppedTimers;private void removeTimeUpdateMessage(){stoppedTimers++;}
 public void updateVisibilityDB(boolean v){legacy=v;}public void maybeShowFloatView(){resync++;if(mContext==null)return;
 if(Bridge.mode()){legacy=false;if(!foreground&&!game&&CallList.INSTANCE.actual!=null)IslandCardManager.getInstance().showIslandCardForActiveCall(mContext);else IslandCardManager.getInstance().removeAllCards();}
 else legacy=!foreground&&!game&&CallList.INSTANCE.actual!=null;}}
''',
'com/android/incallui/zte/island/IslandCardManager.java':'''package com.android.incallui.zte.island;import android.content.Context;import com.android.incallui.*;import com.zte.toolsdk.producer.CardPusher;import com.zte.toolsdk.common.CardMessage;
public class IslandCardManager {public static IslandCardManager sInstance=new IslandCardManager();public CardPusher mCardPusher;public Context mContext;public CardMessage mCurrentCardMessage;public Call mCall;public String mCallId;public boolean mCallListListenerRegistered;
 public static IslandCardManager getInstance(){return sInstance;}public void init(Context c){mContext=c;if(mCardPusher==null)mCardPusher=new CardPusher(c);Bridge.call(mCardPusher,CardPusher.class,"connect",new Class<?>[0]);mCallListListenerRegistered=true;}
 private void handleSmallIslandClick(){}private static Call resolveCallForIslandUi(CallList l){return l.actual;}boolean wouldShowStarIslandWhenLeavingInCallUi(Context c){return CallList.INSTANCE.actual!=null;}
 private boolean tryWaitLauncherIslandEnterAnimEndThenShow(Context c,boolean fallback){return true;}
 public void showIslandCardForActiveCall(Context c){if(CallList.INSTANCE.actual==null)return;Bridge.call(this,getClass(),"init",new Class<?>[]{Context.class},c);mCall=CallList.INSTANCE.actual;mCallId="real-source-call";mCurrentCardMessage=new CardMessage("call_background",3);Bridge.call(mCardPusher,CardPusher.class,"pushCard",new Class<?>[]{CardMessage.class},mCurrentCardMessage);}
 public void removeAllCards(){if(mCardPusher!=null&&mCurrentCardMessage!=null)Bridge.call(mCardPusher,CardPusher.class,"removeCard",new Class<?>[]{String.class},"call_background");mCurrentCardMessage=null;mCall=null;mCallId=null;}public void destroy(){removeAllCards();mContext=null;}}
''',
'ls/augment/com/hook/TestCallCards.java':'''package ls.augment.com.hook;import android.content.*;import android.os.Handler;import com.android.incallui.*;import com.android.incallui.zte.*;import com.android.incallui.zte.island.*;import com.zte.toolsdk.producer.CardPusher;
public class TestCallCards {static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}static final Class<?>[] NONE=new Class<?>[0];
 static void recover(InCallApp c){c.receiver.onReceive(c,new Intent(NativeIslandScenePolicy.CALL_SYNC_ACTION));Handler.flush();}
 static class MissingLoader extends ClassLoader {MissingLoader(){super(TestCallCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith("FloatWindowService"))throw new ClassNotFoundException(n);return super.loadClass(n);}}
 public static class WrongFeature {public static String ZTE_FEATURE_ISLAND_CARD_MODE="not a boolean";}
 static class WrongFieldLoader extends ClassLoader {WrongFieldLoader(){super(TestCallCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.equals("com.android.incallui.zte.Feature"))return WrongFeature.class;return super.loadClass(n);}}
 public static void main(String[]a)throws Throwable {AugmentModule m=new AugmentModule();NativeIslandCallCards.install(m,TestCallCards.class.getClassLoader());check(m.errors==0&&AugmentModule.hooks.size()==14,"full method and field contracts preflight");
 check(!Bridge.mode(),"no application context retains original capability");InCallApp c=new InCallApp();AugmentModule.invoke(c,InCallApp.class,"onCreate",NONE);FloatViewManager f=FloatViewManager.sInstance;f.mContext=c;
 check(c.resolver.observers==1&&NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(c.requiredPermission),"live config and privileged host recovery registered");check(!Bridge.mode(),"all switches default off");
 FeatureSettings.change("native",true);FeatureSettings.change("master",true);check(!Bridge.mode(),"child selection required");FeatureSettings.change("call",true);NativeIslandCardClient.ready=false;check(!Bridge.mode(),"missing live display cannot enable card mode");NativeIslandCardClient.ready=true;check(Bridge.mode(),"opted-in capable source uses real card mode");
 IslandCardManager owner=IslandCardManager.sInstance;check(!(Boolean)AugmentModule.invoke(owner,IslandCardManager.class,"tryWaitLauncherIslandEnterAnimEndThenShow",new Class<?>[]{Context.class,boolean.class},c,false),"ordinary host cannot wait forever for absent full-screen launcher animation");
 StatusBarNotifier notices=new StatusBarNotifier();Class<?>[] notification={Call.class,ContactInfoCache.ContactCacheEntry.class};AugmentModule.invoke(notices,StatusBarNotifier.class,"buildAndSendNotification",notification,new Call(),new ContactInfoCache.ContactCacheEntry());check(notices.hasActions&&Bridge.mode(),"native notification actions preserved without losing source selection");
 notices.throwing=true;boolean threw=false;try{AugmentModule.invoke(notices,StatusBarNotifier.class,"buildAndSendNotification",notification,new Call(),new ContactInfoCache.ContactCacheEntry());}catch(Throwable ex){threw=true;}notices.throwing=false;check(threw&&Bridge.mode(),"notification exception restores scoped feature decision");
 CallList.INSTANCE.actual=new Call();CallList.INSTANCE.count=1;f.maybeShowFloatView();CardPusher p=owner.mCardPusher;Object listener=p.originalActions;check(p.cards.size()==1&&!f.legacy&&c.resolver.unstable==1,"original producer publishes real source call with owned unstable client");
 check(owner.mCall==CallList.INSTANCE.actual&&p.originalActions==listener,"original CallList object and action listener retained");
 check(f.getClass()!=FloatViewManager.class&&f.mContext==c,"subclass instance and inherited context field accepted");
 check(f.stoppedTimers>0,"adopting live card stops obsolete legacy timer loop");
 FeatureSettings.change("call",false);check(p.cards.isEmpty()&&p.mClient==null&&f.legacy,"opt out withdraws card and restores original live call path");FeatureSettings.change("call",true);check(p.cards.size()==1&&!f.legacy,"reenable re-evaluates actual call and restores card");
 ContentProviderClient before=p.mClient;recover(c);check(before.closed&&p.cards.size()==1&&p.mClient!=before,"host recovery recreates from current call list and reconnects");
 CallList.INSTANCE.actual=null;recover(c);check(p.cards.isEmpty()&&owner.mCurrentCardMessage==null,"ended call cannot be replayed from stale cached card");
 CallList.INSTANCE.actual=new Call();f.foreground=true;recover(c);check(p.cards.isEmpty(),"foreground call remains hidden by original source rules");f.foreground=false;f.game=true;recover(c);check(p.cards.isEmpty(),"original game suppression remains effective");f.game=false;recover(c);
 NativeIslandCardClient.ready=false;f.maybeShowFloatView();recover(c);check(p.cards.isEmpty()&&f.legacy,"unavailable host restores native call path");NativeIslandCardClient.ready=true;recover(c);check(p.cards.size()==1,"host returns with same ongoing source call");
 p.fail=true;f.maybeShowFloatView();Handler.flush();check(!Bridge.mode()&&f.legacy&&p.cards.isEmpty(),"publication failure restores native controls rather than a fake enabled mode");p.fail=false;recover(c);check(Bridge.mode()&&p.cards.size()==1,"verified recovery clears transient transport failure");
 Intent click=new Intent("source-click");click.from=true;FloatWindowService window=new FloatWindowService();AugmentModule.invoke(window,FloatWindowService.class,"onStartCommand",new Class<?>[]{Intent.class,int.class,int.class},click,0,0);FeatureSettings.change("call",false);check(FloatWindowService.stops==1&&Bridge.mode(),"opt out stops only island-opened UI while retaining its style until destroy");
 AugmentModule.invoke(window,FloatWindowService.class,"onDestroy",NONE);Handler.flush();check(!Bridge.mode()&&f.legacy,"floating UI teardown restores normal call path without hanging up");FeatureSettings.change("call",true);
 before=p.mClient;ContentProviderClient foreign=new ContentProviderClient();p.mClient=foreign;int releases=p.releases;recover(c);check(before.closed&&!foreign.closed&&p.mClient==foreign&&p.releases==releases,"later foreign connection remains owned by its creator");
 Feature.ZTE_FEATURE_ISLAND_CARD_MODE=true;Feature.nativeSetting=false;check(!Bridge.mode(),"native full-screen hardware retains its user's native switch");Feature.nativeSetting=true;check(Bridge.mode(),"native full-screen enabled path stays original");Feature.ZTE_FEATURE_ISLAND_CARD_MODE=false;
 check(NativeIslandCallCards.knownId("com.android.dialer_call_background")&&!NativeIslandCallCards.knownId("com.zte.nebulatranslation_call"),"only dialer background call wire identity accepted");
 AugmentModule.hooks.clear();NativeIslandCallCards.install(m,new MissingLoader());check(AugmentModule.hooks.isEmpty(),"missing floating service installs no partial hooks");
 NativeIslandCallCards.install(m,new WrongFieldLoader());check(AugmentModule.hooks.isEmpty(),"wrong hardware field type installs no partial hooks");
 NativeIslandCallCards.install(m,TestCallCards.class.getClassLoader());Context.Resources.missing=true;InCallApp incomplete=new InCallApp();AugmentModule.invoke(incomplete,InCallApp.class,"onCreate",NONE);check(!Bridge.mode()&&incomplete.resolver.observers==0,"missing native layouts retain original capability and register no observers");Context.Resources.missing=false;
 System.out.println("PASS native call cards: "+checks+" checks");}}
'''
})
with tempfile.TemporaryDirectory(prefix='duo-call-cards-') as folder:
    sources=[]
    for name,value in files.items():
        path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');sources.append(str(path))
    sources += [str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/name) for name in ['NativeIslandCallCards.java','NativeIslandSceneContract.java','NativeIslandScenePolicy.java']]
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*sources],check=True)
    subprocess.run([str(java/('java'+suffix)),'-cp',folder,'ls.augment.com.hook.TestCallCards'],check=True)
