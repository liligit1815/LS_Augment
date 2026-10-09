package ls.augment.com;

public final class TestModuleRetiredRootStorage {
    public static void main(String[] args) {
        if (args.length == 1 && args[0].equals("--script")) { System.out.print(ModuleRetiredRootStorage.command()); return; }
        ModuleRetiredRootStorage.Result absent = ModuleRetiredRootStorage.clearAfterBatteryRestore(null);
        if (absent.success || absent.count != 0) throw new AssertionError("missing restoration proof must not clear");
        ModuleRetiredRootStorage.Result failed = ModuleRetiredRootStorage.clearAfterBatteryRestore(new RootShell.Result(74, "restore failed", false));
        if (failed.success || failed.count != 0) throw new AssertionError("failed restoration must not clear");
        String command = ModuleRetiredRootStorage.command();
        if (command.contains("rm -r") || command.contains("runtime.properties'")) throw new AssertionError("unexpected cleanup scope");
        System.out.println("PASS ModuleRetiredRootStorage: missing/failed restoration makes no Root command");
    }
}
