"""Execute production listener hooks, snapshot recovery, routing and action dispatch gates."""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
base = runpy.run_path(str(ROOT / 'tools/test-island-download-runtime.py'))
SRC, JDK = base['SRC'], base['JDK']
source = (SRC / 'hook/DynamicIslandHook.java').read_text(encoding='utf-8')


def body(marker):
    start = source.index('{', source.index(marker))
    end, depth = start + 1, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


FILES = dict(base['FILES'])
FILES['android/os/SystemClock.java']='package android.os;public class SystemClock{ public static long elapsedRealtime(){return 100;} }'
FILES['ls/augment/com/SystemUiOptions.java']='package ls.augment.com;public class SystemUiOptions{public static final String ISLAND_FIRST_EXPAND="first_expand";}'
FILES['android/service/notification/NotificationListenerService.java'] = FILES[
    'android/service/notification/NotificationListenerService.java'].replace(
    'public class NotificationListenerService{', '''public class NotificationListenerService{
public StatusBarNotification[] active=new StatusBarNotification[0];public RankingMap ranking=new RankingMap();public boolean fail;
public StatusBarNotification[] getActiveNotifications(){if(fail)throw new SecurityException();return active;}
public StatusBarNotification[] getActiveNotifications(String[] keys){return getActiveNotifications();}
public int snoozes; public long duration;public String snoozedKey;
public void snoozeNotification(String key,long delay){snoozes++;duration=delay;snoozedKey=key;}
public RankingMap getCurrentRanking(){return ranking;}
public void onListenerConnected(){}public void onListenerDisconnected(){}
''')
FILES['ls/augment/com/hook/AugmentModule.java'] = '''package ls.augment.com.hook;
class AugmentModule {
interface Interceptor {Object call(Chain chain)throws Throwable;}
static class Chain {final Object owner;int proceeded;Chain(Object o){owner=o;}Object proceed(){proceeded++;return "original";}Object getThisObject(){return owner;}}
static class Builder {Interceptor callback;java.lang.reflect.Method method;Builder(java.lang.reflect.Method m){method=m;}Builder intercept(Interceptor c){callback=c;return this;}}
Builder registered;String diagnostic="";Builder prepareFeatureHook(java.lang.reflect.Method m,String name,boolean before){return new Builder(m);}
void registerFeatureHook(Builder b){registered=b;}void logFeatureInfo(String value){diagnostic=value;}
}
'''
for name in ('IslandDownloadConfig', 'IslandDownloadPolicy', 'IslandActivityPolicy', 'IslandNoticeRules'):
    FILES['ls/augment/com/' + name + '.java'] = (SRC / (name + '.java')).read_text(encoding='utf-8')
