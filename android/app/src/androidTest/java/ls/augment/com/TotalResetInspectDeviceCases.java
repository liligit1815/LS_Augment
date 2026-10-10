package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.SystemClock;
import io.github.libxposed.service.XposedService;
import java.io.File;
import java.io.FileDescriptor;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Acceptance inspection only: never initializes, saves, seeds or resets personal configuration. */
final class TotalResetInspectDeviceCases {
    private static final Set<String> METADATA=Set.of("private_initialized_v2","snapshot_revision_v1",
            "snapshot_updated_at_v1","approved_ui_migration_v1","freeform_independent_migration_v1",
            "recents_memory_unified_layout_v1","recents_memory_unified_size_v1");
    private static final Set<String> LIVE_PREFS=Set.of(AppConfig.DIAGNOSTICS,"hook-processes",
            "diagnostic-retention","module-injection-receipt");
    private static final Set<String> FUSE_KEYS=Set.of("migrated","session","armedSession","attempts","pending","fused");
    private static final Set<String> RUNTIME_KEYS=Set.of(RemoteConfig.HIDDEN,RemoteConfig.TILE,RemoteConfig.RUNTIME_REVISION);
    private static final Set<String> REMOTE_KEYS=Set.of(RemoteConfig.SNAPSHOT,RemoteConfig.HIDDEN,RemoteConfig.TILE,RemoteConfig.RUNTIME_REVISION);
    private TotalResetInspectDeviceCases() { }

    static JSONObject run(Context context,Bundle args)throws Exception {
        String stage=args.getString("stage","before");
        if(!"before".equals(stage)&&!"after".equals(stage))throw new IllegalArgumentException("stage must be before or after");
        boolean after="after".equals(stage);
        long resetStartedAt=Long.parseLong(args.getString("resetStartedAt","0"));
        File configFile=new File(new File(context.getDataDir(),"shared_prefs"),AppConfig.PREFS+".xml");
        String diskBefore=digestFile(configFile);
        SharedPreferences prefs=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> rawBefore=new LinkedHashMap<>(prefs.getAll());
        JSONArray failures=new JSONArray(),defaultMismatches=new JSONArray(),unknown=new JSONArray();
        JSONArray health=new JSONArray(),lists=new JSONArray(),nonDefaults=new JSONArray();
        int defaultsMatch=0,missing=0;
        for(Map.Entry<String,String> entry:ConfigSchema.defaults().entrySet()) {
            String key=entry.getKey();Object actual=rawBefore.get(key);
            boolean match=entry.getValue().equals(actual);
            if(match)defaultsMatch++;else {
                if(actual==null)missing++;
                nonDefaults.put(key);
                if(after)defaultMismatches.put(new JSONObject().put("key",key).put("expected",summary(entry.getValue()))
                        .put("actual",summary(actual)).put("missing",!rawBefore.containsKey(key)));
            }
            if(key.contains("health"))health.put(new JSONObject().put("key",key).put("matchesDefault",match)
                    .put("empty",actual instanceof String&&((String)actual).isEmpty()));
            if(isList(key))lists.put(new JSONObject().put("key",key).put("matchesDefault",match)
                    .put("empty",actual instanceof String&&((String)actual).isEmpty()));
        }
        for(String key:rawBefore.keySet())if(!ConfigSchema.contains(key)&&!METADATA.contains(key))unknown.put(key);
        if(after&&defaultMismatches.length()!=0)failures.put("configuration-default-mismatch");
        if(after&&unknown.length()!=0)failures.put("configuration-retired-or-unknown-keys");
        JSONArray metadataMismatches=new JSONArray();
        if(after)for(String key:METADATA) {
            Object value=rawBefore.get(key);
            boolean valid=key.startsWith("snapshot_")?value instanceof Long&&(Long)value>0:Boolean.TRUE.equals(value);
            if(!valid)metadataMismatches.put(key);
        }
        if(metadataMismatches.length()!=0)failures.put("configuration-initialization-or-migration-marker-invalid");
        JSONObject config=new JSONObject().put("schemaKeyCount",ConfigSchema.keys().size())
                .put("storedKeyCount",rawBefore.size()).put("matchingDefaults",defaultsMatch)
                .put("missingKeys",missing).put("nonDefaultKeys",nonDefaults).put("defaultMismatches",defaultMismatches)
                .put("unknownKeys",unknown).put("metadataMismatchKeys",metadataMismatches)
                .put("health",health).put("applicationLists",lists);
        int alias=context.getPackageManager().getComponentEnabledSetting(
                new ComponentName(context,context.getPackageName()+".LauncherAlias"));
        if(after&&alias!=PackageManager.COMPONENT_ENABLED_STATE_DEFAULT)failures.put("launcher-alias-not-default");
        JSONObject runtime=inspectRuntime(context,after,failures);
        JSONObject fuse=inspectFuse(context,after,failures);
        JSONArray otherPreferences=inspectOtherPreferences(context,after,resetStartedAt,failures);
        JSONObject resources=inspectResources(context,after,resetStartedAt,failures);
        int grants=context.getContentResolver().getPersistedUriPermissions().size();
        if(after&&grants!=0)failures.put("persisted-import-uri-grants-remain");
        JSONObject remote=inspectRemote(context,rawBefore,after,failures);
        Map<String,?> rawAfter=new LinkedHashMap<>(prefs.getAll());
        String diskAfter=digestFile(configFile);
        boolean mapStable=rawBefore.equals(rawAfter),diskStable=diskBefore.equals(diskAfter);
        if(!mapStable||!diskStable)failures.put("read-only-inspection-config-changed");
        return new JSONObject().put("success",failures.length()==0).put("stage",stage)
                .put("readOnly",true).put("actualResetExecuted",false).put("resetStartedAt",resetStartedAt)
                .put("configuration",config).put("launcherAliasState",alias).put("runtime",runtime).put("crashFuse",fuse)
                .put("otherPreferences",otherPreferences).put("privateResources",resources)
                .put("persistedImportUriGrants",grants).put("frameworkRemote",remote)
                .put("configurationMapUnchanged",mapStable).put("configurationDiskUnchanged",diskStable)
                .put("configurationDiskSha256Before",diskBefore).put("configurationDiskSha256After",diskAfter)
                .put("failures",failures);
    }

