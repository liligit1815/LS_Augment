"""Execute the production saveTargets method with offline recovery-archive doubles.

The archive double injects its reported outcome; this test verifies ordering and
failure propagation in RootHideManager, not the helper's on-disk transaction or
marker validation. No su, adb, device, or production preference write is executed.
--manager-source accepts a pre-fix snapshot for a failing negative control.
"""
from pathlib import Path
import argparse
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    """Extract one complete member without counting braces in comments/strings."""
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


DOUBLES = r'''
package ls.augment.com;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Pattern;

class Events {
    static final List<String> trace = new ArrayList<>();
    static void add(String event) {
        if (!RootHideManager.ACTION_LOCK.isHeldByCurrentThread())
            throw new AssertionError("Action outside manager lock: " + event);
        trace.add(event);
    }
}
class AppConfig {
    static final String HIDE_TARGETS = "targets";
    final Map<String,String> values = new LinkedHashMap<>();
    int saves;
    String get(String key) { return values.get(key); }
    SaveResult save(Map<String,String> update) {
        Events.add("private-save"); saves++; values.putAll(update); return new SaveResult();
    }
    static final class SaveResult {
        final boolean success = true, runtimeSynced = true;
        final String message = "saved";
    }
}
class ConfigSchema {
    // Injectable validator result: the production saveTargets method decides
    // whether a rejected configuration may proceed to archive or PM operations.
    static String normalize(String key, String value) { return "invalid".equals(key) ? null : value; }
}
class HideRecoveryArchive {
    static RootShell.Result outcome;
    static int calls;
    static int failAt;
    static String proposed;
    static final List<String> payloads=new ArrayList<>();
    static RootShell.Result preserve(String text) {
        Events.add("archive"); calls++; proposed = text; payloads.add(text);
        return calls<failAt?new RootShell.Result(0,"saved",false):outcome;
    }
}
class AuditLog { static void write(Object context, String action, String message) { Events.add("audit"); } }
class HideUserIdentity {
    static final class Snapshot {
        final boolean success;final String message;
        Snapshot(boolean success){this.success=success;message="user identity unavailable";}
    }
}
'''


MANAGER = r'''
class RootHideManager {
    static final ReentrantLock ACTION_LOCK = new ReentrantLock();
    final AppConfig config = new AppConfig();
    final Object context = new Object();
    final Map<Target,State> states = new LinkedHashMap<>();
    RootState root = RootState.GRANTED;
    boolean conflict;
    UserDirectory directory = UserDirectory.success(Arrays.asList(new UserRecord(0,"Owner"), new UserRecord(12,"Other")));
    int stateQueries, pmChanges, rootWrites, mirrorWrites;
    String rootContents;
    enum RootState { GRANTED, DENIED }
    enum State { VISIBLE, HIDDEN, MISSING, ERROR }
    RootStatus rootStatus() { return new RootStatus(root,"root fixture", "offline"); }
    ConflictState conflictState() { return new ConflictState(conflict,false,"conflict fixture"); }
    UserDirectory listUsersResult(boolean requestRoot) { return directory; }
    HideUserIdentity.Snapshot matchUser(Target target) {
        return new HideUserIdentity.Snapshot(directory.success && directory.userIds().contains(target.userId));
    }
    Set<Target> userInstalledTargets(Set<Target> targets) { return new LinkedHashSet<>(targets); }
    State queryState(Target target) {
        Events.add("query:"+target); stateQueries++; return states.getOrDefault(target,State.VISIBLE);
    }
    OperationResult changeValidated(Target target, boolean hide, Set<Integer> knownUsers) {
        Events.add("pm:"+target+":"+hide); pmChanges++;
        states.put(target,hide?State.HIDDEN:State.VISIBLE); return OperationResult.success("changed");
    }
    RootShell.Result writeRootTargets(String value) {
        Events.add("root-target-write"); rootWrites++; rootContents=value;
        return new RootShell.Result(0,"written",false);
    }
    OperationResult syncMirrors() {
        Events.add("mirror"); mirrorWrites++; return OperationResult.success("mirrored");
    }
'''


