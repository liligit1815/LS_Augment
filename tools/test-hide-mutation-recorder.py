"""Offline behavioral tests for the production hide recorder and its manager wiring.

The first fixture compiles the complete, unmodified Recorder, BatchExecutor,
RootShell and Journal. It injects only Recorder.Transport and never calls su.
The second compiles actual RootHideManager members and the same production
classes, replacing only RootShell's process-launch boundary with an in-memory
transport. Journal.append, its codec, Result and command construction are real.
The manager now uses the actual finite Root Client/Store/Protocol/Server, with
explicit persistent I/O and engine models. No naked am/pm command remains.
These tests prove protocol/order/failure propagation, not Android identity
parsing, disk durability, PM ownership, recovery or uninstall behavior.
All generated Java/classes are temporary. No adb, su or device is used.
--manager-source can execute a pre-fix executeBatch as a negative control;
missing recorder helpers come from current source, but cannot replace that method.
"""
from pathlib import Path
import argparse
import contextlib
import json
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    """Extract an actual Java member, respecting quoted/commented braces."""
    if source.count(signature) != 1:
        raise ValueError(f"Expected one production member: {signature}")
    start = source.index(signature)
    index = source.index("{", start)
    depth, state = 0, "code"
    while index < len(source):
        char, pair = source[index], source[index:index + 2]
        if state == "line":
            if char == "\n":
                state = "code"
        elif state == "block":
            if pair == "*/":
                state = "code"
                index += 1
        elif state in ('"', "'"):
            if char == "\\":
                index += 1
            elif char == state:
                state = "code"
        elif pair in ("//", "/*"):
            state = "line" if pair == "//" else "block"
            index += 1
        elif char in ('"', "'"):
            state = char
        elif char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return source[start:index + 1]
        index += 1
    raise ValueError(f"Unclosed production member: {signature}")


