"""Execute the fixed context, Recents and fullscreen capability boundaries, including old/missing interfaces."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
JDK = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')

def member(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

FILES = {
    'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo{public int uid;public String packageName;}',
    'android/content/Context.java': '''package android.content;public class Context {
 public android.content.pm.ApplicationInfo info=new android.content.pm.ApplicationInfo();public String op;public Context app;public boolean unavailable;
 public Context(int uid,String pkg){info.uid=uid;info.packageName=pkg;op=pkg;}
 public android.content.pm.ApplicationInfo getApplicationInfo(){if(unavailable)throw new IllegalStateException();return info;}
 public String getOpPackageName(){return op;}public Context getApplicationContext(){return app;}}''',
    'android/os/Process.java': 'package android.os;public class Process{public static int uid=10475;public static int myUid(){return uid;}}',
    'android/os/SystemClock.java': 'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}',
    'android/view/View.java': 'package android.view;public class View{public boolean attached;public boolean isAttachedToWindow(){return attached;}}',
    'ls/augment/com/StartupDiagnostics.java': 'package ls.augment.com;public class StartupDiagnostics{public static int records;public static void record(String a,String b,Throwable t){records++;}}',
}

HARNESS = r'''package ls.augment.com.hook;
import android.content.Context;import android.os.SystemClock;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public class FeedbackRegression {
 static int checks;static void check(boolean condition,String why){checks++;if(!condition)throw new AssertionError(why);}
 static Context applicationContext,current;
 static AtomicInteger invalidations=new AtomicInteger();static AtomicBoolean pollingStarted=new AtomicBoolean();
 static final ScheduledExecutorService CONFIG_WORKER=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r);t.setDaemon(true);return t;});
 static Context currentApplication(){return current;}static void requestRefresh(){}
 static final Map<String,String> startupReadFailures=new HashMap<>();static final Map<String,Long> startupReadFailureTimes=new HashMap<>();
 // METHODS
 static class Legacy {List<?> tasks;public void applyLoadPlan(List<?> tasks){this.tasks=tasks;}}
 static class Modern {private int mAppliedTaskListChangeId=47;int delivered=-1;List<?> tasks;
  public void applyLoadPlan(List<?> tasks,int token){this.tasks=tasks;delivered=token;}}
 static class Child extends Modern{}
 static class Wrong {public Object applyLoadPlan(List<?> tasks,int token){return null;}}
 static class Unknown {public void applyLoadPlan(List<?> tasks,boolean token){}}
 static class NoToken {public void applyLoadPlan(List<?> tasks,int token){throw new AssertionError("unknown generation invoked");}}
 static class Manager {public boolean mDynamicIslandEnable;}
 static class Permanent {public boolean mDynamicIslandFuncEnable;public android.view.View mDynamicIslandRoot=new android.view.View(),mStickyAnimationView=new android.view.View(),mDynamicIslandPanelRoot=new android.view.View(),mDynamicIslandTouchHelper=new android.view.View();
  public int updates;public void updateDynamicIslandEnabled(boolean on){updates++;mDynamicIslandFuncEnable=on;}}
 static class PermanentChild extends Permanent{}
 static class Broken extends Permanent {public void updateDynamicIslandEnabled(boolean on){}}
 public static void main(String[] args)throws Exception {
  Context host=new Context(10475,"com.zte.recommend"),foreign=new Context(1000,"android");current=host;
  check(remember(foreign)==host,"early/foreign context did not recover real Application");
  for(int i=0;i<1000;i++)check(remember(i%2==0?foreign:host)==host,"foreign context poisoned retained provider identity");
  check(invalidations.get()==1,"same valid context repeatedly invalidated verified configuration");
  applicationContext=foreign;current=null;check(remember(foreign)==null,"invalid retained context not discarded");
  current=host;check(remember(null)==host,"later Application did not recover after bindApplication");
  Context wrapper=new Context(20001,"resource.owner");wrapper.app=host;check(ConfigHostContext.select(null,wrapper)==host,"valid application behind resource wrapper rejected");
  Context mismatch=new Context(10475,"com.zte.recommend");mismatch.op="android";
  check(ConfigHostContext.select(null,mismatch)==null,"op package/UID mismatch admitted");
  Context shared=new Context(10475,"shared.uid.app");check(ConfigHostContext.select(null,shared)==shared,"shared UID package rejected");
  host.unavailable=true;check(ConfigHostContext.select(host,shared)==shared,"unavailable cached context retained");host.unavailable=false;
  android.os.Process.uid=1000;check(ConfigHostContext.select(null,foreign)==foreign,"system_server native context rejected");android.os.Process.uid=10475;
  for(int i=0;i<1000;i++){SystemClock.now=i*5;startupReadFailure("CONFIG_PROVIDER_FAILED","permission_denied",new SecurityException());}
  check(ls.augment.com.StartupDiagnostics.records==1,"same alternating failure floods startup evidence");
  SystemClock.now=300001;startupReadFailure("CONFIG_PROVIDER_FAILED","permission_denied",new SecurityException());
  check(ls.augment.com.StartupDiagnostics.records==2,"persistent error has no bounded reminder");
  startupReadFailure("CONFIG_PROVIDER_FAILED","provider_unavailable",new IllegalStateException());check(ls.augment.com.StartupDiagnostics.records==3,"new failure reason hidden");
  Legacy old=new Legacy();RecentsLoadPlan.clear(RecentsLoadPlan.resolve(Legacy.class),old);check(old.tasks.isEmpty(),"legacy clear failed");
  Child modern=new Child();RecentsLoadPlan.clear(RecentsLoadPlan.resolve(Child.class),modern);check(modern.tasks.isEmpty()&&modern.delivered==47,"native generation lost on inherited modern clear");
  List<Object> original=List.of(List.of("foreign","owned"),99);Object[] filtered=RecentsLoadPlan.replaceTasks(original,List.of("owned"));
  check(filtered.length==2&&filtered[1].equals(99)&&((List<?>)original.get(0)).size()==2,"filter changed generation or native cache");
  for(Class<?> type:new Class<?>[]{Wrong.class,Unknown.class}){try{RecentsLoadPlan.resolve(type);throw new AssertionError("unknown signature accepted");}catch(NoSuchMethodException expected){checks++;}}
  try{RecentsLoadPlan.clear(RecentsLoadPlan.resolve(NoToken.class),new NoToken());throw new AssertionError("missing native token invented");}catch(NoSuchFieldException expected){checks++;}
  Manager manager=new Manager();PermanentChild pm=new PermanentChild();NativeIslandFullscreen full=new NativeIslandFullscreen(manager,pm);full.validateWindow();full.apply(true);
  check(full.awaitingWindow()==pm.mDynamicIslandRoot,"fullscreen first window wait lost");pm.mDynamicIslandRoot.attached=true;
  check(full.awaitingWindow()==pm.mDynamicIslandPanelRoot,"fullscreen panel attach omitted");pm.mDynamicIslandPanelRoot.attached=true;
  check(full.awaitingWindow()==null,"attached fullscreen windows still pending");
  check(manager.mDynamicIslandEnable&&pm.mDynamicIslandFuncEnable&&pm.updates==1,"fullscreen gate not synchronized");full.restore();
  check(!manager.mDynamicIslandEnable&&!pm.mDynamicIslandFuncEnable,"fullscreen original state not restored");
  pm.mStickyAnimationView=null;try{full.validateWindow();throw new AssertionError("missing fullscreen layout admitted");}catch(IllegalStateException expected){checks++;}
  try{new NativeIslandFullscreen(manager,new Object());throw new AssertionError("unknown layout admitted");}catch(NoSuchFieldException expected){checks++;}
  try{new NativeIslandFullscreen(manager,new Broken()).apply(true);throw new AssertionError("ineffective native setter accepted");}catch(IllegalStateException expected){checks++;}
  System.out.println("PASS feedback context/Recents/fullscreen: "+checks+" assertions; old/new/inherited/missing and state preservation");
 }
}'''

def main():
    source = (SRC / 'FeatureSettings.java').read_text(encoding='utf-8')
    code = HARNESS.replace('// METHODS', member(source, 'private static synchronized Context remember(').replace('FeatureSettings::', 'FeedbackRegression::')
                           + '\n' + member(source, 'private static void startupReadFailure('))
    for stage in ('PROVIDER', 'RUNTIME', 'REMOTE', 'OBSERVER'):
        assert f'startupReadFailures.remove("CONFIG_{stage}_FAILED")' not in source
    with tempfile.TemporaryDirectory(prefix='duo-feedback-') as temporary:
        work = Path(temporary)
        files = []
        for name, text in {**FILES, 'ls/augment/com/hook/FeedbackRegression.java': code}.items():
            p = work / name
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(text, encoding='utf-8')
            files.append(str(p))
        production = [str(SRC / f'{name}.java') for name in ('ConfigHostContext', 'RecentsLoadPlan', 'NativeIslandFullscreen')]
        subprocess.run([str(JDK / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-d', str(work), *files, *production], check=True)
        subprocess.run([str(JDK / 'java.exe'), '-cp', str(work), 'ls.augment.com.hook.FeedbackRegression'], check=True)

if __name__ == '__main__':
    main()
