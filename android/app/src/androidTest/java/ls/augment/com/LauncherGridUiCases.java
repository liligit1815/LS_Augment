package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Native entry and production controls, with all edited dimensions confined to memory. */
final class LauncherGridUiCases {
    private final Instrumentation test;
    private Activity activity;
    private View fixture;
    private int checks,changes;
    private final Map<String,String> memory=new LinkedHashMap<>(LauncherGridSpec.defaults().values());
    private final JSONArray screenshots=new JSONArray();
    private File directory;
    private LauncherGridUiCases(Instrumentation test){this.test=test;}
    static JSONObject run(Instrumentation test)throws Exception{return new LauncherGridUiCases(test).run();}

    private JSONObject run()throws Exception{
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);
        require(context.getSystemService(PowerManager.class).isInteractive(),"Unlock the device and keep its screen on before inspecting the grid UI");
        require(!context.getSystemService(KeyguardManager.class).isKeyguardLocked(),"Unlock the device before inspecting the grid UI");
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,?> rawBefore=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        Throwable failure=null;
        try{
            activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target",HookAppCatalog.LAUNCHER).putExtra(ModuleNavigation.EXTRA_ROUTE,"group/launcher/launcher_grid").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));settle();
            onMain(()->{
                View decor=activity.getWindow().getDecorView();
                require(findText(decor,"桌面布局与页面")!=null,"Real launcher page uses the current desktop layout and pages title");
                View toggle=decor.findViewWithTag("config:"+LauncherGridSpec.ENABLED);
                require(toggle instanceof CompoundButton,"Real page exposes independent desktop-grid switch");
                require(((CompoundButton)toggle).isChecked()==ConfigSchema.truthy(before.get(LauncherGridSpec.ENABLED)),"Opening the page preserves the existing grid toggle");
                require(decor.findViewWithTag("launcher-grid-editor")!=null,"Real launcher section embeds the production grid editor");
                require(decor.findViewWithTag("launcher-grid-runtime")==null,"Custom layout does not leave a runtime description or hidden placeholder beneath the feature");
                require(NativeFeatureGroups.forTarget(HookAppCatalog.LAUNCHER).get(0).id.equals("launcher_grid"),"Desktop layout is the first native launcher section");
                return null;
            });
            directory=new File(context.getExternalFilesDir(null),"launcher-grid-tests");
            require(directory.isDirectory()||directory.mkdirs(),"Screenshot directory available");capture("01-real-launcher-page.png");
            Method command=ScopeRestartDialog.class.getDeclaredMethod("command",String.class);command.setAccessible(true);
            require("killall com.zte.mifavor.launcher >/dev/null 2>&1 || true".equals(command.invoke(null,ScopeRestartDialog.LAUNCHER)),"Launcher restart command targets only the launcher process");
            CountDownLatch workerEntered=new CountDownLatch(1),workerRelease=new CountDownLatch(1),restartReady=new CountDownLatch(1);
            ExecutorService worker=(ExecutorService)get(activity,"worker");
            worker.execute(()->{workerEntered.countDown();try{workerRelease.await(5,TimeUnit.SECONDS);}catch(InterruptedException interrupted){Thread.currentThread().interrupt();}});
            try{
                require(workerEntered.await(3,TimeUnit.SECONDS),"Configuration worker is available");
                onMain(()->{((ScopeRestartDialog.Preparation)activity).prepareScopeRestart(restartReady::countDown);return null;});
                require(!restartReady.await(80,TimeUnit.MILLISECONDS),"Restart waits behind outstanding configuration work");
            }finally{workerRelease.countDown();}
            require(restartReady.await(3,TimeUnit.SECONDS),"Restart continuation proceeds after the save worker drains without restarting any process");
            // Exercise the real three-key transaction synchronously, cancelling its delayed save
            // before returning to the main loop. No test value can reach persistent configuration.
            onMain(()->{
                Map<String,String> draft=map("draft");FieldEditQueue pending=(FieldEditQueue)get(activity,"pending");
                Map<String,String> savedDraft=new LinkedHashMap<>(draft);
                require(pending.restorableValues().isEmpty(),"Fixture starts without unfinished user writes");
                Handler main=(Handler)get(activity,"main");Runnable auto=(Runnable)get(activity,"autoSave");
                try{
                    Map<String,String> update=new LauncherGridSpec(true,8,6).values();invokeChange(update);
                    for(Map.Entry<String,String> item:update.entrySet())require(item.getValue().equals(draft.get(item.getKey()))&&item.getValue().equals(pending.restorableValues().get(item.getKey())),"Preset queues all three validated configuration values together");
                    Map<String,String> invalid=new LinkedHashMap<>(update);invalid.put(LauncherGridSpec.ROWS,"13");
                    invokeChange(invalid);require("8".equals(draft.get(LauncherGridSpec.ROWS)),"Invalid row count cannot partially overwrite the pending preset");
                }finally{main.removeCallbacks(auto);draft.clear();draft.putAll(savedDraft);for(String key:pending.restorableValues().keySet())pending.invalidate(key);}
                return null;
            });
            onMain(()->{
                UiKit ui=new UiKit(activity);LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(ui.dp(16),ui.dp(12),ui.dp(16),ui.dp(16));body.setBackgroundColor(ui.background);
                body.addView(ui.text("桌面布局测试 · 仅内存草稿",16,ui.text,true));
                LauncherGridEditor editor=new LauncherGridEditor(activity,ui,memory::get,updates->{
                    require(updates.size()==3,"Every preset/step emits one complete three-key batch");
                    require(LauncherGridSpec.from(updates)!=null,"UI emits a structurally valid specification");memory.putAll(updates);changes++;
                });fixture=editor.view();body.addView(fixture);ScrollView scroll=new ScrollView(activity);scroll.addView(body);activity.setContentView(scroll);return null;
            });settle();
            clickText("6 × 8");
            require(spec().rows==8&&spec().columns==6&&!spec().enabled,"6×8 preset uses columns×rows and retains disabled state");
            require(changes==1,"One preset click is one atomic update");
            onMain(()->{memory.put(LauncherGridSpec.ENABLED,"1");return null;});
            clickDescription("减少桌面行数");require(spec().rows==7&&spec().columns==6&&spec().enabled,"Row control changes only rows and retains enabled state");
            clickDescription("增加桌面列数");require(spec().rows==7&&spec().columns==7,"Column control changes independently");
            for(int i=0;i<5;i++)clickDescription("增加桌面行数");
            require(spec().rows==12&&spec().columns==7,"Row controls reach the supported upper bound");
            require(onMain(()->!findDescription(fixture,"增加桌面行数").isEnabled()),"Upper-bound button is disabled");
            for(int i=0;i<4;i++)clickDescription("减少桌面列数");
            require(spec().columns==3&&spec().rows==12,"Column controls reach lower bound without changing rows");
            require(onMain(()->!findDescription(fixture,"减少桌面列数").isEnabled()),"Lower-bound button is disabled");
            clickText("n × n…");clickDialogChoice("5 × 5（5 列 × 5 行）");
            require(spec().rows==5&&spec().columns==5&&spec().enabled,"Square shortcut changes both dimensions and preserves toggle");
            require(onMain(()->findText(fixture,"5 列 × 5 行 · 每页 25 格")!=null),"Visible preview summary follows the selected dimensions");
            capture("02-grid-square-preview.png");
            require(before.equals(config.snapshot()),"UI interactions do not change actual launcher configuration");
        }catch(Throwable problem){failure=problem;try{if(directory!=null&&activity!=null)capture("failure.png");}catch(Throwable capture){problem.addSuppressed(capture);}}
        finally{
            try{if(activity!=null)onMain(()->{activity.finish();return null;});test.waitForIdleSync();}
            catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            if(!before.equals(config.snapshot())||!rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll())){
                AssertionError changed=new AssertionError("Native launcher grid UI test changed persistent settings");if(failure==null)failure=changed;else failure.addSuppressed(changed);
            }
        }
        if(failure!=null)throw new AssertionError("Native launcher-grid UI regression failed",failure);
        return new JSONObject().put("success",true).put("checks",checks).put("settingsUnchanged",true).put("memoryUpdates",changes).put("screenshots",screenshots);
    }
    private LauncherGridSpec spec()throws Exception{return onMain(()->LauncherGridSpec.from(memory));}
    @SuppressWarnings("unchecked") private Map<String,String> map(String name){return (Map<String,String>)get(activity,name);}
    private void invokeChange(Map<String,String> values)throws Exception{Method method=EnhancementSettingsActivity.class.getDeclaredMethod("changeLauncherGrid",Map.class);method.setAccessible(true);method.invoke(activity,values);}
    private void clickText(String text)throws Exception{onMain(()->{View view=findText(fixture,text);require(view!=null&&view.performClick(),"Clickable control: "+text);return null;});settle();}
    private void clickDescription(String text)throws Exception{onMain(()->{View view=findDescription(fixture,text);require(view!=null&&view.isEnabled()&&view.performClick(),"Enabled control: "+text);return null;});}
    private void clickDialogChoice(String text)throws Exception{
        settle();AccessibilityNodeInfo root=test.getUiAutomation().getRootInActiveWindow();require(root!=null,"Choice dialog has accessibility root");boolean clicked=false;
        for(AccessibilityNodeInfo node:root.findAccessibilityNodeInfosByText(text)){
            if(node.getText()==null||!text.contentEquals(node.getText()))continue;
            AccessibilityNodeInfo current=node;while(current!=null&&!current.isClickable())current=current.getParent();
            if(current!=null&&current.performAction(AccessibilityNodeInfo.ACTION_CLICK)){clicked=true;break;}
        }
        require(clicked,"Square choice is accessible and clickable");settle();
    }
    private static View findText(View view,String text){if(view instanceof TextView&&text.contentEquals(((TextView)view).getText()))return view;return children(view,text,false);}
    private static View findDescription(View view,String text){if(text.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;return children(view,text,true);}
    private static View children(View view,String text,boolean description){if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View child=((ViewGroup)view).getChildAt(i);View match=description?findDescription(child,text):findText(child,text);if(match!=null)return match;}return null;}
    private void capture(String name)throws Exception{settle();Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot available");File file=new File(directory,name);try(FileOutputStream out=new FileOutputStream(file)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}finally{bitmap.recycle();}screenshots.put(file.getAbsolutePath());}
    private void settle(){SystemClock.sleep(180);test.waitForIdleSync();}
    private void require(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("Main-thread UI operation failed",error.get());return result.get();}
    private static Object get(Object object,String name){try{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(Exception failure){throw new AssertionError(failure);}}
}
