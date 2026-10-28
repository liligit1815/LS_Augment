package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.KeyguardManager;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.SystemClock;
import android.os.PowerManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Inspects real desktop pages and layout bounds without changing any feature. */
final class LauncherFeaturesUiCases {
    static JSONObject run(Instrumentation test) throws Exception {
        Context context=test.getTargetContext();
        check(context.getSystemService(PowerManager.class).isInteractive(),"Unlock the device and keep its screen on before inspecting the UI");
        check(!context.getSystemService(KeyguardManager.class).isKeyguardLocked(),"Unlock the device before inspecting the UI");
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,?> rawBefore=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        File directory=new File(context.getExternalFilesDir(null),"launcher-features-ui-"+BuildConfig.VERSION_CODE);
        if(!directory.isDirectory()&&!directory.mkdirs())throw new AssertionError("Screenshot directory unavailable");
        JSONArray pages=new JSONArray();
        String[] sections={"desktop_clock","dock_glass","launcher_grid","recents_privacy"};
        String[] titles={"桌面组件","Dock","桌面布局与页面","隐私屏"};
        String[] featureTitles={"允许修改小组件大小","解除Dock栏应用数量限制","强制新装APP图标显示在桌面末页","启用隐私屏"};
        String[] filenames={"widgets","dock","layout","privacy"};
        String[] switches={LauncherOptions.WIDGET_RESIZE,LauncherOptions.DOCK_UNLIMITED,LauncherOptions.NEW_APPS_LAST_PAGE,RecentsPrivacyOptions.ENABLED};
        String[] routes=new String[sections.length];for(int i=0;i<sections.length;i++)routes[i]="group/desktop/"+sections[i];
        for(int i=0;i<routes.length;i++){
            Activity activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target","desktop").putExtra(ModuleNavigation.EXTRA_ROUTE,routes[i]).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            try{
                SystemClock.sleep(220);test.waitForIdleSync();
                int index=i;AtomicReference<JSONObject> measured=new AtomicReference<>();
                AtomicReference<Throwable> error=new AtomicReference<>();
                test.runOnMainSync(()->{try{
                    View root=activity.getWindow().getDecorView();
                    View path=root.findViewWithTag("page-path");
                    View heading=root.findViewWithTag("section-title:"+titles[index]);
                    if(heading==null)heading=root.findViewWithTag("application-category:desktop:"+sections[index]);
                    View toggle=root.findViewWithTag("config:"+switches[index]);
                    check(path!=null&&heading!=null,"Real page exposes shared path and first content boundary");
                    check(toggle instanceof CompoundButton,"New desktop feature has a real switch");
                    check(((CompoundButton)toggle).isChecked()==ConfigSchema.truthy(before.get(switches[index])),"Opening the page preserves the switch");
                    check(findText(root,featureTitles[index])!=null,"Requested feature title is visible");
                    if(index==1)check(root.findViewWithTag("config:"+LauncherGridSpec.ENABLED)==null,"Dock capacity appears in the Dock section without the grid editor");
                    if(index==2){
                        check(root.findViewWithTag("config:"+LauncherOptions.DOCK_UNLIMITED)==null,"Dock capacity is absent from desktop layout and pages");
                        check(root.findViewWithTag("launcher-grid-editor")!=null,"Grid configuration remains available in its original page");
                        check(root.findViewWithTag("launcher-grid-runtime")==null,"Custom layout has no runtime description or placeholder");
                        check(findText(root,"修改会自动保存，重启系统桌面后生效。下方是布局示意，格数表示桌面页面的图标位置。") == null,"Grid editor removes the explanatory small text");
                    }
                    int[] p=new int[2],h=new int[2];path.getLocationOnScreen(p);heading.getLocationOnScreen(h);
                    float density=activity.getResources().getDisplayMetrics().density;
                    float gap=(h[1]-p[1]-path.getHeight())/density;
                    check(gap>=8f-.5f&&gap<=12f+.5f,"Path-to-first-content gap is 8–12dp: "+gap);
                    measured.set(new JSONObject().put("route",routes[index]).put("title",titles[index])
                            .put("density",density).put("fontScale",activity.getResources().getConfiguration().fontScale)
                            .put("gapDp",gap).put("pathBottom",p[1]+path.getHeight()).put("headingTop",h[1])
                            .put("switchChecked",((CompoundButton)toggle).isChecked()));
                }catch(Throwable failure){error.set(failure);}});
                if(error.get()!=null)throw new AssertionError("Desktop feature UI inspection failed",error.get());
                File file=new File(directory,filenames[i]+".png");
                capture(test,file);
                test.runOnMainSync(()->{
                    View root=activity.getWindow().getDecorView();
                    View toggle=root.findViewWithTag("config:"+switches[index]);
                    toggle.requestRectangleOnScreen(new Rect(0,0,toggle.getWidth(),toggle.getHeight()),true);
                });
                test.waitForIdleSync();SystemClock.sleep(100);
                test.runOnMainSync(()->{try{
                    View root=activity.getWindow().getDecorView();
                    TextView label=findText(root,featureTitles[index]);
                    View toggle=root.findViewWithTag("config:"+switches[index]);
                    Rect bounds=new Rect();
                    check(label.getGlobalVisibleRect(bounds)&&bounds.height()==label.getHeight(),"New feature title is fully visible after scrolling");
                    check(toggle.getGlobalVisibleRect(bounds)&&bounds.height()==toggle.getHeight(),"New feature switch is fully visible after scrolling");
                }catch(Throwable failure){error.set(failure);}});
                if(error.get()!=null)throw new AssertionError("Desktop feature visibility inspection failed",error.get());
                File control=new File(directory,filenames[i]+"-control.png");capture(test,control);
                pages.put(measured.get().put("screenshot",file.getAbsolutePath()).put("controlScreenshot",control.getAbsolutePath()));
            }finally{test.runOnMainSync(activity::finish);test.waitForIdleSync();}
        }
        check(before.equals(config.snapshot()),"Desktop UI inspection preserves configuration");
        check(rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Desktop UI inspection preserves raw preferences");
        return new JSONObject().put("success",true).put("configurationUnchanged",true).put("rawPreferencesUnchanged",true).put("pages",pages);
    }
    private static void capture(Instrumentation test,File file)throws Exception{
        Bitmap bitmap=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();
        check(bitmap!=null,"Device screenshot is available");
        try(FileOutputStream out=new FileOutputStream(file)){check(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}
        finally{bitmap.recycle();}
    }
    private static TextView findText(View view,String text){
        if(view instanceof TextView&&text.contentEquals(((TextView)view).getText()))return (TextView)view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            TextView found=findText(((ViewGroup)view).getChildAt(i),text);if(found!=null)return found;
        }
        return null;
    }
    private static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
