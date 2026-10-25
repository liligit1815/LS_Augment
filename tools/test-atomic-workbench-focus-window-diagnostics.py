"""Exercise actual Focus/Ime/diagnostic/policy code without a phone or permission fallback."""
from pathlib import Path
import argparse
import os
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-focus-window-hook.py")))
SUPPORT = BASE["SUPPORT"]
SOURCES = dict(BASE["SOURCES"])
SOURCES["ls/augment/com/hook/HookTelemetry.java"] = r'''package ls.augment.com.hook;
import java.util.concurrent.*;import java.util.*;
final class HookTelemetry {
 static final List<String> raw=new CopyOnWriteArrayList<>(),safe=new CopyOnWriteArrayList<>();
 static volatile CountDownLatch block,entered;static volatile boolean fail;
 static void atomicWorkbench(String level,String value,Throwable error){
  if(!Thread.currentThread().getName().equals("Duo-FocusEvidence"))throw new AssertionError("diagnostic sink executed on hook thread");
  CountDownLatch gate=block;if(gate!=null){CountDownLatch e=entered;if(e!=null)e.countDown();try{gate.await(5,TimeUnit.SECONDS);}catch(InterruptedException ignored){}}
  if(fail)throw new LinkageError("injected diagnostic writer failure");
  raw.add(value);String first=ls.augment.com.AtomicWorkbenchLogPolicy.safe(value);
  safe.add(ls.augment.com.AtomicWorkbenchLogPolicy.safe("seq=9223372036854775807 wall=1792315757056 elapsed=9223372036854775807 session=11111111-2222-3333-4444-555555555555 dropped=9223372036854775807 "+first));
 }
}'''
SOURCES["android/view/WindowManager.java"] = SOURCES["android/view/WindowManager.java"].replace(
    "public int getFitInsetsTypes(){return fitInsetsTypes;}",
    '''public int fitReads,titleReads;public boolean failFit;
     public int getFitInsetsTypes(){fitReads++;if(ls.augment.com.hook.TestFocusWindowHook.currentLock!=null&&Thread.holdsLock(ls.augment.com.hook.TestFocusWindowHook.currentLock))throw new AssertionError("fit read under WM lock");if(failFit)throw new LinkageError("injected fit getter failure");return fitInsetsTypes;}''').replace(
    "public CharSequence getTitle(){return title;}", "public CharSequence getTitle(){titleReads++;return title;}")
SOURCES["com/android/server/wm/WindowManagerService.java"] = SOURCES["com/android/server/wm/WindowManagerService.java"].replace(
    "public int relayouts;", "public RuntimeException originalFailure=new IllegalStateException(\"original sentinel\");public int relayouts;").replace(
    'throw new IllegalStateException("injected add failure")', "throw originalFailure")

