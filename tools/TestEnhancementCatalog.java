package ls.augment.com;
import java.util.*;
public final class TestEnhancementCatalog {
    private static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    public static void main(String[] args) {
        Set<String> keys=new HashSet<>();
        for(EnhancementOption option:EnhancementCatalog.options()) {
            check(keys.add(option.key),"duplicate option "+option.key);
            check(option.defaultValue.equals(option.normalize(option.defaultValue)),"invalid default "+option.key);
            check(ConfigSchema.contains(option.key),"missing schema "+option.key);
            if(option.kind==EnhancementOption.Kind.BOOLEAN)check("0".equals(option.defaultValue),"new toggle must default off "+option.key);
        }
        Map<String,String> previous=new LinkedHashMap<>();previous.put(ConfigSchema.AI_TRIGGER_ENABLED,"1");previous.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,"2");
        ConfigSnapshot upgraded=ConfigSnapshot.create(3,12345,previous);
        check(upgraded!=null&&"1".equals(upgraded.get(ConfigSchema.AI_TRIGGER_ENABLED))&&"2".equals(upgraded.get(ConfigSchema.STATUSBAR_CLOCK_ROWS)),"upgrade preserves existing settings");
        check("0".equals(upgraded.get(GameOptions.QUICK_SWITCH))&&"0".equals(upgraded.get(LauncherOptions.KEEP_EMPTY)),"upgrade appends disabled features");
        String retiredThermal=SystemOptions.key("thermal_notifications");
        check(EnhancementCatalog.options().stream().noneMatch(option->retiredThermal.equals(option.key)),"retired thermal setting is removed");
        check(!ConfigSchema.isRuntimeKey(retiredThermal)&&!ConfigSchema.isRuntimeKey(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION),"retired features are not published to hooks");
        for(String oldValue:new String[]{"0","1"}){
            Map<String,String> legacy=new LinkedHashMap<>(previous);legacy.put(retiredThermal,oldValue);
            ConfigSnapshot legacySnapshot=ConfigSnapshot.create(5,12347,legacy);
            check(legacySnapshot!=null,"retired thermal key must not invalidate an existing configuration");
            ConfigSnapshot restored=ConfigSnapshot.parse(legacySnapshot.serialize());
            check(restored!=null&&restored.get(retiredThermal)==null,"retired thermal value is excluded from runtime snapshots");
            check("0".equals(ConfigSchema.normalize(retiredThermal,oldValue)),"old thermal setting remains off");
            check("0".equals(ConfigSchema.normalize(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION,oldValue)),"old battery setting remains off");
            check("1".equals(restored.get(ConfigSchema.AI_TRIGGER_ENABLED))&&"2".equals(restored.get(ConfigSchema.STATUSBAR_CLOCK_ROWS)),"retiring thermal hook preserves unrelated options");
        }
        String[] percentageKeys={SystemUiOptions.QS_BRIGHTNESS_PERCENT,SystemUiOptions.QS_VOLUME_PERCENT};
        for(String key:percentageKeys) {
            check("0".equals(upgraded.get(key)),"upgrade leaves control center percentage off "+key);
            check(EnhancementCatalog.group("quicksettings").stream().anyMatch(option->option.key.equals(key)),"percentage belongs to control center "+key);
        }
        for(int mask=0;mask<4;mask++) {
            Map<String,String> percentages=new LinkedHashMap<>(previous);
            for(int i=0;i<percentageKeys.length;i++)percentages.put(percentageKeys[i],(mask&(1<<i))==0?"0":"1");
            ConfigSnapshot configured=ConfigSnapshot.create(4+mask,12346+mask,percentages);
            check(configured!=null,"percentage switches accept independent combinations "+mask);
            ConfigSnapshot restored=ConfigSnapshot.parse(configured.serialize());
            check(restored!=null,"percentage snapshot round trip "+mask);
            for(String key:percentageKeys)check(percentages.get(key).equals(restored.get(key)),"percentage switch state survives snapshot "+key+" mask="+mask);
            check("1".equals(restored.get(ConfigSchema.AI_TRIGGER_ENABLED))&&"2".equals(restored.get(ConfigSchema.STATUSBAR_CLOCK_ROWS)),"percentage changes preserve existing settings");
        }
        check("02:12:34:AB:CD:EF".equals(SystemOptions.normalizeMac("02:12:34:ab:cd:ef")),"MAC normalization");
        check(SystemOptions.normalizeMac("01:12:34:56:78:90")==null,"multicast MAC rejected");
        check(SystemOptions.normalizeMac("00:00:00:00:00:00")==null,"zero MAC rejected");
        check(SystemOptions.normalizeMac("$(id)")==null,"nonaddress rejected");
        String value="红魔 α";byte[] bytes=value.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        check(OtaBufferPolicy.read(value,null)==bytes.length,"MO size query uses bytes");
        byte[] target=new byte[bytes.length+2];Arrays.fill(target,(byte)77);
        check(OtaBufferPolicy.read(value,target)==0,"MO read returns success code");
        check(Arrays.equals(bytes,Arrays.copyOf(target,bytes.length))&&target[target.length-1]==0,"MO payload and tail");
        byte[] small={4};check(OtaBufferPolicy.read(value,small)==-1&&small[0]==4,"short buffer remains unchanged");
        check(OtaBufferPolicy.validUrl("https://updates.example.com/payload.bin?token=a"),"HTTPS payload");
        check(!OtaBufferPolicy.validUrl("file:///private")&&!OtaBufferPolicy.validUrl("https://a/\nb"),"invalid payload URL");
        System.out.println("PASS TestEnhancementCatalog ("+keys.size()+" options)");
    }
}
