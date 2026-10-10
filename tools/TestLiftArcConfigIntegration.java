package ls.augment.com;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONObject;

/**
 * Offline read-only coverage using the unchanged transfer Activity and real
 * option/schema/snapshot classes. Reuses TestTransferActionHost platform doubles,
 * but its fake ConfigSchema must be replaced by the production ConfigSchema.
 * Persistence/Root/reset boundaries throw: no successful device reset is claimed.
 */
public final class TestLiftArcConfigIntegration {
    private static int checks;
    private static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    private static JSONObject invokeExport(ConfigTransferActivity activity)throws Exception{
        Method method=ConfigTransferActivity.class.getDeclaredMethod("exportDocument");
        method.setAccessible(true);return (JSONObject)method.invoke(activity);
    }
    @SuppressWarnings("unchecked") private static Map<String,String> parsedUpdates(String expectedKey)throws Exception{
        Object positive=TestTransferActionHost.dialog("导入配置").positive;
        for(Field field:positive.getClass().getDeclaredFields()){
            field.setAccessible(true);Object value=field.get(positive);
            if(value instanceof LinkedHashMap && ((Map<?,?>)value).containsKey(expectedKey))
                return new LinkedHashMap<>((Map<String,String>)value);
        }
        throw new AssertionError("production import callback did not retain validated settings");
    }
    private static String changed(EnhancementOption option){
        switch(option.kind){
            case BOOLEAN:return "1".equals(option.defaultValue)?"0":"1";
            case INTEGER:return "450";
            case DECIMAL:return String.valueOf(option.minimum);
            case CHOICE:return String.valueOf(option.choices.length-1);
            case COLOR:return "#5A12ABEF";
            case TEXT:return "用户提示文字 ♥";
            default:throw new AssertionError("unexpected LiftArc kind");
        }
    }
    public static void main(String[] args)throws Exception{
        TestTransferActionHost.reset();
        Set<String> keys=new LinkedHashSet<>();
        Map<String,String> values=new LinkedHashMap<>(ConfigSchema.defaults());
        for(EnhancementOption option:LiftArcOptions.options()){
            check(keys.add(option.key),"duplicate LiftArc key");
            check(EnhancementCatalog.options().stream().filter(o->option.key.equals(o.key)).count()==1,"catalog key missing/duplicated");
            check(ConfigSchema.contains(option.key)&&ConfigSchema.isRuntimeKey(option.key),"registered portable/runtime key missing");
            check(option.defaultValue.equals(ConfigSchema.defaults().get(option.key)),"reset default drift");
            check(option.kind!=EnhancementOption.Kind.BOOLEAN||ConfigSchema.booleanKeys().contains(option.key),"global reset pause misses boolean");
            String input=changed(option),normalized=ConfigSchema.normalize(option.key,input);
            check(normalized!=null,"valid fixture rejected: "+option.key);
            values.put(option.key,normalized);
        }
        check(keys.size()==39,"39 unique configuration keys required");
        check(!ConfigSchema.contains(LiftArcOptions.STATUS),"diagnostics accidentally included in backups");
        AppConfig.values.putAll(values);
        Map<String,String> before=new LinkedHashMap<>(AppConfig.values);
        ConfigTransferActivity activity=TestTransferActionHost.host("import",null);
        TestTransferActionHost.flush(activity);
        JSONObject exported=invokeExport(activity),settings=exported.getJSONObject("settings");
        check("LS_Augment.settings".equals(exported.optString("format"))&&exported.optInt("version")==1,"existing backup format changed");
        for(String key:keys)check(values.get(key).equals(settings.getString(key)),"real export omits/changes "+key);
        TestTransferActionHost.prepare(activity,new JSONObject(exported.toString()));
        Map<String,String> imported=parsedUpdates(LiftArcOptions.ENABLED);
        for(String key:keys)check(values.get(key).equals(imported.get(key)),"real import parser loses "+key);
        TestTransferActionHost.dialog("导入配置").negative();TestTransferActionHost.flush(activity);activity.onDestroy();

        ConfigSnapshot snapshot=ConfigSnapshot.create(27,123456,values);
        ConfigSnapshot parsed=snapshot==null?null:ConfigSnapshot.parse(snapshot.serialize());
        check(parsed!=null,"real signed snapshot round trip failed");
        for(String key:keys)check(values.get(key).equals(parsed.get(key)),"runtime parsing loses "+key);
        ConfigSnapshot defaults=ConfigSnapshot.safeDefaults();
        for(EnhancementOption option:LiftArcOptions.options())check(option.defaultValue.equals(defaults.get(option.key)),"global reset registry misses "+option.key);
        check("0".equals(defaults.get(LiftArcOptions.ENABLED)),"reset must disable outer feature");

        ConfigTransferActivity partial=TestTransferActionHost.host("import",null);TestTransferActionHost.flush(partial);
        TestTransferActionHost.prepare(partial,TestTransferActionHost.doc(new JSONObject().put(LiftArcOptions.ENABLED,"0").put(LiftArcOptions.key("hint_text"),"部分备份")));
        Map<String,String> partialUpdates=parsedUpdates(LiftArcOptions.ENABLED);
        check("部分备份".equals(partialUpdates.get(LiftArcOptions.key("hint_text")))&&!partialUpdates.containsKey(LiftArcOptions.key("arc_color")),"partial backup must not replace absent settings");
        TestTransferActionHost.dialog("导入配置").negative();TestTransferActionHost.flush(partial);partial.onDestroy();
        ConfigTransferActivity legacy=TestTransferActionHost.host("import",null);TestTransferActionHost.flush(legacy);
        TestTransferActionHost.prepare(legacy,TestTransferActionHost.doc(new JSONObject().put(ConfigSchema.AI_TRIGGER_ENABLED,"1")));
        check(parsedUpdates(ConfigSchema.AI_TRIGGER_ENABLED).keySet().stream().noneMatch(k->k.startsWith(LiftArcOptions.PREFIX)),"old backup must not overwrite LiftArc settings");
        TestTransferActionHost.dialog("导入配置").negative();TestTransferActionHost.flush(legacy);legacy.onDestroy();

        ConfigTransferActivity invalid=TestTransferActionHost.host("import",null);TestTransferActionHost.flush(invalid);
        JSONObject base=new JSONObject().put(LiftArcOptions.ENABLED,"1");
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put("ls_augment_liftarc_unknown","1")));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("glass_refract"),"NaN")));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("hint_font"),"5")));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("hint_weight"),"99")));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("arc_color"),"#XYZXYZ")));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("hint_text"),"x".repeat(65537))));checks++;
        TestTransferActionHost.rejects(invalid,TestTransferActionHost.doc(new JSONObject(base.toString()).put(LiftArcOptions.key("hint_size"),12)));checks++;
        invalid.onDestroy();
        TestTransferActionHost.noWrites();
        check(before.equals(AppConfig.values),"configuration fixture changed before confirmation");
        System.out.println("PASS TestLiftArcConfigIntegration: "+checks+" checks; 39 real-export/import/snapshot/reset-registry keys; configurationUnchanged=true; saveCalls=0; resetCalls=0; adbUsed=false; featureEfficacyChecked=false");
    }
}