RECORDER_TEST = r'''
package ls.augment.com;
import java.util.*;
import static ls.augment.com.HideBatchExecutor.State.*;

public class TestHideMutationRecorder {
    static int passed, failed;
    static final String OWNER="12345678-1234-1234-1234-123456789abc";
    static final String HASH="a".repeat(64), OTHER="b".repeat(64);
    record Target(int userId, String packageName) {}
    record Identity(long serial, String hash) {}
    static void check(boolean condition,String message) {
        if(!condition)throw new AssertionError(message);
    }
    static void test(String name,Runnable body) {
        try {body.run(); passed++; System.out.println("PASS recorder: "+name);}
        catch(Throwable failure) {failed++; System.out.println("FAIL recorder: "+name+": "+failure);}
    }
    static LinkedHashSet<Target> targets(int count) {
        LinkedHashSet<Target> values=new LinkedHashSet<>();
        for(int i=0;i<count;i++)values.add(new Target(i%2==0?0:12,"org.example.app"+i));
        return values;
    }
    static final class Fixture implements HideMutationRecorder.Transport<Target> {
        final Set<Target> requested;
        final Map<Target,HideBatchExecutor.State> actual=new LinkedHashMap<>();
        final Map<Target,Identity> identities=new LinkedHashMap<>();
        final List<String> trace=new ArrayList<>();
        final List<HideRecoveryJournal.Entry> durable=new ArrayList<>();
        final List<List<HideRecoveryJournal.Entry>> writes=new ArrayList<>();
        final List<Set<Target>> pmBatches=new ArrayList<>();
        final HideMutationRecorder<Target> recorder=new HideMutationRecorder<>(this);
        String prepareMode="", preparedSave="", observedSave="", pmMode="";
        String identityChange="", freshSpecial="", readySpecial="", postSpecial="";
        int identityChangeAt, queries, preparations, validations, nextId;
        HideBatchExecutor.State pmState=HIDDEN;
        Fixture(Set<Target> requested) {
            this.requested=requested;
            for(Target t:requested) {actual.put(t,VISIBLE);identities.put(t,new Identity(1000L+t.userId,HASH));}
        }
        Map<Target,HideBatchExecutor.State> snapshot(Set<Target> values) {
            Map<Target,HideBatchExecutor.State> result=new LinkedHashMap<>();
            for(Target t:values)if(actual.containsKey(t))result.put(t,actual.get(t));
            return result;
        }
        @Override public Map<Target,HideBatchExecutor.State> query(Set<Target> values) {
            queries++;
            String phase=queries==1?"fresh":queries==2?"ready":"post";
            trace.add("query:"+phase);
            String special=queries==1?freshSpecial:queries==2?readySpecial:postSpecial;
            if(special.equals("THROW"))throw new IllegalStateException("query fixture");
            if(special.equals("NULL_MAP"))return null;
            Map<Target,HideBatchExecutor.State> result=snapshot(values);
            if(!special.isEmpty()) {
                Target first=values.iterator().next();
                if(special.equals("OMITTED"))result.remove(first);
                else {HideBatchExecutor.State value=HideBatchExecutor.State.valueOf(special);
                    result.put(first,value);actual.put(first,value);}
            }
            return result;
        }
        HideRecoveryJournal.Entry entry(Target t) {
            Identity id=identities.get(t);
            return new HideRecoveryJournal.Entry(String.format(Locale.ROOT,
                    "00000000-0000-0000-0000-%012x",++nextId),
                    prepareMode.equals("BAD_OWNER")?null:OWNER,0,
                    prepareMode.equals("BAD_USER")?-1:t.userId,
                    prepareMode.equals("BAD_SERIAL")?-1:id.serial,
                    prepareMode.equals("BAD_PACKAGE")?"bad/package":t.packageName,
                    prepareMode.equals("BAD_IDENTITY")?null:id.hash,1,
                    HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
        }
        @Override public HideMutationRecorder.Preparation<Target> prepare(Set<Target> values) {
            preparations++;trace.add("prepare");
            if(prepareMode.equals("THROW"))throw new IllegalStateException("prepare fixture");
            if(prepareMode.equals("NULL_RESULT"))return null;
            if(prepareMode.equals("FAILURE"))return HideMutationRecorder.Preparation.failure("cannot prepare");
            Map<Target,HideRecoveryJournal.Entry> entries=new LinkedHashMap<>();
            for(Target t:values)entries.put(t,entry(t));
            Target first=values.iterator().next();
            if(prepareMode.equals("MISSING"))entries.remove(first);
            if(prepareMode.equals("EXTRA")) {
                Target extra=new Target(15,"org.example.extra");
                entries.put(extra,entries.get(first));
            }
            if(prepareMode.equals("NULL_ENTRY"))entries.put(first,null);
            if(prepareMode.equals("OBSERVED"))entries.put(first,entries.get(first).observed("HIDDEN",0,false));
            return new HideMutationRecorder.Preparation<>(entries,"");
        }
        @Override public RootShell.Result persist(List<HideRecoveryJournal.Entry> entries) {
            HideRecoveryJournal.Stage stage=entries.get(0).stage;
            trace.add("persist:"+stage);writes.add(new ArrayList<>(entries));
            String mode=stage==HideRecoveryJournal.Stage.PREPARED?preparedSave:observedSave;
            if(mode.equals("THROW"))throw new IllegalStateException("persist fixture");
            if(mode.equals("NULL"))return null;
            if(mode.equals("DENIED"))return new RootShell.Result(74,"save denied",false);
            if(mode.equals("TIMEOUT"))return new RootShell.Result(-1,"save timed out",true);
            for(HideRecoveryJournal.Entry e:entries) {
                // Store through the production codec, never a fixture-only record representation.
                HideRecoveryJournal.Entry parsed=HideRecoveryJournal.parse(e.encode());
                check(parsed!=null&&parsed.encode().equals(e.encode()),"production codec roundtrip");
                durable.add(parsed);
            }
            if(mode.equals("ACK_LOST"))return new RootShell.Result(-1,"lost acknowledgement",true);
            return new RootShell.Result(0,"saved",false);
        }
        @Override public String revalidate(Map<Target,HideRecoveryJournal.Entry> entries) {
            validations++;trace.add("identity:"+validations);
            if(validations==identityChangeAt) {
                if(identityChange.equals("THROW"))throw new IllegalStateException("identity fixture");
                if(identityChange.equals("NULL"))return null;
                if(identityChange.equals("FAILURE"))return "identity unavailable";
                Target t=entries.keySet().iterator().next();Identity old=identities.get(t);
                identities.put(t,new Identity(identityChange.equals("SERIAL")?old.serial+1:old.serial,
                        identityChange.equals("PACKAGE")?OTHER:old.hash));
            }
            for(Map.Entry<Target,HideRecoveryJournal.Entry> pair:entries.entrySet()) {
                Identity current=identities.get(pair.getKey());HideRecoveryJournal.Entry e=pair.getValue();
                if(current.serial!=e.userSerial||!current.hash.equals(e.packageIdentity))return "identity changed";
            }
            return "";
        }
        @Override public RootShell.Result hide(Set<Target> values) {
            trace.add("PM");pmBatches.add(new LinkedHashSet<>(values));
            for(Target t:values)actual.put(t,pmState);
            if(pmMode.equals("THROW"))throw new IllegalStateException("may have started");
            if(pmMode.equals("NULL"))return null;
            if(pmMode.equals("TIMEOUT"))return new RootShell.Result(-1,"hung",true);
            if(pmMode.equals("EXIT"))return new RootShell.Result(42,"pm refused",false);
            return new RootShell.Result(0,"",false);
        }
        HideBatchExecutor.Outcome<Target> batch() {
            return new HideBatchExecutor<>(new HideBatchExecutor.Transport<Target>() {
                public Map<Target,HideBatchExecutor.State> query(Set<Target> values) {return snapshot(values);}
                public HideBatchExecutor.CommandResult change(Set<Target> values,boolean hide) {
                    check(hide,"fixture only permits hides");return recorder.hide(values);
                }
            }).execute(requested,true);
        }
        long count(HideRecoveryJournal.Stage stage) {return durable.stream().filter(e->e.stage==stage).count();}
        List<HideRecoveryJournal.Entry> observed() {
            return durable.stream().filter(e->e.stage==HideRecoveryJournal.Stage.OBSERVED).toList();
        }
    }
    static void stopped(HideBatchExecutor.CommandResult result,Fixture f,int expectedWrites,int expectedPm) {
        check(result.stop&&!result.error.isEmpty(),"must stop with diagnostic");
        check(f.writes.size()==expectedWrites,"unexpected journal writes: "+f.trace);
        check(f.pmBatches.size()==expectedPm,"unexpected PM call: "+f.trace);
    }
    static void stoppedBatch(Fixture f,int expectedWrites,int expectedPm) {
        HideBatchExecutor.Outcome<Target> result=f.batch();
        check(result.success.isEmpty(),"unsafe success despite stop: "+result.success);
        check(result.failures.size()==f.requested.size(),"unattempted batch not failed");
        check(f.writes.size()==expectedWrites,"journal retried or next batch executed: "+f.trace);
        check(f.pmBatches.size()==expectedPm,"PM retried or next batch executed: "+f.trace);
    }
    public static void main(String[] args) {
        test("preexisting hidden and repeated hidden create no records",()->{
            Fixture f=new Fixture(targets(3));f.actual.replaceAll((t,s)->HIDDEN);
            HideBatchExecutor.CommandResult r=f.recorder.hide(f.requested);
            check(!r.stop&&!r.timedOut,"idempotent hidden failed");
            check(f.writes.isEmpty()&&f.preparations==0&&f.pmBatches.isEmpty(),"claimed prior hidden state");
            check(f.batch().success.size()==3&&f.writes.isEmpty(),"batch claimed prior hidden state");
        });
        for(String state:List.of("ERROR","MISSING","OMITTED","THROW","NULL_MAP"))test("fresh "+state+" aborts entire batch",()->{
            Fixture f=new Fixture(targets(20));f.freshSpecial=state;stoppedBatch(f,0,0);
            check(f.preparations==0,"prepared before fresh-state validation");
        });
        for(String mode:List.of("FAILURE","MISSING","EXTRA","NULL_ENTRY","OBSERVED","THROW",
                "NULL_RESULT","BAD_OWNER","BAD_USER","BAD_SERIAL","BAD_PACKAGE","BAD_IDENTITY"))
            test("preparation "+mode+" fails before persistence/PM",()->{
                Fixture f=new Fixture(targets(20));f.prepareMode=mode;stoppedBatch(f,0,0);
            });
        for(String mode:List.of("DENIED","TIMEOUT","THROW","NULL","ACK_LOST"))test("PREPARED "+mode+" blocks PM and subsequent batches",()->{
            Fixture f=new Fixture(targets(20));f.preparedSave=mode;stoppedBatch(f,1,0);
            check(f.validations==0,"identity check passed unconfirmed durable preparation");
            check(f.durable.size()==(mode.equals("ACK_LOST")?8:0),"unexpected durable evidence");
        });
        for(String change:List.of("SERIAL","PACKAGE","FAILURE","THROW","NULL"))test("prepared identity "+change+" retains records and blocks PM",()->{
            Fixture f=new Fixture(targets(20));f.identityChangeAt=1;f.identityChange=change;
            stoppedBatch(f,1,0);check(f.count(HideRecoveryJournal.Stage.PREPARED)==8,"prepared records lost");
        });
        for(String state:List.of("HIDDEN","MISSING","ERROR","OMITTED","THROW","NULL_MAP"))test("prepared state "+state+" retains records and blocks PM",()->{
            Fixture f=new Fixture(targets(20));f.readySpecial=state;stoppedBatch(f,1,0);
            check(f.count(HideRecoveryJournal.Stage.PREPARED)==8,"prepared records lost");
        });
        test("exact durable protocol and repeated hide idempotence",()->{
            Fixture f=new Fixture(targets(1));HideBatchExecutor.CommandResult r=f.recorder.hide(f.requested);
            check(!r.stop&&!r.timedOut&&r.error.isEmpty(),"normal hide rejected");
            check(f.trace.equals(List.of("query:fresh","prepare","persist:PREPARED","identity:1",
                    "query:ready","PM","identity:2","query:post","persist:OBSERVED")),"order "+f.trace);
            check(f.durable.size()==2,"two immutable stages required");
            HideRecoveryJournal.Entry p=f.durable.get(0),o=f.durable.get(1);
            check(p.operationId.equals(o.operationId)&&p.ownerId.equals(o.ownerId)
                    &&p.userSerial==o.userSerial&&o.state.equals("HIDDEN")&&!o.timedOut&&o.exitCode==0,
                    "observation attribution/state incorrect");
            f.recorder.hide(f.requested);check(f.durable.size()==2&&f.pmBatches.size()==1,"repeat appended or mutated");
        });
        test("same package in two users is independently recorded",()->{
            Set<Target> ts=new LinkedHashSet<>(List.of(new Target(0,"org.example.shared"),new Target(12,"org.example.shared")));
            Fixture f=new Fixture(ts);check(f.batch().success.equals(ts),"cross-user targets collapsed");
            Set<Integer> users=new HashSet<>();Set<String> operations=new HashSet<>();Set<Long> serials=new HashSet<>();
            for(HideRecoveryJournal.Entry e:f.observed()) {users.add(e.userId);operations.add(e.operationId);serials.add(e.userSerial);}
            check(users.equals(Set.of(0,12))&&operations.size()==2&&serials.equals(Set.of(1000L,1012L)),"user evidence collapsed");
        });
        test("preexisting hidden user is excluded while visible peer is recorded",()->{
            Target a=new Target(0,"org.example.shared"),b=new Target(12,"org.example.shared");
            Fixture f=new Fixture(new LinkedHashSet<>(List.of(a,b)));f.actual.put(a,HIDDEN);
            f.recorder.hide(f.requested);
            check(f.durable.size()==2&&f.durable.stream().allMatch(e->e.userId==12),"claimed preexisting user");
            check(f.pmBatches.equals(List.of(Set.of(b))),"PM crossed user boundary");
        });
        for(String mode:List.of("THROW","TIMEOUT","NULL"))test("PM "+mode+" persists uncertain result and stops remaining batches",()->{
            Fixture f=new Fixture(targets(20));f.pmMode=mode;
            HideBatchExecutor.Outcome<Target> result=f.batch();
            check(f.pmBatches.size()==1&&f.writes.size()==2,"continued writes after uncertain command");
            check(result.success.isEmpty()&&result.failures.size()==20,"uncertain command promoted by later state");
            check(f.observed().size()==8&&f.observed().stream().allMatch(e->e.timedOut&&e.exitCode==-1&&e.state.equals("HIDDEN")),
                    "uncertain command evidence lost");
        });
        test("timed out PM still visible is recorded without retry or following batch",()->{
            Fixture f=new Fixture(targets(20));f.pmMode="TIMEOUT";f.pmState=VISIBLE;
            stoppedBatch(f,2,1);
            check(f.observed().size()==8&&f.observed().stream().allMatch(e->e.timedOut&&e.exitCode==-1&&e.state.equals("VISIBLE")),
                    "visible timeout evidence lost");
        });
        test("PM nonzero exit recorded exactly",()->{
            Fixture f=new Fixture(targets(1));f.pmMode="EXIT";f.pmState=VISIBLE;
            HideBatchExecutor.CommandResult result=f.recorder.hide(f.requested);
            check(result.stop&&!result.error.isEmpty()&&!result.timedOut,"exit status lost or retry permitted");
            HideRecoveryJournal.Entry e=f.observed().get(0);
            check(e.exitCode==42&&!e.timedOut&&e.state.equals("VISIBLE"),"nonzero exit evidence wrong");
        });
        test("nonzero PM cannot be promoted by later HIDDEN state",()->{
            Fixture f=new Fixture(targets(20));f.pmMode="EXIT";f.pmState=HIDDEN;
            stoppedBatch(f,2,1);
            check(f.preparations==1,"failed command created another attempt");
            check(f.observed().size()==8&&f.observed().stream().allMatch(e->e.exitCode==42&&e.state.equals("HIDDEN")),
                    "observed state must remain evidence even though attempt failed");
        });
        for(HideBatchExecutor.State state:List.of(VISIBLE,MISSING))test("exit-zero PM with post "+state+" stops without a new attempt",()->{
            Fixture f=new Fixture(targets(20));f.pmState=state;
            stoppedBatch(f,2,1);
            check(f.preparations==1,"unconfirmed state created another attempt");
            check(f.observed().size()==8&&f.observed().stream().allMatch(e->e.exitCode==0&&e.state.equals(state.name())),
                    "unconfirmed state observation lost");
        });
        for(String mode:List.of("DENIED","TIMEOUT","THROW","NULL","ACK_LOST"))test("OBSERVED "+mode+" prevents success/retry/following batch even actually hidden",()->{
            Fixture f=new Fixture(targets(20));f.observedSave=mode;stoppedBatch(f,2,1);
            check(f.actual.values().stream().filter(s->s==HIDDEN).count()==8,"fixture must model actual PM success");
            check(f.count(HideRecoveryJournal.Stage.PREPARED)==8,"prepared records discarded");
        });
        for(String change:List.of("SERIAL","PACKAGE","FAILURE","THROW","NULL"))test("post identity "+change+" records ERROR and stops",()->{
            Fixture f=new Fixture(targets(20));f.identityChangeAt=2;f.identityChange=change;stoppedBatch(f,2,1);
            check(f.observed().size()==8&&f.observed().stream().allMatch(e->e.state.equals("ERROR")),"unverified identity accepted");
        });
        for(String state:List.of("ERROR","OMITTED","THROW","NULL_MAP"))test("post state "+state+" records ERROR and stops",()->{
            Fixture f=new Fixture(targets(20));f.postSpecial=state;stoppedBatch(f,2,1);
            check(f.observed().stream().anyMatch(e->e.state.equals("ERROR")),"unknown state evidence lost");
        });
        test("normal multiple batches remain bounded and independently recorded",()->{
            Fixture f=new Fixture(targets(20));check(f.batch().success.size()==20,"normal batch incomplete");
            check(f.pmBatches.stream().map(Set::size).toList().equals(List.of(8,8,4)),"batch size bound lost");
            check(f.count(HideRecoveryJournal.Stage.PREPARED)==20&&f.observed().size()==20,"missing per-target stage");
        });
        System.out.println("RECORDER RESULT "+passed+" passed, "+failed+" failed");
        if(failed>0)System.exit(1);
    }
}
'''


