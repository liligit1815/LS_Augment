"""Execute the production download/ordinary heads-up routing and withdrawal boundaries."""
from pathlib import Path
import runpy, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
base=runpy.run_path(str(ROOT/'tools/test-island-download-runtime.py'))
files=dict(base['FILES']);src=base['SRC'];java=base['JDK']
actual=(src/'hook/DynamicIslandHook.java').read_text('utf-8')
def body(marker):
    start=actual.index('{',actual.index(marker));end=start+1;depth=1
    while depth:
        depth+=(actual[end]=='{')-(actual[end]=='}');end+=1
    return actual[start:end]
files['android/service/notification/NotificationListenerService.java']=files['android/service/notification/NotificationListenerService.java'].replace(
    'public class NotificationListenerService{','public class NotificationListenerService{public RankingMap map=new RankingMap();public RankingMap getCurrentRanking(){return map;}')
files['android/os/Bundle.java']=files['android/os/Bundle.java'].replace('public int getInt','public CharSequence getCharSequence(String k){return (CharSequence)get(k);}public int getInt')
files['android/app/Notification.java']=files['android/app/Notification.java'].replace('public int flags=2','public Object fullScreenIntent;public static final String EXTRA_TITLE="title",EXTRA_TEXT="text";public int flags=2')
files['ls/augment/com/IslandNoticeRules.java']='package ls.augment.com;public class IslandNoticeRules{public static final int OFF=0;}'
files['ls/augment/com/hook/IslandHeadsUpBridge.java']='''package ls.augment.com.hook;import android.service.notification.*;class IslandHeadsUpBridge{
static boolean downloadMayShow(StatusBarNotification s,NotificationListenerService.Ranking r){return true;}
static String revision(StatusBarNotification s){return s.getKey()+":"+s.getPostTime();}
static boolean sameIdentity(StatusBarNotification a,StatusBarNotification b){return a!=null&&b!=null&&a.getUid()==b.getUid()&&a.getUserId()==b.getUserId()&&a.getKey().equals(b.getKey());}
static boolean same(StatusBarNotification a,StatusBarNotification b){return a!=null&&b!=null&&revision(a).equals(revision(b));}}'''
for name in ['IslandDownloadConfig','IslandDownloadPolicy','IslandActivityPolicy']:
    files['ls/augment/com/'+name+'.java']=(src/(name+'.java')).read_text('utf-8')
