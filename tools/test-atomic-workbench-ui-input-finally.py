#!/usr/bin/env python3
"""Execute the device case's extracted cleanup/click code against faulting boundaries.

This is a host regression for the AndroidTest implementation, not a phone/P0 pass.
It copies the actual finally and awaitFixture methods without rewriting their gates.
Only worker/Activity/fixture transport/clock/JSON are controlled boundaries.
"""
from pathlib import Path
import argparse
import hashlib
import json
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/androidTest/java/ls/augment/com/AtomicWorkbenchUiInputDeviceCases.java"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")


def between(source, start, end):
    assert source.count(start) == 1, start
    begin = source.index(start)
    return source[begin:source.index(end, begin)]


def pieces(source):
    cleanup = between(source, '        } finally {\n            // Identity failures',
                      '\n        return report.put("recoveryConfirmed"')
    fixture = between(source, '    private Bundle awaitFixture(', '\n    private void control(')
    click = between(source, '        main(() -> {\n            View tile =',
                    '\n        AtomicReference<Bundle> result =')
    ownership = between(source, '            activity = test.startActivitySync(',
                        '\n            await(() -> main(() -> field("client")')
    return cleanup, fixture, click, ownership


HARNESS = r'''
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.util.function.*;

public class ActualFinally {
 static final String PKG="fixture.two";
 static int cases, assertions;
 final Map<String,Long> attemptedLaunches=new LinkedHashMap<>();
 final Map<String,Integer> liveTasks=new LinkedHashMap<>();
 final Map<String,Bundle> observations=new LinkedHashMap<>();
 final Object observationLock=new Object(), receiver=new Object();
 final Activity target=new Activity(this); final Test test=new Test(this);
 Activity activity=target; boolean ownsSession=true;
 boolean workerBeforeFailure,workerAfterFailure,queryFailure,statusFailure,statusNullWindow,closeFailure;
 boolean receiverFailure,receiverFatal,quickFailure,keepAwakeFailure,bodyFailure;
 boolean cleanupPending,finishFailure;
 int closeCalls,quickCalls,unregisterCalls,finishCalls,queryCalls,workerCalls,clickCalls;
 int windowTask=41; boolean knownTask=true;
 Bundle before=state(41,2,500,false),after=state(41,0,2000,false),finished=state(41,0,3000,true);
 final View tile=new View(this); final ExecutorService worker=new Worker(this);
 static Bundle state(int task,int display,long at,boolean destroyed){
  Bundle b=new Bundle();b.put("task_id",task).put("display_id",display).put("at_uptime",at).put("destroyed",destroyed);return b;
 }
 ActualFinally(){SystemClock.now=1000;AtomicWorkbenchCleanup.pending=false;attemptedLaunches.put(PKG,100L);liveTasks.put(PKG,41);}
 void prepare(){if(!knownTask)liveTasks.clear();observations.clear();if(before!=null)observations.put(PKG,before);AtomicWorkbenchCleanup.pending=cleanupPending;}
 JSONObject run() throws Exception {
  JSONObject report=new JSONObject();boolean registered=true,passed=true,restored=false,quickRestored=false;String beforeQuick="original";
  prepare();
  try {if(bodyFailure)throw new IllegalStateException("physical reader/capture boundary");}
  catch(Exception|AssertionError failure){passed=false;report.put("failure",failure.getClass().getSimpleName());
__CLEANUP__
  return report.put("recoveryConfirmed",restored).put("quickConfigurationRestored",quickRestored).put("success",passed&&restored&&quickRestored);
 }
 void click(String pkg) throws Exception {String component=pkg+"/Activity";
__CLICK__
 }
 void ownership() throws Exception {
  ownsSession=false;activity=null;
__OWNERSHIP__
 }
__FIXTURE__
 static Object get(Object activity,String field){return ((Activity)activity).owner.worker;}
 Bundle status(){if(statusFailure)throw new IllegalStateException("status");Bundle result=new Bundle();ArrayList<Bundle>windows=new ArrayList<>();if(statusNullWindow)windows.add(null);else if(windowTask>0){Bundle b=new Bundle();b.put("top_component",PKG+"/Activity").put("task_id",windowTask);windows.add(b);}result.put("windows",windows);return result;}
 Object invoke(String method,Class<?>[] types,Object...args){check(method.equals("requestCloseAll"),"real close entry");check(types.length==1&&types[0]==boolean.class&&Boolean.TRUE.equals(args[0]),"close releases actual client scope");closeCalls++;if(closeFailure)throw new IllegalStateException("close boundary");observations.clear();if(after!=null)observations.put(PKG,after);return null;}
 <T>T main(Work<T> work)throws Exception{return work.run();}
 void control(String pkg,String action){if(action.equals(AtomicWorkbenchFixtureActivity.ACTION_QUERY)){queryCalls++;if(queryFailure)throw new IllegalStateException("query");if(before!=null&&closeCalls==0)observations.put(pkg,before);}else{check(action.equals(AtomicWorkbenchFixtureActivity.ACTION_FINISH),"only finish after return");finishCalls++;if(finishFailure)throw new IllegalStateException("finish");observations.clear();if(finished!=null)observations.put(pkg,finished);}}
 void await(Check predicate,String detail)throws Exception{for(int i=0;i<3;i++)if(predicate.run())return;throw new AssertionError(detail);}
 void saveQuick(String value){quickCalls++;check(value.equals("original"),"exact quick restore");if(quickFailure)throw new IllegalStateException("quick");}
 static JSONObject fixtureEvidence(Bundle b){return new JSONObject().put("task_id",b.getInt("task_id",-1));}
 static String packageOf(String component){int slash=component.indexOf('/');return slash<0?"":component.substring(0,slash);}
 static void require(boolean value,String detail){if(!value)throw new AssertionError(detail);}
 static void check(boolean value,String detail){assertions++;if(!value)throw new AssertionError("REGRESSION: "+detail);}
 interface Check{boolean run()throws Exception;} interface Work<T>{T run()throws Exception;}
 static final class Worker extends AbstractExecutorService{
  final ActualFinally owner;Worker(ActualFinally o){owner=o;} public Future<?> submit(Runnable r){owner.workerCalls++;CompletableFuture<Void> f=new CompletableFuture<>();if(owner.workerCalls==1&&owner.workerBeforeFailure||owner.workerCalls==2&&owner.workerAfterFailure)f.completeExceptionally(new IllegalStateException("worker"));else f.complete(null);return f;}
  public void execute(Runnable r){r.run();}public void shutdown(){}public List<Runnable>shutdownNow(){return List.of();}public boolean isShutdown(){return false;}public boolean isTerminated(){return false;}public boolean awaitTermination(long t,TimeUnit u){return true;}
 }
 static class Bundle{
  final Map<String,Object> values=new HashMap<>();Bundle(){}Bundle(Bundle b){values.putAll(b.values);}Bundle put(String k,Object v){values.put(k,v);return this;}
  int getInt(String k){return getInt(k,0);}int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}
  long getLong(String k,long d){Object v=values.get(k);return v instanceof Long?(Long)v:d;}boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}
  String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}
  @SuppressWarnings("unchecked")<T>ArrayList<T>getParcelableArrayList(String k,Class<T>t){return (ArrayList<T>)values.get(k);}
 }
 static class JSONObject{final Map<String,Object>values=new HashMap<>();JSONObject put(String k,Object v){values.put(k,v);return this;}boolean bool(String k){return Boolean.TRUE.equals(values.get(k));}boolean has(String k){return values.containsKey(k);}}
 static class JSONArray{final List<Object>values=new ArrayList<>();JSONArray put(Object v){values.add(v);return this;}int length(){return values.size();}}
 static class SystemClock{static long now;static long uptimeMillis(){return now++;}}
 static class AtomicWorkbenchCleanup{static boolean pending;static boolean pending(){return pending;}}
 static class AtomicWorkbenchFixtureActivity{static final String ACTION_QUERY="query",ACTION_FINISH="finish";}
 static class AtomicWorkbenchActivity{}
 static class ModuleNavigation{static final String EXTRA_ROUTE="route";}
 static class Intent{static final int FLAG_ACTIVITY_NEW_TASK=1;Intent(Activity t,Class<?>c){}Intent putExtra(String k,String v){return this;}Intent addFlags(int f){return this;}}
 static class android{static class view{static class WindowManager{static class LayoutParams{static final int FLAG_KEEP_SCREEN_ON=128;}}}}
 static class Test{final ActualFinally owner;Test(ActualFinally o){owner=o;}Activity startActivitySync(Intent i){return owner.target;}}
 static class Activity{final ActualFinally owner;Activity(ActualFinally o){owner=o;}void unregisterReceiver(Object r){owner.unregisterCalls++;if(owner.receiverFatal)throw new LinkageError("receiver fatal");if(owner.receiverFailure)throw new IllegalStateException("unregister");}Window getWindow(){return new Window(owner);}}
 static class Window{final ActualFinally owner;Window(ActualFinally o){owner=o;}void addFlags(int f){if(owner.keepAwakeFailure)throw new IllegalStateException("awake");}Decor getDecorView(){return new Decor(owner);}}
 static class Decor{final ActualFinally owner;Decor(ActualFinally o){owner=o;}View findViewWithTag(String t){return owner.tile;}}
 static class View{final ActualFinally owner;boolean enabled=true,shown=true,clickThrows;View(ActualFinally o){owner=o;}boolean isEnabled(){return enabled;}boolean isShown(){return shown;}boolean performClick(){owner.clickCalls++;if(clickThrows)throw new IllegalStateException("click already dispatched");return true;}}
 static void result(ActualFinally f,boolean recovery,int finishes,String detail)throws Exception{
  JSONObject r;try{r=f.run();}catch(Exception|AssertionError failure){check(f.quickCalls==1,detail+" restores quick when unregister throws");throw failure;}check(f.closeCalls==1,detail+" closes actual scope once");check(f.quickCalls==1&&r.bool("quickConfigurationRestored"),detail+" restores quick once");check(f.unregisterCalls==1,detail+" unregister attempted");check(r.bool("recoveryConfirmed")==recovery,detail+" recovery state");check(f.finishCalls==finishes,detail+" finish authority");cases++;
 }
 public static void main(String[]args)throws Exception{
  ActualFinally f;
  result(new ActualFinally(),true,1,"fresh same task");
  f=new ActualFinally();f.workerBeforeFailure=true;result(f,false,0,"initial worker failure");
  f=new ActualFinally();f.workerAfterFailure=true;result(f,false,0,"close worker failure");
  f=new ActualFinally();f.before=null;f.queryFailure=true;result(f,false,0,"query failure");
  f=new ActualFinally();f.before=null;f.queryFailure=true;f.attemptedLaunches.put("fixture.three",100L);f.liveTasks.put("fixture.three",42);result(f,false,0,"independent package query failures");check(f.queryCalls>=2,"one package query failure does not skip another attempted package");
  f=new ActualFinally();f.knownTask=false;f.windowTask=-1;f.before=null;result(f,false,0,"unknown attempted identity");
  f=new ActualFinally();f.before=state(41,2,500,true);result(f,false,0,"destroyed cached identity");
  f=new ActualFinally();f.before=state(41,2,99,false);result(f,false,0,"identity before attempt");
  f=new ActualFinally();f.before=state(42,2,500,false);result(f,false,0,"different current task");
  f=new ActualFinally();f.windowTask=42;result(f,false,0,"status task conflict");
  f=new ActualFinally();f.statusFailure=true;result(f,false,0,"status sampling failure");
  f=new ActualFinally();f.statusNullWindow=true;result(f,false,0,"malformed current window sampling");
  f=new ActualFinally();f.after=state(41,0,999,false);result(f,false,0,"stale display zero");
  f=new ActualFinally();f.after=state(42,0,2000,false);result(f,false,0,"different returned task");
  f=new ActualFinally();f.after=state(41,2,2000,false);result(f,false,0,"still virtual");
  f=new ActualFinally();f.after=state(41,0,2000,true);result(f,false,0,"destroyed return is not alive return");
  f=new ActualFinally();f.finished=state(41,0,999,true);result(f,false,1,"stale finish reply");
  f=new ActualFinally();f.finished=state(42,0,3000,true);result(f,false,1,"different finished task");
  f=new ActualFinally();f.cleanupPending=true;result(f,false,0,"cleanup remains pending");
  f=new ActualFinally();f.closeFailure=true;result(f,false,0,"close throws");
  f=new ActualFinally();f.finishFailure=true;result(f,false,1,"finish throws");
  f=new ActualFinally();f.receiverFailure=true;result(f,false,1,"unregister throws");
  f=new ActualFinally();f.bodyFailure=true;JSONObject body=f.run();check(f.closeCalls==1&&f.quickCalls==1&&body.bool("recoveryConfirmed")&&!body.bool("success"),"physical reader failure still cleans up but never success");cases++;
  f=new ActualFinally();f.quickFailure=true;JSONObject quick=f.run();check(f.closeCalls==1&&f.quickCalls==1&&!quick.bool("quickConfigurationRestored")&&!quick.bool("success"),"quick failure reported");cases++;
  f=new ActualFinally();f.receiverFatal=true;boolean fatal=false;try{f.run();}catch(LinkageError expected){fatal=true;}check(fatal&&f.quickCalls==1,"fatal unregister retains propagation while quick finally runs");cases++;
  f=new ActualFinally();f.ownsSession=false;JSONObject idle=f.run();check(f.closeCalls==0&&f.quickCalls==1&&!idle.bool("recoveryConfirmed"),"no ownership does not close others");cases++;
  f=new ActualFinally();f.attemptedLaunches.clear();f.tile.clickThrows=true;try{f.click(PKG);}catch(IllegalStateException expected){}check(f.clickCalls==1&&f.attemptedLaunches.containsKey(PKG)&&f.attemptedLaunches.get(PKG)==1000L,"attempt registered before dispatched click throws");cases++;
  for(int mode=0;mode<2;mode++){f=new ActualFinally();f.attemptedLaunches.clear();f.tile.enabled=mode!=0;f.tile.shown=mode!=1;try{f.click(PKG);}catch(AssertionError expected){}check(f.clickCalls==0&&f.attemptedLaunches.isEmpty(),"disabled/hidden is not attempted");cases++;}
  f=new ActualFinally();f.keepAwakeFailure=true;try{f.ownership();}catch(IllegalStateException expected){}check(f.ownsSession&&f.activity!=null,"ownership precedes fallible keep-awake");result(f,true,1,"keep-awake failure still owns cleanup");
  System.out.println("PASS actual extracted cleanup/click/ownership: "+cases+" cases, "+assertions+" assertions");
 }
}
'''


