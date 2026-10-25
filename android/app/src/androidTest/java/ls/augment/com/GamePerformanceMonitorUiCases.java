package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.SeekBar;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageButton;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real monitor controls and measured layouts; all test edits are cancelled before any save. */
final class GamePerformanceMonitorUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String ROUTE=ModuleHierarchy.resolve("group/game/plugins");
    private static final String DIRECTORY_ROUTE=ModuleHierarchy.resolve("target-game");
    private static final String[] KEYS={GameOptions.PERFORMANCE_MONITOR,GameOptions.MONITOR_ITEMS,GameOptions.MONITOR_TRANSPARENCY,GameOptions.MONITOR_PIN,GameOptions.QUICK_SWITCH,GameOptions.SHOULDER_PIN};
    private final Instrumentation test;
    private final Context context;
    private final boolean layoutOnly,landscape;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray screenshots=new JSONArray(),layouts=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private Map<String,String> before;
    private int checks,selectionCases,validTransparencyCases,invalidTransparencyCases;
    private boolean recreated;
    private final JSONObject sensorReadings=new JSONObject();

    private GamePerformanceMonitorUiCases(Instrumentation test,boolean layoutOnly,boolean landscape){
        this.test=test;context=test.getTargetContext();this.layoutOnly=layoutOnly;this.landscape=landscape;
    }
    static JSONObject run(Instrumentation test,boolean layoutOnly,boolean landscape)throws Exception{
        return new GamePerformanceMonitorUiCases(test,layoutOnly,landscape).execute();
    }

    private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);before=new LinkedHashMap<>(config.snapshot());
        SharedPreferences preferences=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> rawBefore=new LinkedHashMap<>(preferences.getAll());
        String variant=(layoutOnly?"layout":"controls")+(landscape?"-landscape":"-portrait")+"-font"+context.getResources().getConfiguration().fontScale;
        directory=new File(context.getExternalFilesDir(null),"game-performance-monitor-ui-"+BuildConfig.VERSION_CODE+"/"+variant);
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
        Application application=(Application)context.getApplicationContext();application.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE).putExtra("target",ModuleHierarchy.group(ROUTE).target)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            Activity page=await(ROUTE,null);
            if(landscape)page=landscapePage(page);
            else if(page.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_PORTRAIT){
                Activity previous=page;onMain(()->{previous.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);return null;});page=await(ROUTE,previous);
            }
            settle();checkOriginal(page);checkLayout(page,"original");capture("01-original");
            if(!layoutOnly)exerciseControls(page);
            previewExpanded(page);settle();checkLayout(page,"expanded");capture("02-expanded-top");
            revealTransparency(page);capture("03-expanded-bottom");
            restoreDraft(page);onMain(()->{((ScrollView)tag(resumed,"detail-scroll")).scrollTo(0,0);return null;});settle();
            if(!layoutOnly){
                Activity original=page;onMain(()->{original.recreate();return null;});page=await(ROUTE,original);recreated=true;settle();checkOriginal(page);checkLayout(page,"recreated");capture("04-recreated");
            }
            Activity current=page;onMain(()->{require(tag(current,"breadcrumb:"+DIRECTORY_ROUTE).performClick(),"Game breadcrumb is actionable");return null;});
            Activity directoryPage=await(DIRECTORY_ROUTE,null);settle();
            onMain(()->{require(tag(directoryPage,"navigation:"+ROUTE)!=null,"Directory exposes the monitor's existing plugin group");require(tag(directoryPage,"navigation:"+ROUTE).performClick(),"Plugin group reopens through its directory row");return null;});
            Activity returned=await(ROUTE,null);settle();checkOriginal(returned);
            checkShoulderPin();
            Method sample=Class.forName("ls.augment.com.hook.MonitorTelemetry").getDeclaredMethod("sample",Context.class,String.class);sample.setAccessible(true);
            double[] readings=(double[])sample.invoke(null,context,"battery_temperature,cpu_temperature,gpu_temperature,power");
            require(readings.length==4,"Actual sampler exposes all four additional readings");
            for(int i=0;i<4;i++)sensorReadings.put(GamePerformanceMonitorConfig.items()[i+5],Double.isFinite(readings[i])?readings[i]:JSONObject.NULL);
            require(before.equals(config.snapshot())&&rawBefore.equals(preferences.getAll()),"All control and lifecycle checks preserve the original durable configuration");
        }catch(Throwable error){failure=error;try{capture("failure");}catch(Throwable captureError){error.addSuppressed(captureError);}}
        finally{
            try{
                onMain(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed()){
                    if(activity instanceof EnhancementSettingsActivity)cancelPending(activity);
                    activity.finish();
                }return null;});settle();
                require(before.equals(config.snapshot())&&rawBefore.equals(preferences.getAll()),"Cleanup leaves all saved configuration unchanged");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            application.unregisterActivityLifecycleCallbacks(this);
        }
        JSONObject report=new JSONObject().put("success",failure==null).put("version",BuildConfig.VERSION_NAME)
                .put("checks",checks).put("selectionCases",selectionCases).put("validTransparencyCases",validTransparencyCases)
                .put("invalidTransparencyCases",invalidTransparencyCases).put("layoutOnly",layoutOnly)
                .put("landscapeRequested",landscape).put("recreated",recreated)
                .put("configurationUnchanged",before.equals(config.snapshot())&&rawBefore.equals(preferences.getAll()))
                .put("layouts",layouts).put("screenshots",screenshots).put("actualSensorReadings",sensorReadings);
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Game performance monitor UI checks failed",failure);
        return report;
    }

    private void checkShoulderPin()throws Exception{
        String route=ModuleHierarchy.resolve("group/game/shoulder");
        Activity opened=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                .putExtra(ModuleNavigation.EXTRA_ROUTE,route).putExtra("target",ModuleHierarchy.group(route).target).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
        Activity page=opened;
        if(landscape&&opened.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE){
            onMain(()->{opened.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});page=await(route,opened);
        }
        Activity current=page;settle();
        onMain(()->{
            Switch parent=(Switch)tag(current,"config:"+GameOptions.QUICK_SWITCH),pin=(Switch)tag(current,"config:"+GameOptions.SHOULDER_PIN);
            require(parent!=null&&pin!=null,"Shoulder quick switch owns its pin control on the third-level page");
            ViewGroup feature=(ViewGroup)tag(current,"native-feature:"+GameOptions.QUICK_SWITCH);
            View content=feature.getChildAt(1);require(content.getVisibility()==View.GONE,"Initial shoulder options are collapsed");
            draft(current).put(GameOptions.QUICK_SWITCH,"1");parent.setChecked(true);
            ViewGroup row=(ViewGroup)parent.getParent();if(content.getVisibility()!=View.VISIBLE)row.getChildAt(row.getChildCount()-1).performClick();
            require(pin.isShown(),"Pin control is available inside quick-switch parameters");
            boolean old=pin.isChecked();draft(current).put(GameOptions.SHOULDER_PIN,old?"0":"1");pin.performClick();
            require(pin.isChecked()!=old,"Shoulder pin switch responds to user interaction");
            draft(current).put(GameOptions.SHOULDER_PIN,old?"1":"0");pin.performClick();
            View path=tag(current,"page-path"),card=tag(current,"application-category:"+ModuleHierarchy.group(route).target+":shoulder");
            float gap=(top(card)-top(path)-path.getHeight())/current.getResources().getDisplayMetrics().density;
            require(gap>=7.5f&&gap<=12.5f,"Shoulder navigation gap stays 8–12dp");
            pin.requestRectangleOnScreen(new Rect(0,0,pin.getWidth(),pin.getHeight()),true);
            cancelPending(current);return null;
        });settle();capture("05-shoulder-position-pin");
        onMain(()->{draft(current).clear();draft(current).putAll(before);cancelPending(current);current.finish();return null;});settle();
    }

    private void checkOriginal(Activity page)throws Exception{onMain(()->{
        require(ROUTE.equals(ModuleNavigation.route(page)),"Monitor belongs to the game plugin page");
        Switch toggle=toggle(page);require(toggle.isChecked()==ConfigSchema.truthy(before.get(GameOptions.PERFORMANCE_MONITOR)),"Monitor switch loads its saved state");
        for(CheckBox box:boxes(page))require(box.isChecked()==GamePerformanceMonitorConfig.selected(before.get(GameOptions.MONITOR_ITEMS),(String)box.getTag()),"Item loads its saved selection: "+box.getTag());
        require(Integer.parseInt(before.get(GameOptions.MONITOR_TRANSPARENCY))==transparency(page).getProgress(),"Transparency loads its saved value");
        require(((FieldEditQueue)get(page,"pending")).isEmpty(),"Opening a monitor page schedules no save");
        for(View view:all(tag(page,"native-feature:"+GameOptions.PERFORMANCE_MONITOR)))
            require(!(view.getTag() instanceof String)||!((String)view.getTag()).startsWith("navigation:"),"Monitor parameters stay inside the feature fold");
        return null;
    });}

    private void exerciseControls(Activity page)throws Exception{onMain(()->{
        try{
            Switch toggle=toggle(page);View content=content(page);ImageButton arrow=arrow(page);
            toggle.setChecked(false);require(content.getVisibility()==View.GONE&&!arrow.isEnabled(),"Disabled monitor is folded and cannot expand");
            toggle.setChecked(true);require(content.getVisibility()==View.VISIBLE&&arrow.isEnabled(),"Enabling the monitor expands its settings");
            arrow.performClick();require(toggle.isChecked()&&content.getVisibility()==View.GONE,"Collapsing retains enabled state");
            arrow.performClick();require(content.getVisibility()==View.VISIBLE,"Expansion returns on the same page");
            CheckBox[] boxes=boxes(page);for(CheckBox box:boxes)box.setChecked(true);
            for(int index=boxes.length-1;index>0;index--)boxes[index].performClick();
            require("time".equals(draft(page).get(GameOptions.MONITOR_ITEMS)),"A one-item monitor preset is accepted");selectionCases++;
            boxes[0].performClick();require(boxes[0].isChecked()&&"time".equals(draft(page).get(GameOptions.MONITOR_ITEMS)),"Unchecking the last item retains it instead of publishing an empty monitor");selectionCases++;
            for(int index=1;index<boxes.length;index++){
                boxes[index].performClick();boxes[index-1].performClick();
                require(((String)boxes[index].getTag()).equals(draft(page).get(GameOptions.MONITOR_ITEMS)),"Each native item can be the single visible item: "+boxes[index].getTag());selectionCases++;
            }
            SeekBar field=transparency(page);
            for(String value:new String[]{"0","100","35"}){setTransparency(page,Integer.parseInt(value));require(value.equals(draft(page).get(GameOptions.MONITOR_TRANSPARENCY)),"Transparency accepts boundary or intermediate percentage: "+value);validTransparencyCases++;}
            String items=draft(page).get(GameOptions.MONITOR_ITEMS),percentage=draft(page).get(GameOptions.MONITOR_TRANSPARENCY);
            toggle.setChecked(false);require(items.equals(draft(page).get(GameOptions.MONITOR_ITEMS))&&percentage.equals(draft(page).get(GameOptions.MONITOR_TRANSPARENCY)),"Disabling preserves both selected items and transparency");
            arrow.performClick();require(content.getVisibility()==View.GONE,"A disabled monitor cannot expose its editor");
            toggle.setChecked(true);require(items.equals(draft(page).get(GameOptions.MONITOR_ITEMS))&&Integer.parseInt(percentage)==field.getProgress(),"Re-enabling recovers the previous parameter values");
            require(field.getMin()==0&&field.getMax()==100,"Slider constrains transparency to the validated 0–100 range");
            setTransparency(page,35);
            Bundle state=new Bundle();Method save=EnhancementSettingsActivity.class.getDeclaredMethod("onSaveInstanceState",Bundle.class);save.setAccessible(true);save.invoke(page,state);
            require("35".equals(state.getBundle("draft").getString(GameOptions.MONITOR_TRANSPARENCY))
                    &&items.equals(state.getBundle("draft").getString(GameOptions.MONITOR_ITEMS)),"Pending legal parameters enter activity state for configuration recreation");
        }finally{cancelPending(page);}
        return null;
    });}

    private void previewExpanded(Activity page)throws Exception{onMain(()->{
        try{
            Switch toggle=toggle(page);toggle.setChecked(false);toggle.setChecked(true);
            for(CheckBox box:boxes(page))box.setChecked(true);
            setTransparency(page,35);
            require(content(page).getVisibility()==View.VISIBLE,"The preview shows all actual monitor controls");
        }finally{cancelPending(page);}
        return null;
    });}

    private void restoreDraft(Activity page)throws Exception{onMain(()->{
        try{
            for(CheckBox box:boxes(page))box.setChecked(true);
            for(CheckBox box:boxes(page))box.setChecked(GamePerformanceMonitorConfig.selected(before.get(GameOptions.MONITOR_ITEMS),(String)box.getTag()));
            ((ParameterSlider)tag(page,"parameter-slider:"+GameOptions.MONITOR_TRANSPARENCY)).setValue(before.get(GameOptions.MONITOR_TRANSPARENCY));
            toggle(page).setChecked(ConfigSchema.truthy(before.get(GameOptions.PERFORMANCE_MONITOR)));
            for(String key:KEYS)draft(page).put(key,before.get(key));
        }finally{cancelPending(page);}
        return null;
    });}

    private void checkLayout(Activity page,String state)throws Exception{onMain(()->{
        float density=page.getResources().getDisplayMetrics().density;View path=tag(page,"page-path");
        View first=tag(page,"application-category:"+ModuleHierarchy.group(ROUTE).target+":plugins");
        require(path!=null&&first!=null,"Path and first content have real layout bounds");
        float gap=(top(first)-top(path)-path.getHeight())/density;
        require(gap>=7.5f&&gap<=12.5f,"Actual path-to-first-card gap is 8–12dp: "+gap);
        TextView current=(TextView)tag(page,"breadcrumb:"+ROUTE);Rect visible=new Rect();
        require(current!=null&&current.getGlobalVisibleRect(visible)&&visible.width()>=current.getWidth()-1
                &&current.getLayout()!=null&&current.getLayout().getEllipsisCount(0)==0,"Current breadcrumb is visible without clipping");
        float minRight=Float.MAX_VALUE,maxRight=-Float.MAX_VALUE;int switches=0;
        for(View view:all(first))if(view instanceof Switch&&!GameOptions.MONITOR_PIN.equals(String.valueOf(view.getTag()).replace("config:",""))){
            int[] point=new int[2];view.getLocationInWindow(point);float right=point[0]+view.getWidth();minRight=Math.min(minRight,right);maxRight=Math.max(maxRight,right);switches++;
            require(Math.abs(view.getWidth()/density-46f)<1f,"Game plugin switches use the shared 46dp width");
        }
        require(switches==2&&(maxRight-minRight)/density<=1f,"Native plugin and monitor switches share one aligned column");
        if(content(page).getVisibility()==View.VISIBLE){
            for(CheckBox box:boxes(page))require(box.getHeight()/density>=47.5f,"Monitor item retains a 48dp touch target: "+box.getTag());
            require(transparency(page).getHeight()/density>=47.5f,"Transparency field retains a 48dp touch target");
        }
        int orientation=page.getResources().getConfiguration().orientation;
        require(orientation==(landscape?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT),"Requested orientation is rendered before measurement");
        layouts.put(new JSONObject().put("state",state).put("navigationGapDp",gap).put("switchRightSpreadDp",(maxRight-minRight)/density)
                .put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale).put("orientation",orientation));
        return null;
    });}

    private void revealTransparency(Activity page)throws Exception{
        onMain(()->{ScrollView scroll=(ScrollView)tag(page,"detail-scroll");scroll.scrollTo(0,scroll.getChildAt(0).getHeight());return null;});settle();
        onMain(()->{SeekBar field=transparency(page);Rect visible=new Rect();require(field.getGlobalVisibleRect(visible)
                &&visible.width()>=field.getWidth()-1&&visible.height()>=field.getHeight()-1,"The last monitor input is fully reachable in the real scroll viewport");return null;});
    }

    private Activity landscapePage(Activity original)throws Exception{
        boolean already=onMain(()->original.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE);
        onMain(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
        Activity result=already?original:await(ROUTE,original);settle();return result;
    }
    private void cancelPending(Activity page)throws Exception{
        Handler handler=(Handler)get(page,"main");handler.removeCallbacks((Runnable)get(page,"autoSave"));
        FieldEditQueue queue=(FieldEditQueue)get(page,"pending");
        for(String key:KEYS){require(!queue.isInFlight(key),"Read-only UI test never submits a monitor write");queue.invalidate(key);}
        require(queue.isEmpty(),"Every temporary monitor edit is cancelled within its UI turn");
    }
    private static Switch toggle(Activity page){return (Switch)tag(page,"config:"+GameOptions.PERFORMANCE_MONITOR);}
    private static View content(Activity page){ViewGroup feature=(ViewGroup)tag(page,"native-feature:"+GameOptions.PERFORMANCE_MONITOR);return feature.getChildAt(1);}
    private static ImageButton arrow(Activity page){ViewGroup row=(ViewGroup)toggle(page).getParent();return (ImageButton)row.getChildAt(row.getChildCount()-1);}
    private CheckBox[] boxes(Activity page){ViewGroup parent=(ViewGroup)tag(page,"config:"+GameOptions.MONITOR_ITEMS);require(parent!=null&&parent.getChildCount()==9,"Nine monitoring choices are present");CheckBox[] result=new CheckBox[9];for(int index=0;index<9;index++){result[index]=(CheckBox)parent.getChildAt(index);require(GamePerformanceMonitorConfig.items()[index].equals(result[index].getTag()),"Checkbox identifies its original native item");}return result;}
    private static void setTransparency(Activity page,int value){if(transparency(page).getProgress()==value)return;Bundle arguments=new Bundle();arguments.putFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,value);
        if(!transparency(page).performAccessibilityAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId(),arguments))throw new AssertionError("Transparency slider did not accept accessibility progress");}
    private static SeekBar transparency(Activity page){return (SeekBar)tag(page,"config:"+GameOptions.MONITOR_TRANSPARENCY);}
    private static Map<String,String> draft(Activity page)throws Exception{return (Map<String,String>)get(page,"draft");}
    private static Object get(Object owner,String name)throws Exception{Field field=EnhancementSettingsActivity.class.getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private static View tag(Activity page,String value){return page.getWindow().getDecorView().findViewWithTag(value);}
    private static float top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private static List<View> all(View root){List<View> result=new ArrayList<>();result.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)result.addAll(all(((ViewGroup)root).getChildAt(i)));return result;}
    private Activity await(String route,Activity old){long end=SystemClock.uptimeMillis()+15000;while(SystemClock.uptimeMillis()<end){Activity page=resumed;if(page!=null&&page!=old&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(50);}throw new AssertionError("Timed out awaiting "+route);}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(200);}
    private void capture(String label)throws Exception{settle();Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot available");File file=new File(directory,label+".png");try(FileOutputStream out=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}screenshots.put(file.getAbsolutePath());}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return value.get();}
    @Override public void onActivityCreated(Activity page,Bundle state){activities.add(page);page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);}
    @Override public void onActivityResumed(Activity page){resumed=page;}
    @Override public void onActivityPaused(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityDestroyed(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityStarted(Activity page){}
    @Override public void onActivityStopped(Activity page){}
    @Override public void onActivitySaveInstanceState(Activity page,Bundle state){}
}
