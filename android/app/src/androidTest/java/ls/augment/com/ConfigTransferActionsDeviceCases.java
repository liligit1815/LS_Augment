package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.inspector.WindowInspector;
import android.widget.Button;
import android.widget.TextView;
import java.io.File;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Cancel/failure/recreation checks only. Never confirms import or reset, or writes an exported document. */
final class ConfigTransferActionsDeviceCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final Application application;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray cases=new JSONArray();
    private volatile Activity resumed;
    private volatile Throwable lifecycleFailure;
    private Map<String,?> baseline;
    private File importFixture;

    private ConfigTransferActionsDeviceCases(Instrumentation test){
        this.test=test;context=test.getTargetContext();
        application=(Application)context.getApplicationContext();
    }
    static JSONObject run(Instrumentation test)throws Exception{return new ConfigTransferActionsDeviceCases(test).run();}
    private JSONObject run()throws Exception{
        require(!OnboardingActivity.needsConsent(context),"Requires existing consent; this test must not accept agreements");
        baseline=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        application.registerActivityLifecycleCallbacks(this);
        try {
            module();
            launchHost(null);awaitModule();pass("missing-action-routes-to-module");
            launchHost("unrecognized-test-action");awaitModule();pass("unknown-action-routes-to-module");
            Activity module=module();
            main(()->{ModuleNavigation.open(module,"config_transfer");return null;});
            awaitModule();pass("retired-route-routes-to-module");
            resetCancel(false);resetCancel(true);
            pickerResult("import",Activity.RESULT_CANCELED,null,"import-picker-cancel");
            pickerResult("export",Activity.RESULT_CANCELED,null,"export-picker-cancel");
            Uri missing=Uri.parse("content://ls.augment.com.test.missing-config-transfer/document");
            pickerResult("import",Activity.RESULT_OK,missing,"import-read-failure");
            pickerResult("export",Activity.RESULT_OK,missing,"export-write-failure");
            pickerRecreation("import");pickerRecreation("export");
            importConfirmationRecreation();
            unchanged();
            return new JSONObject().put("success",true).put("cases",cases)
                    .put("configurationUnchanged",true).put("actualResetExecuted",false)
                    .put("importConfirmed",false).put("exportedDocumentWritten",false)
                    .put("scope","Module entries, retired/missing routes, reset/import/export cancellation, file failures and Activity recreation");
        }finally{
            main(()->{for(Activity activity:activities)if(!activity.isDestroyed())activity.finish();return null;});
            test.waitForIdleSync();application.unregisterActivityLifecycleCallbacks(this);
            if(importFixture!=null&&importFixture.exists())require(importFixture.delete(),"Cannot remove test-only import fixture");
            unchanged();
        }
    }
    private Activity module()throws Exception{
        launch(new Intent(context,SettingsActivity.class).putExtra("tab","settings"));
        return awaitModule();
    }
    private void launchHost(String action)throws Exception{
        Intent intent=new Intent(context,ConfigTransferActivity.class);if(action!=null)intent.putExtra("action",action);
        launch(intent);
    }
    private void launch(Intent intent)throws Exception{
        // startActivitySync cannot reliably return an Activity that immediately forwards and finishes.
        main(()->{context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));return null;});
        settle();
    }
    private void resetCancel(boolean recreate)throws Exception{
        Activity module=module();clickEntry(module,"重置配置");
        Activity original=awaitHost(null);awaitButton("确认重置");noLegacyPage();
        if(recreate){
            main(()->{original.recreate();return null;});
            awaitHost(original);awaitButton("确认重置");noLegacyPage();
        }
        clickGlobalButton("取消");awaitModule();
        pass(recreate?"reset-confirmation-recreated-cancel":"reset-confirmation-cancel");
    }
    private void pickerResult(String action,int result,Uri uri,String name)throws Exception{
        Activity module=module();AtomicInteger calls=new AtomicInteger();
        Instrumentation.ActivityMonitor monitor=new Instrumentation.ActivityMonitor(){
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent){
                if(!pickerAction(action).equals(intent.getAction()))return null;
                calls.incrementAndGet();
                require(intent.hasCategory(Intent.CATEGORY_OPENABLE),"Picker must use openable documents");
                return new Instrumentation.ActivityResult(result,uri==null?null:new Intent().setData(uri));
            }
        };
        test.addMonitor(monitor);
        try {
            clickEntry(module,"import".equals(action)?"导入配置":"导出配置");
            await(()->calls.get()==1?Boolean.TRUE:null,"exactly one "+action+" picker");
            awaitModule();require(calls.get()==1,"Picker repeated during "+name);pass(name);
        }finally{test.removeMonitor(monitor);}
    }
    private void pickerRecreation(String action)throws Exception{
        Activity module=module();IntentFilter filter=new IntentFilter(pickerAction(action));
        filter.addCategory(Intent.CATEGORY_OPENABLE);filter.addDataType("*/*");
        // Blocking with a null result holds the real result callback without opening an external UI.
        Instrumentation.ActivityMonitor monitor=new Instrumentation.ActivityMonitor(filter,null,true);
        test.addMonitor(monitor);
        try {
            clickEntry(module,"import".equals(action)?"导入配置":"导出配置");
            await(()->monitor.getHits()==1?Boolean.TRUE:null,"held "+action+" picker");
            Activity original=awaitHost(null);noLegacyPage();
            main(()->{original.recreate();return null;});
            Activity recreated=awaitHost(original);settle();
            require(monitor.getHits()==1,"Recreating a pending picker launched it twice: "+action);
            noLegacyPage();
            main(()->{((ConfigTransferActivity)recreated).onActivityResult("import".equals(action)?72:71,Activity.RESULT_CANCELED,null);return null;});
            awaitModule();pass(action+"-picker-recreated-no-repeat-cancel");
        }finally{test.removeMonitor(monitor);}
    }
    private void importConfirmationRecreation()throws Exception{
        importFixture=File.createTempFile("config-transfer-ui-fixture-",".json",context.getCacheDir());
        JSONObject document=new JSONObject().put("format","LS_Augment.settings").put("version",1).put("settings",new JSONObject());
        Files.write(importFixture.toPath(),document.toString().getBytes(StandardCharsets.UTF_8));
        Activity module=module();AtomicInteger calls=new AtomicInteger();
        Instrumentation.ActivityMonitor monitor=new Instrumentation.ActivityMonitor(){
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent){
                if(!Intent.ACTION_OPEN_DOCUMENT.equals(intent.getAction()))return null;
                calls.incrementAndGet();return new Instrumentation.ActivityResult(Activity.RESULT_OK,new Intent().setData(Uri.fromFile(importFixture)));
            }
        };
        test.addMonitor(monitor);
        try {
            clickEntry(module,"导入配置");Activity original=awaitHost(null);awaitButton("导入");
            unchanged();noLegacyPage();
            main(()->{original.recreate();return null;});
            awaitHost(original);awaitButton("导入");noLegacyPage();
            require(calls.get()==1,"Import confirmation recreation reopened the picker");
            unchanged();clickGlobalButton("取消");awaitModule();pass("validated-import-confirmation-recreated-cancel");
        }finally{test.removeMonitor(monitor);}
    }
    private Activity awaitHost(Activity old)throws Exception{
        return await(()->resumed instanceof ConfigTransferActivity&&resumed!=old&&!resumed.isFinishing()?resumed:null,"active action host");
    }
    private Activity awaitModule()throws Exception{
        Activity activity=await(()->{
            Activity candidate=resumed;
            return candidate instanceof SettingsActivity&&!candidate.isFinishing()
                    &&main(()->hasText(candidate.getWindow().getDecorView(),"模块设置")
                    &&hasText(candidate.getWindow().getDecorView(),"导出配置")
                    &&hasText(candidate.getWindow().getDecorView(),"导入配置")
                    &&hasText(candidate.getWindow().getDecorView(),"重置配置"))?candidate:null;
        },"Module configuration entries");
        noLegacyPage();unchanged();return activity;
    }
    private void clickEntry(Activity activity,String label)throws Exception{
        main(()->{
            View root=activity.getWindow().getDecorView();View entry=description(root,label);
            require(entry!=null&&entry.isClickable(),"Module entry missing: "+label);require(entry.performClick(),"Entry refused click: "+label);return null;
        });
    }
    private void awaitButton(String label)throws Exception{
        await(()->main(()->globalButton(label)!=null?Boolean.TRUE:null),"dialog button "+label);
    }
    private void clickGlobalButton(String label)throws Exception{
        main(()->{Button button=globalButton(label);require(button!=null,"Missing safe button: "+label);require(button.performClick(),"Button refused click: "+label);return null;});
        settle();
    }
    private static Button globalButton(String label){
        for(View root:WindowInspector.getGlobalWindowViews()){Button found=button(root,label);if(found!=null)return found;}return null;
    }
    private static Button button(View view,String label){
        if(view instanceof Button&&label.contentEquals(((Button)view).getText())&&view.isShown())return (Button)view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){Button found=button(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;
    }
    private static View description(View view,String label){
        if(android.text.TextUtils.equals(label,view.getContentDescription()))return view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=description(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;
    }
    private static boolean hasText(View view,String label){
        if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return true;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(hasText(((ViewGroup)view).getChildAt(i),label))return true;return false;
    }
    private void noLegacyPage()throws Exception{
        main(()->{
            for(View root:WindowInspector.getGlobalWindowViews())require(!hasText(root,"配置备份与重置"),"Retired transfer page appeared");
            for(Activity activity:activities)if(activity instanceof ConfigTransferActivity&&!activity.isDestroyed()){
                View root=activity.getWindow().getDecorView();
                require(!hasText(root,"配置备份")&&!hasText(root,"导出配置")&&!hasText(root,"导入配置")&&!hasText(root,"重置配置"),"Action host recreated an independent settings page");
            }return null;
        });
    }
    private void unchanged(){require(baseline.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Action UI changed saved configuration without confirmation");}
    private void pass(String name)throws Exception{noLegacyPage();unchanged();cases.put(new JSONObject().put("case",name).put("status","pass"));}
    private void settle(){SystemClock.sleep(200);test.waitForIdleSync();}
    private static String pickerAction(String action){return "import".equals(action)?Intent.ACTION_OPEN_DOCUMENT:Intent.ACTION_CREATE_DOCUMENT;}
    private <T>T await(Callable<T> query,String message)throws Exception{
        long until=SystemClock.uptimeMillis()+15000;
        while(SystemClock.uptimeMillis()<until){if(lifecycleFailure!=null)throw new AssertionError(lifecycleFailure);T value=query.call();if(value!=null)return value;SystemClock.sleep(50);}
        throw new AssertionError("Timed out waiting for "+message);
    }
    private <T>T main(Callable<T> task)throws Exception{
        AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();
        test.runOnMainSync(()->{try{value.set(task.call());}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new AssertionError("UI check failed",error.get());return value.get();
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    @Override public void onActivityCreated(Activity activity,Bundle state){
        activities.add(activity);
        if(activity instanceof SettingsActivity)try{
            // Avoid Root prompts and environment publication while testing navigation, without persistent edits.
            Field loading=SettingsActivity.class.getDeclaredField("environmentLoading");loading.setAccessible(true);loading.setBoolean(activity,true);
            Field requested=SettingsActivity.class.getDeclaredField("requestedRoot");requested.setAccessible(true);requested.setBoolean(activity,true);
        }catch(Throwable failure){lifecycleFailure=failure;}
    }
    @Override public void onActivityResumed(Activity activity){resumed=activity;}
    @Override public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityStarted(Activity activity){}
    @Override public void onActivityStopped(Activity activity){}
    @Override public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