def harness(source):
    cleanup, fixture, click, ownership = pieces(source)
    return (HARNESS.replace('__CLEANUP__', cleanup).replace('__FIXTURE__', fixture)
            .replace('__CLICK__', click).replace('__OWNERSHIP__', ownership))


def replace_one(source, old, new):
    assert source.count(old) == 1, (source.count(old), old)
    return source.replace(old, new, 1)


def mutations(source):
    yield 'drop_pre_click_attempt', replace_one(source,
        '            if (tile.isEnabled() && tile.isShown()) attemptedLaunches.put(pkg, SystemClock.uptimeMillis());', '')
    yield 'drop_worker_uncertainty', replace_one(source,
        '                        identityFailures.put("Launch work completion unconfirmed");', '')
    yield 'skip_close_when_identity_unknown', replace_one(source,
        '                    main(() -> { invoke("requestCloseAll", new Class<?>[]{boolean.class}, true); return null; });',
        '                    if (identityFailures.length() == 0) main(() -> { invoke("requestCloseAll", new Class<?>[]{boolean.class}, true); return null; });')
    yield 'drop_identity_failure_gate', replace_one(source,
        '                    require(identityFailures.length() == 0, "Every attempted fixture needs a current task identity before recovery can be confirmed");', '')
    yield 'drop_return_freshness', replace_one(source,
        '\n                                && state.getLong("at_uptime", -1) >= closeStarted', '')
    yield 'drop_return_task_identity', replace_one(source,
        'state.getInt("task_id", -1) == expectedTask && state.getInt("display_id", -1) == 0',
        'state.getInt("display_id", -1) == 0')
    yield 'drop_finish_freshness', replace_one(source,
        '\n                                && value.getLong("at_uptime", -1) >= finishStarted', '')
    yield 'drop_finish_task_identity', replace_one(source,
        '\n                                && value.getInt("task_id", -1) == expectedTask\n                                && value.getLong("at_uptime", -1) >= finishStarted',
        '\n                                && value.getLong("at_uptime", -1) >= finishStarted')
    yield 'delay_ownership', replace_one(source,
        '            ownsSession = true;\n            main(() -> { activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); return null; });',
        '            main(() -> { activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); return null; });\n            ownsSession = true;')
    # Reintroduce the original unprotected unregister sequence in an audit copy.
    tail = between(source, '            } finally {\n                try {\n                    if (registered)',
                   '\n        return report.put("recoveryConfirmed"')
    yield 'unregister_skips_quick', replace_one(source, tail,
        '''            } finally {
                if (registered) target.unregisterReceiver(receiver);
                try { saveQuick(beforeQuick); quickRestored = true; }
                catch (Exception | AssertionError failure) { report.put("quickConfigRecoveryFailure", failure.getMessage()); }
            }
        }''')


