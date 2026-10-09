package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONObject;

/** Explicit integration fixture: only after the user's real configuration has reset successfully. */
final class TotalResetFixtureDeviceCases {
    static final String A="ls.augment.reset.fixture20413a", B="ls.augment.reset.fixture20413b";
    private TotalResetFixtureDeviceCases() { }
    static JSONObject seed(Context context)throws Exception {
        AppConfig config=new AppConfig(context);
        if(!config.snapshot().equals(ConfigSchema.defaults()))
            throw new AssertionError("Controlled fixture requires an already verified default configuration");
        RootHideManager manager=new RootHideManager(context);
        if(!manager.targets().isEmpty())throw new AssertionError("Personal target selection must already be empty");
        int user=android.os.Process.myUid()/100000;
        HideUserIdentity.Snapshot identity=HideUserIdentity.read(context,user);
        if(!identity.success)throw new AssertionError("Fixture user identity unavailable");
        Set<RootHideManager.Target> targets=new LinkedHashSet<>();
        for(String packageName:new String[]{A,B}) {
            ApplicationInfo app=context.getPackageManager().getApplicationInfo(packageName,0);
            if(app.uid/100000!=user||!context.getPackageManager().getApplicationLabel(app).toString().startsWith("红魔Duo重置验收 "))
                throw new AssertionError("Disposable app identity mismatch");
            RootHideManager.Target target=new RootHideManager.Target(user,identity.userSerial,packageName);
            if(manager.queryState(target)!=RootHideManager.State.VISIBLE)
                throw new AssertionError("Disposable app must initially be visible");
            targets.add(target);
        }
        RootHideManager.OperationResult selected=manager.saveTargets(targets);
        if(!selected.success)throw new AssertionError(selected.message);
        HideTargetController commands=HideTargetController.forBatch(context,manager);
        for(RootHideManager.Target target:targets) {
            RootHideManager.OperationResult hidden=commands.hide(target);
            if(!hidden.success||manager.queryState(target)!=RootHideManager.State.HIDDEN)
                throw new AssertionError("Disposable hide failed: "+hidden.message);
        }
        RootHideManager.Target removed=new RootHideManager.Target(user,identity.userSerial,B);
        Set<RootHideManager.Target> remaining=new LinkedHashSet<>();
        remaining.add(new RootHideManager.Target(user,identity.userSerial,A));
        RootHideManager.OperationResult deselected=manager.saveTargets(remaining);
        if(!deselected.success||manager.queryState(removed)!=RootHideManager.State.HIDDEN)
            throw new AssertionError("Deselected disposable app must stay hidden until reset");
        HideTargetStore.ReadResult store=new HideTargetStore().read();
        HideTargetStore.Record record=HideTargetController.find(store.snapshot,removed);
        if(record==null||record.managed)throw new AssertionError("Deselected app recovery evidence missing");
        Map<String,String> values=new LinkedHashMap<>();
        String fakeAccount="c".repeat(64);
        values.put(ConfigSchema.HEALTH_ACCOUNT,fakeAccount);
        values.put(ConfigSchema.HEALTH_SINCE,"1");
        values.put(ConfigSchema.HEALTH_PLAN,new StepPlan("d".repeat(32),fakeAccount,"Asia/Shanghai",
                LocalDate.of(2100,1,1),1,2,1,false,1).serialize());
        // Health execution switches remain off. No real health account or native step data is modified.
        values.put(ConfigSchema.FREEFORM_EXCLUDED_APPS,A+";"+B);
        values.put(ConfigSchema.TILE_LABEL,"RESET_FIXTURE");
        values.put(ConfigSchema.STORE_DOWNLOAD_COUNT,"7");
        values.put(ConfigSchema.AUDIO_GAIN_STEP,"9");
        AppConfig.SaveResult saved=config.save(values);
        if(!saved.success)throw new AssertionError(saved.message);
        if(!context.getSharedPreferences(AppConfig.PREFS,0).edit().putString("total_reset_fixture_retired_key","old").commit())
            throw new AssertionError("Retired key fixture failed");
        if(!context.getSharedPreferences("total-reset-fixture-old-prefs",0).edit().putString("old_identity","fixture").commit())
            throw new AssertionError("Old private preference fixture failed");
        Files.write(new File(context.getFilesDir(),"total-reset-fixture-old-resource.txt").toPath(),
                "fixture".getBytes(StandardCharsets.UTF_8));
        context.getPackageManager().setComponentEnabledSetting(new ComponentName(context,context.getPackageName()+".LauncherAlias"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,PackageManager.DONT_KILL_APP);
        return new JSONObject().put("success",true).put("controlledFixtureOnly",true).put("hiddenFixtureCount",2)
                .put("hiddenDeselectedFixtureCount",1).put("fakeBindingAndPlan",true)
                .put("healthExecutionEnabled",false).put("retiredKeyAndPrivateResource",true).put("aliasHidden",true);
    }
}
