package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Production external-reset engine exercised without a device or native media provider. */
public final class TestModuleExternalReset {
    private static int checks;
    static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    static ModuleExternalReset.Audio audio(long id, String path, String owner, String name) {
        return new ModuleExternalReset.Audio("content://media/external_primary/audio/media/" + id, path, owner, name);
    }
    static ModuleExternalReset.Audio owned(long id) { return audio(id, "Ringtones/红魔Duo/", "ls.augment.com", "红魔Duo_IP_MC_CN_test.ogg"); }
    static final class Fixture implements ModuleExternalReset.Access {
        String tiles = "wifi,bt"; boolean failReadTiles, failWriteTiles, failLegacy, failMediaRead, failSelected, failDelete;
        int legacyCount, tileWrites, selectedCalls;
        final List<ModuleExternalReset.Audio> audio = new ArrayList<>(), removed = new ArrayList<>();
        final Set<String> selected = new LinkedHashSet<>();
        String selectedDuringDeletion;
        final ModuleExternalReset.Engine engine = new ModuleExternalReset.Engine(this, 0);
        public String tiles() throws Exception { if (failReadTiles) throw new Exception("denied"); return tiles; }
        public boolean replaceTiles(String expected, String replacement) { tileWrites++; if (failWriteTiles) return false; check(tiles.equals(expected), "compare prior tile layout"); tiles = replacement; return true; }
        public ModuleExternalReset.Phase cleanLegacy() { return new ModuleExternalReset.Phase(!failLegacy, legacyCount, "legacy cleanup rejected"); }
        public List<ModuleExternalReset.Audio> audio() throws Exception { if (failMediaRead) throw new Exception("denied"); return new ArrayList<>(audio); }
        public Set<String> selectedAudio() throws Exception {
            if (failSelected) throw new Exception("denied");
            if (++selectedCalls > 1 && selectedDuringDeletion != null) selected.add(selectedDuringDeletion);
            return new LinkedHashSet<>(selected);
        }
        public boolean delete(ModuleExternalReset.Audio entry) { if (failDelete) return false; audio.remove(entry); removed.add(entry); return true; }
    }
    public static void main(String[] args) {
        if (args.length == 1 && args[0].equals("--legacy-script")) { System.out.print(ModuleExternalReset.legacyCommand()); return; }
        Fixture normal = new Fixture();
        normal.tiles = "wifi, custom(ls.augment.com/.AugmentTileService),bt,custom(org.other/.Tile),custom(ls.augment.com/ls.augment.com.ExtraDimTileService),cell";
        normal.legacyCount = 5; normal.audio.add(owned(1));
        normal.audio.add(audio(2, "Alarms/LS_Augment/", "ls.augment.com", "LS_IP_MC_CN_alarm.ogg"));
        ModuleExternalReset.Result ok = normal.engine.restore();
        check(ok.success && ok.count == 9 && !ok.reviewRequired, "all owned stages counted");
        check(normal.tiles.equals("wifi,bt,custom(org.other/.Tile),cell"), "other tiles retain exact ordering");
        check(normal.removed.size() == 2, "current and legacy imported copies removed");
        normal.legacyCount = 0; check(normal.engine.restore().count == 0 && normal.tileWrites == 1, "idempotent rerun");

        String unrelated = "default,custom(io.github.lsf.augment/.AugmentTileService),custom(ls.augment.com/.UnknownService),custom(other.pkg/ls.augment.com.ExtraDimTileService),";
        check(ModuleExternalReset.withoutModuleTiles(unrelated).equals(unrelated), "unknown classes and different packages remain");
        check(ModuleExternalReset.withoutModuleTiles("custom(ls.augment.com/.ExtraDimTileService)").equals(""), "only-owned tile list becomes empty");

        Fixture preserve = new Fixture(); preserve.audio.add(owned(50));
        preserve.selected.add("content://media/external/audio/media/50");
        ModuleExternalReset.Result selected = preserve.engine.restore();
        check(!selected.success && selected.reviewRequired && preserve.removed.isEmpty(), "default sound uses external alias and is retained");
        check(ModuleExternalReset.isSelected(owned(50).uri, Set.of("content://0@media/external/audio/media/50"), 0), "explicit matching user URI retained");
        check(!ModuleExternalReset.isSelected(owned(50).uri, Set.of("content://10@media/external/audio/media/50"), 0), "another user URI does not match");
        check(!ModuleExternalReset.isSelected(owned(50).uri, Set.of("content://media/internal/audio/media/50"), 0), "internal audio with same ID is independent");

        Fixture race = new Fixture(); race.audio.add(owned(51)); race.selectedDuringDeletion = "content://media/external/audio/media/51";
        check(race.engine.restore().reviewRequired && race.removed.isEmpty(), "sound chosen during reset is retained");

        Fixture outside = new Fixture();
        outside.audio.add(audio(1, "Ringtones/红魔Duo/", "another.app", "红魔Duo_IP_MC_CN_test.ogg"));
        outside.audio.add(audio(2, "Ringtones/", "ls.augment.com", "红魔Duo_IP_MC_CN_test.ogg"));
        outside.audio.add(audio(3, "Ringtones/红魔Duo/", "ls.augment.com", "my-personal-recording.ogg"));
        outside.audio.add(audio(4, "Ringtones/红魔Duo/subfolder/", "ls.augment.com", "红魔Duo_IP_MC_CN_test.ogg"));
        check(outside.engine.restore().success && outside.removed.isEmpty(), "ownership, exact path and import name required");

        Fixture denied = new Fixture(); denied.tiles = "wifi,custom(ls.augment.com/.AugmentTileService)"; denied.failWriteTiles = true;
        check(!denied.engine.restore().success && denied.tiles.contains("AugmentTileService"), "tile mutation failure reported");
        denied.failWriteTiles = false; denied.failReadTiles = true;
        check(!denied.engine.restore().success, "tile read failure reported");
        denied.failReadTiles = false; denied.failLegacy = true;
        check(!denied.engine.restore().success, "legacy deletion failure reported");
        denied.failLegacy = false; denied.failMediaRead = true;
        check(!denied.engine.restore().success, "media query failure reported");
        denied.failMediaRead = false; denied.failSelected = true; denied.audio.add(owned(80));
        check(!denied.engine.restore().success && denied.removed.isEmpty(), "selection read failure stops media deletion");
        denied.failSelected = false; denied.failDelete = true;
        check(!denied.engine.restore().success && denied.removed.isEmpty(), "media deletion failure reported");

        String script = ModuleExternalReset.legacyCommand();
        check(!script.contains("rm -rf") && !script.contains("rm -r "), "no recursive deletion");
        check(script.contains("[ ! -L \"$parent\" ]") && script.contains("[ ! -L \"$file\" ]"), "fixed parent and file symlinks rejected");
        check(script.contains("boot-config-v1 /data/system/ls_augment/boot-config-v1.tmp") && script.contains("case \"$entry\" in ls_augment_*=*)"), "exact files and private global namespace only");
        System.out.println("PASS ModuleExternalReset: " + checks + " assertions; no device commands");
    }
}