TESTS = r'''
public class TestHideRecoverySaveGuard {
    static int passed, failed;
    static final String OLD = "0:org.example.old;12:org.example.old";
    static final String NEXT = "v3:0:0:org.example.shared\nv3:12:42:org.example.shared";
    static void require(boolean value, String message) { if(!value)throw new AssertionError(message); }
    static void test(String name, Runnable body) {
        try { body.run(); passed++; System.out.println("PASS "+name); }
        catch(Throwable failure) { failed++; System.out.println("FAIL "+name+": "+failure); }
    }
    static RootHideManager fixture() {
        Events.trace.clear(); HideRecoveryArchive.calls=0; HideRecoveryArchive.proposed=null;
        HideRecoveryArchive.failAt=1;HideRecoveryArchive.payloads.clear();
        HideRecoveryArchive.outcome=new RootShell.Result(0,"archive fixture success",false);
        RootHideManager manager=new RootHideManager();
        manager.config.values.put(AppConfig.HIDE_TARGETS,OLD);
        manager.config.values.put("label","unchanged");
        for(RootHideManager.Target target:manager.targets())manager.states.put(target,RootHideManager.State.HIDDEN);
        return manager;
    }
    static Set<RootHideManager.Target> desired() {
        return new LinkedHashSet<>(Arrays.asList(new RootHideManager.Target(12,42,"org.example.shared"),
                new RootHideManager.Target(0,0,"org.example.shared")));
    }
    static void untouched(RootHideManager manager, Map<String,String> configBefore,
                          Map<RootHideManager.Target,RootHideManager.State> statesBefore) {
        require(manager.stateQueries==0,"queried old PM states before archive success");
        require(manager.pmChanges==0,"changed PM before archive success");
        require(manager.rootWrites==0,"overwrote active root recovery list before archive success");
        require(manager.config.saves==0,"wrote private configuration before archive success");
        require(manager.mirrorWrites==0,"published mirrors before archive success");
        require(manager.config.values.equals(configBefore),"private selection/settings changed on rejection");
        require(manager.states.equals(statesBefore),"hidden states changed on rejection");
        require(!RootHideManager.ACTION_LOCK.isLocked(),"save failure leaked action lock");
    }
    static void archiveFailure(String name, RootShell.Result injected) {
        test(name,()->{
            RootHideManager manager=fixture(); HideRecoveryArchive.outcome=injected;
            Map<String,String> before=new LinkedHashMap<>(manager.config.values);
            Map<RootHideManager.Target,RootHideManager.State> statesBefore=new LinkedHashMap<>(manager.states);
            RootHideManager.OperationResult result=manager.saveTargets(desired(),Collections.singletonMap("label","changed"));
            require(!result.success,"save accepted the archive failure");
            require(HideRecoveryArchive.calls==1,"archive was not attempted exactly once");
            require(OLD.equals(HideRecoveryArchive.proposed),"previous private selection was not preserved first");
            untouched(manager,before,statesBefore);
            require(Events.trace.equals(Collections.singletonList("archive")),"side effect on failure: "+Events.trace);
        });
    }
    static void validationFailure(String name, java.util.function.Consumer<RootHideManager> prepare,
                                  Set<RootHideManager.Target> desired, Map<String,String> settings) {
        test(name,()->{
            RootHideManager manager=fixture(); prepare.accept(manager);
            Map<String,String> before=new LinkedHashMap<>(manager.config.values);
            Map<RootHideManager.Target,RootHideManager.State> statesBefore=new LinkedHashMap<>(manager.states);
            require(!manager.saveTargets(desired,settings).success,"validation failure accepted");
            require(HideRecoveryArchive.calls==0,"archived rejected inputs");
            untouched(manager,before,statesBefore);
            require(Events.trace.isEmpty(),"validation failure had side effects: "+Events.trace);
        });
    }
    public static void main(String[] args) {
        archiveFailure("archive refusal stops every state operation",new RootShell.Result(1,"archive refused",false));
        archiveFailure("archive timeout stops every state operation",new RootShell.Result(-1,"timeout",true));
        archiveFailure("archive verification failure stops every state operation",new RootShell.Result(65,"checksum/marker rejected",false));
        archiveFailure("timed-out zero exit is still rejected",new RootShell.Result(0,"partial output",true));
        test("old private and proposed selections archived before stores without implicit restore",()->{
            RootHideManager manager=fixture();
            RootHideManager.OperationResult result=manager.saveTargets(desired(),Collections.singletonMap("label","new label"));
            require(result.success&&result.runtimeSynced,"successful archive did not allow save");
            require(HideRecoveryArchive.payloads.equals(Arrays.asList(OLD,NEXT)),"old/new archive payload lost identity or order");
            List<String> expected=Arrays.asList("archive","archive","root-target-write","private-save","mirror","audit");
            require(Events.trace.equals(expected),"incorrect operation order: "+Events.trace);
            require(NEXT.equals(manager.rootContents),"active root list differs from archived proposal");
            require(NEXT.replace('\n',';').equals(manager.config.get(AppConfig.HIDE_TARGETS)),"private targets lost per-user identity");
            require("new label".equals(manager.config.get("label")),"other requested settings were lost");
            require(manager.pmChanges==0&&manager.states.values().stream().allMatch(state->state==RootHideManager.State.HIDDEN),"deselection changed old app state");
            require(!RootHideManager.ACTION_LOCK.isLocked(),"success leaked action lock");
        });
        test("archive rejection also prevents clearing the selection",()->{
            RootHideManager manager=fixture(); HideRecoveryArchive.outcome=new RootShell.Result(1,"refused",false);
            Map<String,String> before=new LinkedHashMap<>(manager.config.values);
            Map<RootHideManager.Target,RootHideManager.State> statesBefore=new LinkedHashMap<>(manager.states);
            require(!manager.saveTargets(Collections.emptySet(),Collections.emptyMap()).success,"empty selection bypassed archive guard");
            require(HideRecoveryArchive.calls==1&&OLD.equals(HideRecoveryArchive.proposed),"old selection not checked before empty proposal");
            untouched(manager,before,statesBefore);
        });
        test("unchanged selection still requires archive before configuration writes",()->{
            RootHideManager manager=fixture();
            require(manager.saveTargets(manager.targets(),Collections.singletonMap("label","updated")).success,"unchanged selection save failed");
            require(Events.trace.equals(Arrays.asList("archive","archive","root-target-write","private-save","mirror","audit")),"unchanged selection bypassed ordering: "+Events.trace);
            require(OLD.replace(';','\n').equals(HideRecoveryArchive.proposed),"unchanged target payload not archived");
            require(manager.stateQueries==0&&manager.pmChanges==0,"unchanged targets unnecessarily changed");
        });
        test("new selection archive failure retains old configuration and performs zero PM",()->{
            RootHideManager manager=fixture();HideRecoveryArchive.failAt=2;
            HideRecoveryArchive.outcome=new RootShell.Result(74,"second archive refused",false);
            Map<String,String> before=new LinkedHashMap<>(manager.config.values);
            Map<RootHideManager.Target,RootHideManager.State> statesBefore=new LinkedHashMap<>(manager.states);
            require(!manager.saveTargets(desired(),Collections.emptyMap()).success,"new archive failure accepted");
            require(HideRecoveryArchive.payloads.equals(Arrays.asList(OLD,NEXT)),"old/new archive order wrong");
            untouched(manager,before,statesBefore);
        });
        test("unparseable previous private text is archived verbatim",()->{
            RootHideManager manager=fixture();String raw="bad;private\n999:broken/target";
            manager.config.values.put(AppConfig.HIDE_TARGETS,raw);
            require(manager.saveTargets(desired(),Collections.emptyMap()).success,"raw preservation prevented safe save");
            require(HideRecoveryArchive.payloads.get(0).equals(raw),"raw private evidence normalized away");
            require(manager.pmChanges==0,"raw evidence triggered mutation");
        });
        validationFailure("invalid configuration is rejected before archive",manager->{},desired(),Collections.singletonMap("invalid","value"));
        validationFailure("Root refusal is rejected before archive",manager->manager.root=RootHideManager.RootState.DENIED,desired(),Collections.emptyMap());
        validationFailure("legacy conflict is rejected before archive",manager->manager.conflict=true,desired(),Collections.emptyMap());
        validationFailure("unavailable users are rejected before archive",manager->manager.directory=RootHideManager.UserDirectory.failure("unavailable"),desired(),Collections.emptyMap());
        validationFailure("unknown newly-bound target user is rejected before archive",manager->{},Collections.singleton(new RootHideManager.Target(25,1,"org.example.shared")),Collections.emptyMap());
        validationFailure("invalid user ID is rejected before archive",manager->{},Collections.singleton(new RootHideManager.Target(-1,"org.example.shared")),Collections.emptyMap());
        validationFailure("invalid package is rejected before archive",manager->{},Collections.singleton(new RootHideManager.Target(0,"org.example.shared;bad")),Collections.emptyMap());
        validationFailure("protected package is rejected before archive",manager->{},Collections.singleton(new RootHideManager.Target(0,"ls.augment.com")),Collections.emptyMap());
        System.out.println("Hide recovery save guard: "+passed+" passed, "+failed+" failed; offline, no device operations");
        if(failed!=0)throw new AssertionError("Save guard regressions failed: "+failed);
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manager-source", type=Path, default=SOURCE / "RootHideManager.java")
    args = parser.parse_args()
    manager = args.manager_source.read_text(encoding="utf-8-sig")
    current = (SOURCE / "RootHideManager.java").read_text(encoding="utf-8-sig")
    shell = (SOURCE / "RootShell.java").read_text(encoding="utf-8-sig")
    # The requested saveTargets body remains unchanged for negative controls;
    # current identity-bearing model members only keep old source compilable.
    members = "\n".join(member(manager if "OperationResult saveTargets(" in signature else current, signature) for signature in (
        "    OperationResult saveTargets(Set<Target> desired, Map<String, String> settings)",
        "    Set<Target> targets()", "    private static Set<Target> parseTargets(String raw)",
        "    private static String serialize(Set<Target> targets)",
        "    static boolean isValidPackage(String packageName)",
        "    static boolean isProtected(String packageName)", "    static {",
        "    static final class Target", "    static final class UserRecord {",
        "    static final class UserDirectory {", "    static final class RootStatus {",
        "    static final class ConflictState {", "    static final class OperationResult {",
    ))
    start, end = "    private static final Pattern PACKAGE =", "    private static final Pattern USER ="
    if manager.count(start) != 1 or manager.count(end) != 1:
        raise ValueError("Package validation declaration changed; update extraction explicitly")
    package_pattern = manager[manager.index(start):manager.index(end)]
    java = (DOUBLES + "\nclass RootShell {\n" + member(shell, "    static final class Result {") + "\n}\n"
            + MANAGER + package_pattern + "\n    private static final Set<String> PROTECTED;\n"
            + members + "\n}\n" + TESTS)
    with tempfile.TemporaryDirectory(prefix="ls-hide-recovery-save-guard-") as folder:
        path = Path(folder) / "TestHideRecoverySaveGuard.java"
        path.write_text(java, encoding="utf-8")
        codec = Path(folder) / "HideTargetCodec.java"
        codec.write_text((SOURCE / "HideTargetCodec.java").read_text(encoding="utf-8"), encoding="utf-8")
        subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", folder, str(path), str(codec)],
                       check=True, timeout=60)
        print(f"Manager source under test: {args.manager_source.resolve()}", flush=True)
        result = subprocess.run(["java", "-cp", folder, "ls.augment.com.TestHideRecoverySaveGuard"],
                                check=False, timeout=30)
        raise SystemExit(result.returncode)


if __name__ == "__main__":
    main()
