"""Execute the real Surface ownership handoff and workspace presentation model."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
SUPPORT, SRC = BASE['SUPPORT'], BASE['SRC']
SURFACE = '''package android.view; public final class Surface {
 public final java.util.concurrent.atomic.AtomicInteger releases=new java.util.concurrent.atomic.AtomicInteger();
 public void release(){if(releases.incrementAndGet()>1)throw new AssertionError("double release");}
}'''
TEST = r'''package ls.augment.com;
import android.view.Surface;import java.util.*;import java.util.concurrent.*;
public final class TestOutputHandoff {
 static int cases,checks;
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}
 static void test(String name,Case action)throws Exception{action.run();cases++;System.out.println("PASS actual output ownership: "+name);}
 static void cancelled(AtomicWorkbenchSurfaceHandoff h){try{h.take();throw new AssertionError("late claim admitted");}catch(CancellationException expected){}}
 static AtomicWorkbenchWorkspaceModel filled(){var model=new AtomicWorkbenchWorkspaceModel();for(int i=0;i<4;i++)check(model.commitLaunch(model.planLaunch("app"+i+"/.Main")),"fixture launch");return model;}
 static int[] sides(AtomicWorkbenchWorkspaceModel m){return new int[]{m.sideWindowId(0),m.sideWindowId(1),m.sideWindowId(2)};}
 public static void main(String[] args)throws Exception {
  test("timeout before engine admission releases the incoming producer once",()->{var s=new Surface();var h=new AtomicWorkbenchSurfaceHandoff(s);h.close();h.close();cancelled(h);check(s.releases.get()==1,"queued Surface leaked");});
  test("timeout after claim cannot release the running platform's producer",()->{var s=new Surface();var h=new AtomicWorkbenchSurfaceHandoff(s);Surface taken=h.take();h.close();check(taken==s&&s.releases.get()==0,"waiter released an owned producer");taken.release();check(s.releases.get()==1,"platform did not release");});
  test("double admission is rejected while the first platform keeps ownership",()->{var s=new Surface();var h=new AtomicWorkbenchSurfaceHandoff(s);Surface taken=h.take();cancelled(h);h.close();check(s.releases.get()==0,"double take released original");taken.release();});
  test("detach has the same cancellation boundary without inventing a Surface",()->{var h=new AtomicWorkbenchSurfaceHandoff(null);check(h.take()==null,"detach manufactured producer");h.close();cancelled(h);var expired=new AtomicWorkbenchSurfaceHandoff(null);expired.close();cancelled(expired);});
  test("a platform failure still leaves the claimed handle owned by the caller",()->{var s=new Surface();try(var h=new AtomicWorkbenchSurfaceHandoff(s)){Surface taken=h.take();try{throw new IllegalStateException("fixed");}catch(IllegalStateException expected){}finally{taken.release();}}check(s.releases.get()==1,"failed platform lost ownership");});
  test("actual timeout and admission races never leak or double release",()->{
   for(int i=0;i<300;i++){var s=new Surface();var h=new AtomicWorkbenchSurfaceHandoff(s);var start=new CountDownLatch(1);var errors=new java.util.concurrent.atomic.AtomicReference<Throwable>();
    Thread engine=new Thread(()->{try{start.await();Surface taken=h.take();Thread.yield();checkRace(taken.releases.get()==0,"running producer released by timeout");taken.release();}catch(CancellationException expected){}catch(Throwable error){errors.set(error);}});
    Thread waiter=new Thread(()->{try{start.await();h.close();}catch(Throwable error){errors.set(error);}});
    engine.start();waiter.start();start.countDown();engine.join(5000);waiter.join(5000);check(!engine.isAlive()&&!waiter.isAlive(),"handoff deadlock");if(errors.get()!=null)throw new AssertionError(errors.get());h.close();check(s.releases.get()==1,"race ownership lost");}
  });
  test("expansion keeps every window identity and exact side order through repeated returns",()->{var m=filled();int main=m.mainWindowId();int[] order=sides(m);String[] components=new String[4];for(int i=0;i<4;i++)components[i]=m.component(i);
   for(int round=0;round<24;round++){check(m.setMainExpanded(true)&&m.mainExpanded(),"expansion rejected");check(m.mainWindowId()==main&&Arrays.equals(order,sides(m)),"expansion changed window roles");for(int i=0;i<4;i++)check(m.hasWindow(i)&&components[i].equals(m.component(i)),"expansion changed app ownership");check(m.setMainExpanded(false)&&!m.mainExpanded(),"return rejected");check(m.mainWindowId()==main&&Arrays.equals(order,sides(m)),"return reordered sides");}});
  test("empty and desktop presentations cannot expand",()->{var m=new AtomicWorkbenchWorkspaceModel();check(!m.setMainExpanded(true),"empty expanded");m.commitLaunch(m.planLaunch("app/.Main"));m.showDesktop();check(!m.setMainExpanded(true)&&!m.mainExpanded(),"desktop expanded");});
  test("desktop and empty-side HOME leave expanded presentation without releasing apps",()->{var m=new AtomicWorkbenchWorkspaceModel();m.commitLaunch(m.planLaunch("app/.Main"));int id=m.mainWindowId();m.setMainExpanded(true);m.showDesktop();check(!m.mainExpanded()&&m.hasWindow(id),"desktop retained expansion or dropped app");m.promote(id);m.setMainExpanded(true);check(m.parkMainInEmptySide(0),"empty side refused");check(!m.mainExpanded()&&m.desktopVisible()&&m.hasWindow(id),"HOME discarded original window");});
  test("side retirement preserves expansion while main retirement and reset end it",()->{var m=filled();m.setMainExpanded(true);m.removeWindow(m.sideWindowId(0));check(m.mainExpanded(),"side close changed mode");m.removeWindow(m.mainWindowId());check(!m.mainExpanded()&&m.desktopVisible(),"main close retained expansion");m=filled();m.setMainExpanded(true);m.reset();check(!m.mainExpanded()&&m.appCount()==0,"reset retained expansion");});
  test("a presentation transition invalidates an older launch plan",()->{var m=new AtomicWorkbenchWorkspaceModel();m.commitLaunch(m.planLaunch("app/.Main"));var p=m.planLaunch("next/.Main");m.setMainExpanded(true);check(!m.commitLaunch(p)&&m.appCount()==1&&m.mainExpanded(),"stale plan changed expanded workspace");});
  System.out.println("OUTPUT HANDOFF RESULT "+cases+" cases; "+checks+" assertions");
 }
 static void checkRace(boolean value,String why){if(!value)throw new AssertionError(why);}
}'''


def main():
    production = {name: (SRC / name).read_text(encoding='utf-8') for name in (
        'AtomicWorkbenchSurfaceHandoff.java', 'AtomicWorkbenchWorkspaceModel.java')}
    variants = [('production', production, None)]
    for label, filename, old, new, failure in (
        ('CLAIM_MUST_MOVE_OWNERSHIP', 'AtomicWorkbenchSurfaceHandoff.java', 'pending = null;\n        return result;', 'return result;', 'waiter released an owned producer'),
        ('CANCELLED_QUEUE_MUST_NOT_CLAIM', 'AtomicWorkbenchSurfaceHandoff.java', 'if (closed || claimed)', 'if (claimed)', 'late claim admitted'),
        ('FOCUS_RETURN_MUST_KEEP_SIDE_ORDER', 'AtomicWorkbenchWorkspaceModel.java', 'mainExpanded = expanded;\n        revision++;', 'mainExpanded = expanded;\n        int swap = sides[0]; sides[0] = sides[1]; sides[1] = swap;\n        revision++;', 'expansion changed window roles'),
        ('DESKTOP_MUST_END_EXPANSION', 'AtomicWorkbenchWorkspaceModel.java', 'public void showDesktop() {\n        mainExpanded = false;', 'public void showDesktop() {', 'desktop retained expansion'),
    ):
        assert old in production[filename], label
        changed = dict(production); changed[filename] = changed[filename].replace(old, new, 1)
        variants.append((label, changed, failure))
    for label, sources, expected in variants:
        with tempfile.TemporaryDirectory(prefix='lsa-output-handoff-') as temporary:
            work = Path(temporary)
            files = {'android/view/Surface.java': SURFACE, 'ls/augment/com/TestOutputHandoff.java': TEST}
            files.update({'ls/augment/com/' + name: value for name, value in sources.items()})
            paths = []
            for name, value in files.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding='utf-8'); paths.append(str(path))
            subprocess.run([SUPPORT['JAVAC'], '--release', '17', '-encoding', 'UTF-8', '-d', str(work), *paths], check=True, timeout=60, env=SUPPORT['ENV'])
            result = subprocess.run([SUPPORT['JAVA'], '-cp', str(work), 'ls.augment.com.TestOutputHandoff'], text=True, capture_output=True, timeout=45, env=SUPPORT['ENV'])
            if expected is None:
                print(result.stdout, end=''); print(result.stderr, end=''); result.check_returncode()
            else:
                assert result.returncode != 0 and expected in result.stdout + result.stderr, (label, result.stdout, result.stderr)
                print('PASS rejected output ownership negative:', label)


if __name__ == '__main__':
    main()
