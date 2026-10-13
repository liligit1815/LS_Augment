package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/** Exercises the production recovery engine with explicit platform and durable-disk fixtures. */
public final class TestModuleSystemSettings {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    private static ModuleSystemSettings.Address key(String namespace, String key) { return new ModuleSystemSettings.Address(0, namespace, key); }
    private static final ModuleSystemSettings.Address ADB = key("global", "adb_enabled");
    private static final ModuleSystemSettings.Address LEVEL = key("secure", "reduce_bright_colors_level");
    private static final ModuleSystemSettings.Address ACTIVE = key("secure", "reduce_bright_colors_activated");
    private static final ModuleSystemSettings.Address OWNED = key("secure", "ls_augment_extra_dim_owned");
    private static final class Fixture implements ModuleSystemSettings.Store, ModuleSystemSettings.Io {
        Map<String, String> disk = new LinkedHashMap<>();
        final Map<ModuleSystemSettings.Address, String> settings = new LinkedHashMap<>();
        final java.util.List<ModuleSystemSettings.Address> sequence=new java.util.ArrayList<>();
        int writes, failWrite = -1; boolean failCommit, failRead;
        final ModuleSystemSettings.Engine engine = new ModuleSystemSettings.Engine(this, this, 0);
        public Map<String, String> load() { return new LinkedHashMap<>(disk); }
        public boolean commit(Map<String, String> values) { if (failCommit) return false; disk = new LinkedHashMap<>(values); return true; }
        public ModuleSystemSettings.Read read(ModuleSystemSettings.Address address) { return new ModuleSystemSettings.Read(!failRead, settings.get(address)); }
        public boolean write(ModuleSystemSettings.Address address, String value) {
            sequence.add(address);
            check(!address.equals(OWNED) || value == null, "module metadata never written into Settings");
            check(!disk.isEmpty(), "durable private data precedes native platform write or legacy deletion");
            if (++writes == failWrite) return false;
            if (value == null) settings.remove(address); else settings.put(address, value);
            return true;
        }
        ModuleSystemSettings.WriteResult put(ModuleSystemSettings.Address address, String value) {
            return engine.put(Map.of(address, value));
        }
        ModuleSystemSettings.WriteResult dim(String level) {
            LinkedHashMap<ModuleSystemSettings.Address, String> updates = new LinkedHashMap<>();
            updates.put(LEVEL, level); updates.put(ACTIVE, "1");
            ModuleSystemSettings.WriteResult migration = engine.migrateExtraDimOwnership();
            return migration.success ? engine.put(updates) : migration;
        }
    }
    public static void main(String[] args) throws Exception {
        ResetWriteFence.begin();
        java.util.concurrent.atomic.AtomicReference<Throwable> fenced = new java.util.concurrent.atomic.AtomicReference<>();
        Thread writer = new Thread(() -> {
            try {
                check(!ModuleSystemSettings.put(null, "global", "adb_enabled", "1").success, "concurrent setting writer fenced before context access");
                check(!ModuleSystemSettings.setExtraDim(null, true, 50).success, "concurrent dim writer fenced before context access");
            } catch (Throwable error) { fenced.set(error); }
        });
        writer.start(); writer.join(); ResetWriteFence.end();
        if (fenced.get() != null) throw new AssertionError(fenced.get());
        Fixture absent = new Fixture();
        check(absent.put(ADB, "1").success, "initial write");
        check(absent.put(ADB, "0").success && absent.put(ADB, "1").success, "subsequent writes");
        ModuleSystemSettings.RestoreResult restored = absent.engine.restore();
        check(restored.success && restored.restoredCount == 1 && !absent.settings.containsKey(ADB), "first absent baseline is deleted");
        check(absent.disk.isEmpty() && absent.engine.restore().restoredCount == 0, "recovery is idempotent");

        Fixture literalNull = new Fixture(); literalNull.settings.put(ADB, "null");
        check(literalNull.put(ADB, "1").success && literalNull.engine.restore().success, "literal null baseline");
        check(Objects.equals(literalNull.settings.get(ADB), "null"), "literal null remains distinct from absence");

        Fixture dim = new Fixture(); dim.settings.put(LEVEL, "27"); dim.settings.put(ACTIVE, "0");
        check(dim.dim("80").success, "new dim setting");
        check(dim.sequence.get(0).equals(LEVEL) && dim.engine.extraDimOwned() && !dim.settings.containsKey(OWNED),"private ownership precedes native notifications without a Settings marker");dim.sequence.clear();
        check(dim.engine.restore().success && dim.settings.get(LEVEL).equals("27") && dim.settings.get(ACTIVE).equals("0")
                && !dim.settings.containsKey(OWNED) && dim.disk.isEmpty(), "dim restores both originals and removes marker");
        check(dim.sequence.stream().noneMatch(OWNED::equals) && !dim.engine.extraDimOwned(),"restore retires private ownership without creating a Settings marker");

        Fixture commit = new Fixture(); commit.failCommit = true;
        check(!commit.put(ADB, "1").success && commit.writes == 0 && commit.settings.isEmpty(), "failed backup causes no platform write");

        Fixture uncertain = new Fixture(); uncertain.settings.put(ADB, "0");
        check(uncertain.put(ADB, "1").success, "first known write");
        uncertain.failWrite = uncertain.writes + 1;
        check(!uncertain.put(ADB, "0").success, "retry fails before changing platform");
        check(uncertain.engine.restore().success && uncertain.settings.get(ADB).equals("0"), "prior owned value recovers after uncertain write");

        Fixture partial = new Fixture(); partial.settings.put(LEVEL, "20"); partial.failWrite = 2;
        check(!partial.dim("80").success && partial.disk.size() == 3, "all original dim values backed up before partial write");
        check(partial.engine.restore().success && partial.settings.get(LEVEL).equals("20") && !partial.settings.containsKey(ACTIVE), "partial batch restores safely");

        Fixture laterEdit = new Fixture(); laterEdit.settings.put(LEVEL, "20");
        check(laterEdit.dim("80").success, "owned dim baseline"); laterEdit.settings.put(LEVEL, "35");
        ModuleSystemSettings.RestoreResult changed = laterEdit.engine.restore();
        check(!changed.success && changed.reviewRequired && laterEdit.settings.get(LEVEL).equals("35")
                && laterEdit.disk.containsKey(LEVEL.id()), "external later edit remains and recovery record survives");

        Fixture legacy = new Fixture(); legacy.settings.put(OWNED, "1"); legacy.settings.put(LEVEL, "91");
        ModuleSystemSettings.RestoreResult old = legacy.engine.restore();
        check(!old.success && old.reviewRequired && legacy.writes == 1 && legacy.engine.extraDimOwned() && !legacy.settings.containsKey(OWNED), "old marker migrates but alone does not reveal prior dim values");
        check(legacy.dim("60").success, "legacy setting remains operable");
        check(!legacy.engine.restore().success && legacy.settings.get(LEVEL).equals("60"), "legacy snapshot must not invent a baseline");

        Fixture inactiveLegacy=new Fixture();inactiveLegacy.settings.put(OWNED,"1");inactiveLegacy.settings.put(ACTIVE,"0");inactiveLegacy.settings.put(LEVEL,"42");
        ModuleSystemSettings.RestoreResult retired=inactiveLegacy.engine.restore();
        check(retired.success&&retired.legacyDimHistoryUnknown&&!inactiveLegacy.settings.containsKey(OWNED),"inactive legacy marker retired with explicit missing history");
        check(inactiveLegacy.settings.get(ACTIVE).equals("0")&&inactiveLegacy.settings.get(LEVEL).equals("42")&&inactiveLegacy.writes==1,"legacy native strength and disabled state preserved");
        Fixture activeLegacy=new Fixture();activeLegacy.settings.put(OWNED,"1");activeLegacy.settings.put(ACTIVE,"1");
        check(!activeLegacy.engine.restore().success&&activeLegacy.writes==1&&activeLegacy.engine.extraDimOwned(),"active legacy dim still requires a real baseline after private migration");
        Fixture deniedLegacy=new Fixture();deniedLegacy.settings.put(OWNED,"1");deniedLegacy.settings.put(ACTIVE,"0");deniedLegacy.failWrite=1;
        check(!deniedLegacy.engine.restore().success&&deniedLegacy.settings.containsKey(OWNED),"failed marker removal preserves legacy evidence");

        Fixture blockedMigration = new Fixture(); blockedMigration.settings.put(OWNED,"1"); blockedMigration.failCommit=true;
        check(!blockedMigration.engine.migrateExtraDimOwnership().success && blockedMigration.writes==0
                && blockedMigration.settings.containsKey(OWNED),"failed private persistence never removes the old marker");
        blockedMigration.failCommit=false;
        check(blockedMigration.engine.migrateExtraDimOwnership().success && blockedMigration.engine.extraDimOwned()
                && !blockedMigration.settings.containsKey(OWNED),"failed migration can safely retry");
        int migrationWrites=blockedMigration.writes;
        check(blockedMigration.engine.migrateExtraDimOwnership().success && blockedMigration.writes==migrationWrites,"migration retry never recreates legacy metadata");
        Fixture forbidden = new Fixture();
        check(!forbidden.put(OWNED,"1").success && forbidden.writes==0 && forbidden.disk.isEmpty(),"public platform writer rejects custom Settings metadata");
        Fixture oldComplete = new Fixture(); oldComplete.settings.put(OWNED,"1");oldComplete.settings.put(LEVEL,"80");oldComplete.settings.put(ACTIVE,"1");
        oldComplete.disk.put(OWNED.id(),new ModuleSystemSettings.Record(OWNED,true,null,null,"1").encode());
        oldComplete.disk.put(LEVEL.id(),new ModuleSystemSettings.Record(LEVEL,true,"23","23","80").encode());
        oldComplete.disk.put(ACTIVE.id(),new ModuleSystemSettings.Record(ACTIVE,true,"0","0","1").encode());
        check(oldComplete.engine.migrateExtraDimOwnership().success && oldComplete.engine.extraDimOwned(),"existing complete recovery record is retained during migration");
        check(oldComplete.engine.restore().success && "23".equals(oldComplete.settings.get(LEVEL)) && "0".equals(oldComplete.settings.get(ACTIVE))
                && !oldComplete.settings.containsKey(OWNED),"migrated upgrade restores the actual original native values");

        Fixture damaged = new Fixture(); damaged.disk.put(ADB.id(), "corrupt");
        check(!damaged.engine.restore().success && damaged.writes == 0 && damaged.disk.containsKey(ADB.id()), "corrupt record fails closed");

        Fixture denied = new Fixture(); denied.settings.put(ADB, "0"); check(denied.put(ADB, "1").success, "root fixture setup");
        denied.failRead = true; check(!denied.engine.restore().success && !denied.disk.isEmpty(), "denied root retains recovery evidence");
        denied.failRead = false; denied.failCommit = true;
        check(!denied.engine.restore().success && denied.settings.get(ADB).equals("0") && !denied.disk.isEmpty(), "cleanup failure retains retry record");
        denied.failCommit = false; check(denied.engine.restore().success && denied.disk.isEmpty(), "cleanup retry does not repeat platform mutation");

        Fixture user = new Fixture();
        check(!user.engine.put(Map.of(new ModuleSystemSettings.Address(10, "global", "adb_enabled"), "1")).success && user.writes == 0,
                "different Android user cannot be modified by this owner");
        check(!user.put(LEVEL, "101").success && user.writes == 0, "out of range inputs rejected");
        Fixture secondary = new Fixture();
        ModuleSystemSettings.Address secondaryMarker = new ModuleSystemSettings.Address(10, "secure", "ls_augment_extra_dim_owned");
        ModuleSystemSettings.Address secondaryLevel = new ModuleSystemSettings.Address(10, "secure", "reduce_bright_colors_level");
        secondary.settings.put(secondaryMarker, "1"); secondary.settings.put(secondaryLevel, "62");
        ModuleSystemSettings.Engine secondaryEngine = new ModuleSystemSettings.Engine(secondary, secondary, 10);
        check(secondaryEngine.migrateExtraDimOwnership().success && secondaryEngine.extraDimOwned()
                && !secondary.settings.containsKey(secondaryMarker) && "62".equals(secondary.settings.get(secondaryLevel)),
                "secondary user migrates only its own metadata and retains native state");
        check(!secondary.engine.restore().success && secondary.disk.keySet().stream().allMatch(id -> id.startsWith("10:")),
                "another app user cannot read or restore a different user's private recovery records");
        try { key("global", "unrelated_user_setting"); throw new AssertionError("unknown settings must be rejected"); }
        catch (IllegalArgumentException expected) { checks++; }
        System.out.println("PASS ModuleSystemSettings: " + checks + " assertions; no device commands");
    }
}