    private static boolean isList(String key) {
        return key.contains("targets")||key.contains("excluded_apps")||key.contains("external_apps")
                ||key.contains("game_apps")||key.contains("whitelist")||key.contains("blacklist")
                ||key.contains("candidates")||key.contains("packages")||key.endsWith("_apps");
    }
    /** All values are redacted, including credentials, health plans and app identities. */
    private static JSONObject summary(Object value)throws Exception {
        JSONObject result=new JSONObject().put("present",value!=null);
        if(value!=null) {String text=String.valueOf(value);result.put("type",value.getClass().getSimpleName())
                .put("length",text.length()).put("empty",text.isEmpty())
                .put("sha256",digest(text.getBytes(StandardCharsets.UTF_8)));}
        return result;
    }
    private static JSONObject inspectRuntime(Context context,boolean after,JSONArray failures)throws Exception {
        Map<String,?> raw=context.getSharedPreferences("ls_augment_runtime_v2",0).getAll();
        Set<String> unknown=new LinkedHashSet<>(raw.keySet());unknown.removeAll(RUNTIME_KEYS);
        boolean hiddenEmpty="".equals(raw.getOrDefault(RemoteConfig.HIDDEN,null))||!raw.containsKey(RemoteConfig.HIDDEN);
        boolean tileEmpty="EMPTY".equals(raw.get(RemoteConfig.TILE))||!raw.containsKey(RemoteConfig.TILE);
        Object revision=raw.get(RemoteConfig.RUNTIME_REVISION);
        boolean revisionValid=revision==null||(revision instanceof Long&&(Long)revision>=0);
        if(after&&(!hiddenEmpty||!tileEmpty||!revisionValid||!unknown.isEmpty()))failures.put("runtime-state-not-cleared");
        return new JSONObject().put("storedKeyCount",raw.size()).put("hiddenEmpty",hiddenEmpty).put("tileEmpty",tileEmpty)
                .put("revisionValid",revisionValid).put("unknownKeys",new JSONArray(unknown));
    }
    private static JSONObject inspectFuse(Context context,boolean after,JSONArray failures)throws Exception {
        Map<String,?> raw=context.getSharedPreferences("ls_augment_crash_fuse_v2",0).getAll();
        Set<String> unknown=new LinkedHashSet<>(raw.keySet());unknown.removeAll(FUSE_KEYS);
        boolean migrated=Boolean.TRUE.equals(raw.get("migrated"));
        boolean safe=!Boolean.TRUE.equals(raw.get("fused"))&&!Boolean.TRUE.equals(raw.get("pending"))
                &&(!raw.containsKey("attempts")||Integer.valueOf(0).equals(raw.get("attempts")))
                &&(!raw.containsKey("armedSession")||"".equals(raw.get("armedSession")));
        if(after&&(!migrated||!safe||!unknown.isEmpty()))failures.put("crash-fuse-old-state-remains");
        return new JSONObject().put("storedKeyCount",raw.size()).put("migrationComplete",migrated)
                .put("notArmedNotFusedZeroAttempts",safe).put("unknownKeys",new JSONArray(unknown));
    }
    private static JSONArray inspectOtherPreferences(Context context,boolean after,long resetStartedAt,JSONArray failures)throws Exception {
        JSONArray result=new JSONArray();File dir=new File(context.getDataDir(),"shared_prefs");
        File[] files=dir.listFiles();if(files==null)return result;
        Set<String> seen=new LinkedHashSet<>();
        for(File file:files) {
            String name=file.getName();if(!name.endsWith(".xml")&&!name.endsWith(".xml.bak"))continue;
            name=name.substring(0,name.length()-(name.endsWith(".bak")?8:4));
            if(!seen.add(name)||AppConfig.PREFS.equals(name)||"ls_augment_runtime_v2".equals(name)
                    ||"ls_augment_crash_fuse_v2".equals(name))continue;
            Map<String,?> raw=context.getSharedPreferences(name,0).getAll();
            boolean live=LIVE_PREFS.contains(name);
            boolean fresh=resetStartedAt>0&&file.lastModified()>=resetStartedAt;
            JSONObject record=new JSONObject().put("name",name).put("keyCount",raw.size())
                    .put("currentRuntimeStore",live).put("fileModifiedAt",file.lastModified()).put("writtenSinceReset",fresh);
            if(!live)record.put("remainingKeyNames",new JSONArray(raw.keySet()));
            result.put(record);
            if(after&&!raw.isEmpty()&&(!live||!fresh))failures.put("preferences-remain:"+name);
        }
        return result;
    }
    private static JSONObject inspectResources(Context context,boolean after,long resetStartedAt,JSONArray failures)throws Exception {
        JSONArray files=new JSONArray();int[] count={0};
        List<File> roots=new ArrayList<>();roots.add(context.getFilesDir());roots.add(context.getCacheDir());
        roots.add(context.getCodeCacheDir());roots.addAll(Arrays.asList(context.getExternalFilesDirs(null)));
        roots.addAll(Arrays.asList(context.getExternalCacheDirs()));
        int rootIndex=0;
        for(File root:roots)if(root!=null)scan(context,root,root,"root-"+(rootIndex++),files,count,after,resetStartedAt,failures);
        return new JSONObject().put("checkedRoots",rootIndex).put("remainingFileCount",count[0]).put("files",files);
    }
    private static void scan(Context context,File root,File entry,String label,JSONArray files,int[] count,boolean after,long resetStartedAt,JSONArray failures)throws Exception {
        if(!entry.exists())return;
        String relative=root.toPath().relativize(entry.toPath()).toString().replace('\\','/');
        if(relative.equals("device-regression-results")||relative.startsWith("device-regression-results/"))return;
        if(Files.isSymbolicLink(entry.toPath())) {failures.put("module-storage-symlink:"+label+"/"+relative);return;}
        if(entry.isDirectory()) {
            File[] children=entry.listFiles();if(children==null)throw new java.io.IOException("Resource directory unreadable");
            for(File child:children)scan(context,root,child,label,files,count,after,resetStartedAt,failures);return;
        }
        count[0]++;boolean log=relative.equals("ls_augment.log")||relative.matches("detail-(AI|SHOULDER|LIFTARC)\\.log");
        boolean fresh=resetStartedAt>0&&entry.lastModified()>=resetStartedAt;
        boolean art=verifiedFreshArt(context,root,entry,relative,resetStartedAt);
        files.put(new JSONObject().put("root",label).put("relativePath",relative).put("bytes",entry.length())
                .put("modifiedAt",entry.lastModified()).put("currentDiagnosticLog",log).put("writtenSinceReset",fresh)
                .put("verifiedFreshAndroidArtCache",art));
        if(after&&!(log&&fresh)&&!art)failures.put("module-resource-remains:"+label+"/"+relative);
    }
    private static boolean verifiedFreshArt(Context context,File root,File file,String relative,long resetStartedAt) {
        // Scope is the actual private cache root, never files/code_cache/external roots with a matching path.
        if(!root.equals(context.getCacheDir())||!"oat_primary/arm64/base.art".equals(relative))return false;
        FileDescriptor descriptor=null;
        try {
            descriptor=android.system.Os.open(file.getPath(),android.system.OsConstants.O_RDONLY
                    |android.system.OsConstants.O_NOFOLLOW|android.system.OsConstants.O_CLOEXEC,0);
            android.system.StructStat stat=android.system.Os.fstat(descriptor);
            byte[] header=new byte[8];int offset=0;
            while(offset<header.length){int got=android.system.Os.read(descriptor,header,offset,header.length-offset);if(got<=0)return false;offset+=got;}
            return TotalResetArtCacheRule.accepts(root.getAbsolutePath(),context.getCacheDir().getAbsolutePath(),relative,
                    Arrays.asList(android.os.Build.SUPPORTED_ABIS).contains("arm64-v8a"),resetStartedAt,stat.st_mtime*1000L,
                    System.currentTimeMillis(),stat.st_uid,context.getApplicationInfo().uid,stat.st_nlink,
                    android.system.OsConstants.S_ISREG(stat.st_mode),stat.st_mode,stat.st_size,header);
        }catch(Exception unreadable){return false;}
        finally{if(descriptor!=null)try{android.system.Os.close(descriptor);}catch(android.system.ErrnoException ignored){ }}
    }
    private static JSONObject inspectRemote(Context context,Map<String,?> localConfig,boolean after,JSONArray failures)throws Exception {
        long until=SystemClock.elapsedRealtime()+8000;XposedService service;
        while((service=ModuleScopeService.service())==null&&SystemClock.elapsedRealtime()<until)SystemClock.sleep(100);
        if(service==null) {if(after)failures.put("framework-remote-unavailable");return new JSONObject().put("available",false);}
        try {
            Map<String,?> raw=new LinkedHashMap<>(service.getRemotePreferences(RemoteConfig.GROUP).getAll());
            Set<String> unknown=new LinkedHashSet<>(raw.keySet());unknown.removeAll(REMOTE_KEYS);
            Object encoded=raw.get(RemoteConfig.SNAPSHOT);
            ConfigSnapshot snapshot=encoded instanceof String?ConfigSnapshot.parse((String)encoded):null;
            JSONArray mismatches=new JSONArray();
            if(snapshot!=null)for(Map.Entry<String,String> entry:ConfigSchema.runtimeDefaults().entrySet())
                if(!entry.getValue().equals(snapshot.get(entry.getKey())))mismatches.put(entry.getKey());
            boolean hidden="".equals(raw.get(RemoteConfig.HIDDEN));boolean tile="EMPTY".equals(raw.get(RemoteConfig.TILE));
            Object localRevision=context.getSharedPreferences("ls_augment_runtime_v2",0).getAll().get(RemoteConfig.RUNTIME_REVISION);
            if(localRevision==null)localRevision=0L;
            boolean runtimeRevisionMatches=localRevision.equals(raw.get(RemoteConfig.RUNTIME_REVISION));
            boolean metadataMatches=snapshot!=null&&Long.valueOf(snapshot.revision).equals(localConfig.get("snapshot_revision_v1"))
                    &&Long.valueOf(snapshot.updatedAt).equals(localConfig.get("snapshot_updated_at_v1"));
            boolean defaults=snapshot!=null&&mismatches.length()==0&&unknown.isEmpty()&&hidden&&tile
                    &&raw.keySet().equals(REMOTE_KEYS)&&runtimeRevisionMatches&&metadataMatches;
            if(after&&!defaults)failures.put("framework-remote-not-default-or-old-keys");
            return new JSONObject().put("available",true).put("storedKeyCount",raw.size()).put("snapshotValid",snapshot!=null)
                    .put("runtimeSchemaKeyCount",ConfigSchema.runtimeKeys().size()).put("matchesDefaults",defaults)
                    .put("mismatchKeys",mismatches).put("unknownKeys",new JSONArray(unknown)).put("hiddenEmpty",hidden).put("tileEmpty",tile)
                    .put("runtimeRevisionMatchesPrivate",runtimeRevisionMatches).put("snapshotMetadataMatchesPrivate",metadataMatches);
        } catch(RuntimeException error) {
            if(after)failures.put("framework-remote-read-failed");
            return new JSONObject().put("available",false).put("errorClass",error.getClass().getSimpleName());
        }
    }
    private static String digestFile(File file)throws Exception {return file.exists()?digest(Files.readAllBytes(file.toPath())):"absent";}
    private static String digest(byte[] data)throws Exception {
        byte[] digest=MessageDigest.getInstance("SHA-256").digest(data);StringBuilder output=new StringBuilder();
        for(byte value:digest)output.append(String.format(java.util.Locale.ROOT,"%02x",value&255));return output.toString();
    }
}
