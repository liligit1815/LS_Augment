package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.graphics.Bitmap;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Exercise the actual home entry, history, destination focus and back stack. */
final class FeatureSearchUiCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final List<Activity> activities=new ArrayList<>();
    private volatile Activity resumed;
    private int checks;
    private File output;
    private FeatureSearchUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new FeatureSearchUiCases(test).run();}
    private JSONObject run()throws Exception{
        output=new File(context.getExternalFilesDir(null),"feature-search-"+BuildConfig.VERSION_CODE);output.mkdirs();
        var consent=context.getSharedPreferences("ls_augment_consent",0);
        var history=context.getSharedPreferences("feature_search",0);
        Map<String,?> oldConsent=new LinkedHashMap<>(consent.getAll()),oldHistory=new LinkedHashMap<>(history.getAll());
        Map<String,String> baseline=new LinkedHashMap<>(new AppConfig(context).snapshot());
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        JSONObject report=new JSONObject();Throwable failure=null;
        try{
            consent.edit().putInt("accepted_version",ModuleLegal.VERSION).putBoolean("ui_navigation_test",true).commit();
            FeatureSearchHistory.clear(context);
            Activity home=test.startActivitySync(new Intent(context,SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            await(()->resumed==home&&home.hasWindowFocus(),"home visible and focused");test.waitForIdleSync();
            onMain(()->{View entry=tag(home,"home-search-entry");check(entry!=null,"Home search entry exists");entry.performClick();return null;});
            await(()->resumed instanceof FeatureSearchActivity&&resumed.hasWindowFocus(),"separate search page");Activity search=resumed;
            SystemClock.sleep(350);test.waitForIdleSync();
            float gap=onMain(()->{View path=tag(search,"page-path"),field=tag(search,"feature-search-input");int[] a=new int[2],b=new int[2];path.getLocationOnScreen(a);field.getLocationOnScreen(b);return (b[1]-a[1]-path.getHeight())/search.getResources().getDisplayMetrics().density;});
            check(gap>=8&&gap<=12,"Breadcrumb to first input is 8–12dp: "+gap);report.put("gapDp",gap);capture("01-empty");
            onMain(()->{input(search).setText("双排信号");return null;});test.waitForIdleSync();
            check(FeatureSearchHistory.read(context).isEmpty(),"Typing is not stored as history");capture("02-results");
            onMain(()->{View result=tag(search,"search-result:status_network");check(result!=null,"Dual signal resolves to actual network editor");result.performClick();return null;});
            await(()->resumed instanceof StatusBarSettingsActivity,"network editor opened");Activity network=resumed;
            await(()->foreground(network.getWindow().getDecorView())!=null,"result background highlight");capture("03-highlight");
            check(!network.getIntent().hasExtra(SearchResultHighlight.TITLE),"Focus request consumed once");
            await(()->foreground(network.getWindow().getDecorView())==null,"highlight restores original background");
            onMain(()->{network.finish();return null;});await(()->resumed==search,"back returns to existing search");
            check(onMain(()->input(search).getText().toString()).equals("双排信号"),"Back preserves query");
            check(FeatureSearchHistory.read(context).equals(Collections.singletonList("双排信号")),"Selected query recorded once");
            onMain(()->{search.recreate();return null;});await(()->resumed instanceof FeatureSearchActivity&&resumed!=search,"search recreates");Activity restored=resumed;
            check(onMain(()->input(restored).getText().toString()).equals("双排信号"),"Recreation preserves query");
            onMain(()->{input(restored).setText("");return null;});test.waitForIdleSync();capture("04-history");
            onMain(()->{View recent=tag(restored,"search-history:双排信号");check(recent!=null,"Recent query shown");recent.performClick();return null;});
            check(onMain(()->input(restored).getText().toString()).equals("双排信号"),"Recent query runs search");
            onMain(()->{input(restored).setText("时钟");return null;});test.waitForIdleSync();
            onMain(()->{View result=tag(restored,"search-result:status_clock");check(result!=null,"Clock page result");result.performClick();return null;});
            await(()->resumed instanceof StatusBarSettingsActivity,"clock editor");Activity clock=resumed;
            await(()->foreground(clock.getWindow().getDecorView())!=null,"page-level clock result highlight");capture("05-clock-highlight");
            onMain(()->{clock.finish();return null;});await(()->resumed==restored,"back from clock");
            onMain(()->{input(restored).setText("");return null;});test.waitForIdleSync();
            onMain(()->{tag(restored,"clear-search-history").performClick();return null;});
            check(FeatureSearchHistory.read(context).isEmpty(),"Clear history works");
            // Use the real layout in landscape; restore by finishing this test activity.
            onMain(()->{restored.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
            await(()->resumed instanceof FeatureSearchActivity&&resumed.hasWindowFocus()&&resumed.getResources().getConfiguration().orientation==2
                    &&resumed.getWindow().getDecorView().getWidth()>resumed.getWindow().getDecorView().getHeight(),"landscape search");
            Activity wide=resumed;test.waitForIdleSync();SystemClock.sleep(1000);capture("06-landscape");
            check(onMain(()->input(wide).getWidth()>0&&input(wide).getHeight()>0),"Landscape input usable");
            check(baseline.equals(new AppConfig(context).snapshot()),"Search and highlight never modify feature settings");
            // Bound, de-duplicate and recover corrupt local history independently of UI.
            for(int i=0;i<15;i++)FeatureSearchHistory.remember(context,"query"+i);
            FeatureSearchHistory.remember(context,"QUERY14");
            check(FeatureSearchHistory.read(context).size()==10&&FeatureSearchHistory.read(context).get(0).equals("QUERY14"),"History bounded and de-duplicated");
            history.edit().putString("recent","malformed").commit();check(FeatureSearchHistory.read(context).isEmpty(),"Damaged history safely recovers");
        }catch(Throwable error){failure=error;capture("failure");}
        finally{
            onMain(()->{for(Activity a:new ArrayList<>(activities))if(!a.isDestroyed())a.finish();return null;});test.waitForIdleSync();
            app.unregisterActivityLifecycleCallbacks(this);restore(consent,oldConsent);restore(history,oldHistory);
        }
        report.put("checks",checks).put("success",failure==null).put("device",Build.MODEL).put("version",BuildConfig.VERSION_CODE);
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        try(var stream=new FileOutputStream(new File(output,"report.json"))){stream.write(report.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));}
        if(failure!=null)throw new AssertionError("Search regression",failure);return report;
    }
    private void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    private void await(Callable<Boolean> condition,String why)throws Exception{long end=SystemClock.uptimeMillis()+7000;while(SystemClock.uptimeMillis()<end){if(onMain(condition)){checks++;return;}SystemClock.sleep(25);}throw new AssertionError(why);}
    private <T>T onMain(Callable<T> task)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(task.call());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError(error.get());return result.get();}
    private View tag(Activity a,String tag){return a.getWindow().getDecorView().findViewWithTag(tag);}
    private EditText input(Activity a){return (EditText)tag(a,"feature-search-input");}
    private View foreground(View v){
        String tag=String.valueOf(v.getTag());
        if(v.getForeground()!=null&&(tag.equals("feature-row")||tag.equals("preference-card")||tag.startsWith("native-feature:")))return v;
        if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){View found=foreground(((ViewGroup)v).getChildAt(i));if(found!=null)return found;}return null;
    }
    private void capture(String name)throws Exception{
        test.waitForIdleSync();SystemClock.sleep(180);
        Bitmap shot=test.getUiAutomation().takeScreenshot();check(shot!=null,"Screenshot available");
        boolean content=false;int first=shot.getPixel(0,0);
        for(int y=0;y<shot.getHeight()&&!content;y+=24)for(int x=0;x<shot.getWidth();x+=24)if(shot.getPixel(x,y)!=first){content=true;break;}
        check(content,"Screenshot is not a blank/off display");
        try(var stream=new FileOutputStream(new File(output,name+".png"))){shot.compress(Bitmap.CompressFormat.PNG,100,stream);}finally{shot.recycle();}
    }
    private void restore(SharedPreferences p,Map<String,?> saved){var editor=p.edit().clear();for(var item:saved.entrySet()){Object v=item.getValue();String k=item.getKey();if(v instanceof String)editor.putString(k,(String)v);else if(v instanceof Integer)editor.putInt(k,(Integer)v);else if(v instanceof Boolean)editor.putBoolean(k,(Boolean)v);else if(v instanceof Long)editor.putLong(k,(Long)v);else if(v instanceof Float)editor.putFloat(k,(Float)v);}check(editor.commit(),"Test preferences restored");}
    public void onActivityCreated(Activity a,Bundle s){activities.add(a);}public void onActivityStarted(Activity a){}public void onActivityResumed(Activity a){resumed=a;}public void onActivityPaused(Activity a){}public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle s){}public void onActivityDestroyed(Activity a){activities.remove(a);}
}