DIAGNOSTIC_TEST = r'''
 public static Object currentLock;
 static Object diagnosticWriter()throws Exception{Field f=AtomicWorkbenchFocusWindowDiagnostics.class.getDeclaredField("writer");f.setAccessible(true);return f.get(null);}
 static void diagnosticWriter(Object value)throws Exception{Field f=AtomicWorkbenchFocusWindowDiagnostics.class.getDeclaredField("writer");f.setAccessible(true);f.set(null,value);}
 static long sequence()throws Exception{Object w=diagnosticWriter();Field f=w.getClass().getDeclaredField("sequence");f.setAccessible(true);return ((java.util.concurrent.atomic.AtomicLong)f.get(w)).get();}
 static String event(long seq)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(4);do{for(String x:HookTelemetry.safe)if(x.startsWith("ATOMIC_FOCUS_WINDOW_ADD_RESULT ")&&x.contains(" attempt_seq="+seq+" "))return x;Thread.sleep(5);}while(System.nanoTime()<end);throw new AssertionError("missing bounded actual diagnostic event "+seq+"; "+HookTelemetry.safe);}
 static long dropped()throws Exception{Object w=diagnosticWriter();Field f=w.getClass().getDeclaredField("dropped");f.setAccessible(true);return ((java.util.concurrent.atomic.AtomicLong)f.get(w)).get();}
 static void fields(String s,String... fields){for(String x:fields)check(s.contains(" "+x+" ")||s.endsWith(" "+x),"lost actual diagnostic field "+x+" in "+s);}
 public static void main(String[] args)throws Throwable{
  test("actual owner, callback, zero fit, returned code and registry success survive both policy passes",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.setFitInsetsTypes(0);long n=sequence()+1;
   check(f.add()==0,"diagnostic changed accepted add");String e=event(n);
   fields(e,"owner_id=FW_C12_DDI_01","diag_abi=1","server_pid=999","hook_bits=15","first_gate=NONE","original_state=RETURNED","add_result=0","permission_override=TRUE","registry_state=TRUE","fit_types=0","a_soft=51","a_private=268435456","allowed_private=301993984","a_insets=-1","binding_state=IME_MATCHED");
   check(e.contains(" binding_id=")&&!e.contains(" binding_id=UNKNOWN")&&e.contains(" registration_generation="),"actual IME registration generation missing");
   check(f.attrs.fitReads==1,"fit getter repeated or not called once");check(HookTelemetry.safe.stream().anyMatch(x->x.startsWith("ATOMIC_FOCUS_WINDOW_OWNER ")&&x.contains(" hook_bits=15")&&x.contains(" owner_id=FW_C12_DDI_01")),"actual installed owner bits missing");
  });
  test("actual private-flag rejection retains ROM minus8 without assuming it from exception",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.privateFlags=0x40000000;long n=sequence()+1;f.denied();
   fields(event(n),"first_gate=ATTR_PRIVATE","first_stage=ADD_GATE","original_state=RETURNED","add_result=-8","permission_override=FALSE","registry_state=UNKNOWN","a_private=1073741824","a_soft=UNKNOWN","binding_state=NOT_CHECKED");
  });
  test("original throw object is preserved and absent exact registration is FALSE",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.service.fail=true;long n=sequence()+1;
   try{f.add();throw new AssertionError("original add throw swallowed");}catch(IllegalStateException original){check(original==f.service.originalFailure,"original throw object replaced");}
   fields(event(n),"original_state=THREW","add_result=UNKNOWN","throw_kind=ILLEGAL_STATE","permission_override=TRUE","registry_state=FALSE");
   f.service.fail=false;check(f.add()==0,"throw leaked original reservation");
  });
  test("exact registry inspection failure stays UNKNOWN while original add returns success",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;
   f.service.mWindowMap.put(f.client.asBinder(),null);
   java.lang.reflect.Field map=WindowManagerService.class.getDeclaredField("mWindowMap");map.setAccessible(true);
   Map<IBinder,WindowState> broken=new HashMap<>(){@Override public WindowState get(Object key){throw new LinkageError("injected registry read failure");}};
   map.set(f.service,broken);long n=sequence()+1;check(f.add()==0,"registry observer altered original return");fields(event(n),"original_state=RETURNED","add_result=0","registry_state=UNKNOWN");
  });
  test("permission recheck records its actual first rejection without broadening scope",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.service.beforePermission=()->f.attrs.privateFlags=0x40000000;long n=sequence()+1;f.denied();
   String e=event(n);fields(e,"first_gate=ATTR_PRIVATE","first_stage=POLICY_RECHECK","permission_override=FALSE","add_result=-8");
   String bits=e.substring(e.indexOf(" passed_mask=0x")+15).split(" ")[0];check((Long.parseUnsignedLong(bits,16)&(1L<<AtomicWorkbenchFocusWindowDiagnostics.ATTR_PRIVATE))==0,"failed recheck retained an ever-passed current bit");
  });
  test("unvisited validation fields stay UNKNOWN and original short circuit stays intact",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.width=2;int titles=f.attrs.titleReads;long n=sequence()+1;f.denied();
   fields(event(n),"first_gate=ATTR_WIDTH","a_width=2","a_height=UNKNOWN","a_private=UNKNOWN");check(f.attrs.titleReads==titles,"diagnostic reran unreachable title validation");
  });
  test("mutated Guard type and package are visible through fixed one-pixel title shape only",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.type=1;long n=sequence()+1;check(f.add()==0&&f.service.mPolicy.calls==1,"ordinary type policy changed");fields(event(n),"first_gate=ATTR_TYPE","permission_override=FALSE","add_result=0");
   Fixture g=new Fixture();g.install();currentLock=g.service.mGlobalLock;g.attrs.packageName="foreign";n=sequence()+1;g.denied();fields(event(n),"first_gate=ATTR_PACKAGE","permission_override=FALSE");
  });
  test("ordinary windows allocate no Attempt and an ordinary nested add cannot pollute its parent",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.type=1;f.attrs.width=1080;f.attrs.title="private arbitrary window body";long n=sequence();check(f.add()==0&&sequence()==n,"ordinary window acquired diagnostic allocation");
   Fixture g=new Fixture();g.install();currentLock=g.service.mGlobalLock;g.service.afterPermission=()->{g.service.afterPermission=null;WindowManager.LayoutParams p=new WindowManager.LayoutParams();p.type=1;p.width=500;p.title="private arbitrary nested body";try{g.service.nestedResult=g.add(new Client(),p);}catch(Throwable t){throw new RuntimeException(t);}};
   n=sequence()+1;check(g.add()==0&&g.service.nestedResult==0,"ordinary nested original result changed");fields(event(n),"first_gate=NONE","permission_override=TRUE","original_state=RETURNED","registry_state=TRUE");
   check(HookTelemetry.raw.stream().noneMatch(x->x.contains("private arbitrary")),"arbitrary window content reached diagnostics");
  });
  test("best effort fit getter failure never changes authorization",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;f.attrs.failFit=true;long n=sequence()+1;check(f.add()==0,"fit diagnostic failure denied original add");fields(event(n),"fit_types=UNKNOWN","permission_override=TRUE","add_result=0");check(f.attrs.fitReads==1,"failed fit getter retried");
  });
  test("worker initialization failure disables observation and preserves original permission",()->{
   Object previous=diagnosticWriter();diagnosticWriter(null);android.os.Process.failPid=true;
   try{Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;check(diagnosticWriter()==null,"failed init published worker");check(f.add()==0&&f.service.mPolicy.calls==0,"worker init failure changed original permission");}finally{android.os.Process.failPid=false;diagnosticWriter(previous);}
  });
  test("observer ThreadLocal failure is isolated and missing facts remain unknown",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;Field slot=AtomicWorkbenchFocusWindowHook.class.getDeclaredField("observations");slot.setAccessible(true);Object original=slot.get(null);
   slot.set(null,new ThreadLocal<Object>(){@Override public Object get(){throw new LinkageError("injected observer failure");}@Override public void set(Object x){throw new LinkageError("injected observer set failure");}@Override public void remove(){throw new LinkageError("injected observer remove failure");}});
   try{long n=sequence()+1;check(f.add()==0,"observer failure changed original add");fields(event(n),"first_gate=NOT_OBSERVED","permission_override=UNKNOWN","original_state=RETURNED","add_result=0","registry_state=UNKNOWN");}finally{slot.set(null,original);}
  });
  test("bounded queue overflow never runs writer on a callback or changes original returns",()->{
   HookTelemetry.entered=new CountDownLatch(1);HookTelemetry.block=new CountDownLatch(1);AtomicWorkbenchFocusWindowDiagnostics.installation("FW_C12_DDI_01",1,"QUEUE_TEST",15,"NONE");check(HookTelemetry.entered.await(2,TimeUnit.SECONDS),"writer did not block in isolated sink");
   long before=dropped();Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;
   try{check(f.add()==0,"queue pressure changed accepted add");for(int i=0;i<80;i++)check(f.add(new Client(),f.attrs)==-8,"queue pressure changed original duplicate rejection");check(dropped()>before,"bounded queue did not expose drops");}
   finally{HookTelemetry.block.countDown();HookTelemetry.block=null;HookTelemetry.entered=null;}
   int[] op={-2};check((Integer)f.module.invoke(f.service.mPolicy,"checkAddPermission",CHECK,2008,false,"ls.augment.com",op,88)==-8,"queue failure leaked ThreadLocal permission");
  });
  test("nested observer begin failure never writes into its parent's diagnostic facts",()->{
   Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;Object w=diagnosticWriter();Field counter=w.getClass().getDeclaredField("sequence");counter.setAccessible(true);Object original=counter.get(w);long n=sequence()+1;
   Field slot=AtomicWorkbenchFocusWindowHook.class.getDeclaredField("observations");slot.setAccessible(true);Object previous=slot.get(null);boolean[] failNull={false};
   slot.set(null,new ThreadLocal<Object>(){@Override public void set(Object value){if(value==null&&failNull[0])throw new LinkageError("injected nested null set failure");super.set(value);}});
   try{f.service.afterPermission=()->{f.service.afterPermission=null;try{failNull[0]=true;counter.set(w,null);WindowManager.LayoutParams p=new WindowManager.LayoutParams();p.title=f.attrs.title;p.mWindowContextToken=f.token;p.width=500;f.service.nestedResult=f.add(new Client(),p);}catch(Throwable t){throw new RuntimeException(t);}finally{failNull[0]=false;try{counter.set(w,original);}catch(Exception e){throw new RuntimeException(e);}}};
    check(f.add()==0&&f.service.nestedResult==-8,"observer begin failure changed parent or nested original return");String e=event(n);check(e.contains(" first_gate=NONE "),"nested begin failure polluted parent diagnostic");fields(e,"permission_override=TRUE","original_state=RETURNED","registry_state=TRUE");
   }finally{slot.set(null,previous);}
  });
  test("writer sink throw is isolated from subsequent actual callbacks",()->{
   HookTelemetry.fail=true;Fixture f=new Fixture();f.install();currentLock=f.service.mGlobalLock;check(f.add()==0,"writer sink failure changed add");HookTelemetry.fail=false;
   Fixture g=new Fixture();g.install();currentLock=g.service.mGlobalLock;long n=sequence()+1;check(g.add()==0,"writer did not recover independently");fields(event(n),"original_state=RETURNED","registry_state=TRUE");
  });
  test("maximum scalar record keeps all core and attrs fields after two policy passes",()->{
   AtomicWorkbenchFocusWindowDiagnostics.Attempt a=new AtomicWorkbenchFocusWindowDiagnostics.Attempt("FW_C12_DDI_01",1,Integer.MAX_VALUE,Long.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE);
   a.candidate=true;a.known=(1<<14)-1;Arrays.fill(a.attrs,Integer.MIN_VALUE);a.attrs[7]=Float.floatToIntBits(Float.MAX_VALUE);a.attrs[10]=Float.floatToIntBits(Float.NaN);a.binding[0]=Integer.MAX_VALUE;a.binding[1]=Integer.MAX_VALUE;a.binding[2]=Integer.MAX_VALUE;a.binding[3]=Long.MAX_VALUE;a.binding[4]=2;a.visited=-1;a.passed=-1;a.override=2;a.originalState=1;a.result=Integer.MIN_VALUE;a.registered=2;a.allowedPrivate=Integer.MAX_VALUE;a.fitKnown=true;a.fitTypes=Integer.MAX_VALUE;
   AtomicWorkbenchFocusWindowDiagnostics.offer(a,15);String e=event(Long.MAX_VALUE);
   for(String field:new String[]{"owner_id=FW_C12_DDI_01","original_state=RETURNED","add_result=-2147483648","registry_state=TRUE","fit_types=2147483647","allowed_private=2147483647","a_soft=-2147483648","a_insets=-2147483648"})fields(e,field);
   check(e.length()<=1536,"policy budget exceeded");
   String raw=HookTelemetry.raw.stream().filter(x->x.contains(" attempt_seq=9223372036854775807 ")).findFirst().orElseThrow().replace("boot_id=UNKNOWN","boot_id=11111111-2222-3333-4444-555555555555");
   String twice=ls.augment.com.AtomicWorkbenchLogPolicy.safe("seq=9223372036854775807 wall=1792315757056 elapsed=9223372036854775807 session=11111111-2222-3333-4444-555555555555 dropped=9223372036854775807 "+ls.augment.com.AtomicWorkbenchLogPolicy.safe(raw));
   fields(twice,"boot_id=11111111-2222-3333-4444-555555555555","fit_types=2147483647","allowed_private=2147483647","a_soft=-2147483648","a_insets=-2147483648");
  });
  test("an executed empty IME lookup differs from unvisited binding facts",()->{
   Fixture f=new Fixture();check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==2,"IME missing");check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==3,"focus missing");Binder.uid=10055;Binder.pid=456;currentLock=f.service.mGlobalLock;long n=sequence()+1;f.denied();fields(event(n),"first_gate=IME_SCOPE","binding_state=NO_REGISTRATION","binding_id=UNKNOWN","root_pid=-1");
  });
  test("actual partial install reports its fixed registration point and never authorizes",()->{
   Fixture f=new Fixture();check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==2,"IME missing");f.module.failPrepareAt=f.module.prepareCalls+3;
   check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==0,"partial install became ready");Binder.uid=10055;Binder.pid=456;currentLock=f.service.mGlobalLock;long n=sequence()+1;f.denied();fields(event(n),"first_gate=NOT_INSTALLED","permission_override=FALSE","add_result=-8","hook_bits=11");
   long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);boolean found=false;do{found=HookTelemetry.safe.stream().anyMatch(x->x.startsWith("ATOMIC_FOCUS_WINDOW_OWNER ")&&x.contains(" install_stage=REGISTER_RELAYOUT ")&&x.contains(" hook_bits=11 "));if(!found)Thread.sleep(5);}while(!found&&System.nanoTime()<end);check(found,"actual install first-failure point omitted");
  });
  test("private payloads, tokens and unknown fields stay rejected by the unchanged privacy filter",()->{
   String safe=ls.augment.com.AtomicWorkbenchLogPolicy.safe("ATOMIC_FOCUS_WINDOW_ADD_RESULT owner_id=FW_C12_DDI_01 unknown_field=private-body token=private-credential add_result=0");
   check(!safe.contains("private-body")&&!safe.contains("private-credential")&&!safe.contains("add_result"),"private or opaque fields leaked");
   check(ls.augment.com.AtomicWorkbenchLogPolicy.safe(safe).equals(safe),"receiving policy changed safe event");
  });
  System.out.println("FOCUS DIAGNOSTIC RESULT "+tests+" cases; "+checks+" assertions");
 }
}
'''


