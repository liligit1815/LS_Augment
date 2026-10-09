package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Uses production rows and click handlers with seeded in-memory values; never saves a setting. */
final class IslandSettingsUiCases {
    private static final String P=SystemUiOptions.PREFIX+"island_";
    private static final String ROUTE="group/systemui/island";
    private final Instrumentation test;
    private final Context context;
    private final JSONArray screenshots=new JSONArray(),measurements=new JSONArray();
    private Activity activity;
    private File directory;
    private Map<String,String> draft,originalDraft;
    private FieldEditQueue pending;
    private Map<String,View> controls;
    private int checks;
    private IslandSettingsUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new IslandSettingsUiCases(test).execute();}

    @SuppressWarnings("unchecked") private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,?> rawBefore=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        Map<String,?> memoryBefore=new LinkedHashMap<>(context.getSharedPreferences("native_value_overrides",0).getAll());
        try{
            activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target","systemui").putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();
            float fontScale=activity.getResources().getConfiguration().fontScale;
            directory=new File(context.getExternalFilesDir(null),"island-settings-ui-"+BuildConfig.VERSION_CODE+"-font-"+String.format(Locale.ROOT,"%.2f",fontScale));
            require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
            main(()->{
                draft=(Map<String,String>)get(activity,"draft");pending=(FieldEditQueue)get(activity,"pending");
                controls=(Map<String,View>)get(activity,"controls");originalDraft=new LinkedHashMap<>(draft);
                require(ROUTE.equals(ModuleNavigation.route(activity)),"Island opens its single third-level page");
                for(String route:new String[]{"home","target-systemui",ROUTE})require(tag("breadcrumb:"+route)!=null,"Breadcrumb includes "+route);
                require(countTag(root(),"native-feature:systemui:island_enabled")==1,"Island has one master entry");
                require(pending.restorableValues().isEmpty(),"Browsing begins without pending writes");return null;
            });
            measure("saved");capture("01-saved");unchanged(config,before,rawBefore,memoryBefore);

            main(()->{
                draft.put(SystemUiOptions.ISLAND,"0");
                for(String suffix:new String[]{"music","notifications","charging"})draft.put(P+suffix,"1");
                render();
                require(!master().isChecked()&&masterContent().getVisibility()==View.GONE,"Disabled master hides its settings");
                require(!arrow(master()).isEnabled(),"Disabled master cannot expand");
                for(String suffix:new String[]{"enabled","music","notifications","charging"}){
                    String key=P+suffix;
                    require(countTag(root(),"config:"+key)==1,"One switch owns "+key);
                    require(tag("config:"+key) instanceof Switch,"Boolean uses public switch: "+key);
                }
                require(all(root(),Spinner.class).isEmpty(),"Activity choices have no competing dropdown controls");
                noPending();return null;
            });
            settle();measure("disabled");capture("02-disabled");
            main(()->{
                clickSeeded(SystemUiOptions.ISLAND,true);
                require(masterContent().getVisibility()==View.VISIBLE,"Enabling master expands configuration");
                for(String suffix:new String[]{"music","notifications","charging"})require(toggle(P+suffix).isShown(),"Activity source is reachable: "+suffix);
                require(text(root(),"有活动时出现 · 轻点打开 · 长按展开")!=null,"Real event and gesture behavior is stated in place");
                require(!control(P+"width").isShown(),"Geometry is folded by default");
                require(!control(P+"notice_seconds").isShown(),"Notification duration begins in its own fold");
                noPending();return null;
            });
            settle();measure("enabled");checkSwitchGeometry();capture("03-active-sources");

            main(()->{
                Switch notifications=toggle(P+"notifications");
                require(arrow(notifications).performClick(),"Notification duration expands from its source row");
                require(control(P+"notice_seconds").isShown(),"Notification duration appears under notifications");
                String duration=draft.get(P+"notice_seconds");
                clickSeeded(P+"notifications",false);
                require(!control(P+"notice_seconds").isShown()&&!arrow(notifications).isEnabled(),"Disabling notifications hides and locks their parameters");
                require(duration.equals(draft.get(P+"notice_seconds")),"Disabling notifications preserves duration");
                clickSeeded(P+"notifications",true);
                require(control(P+"notice_seconds").isShown(),"Re-enabling notifications reopens their parameters");
                noPending();return null;
            });
            settle();checkSwitchGeometry();capture("04-notification-duration");
            main(()->{
                Switch notifications=toggle(P+"notifications");
                require(arrow(notifications).performClick(),"Notification parameters collapse independently");
                require(notifications.isChecked()&&!control(P+"notice_seconds").isShown(),"Collapsing parameters keeps notification activity enabled");
                for(String suffix:new String[]{"music","charging"}){
                    clickSeeded(P+suffix,false);require(!toggle(P+suffix).isChecked(),"Source can be independently disabled: "+suffix);
                    require(master().isChecked()&&notifications.isChecked(),"Source switch preserves master and notifications: "+suffix);
                    clickSeeded(P+suffix,true);
                }
                View geometry=description(root(),"展开大小与位置");require(geometry!=null&&geometry.performClick(),"Geometry uses a single in-page fold");
                for(String suffix:new String[]{"width","height","offset_x"})require(control(P+suffix).isShown(),"Geometry control is reachable: "+suffix);
                noPending();return null;
            });
            settle();capture("05-geometry-top");
            main(()->{ScrollView scroll=first(root(),ScrollView.class);require(scroll!=null,"Expanded page remains scrollable");scroll.fullScroll(View.FOCUS_DOWN);return null;});
            settle();
            capture("06-geometry-bottom");
            main(()->{
                float density=activity.getResources().getDisplayMetrics().density;
                for(String suffix:new String[]{"width","height","offset_x","notice_seconds"}){
                    View field=control(P+suffix);require(field instanceof EditText,"Numeric parameter remains a native input: "+suffix);
                    if(field.isShown()){
                        EditText input=(EditText)field;
                        JSONObject bounds=new JSONObject().put("input",suffix).put("heightPx",field.getHeight())
                                .put("measuredHeightPx",field.getMeasuredHeight()).put("density",density)
                                .put("heightDp",field.getHeight()/density).put("textMinHeightPx",input.getMinHeight())
                                .put("viewMinimumHeightPx",field.getMinimumHeight()).put("minLines",input.getMinLines())
                                .put("maxLines",input.getMaxLines()).put("layoutHeight",field.getLayoutParams().height)
                                .put("layoutRequested",field.isLayoutRequested()).put("attached",field.isAttachedToWindow());
                        measurements.put(bounds);
                        require(field.getHeight()/density>=47.5f,"Visible input keeps a 48dp touch target: "+bounds);
                    }
                }return null;
            });
            main(()->{
                ScrollView scroll=first(root(),ScrollView.class);scroll.scrollTo(0,0);
                require(arrow(master()).performClick(),"Master parameters collapse");
                require(master().isChecked()&&masterContent().getVisibility()==View.GONE,"Collapsing configuration leaves island enabled");
                require(arrow(master()).performClick(),"Master parameters reopen");
                Map<String,String> parameters=new LinkedHashMap<>();
                for(String suffix:new String[]{"width","height","offset_x","notice_seconds","music","notifications","charging"})parameters.put(P+suffix,draft.get(P+suffix));
                clickSeeded(SystemUiOptions.ISLAND,false);
                require(masterContent().getVisibility()==View.GONE&&!arrow(master()).isEnabled(),"Disabling island collapses all settings");
                for(Map.Entry<String,String> entry:parameters.entrySet())require(entry.getValue().equals(draft.get(entry.getKey())),"Disabling island preserves "+entry.getKey());
                noPending();return null;
            });
            settle();measure("disabled-after-use");capture("07-disabled-preserves-values");
            unchanged(config,before,rawBefore,memoryBefore);
            return new JSONObject().put("success",true).put("checks",checks).put("route",ROUTE)
                    .put("fontScale",fontScale).put("density",activity.getResources().getDisplayMetrics().density)
                    .put("settingsUnchanged",true).put("rawSettingsUnchanged",true).put("memoryUnchanged",true)
                    .put("measurements",measurements).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        }finally{
            if(activity!=null)main(()->{
                if(originalDraft!=null){draft.clear();draft.putAll(originalDraft);}
                if(pending!=null){((Handler)get(activity,"main")).removeCallbacks((Runnable)get(activity,"autoSave"));for(String key:pending.restorableValues().keySet())pending.invalidate(key);}
                activity.finish();return null;
            });
            test.waitForIdleSync();unchanged(config,before,rawBefore,memoryBefore);
        }
    }

    private void clickSeeded(String key,boolean enabled){
        Switch control=toggle(key);require(control.isChecked()!=enabled,"State transition is exercised: "+key);
        draft.put(key,enabled?"1":"0");
        // CompoundButton toggles and delivers OnCheckedChangeListener before
        // returning View.performClick's result. Without an OnClickListener that
        // result may be false even though the user's switch action succeeded.
        control.performClick();
        require(control.isChecked()==enabled,"Production switch handler reaches requested state: "+key);
        noPending();
    }
    private void noPending(){require(pending.restorableValues().isEmpty(),"In-memory interaction queues no configuration write");}
    private void unchanged(AppConfig config,Map<String,String> before,Map<String,?> rawBefore,Map<String,?> memoryBefore){
        require(before.equals(config.snapshot()),"All saved settings remain unchanged");
        require(rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Raw configuration storage remains unchanged");
        require(memoryBefore.equals(context.getSharedPreferences("native_value_overrides",0).getAll()),"Per-feature memory remains unchanged");
    }
    private void measure(String state)throws Exception{main(()->{
        View path=tag("page-path"),card=tag("application-category:systemui:island");
        require(path!=null&&card!=null,"Common breadcrumb and preference card exist");
        float density=activity.getResources().getDisplayMetrics().density;
        float gap=(top(card)-top(path)-path.getHeight())/density;
        require(gap>=7.5f&&gap<=12.5f,"Navigation-to-card gap is 8–12dp: "+state+" = "+gap);
        measurements.put(new JSONObject().put("state",state).put("contentGapDp",gap));return null;
    });}
    private void checkSwitchGeometry()throws Exception{main(()->{
        float density=activity.getResources().getDisplayMetrics().density,low=Float.MAX_VALUE,high=-Float.MAX_VALUE;
        for(String suffix:new String[]{"enabled","music","notifications","charging"}){
            Switch control=toggle(P+suffix);ViewGroup row=(ViewGroup)control.getParent();
            require(row.getHeight()/density>=43.5f,"Switch row retains 44dp touch target: "+suffix);
            require(Math.abs(control.getWidth()/density-46)<1,"Switch uses common 46dp width: "+suffix);
            int[] position=new int[2];control.getLocationInWindow(position);float right=(position[0]+control.getWidth())/density;
            low=Math.min(low,right);high=Math.max(high,right);
            View tail=row.getChildAt(row.getChildCount()-1);require(Math.abs(tail.getWidth()/density-25)<1,"Action column retains common 25dp width: "+suffix);
        }
        require(high-low<=1,"Master and source switches share a trailing column: "+(high-low));return null;
    });}
    private void render()throws Exception{Method method=activity.getClass().getDeclaredMethod("render",int.class);method.setAccessible(true);method.invoke(activity,0);}
    private View root(){return activity.getWindow().getDecorView();}
    private View tag(String key){return root().findViewWithTag(key);}
    private Switch toggle(String key){View view=tag("config:"+key);require(view instanceof Switch,"Switch exists: "+key);return (Switch)view;}
    private Switch master(){return toggle(SystemUiOptions.ISLAND);}
    private View masterContent(){return ((ViewGroup)tag("native-feature:systemui:island_enabled")).getChildAt(1);}
    private View control(String key){View view=controls.get(key);require(view!=null,"Parameter exists: "+key);return view;}
    private ImageButton arrow(Switch control){ViewGroup row=(ViewGroup)control.getParent();View view=row.getChildAt(row.getChildCount()-1);require(view instanceof ImageButton,"Public fold arrow exists");return (ImageButton)view;}
    private static float top(View view){int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private static TextView text(View view,String label){if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return (TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=text(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;}
    private static View description(View view,String label){if(label.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=description(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;}
    private static int countTag(View view,String label){int count=label.equals(view.getTag())?1:0;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=countTag(((ViewGroup)view).getChildAt(i),label);return count;}
    private static <T extends View>List<T> all(View view,Class<T> type){List<T> found=new ArrayList<>();if(type.isInstance(view))found.add(type.cast(view));if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)found.addAll(all(((ViewGroup)view).getChildAt(i),type));return found;}
    private static <T extends View>T first(View view,Class<T> type){List<T> found=all(view,type);return found.isEmpty()?null:found.get(0);}
    private static Object get(Object object,String name)throws Exception{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(object);}
    private void settle()throws Exception{test.waitForIdleSync();CountDownLatch frames=new CountDownLatch(1);main(()->{root().postOnAnimation(()->root().postOnAnimation(frames::countDown));return null;});require(frames.await(3,TimeUnit.SECONDS),"Page laid out");test.waitForIdleSync();}
    private void capture(String name)throws Exception{settle();Bitmap bitmap=main(()->{View view=root();Bitmap result=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);view.draw(new Canvas(result));return result;});File output=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(output)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}finally{bitmap.recycle();}screenshots.put(output.getAbsolutePath());}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable error){failure.set(error);}});if(failure.get()!=null)throw new AssertionError("Island UI action failed",failure.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
}
