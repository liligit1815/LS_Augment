"""Preference changes wait for native handoffs and return each exact top task once."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
s=(root/'android/app/src/main/java/ls/augment/com/step/LiveWorkspace.java').read_text(encoding='utf8')
methods=s[s.index('    final Runnable upperDisable='):s.index('    void requireUpperAdmission(')]
code=r'''
import java.util.*;
public class UpperDisable {
 static int checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
 static class Queue {ArrayDeque<Runnable> items=new ArrayDeque<>();void removeCallbacks(Runnable r){items.removeIf(v->v==r);}void post(Runnable r){items.add(r);}void postDelayed(Runnable r,long t){items.add(r);}void next(){items.remove().run();}}
 Queue main=new Queue();boolean upperEnabled,closing,closed,ready=true,busy;Object quickBar=new Object();int upperId=7,upperAppId=7,upperNavigationId=8;
 List<Integer> returned=new ArrayList<>();Runnable committed;
 void preflight(){if(busy)throw new IllegalStateException();}
 void upperActionFor(int id,String action,Runnable done){check(action.equals("disable"),"server decides foreground/background at commit");returned.add(id);busy=true;committed=()->{if(upperId==id)upperId=-1;if(upperAppId==id)upperAppId=-1;if(upperNavigationId==id)upperNavigationId=-1;busy=false;done.run();};}
 METHODS
 public static void main(String[] args){
  UpperDisable h=new UpperDisable();h.busy=true;h.scheduleUpperDisable();h.main.next();check(h.returned.isEmpty()&&h.main.items.size()==1,"pending handoff not interrupted");
  h.busy=false;h.main.next();check(h.returned.equals(List.of(7)),"current top returns first");h.scheduleUpperDisable();h.main.next();check(h.returned.size()==1,"repeat write cannot duplicate pending return");
  h.committed.run();h.main.next();check(h.returned.equals(List.of(7,8)),"hidden navigation handled after actual commit");h.committed.run();h.main.next();check(h.main.items.isEmpty(),"drain terminates after last task");
  h=new UpperDisable();h.scheduleUpperDisable();h.upperEnabled=true;h.scheduleUpperDisable();check(h.main.items.isEmpty()&&h.returned.isEmpty(),"re-enable cancels queued disable");
  h=new UpperDisable();h.scheduleUpperDisable();h.closed=true;h.main.next();check(h.returned.isEmpty(),"closed scene cannot move tasks");
  h=new UpperDisable();h.upperId=-1;h.upperAppId=-1;h.scheduleUpperDisable();h.main.next();check(h.returned.equals(List.of(8)),"hidden navigation-only scene drains");
  System.out.println("PASS "+checks+" production top disable lifecycle checks");
 }
}
'''.replace('METHODS',methods)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-disable-') as d:
 p=Path(d);f=p/'UpperDisable.java';f.write_text(code,encoding='utf8')
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True)
 subprocess.run([java/'java','-cp',p,'UpperDisable'],check=True)
