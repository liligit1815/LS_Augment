"""Run production post-return barriers with delayed callbacks and changed owners."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    s=(STEP/file).read_text('utf-8');start=s.index(signature);end=s.index('{',start)+1;depth=1
    while depth: depth+=(s[end]=='{')-(s[end]=='}');end+=1
    return s[start:end].replace('android.os.SystemClock','SystemClock')
top=(STEP/'NativeTopTask.java').read_text('utf-8')
assert top.index('awaitCommit(group,expected')<top.index('normalizeReturn(record,expected')<top.index('record.dirty=false;if(!occupied())reset();')
guard=(STEP/'NativeWorkspaceGuard.java').read_text('utf-8')
assert '()->normalizeExit(expected,()->{' in guard
harness=r'''
package ls.augment.com.step;
import java.util.*;
public class ReturnCommitCases {
 static int checks,completed,retries,finishes,normalized,verified;
 static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static class IBinder{}static class SystemClock{static long now;static long uptimeMillis(){return now;}}
 static IBinder owner=new IBinder();static boolean active=true,ending;static CommitBarrier pendingCommit;
 static Map<Integer,SavedTask> saved=new LinkedHashMap<>();
 static class SavedTask{int id=7;boolean dirty=true,valid=true;}
 static class Handler{List<Runnable> queue=new ArrayList<>();void post(Runnable r){queue.add(r);}void postDelayed(Runnable r,long ms){queue.add(r);}void tick(){var q=new ArrayList<>(queue);queue.clear();q.forEach(Runnable::run);}}
 static class Tx{boolean applied;List<Runnable> ack=new ArrayList<>();void commit(){check(applied,"ack after apply");ack.forEach(Runnable::run);ack.clear();}}
 static class Wm{static Object lock=new Object(),display=new Object(),spec;static boolean active;static Handler handler;static Tx tx;}
 static Object field(Object o,String n){return n.equals("mMagnificationSpec")?Wm.spec:new Object();}
 static Object call(Object o,String n,Object... a){if(n.equals("getPendingTransaction"))return Wm.tx;if(n.equals("apply"))Wm.tx.applied=true;return null;}
 static void verifyRestored(SavedTask r){verified++;if(!r.valid)throw new IllegalStateException("owner changed");}
 static void resetReturnedTransform(SavedTask r,Object tx){check(r.valid,"only verified task reset");normalized++;}
 static void trackCommit(Object tx,CommitBarrier b){int slot=b.add();((Tx)tx).ack.add(()->b.commit(slot));}
 static void replay(CommitBarrier b,SavedTask r){resetReturnedTransform(r,Wm.tx);trackCommit(Wm.tx,b);Wm.tx.applied=true;}
 static void traceHandoff(String p,long o,int a,int b){}static void report(Object a,int b,String c,int d){}
 static void retryRecovery(String s){retries++;}static boolean finish(String s){finishes++;return false;}
 AWAIT
 EXIT
 RETURN
 static SavedTask reset(){owner=new IBinder();active=true;ending=true;pendingCommit=null;Wm.active=false;Wm.spec=null;Wm.tx=new Tx();Wm.handler=new Handler();saved.clear();SystemClock.now=0;completed=retries=finishes=normalized=verified=0;SavedTask r=new SavedTask();saved.put(r.id,r);return r;}
 static void scenarios(boolean exit){
  SavedTask r=reset();ending=exit;Runnable done=()->{completed++;r.dirty=false;};
  if(exit)normalizeExit(owner,done);else normalizeReturn(r,owner,done);
  check(normalized==1 && verified==1,"exact owned task normalized");check(completed==0 && r.dirty,"restoration retained until normalization commit");
  Wm.handler.tick();check(completed==0,"delay does not count as acknowledgment");Wm.tx.commit();Wm.handler.tick();check(completed==1 && !r.dirty,"second commit releases ownership");Wm.handler.tick();check(completed==1,"completion exactly once");
  reset();ending=exit;if(exit)normalizeExit(owner,()->completed++);else normalizeReturn(saved.get(7),owner,()->completed++);
  SystemClock.now=1801;Wm.handler.tick();check(completed==0 && (exit?retries:finishes)==1,"missing callback recovers without false success");Wm.tx.commit();Wm.handler.tick();check(completed==0,"late acknowledgment cannot resume cancelled return");
  reset();ending=exit;if(exit)normalizeExit(owner,()->completed++);else normalizeReturn(saved.get(7),owner,()->completed++);
  owner=new IBinder();Wm.tx.commit();Wm.handler.tick();check(completed==0,"old callback cannot finish newer session");
 }
 public static void main(String[] args){
  scenarios(true);scenarios(false);
  for(int k=0;k<5;k++){SavedTask r=reset();IBinder expected=owner;switch(k){case 0:owner=new IBinder();break;case 1:ending=false;break;case 2:Wm.active=true;break;case 3:Wm.spec=new Object();break;case 4:r.valid=false;break;}
   try{normalizeExit(expected,()->completed++);throw new AssertionError("foreign exit accepted");}catch(IllegalStateException good){checks++;}
   check(normalized==0 && !Wm.tx.applied,"changed exit owner receives no write");}
  for(int k=0;k<4;k++){SavedTask r=reset();ending=false;IBinder expected=owner;switch(k){case 0:owner=new IBinder();break;case 1:active=false;break;case 2:ending=true;break;case 3:r.valid=false;break;}
   try{normalizeReturn(r,expected,()->completed++);throw new AssertionError("foreign upper accepted");}catch(IllegalStateException good){checks++;}
   check(normalized==0 && !Wm.tx.applied,"changed upper owner receives no write");}
  reset().dirty=false;normalizeExit(owner,()->completed++);check(normalized==0,"clean task not reclaimed on exit");Wm.tx.commit();Wm.handler.tick();check(completed==1,"empty restoration still acknowledges final transaction");
  System.out.println("PASS "+checks+" post-return commit checks: delayed/missing/reordered ownership, upper return and exit");
 }
}
'''.replace('AWAIT',method('NativeWorkspaceGuard.java','static void awaitCommit(')).replace('EXIT',method('NativeWorkspaceGuard.java','static void normalizeExit(')).replace('RETURN',method('NativeTopTask.java','static void normalizeReturn('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-return-') as tmp:
    folder=Path(tmp);file=folder/'ReturnCommitCases.java';file.write_text(harness,'utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,file,STEP/'CommitBarrier.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.ReturnCommitCases'],check=True)
