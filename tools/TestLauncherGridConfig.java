package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Checks the actual persisted and runtime snapshot contract, not a parallel fake store. */
public final class TestLauncherGridConfig {
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args) {
        Map<String,String> defaults=ConfigSchema.defaults();
        require("0".equals(defaults.get(LauncherGridSpec.ENABLED)),"launcher grid must default disabled");
        require("6".equals(defaults.get(LauncherGridSpec.ROWS))&&"4".equals(defaults.get(LauncherGridSpec.COLUMNS)),"native baseline shape is 4 columns 6 rows");
        for(String key:new String[]{LauncherGridSpec.ENABLED,LauncherGridSpec.ROWS,LauncherGridSpec.COLUMNS})require(ConfigSchema.runtimeKeys().contains(key),"runtime snapshot must include "+key);
        for(String key:new String[]{LauncherGridSpec.ROWS,LauncherGridSpec.COLUMNS}){
            for(int n=3;n<=12;n++)require(Integer.toString(n).equals(ConfigSchema.normalize(key,Integer.toString(n))),"all requested sizes survive schema");
            for(String bad:new String[]{"2","13","-1","3.5","NaN","2147483647"})require(ConfigSchema.normalize(key,bad)==null,"invalid size rejected before saving");
        }
        Map<String,String> values=new LinkedHashMap<>(defaults);values.putAll(new LauncherGridSpec(true,7,5).values());
        ConfigSnapshot original=ConfigSnapshot.create(20391,987654,values);require(original!=null,"grid snapshot created");
        ConfigSnapshot restored=ConfigSnapshot.parse(original.serialize());require(restored!=null,"grid snapshot parsed");
        LauncherGridSpec grid=LauncherGridSpec.parse(restored.get(LauncherGridSpec.ENABLED),restored.get(LauncherGridSpec.ROWS),restored.get(LauncherGridSpec.COLUMNS));
        require(grid!=null&&grid.enabled&&grid.rows==7&&grid.columns==5,"enabled and both dimensions survive atomically");
        values.putAll(grid.withEnabled(false).values());ConfigSnapshot off=ConfigSnapshot.create(20392,987655,values);
        ConfigSnapshot offRestored=ConfigSnapshot.parse(off.serialize());
        require("0".equals(offRestored.get(LauncherGridSpec.ENABLED))&&"7".equals(offRestored.get(LauncherGridSpec.ROWS))&&"5".equals(offRestored.get(LauncherGridSpec.COLUMNS)),"disable roundtrip retains draft shape");
        require("0".equals(ConfigSnapshot.safeDefaults().get(LauncherGridSpec.ENABLED)),"recovery snapshot cannot enable native grid edits");
        require("6".equals(ConfigSnapshot.safeDefaults().get(LauncherGridSpec.ROWS))&&"4".equals(ConfigSnapshot.safeDefaults().get(LauncherGridSpec.COLUMNS)),"safe snapshot numeric defaults retained");
        System.out.println("PASS LauncherGridConfig: schema, range boundaries, runtime snapshot, atomic rectangular values, disable and safe defaults");
    }
}
