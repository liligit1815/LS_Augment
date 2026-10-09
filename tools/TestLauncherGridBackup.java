package ls.augment.com;

import java.lang.reflect.InvocationTargetException;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.tools.ToolProvider;

/** Executes the actual export-selection and import-validation blocks with an in-memory JSON boundary.
 * Actual ConfigSchema is used; Android document-picker/media transport is outside this test.
 */
public final class TestLauncherGridBackup {
    @SuppressWarnings("unchecked") public static void main(String[] args) throws Exception {
        Path root=Path.of(args.length==0?".":args[0]).toAbsolutePath().normalize();
        String source=Files.readString(root.resolve("android/app/src/main/java/ls/augment/com/ConfigTransferActivity.java"),StandardCharsets.UTF_8);
        String excluded=between(source,"    private static final Set<String> EXCLUDED=",";",false);
        String export=between(source,"    private JSONObject exportDocument()throws Exception{","        JSONObject notices=",false);
        String imports=between(source,"    private void prepareImport(JSONObject document)throws Exception{","        // Health bindings",false);
        String fixture="package ls.augment.com;\nimport java.util.*;import java.io.*;\npublic final class LauncherGridBackupFixture {\n"
                +"private static final Set<String> EXCLUDED="+excluded+";\n"
                +"private final Config config;private LauncherGridBackupFixture(Map<String,String> values){config=new Config(values);}\n"
                +"public static Map<String,String> exportSettings(Map<String,String> input)throws Exception{return new LauncherGridBackupFixture(input).exported();}\n"
                +"private Map<String,String> exported()throws Exception{"+export+"return values.strings();}\n"
                +"public static Map<String,String> importSettings(Map<String,String> input)throws Exception{JSONObject document=new JSONObject().put(\"format\",\"LS_Augment.settings\").put(\"version\",1).put(\"settings\",new JSONObject(input));"+imports+"return updates;}\n"
                +"static final class Config{private final Map<String,String> values;Config(Map<String,String> v){values=v;}Map<String,String> snapshot(){return new LinkedHashMap<>(values);}}\n"
                +"static final class JSONObject {final Map<String,Object> data=new LinkedHashMap<>();JSONObject(){}JSONObject(Map<String,String> values){data.putAll(values);}JSONObject put(String key,Object value){data.put(key,value);return this;}String optString(String key){return data.get(key) instanceof String?(String)data.get(key):\"\";}int optInt(String key){return data.get(key) instanceof Integer?(int)data.get(key):0;}JSONObject getJSONObject(String key){return (JSONObject)data.get(key);}JSONObject optJSONObject(String key){return data.get(key) instanceof JSONObject?(JSONObject)data.get(key):null;}Iterator<String> keys(){return data.keySet().iterator();}Object get(String key){return data.get(key);}String getString(String key){return (String)data.get(key);}Map<String,String> strings(){Map<String,String> result=new LinkedHashMap<>();for(var e:data.entrySet())result.put(e.getKey(),(String)e.getValue());return result;}}\n} ";
        Path temp=Files.createTempDirectory("launcher-grid-backup-");temp.toFile().deleteOnExit();
        Path sourceFile=temp.resolve("LauncherGridBackupFixture.java");Files.writeString(sourceFile,fixture,StandardCharsets.UTF_8);sourceFile.toFile().deleteOnExit();
        int compiled=ToolProvider.getSystemJavaCompiler().run(null,null,null,"-encoding","UTF-8","--release","17","-cp",System.getProperty("java.class.path"),"-d",temp.toString(),sourceFile.toString());
        require(compiled==0,"production backup validation fixture compiles");
        try(URLClassLoader loader=new URLClassLoader(new java.net.URL[]{temp.toUri().toURL()},TestLauncherGridBackup.class.getClassLoader())){
            Class<?> transfer=loader.loadClass("ls.augment.com.LauncherGridBackupFixture");
            var exportMethod=transfer.getMethod("exportSettings",Map.class);var importMethod=transfer.getMethod("importSettings",Map.class);
            for(boolean enabled:new boolean[]{false,true})for(LauncherGridSpec.Preset preset:LauncherGridSpec.PRESETS){
                LauncherGridSpec original=preset.apply(LauncherGridSpec.defaults().withEnabled(enabled));Map<String,String> input=new LinkedHashMap<>(original.values());input.put(ConfigSchema.HEALTH_ACCOUNT,"private-account");
                Map<String,String> saved=(Map<String,String>)exportMethod.invoke(null,input);
                require(!saved.containsKey(ConfigSchema.HEALTH_ACCOUNT),"production export exclusion remains active");
                require(saved.equals(original.values()),"production export retains all three launcher keys");
                Map<String,String> loaded=(Map<String,String>)importMethod.invoke(null,saved);LauncherGridSpec restored=LauncherGridSpec.from(loaded);
                require(restored!=null&&restored.values().equals(original.values()),"production import preserves enable/row/column atomically");
                Map<String,String> invalid=new LinkedHashMap<>(saved);invalid.put(LauncherGridSpec.ROWS,"13");
                try{importMethod.invoke(null,invalid);throw new AssertionError("invalid backup accepted");}catch(InvocationTargetException error){require(error.getCause() instanceof java.io.IOException,"bad dimensions rejected by actual import validation");}
                require(input.get(ConfigSchema.HEALTH_ACCOUNT).equals("private-account"),"backup preparation never mutates live source");
            }
        }
        // Register only this test's known output tree, after verifying each resolved path.
        try(var paths=Files.walk(temp)){paths.sorted(java.util.Comparator.comparingInt(Path::getNameCount)).forEach(path->{if(!path.toAbsolutePath().normalize().startsWith(temp.toAbsolutePath().normalize()))throw new AssertionError("unexpected temporary output");path.toFile().deleteOnExit();});}
        System.out.println("PASS LauncherGridBackup: actual export selection/import validation retains all presets and disabled values; invalid dimensions rejected before writes");
    }
    private static String between(String source,String start,String end,boolean unused){int from=source.indexOf(start);require(from>=0,"production marker missing: "+start);from+=start.length();int to=source.indexOf(end,from);require(to>=from,"production marker missing: "+end);return source.substring(from,to);}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