FILES['ls/augment/com/hook/IslandDownloadSource.java'] = (SRC / 'hook/IslandDownloadSource.java').read_text(encoding='utf-8')
FILES['ls/augment/com/TestIslandNoticeRules.java'] = (ROOT/'tools/TestIslandNoticeRules.java').read_text(encoding='utf-8')
HARNESS = '''package ls.augment.com.hook;
import java.util.*;import android.app.*;import android.service.notification.*;import ls.augment.com.*;
public class DownloadLifecycleTest {
static final String LISTENER="com.android.systemui.statusbar.NotificationListener";
static java.lang.ref.WeakReference<NotificationListenerService> notificationListener=new java.lang.ref.WeakReference<>(null);
static class Queue {List<Runnable> tasks=new ArrayList<>();void post(Runnable r){tasks.add(r);}void removeCallbacks(Runnable r){tasks.remove(r);}void postDelayed(Runnable r,long ms){tasks.add(r);}void drain(){List<Runnable> copy=new ArrayList<>(tasks);tasks.clear();for(Runnable r:copy)r.run();}}
static final Queue MAIN=new Queue();static final Map<Object,State> STATES=new HashMap<>();
static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
static int hookListenerLifecycle(AugmentModule module,ClassLoader loader,String name,java.util.function.Consumer<Object> callback) HOOK
static void connected(Object owner) CONNECTED
static void disconnected(Object owner) DISCONNECTED
static class Power {boolean interactive=true;boolean isInteractive(){return interactive;}}
static class Host {int expansions;boolean readyForFirstExpansion(){return visible;}void expand(){expansions++;}boolean visible=true,expanded=true;boolean visible(){return visible;}boolean expanded(){return expanded;}}
static class State {
final android.content.Context context=new android.content.Context();final IslandDownloadSource downloads=new IslandDownloadSource(context);
boolean closed,enabled=true,screenOff,lock;int user,activity=IslandActivityPolicy.DOWNLOAD,refreshes,notices,withdrawals,opens;
StatusBarNotification notice,snoozeRequested;boolean rankingAllowed=true;boolean option(String name){return true;}
long noticeUntil=1000;IslandNoticeRules noticeRules=IslandNoticeRules.parse("");int noticeMode(StatusBarNotification source) NOTICE_MODE
boolean allowedRanking(String key,NotificationListenerService.RankingMap ranking){return rankingAllowed;}
final Runnable firstExpansion=this::expandFirst;String firstKey;int firstKind,ownerUser,entryWaits;final Set<String> announcedDownloads=new HashSet<>();void firstDiagnostic(String v){}IslandDownloadPolicy.Entry<StatusBarNotification> download;
boolean hostVisible(){return nativeHost.visible();}void cancelFirst() CANCEL_FIRST
void scheduleFirst(String key,int kind) SCHEDULE_FIRST
void expandFirst() EXPAND_FIRST
Power power=new Power();Host nativeHost=new Host();final Runnable collapse=()->{};String diagnostic="";
boolean locked(){return lock;}int currentUser(){return user;}void diagnostic(String value){diagnostic=value;}
void clearNotice(){notice=null;snoozeRequested=null;}
void openDiagnostic(String value){diagnostic=value;}void requestRefresh(){refreshes++;}void notice(StatusBarNotification s,NotificationListenerService.RankingMap r){notices++;}
void withdrawNotice(String key){withdrawals++;}boolean openNotice(PendingIntent intent){opens++;return true;}
void restoreDownloadSnapshot() RESTORE
void downloadSnapshot() SNAPSHOT
void posted(StatusBarNotification sbn,NotificationListenerService.RankingMap rankings) POSTED
void downloadAction(IslandDownloadPolicy.Entry<StatusBarNotification> entry,PendingIntent intent) ACTION
boolean noticeAction(StatusBarNotification source,PendingIntent intent) NOTICE_ACTION
StatusBarNotification activeNotice(StatusBarNotification source,NotificationListenerService listener) ACTIVE_NOTICE
void snoozeNotice(StatusBarNotification source) SNOOZE_NOTICE
}
public static void main(String[] args)throws Throwable{
String shape=args[0];AugmentModule module=new AugmentModule();int[] calls={0};
int installed=hookListenerLifecycle(module,DownloadLifecycleTest.class.getClassLoader(),"onListenerConnected",o->calls[0]++);
if(shape.equals("wrong")||shape.equals("abstract")){
 check(installed==0&&module.registered==null&&!module.diagnostic.isEmpty(),"unknown listener fails closed with diagnosis");
 System.out.println("PASS listener "+shape+": "+checks+" checks");return;
}
check(installed==1,"concrete lifecycle found");Object target=Class.forName(LISTENER).getConstructor().newInstance();
AugmentModule.Chain chain=new AugmentModule.Chain(target);
check("original".equals(module.registered.callback.call(chain))&&chain.proceeded==1&&calls[0]==1,"lifecycle preserves original then calls hook");
module.registered.callback.call(new AugmentModule.Chain(new NotificationListenerService()));
check(calls[0]==1,"inherited hook ignores unrelated listener instances");
check(module.registered.method.getDeclaringClass().getName().equals(shape.equals("inherited")?NotificationListenerService.class.getName():LISTENER),"exact runtime override or inherited declaration selected");
if(shape.equals("override")){System.out.println("PASS listener override: "+checks+" checks");return;}
String channel=IslandDownloadConfig.channel(0,"com.example.downloader","downloads");
FeatureSettings.values.put(IslandDownloadConfig.ENABLED,"1");FeatureSettings.values.put(IslandDownloadConfig.CHANNELS,channel);
State state=new State();STATES.put("state",state);NotificationListenerService listener=(NotificationListenerService)target;
StatusBarNotification n=new StatusBarNotification("download",10,20);PendingIntent pause=new PendingIntent();n.notification.actions=new Notification.Action[]{new Notification.Action("鏆傚仠",pause)};
listener.active=new StatusBarNotification[]{n};connected(listener);check(state.downloads.activities.size()==0,"connection work queued on main thread");MAIN.drain();
check(state.downloads.activities.size()==1&&state.refreshes==1,"connected listener recovers current real notification");
for(int gate=0;gate<5;gate++){
 state.closed=gate==0;state.enabled=gate!=1;state.screenOff=gate==2;state.lock=gate==3;state.power.interactive=gate!=4;
 state.downloadSnapshot();check(state.downloads.activities.size()==0,"snapshot privacy gate "+gate);
 state.posted(n,listener.ranking);check(state.downloads.activities.size()==0&&state.notices==0,"posted privacy gate "+gate);
 state.closed=false;state.enabled=true;state.screenOff=false;state.lock=false;state.power.interactive=true;state.downloadSnapshot();
}
state.posted(n,listener.ranking);check(state.notices==0&&state.withdrawals==1,"download does not duplicate transient notice");
FeatureSettings.values.put(SystemUiOptions.ISLAND_FIRST_EXPAND,"1");state.downloads.clear();state.announcedDownloads.clear();state.downloadSnapshot();state.posted(n,listener.ranking);state.download=state.downloads.activities.get(n.key);
state.nativeHost.expanded=false;state.posted(n,listener.ranking);MAIN.drain();check(state.nativeHost.expansions==1,"first post expands once despite interleaved update");
state.posted(n,listener.ranking);MAIN.drain();check(state.nativeHost.expansions==1,"progress update reopened collapsed card");
state.scheduleFirst(n.key,IslandActivityPolicy.DOWNLOAD);state.lock=true;MAIN.drain();check(state.nativeHost.expansions==1,"locked first alert opened");state.lock=false;
state.nativeHost.expanded=true;
StatusBarNotification ordinary=new StatusBarNotification("ordinary",11,20);ordinary.notification.channel="messages";
state.posted(ordinary,listener.ranking);check(state.notices==1,"ordinary notice keeps old path");
var entry=state.downloads.activities.get(n.key);state.downloadAction(entry,pause);check(state.opens==1,"current real source action reaches existing opener");
state.nativeHost.visible=false;state.downloadAction(entry,pause);check(state.opens==1,"hidden native island cannot execute");state.nativeHost.visible=true;
listener.active=new StatusBarNotification[0];state.downloadAction(entry,pause);
check(state.opens==1&&state.downloads.activities.size()==0,"removed source rejected before queued removal callback and snapshot clears island");
listener.active=new StatusBarNotification[]{n};state.downloadSnapshot();entry=state.downloads.activities.get(n.key);
StatusBarNotification replacement=new StatusBarNotification(n.key,12,25);replacement.notification.actions=n.notification.actions;listener.active=new StatusBarNotification[]{replacement};
state.downloadAction(entry,pause);check(state.opens==1&&state.downloads.activities.get(n.key).postedAt==12,"replacement cannot execute stale button and refreshes source");
listener.fail=true;state.downloadSnapshot();check(state.downloads.activities.size()==0&&state.diagnostic.contains("SecurityException"),"inaccessible listener clears snapshot with diagnostic");listener.fail=false;
NotificationListenerService next=new NotificationListenerService();next.active=listener.active;connected(next);disconnected(listener);MAIN.drain();
check(notificationListener.get()==next&&state.downloads.activities.size()==1,"late disconnect cannot clear replacement listener");
disconnected(next);MAIN.drain();check(notificationListener.get()==null&&state.downloads.activities.size()==0,"current disconnect retires all activities");
state.downloadSnapshot();check(state.downloads.activities.size()==0,"absent listener fails closed");
notificationListener=new java.lang.ref.WeakReference<>(listener);state.activity=IslandActivityPolicy.NOTICE;state.notice=ordinary;ordinary.notification.flags=0;
PendingIntent noticeButton=new PendingIntent();ordinary.notification.actions=new Notification.Action[]{new Notification.Action("鎿嶄綔",noticeButton)};
listener.active=new StatusBarNotification[]{ordinary};int before=state.opens;
state.noticeAction(ordinary,noticeButton);check(state.opens==before+1,"notice original action not dispatched");before=state.opens;
listener.active=new StatusBarNotification[0];state.noticeAction(ordinary,noticeButton);check(state.opens==before,"removed notice action executed");
listener.active=new StatusBarNotification[]{new StatusBarNotification(ordinary.key,12,25)};state.noticeAction(ordinary,noticeButton);check(state.opens==before,"replacement notice action executed");
StatusBarNotification moved=new StatusBarNotification(ordinary.key,ordinary.time,25);moved.notification.flags=0;moved.notification.contentIntent=noticeButton;
listener.active=new StatusBarNotification[]{moved};state.noticeAction(ordinary,noticeButton);state.snoozeNotice(ordinary);
check(state.opens==before&&listener.snoozes==0,"same timestamp replacement in another channel accepted an old operation");
listener.active=new StatusBarNotification[]{ordinary};ordinary.notification.visibility=Notification.VISIBILITY_SECRET;state.noticeAction(ordinary,noticeButton);check(state.opens==before,"newly secret notice action executed");ordinary.notification.visibility=0;
state.rankingAllowed=false;state.noticeAction(ordinary,noticeButton);check(state.opens==before,"suppressed notice action executed");state.rankingAllowed=true;
ordinary.notification.actions=new Notification.Action[0];state.noticeAction(ordinary,noticeButton);check(state.opens==before,"removed notice button executed");
ordinary.notification.contentIntent=noticeButton;state.noticeAction(ordinary,noticeButton);check(state.opens==before+1,"notice content PendingIntent lost");before=state.opens;
state.lock=true;state.snoozeNotice(ordinary);state.lock=false;
state.noticeUntil=100;state.snoozeNotice(ordinary);state.noticeUntil=1000;
ordinary.notification.flags=32;state.snoozeNotice(ordinary);ordinary.notification.flags=0;
String disable="1"+IslandDownloadConfig.channel(0,ordinary.pkg,"messages");state.noticeRules=IslandNoticeRules.parse(disable);
state.snoozeNotice(ordinary);state.noticeAction(ordinary,noticeButton);
check(listener.snoozes==0&&state.opens==before,"locked, expired, non-clearable or disabled channel dispatched");
state.noticeRules=IslandNoticeRules.parse("");state.snoozeNotice(ordinary);state.snoozeNotice(ordinary);
check(listener.snoozes==1&&listener.duration==900000&&ordinary.key.equals(listener.snoozedKey),"snooze must target exact key once for 15 minutes");
state.cancelFirst();state.nativeHost.expanded=false;int expanded=state.nativeHost.expansions;
FeatureSettings.values.remove(SystemUiOptions.ISLAND_FIRST_EXPAND);
state.noticeRules=IslandNoticeRules.parse("3"+IslandNoticeRules.app(0,ordinary.pkg));
state.scheduleFirst(ordinary.key,IslandActivityPolicy.NOTICE);MAIN.drain();check(state.nativeHost.expansions==expanded+1,"app override allows first expansion with global disabled");
state.noticeRules=IslandNoticeRules.parse("3"+IslandNoticeRules.app(0,ordinary.pkg)+",2"+IslandDownloadConfig.channel(0,ordinary.pkg,"messages"));
FeatureSettings.values.put(SystemUiOptions.ISLAND_FIRST_EXPAND,"1");state.scheduleFirst(ordinary.key,IslandActivityPolicy.NOTICE);MAIN.drain();
check(state.nativeHost.expansions==expanded+1,"channel compact overrides app and global expansion");
notificationListener.clear();state.noticeAction(ordinary,noticeButton);check(state.opens==before,"disconnected listener retained notice action");
System.out.println("PASS download listener/snapshot/routing/dispatch: "+checks+" checks");
}}
'''
for token, marker in [('HOOK', 'private static int hookListenerLifecycle('),
                      ('CONNECTED', 'hookListenerLifecycle(module,loader,"onListenerConnected",owner->'),
                      ('DISCONNECTED', 'hookListenerLifecycle(module,loader,"onListenerDisconnected",owner->'),
                      ('CANCEL_FIRST','void cancelFirst()'),('SCHEDULE_FIRST','void scheduleFirst('),('EXPAND_FIRST','void expandFirst()'),('RESTORE','void restoreDownloadSnapshot()'),('SNAPSHOT', 'void downloadSnapshot()'), ('POSTED', 'void posted(StatusBarNotification'),
                      ('ACTION', 'void downloadAction('), ('NOTICE_ACTION','boolean noticeAction('),
                      ('NOTICE_MODE','int noticeMode('),('ACTIVE_NOTICE','StatusBarNotification activeNotice('),('SNOOZE_NOTICE','void snoozeNotice(')]:
    HARNESS = HARNESS.replace(' ' + token + '\n', ' ' + body(marker) + '\n')
