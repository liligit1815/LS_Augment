"""Exercise ordered source transitions against a busy native animation slot."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path(os.environ['JAVA_HOME']) / 'bin'
HARNESS = r'''
import ls.augment.com.IslandNativeUpdateQueue;
import java.util.*;
public class QueueTest {
 static int checks;
 static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 static class Host implements IslandNativeUpdateQueue.Scheduler {
  long now;boolean busy;int fallbacks;List<String> nativeCalls=new ArrayList<>();List<Runnable> scheduled=new ArrayList<>();
  IslandNativeUpdateQueue queue=new IslandNativeUpdateQueue(()->busy,()->now,this,()->fallbacks++);
  public void post(Runnable r,long delay){check(delay==16);scheduled.add(r);}
  public void cancel(Runnable r){scheduled.removeIf(x->x==r);}
  void operation(String name){queue.offer(()->{nativeCalls.add(name);busy=true;});}
  void frame(){List<Runnable> copy=new ArrayList<>(scheduled);scheduled.clear();for(Runnable r:copy)r.run();}
  void end(){busy=false;frame();}
 }
 public static void main(String[] args){
  Host h=new Host();h.operation("old-create");h.operation("old-remove");h.operation("new-create");
  check(h.nativeCalls.equals(List.of("old-create")));check(h.scheduled.size()==1);
  h.frame();check(h.nativeCalls.size()==1);check(h.scheduled.size()==1);
  h.end();check(h.nativeCalls.equals(List.of("old-create","old-remove")));check(h.scheduled.size()==1);
  h.end();check(h.nativeCalls.equals(List.of("old-create","old-remove","new-create")));check(h.scheduled.isEmpty());
  check(h.fallbacks==0);
  Host stalled=new Host();stalled.busy=true;stalled.operation("remove");stalled.operation("create");
  stalled.now=3999;stalled.frame();check(stalled.nativeCalls.isEmpty());
  stalled.now=4000;stalled.frame();check(stalled.fallbacks==1);check(stalled.nativeCalls.equals(List.of("remove","create")));
  check(stalled.scheduled.isEmpty());stalled.operation("native-after-fallback");check(stalled.nativeCalls.size()==3);
  Host closed=new Host();closed.busy=true;closed.operation("remove");closed.queue.close();closed.queue.close();
  check(closed.nativeCalls.equals(List.of("remove")));check(closed.scheduled.isEmpty());check(closed.fallbacks==0);
  Host bounded=new Host();bounded.busy=true;for(int i=0;i<33;i++)bounded.operation("event"+i);
  check(bounded.fallbacks==1);check(bounded.nativeCalls.size()==33);check(bounded.scheduled.isEmpty());
  for(int i=0;i<33;i++)check(bounded.nativeCalls.get(i).equals("event"+i));
  Host reentrant=new Host();reentrant.queue.offer(()->{reentrant.nativeCalls.add("first");reentrant.operation("second");});
  check(reentrant.nativeCalls.equals(List.of("first","second")));check(reentrant.scheduled.isEmpty());
  System.out.println("native update queue: "+checks+" checks passed");
 }
}
'''
with tempfile.TemporaryDirectory(prefix='island-native-updates-') as directory:
    temp = Path(directory)
    source = temp / 'QueueTest.java'
    source.write_text(HARNESS, encoding='utf-8')
    subprocess.run([str(JAVA/'javac.exe'), '-encoding', 'UTF-8', '-d', str(temp),
                    str(ROOT/'android/app/src/main/java/ls/augment/com/IslandNativeUpdateQueue.java'), str(source)], check=True)
    subprocess.run([str(JAVA/'java.exe'), '-cp', str(temp), 'QueueTest'], check=True)