def sources():
    result = dict(SOURCES)
    marker = " public static void main(String[] args)throws Throwable{"
    original = BASE["TEST"]
    if original.count(marker) != 1:
        raise AssertionError("original focus fixture boundary changed")
    result["ls/augment/com/hook/TestFocusWindowHook.java"] = original.split(marker)[0] + DIAGNOSTIC_TEST
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--negative-controls", action="store_true")
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="lsa-focus-diagnostic-") as directory:
        SUPPORT["compile_run"](Path(directory), sources(),
            ["hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchFocusWindowHook.java",
             "hook/AtomicWorkbenchDisplayDeviceEvidence.java", "hook/AtomicWorkbenchFocusWindowDiagnostics.java", "AtomicWorkbenchLogPolicy.java"],
            "ls.augment.com.hook.TestFocusWindowHook")
    if args.negative_controls:
        negatives()


def negatives():
    changes = {
        "unknown_registry_cannot_become_false": ("hook/AtomicWorkbenchFocusWindowDiagnostics.java", 'f.registered==1?"FALSE":"UNKNOWN"', 'f.registered==1?"FALSE":"FALSE"', "registry_state=UNKNOWN"),
        "policy_must_keep_fit_types": ("AtomicWorkbenchLogPolicy.java", ', "fit_types"', '', "fit_types=0"),
        "policy_must_keep_allowed_mask": ("AtomicWorkbenchLogPolicy.java", ', "allowed_private"', '', "allowed_private=301993984"),
        "first_rejection_must_be_observed": ("hook/AtomicWorkbenchFocusWindowDiagnostics.java", 'if(firstGate==0){firstGate=gate;firstStage=stage;}', 'if(false){firstGate=gate;firstStage=stage;}', "first_gate=ATTR_PRIVATE"),
        "observer_begin_failure_keeps_parent_isolated": ("hook/AtomicWorkbenchFocusWindowHook.java", 'try {if(observations!=null)observations.remove();}catch(Throwable ignored){}', '// MUTANT leave parent observer until initialization succeeds', "nested begin failure polluted parent diagnostic"),
    }
    for name, (relative, before, after, expected) in changes.items():
        raw = (SUPPORT["SRC"] / relative).read_text(encoding="utf-8")
        if raw.count(before) != 1:
            raise AssertionError("negative control no longer targets exact branch: " + name)
        variant = sources()
        variant["ls/augment/com/" + relative] = raw.replace(before, after)
        for dependency in ("hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchFocusWindowHook.java", "hook/AtomicWorkbenchDisplayDeviceEvidence.java", "hook/AtomicWorkbenchFocusWindowDiagnostics.java", "AtomicWorkbenchLogPolicy.java"):
            variant.setdefault("ls/augment/com/" + dependency, (SUPPORT["SRC"] / dependency).read_text(encoding="utf-8"))
        with tempfile.TemporaryDirectory(prefix="lsa-focus-diagnostic-negative-") as directory:
            work = Path(directory)
            files = []
            for path, content in variant.items():
                target = work / path
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(content, encoding="utf-8")
                files.append(str(target))
            compiled = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-d", str(work / "classes"), *files], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=25)
            if compiled.returncode:
                raise AssertionError(compiled.stdout + compiled.stderr)
            ran = subprocess.run([SUPPORT["JAVA"], "-cp", str(work / "classes"), "ls.augment.com.hook.TestFocusWindowHook"], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=25)
            if ran.returncode == 0 or expected not in ran.stdout + ran.stderr:
                raise AssertionError("negative control failed: " + name + "\n" + ran.stdout + ran.stderr)
            print("PASS diagnostic negative: " + name)


if __name__ == "__main__":
    main()
