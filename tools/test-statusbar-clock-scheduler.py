"""Exercise the production clock scheduler against visibility and power transitions."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/SystemUiHook.java').read_text(encoding='utf-8')

def method(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

methods = '\n'.join(method(marker) for marker in (
    'void setSecondTicker(', 'boolean canRun()', 'void cancelScheduled()',
    'void schedule()', '@Override public void run()'))
harness = r'''
public class TestClockSchedule {
 static int checks,renders;
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static class View {static final int VISIBLE=0;}
 static class Context {final android.os.PowerManager power=new android.os.PowerManager();
  <T> T getSystemService(Class<T> type){return type.cast(power);}}
 static class Clock {
  boolean attached=true,shown=true;int visibility;final Context context=new Context();
  int delayed,frames,removed;long delay;Runnable pending;
  boolean isAttachedToWindow(){return attached;}boolean isShown(){return shown;}
  int getWindowVisibility(){return visibility;}Context getContext(){return context;}
  void removeCallbacks(Runnable r){removed++;if(pending==r)pending=null;}
  void postOnAnimationDelayed(Runnable r,long d){frames++;pending=r;delay=d;}
  void postDelayed(Runnable r,long d){delayed++;pending=r;delay=d;}
 }
 static class FeatureSettings {
  static boolean high=true;static int interval=16;
  static boolean enabled(Context c,String k){return high;}
  static int integer(Context c,String k,int fallback,int min,int max){return Math.max(min,Math.min(max,interval));}
 }
 static void renderClock(State s,boolean style){renders++;check(!style,"ticks do not reapply view geometry");s.setSecondTicker(true,s.milliseconds);}
 static class State implements Runnable {
  final Clock clock=new Clock();boolean ticking,scheduled,milliseconds;
  /* METHODS */
 }
 public static void main(String[] args){
  State state=new State();state.setSecondTicker(true,true);
  check(state.clock.frames==1&&state.clock.delayed==0,"millisecond refresh is posted to the display animation queue");
  check(state.clock.delay>0&&state.clock.delay<=16,"refresh interval clamps to the configured minimum");
  state.schedule();check(state.clock.frames==1,"only one frame request can be pending");
  state.clock.context.power.interactive=false;state.cancelScheduled();state.schedule();
  check(state.clock.pending==null&&!state.scheduled,"screen off cancels all recurring jobs");
  int before=renders;state.run();check(renders==before&&state.clock.pending==null,"screen off cannot render or requeue");
  state.clock.context.power.interactive=true;state.schedule();
  check(state.clock.pending!=null,"screen on resumes an enabled clock");
  state.clock.shown=false;state.cancelScheduled();state.schedule();
  check(state.clock.pending==null,"hidden clocks do not poll");
  state.clock.shown=true;state.clock.attached=false;state.schedule();
  check(state.clock.pending==null,"detached clocks do not schedule");
  state.clock.attached=true;state.clock.visibility=8;state.schedule();
  check(state.clock.pending==null,"invisible window does not schedule");
  state.clock.visibility=0;state.setSecondTicker(true,false);
  check(state.clock.delayed==1&&state.clock.delay>0&&state.clock.delay<=1000,"plain seconds use a wall-time aligned tick");
  state.setSecondTicker(false,false);check(state.clock.pending==null&&!state.ticking,"turning custom refresh off releases jobs");
  FeatureSettings.high=false;state.setSecondTicker(true,true);
  check(state.clock.delayed==2,"millisecond text alone does not override the disabled high-frequency preference");
  FeatureSettings.high=true;FeatureSettings.interval=250;state.cancelScheduled();state.schedule();
  check(state.clock.frames==3&&state.clock.delay<=250,"slower configured refresh still aligns to a frame");
  state.clock.pending=null;state.run();
  check(renders==before+1&&state.clock.pending!=null&&state.scheduled,"each rendered tick queues exactly one successor");
  System.out.println("PASS clock scheduling lifecycle: "+checks+" checks");
 }
}
'''.replace('/* METHODS */', methods)
java_home = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8'))
with tempfile.TemporaryDirectory(prefix='duo-clock-scheduler-') as tmp:
    out = Path(tmp)
    power = out / 'android/os/PowerManager.java'
    power.parent.mkdir(parents=True)
    power.write_text('package android.os;public class PowerManager{public boolean interactive=true;public boolean isInteractive(){return interactive;}}', encoding='utf-8')
    test = out / 'TestClockSchedule.java'
    test.write_text(harness, encoding='utf-8')
    binary = lambda name: str(java_home / 'bin' / (name + ('.exe' if os.name == 'nt' else '')))
    subprocess.run([binary('javac'), '-encoding', 'UTF-8', '-d', tmp, str(power), str(test)], check=True)
    subprocess.run([binary('java'), '-cp', tmp, 'TestClockSchedule'], check=True)