files['ls/augment/com/hook/IslandDownloadSource.java']=(src/'hook/IslandDownloadSource.java').read_text('utf-8')
harness='''package ls.augment.com.hook;
import java.util.*;import android.app.*;import android.service.notification.*;import ls.augment.com.*;
public class DownloadHeadsUpCases{
static Map<Object,State> STATES=new HashMap<>();static java.lang.ref.WeakReference<NotificationListenerService> notificationListener=new java.lang.ref.WeakReference<>(null);
static class TextUtils{static boolean isEmpty(CharSequence s){return s==null||s.length()==0;}}
static class Power{boolean interactive=true;boolean isInteractive(){return interactive;}}
static class Host{boolean hold,drawn;int aborts;boolean holdsActivity(){return hold;}boolean confirmedFrame(Object r,Runnable cb){return drawn;}void abortPresentation(){aborts++;drawn=false;}}
static class State{
final IslandDownloadSource downloads=new IslandDownloadSource(new android.content.Context());final Host nativeHost=new Host();Power power=new Power();
boolean closed,enabled=true,screenOff,lock,visible=true,notices=true,blacklisted;int ownerUser=0,user=0,activity;StatusBarNotification notice;
IslandDownloadPolicy.Entry<StatusBarNotification> download;
State(){downloads.user(0);}boolean locked(){return lock;}boolean hostVisible(){return visible;}int currentUser(){return user;}
boolean rankingAllowed(NotificationListenerService.Ranking r){return r!=null&&r.getImportance()>=3&&!r.isSuspended()&&r.matchesInterruptionFilter();}
boolean option(String k){return notices;}int noticeMode(StatusBarNotification s){return blacklisted?0:1;}
void notice(StatusBarNotification n,boolean ignored,boolean nativeAlert){if(!nativeAlert)throw new AssertionError("native authorization lost");notice=n;activity=IslandActivityPolicy.NOTICE;}
void clearNotice(){notice=null;}void cancelFirst(){}void refresh(){download=downloads.activities.choose(null);activity=download==null?0:IslandActivityPolicy.DOWNLOAD;}
boolean canPrepareHeadsUp(StatusBarNotification sbn,NotificationListenerService.Ranking ranking) CAN
}
static boolean prepareHeadsUp(StatusBarNotification source,NotificationListenerService.Ranking ranking) PREPARE
static boolean confirmHeadsUp(StatusBarNotification source,Runnable drawn) CONFIRM
static void abortHeadsUp(StatusBarNotification source) ABORT
static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
public static void main(String[] args){
State s=new State();STATES.put(new Object(),s);NotificationListenerService listener=new NotificationListenerService();notificationListener=new java.lang.ref.WeakReference<>(listener);
listener.map.rank.importance=4;NotificationListenerService.Ranking rank=listener.map.rank;
StatusBarNotification n=new StatusBarNotification("download",10,35);
FeatureSettings.values.put(IslandDownloadConfig.ENABLED,"1");FeatureSettings.values.put(IslandDownloadConfig.CHANNELS,IslandDownloadConfig.channel(0,n.pkg,n.notification.channel));
s.blacklisted=true;s.notices=false;check(s.canPrepareHeadsUp(n,rank),"blacklist and ordinary OFF do not disable download handoff");
check(prepareHeadsUp(n,rank)&&s.activity==IslandActivityPolicy.DOWNLOAD&&s.notice==null,"download goes to independent source instead of ordinary notice");
check(!confirmHeadsUp(n,()->{}),"queued download is not a displayed frame");s.nativeHost.drawn=true;check(confirmHeadsUp(n,()->{}),"current drawn download can commit");
StatusBarNotification newer=new StatusBarNotification("download",11,78);check(!confirmHeadsUp(newer,()->{}),"different progress generation cannot reuse frame");
abortHeadsUp(newer);check(s.download!=null&&s.nativeHost.aborts==0,"aborting different revision leaves current activity");
abortHeadsUp(n);check(s.download==null&&s.downloads.activities.size()==0&&s.nativeHost.aborts==1,"fallback withdraws only the owned download");
for(int gate=0;gate<7;gate++){
 s.lock=gate==0;s.visible=gate!=1;s.screenOff=gate==2;s.enabled=gate!=3;s.power.interactive=gate!=4;s.user=gate==5?10:0;s.nativeHost.hold=gate==6;
 check(!s.canPrepareHeadsUp(newer,rank),"environment and unrelated expanded panel keep native "+gate);
}
s.lock=s.screenOff=s.nativeHost.hold=false;s.visible=s.enabled=s.power.interactive=true;s.user=0;
StatusBarNotification ordinary=new StatusBarNotification("ordinary",12,0);ordinary.notification.flags=0;ordinary.notification.extras.clear();ordinary.notification.extras.put("title","message");
check(!s.canPrepareHeadsUp(ordinary,rank),"blacklisted ordinary notice remains original");s.notices=true;s.blacklisted=false;
check(s.canPrepareHeadsUp(ordinary,rank)&&prepareHeadsUp(ordinary,rank)&&s.notice==ordinary,"ordinary non-blacklisted handoff preserved");
s.nativeHost.hold=true;StatusBarNotification updated=new StatusBarNotification("ordinary",13,0);updated.notification.flags=0;updated.notification.extras.clear();updated.notification.extras.put("title","updated");
check(s.canPrepareHeadsUp(updated,rank),"same notification may update its expanded panel");
StatusBarNotification other=new StatusBarNotification("other",13,0);other.notification.flags=0;other.notification.extras.clear();other.notification.extras.put("title","other");
check(!s.canPrepareHeadsUp(other,rank),"another notification cannot take over the expanded panel");
System.out.println("PASS independent download heads-up routing: "+checks+" checks");
}}'''
for token,marker in [('CAN','        boolean canPrepareHeadsUp('),('PREPARE','    static boolean prepareHeadsUp('),('CONFIRM','    static boolean confirmHeadsUp('),('ABORT','    static void abortHeadsUp(')]:
    harness=harness.replace(token,body(marker))
files['ls/augment/com/hook/DownloadHeadsUpCases.java']=harness
with tempfile.TemporaryDirectory() as temp:
    folder=Path(temp)
    for name,value in files.items():
        p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,'utf-8')
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',temp,*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',temp,'ls.augment.com.hook.DownloadHeadsUpCases'],check=True)
