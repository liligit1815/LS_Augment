package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Current scene settings, public folds, retired option absence and real layout boundaries. */
final class IslandSettingsUiCases {
    private static final String ROUTE="group/notifications/island";
    private final Instrumentation test;
    private final Context context;
    private final JSONArray screenshots=new JSONArray();
    private final JSONArray settings=new JSONArray();
    private Activity activity;private File directory;private int checks;
    IslandSettingsUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new IslandSettingsUiCases(test).execute();}
    @SuppressWarnings("unchecked") private JSONObject execute()throws Exception {
        AppConfig config=new AppConfig(context);Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        try {
            activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target","notifications").putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();directory=new File(context.getExternalFilesDir(null),"island-settings-ui-"+BuildConfig.VERSION_CODE+"-"+activity.getResources().getConfiguration().fontScale);directory.mkdirs();
            float gap=main(()->{
                Map<String,View> controls=(Map<String,View>)get(activity,"controls");
                require(ROUTE.equals(ModuleNavigation.route(activity)),"current route");
                require(((FieldEditQueue)get(activity,"pending")).restorableValues().isEmpty(),"no browsing writes");
                require(tag("navigation:native-island-settings")==null,"retired OEM settings entry removed");
                View feature=tag("native-feature:systemui:island_enabled");
                require(feature!=null&&((ViewGroup)feature).getChildAt(1).getVisibility()==View.GONE,"master starts collapsed");
                for(String retired:new String[]{"ls_augment_island_custom_appearance","ls_augment_rm_island_width","ls_augment_rm_island_height","ls_augment_rm_island_offset_x","ls_augment_rm_island_offset_y","ls_augment_rm_island_transparent","ls_augment_rm_island_app_style",NativeIslandSceneOptions.key("media"),NativeIslandSceneOptions.key("charging")}) {
                    require(!controls.containsKey(retired),"retired UI removed "+retired);
                    require(!ConfigSchema.runtimeDefaults().containsKey(retired),"retired execution removed "+retired);
                }
                java.lang.reflect.Method reason=activity.getClass().getDeclaredMethod("islandSceneUnavailable",String.class);reason.setAccessible(true);
                java.lang.reflect.Method help=activity.getClass().getDeclaredMethod("islandSceneHelp",String.class);help.setAccessible(true);
                for(IslandSceneRegistry.Scene scene:IslandSceneRegistry.scenes()){
                    require(controls.get(scene.key) instanceof Switch,"actual scene control "+scene.id);
                    String text=(String)help.invoke(activity,scene.id);require(text!=null&&!text.isBlank(),"scene has current help "+scene.id);
                    Switch control=(Switch)controls.get(scene.key);
                    settings.put(new JSONObject().put("id",scene.id).put("title",scene.title).put("key",scene.key)
                            .put("saved",before.get(scene.key)).put("enabled",control.isEnabled()).put("unavailable",reason.invoke(activity,scene.id)).put("help",text));
                }
                require(controls.containsKey(IslandNoticeBlacklist.KEY),"ordinary blacklist exists");
                require(controls.containsKey(IslandNoticeRules.KEY),"channel exceptions preserved");
                View path=tag("page-path"),first=tag("native-feature:systemui:island_status_avoidance");
                float distance=(top(first)-top(path)-path.getHeight())/activity.getResources().getDisplayMetrics().density;
                require(distance>=8&&distance<=12,"navigation gap 8-12dp: "+distance);return distance;
            });
            capture("01-collapsed");
            main(()->{View arrow=description(root(),"展开红魔Duo灵动岛配置");require(arrow!=null&&arrow.isEnabled(),"enabled master fold");arrow.performClick();return null;});
            settle();main(()->{
                for(String group:new String[]{"系统活动","通知与传输","通话录音与AI","出行与生活服务"})require(description(root(),"展开"+group)!=null,"group begins collapsed "+group);
                description(root(),"展开通知与传输").performClick();return null;
            });
            capture("02-notification-group");
            main(()->{View expand=description(root(),"展开普通通知配置");require(expand!=null&&expand.isEnabled(),"ordinary notices enabled for validation");expand.performClick();return null;});
            settle();main(()->{View blacklist=tag("island-notice-blacklist");require(blacklist!=null&&blacklist.isShown(),"blacklist belongs to ordinary notices");blacklist.requestRectangleOnScreen(new android.graphics.Rect(0,0,blacklist.getWidth(),blacklist.getHeight()),true);return null;});
            capture("03-blacklist");
            main(()->{require(((FieldEditQueue)get(activity,"pending")).restorableValues().isEmpty(),"fold operations never save configuration");return null;});
            return new JSONObject().put("success",true).put("checks",checks).put("gapDp",gap).put("fontScale",activity.getResources().getConfiguration().fontScale).put("screenshots",screenshots).put("settings",settings).put("directory",directory.getAbsolutePath());
        } finally {
            if(activity!=null)main(()->{activity.finish();return null;});test.waitForIdleSync();require(before.equals(config.snapshot()),"configuration unchanged");
        }
    }
    private View root(){return activity.getWindow().getDecorView();}
    private View tag(String tag){return root().findViewWithTag(tag);}
    private static int top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private static View description(View view,String text){if(text.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=description(((ViewGroup)view).getChildAt(i),text);if(found!=null)return found;}return null;}
    private static Object get(Object object,String name)throws Exception{Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(object);}
    private void settle()throws Exception{
        test.waitForIdleSync();long deadline=SystemClock.uptimeMillis()+3000;
        while(!main(()->activity.hasWindowFocus()&&root().isShown())){
            require(SystemClock.uptimeMillis()<deadline,"Island window is foreground before measuring");SystemClock.sleep(30);
        }
        CountDownLatch frames=new CountDownLatch(1);
        main(()->{root().postDelayed(()->root().postOnAnimation(()->root().postOnAnimation(frames::countDown)),300);return null;});
        require(frames.await(3,TimeUnit.SECONDS),"Page transitions and layout settled");test.waitForIdleSync();
    }
    private void capture(String name)throws Exception{
        settle();capturePhysical(name);
    }
    private void capturePhysical(String name)throws Exception{
        Bitmap bitmap=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();
        require(bitmap!=null,"Physical device screenshot is available");File output=new File(directory,name+".png");
        try(FileOutputStream out=new FileOutputStream(output)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}
        finally{bitmap.recycle();}screenshots.put(output.getAbsolutePath());
    }
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable error){failure.set(error);}});if(failure.get()!=null)throw new AssertionError("Island UI action failed",failure.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
}
