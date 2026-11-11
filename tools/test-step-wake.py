"""Exercise production wake authorization and exact retained task identities."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1];step=root/'android/app/src/main/java/ls/augment/com/step'
sources={
'android/content/Intent.java':'''package android.content;import android.os.Bundle;public class Intent {public Intent putExtras(Bundle b){return this;}public Intent putExtra(String k,boolean b){return this;}}''',
'android/os/Bundle.java':'''package android.os;public class Bundle {public boolean enabled=true;public Object user=0;public boolean getBoolean(String k){return enabled;}public Object getParcelable(String k){return user;}}''',
'android/os/Process.java':'package android.os;public class Process {public static Object myUserHandle(){return 0;}}',
'android/os/UserManager.java':'package android.os;public class UserManager {public static boolean foreground=true;public boolean isUserForeground(){return foreground;}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long uptimeMillis(){return 100;}}',
'ls/augment/com/step/WakeCases.java':r'''
package ls.augment.com.step;
import android.os.*;import android.content.Intent;import java.util.*;import java.util.concurrent.*;
class WorkspacePrefsProvider {static Object URI=new Object();}
class StepRuntime {
 static boolean enabled=true,unlocked;static void diagnostic(String a,String b){}static boolean interactive(Object c){return unlocked;}
 static class Queue {java.util.concurrent.ConcurrentLinkedQueue<Runnable> tasks=new java.util.concurrent.ConcurrentLinkedQueue<>();void post(Runnable r){tasks.add(r);}void postDelayed(Runnable r,long ms){tasks.add(r);}void one(){Runnable r=tasks.poll();if(r!=null)r.run();}}
 static class Context {Bundle snapshot=new Bundle();CountDownLatch read,proceed;Context getContentResolver(){return this;}Bundle call(Object uri,String a,Object b,Object c){if(read!=null)read.countDown();if(proceed!=null)try{proceed.await();}catch(Exception e){throw new RuntimeException(e);}return snapshot;}<T>T getSystemService(Class<T> c){return c.cast(new UserManager());}}
 static class Shell {static Queue main=new Queue();static Context context=new Context();}
}
class LiveWorkspace {
 static LiveWorkspace current;static int opens;boolean ready=true,closed,renewable=true,closing,leftSide;Object quickUser=0,reportTo;String session="s",exitReason="";
 static boolean running(){return current!=null&&!current.closed;}
 void close(String reason){closing=true;exitReason=reason;}
 static void open(Object reply,Intent i){opens++;current=new LiveWorkspace();}
}
public class WakeCases {
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static LiveWorkspace reset(){WorkspaceWake.cancel();StepRuntime.enabled=true;StepRuntime.unlocked=false;UserManager.foreground=true;StepRuntime.Shell.context=new StepRuntime.Context();StepRuntime.Shell.main=new StepRuntime.Queue();LiveWorkspace.opens=0;LiveWorkspace.current=new LiveWorkspace();return LiveWorkspace.current;}
 static void returned()throws Exception{long deadline=System.nanoTime()+2_000_000_000L;while(StepRuntime.Shell.main.tasks.isEmpty()&&System.nanoTime()<deadline)Thread.sleep(2);check(!StepRuntime.Shell.main.tasks.isEmpty(),"settings callback arrives");StepRuntime.Shell.main.one();}
 public static void main(String[] args)throws Exception{
  LiveWorkspace h=reset();WorkspaceWake.remember(h);h.closed=true;WorkspaceWake.awaken();check(LiveWorkspace.opens==0&&!WorkspaceWake.reading,"locked phone never opens Step");
  StepRuntime.unlocked=true;WorkspaceWake.awaken();returned();check(LiveWorkspace.opens==1&&WorkspaceWake.asleep==null,"unlock restores once");WorkspaceWake.awaken();check(LiveWorkspace.opens==1,"repeated unlock is not duplicate entry");
  h=reset();WorkspaceWake.remember(h);StepRuntime.unlocked=true;WorkspaceWake.awaken();check(!WorkspaceWake.reading&&LiveWorkspace.opens==0,"wait for old task cleanup");h.closed=true;StepRuntime.Shell.main.one();returned();check(LiveWorkspace.opens==1,"cleanup completion permits restoration");
  h=reset();h.closing=true;h.exitReason="manual";WorkspaceWake.remember(h);check(WorkspaceWake.asleep==null,"manual exit never armed");
  h=reset();WorkspaceWake.renewalSuspended(h);check(WorkspaceWake.asleep==h&&h.closing&&h.exitReason.equals("息屏暂挂"),"in-flight renewal arms sleep bookmark before close");
  h.closed=true;StepRuntime.unlocked=true;WorkspaceWake.awaken();returned();check(LiveWorkspace.opens==1,"renewal racing screen-off restores on unlock");
  h=reset();WorkspaceWake.remember(h);h.closed=true;StepRuntime.enabled=false;StepRuntime.unlocked=true;WorkspaceWake.awaken();check(WorkspaceWake.asleep==null&&LiveWorkspace.opens==0,"disabled feature cannot auto resume");
  h=reset();WorkspaceWake.remember(h);h.closed=true;StepRuntime.unlocked=true;UserManager.foreground=false;WorkspaceWake.awaken();check(WorkspaceWake.asleep==null&&LiveWorkspace.opens==0,"user switch cancels restoration");
  h=reset();WorkspaceWake.remember(h);h.closed=true;StepRuntime.unlocked=true;StepRuntime.Shell.context.snapshot.enabled=false;WorkspaceWake.awaken();returned();check(LiveWorkspace.opens==0,"fresh saved master switch wins");
  h=reset();WorkspaceWake.remember(h);h.closed=true;StepRuntime.unlocked=true;StepRuntime.Shell.context.read=new CountDownLatch(1);StepRuntime.Shell.context.proceed=new CountDownLatch(1);WorkspaceWake.awaken();check(StepRuntime.Shell.context.read.await(2,TimeUnit.SECONDS),"read started");WorkspaceWake.cancel();StepRuntime.Shell.context.proceed.countDown();returned();check(LiveWorkspace.opens==0,"stale settings callback cannot reopen cancelled session");
  ParkedWorkspace bookmark=new ParkedWorkspace();Object a=new Object(),b=new Object();bookmark.put(ParkedWorkspace.UPPER,new TaskIdentity(42,0,0,a));bookmark.put(ParkedWorkspace.NAVIGATION,new TaskIdentity(43,0,0,b));
  int[] ids=bookmark.idsFor(u->u==0);check(ids.length==7&&ids[5]==42&&ids[6]==43,"video and navigation retained separately");
  check(!bookmark.matches(6,43,0,new Object())&&!bookmark.matches(6,43,10,b),"reused task ID and foreign user rejected");
  ParkedWorkspace copy=bookmark.copy();bookmark.consumed(6);check(copy.matches(6,43,0,b)&&!bookmark.matches(6,43,0,b),"readmission copy and consumption stay isolated");
  copy.retainRunning(i->i.id==42,3,true);check(copy.idsFor(u->true)[6]==-1&&copy.idsFor(u->true)[5]==42,"ended navigation omitted without losing video");
  copy.retainRunning(i->true,3,false);check(copy.idsFor(u->true)[5]==-1,"disabled upper removes both upper roles");
  System.out.println("PASS "+checks+" wake, lock, cancellation and retained identity checks");
 }
}
'''}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-wake-') as temp:
 p=Path(temp)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 files=list(p.rglob('*.java'))+[step/(n+'.java') for n in ['WorkspaceWake','ParkedWorkspace','TaskIdentity','SideSlots']]
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.WakeCases'],check=True)
