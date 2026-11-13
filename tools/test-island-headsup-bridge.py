"""Execute the production heads-up hook with asynchronous native entry/decision/draw boundaries."""
import ast
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-takeover.py').read_text(encoding='utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets))
files={'ls/augment/com/hook/AugmentModule.java':base['ls/augment/com/hook/AugmentModule.java']}
files.update({
'android/os/Looper.java':'''package android.os;public class Looper{static final Looper MAIN=new Looper();public static Looper current=MAIN;public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return current;}}''',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now;public static long uptimeMillis(){return now;}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler{
 static class Task{Runnable run;long due;Task(Runnable r,long d){run=r;due=d;}}
 static List<Task> tasks=new ArrayList<>();public Handler(Looper l){}
 public void post(Runnable r){postDelayed(r,0);}public void postDelayed(Runnable r,long t){tasks.add(new Task(r,SystemClock.now+t));}
 public void removeCallbacks(Runnable r){tasks.removeIf(t->t.run==r);}
 public static void advance(long millis){SystemClock.now+=millis;int guard=0;while(true){Task found=null;for(Task t:tasks)if(t.due<=SystemClock.now){found=t;break;}if(found==null)return;if(++guard>100)throw new AssertionError("loop");tasks.remove(found);found.run.run();}}
 public static void reset(){tasks.clear();SystemClock.now=0;}}
''',
'android/os/Bundle.java':'''package android.os;public class Bundle extends java.util.HashMap<String,Object>{public CharSequence getCharSequence(String k){return (CharSequence)get(k);}}''',
'android/app/NotificationManager.java':'package android.app;public class NotificationManager{public static final int IMPORTANCE_HIGH=4;}',
'android/app/Notification.java':'''package android.app;import android.os.Bundle;public class Notification{
 public static final String EXTRA_TITLE="title",EXTRA_TEXT="text",EXTRA_PROGRESS="progress",EXTRA_PROGRESS_MAX="max",EXTRA_PROGRESS_INDETERMINATE="indeterminate";public long when;public int flags;public String category;
 public Object contentIntent,fullScreenIntent,contentView,bigContentView,headsUpContentView;public Bundle extras=new Bundle();public Action[] actions;
 public String getChannelId(){return "messages";}public static class Action{public CharSequence title="Action";public Object actionIntent=new Object();public boolean auth;public Object[] inputs,dataInputs;
 public boolean isAuthenticationRequired(){return auth;}public Object[] getRemoteInputs(){return inputs;}public Object[] getDataOnlyRemoteInputs(){return dataInputs;}}}
''',
'android/service/notification/StatusBarNotification.java':'''package android.service.notification;import android.app.Notification;public class StatusBarNotification{
 public final String key;public long posted;public Notification n=new Notification();public StatusBarNotification(String k,long p){key=k;posted=p;n.extras.put("title","message "+p);}
 public Notification getNotification(){return n;}public String getKey(){return key;}public int getUid(){return 10001;}public int getUserId(){return 0;}public long getPostTime(){return posted;}}
''',
'android/service/notification/NotificationListenerService.java':'package android.service.notification;public class NotificationListenerService{public static class Ranking{public int importance=4;public int getImportance(){return importance;}}}',
'ls/augment/com/hook/MagicIslandScenes.java':'''package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{
 static Method exact(Class<?> c,String n,Class<?> r,Class<?>...a)throws Exception{Method m=c.getDeclaredMethod(n,a);if(m.getReturnType()!=r)throw new NoSuchMethodException(n);m.setAccessible(true);return m;}}
''',
'ls/augment/com/hook/FeatureRuntimeLog.java':'package ls.augment.com.hook;class FeatureRuntimeLog{static void event(String a,String b){}}',
'ls/augment/com/hook/DynamicIslandHook.java':'''package ls.augment.com.hook;import android.service.notification.*;class DynamicIslandHook{
 static boolean eligible=true,prepare=true,drawn;static int preparations,aborts;static StatusBarNotification shown;static Runnable callback;
 static boolean canPrepareHeadsUp(StatusBarNotification s,NotificationListenerService.Ranking r){return eligible&&r.importance>=4;}
 static boolean prepareHeadsUp(StatusBarNotification s,NotificationListenerService.Ranking r){preparations++;if(prepare)shown=s;return prepare;}
 static boolean confirmHeadsUp(StatusBarNotification s,Runnable cb){callback=cb;return drawn&&shown==s;}
 static void abortHeadsUp(StatusBarNotification s){aborts++;if(shown==s)shown=null;}
 static void draw(){drawn=true;if(callback!=null)callback.run();}
 static void reset(){eligible=prepare=true;drawn=false;preparations=aborts=0;shown=null;callback=null;}}
''',
'com/android/systemui/statusbar/notification/collection/NotificationEntry.java':'''package com.android.systemui.statusbar.notification.collection;import android.service.notification.*;public class NotificationEntry{
 public StatusBarNotification sbn;public NotificationListenerService.Ranking ranking=new NotificationListenerService.Ranking();public boolean canceled,dismissed;public int interrupted;
 public NotificationEntry(StatusBarNotification s){sbn=s;}public StatusBarNotification getSbn(){return sbn;}public NotificationListenerService.Ranking getRanking(){return ranking;}
 public boolean isCanceled(){return canceled;}public boolean isRowDismissed(){return dismissed;}public void setInterruption(){interrupted++;}}
''',
'com/android/systemui/statusbar/notification/interruption/VisualInterruptionDecisionProvider.java':'''package com.android.systemui.statusbar.notification.interruption;public interface VisualInterruptionDecisionProvider{interface Decision{boolean getShouldInterrupt();}}''',
'com/android/systemui/statusbar/notification/interruption/VisualInterruptionDecisionProviderImpl.java':'''package com.android.systemui.statusbar.notification.interruption;
import com.android.systemui.statusbar.notification.collection.NotificationEntry;import ls.augment.com.hook.AugmentModule;
public class VisualInterruptionDecisionProviderImpl{public boolean allowed=true,fail;
 public VisualInterruptionDecisionProvider.Decision makeUnloggedHeadsUpDecision(NotificationEntry e){return decide(e,"makeUnloggedHeadsUpDecision");}
 public VisualInterruptionDecisionProvider.Decision makeAndLogHeadsUpDecision(NotificationEntry e){return decide(e,"makeAndLogHeadsUpDecision");}
 private VisualInterruptionDecisionProvider.Decision decide(NotificationEntry e,String name){return (VisualInterruptionDecisionProvider.Decision)AugmentModule.run(this,name,new Class[]{NotificationEntry.class},new Object[]{e},a->{if(fail)throw new IllegalStateException("decision failed");return (VisualInterruptionDecisionProvider.Decision)()->allowed;});}}
''',
'com/android/systemui/statusbar/notification/headsup/HeadsUpManagerImpl.java':'''package com.android.systemui.statusbar.notification.headsup;
import com.android.systemui.statusbar.notification.collection.NotificationEntry;import ls.augment.com.hook.AugmentModule;
public class HeadsUpManagerImpl{public int shows;public boolean already,fail;public boolean isHeadsUpEntry(String k){return already;}
 public void showNotification(NotificationEntry e,boolean pinned){AugmentModule.run(this,"showNotification",new Class[]{NotificationEntry.class,boolean.class},new Object[]{e,pinned},a->{shows++;if(fail)throw new IllegalStateException("show failed");return null;});}}
''',
'ls/augment/com/hook/TestHeadsUp.java':'''package ls.augment.com.hook;
import android.os.*;import android.app.*;import android.service.notification.*;
import com.android.systemui.statusbar.notification.headsup.*;import com.android.systemui.statusbar.notification.collection.*;import com.android.systemui.statusbar.notification.interruption.*;
public class TestHeadsUp{
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static class Fixture{HeadsUpManagerImpl manager=new HeadsUpManagerImpl();VisualInterruptionDecisionProviderImpl provider=new VisualInterruptionDecisionProviderImpl();
 NotificationEntry entry=new NotificationEntry(new StatusBarNotification("message",1));
 Fixture(){IslandHeadsUpBridge.clear();Handler.reset();DynamicIslandHook.reset();provider.makeAndLogHeadsUpDecision(entry);}
 void show(){manager.showNotification(entry,false);}void prepare(){show();Handler.advance(0);}}
 public static void main(String[] args){
 NotificationEntry unbound=new NotificationEntry(new StatusBarNotification("unbound",1));
 check(!IslandHeadsUpBridge.downloadMayShow(unbound.sbn,unbound.ranking),"missing heads-up capability preserves high-importance native download");
 unbound.ranking.importance=2;check(IslandHeadsUpBridge.downloadMayShow(unbound.sbn,unbound.ranking),"legacy LOW download stays supported");
 check(IslandHeadsUpBridge.install(new AugmentModule(),TestHeadsUp.class.getClassLoader())==3,"native contract installed");
 Fixture f=new Fixture();f.show();check(f.manager.shows==0&&DynamicIslandHook.preparations==0,"hook neither blocks nor prepares synchronously");
 Handler.advance(0);check(DynamicIslandHook.preparations==1&&f.entry.interrupted==0,"queued source alone is not success");DynamicIslandHook.draw();
 check(f.entry.interrupted==1&&f.manager.shows==0,"draw commits exactly one island reminder");Handler.advance(200);check(f.manager.shows==0,"success cancels fallback");
 f=new Fixture();f.prepare();Handler.advance(99);check(f.manager.shows==0,"bounded preparation");Handler.advance(1);
 check(f.manager.shows==1&&DynamicIslandHook.shown==null,"timeout withdraws island then restores original");DynamicIslandHook.draw();check(f.manager.shows==1&&f.entry.interrupted==0,"late draw cannot commit");
 check(!IslandHeadsUpBridge.listenerMayShow(f.entry.sbn,f.entry.ranking),"restored native reminder cannot duplicate through listener");
 check(!IslandHeadsUpBridge.downloadMayShow(f.entry.sbn,f.entry.ranking),"download failed revision remains native");
 f.manager.already=true;f.entry.sbn=new StatusBarNotification("message",2);
 check(!IslandHeadsUpBridge.downloadMayShow(f.entry.sbn,f.entry.ranking),"progress update cannot duplicate an existing native banner");
 f.manager.already=false;check(IslandHeadsUpBridge.downloadMayShow(f.entry.sbn,f.entry.ranking),"fresh progress can resume after native banner ends");
 String progressRevision=IslandHeadsUpBridge.revision(f.entry.sbn);f.entry.sbn.n.extras.put("progress",45);
 check(!progressRevision.equals(IslandHeadsUpBridge.revision(f.entry.sbn)),"progress mutation invalidates old frame proof");
 f=new Fixture();f.prepare();DynamicIslandHook.drawn=true;Handler.advance(16);
 check(f.entry.interrupted==1&&f.manager.shows==0,"queued view becoming visible is rechecked within deadline");
 f=new Fixture();DynamicIslandHook.prepare=false;f.prepare();check(f.manager.shows==1,"prepare failure restores");
 f=new Fixture();f.prepare();f.entry.canceled=true;Handler.advance(100);check(f.manager.shows==0&&DynamicIslandHook.shown==null,"canceled source never restored");
 f=new Fixture();f.prepare();f.entry.dismissed=true;DynamicIslandHook.draw();check(f.manager.shows==0&&f.entry.interrupted==0,"dismissed source never commits");
 f=new Fixture();f.prepare();IslandHeadsUpBridge.removed(f.entry.sbn);Handler.advance(100);check(f.manager.shows==0,"withdrawal cancels deadline");
 f=new Fixture();f.prepare();f.entry.sbn=new StatusBarNotification("message",2);DynamicIslandHook.draw();check(f.manager.shows==0&&f.entry.interrupted==0,"old entry revision cannot commit");
 f=new Fixture();f.prepare();f.entry.sbn.n.extras.put("title","mutated");DynamicIslandHook.draw();check(f.entry.interrupted==0,"in-place source mutation is also a new revision");
 f=new Fixture();f.prepare();f.provider.allowed=false;DynamicIslandHook.draw();check(f.manager.shows==0&&f.entry.interrupted==0&&DynamicIslandHook.shown==null,"native policy changed before draw");
 f=new Fixture();f.prepare();DynamicIslandHook.eligible=false;DynamicIslandHook.draw();check(f.manager.shows==1&&f.entry.interrupted==0,"environment change restores if native still permits");
 f=new Fixture();f.prepare();f.provider.fail=true;Handler.advance(100);check(f.manager.shows==1,"broken optional recheck preserves authorized original request");
 f=new Fixture();f.prepare();f.manager.fail=true;Handler.advance(100);check(f.manager.shows==1,"original show exception is never dispatched twice");
 f=new Fixture();f.prepare();IslandHeadsUpBridge.clear();check(f.manager.shows==1&&DynamicIslandHook.shown==null,"host retirement restores pending valid request");
 for(int mode=0;mode<9;mode++){
  f=new Fixture();Notification n=f.entry.sbn.n;
  if(mode==0)n.fullScreenIntent=new Object();if(mode==1)n.contentView=new Object();if(mode==2)n.bigContentView=new Object();if(mode==3)n.headsUpContentView=new Object();
  if(mode>=4){Notification.Action a=new Notification.Action();if(mode==4)a.auth=true;if(mode==5)a.inputs=new Object[]{new Object()};if(mode==6)a.actionIntent=null;if(mode==8)a.dataInputs=new Object[]{new Object()};n.actions=new Notification.Action[]{a};if(mode==7)n.actions=new Notification.Action[]{a,a,a,a};}
  f.show();check(f.manager.shows==1&&DynamicIslandHook.preparations==0,"incomplete important actions keep native: "+mode);
 }
 f=new Fixture();f.manager.already=true;f.show();check(f.manager.shows==1&&DynamicIslandHook.preparations==0,"already shown stays native");
 f=new Fixture();f.manager.showNotification(f.entry,true);check(f.manager.shows==1,"user pinned heads-up untouched");
 f=new Fixture();Looper.current=new Looper();f.show();Looper.current=Looper.getMainLooper();check(f.manager.shows==1,"unknown non-main presentation preserved");
 f=new Fixture();f.prepare();f.show();Handler.advance(100);check(f.manager.shows==1,"duplicate revision has one pending transaction");
 f=new Fixture();f.prepare();f.entry.sbn=new StatusBarNotification("message",2);DynamicIslandHook.drawn=false;f.show();Handler.advance(0);DynamicIslandHook.draw();Handler.advance(100);
 check(f.entry.interrupted==1&&f.manager.shows==0,"replacement invalidates old callbacks and owns new transaction");
 f=new Fixture();f.entry.ranking.importance=3;check(IslandHeadsUpBridge.listenerMayShow(f.entry.sbn,f.entry.ranking),"ordinary non-banner policy stays independent");
 System.out.println("PASS production heads-up transaction: "+checks+" checks");
 }}
'''
})
files['ls/augment/com/hook/IslandHeadsUpBridge.java']=(ROOT/'android/app/src/main/java/ls/augment/com/hook/IslandHeadsUpBridge.java').read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='duo-headsup-') as directory:
    for name,source in files.items():
        path=Path(directory)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-J-Duser.language=en','-encoding','UTF-8','-d',directory,*map(str,Path(directory).rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',directory,'ls.augment.com.hook.TestHeadsUp'],check=True)
