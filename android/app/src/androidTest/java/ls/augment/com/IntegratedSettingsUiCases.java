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
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Inspects the five changed pages without applying icons, sound, install rules, windows or QS tiles. */
final class IntegratedSettingsUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String[][] PAGES={
            {"launcher","系统桌面","launcher","launcher_custom"},
            {"systemui","系统界面","quicksettings_more","extra_dim"},
            {"system","系统框架","freeform","freeform"},
            {"system","系统框架","audio","audio_gain"},
            {"system","系统框架","installer","signature_install"}};
    private final Instrumentation test;
    private final Context context;
    private final boolean layoutOnly,landscape;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray screenshots=new JSONArray(),pages=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private int checks,aliasesChecked,alignedSwitches,foldsChecked;
    private float maxSwitchSpreadDp;
    private boolean landscapeRecreated,launcherResultForwarded;
    private IntegratedSettingsUiCases(Instrumentation test,boolean layoutOnly,boolean landscape){this.test=test;context=test.getTargetContext();this.layoutOnly=layoutOnly||landscape;this.landscape=landscape;}
    static JSONObject run(Instrumentation test,boolean layoutOnly,boolean landscape)throws Exception{return new IntegratedSettingsUiCases(test,layoutOnly,landscape).execute();}

    private JSONObject execute()throws Exception{
        directory=new File(context.getExternalFilesDir(null),"integrated-settings-ui-"+BuildConfig.VERSION_CODE);
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory is available");
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,Map<String,?>> stores=new LinkedHashMap<>();
        for(String name:Arrays.asList(AppConfig.PREFS,"native_launcher_drafts","native_value_overrides"))stores.put(name,new LinkedHashMap<>(context.getSharedPreferences(name,0).getAll()));
        require(stores.get("native_launcher_drafts").isEmpty(),"Read-only test requires no pending user icon/name drafts");
        Boolean tileBefore=ExtraDimTilePreference.isPresent(context);
        SharedPreferences consent=context.getSharedPreferences("ls_augment_consent",0);
        Object accepted=consent.getAll().get("accepted_version"),marker=consent.getAll().get("ui_navigation_test");
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            require(consent.edit().putInt("accepted_version",ModuleLegal.VERSION).putBoolean("ui_navigation_test",true).commit(),"Test consent is prepared");
            test.startActivitySync(new Intent(context,SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            Activity home=await("home");int index=1;
            for(String[] spec:PAGES){
                clickText(home,spec[1]);
                Activity openedDirectory=await("target-"+spec[0]);
                Activity parent=landscape?landscapePage(openedDirectory,"target-"+spec[0]):openedDirectory;settle();
                String group="group/"+spec[0]+"/"+spec[2],route=destination(spec);
                checkDirectory(parent,spec,group);
                clickTag(parent,"navigation:"+group);
                Activity opened=await(route),page=landscape?landscapePage(opened,route):opened;settle();
                JSONObject measured=checkPage(page,spec,before);
                capture(String.format(java.util.Locale.ROOT,"%02d-%s-top",index,spec[3]));
                checkExpandedContent(page,spec,index);
                unchanged(config,before,stores);
                if(!layoutOnly&&"launcher_custom".equals(spec[3]))checkLauncherDocumentCancellation(page);
                if(!layoutOnly){page=recreate(page,route);settle();checkPage(page,spec,before);measured.put("recreated",true);}
                captureBottom(page,spec,index,measured);pages.put(measured);index++;
                clickTag(page,"breadcrumb:target-"+spec[0]);Activity returnedParent=await("target-"+spec[0]);
                require(landscape||returnedParent==parent,"Breadcrumb returns to existing application directory: "+route);
                clickTag(returnedParent,"breadcrumb:home");home=await("home");
                if(!layoutOnly){
                    final Activity owner=home;
                    onMain(()->{ModuleNavigation.open(owner,spec[3]);return null;});Activity alias=await(route);settle();checkDestination(alias,spec);aliasesChecked++;
                    clickTag(alias,"breadcrumb:home");home=await("home");
                    Activity directOwner=home;onMain(()->{directOwner.startActivity(legacyIntent(directOwner,spec[3]));return null;});
                    Activity legacy=await(route);settle();checkDestination(legacy,spec);aliasesChecked++;
                    clickTag(legacy,"breadcrumb:target-"+spec[0]);Activity restored=await("target-"+spec[0]);checkDirectory(restored,spec,group);
                    clickTag(restored,"breadcrumb:home");home=await("home");
                }
                unchanged(config,before,stores);
            }
        }catch(Throwable error){failure=error;try{capture("failure");}catch(Throwable captureError){error.addSuppressed(captureError);}}
        finally{
            try{
                onMain(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed())activity.finish();return null;});settle();
                app.unregisterActivityLifecycleCallbacks(this);
                SharedPreferences.Editor restore=consent.edit().remove("accepted_version").remove("ui_navigation_test");
                if(accepted instanceof Integer)restore.putInt("accepted_version",(Integer)accepted);if(marker instanceof Boolean)restore.putBoolean("ui_navigation_test",(Boolean)marker);
                require(restore.commit(),"Original consent is restored");unchanged(config,before,stores);
                require(java.util.Objects.equals(tileBefore,ExtraDimTilePreference.isPresent(context)),"QS tile membership remains unchanged");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
        }
        JSONObject report=new JSONObject().put("success",failure==null).put("version",BuildConfig.VERSION_NAME)
                .put("checks",checks).put("aliasesChecked",aliasesChecked).put("layoutOnly",layoutOnly)
                .put("landscapeRequested",landscape).put("landscapeRecreated",landscapeRecreated)
                .put("alignedSwitches",alignedSwitches).put("maximumSwitchRightSpreadDp",maxSwitchSpreadDp)
                .put("foldsChecked",foldsChecked).put("launcherResultForwarded",launcherResultForwarded)
                .put("configurationUnchanged",before.equals(config.snapshot())).put("pages",pages).put("screenshots",screenshots);
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Integrated settings UI regression failed",failure);return report;
    }

    private void unchanged(AppConfig config,Map<String,String> before,Map<String,Map<String,?>> stores){
        require(before.equals(config.snapshot()),"Every saved feature value is unchanged");
        for(Map.Entry<String,Map<String,?>> entry:stores.entrySet())require(entry.getValue().equals(context.getSharedPreferences(entry.getKey(),0).getAll()),"Exact original preference storage remains unchanged: "+entry.getKey());
    }
    private static String destination(String[] spec){return "freeform".equals(spec[3])?"freeform":"group/"+spec[0]+"/"+spec[2];}
    private static Intent legacyIntent(Activity owner,String entry){
        if("launcher_custom".equals(entry))return new Intent(owner,LauncherCustomizationActivity.class);
        if("extra_dim".equals(entry))return new Intent(owner,ExtraDimSettingsActivity.class);
        return new Intent(owner,FeatureActivity.class).putExtra(FeatureActivity.EXTRA_MODULE,entry);
    }
    private void checkDirectory(Activity page,String[] spec,String group)throws Exception{settle();onMain(()->{
        require(page instanceof EnhancementSettingsActivity&&("target-"+spec[0]).equals(ModuleNavigation.route(page)),"Home opens the expected second-level directory");
        require(tag(page,"navigation:"+group)!=null,"Existing group is still a directory entry: "+group);
        require(tag(page,"navigation:"+spec[3])==null,"Directory does not duplicate the moved feature entry");
        gap(page,tag(page,"application-groups:"+spec[0]));return null;
    });}
    private void checkDestination(Activity page,String[] spec)throws Exception{onMain(()->{
        String route=destination(spec);require(route.equals(ModuleNavigation.route(page)),"Expected route: "+route);
        require("freeform".equals(spec[3])?page instanceof FeatureActivity:page instanceof EnhancementSettingsActivity,"Old editor resolves to the intended third-level host: "+spec[3]);
        List<String> path=Arrays.asList("home","target-"+spec[0],route);int count=0;
        for(View view:all(page.getWindow().getDecorView()))if(view.getTag() instanceof String&&((String)view.getTag()).startsWith("breadcrumb:"))count++;
        require(count==3,"Page has exactly three breadcrumb levels: "+route);
        for(String item:path)require(tag(page,"breadcrumb:"+item)!=null,"Breadcrumb includes "+item);
        if(!"freeform".equals(spec[3]))require(tag(page,"navigation:"+spec[3])==null&&tag(page,"inline-editor:"+spec[3])!=null,"Moved editor is inline and has no fourth-level navigation: "+spec[3]);
        return null;
    });}
    private JSONObject checkPage(Activity page,String[] spec,Map<String,String> before)throws Exception{
        checkDestination(page,spec);
        if("launcher_custom".equals(spec[3])){
            long deadline=SystemClock.uptimeMillis()+8000;
            while(SystemClock.uptimeMillis()<deadline&&!onMain(()->tag(page,"config:"+ConfigSchema.LAUNCHER_OVERRIDES).isEnabled()))SystemClock.sleep(25);
            require(onMain(()->tag(page,"config:"+ConfigSchema.LAUNCHER_OVERRIDES).isEnabled()),"Launcher finishes its saved-state barrier before layout checks");
        }
        return onMain(()->{
            String route=destination(spec);View root=page.getWindow().getDecorView();float density=page.getResources().getDisplayMetrics().density;
            View card="freeform".equals(spec[3])?tag(page,"freeform-controls"):tag(page,"application-category:"+spec[0]+":"+spec[2]);
            if(card==null&&"freeform".equals(spec[3]))card=find(root,LiquidGlassLayout.class);
            float gap=gap(page,card);int rows=0;float low=Float.MAX_VALUE,high=-Float.MAX_VALUE;
            for(View view:all(root))if("feature-row".equals(view.getTag())){
                Switch toggle=find(view,Switch.class);if(toggle==null||!shownThroughAncestors(toggle))continue;
                require(view.getHeight()/density>=43.5f,"Feature row preserves its 44dp touch target");
                require(Math.abs(toggle.getWidth()/density-46)<1,"Every switch has shared 46dp width");
                require(Math.abs(toggle.getTrackDrawable().getIntrinsicHeight()/density-28)<1,"Every switch uses shared 28dp track");
                ViewGroup row=(ViewGroup)view;View tail=row.getChildAt(row.getChildCount()-1);
                require(tail!=toggle&&Math.abs(tail.getWidth()/density-25)<1,"The 25dp disclosure column remains after the switch");
                float right=left(toggle)+toggle.getWidth();low=Math.min(low,right);high=Math.max(high,right);rows++;
            }
            require(rows>0,"Third-level page contains functional controls: "+route);
            float spread=(high-low)/density;require(spread<=1,"Switches share one right edge: "+route+" = "+spread+"dp");
            alignedSwitches+=rows;maxSwitchSpreadDp=Math.max(maxSwitchSpreadDp,spread);
            if("freeform".equals(spec[3])){
                require(rows==4,"Small-window page exposes exactly its four existing functions");
                int cards=0;for(View view:all(root))if(view instanceof LiquidGlassLayout)cards++;
                require(cards==1,"Small-window functions share one public card");
                for(String key:Arrays.asList(ConfigSchema.FREEFORM_GAME_LOGIN,ConfigSchema.FREEFORM_EXTERNAL_APPS,AppConfig.FREEFORM_UNLIMITED,AppConfig.FREEFORM_ALL_APPS))checkSavedSwitch(page,key,before);
                FeatureEditorController editor=featureEditor(page,spec[3]);
                Map<?,?> inputs=(Map<?,?>)get(editor,"inputs");
                require(!inputs.containsKey(ConfigSchema.FREEFORM_GAME_APPS)&&inputs.containsKey(AppConfig.FREEFORM_EXCLUDED_APPS),"Login has no game list; native-window exceptions remain editable");
            }else if("audio_gain".equals(spec[3])){
                checkSavedSwitch(page,ConfigSchema.AUDIO_GAIN_ENABLED,before);
                Map<?,?> sliders=(Map<?,?>)get(featureEditor(page,spec[3]),"sliders");
                require(sliders.containsKey(ConfigSchema.AUDIO_GAIN_STEP)&&sliders.size()==10,"Audio editor retains its step plus nine per-output gain limits");
            }else if("signature_install".equals(spec[3]))checkSavedSwitch(page,AppConfig.ALLOW_SIGNATURE_MISMATCH,before);
            else if("extra_dim".equals(spec[3]))require(tag(page,"extra-dim-tile") instanceof Switch,"Real QS membership control is inline");
            else if("launcher_custom".equals(spec[3])){
                NativeEditorController editor=editors(page).get("launcher_custom");
                require(editor instanceof LauncherEditorController&&editor.embedded&&editor.owner==page,"Launcher controller is owned by the third-level page");
                require(page instanceof NativeEditorController.Host,"Launcher host forwards document and crop results");
                require(get(editor,"space") instanceof Spinner&&get(editor,"choose") instanceof android.widget.Button,"User-space selector and app picker are retained");
                require(get(editor,"name") instanceof EditText&&get(editor,"image") instanceof ImageView,"Name input and imported-icon control are retained");
                require(((View)get(editor,"image")).hasOnClickListeners(),"Icon import remains actionable");
            }
            return new JSONObject().put("route",route).put("navigationGapDp",gap).put("alignedSwitches",rows).put("switchRightSpreadDp",spread)
                    .put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale).put("orientation",page.getResources().getConfiguration().orientation);
        });
    }
    private void checkSavedSwitch(Activity page,String key,Map<String,String> before){
        View view=tag(page,"config:"+key);require(view instanceof Switch,"Original control remains inline: "+key);
        require(((Switch)view).isChecked()==ConfigSchema.truthy(before.get(key)),"Original control retains its saved state: "+key);
    }

    private void checkExpandedContent(Activity page,String[] spec,int index)throws Exception{
        if("extra_dim".equals(spec[3])||"signature_install".equals(spec[3]))return;
        NativeEditorController editor="launcher_custom".equals(spec[3])?onMain(()->editors(page).get(spec[3])):onMain(()->featureEditor(page,spec[3]));
        boolean launcher=editor instanceof LauncherEditorController;
        List<UiKit.Fold> folds=onMain(()->launcher?Arrays.asList((UiKit.Fold)get(editor,"overrideFold")):new ArrayList<>((List<UiKit.Fold>)get(editor,"folds")));
        String guard=launcher?"bindingGate":"loading";boolean savedGuard=onMain(()->(Boolean)get(editor,guard));
        List<boolean[]> states=new ArrayList<>();for(UiKit.Fold fold:folds)states.add(onMain(()->new boolean[]{fold.control.isChecked(),fold.content.getVisibility()==View.VISIBLE}));
        try{
            onMain(()->{set(editor,guard,true);for(UiKit.Fold fold:folds){
                fold.control.setChecked(false);fold.sync();fold.show(true);require(fold.content.getVisibility()==View.GONE,"Disabled feature cannot expand its parameters");
                fold.control.setChecked(true);fold.sync();require(fold.content.getVisibility()==View.VISIBLE,"Enabling expands parameters inline");
                fold.arrow.performClick();require(fold.control.isChecked()&&fold.content.getVisibility()==View.GONE,"Collapsing preserves enabled state");
                fold.arrow.performClick();require(fold.content.getVisibility()==View.VISIBLE,"Parameters can reopen without navigation");foldsChecked++;
            }return null;});settle();
            capture(String.format(java.util.Locale.ROOT,"%02d-%s-expanded",index,spec[3]));
        }finally{
            onMain(()->{for(int i=0;i<folds.size();i++){UiKit.Fold fold=folds.get(i);fold.control.setChecked(states.get(i)[0]);fold.sync();fold.show(states.get(i)[1]);}set(editor,guard,savedGuard);return null;});settle();
        }
        if(!launcher)require(!(Boolean)onMain(()->get(editor,"dirty")),"Layout-only fold previews schedule no configuration save");
    }

    /** Cancel the real launch request before any external app or user file is opened. */
    private void checkLauncherDocumentCancellation(Activity page)throws Exception{
        NativeEditorController editor=onMain(()->editors(page).get("launcher_custom"));
        String oldPackage=(String)onMain(()->get(editor,"pkg")),oldIcon=(String)onMain(()->get(editor,"icon"));
        final int[] calls={0};final boolean[] hostOwned={false};
        Instrumentation.ActivityMonitor monitor=new Instrumentation.ActivityMonitor(){
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent){
                if(!Intent.ACTION_OPEN_DOCUMENT.equals(intent.getAction()))return null;
                calls[0]++;try{hostOwned[0]="launcher_custom".equals(get(page,"pendingEditor"));}catch(Exception error){throw new AssertionError(error);}
                require("image/*".equals(intent.getType())&&intent.hasCategory(Intent.CATEGORY_OPENABLE),"Launcher requests an image document through its existing import workflow");
                return new Instrumentation.ActivityResult(Activity.RESULT_CANCELED,null);
            }
        };
        test.addMonitor(monitor);
        try{
            onMain(()->{set(editor,"pkg",context.getPackageName());require(((View)get(editor,"image")).performClick(),"Existing image control starts its document request");return null;});
            long deadline=SystemClock.uptimeMillis()+5000;
            while(SystemClock.uptimeMillis()<deadline&&onMain(()->get(page,"pendingEditor"))!=null)SystemClock.sleep(50);
            require(calls[0]==1&&hostOwned[0]&&onMain(()->get(page,"pendingEditor"))==null,"Third-level host owns the editor request and forwards its cancellation");
            require(oldIcon.equals(onMain(()->get(editor,"icon"))),"Cancelled import preserves the original icon");launcherResultForwarded=true;
        }finally{test.removeMonitor(monitor);onMain(()->{set(editor,"pkg",oldPackage);return null;});}
    }

    private void captureBottom(Activity page,String[] spec,int index,JSONObject report)throws Exception{
        onMain(()->{ScrollView scroll=(ScrollView)tag(page,"detail-scroll");require(scroll!=null&&scroll.getChildCount()==1,"Detail page uses the common scroll container");scroll.scrollTo(0,scroll.getChildAt(0).getHeight());return null;});settle();
        onMain(()->{ScrollView scroll=(ScrollView)tag(page,"detail-scroll");View last=null;for(View view:all(scroll))if(shownThroughAncestors(view)&&(view instanceof Switch||view instanceof android.widget.SeekBar||view instanceof android.widget.Button||view instanceof EditText)&&view.getHeight()>0)last=view;
            require(last!=null,"Last feature control is available");Rect visible=new Rect();require(last.getGlobalVisibleRect(visible)&&visible.height()>=last.getHeight()-1,"Last feature control remains reachable at the bottom");
            report.put("bottomScrollY",scroll.getScrollY()).put("lastFeatureFullyVisible",true);return null;});
        capture(String.format(java.util.Locale.ROOT,"%02d-%s-bottom",index,spec[3]));
    }
    private float gap(Activity page,View first){
        View path=tag(page,"page-path");require(first!=null&&path!=null,"Actual content and breadcrumb bounds are present");
        float gap=(top(first)-top(path)-path.getHeight())/page.getResources().getDisplayMetrics().density;
        require(gap>=7.5f&&gap<=12.5f,"Breadcrumb-to-first-content gap is 8–12dp: "+gap);
        View current=tag(page,"breadcrumb:"+ModuleNavigation.route(page));Rect visible=new Rect();
        require(current!=null&&current.getGlobalVisibleRect(visible)&&visible.width()>=current.getWidth()-1,"Current breadcrumb remains fully visible");return gap;
    }
    private Activity recreate(Activity original,String route)throws Exception{onMain(()->{original.recreate();return null;});return awaitReplacement(original,route,false);}
    private Activity landscapePage(Activity original,String route)throws Exception{
        boolean changed=onMain(()->original.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE);
        onMain(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
        Activity result=changed?awaitReplacement(original,route,true):original;landscapeRecreated|=result!=original;
        require(onMain(()->result.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE),"Landscape is applied before measuring: "+route);return result;
    }
    private Activity awaitReplacement(Activity original,String route,boolean landscapeExpected){long deadline=SystemClock.uptimeMillis()+15000;while(SystemClock.uptimeMillis()<deadline){Activity candidate=resumed;if(candidate!=null&&candidate!=original&&!candidate.isFinishing()&&route.equals(ModuleNavigation.route(candidate))&&(!landscapeExpected||candidate.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE))return candidate;SystemClock.sleep(50);}throw new AssertionError("Recreated page not resumed: "+route);}
    private static FeatureEditorController featureEditor(Activity page,String route)throws Exception{return page instanceof FeatureActivity?(FeatureEditorController)get(page,"editor"):(FeatureEditorController)editors(page).get(route);}
    private static Map<String,NativeEditorController> editors(Activity page)throws Exception{return (Map<String,NativeEditorController>)get(page,"editors");}
    private static Object get(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private static void set(Object owner,String name,Object value)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);field.set(owner,value);}
    private static View tag(Activity page,String value){return page.getWindow().getDecorView().findViewWithTag(value);}
    private static float top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private static float left(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[0];}
    private static List<View> all(View root){List<View> result=new ArrayList<>();result.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)result.addAll(all(((ViewGroup)root).getChildAt(i)));return result;}
    private static <T extends View>T find(View root,Class<T> type){for(View view:all(root))if(type.isInstance(view))return type.cast(view);return null;}
    private static boolean shownThroughAncestors(View view){while(view!=null){if(view.getVisibility()!=View.VISIBLE)return false;view=view.getParent() instanceof View?(View)view.getParent():null;}return true;}
    private void clickTag(Activity page,String value)throws Exception{onMain(()->{View view=tag(page,value);require(view!=null&&view.performClick(),"Click "+value);return null;});}
    private void clickText(Activity page,String value)throws Exception{onMain(()->{View found=null;for(View view:all(page.getWindow().getDecorView()))if(view instanceof TextView&&value.contentEquals(((TextView)view).getText())){found=view;break;}while(found!=null&&!found.isClickable())found=found.getParent() instanceof View?(View)found.getParent():null;require(found!=null&&found.performClick(),"Click "+value);return null;});}
    private Activity await(String route){long deadline=SystemClock.uptimeMillis()+15000;while(SystemClock.uptimeMillis()<deadline){Activity page=resumed;if(page!=null&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(50);}throw new AssertionError("Timed out awaiting "+route);}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(250);}
    private void capture(String name)throws Exception{settle();Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot is available");File file=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}screenshots.put(file.getAbsolutePath());}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return value.get();}
    @Override public void onActivityCreated(Activity page,Bundle state){activities.add(page);page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);if(page instanceof SettingsActivity)try{set(page,"environmentLoading",true);set(page,"requestedRoot",true);}catch(Exception error){throw new AssertionError(error);}}
    @Override public void onActivityResumed(Activity page){resumed=page;}
    @Override public void onActivityPaused(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityDestroyed(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityStarted(Activity page){}
    @Override public void onActivityStopped(Activity page){}
    @Override public void onActivitySaveInstanceState(Activity page,Bundle state){}
}
