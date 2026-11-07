/* Appended to the extracted manager in test-hide-recovery-save-guard.py. */
class ResetWriteFence {
    static boolean reset;
    static boolean stale(long generation) { return reset; }
}

class HideRecoveryEmergency {
    static RootShell.Result install() {
        Events.add("retire");
        return new RootShell.Result(0, "done", false);
    }
}

class HidePrivateStorage {
    static RootShell.Result run(String command, String input, int timeout, int max) {
        throw new AssertionError("The fixture must use the injected store transport");
    }
}

class CurrentSaveBoundary {
    static String document;
    static boolean refuse;
    static RootShell.Result run(HideTargetStore.Operation operation) {
        String reply;
        if (operation.mode == HideTargetStore.Mode.CAS) {
            Events.add("commit");
            String existing = document == null ? "ABSENT" : HideTargetStore.sha256(document);
            if (refuse || !existing.equals(operation.expectedHash)) reply = "CONFLICT";
            else {
                document = operation.stdin();
                reply = data("APPLIED", document);
            }
        } else if (operation.mode == HideTargetStore.Mode.LEGACY || document == null) reply = "ABSENT";
        else reply = data("DATA", document);
        byte[] bytes = ("LSAT_STORE1\n" + reply + "\nLSAT_STORE_END\n").getBytes(java.nio.charset.StandardCharsets.US_ASCII);
        return new RootShell.Result(0, "", false, new RootShell.CapturedOutput(bytes, true, false, false));
    }
    static String data(String kind, String text) {
        return kind + "|" + HideTargetStore.sha256(text) + "|" + Base64.getEncoder().encodeToString(
                text.getBytes(java.nio.charset.StandardCharsets.UTF_8));
    }
}

public class TestHideRecoverySaveGuard {
    static final String OLD = "12:org.example.old";
    static int checks;
    static void check(boolean condition, String name) {
        if (!condition) throw new AssertionError(name);
        checks++;
    }
    static RootHideManager fresh(String raw) {
        CurrentSaveBoundary.document = null;
        CurrentSaveBoundary.refuse = ResetWriteFence.reset = false;
        Events.trace.clear();
        HideRecoveryArchive.calls = 0;
        HideRecoveryArchive.failAt = Integer.MAX_VALUE;
        HideRecoveryArchive.payloads.clear();
        RootHideManager manager = new RootHideManager();
        manager.config.values.put(AppConfig.HIDE_TARGETS, raw);
        return manager;
    }
    static void noPackageChange(RootHideManager manager) {
        check(manager.pmChanges == 0 && manager.stateQueries == 0, "saving changed or inspected package state");
        check(!RootHideManager.ACTION_LOCK.isLocked(), "action lock leaked");
    }
    public static void main(String[] args) {
        for (RootShell.Result failure : Arrays.asList(new RootShell.Result(74,"storage",false),
                new RootShell.Result(0,"timeout",true))) {
            RootHideManager m = fresh(OLD);
            HideRecoveryArchive.failAt = 1;
            HideRecoveryArchive.outcome = failure;
            check(!m.refreshTargets().success, "archive failure allowed migration");
            check(!m.saveTargets(Collections.emptySet(), Collections.emptyMap()).success, "failed migration allowed clearing");
            check(HideRecoveryArchive.payloads.equals(Collections.singletonList(OLD)), "exact pre-migration text lost");
            check(CurrentSaveBoundary.document == null && m.config.saves == 0 && m.config.get(AppConfig.HIDE_TARGETS).equals(OLD),
                    "failed migration altered durable or private selection");
            noPackageChange(m);
        }
        RootHideManager m = fresh("v9:12:malformed");
        check(!m.refreshTargets().success && CurrentSaveBoundary.document == null &&
                m.config.get(AppConfig.HIDE_TARGETS).equals("v9:12:malformed"), "corrupt previous raw value overwritten");
        noPackageChange(m);
        m = fresh(OLD);
        check(m.refreshTargets().success, "migration failed");
        check(Events.trace.indexOf("archive") >= 0 && Events.trace.indexOf("commit") > Events.trace.indexOf("archive"),
                "migration wrote before archiving original text");
        String original = CurrentSaveBoundary.document;
        long revision = m.targetSnapshot.revision;
        Set<RootHideManager.Target> proposed = Collections.singleton(new RootHideManager.Target(12,42,"org.example.new"));
        Map<String,String> settings = Collections.singletonMap("label","updated");
        Map<String,String> cache = new LinkedHashMap<>(m.config.values);
        CurrentSaveBoundary.refuse = true;
        for (Set<RootHideManager.Target> selection : Arrays.asList(m.targets(), proposed, Collections.<RootHideManager.Target>emptySet())) {
            check(!m.saveTargets(selection, settings, revision).success, "failed save reported success");
            check(m.config.values.equals(cache) && CurrentSaveBoundary.document.equals(original), "failed write changed settings");
            noPackageChange(m);
        }
        CurrentSaveBoundary.refuse = false;
        check(!m.saveTargets(proposed, settings, revision-1).success, "stale revision replaced a newer selection");
        check(!m.saveTargets(proposed, Collections.singletonMap("invalid","1"), revision).success, "invalid settings written");
        m.root=RootHideManager.RootState.DENIED;
        check(!m.saveTargets(proposed, settings, revision).success, "Root denial ignored");
        m.root=RootHideManager.RootState.GRANTED;
        m.conflict=true;
        check(!m.saveTargets(proposed, settings, revision).success, "conflicting backend ignored");
        m.conflict=false;
        ResetWriteFence.reset=true;
        check(!m.saveTargets(proposed, settings, revision).success, "reset gate ignored");
        ResetWriteFence.reset=false;
        check(CurrentSaveBoundary.document.equals(original) && m.config.values.equals(cache), "invalid save changed state");
        Events.trace.clear();
        check(m.saveTargets(proposed,settings,revision).success,"valid selection failed");
        check(Events.trace.indexOf("commit")>=0 && Events.trace.indexOf("private-save")>Events.trace.indexOf("commit"),
                "published cache before durable commit");
        check(m.targets().equals(proposed) && m.targetSnapshot.records.size()==2 &&
                m.targetSnapshot.records.stream().anyMatch(r -> !r.managed && r.packageName.equals("org.example.old")),
                "deselecting deleted the historical entry");
        check(m.config.values.get("label").equals("updated"),"settings lost");
        noPackageChange(m);
        System.out.println("Current hide selection save guard passed " + checks + " checks");
    }
}
