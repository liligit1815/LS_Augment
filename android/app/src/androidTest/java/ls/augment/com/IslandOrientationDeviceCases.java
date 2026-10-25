package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises real Activity recreation/rotation, without editing user settings. */
final class IslandOrientationDeviceCases implements Application.ActivityLifecycleCallbacks {
    private volatile Activity resumed;
    static JSONObject run(Instrumentation test)throws Exception{
        IslandOrientationDeviceCases tracker=new IslandOrientationDeviceCases();
        Application app=(Application)test.getTargetContext().getApplicationContext();
        AppConfig config=new AppConfig(app);Map<String,String> before=config.snapshot();
        JSONArray states=new JSONArray();app.registerActivityLifecycleCallbacks(tracker);
        File folder=new File(app.getExternalFilesDir(null),"island-orientation-"+BuildConfig.VERSION_CODE);folder.mkdirs();
        try{
            test.startActivitySync(new Intent(app,EnhancementSettingsActivity.class).putExtra("target","notifications")
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,"group/notifications/island").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            for(int requested:new int[]{ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE,ActivityInfo.SCREEN_ORIENTATION_PORTRAIT}){
                Activity current=tracker.resumed;test.runOnMainSync(()->current.setRequestedOrientation(requested));
                int expected=requested==ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
                long deadline=SystemClock.uptimeMillis()+12000;
                while(SystemClock.uptimeMillis()<deadline&&(tracker.resumed==null||tracker.resumed.getResources().getConfiguration().orientation!=expected))SystemClock.sleep(50);
                Activity page=tracker.resumed;
                if(page==null||page.getResources().getConfiguration().orientation!=expected)throw new AssertionError("Requested orientation not reached");
                test.waitForIdleSync();SystemClock.sleep(1500);
                Bitmap screen=test.getUiAutomation().takeScreenshot();
                if(screen==null||(expected==Configuration.ORIENTATION_LANDSCAPE)!=(screen.getWidth()>screen.getHeight()))throw new AssertionError("Physical screen did not rotate");
                File file=new File(folder,expected==Configuration.ORIENTATION_LANDSCAPE?"landscape.png":"portrait.png");
                try(FileOutputStream output=new FileOutputStream(file)){screen.compress(Bitmap.CompressFormat.PNG,100,output);}
                states.put(new JSONObject().put("orientation",expected).put("widthPx",screen.getWidth()).put("heightPx",screen.getHeight()).put("screenshot",file.getAbsolutePath()));screen.recycle();
                final float[] gap={0};test.runOnMainSync(()->{
                    View root=page.getWindow().getDecorView(),path=root.findViewWithTag("page-path"),card=root.findViewWithTag("application-category:notifications:island");
                    int[] p=new int[2],c=new int[2];path.getLocationOnScreen(p);card.getLocationOnScreen(c);
                    gap[0]=(c[1]-p[1]-path.getHeight())/page.getResources().getDisplayMetrics().density;
                });
                if(gap[0]<7.5f||gap[0]>12.5f)throw new AssertionError("Navigation gap="+gap[0]);
                states.getJSONObject(states.length()-1).put("gapDp",gap[0]);
            }
            if(!before.equals(config.snapshot()))throw new AssertionError("Orientation changed saved configuration");
            return new JSONObject().put("success",true).put("states",states).put("configurationWrites",0);
        }finally{
            Activity page=tracker.resumed;if(page!=null)test.runOnMainSync(page::finish);
            app.unregisterActivityLifecycleCallbacks(tracker);
        }
    }
    public void onActivityResumed(Activity a){if(a instanceof EnhancementSettingsActivity)resumed=a;}
    public void onActivityCreated(Activity a,Bundle b){}public void onActivityStarted(Activity a){}
    public void onActivityPaused(Activity a){}public void onActivityStopped(Activity a){}
    public void onActivitySaveInstanceState(Activity a,Bundle b){}public void onActivityDestroyed(Activity a){}
}
