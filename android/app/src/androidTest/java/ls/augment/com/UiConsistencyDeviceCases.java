package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Read-only audit of the production controls; revealing a View never toggles a feature. */
final class UiConsistencyDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private final JSONArray pages=new JSONArray();
    private int checks;
    private File directory;
    private Activity activity;
    private boolean competitiveOnly;
    private UiConsistencyDeviceCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new UiConsistencyDeviceCases(test).execute();}
    static JSONObject runCompetitive(Instrumentation test)throws Exception{UiConsistencyDeviceCases cases=new UiConsistencyDeviceCases(test);cases.competitiveOnly=true;return cases.execute();}
    private JSONObject execute()throws Exception{
        Map<String,String> before=new LinkedHashMap<>(new AppConfig(context).snapshot());
        directory=new File(context.getExternalFilesDir(null),"ui-consistency-"+BuildConfig.VERSION_CODE+"-font-"+context.getResources().getConfiguration().fontScale);
        require(directory.isDirectory()||directory.mkdirs(),"evidence folder");
        try{
            if(!competitiveOnly){
            for(String route:new String[]{"group/apps/download","group/multitasking/freeform_rules","group/interaction/gestures",
                    "group/interaction/onehand","group/lockscreen/charging","group/lockscreen/lock_clock","group/lockscreen/aod",
                    "group/desktop/recents","group/notifications/notification_clock","group/notifications/center_layout",
                    "group/notifications/notification_display","group/notifications/island","group/lockscreen/liftarc"}){
                activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                        .putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                test.runOnMainSync(()->activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
                settle();inspect(route);close();
            }
            for(String route:new String[]{"store_download","freeform_rules"}){
                activity=test.startActivitySync(new Intent(context,FeatureActivity.class).putExtra("module",route)
                        .putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                test.runOnMainSync(()->activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
                settle();inspect(route);close();
            }
            for(String route:new String[]{"status_arrangement","status_clock","status_notifications","status_metrics","status_network","status_battery","status_icons"}){
                activity=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                test.runOnMainSync(()->activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));settle();inspect(route);close();
            }
            activity=test.startActivitySync(new Intent(context,HealthSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));settle();inspect("health");close();
            }
            activity=test.startActivitySync(new Intent(context,CompetitiveKeySettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));settle();inspect("competitive-key");
            main(()->{
                UiKit ui=new UiKit(activity);
                ParameterSlider high=new ParameterSlider(ui,EnhancementOption.integer("fixture","test","距离","",300,240,600),"300",v->{});
                require(high.bar.getMin()==240&&high.bar.getMax()==600,"slider retains endpoints above platform default maximum");
                high.range(50,100,"");require(high.bar.getMin()==50&&high.bar.getMax()==100,"slider accepts a smaller measured range");
                ParameterSlider fraction=new ParameterSlider(ui,EnhancementOption.decimal("fixture2","test","比例","",1,.5,2),"1",v->{});
                require(fraction.bar.getMin()==50&&fraction.bar.getMax()==200,"fractional endpoints retain hundredth precision");return null;
            });
            final Dialog[] picker={null};main(()->{picker[0]=ColorEditorDialog.show(activity,new UiKit(activity),"颜色选择器","#AA1677D2",v->{});return null;});
            settle();capture("shared-color-picker");main(()->{picker[0].dismiss();return null;});close();
        }finally{close();}
        require(before.equals(new AppConfig(context).snapshot()),"browsing and screenshots preserve configuration");
        JSONObject result=new JSONObject().put("success",true).put("checks",checks).put("pages",pages)
                .put("configurationUnchanged",true).put("expandedScreenshotsAreViewOnly",true)
                .put("directory",directory.getAbsolutePath());
        Files.write(new File(directory,"report.json").toPath(),result.toString(2).getBytes(StandardCharsets.UTF_8));return result;
    }
    private void inspect(String route)throws Exception{
        JSONObject page=main(()->{
            View root=activity.getWindow().getDecorView();float density=activity.getResources().getDisplayMetrics().density;
            require(root.isShown()&&root.getWidth()>0&&activity.hasWindowFocus(),"page is visible and focused: "+route);
            List<View> views=all(root);int sliders=0,choices=0,colors=0,folds=0;
            for(View view:views){
                if(view instanceof SeekBar){sliders++;require(view.getMinimumHeight()/density>=47.9,"48dp slider: "+route);
                    require(((SeekBar)view).getProgressTintList()!=null,"shared slider tint");}
                if(view instanceof Spinner){choices++;require(view.getMinimumHeight()/density>=47.9,"48dp choice: "+route);
                    require(view.getBackground() instanceof IceGlassControlDrawable,"shared choice background");}
                if(view.getTag()!=null&&view.getTag().toString().startsWith("color-picker:"))colors++;
                if(view instanceof ImageButton&&"展开配置".equals(String.valueOf(view.getContentDescription()))){folds++;require(view.getRotation()==0,"entry starts collapsed");}
                if(view instanceof ImageButton)require(!"收起配置".equals(String.valueOf(view.getContentDescription())),"configuration is collapsed on entry: "+route);
                require(!(view instanceof TextView)||!((TextView)view).getText().toString().contains("垂直"),"uniform direction wording");
            }
            if(route.equals("group/interaction/gestures"))require(choices==0,"side editors have no redundant stock dropdown");
            if(route.equals("group/notifications/island")){
                View style=root.findViewWithTag("config:"+SystemUiOptions.ISLAND_APP_STYLE);
                // Spinner tags are optional elsewhere; controls are authoritative in this host.
                Map<?,?> controls=(Map<?,?>)field(activity,"controls");
                require(controls.get(SystemUiOptions.ISLAND_APP_STYLE) instanceof Spinner,"island uses common choice");
                require(controls.get(SystemUiOptions.PREFIX+"island_height") instanceof ParameterSlider,"island size uses slider");
            }
            if(route.equals("health"))for(View view:views)require(!"减少一倍".equals(String.valueOf(view.getContentDescription()))&&!"增加一倍".equals(String.valueOf(view.getContentDescription())),"health has no stepper");
            View path=root.findViewWithTag("page-path");
            JSONObject result=new JSONObject().put("route",route).put("sliders",sliders).put("choices",choices).put("colors",colors).put("collapsedFeatures",folds)
                    .put("density",density).put("fontScale",activity.getResources().getConfiguration().fontScale);
            require(path!=null,"production breadcrumb is present: "+route);
            if(path!=null){
                ScrollView scroll=null;for(View view:views)if(view instanceof ScrollView&&"detail-scroll".equals(view.getTag())){scroll=(ScrollView)view;break;}
                if(scroll!=null&&scroll.getChildCount()>0&&scroll.getChildAt(0) instanceof ViewGroup){
                    ViewGroup content=(ViewGroup)scroll.getChildAt(0);if(content.getChildCount()>0){
                        View first=content.getChildAt(0);int[] p=new int[2],f=new int[2];path.getLocationOnScreen(p);first.getLocationOnScreen(f);
                        float gap=(f[1]-p[1]-path.getHeight())/density;
                        result.put("navigationGapDp",gap);require(gap>=7.8&&gap<=12.2,"navigation content gap: "+route+" = "+gap);
                    }
                }
            }
            return result;
        });
        String name=route.replace('/','-');capture(name+"-collapsed");
        main(()->{
            // Layout fixture only: reveal existing parameter views without changing checked states or drafts.
            for(View view:all(activity.getWindow().getDecorView()))if(view.getVisibility()==View.GONE&&view instanceof LinearLayout)view.setVisibility(View.VISIBLE);
            return null;
        });settle();
        if(route.equals("competitive-key"))main(()->{
            JSONArray headings=new JSONArray();
            for(View view:all(activity.getWindow().getDecorView()))if(view instanceof TextView&&Arrays.asList("上推动作","下拉动作").contains(((TextView)view).getText().toString())){
                View label=(View)view.getParent();View card=(View)label.getParent();
                require(card instanceof LiquidGlassLayout,"direction heading belongs inside its configuration card");
                float gap=(label.getTop()-card.getPaddingTop())/activity.getResources().getDisplayMetrics().density;
                require(gap>=7.8&&gap<=8.2,"direction heading has 8dp inset from card top");
                headings.put(new JSONObject().put("title",((TextView)view).getText()).put("topInsetDp",gap));
            }
            require(headings.length()==2,"both direction card headings checked");page.put("directionHeadings",headings);return null;
        });
        capture(name+"-parameters");pages.put(page);
    }
    private Object field(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private void capture(String name)throws Exception{Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"screenshot");try(FileOutputStream output=new FileOutputStream(new File(directory,name+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}}
    private static List<View> all(View view){List<View> views=new ArrayList<>();views.add(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)views.addAll(all(((ViewGroup)view).getChildAt(i)));return views;}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(350);test.waitForIdleSync();}
    private void close(){if(activity!=null){test.runOnMainSync(activity::finish);activity=null;settle();}}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError(error.get());return result.get();}
}
