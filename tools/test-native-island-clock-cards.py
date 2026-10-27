"""Run the production card-source hooks against lifecycle/IPC doubles, including nested OEM calls."""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
tree = ast.parse((ROOT / 'tools/test-native-island-clock-source.py').read_text(encoding='utf-8'))
files = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign)
                              and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets)))
files = {k: v for k, v in files.items() if not k.startswith('zte/') and not k.endswith('TestClockSource.java')}
files.update({
 'android/app/Application.java': 'package android.app;public class Application extends android.content.Context {public void onCreate(){}}',
 'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
 'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}',
 'android/content/ContentProviderClient.java': 'package android.content;public class ContentProviderClient {public boolean closed;public void close(){closed=true;}}',
 'android/content/ContentResolver.java': '''package android.content;public class ContentResolver {public int observers,unstable;public boolean failObserver,failConnect;
 public void registerContentObserver(Object u,boolean b,android.database.ContentObserver o){if(failObserver)throw new SecurityException();observers++;}
 public void unregisterContentObserver(android.database.ContentObserver o){observers--;}
 public ContentProviderClient acquireUnstableContentProviderClient(android.net.Uri u){unstable++;return failConnect?null:new ContentProviderClient();}}''',
 'android/content/Intent.java': '''package android.content;import java.util.*;public class Intent {private String action;public Map<String,Object> extras=new HashMap<>();
 public Intent(String a){action=a;}public Intent(Context c,Class<?> t){}public String getAction(){return action;}
 public Intent putExtra(String k,boolean v){extras.put(k,v);return this;}public Intent putExtra(String k,long v){extras.put(k,v);return this;}
 public Intent putExtra(String k,String v){extras.put(k,v);return this;}public boolean getBooleanExtra(String k,boolean d){return (Boolean)extras.getOrDefault(k,d);}}''',
 'ls/augment/com/hook/NativeIslandCardClient.java': '''package ls.augment.com.hook;class NativeIslandCardClient {static boolean ready;static int invalidations;
 static boolean available(android.content.Context c,String scene){return ready;}static void invalidate(){invalidations++;}}''',
 'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 public class AugmentModule {public static final Map<Method,Callback> hooks=new HashMap<>();public int errors;
 public interface Body {Object run()throws Throwable;}public interface Callback {Object run(Chain c)throws Throwable;}
 public static class Chain {Object receiver;Object[] args;Body body;Chain(Object r,Object[] a,Body b){receiver=r;args=a;body=b;}
 public Object proceed(Object[] a)throws Throwable{return body.run();}public Object getThisObject(){return receiver;}public List<Object> getArgs(){return Arrays.asList(args);}}
 static class Hook {Method m;Hook(Method m){this.m=m;}Hook intercept(Callback c){hooks.put(m,c);return this;}}
 Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}void registerFeatureHook(Hook h){}
 void logFeatureInfo(String s){}void logFeatureError(String s,Throwable e){errors++;}
 public static Object call(Object target,Class<?> type,String name,Class<?>[] sig,Object[] args,Body body){try{
 Method m=type.getDeclaredMethod(name,sig);Callback c=hooks.get(m);return c==null?body.run():c.run(new Chain(target,args,body));
 }catch(Throwable e){throw new RuntimeException(e);}}
 public static Object noargs(Object target,Class<?> type,String name,Body body){return call(target,type,name,new Class<?>[0],new Object[0],body);}}
 ''',
 'zte/com/cn/utils/FeatureUtils.java': '''package zte.com.cn.utils;import ls.augment.com.hook.AugmentModule;public class FeatureUtils {public static boolean full;
 public static Boolean isSupportLiveIslandFullScreen(){return (Boolean)AugmentModule.noargs(null,FeatureUtils.class,"isSupportLiveIslandFullScreen",()->full);}}''',
 'zte/com/cn/AlarmApplication.java': '''package zte.com.cn;import ls.augment.com.hook.AugmentModule;public class AlarmApplication extends android.app.Application {
 public static AlarmApplication instance;public static boolean foreground;public static AlarmApplication getInstance(){return instance;}
 public static boolean isAppInForeground(){return foreground;}public void onCreate(){AugmentModule.noargs(this,AlarmApplication.class,"onCreate",()->{instance=this;return null;});}}''',
 'com/zte/toolsdk/common/CardMessage.java': '''package com.zte.toolsdk.common;public class CardMessage {public int priority;public String id="zte.com.cn.alarmclock_timer_countdown";
 public CardMessage(int p){priority=p;}public int getDisplayPriority(){return priority;}public String getCardId(){return id;}}''',
 'com/zte/toolsdk/common/CardProviderContract.java': '''package com.zte.toolsdk.common;public class CardProviderContract {public static android.net.Uri getProviderUri(String p){return android.net.Uri.parse(p);}}''',
 'com/zte/toolsdk/producer/CardPusher.java': '''package com.zte.toolsdk.producer;import android.content.*;import com.zte.toolsdk.common.CardMessage;import ls.augment.com.hook.AugmentModule;
 public class CardPusher {public interface OnCardMessageActionListener {}public static final CardPusher INSTANCE=new CardPusher();
 public ContentProviderClient mClient;public String mTargetPackage="com.android.systemui";public OnCardMessageActionListener listener;
 public int sent,removed,stable,callbacks;public CardMessage last;public boolean failCallback;
 public static CardPusher getInstance(Context c,String p){return INSTANCE;}public OnCardMessageActionListener getOnMessageActionListener(){return listener;}
 public boolean connect(){return (Boolean)AugmentModule.noargs(this,CardPusher.class,"connect",()->{stable++;mClient=new ContentProviderClient();return true;});}
 private void registerCallback(){callbacks++;if(failCallback)throw new IllegalStateException();}
 public void disconnect(){if(mClient!=null)mClient.close();mClient=null;}
 public boolean pushCard(CardMessage m){return send("pushCard",m);}public boolean updateCard(CardMessage m){return send("updateCard",m);}
 private boolean send(String name,CardMessage m){return (Boolean)AugmentModule.call(this,CardPusher.class,name,new Class<?>[]{CardMessage.class},new Object[]{m},()->{sent++;last=m;return true;});}
 public boolean removeCard(String id){return (Boolean)AugmentModule.call(this,CardPusher.class,"removeCard",new Class<?>[]{String.class},new Object[]{id},()->{removed++;last=null;return true;});}}
 ''',
 'zte/com/cn/timer/CountdownCount.java': '''package zte.com.cn.timer;import android.content.Context;public class CountdownCount {
 public static final CountdownCount INSTANCE=new CountdownCount();public static CountdownCount getInstance(){return INSTANCE;}
 public int state;public long time=30000,end=31000;public boolean expired;public IslandManager mIslandManager;public int backgrounds;
 public int getState(){return state;}public long getTime(){return time;}public long getEndTimeElapsedRealtime(){return end;}
 public boolean isTimeUpCardShowing(){return expired;}public void setTimeUpCardShowing(boolean b){expired=b;}public String getTitle(){return "actual title";}
 public void onAppWentToBackground(Context c){backgrounds++;if(mIslandManager==null)mIslandManager=new IslandManager();
 if(state==2)mIslandManager.startCountDownCard(c,time);else if(state==3)mIslandManager.pauseCountdownCard(c);}}
 ''',
 'zte/com/cn/timer/IslandManager.java': '''package zte.com.cn.timer;import android.content.Context;import com.zte.toolsdk.producer.CardPusher;import com.zte.toolsdk.common.CardMessage;
 import ls.augment.com.hook.AugmentModule;public class IslandManager {
 public void startCountDownCard(Context c,Long time){CardPusher p=CardPusher.getInstance(c,"com.android.systemui");p.pushCard(new CardMessage(2));p.listener=new CardPusher.OnCardMessageActionListener(){};}
 public void pauseCountdownCard(Context c){CardPusher.getInstance(c,"com.android.systemui").updateCard(new CardMessage(2));}
 public void startNotificationCard(Context c,long total){AugmentModule.call(this,IslandManager.class,"startNotificationCard",new Class<?>[]{Context.class,long.class},new Object[]{c,total},()->{
 CardPusher.getInstance(c,"com.android.systemui").updateCard(new CardMessage(1));return null;});}}
 ''',
 'zte/com/cn/timer/CountdownShortTimeService.java': '''package zte.com.cn.timer;import ls.augment.com.hook.AugmentModule;public class CountdownShortTimeService {
 public void timeUp(){AugmentModule.noargs(this,CountdownShortTimeService.class,"timeUp",()->null);}}''',
 'zte/com/cn/timer/CountdownAlertFloatService.java': '''package zte.com.cn.timer;import android.content.*;import ls.augment.com.hook.AugmentModule;
 public class CountdownAlertFloatService extends android.app.Service {public long startTime;public int tones,gestures,displays;public Intent displayed;
 public int onStartCommand(Intent i,int f,int id){return (Integer)AugmentModule.call(this,CountdownAlertFloatService.class,"onStartCommand",new Class<?>[]{Intent.class,int.class,int.class},new Object[]{i,f,id},()->{
 startPlayTone();startGestureBroadcast();if(!i.getBooleanExtra("countdown_ringtone_only",false)){displays++;displayed=i;startTime=System.currentTimeMillis();}return 1;});}
 public void startPlayTone(){AugmentModule.noargs(this,CountdownAlertFloatService.class,"startPlayTone",()->{tones++;return null;});}
 public void startGestureBroadcast(){AugmentModule.noargs(this,CountdownAlertFloatService.class,"startGestureBroadcast",()->{gestures++;return null;});}
 public void onDestroy(){AugmentModule.noargs(this,CountdownAlertFloatService.class,"onDestroy",()->null);}}
 ''',
 'ls/augment/com/hook/TestClockCards.java': '''package ls.augment.com.hook;import android.content.*;import android.os.*;import zte.com.cn.*;import zte.com.cn.timer.*;
 import zte.com.cn.utils.FeatureUtils;import com.zte.toolsdk.producer.CardPusher;import com.zte.toolsdk.common.CardMessage;
 public class TestClockCards {static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static void recover(AlarmApplication app){app.receiver.onReceive(app,new Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION));Handler.flush();}
 public static class WrongContract {public android.net.Uri getProviderUri(String p){return null;}}
 public static class InheritedCounter extends CountdownCount {public String getTime(String bad){return bad;}}
 static class BadLoader extends ClassLoader {BadLoader(){super(TestClockCards.class.getClassLoader());}public Class<?> loadClass(String n)throws ClassNotFoundException{
 return n.equals("com.zte.toolsdk.common.CardProviderContract")?WrongContract.class:super.loadClass(n);}}
 public static void main(String[]args){
 AugmentModule module=new AugmentModule();NativeIslandClockCards.install(module,TestClockCards.class.getClassLoader());
 check(module.errors==0&&AugmentModule.hooks.size()==12,"complete contracts before source hooks");
 AlarmApplication app=new AlarmApplication();app.onCreate();Handler.flush();
 check(!FeatureUtils.isSupportLiveIslandFullScreen(),"default preserves ordinary mode");
 FeatureSettings.change("native",true);FeatureSettings.change("master",true);FeatureSettings.change("countdown",true);
 check(!FeatureUtils.isSupportLiveIslandFullScreen(),"config alone cannot fabricate display capability");
 NativeIslandCardClient.ready=true;recover(app);
 check(FeatureUtils.isSupportLiveIslandFullScreen(),"live host enables real OEM producer");
 CardPusher p=CardPusher.INSTANCE;CountdownCount m=CountdownCount.INSTANCE;
 check(p.stable==0&&app.resolver.unstable==1&&p.callbacks==1,"unstable IPC prevents SystemUI death from killing timer process");
 check(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION.equals(app.requiredPermission),"recovery sender permission required");
 m.state=3;m.mIslandManager=null;p.listener=null;int sent=p.sent;recover(app);
 check(m.state==3&&p.sent==sent+1&&p.listener!=null&&m.mIslandManager!=null,"first paused enable primes real callbacks without publishing or starting a running task");
 ContentProviderClient old=p.mClient;CardMessage paused=p.last;recover(app);
 check(old.closed&&p.mClient!=old&&p.last!=paused&&m.state==3,"restart reconnects and regenerates same paused task");
 FeatureSettings.change("countdown",false);check(p.last==null&&p.mClient==null&&!FeatureUtils.isSupportLiveIslandFullScreen()&&m.state==3,"scene off removes owned card, disconnects, preserves paused business");
 FeatureSettings.change("countdown",true);check(p.last!=null&&m.state==3,"scene on restores actual paused model");
 AlarmApplication.foreground=true;recover(app);check(p.last==null,"foreground clock retires ordinary priority card");
 AlarmApplication.foreground=false;m.state=2;recover(app);check(p.last!=null&&m.state==2,"running background uses native factory");
 SystemClock.now=(long)Integer.MAX_VALUE+1;check(!FeatureUtils.isSupportLiveIslandFullScreen(),"OEM absolute int overflow falls back");SystemClock.now=1000;
 m.end=(long)Integer.MAX_VALUE+1;check(!FeatureUtils.isSupportLiveIslandFullScreen(),"actual deadline overflow falls back");m.end=31000;
 m.time=Integer.MAX_VALUE;check(!FeatureUtils.isSupportLiveIslandFullScreen(),"duration plus uptime overflow falls back");m.time=30000;
 android.provider.Settings.System.value=0;check(!FeatureUtils.isSupportLiveIslandFullScreen(),"system master respected");android.provider.Settings.System.value=1;
 FeatureSettings.change("duo",true);check(!FeatureUtils.isSupportLiveIslandFullScreen(),"custom island remains exclusive");FeatureSettings.change("duo",false);
 new CountdownShortTimeService().timeUp();m.mIslandManager.startNotificationCard(app,30000);m.state=0;m.expired=true;
 CountdownAlertFloatService alert=new CountdownAlertFloatService();alert.onStartCommand(new Intent("ring").putExtra("countdown_ringtone_only",true),0,1);
 CardMessage expiry=p.last;recover(app);check(p.last==expiry&&m.state==0&&m.expired,"reconnect republishes same real expiry, preserving chronometer origin");
 FeatureSettings.change("countdown",false);
 check(alert.displays==1&&alert.tones==1&&alert.gestures==1&&alert.startTime>0,"disable expiry restores existing native alert UI without replaying tone or gestures");
 check(Long.valueOf(30000).equals(alert.displayed.extras.get("countdown_totaltime"))&&"actual title".equals(alert.displayed.extras.get("countdown_title")),"fallback uses captured actual duration and title");
 check(p.last==null&&m.state==0&&!m.expired,"expiry fallback never restarts timer and retires the card-only showing flag");
 alert.onDestroy();m.expired=false;FeatureSettings.change("countdown",true);check(p.last==null,"dismissed expiry cannot resurrect");
 new CountdownShortTimeService().timeUp();m.mIslandManager.startNotificationCard(app,40000);m.expired=true;
 CountdownAlertFloatService next=new CountdownAlertFloatService();next.onStartCommand(new Intent("ring").putExtra("countdown_ringtone_only",true),0,1);next.onDestroy();
 check(p.last==null&&!m.expired,"native alert destruction clears full-card expiry state");
 new CountdownShortTimeService().timeUp();m.mIslandManager.startNotificationCard(app,50000);m.expired=true;
 NativeIslandCardClient.ready=false;recover(app);
 CountdownAlertFloatService delayed=new CountdownAlertFloatService();delayed.onStartCommand(new Intent("ring").putExtra("countdown_ringtone_only",true),0,1);
 check(delayed.displays==1&&delayed.tones==1&&delayed.gestures==1&&!m.expired,"host lost before asynchronous ringtone service start still restores a real dismissible alert");
 delayed.onDestroy();NativeIslandCardClient.ready=true;
 m.state=3;recover(app);NativeIslandCardClient.ready=false;recover(app);check(p.last==null&&!FeatureUtils.isSupportLiveIslandFullScreen()&&m.state==3,"lost host withdraws card without changing paused model");
 check(NativeIslandSceneContract.method(InheritedCounter.class,"getTime",long.class).getDeclaringClass()==CountdownCount.class,"inherited supported method, unrelated overload ignored");
 AugmentModule.hooks.clear();NativeIslandClockCards.install(module,new BadLoader());check(module.errors==1&&AugmentModule.hooks.isEmpty(),"missing static contract rejects before hooks");
 FeatureUtils.full=true;NativeIslandClockCards.install(module,TestClockCards.class.getClassLoader());check(AugmentModule.hooks.isEmpty(),"original full path preserved without hook registration");FeatureUtils.full=false;
 FeatureSettings.listeners.clear();AlarmApplication.instance=null;NativeIslandClockCards.install(module,TestClockCards.class.getClassLoader());
 AlarmApplication bad=new AlarmApplication();bad.resolver.failObserver=true;bad.onCreate();Handler.flush();NativeIslandCardClient.ready=true;
 check(bad.receiver==null&&bad.resolver.observers==0&&FeatureSettings.listeners.isEmpty()&&!FeatureUtils.isSupportLiveIslandFullScreen(),"partial binding releases receiver and cannot activate full path");
 System.out.println("PASS native clock cards: "+checks+" checks");}}
 '''
})
with tempfile.TemporaryDirectory(prefix='duo-clock-cards-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources += [str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name) for name in
                ['NativeIslandClockCards.java', 'NativeIslandSceneContract.java', 'NativeIslandScenePolicy.java']]
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestClockCards'], check=True)