FILES['ls/augment/com/hook/DownloadLifecycleTest.java'] = HARNESS
for shape, declaration in {
    'inherited': 'public class NotificationListener extends android.service.notification.NotificationListenerService {}',
    'override': 'public class NotificationListener extends android.service.notification.NotificationListenerService {public void onListenerConnected(){}}',
    'wrong': 'public class NotificationListener {public void onListenerConnected(){}}',
    'abstract': 'public abstract class NotificationListener extends android.service.notification.NotificationListenerService {public abstract void onListenerConnected();}',
}.items():
    with tempfile.TemporaryDirectory(prefix='duo-download-listener-') as tmp:
        folder = Path(tmp)
        files = dict(FILES)
        files['com/android/systemui/statusbar/NotificationListener.java'] = 'package com.android.systemui.statusbar;' + declaration
        for name, content in files.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
        subprocess.run([str(JDK / 'javac'), '-encoding', 'UTF-8', '-d', str(folder), *map(str, folder.rglob('*.java'))], check=True)
        subprocess.run([str(JDK / 'java'), '-cp', str(folder), 'ls.augment.com.hook.DownloadLifecycleTest', shape], check=True)
        if shape == 'inherited':
            subprocess.run([str(JDK / 'java'), '-cp', str(folder), 'ls.augment.com.TestIslandNoticeRules'], check=True)