def compile_and_run(folder, sources, test_class, javac, java, shell=None):
    folder.mkdir()
    paths = []
    for name, content in sources.items():
        path = folder / name
        path.write_text(content, encoding="utf-8")
        paths.append(str(path))
    classes = folder / "classes"
    compiled = subprocess.run([javac, "--release", "17", "-encoding", "UTF-8", "-d", str(classes), *paths],
                              text=True, encoding="utf-8", errors="replace", capture_output=True, timeout=90)
    (folder / "javac.stdout.txt").write_text(compiled.stdout, encoding="utf-8")
    (folder / "javac.stderr.txt").write_text(compiled.stderr, encoding="utf-8")
    results = [{"command": compiled.args, "exitCode": compiled.returncode}]
    (folder / "results.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
    if compiled.returncode:
        print(compiled.stdout + compiled.stderr)
        return False
    vm_args = ["-Dlsa.test.shell=" + shell] if shell else []
    executed = subprocess.run([java, *vm_args, "-cp", str(classes), "ls.augment.com." + test_class],
                              text=True, encoding="utf-8", errors="replace", capture_output=True, timeout=90)
    (folder / "java.stdout.txt").write_text(executed.stdout, encoding="utf-8")
    (folder / "java.stderr.txt").write_text(executed.stderr, encoding="utf-8")
    results.append({"command": executed.args, "exitCode": executed.returncode})
    (folder / "results.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
    print(executed.stdout, end="")
    if executed.stderr:
        print(executed.stderr, end="")
    return executed.returncode == 0


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, default=SOURCE, help="Alternate Java source directory for negative controls")
    parser.add_argument("--manager-source", type=Path, help="Execute this manager's actual executeBatch (supports pre-recorder source)")
    parser.add_argument("--fixture", type=Path, default=ROOT / "tools/HideRootManagerRecordingFixture.java")
    parser.add_argument("--client-test", type=Path, default=ROOT / "tools/TestHideRootTransactions.java")
    parser.add_argument("--artifacts", type=Path, help="New output directory retaining generated inputs and actual exit codes")
    parser.add_argument("--javac", default="javac")
    parser.add_argument("--java", default="java")
    parser.add_argument("--shell", help="Local POSIX shell for isolated command sequencing; never Android/su")
    args = parser.parse_args()
    shell = args.shell or shutil.which("sh")
    if not shell:
        git = shutil.which("git")
        bundled = Path(git).resolve().parents[1] / "bin/bash.exe" if git else None
        if bundled and bundled.is_file():
            shell = str(bundled)
    if not shell:
        parser.error("A local POSIX shell is required; pass --shell (Git for Windows includes bash.exe)")
    names = ("HideMutationRecorder.java", "HideBatchExecutor.java", "RootShell.java", "HideRecoveryJournal.java", "HideRootClient.java", "HideRootPendingStore.java", "HideRootProtocol.java", "HideRootServer.java", "HideTargetCodec.java", "HideRestoreGrantLedger.java", "HideRestoreGrantStore.java")
    production = {name: (args.source_dir / name).read_text(encoding="utf-8") for name in names}
    current_manager = (args.source_dir / "RootHideManager.java").read_text(encoding="utf-8")
    manager = args.manager_source.read_text(encoding="utf-8") if args.manager_source else current_manager
    members = [member(manager, "private HideBatchExecutor.Outcome<Target> executeBatch(")]
    for signature in ("private HideBatchExecutor.CommandResult recordHide(",):
        # Legacy executeBatch directly invokes RootShell. Supplying helpers that
        # it never calls keeps the harness compilable without changing that path.
        source = manager if signature in manager else current_manager
        if source is not manager:
            print("Negative-control harness: current helper supplied but legacy executeBatch unchanged: " + signature)
        members.append(member(source, signature))
    # Model adapter does not replace any pre-fix execution member under test.
    members.append(member(current_manager, "static final class Target"))
    extracted = "\n".join(members)
    # Prevent any root launch in the integration test; the rest of RootShell is actual source.
    signature = "static Result run(String command, String stdin, long timeoutSeconds, int maxOutput,"
    transport = member(production["RootShell.java"], signature)
    replacement = transport[:transport.index("{") + 1] + "\nreturn IntegrationIO.run(command, stdin, timeoutSeconds, maxOutput);\n}"
    integration = dict(production)
    integration["TestHideRootTransactions.java"] = args.client_test.read_text(encoding="utf-8")
    integration["RootShell.java"] = production["RootShell.java"].replace(transport, replacement, 1)
    integration["TestHideManagerRecording.java"] = args.fixture.read_text(encoding="utf-8").replace("// @PRODUCTION_MEMBERS@", extracted)
    fixture = dict(production)
    fixture["TestHideMutationRecorder.java"] = RECORDER_TEST
    if args.artifacts:
        args.artifacts.mkdir(parents=True, exist_ok=False)
    with (contextlib.nullcontext(args.artifacts) if args.artifacts else tempfile.TemporaryDirectory(prefix="lsa-hide-recorder-")) as temporary:
        directory = Path(temporary)
        first = compile_and_run(directory / "recorder", fixture, "TestHideMutationRecorder", args.javac, args.java)
        second = compile_and_run(directory / "manager", integration, "TestHideManagerRecording", args.javac, args.java, shell)
    print("Scope: real manager members, Client/Store/Protocol/Server/Journal and Recorder/Batch; Android identity, engine and persistent I/O are explicit models. No su, device, fsync durability or ownership claim.")
    return 0 if first and second else 1


if __name__ == "__main__":
    raise SystemExit(main())
