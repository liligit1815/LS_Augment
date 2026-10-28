package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Exercises production navigation, real on-device sampling and result retention without settings writes. */
final class BatteryHealthUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String ROUTE="group/system_settings/battery",DIRECTORY="target-system_settings";
    private final Instrumentation test;private final Context context;private volatile Activity resumed;
    private final List<Activity> pages=new ArrayList<>();private final JSONArray layouts=new JSONArray(),screenshots=new JSONArray();
    private File directory;private int checks;
    private BatteryHealthUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new BatteryHealthUiCases(test).execute();}
    private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Application application=(Application)context.getApplicationContext();application.registerActivityLifecycleCallbacks(this);
        try{
            test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class).putExtra("target","system_settings")
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,DIRECTORY).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            Activity menu=orient(await(DIRECTORY,null),false,DIRECTORY);
            directory=new File(context.getExternalFilesDir(null),"battery-health-ui-"+BuildConfig.VERSION_CODE+"-font"+context.getResources().getConfiguration().fontScale);
            require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
            main(()->{View link=tag(menu,"navigation:"+ROUTE);require(link!=null&&link.performClick(),"System settings opens health detection");return null;});
            Activity page=await(ROUTE,null);settle();layout(page,"initial");capture("01-initial");
            main(()->{require("开始检测".contentEquals(button(page).getText()),"Detection waits for an explicit action");require(button(page).performClick(),"Start button works");require(!button(page).isEnabled(),"Repeated clicks cannot queue duplicate reads");return null;});
            awaitSample(page);layout(page,"result");capture("02-result");
            BatteryHealthPanel.State state=state(page);require(state.sample!=null,"Actual sampler returned a result");
            long sampledAt=state.sample.at;
            List<BatteryHealthData.Reading> readings=BatteryHealthData.parse(state.sample.raw);
            require(!readings.isEmpty()&&readings.get(0).percent!=null,"Connected phone exposes a complete capacity pair");
            String expected=String.format(Locale.ROOT,"%.1f%%",readings.get(0).percent);
            require(expected.contentEquals(((TextView)tag(page,"battery-health-percent")).getText()),"Displayed estimate matches actual same-source capacities");
            main(()->{BatteryHealthReader.Sample saved=state.sample;
                state.sample=new BatteryHealthReader.Sample("/sys/class/power_supply/battery|type|Battery\n/system/ignored|capacity|100\n","fixture","",sampledAt);state.changed();
                require("无法计算".contentEquals(((TextView)tag(page,"battery-health-percent")).getText()),"Missing capacities never display false health");
                require("不可读取".contentEquals(((TextView)tag(page,"battery-health-cycles")).getText()),"Missing cycles never display zero");
                state.sample=saved;state.changed();return null;});
            main(()->{page.recreate();return null;});Activity recreated=await(ROUTE,page);settle();
            require(state(recreated)==state&&state(recreated).sample.at==sampledAt,"Recreation retains the result without repeating a read");
            Activity landscape=orient(recreated,true,ROUTE);layout(landscape,"landscape");capture("03-landscape");
            main(()->{((ScrollView)tag(landscape,"detail-scroll")).fullScroll(View.FOCUS_DOWN);return null;});settle();
            main(()->{android.graphics.Rect bounds=new android.graphics.Rect();View source=tag(landscape,"battery-health-source");
                require(source.getGlobalVisibleRect(bounds)&&bounds.height()>=source.getHeight()-1,"Landscape scroll reveals the complete data source");return null;});capture("03b-landscape-bottom");
            main(()->{((ScrollView)tag(landscape,"detail-scroll")).scrollTo(0,0);return null;});
            require(state(landscape).sample.at==sampledAt,"Rotation preserves detection time");
            Activity portrait=orient(landscape,false,ROUTE);layout(portrait,"portrait-restored");capture("04-portrait-restored");
            main(()->{require(button(portrait).performClick(),"Refresh button starts another measurement");return null;});awaitSample(portrait);
            require(state(portrait).sample.at>=sampledAt,"Refresh updates the sample");
            main(()->{require(tag(portrait,"breadcrumb:"+DIRECTORY).performClick(),"Breadcrumb returns to system settings");return null;});await(DIRECTORY,null);
            require(before.equals(config.snapshot()),"Detection and navigation preserve configuration");
            return new JSONObject().put("success",true).put("checks",checks).put("configurationUnchanged",true)
                    .put("estimatedHealth",readings.get(0).percent).put("fullMicroAh",readings.get(0).full)
                    .put("designMicroAh",readings.get(0).design).put("cycles",readings.get(0).cycles)
                    .put("layouts",layouts).put("screenshots",screenshots);
        }finally{
            main(()->{for(Activity page:new ArrayList<>(pages))if(!page.isDestroyed())page.finish();return null;});
            application.unregisterActivityLifecycleCallbacks(this);test.waitForIdleSync();require(before.equals(config.snapshot()),"Cleanup preserves configuration");
        }
    }
    private Activity orient(Activity page,boolean landscape,String route)throws Exception{
        int wanted=landscape?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
        if(page.getResources().getConfiguration().orientation==wanted)return page;
        main(()->{page.setRequestedOrientation(landscape?ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);return null;});
        Activity result=await(route,page);settle();require(result.getResources().getConfiguration().orientation==wanted,"Requested orientation is active");return result;
    }
    private void layout(Activity page,String label)throws Exception{settle();main(()->{
        View path=tag(page,"page-path"),first=tag(page,"application-category:system_settings:battery");float density=page.getResources().getDisplayMetrics().density;
        float gap=(top(first)-top(path)-path.getHeight())/density;require(gap>=7.5&&gap<=12.5,"Navigation gap is 8–12dp: "+gap);
        require(button(page).getHeight()/density>=47.5,"Detection action retains a 48dp touch target");
        layouts.put(new JSONObject().put("state",label).put("gapDp",gap).put("fontScale",page.getResources().getConfiguration().fontScale)
                .put("orientation",page.getResources().getConfiguration().orientation));return null;
    });}
    private void awaitSample(Activity page)throws Exception{long deadline=SystemClock.uptimeMillis()+20000;while(main(()->state(page).loading)){require(SystemClock.uptimeMillis()<deadline,"Detection completes within its deadline");SystemClock.sleep(40);}settle();}
    private Activity await(String route,Activity previous)throws Exception{long deadline=SystemClock.uptimeMillis()+10000;while(SystemClock.uptimeMillis()<deadline){Activity found=resumed;if(found!=null&&found!=previous&&route.equals(ModuleNavigation.route(found))&&main(found::hasWindowFocus))return found;SystemClock.sleep(40);}throw new AssertionError("Missing route "+route);}
    private static BatteryHealthPanel.State state(Activity page)throws Exception{Field field=EnhancementSettingsActivity.class.getDeclaredField("inputSession");field.setAccessible(true);Object session=field.get(page);field=session.getClass().getDeclaredField("batteryHealth");field.setAccessible(true);return (BatteryHealthPanel.State)field.get(session);}
    private static View tag(Activity page,String tag){return page.getWindow().getDecorView().findViewWithTag(tag);}
    private static Button button(Activity page){return (Button)tag(page,"battery-health-detect");}
    private static float top(View view){int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(250);}
    private void capture(String name)throws Exception{settle();android.graphics.Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot available");File path=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(path)){bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}screenshots.put(path.getAbsolutePath());}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable problem){error.set(problem);}});if(error.get()!=null)throw new AssertionError("Battery UI action failed",error.get());return result.get();}
    public void onActivityCreated(Activity page,Bundle state){pages.add(page);page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);}
    public void onActivityResumed(Activity page){resumed=page;}public void onActivityPaused(Activity page){if(resumed==page)resumed=null;}
    public void onActivityDestroyed(Activity page){if(resumed==page)resumed=null;}
    public void onActivityStarted(Activity page){}public void onActivityStopped(Activity page){}public void onActivitySaveInstanceState(Activity page,Bundle state){}
}