def execute(source, out, name):
    work = out / name
    work.mkdir(exist_ok=False)
    java_file = work / 'ActualFinally.java'
    java_file.write_text(harness(source), encoding='utf-8')
    command = [str(JDK / 'javac.exe'), '-J-Duser.language=en', '-J-Dfile.encoding=UTF-8',
               '-encoding', 'UTF-8', '-d', str(work), str(java_file)]
    compiled = subprocess.run(command, capture_output=True)
    (work / 'compile-stdout.bin').write_bytes(compiled.stdout)
    (work / 'compile-stderr.bin').write_bytes(compiled.stderr)
    (work / 'compile.txt').write_text((compiled.stdout + compiled.stderr).decode('utf-8', errors='replace'), encoding='utf-8')
    if compiled.returncode:
        raise AssertionError(f'{name}: compile failed (not accepted as a behavioral negative)')
    command = [str(JDK / 'java.exe'), '-cp', str(work), 'ActualFinally']
    ran = subprocess.run(command, capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)
    (work / 'run.txt').write_text(ran.stdout + ran.stderr, encoding='utf-8')
    return {'name': name, 'compiled': True, 'exit_code': ran.returncode,
            'java_sha256': hashlib.sha256(java_file.read_bytes()).hexdigest().upper(),
            'stdout': ran.stdout.strip(), 'log': str(work / 'run.txt')}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--out', type=Path)
    parser.add_argument('--negative-controls', action='store_true')
    args = parser.parse_args()
    out = args.out.resolve() if args.out else Path(tempfile.mkdtemp(prefix='ui-input-finally-'))
    if args.out:
        out.mkdir(parents=True, exist_ok=False)
    before = SOURCE.read_bytes()
    source = before.decode('utf-8')
    result = {'scope': 'ACTUAL_ANDROIDTEST_EXTRACTED_CLEANUP_CONTROLLED_BOUNDARIES',
              'source': str(SOURCE), 'source_sha256': hashlib.sha256(before).hexdigest().upper(),
              'tool_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest().upper(),
              'extracted_sha256': {name: hashlib.sha256(text.encode('utf-8')).hexdigest().upper()
                                   for name, text in zip(('finally', 'awaitFixture', 'click', 'ownership'), pieces(source))},
              'boundary': 'Exact extracted AndroidTest gates; controlled worker/Activity/fixture transport/clock/JSON. Await scheduler uses three immediate predicate attempts; no claim about real asynchronous phone timing, sender authentication, or Root cleanup implementation.',
              'phone_tested': False, 'rows': []}
    try:
        positive = execute(source, out, 'positive')
        result['rows'].append(positive)
        assert positive['exit_code'] == 0, 'actual positive failed'
        for name, altered in mutations(source) if args.negative_controls else []:
            row = execute(altered, out, name)
            result['rows'].append(row)
            assert row['exit_code'] != 0, f'negative survived: {name}'
            assert 'REGRESSION:' in Path(row['log']).read_text(encoding='utf-8'), f'negative not killed by behavior assertion: {name}'
        assert SOURCE.read_bytes() == before, 'source changed during regression'
        result['source_stable'] = True
        result['status'] = 'PASS'
    except BaseException as failure:
        result['status'] = 'FAIL'
        result['failure'] = f'{type(failure).__name__}: {failure}'
        raise
    finally:
        (out / 'summary.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
        print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
