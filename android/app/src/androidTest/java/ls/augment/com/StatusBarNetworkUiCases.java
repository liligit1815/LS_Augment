package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.app.UiAutomation;
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
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
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
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Actual network page bounds and folds; fixture state is seeded in memory without any save. */
final class StatusBarNetworkUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String ROUTE="status_network";
    private static final String[] TITLES={"原生网速字号（0 跟随系统图标）","显示方式","上行标志（留空不显示）","下行标志（留空不显示）","大小（dp）"};
    private static final String[] CONTROLS={TITLES[0],"网速显示方式",TITLES[2],TITLES[3],TITLES[4]};
    private final Instrumentation test;
    private final Context context;
    private final boolean strict,landscape;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray layouts=new JSONArray(),screenshots=new JSONArray(),violations=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private int checks;
    private StatusBarEditorController editor;
    private StatusBarGridSpec originalGrid;
    private String originalPositionOnly;

    private StatusBarNetworkUiCases(Instrumentation test,Bundle arguments){
        this.test=test;context=test.getTargetContext();
        strict=Boolean.parseBoolean(arguments.getString("strict","false"));
        landscape=Boolean.parseBoolean(arguments.getString("landscape","false"));
    }
    static JSONObject run(Instrumentation test,Bundle arguments)throws Exception{
        return new StatusBarNetworkUiCases(test,arguments).execute();
    }

    private JSONObject execute()throws Exception{
        SharedPreferences preferences=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> rawBefore=new LinkedHashMap<>(preferences.getAll());
        directory=new File(context.getExternalFilesDir(null),"statusbar-network-ui");
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            Activity page=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle(page);
            if(landscape){
                Activity original=page;
                boolean already=main(()->original.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE);
                main(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
                if(!already)page=await(original);
                settle(page);
            }
            Activity current=page;
            editor=main(()->(StatusBarEditorController)((Map<?,?>)get(current,"editors")).get(ROUTE));
            require(editor!=null,"Production network editor exists");
            ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");
            originalPositionOnly=draft.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);
            originalGrid=(StatusBarGridSpec)get(editor,"grid");
            require(!draft.hasPending(),"Opening the page queues no editor save");
            require(rawBefore.equals(preferences.getAll()),"Opening the page preserves raw configuration");

            seed(true,false);settle(current);measure(current,"collapsed");capture(current,"01-collapsed");
            main(()->{fold().show(true);require(fold().control.isChecked()&&fold().content.getVisibility()==View.VISIBLE,"Enabled network can expand without changing its switch");return null;});
            settle(current);measure(current,"expanded-top");capture(current,"02-expanded-top");
            main(()->{ScrollView scroll=(ScrollView)get(editor,"configScroll");View last=control(fold().content,4);require(last!=null,"Final network size control exists");Rect rectangle=new Rect(0,0,last.getWidth(),last.getHeight());last.requestRectangleOnScreen(rectangle,true);return null;});
            settle(current);measure(current,"expanded-bottom");capture(current,"03-expanded-bottom");
            main(()->{View last=control(fold().content,4);Rect visible=new Rect();observe(last.getGlobalVisibleRect(visible)&&visible.height()>=last.getHeight()-1,"expanded-bottom","Final size control is fully reachable",new JSONObject().put("visibleHeightPx",visible.height()).put("heightPx",last.getHeight()));fold().show(false);require(fold().control.isChecked()&&fold().content.getVisibility()==View.GONE,"Collapsing retains the enabled state");return null;});
            seed(false,true);settle(current);measure(current,"disabled");capture(current,"04-disabled");
            main(()->{require(!fold().control.isChecked()&&fold().content.getVisibility()==View.GONE&&!fold().arrow.isEnabled(),"Disabled network refuses expansion");return null;});
            require(rawBefore.equals(preferences.getAll()),"All fixture states preserve raw configuration");
        }catch(Throwable error){failure=error;}
        finally{
            try{
                main(()->{
                    if(editor!=null&&originalGrid!=null){
                        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");
                        draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,originalPositionOnly);set(editor,"grid",originalGrid);
                        require(!draft.hasPending(),"Read-only fixture never schedules a write");
                        if(!editor.isDestroyed())invoke(editor,"render");
                    }
                    for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed()&&!activity.isFinishing())activity.finish();
                    return null;
                });test.waitForIdleSync();
                require(rawBefore.equals(preferences.getAll()),"Cleanup leaves raw settings unchanged");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            app.unregisterActivityLifecycleCallbacks(this);
        }
        boolean unchanged=rawBefore.equals(preferences.getAll()),compliant=violations.length()==0;
        JSONObject report=new JSONObject().put("success",failure==null&&(!strict||compliant)).put("compliant",compliant)
                .put("version",BuildConfig.VERSION_NAME).put("versionCode",BuildConfig.VERSION_CODE).put("checks",checks)
                .put("strict",strict).put("landscapeRequested",landscape).put("inMemoryFixtureOnly",true)
                .put("settingsUnchanged",unchanged).put("rawSettingsUnchanged",unchanged)
                .put("layouts",layouts).put("violations",violations).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Network UI read-only checks failed; inspect "+directory,failure);
        if(strict&&!compliant)throw new AssertionError("Network UI spacing violations; inspect "+new File(directory,"report.json"));
        return report;
    }

    private void seed(boolean enabled,boolean requestExpansion)throws Exception{main(()->{
        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");
        StatusBarGridSpec.Item item=originalGrid.get("network");
        set(editor,"grid",originalGrid.with("network",new StatusBarGridSpec.Item(item.zone,item.order,item.size,enabled)));
        invoke(editor,"render");fold().show(requestExpansion);
        require(!draft.hasPending(),"In-memory network fixture queues no save");return null;
    });}

    private void measure(Activity page,String state)throws Exception{main(()->{
        float density=page.getResources().getDisplayMetrics().density;
        View path=page.getWindow().getDecorView().findViewWithTag("page-path"),preview=(View)get(editor,"previewHost");
        require(path!=null&&preview!=null,"Breadcrumb and preview retain layout bounds");
        float gap=(top(preview)-bottom(path))/density;
        observe(range(gap,8,12),state,"Breadcrumb to preview is 8–12dp",new JSONObject().put("gapDp",gap));
        UiKit.Fold fold=fold();ViewGroup networkHeader=(ViewGroup)fold.control.getParent();View outer=(View)getMap(editor,"componentViews","network");
        JSONObject layout=new JSONObject().put("state",state).put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale)
                .put("orientation",page.getResources().getConfiguration().orientation).put("navigationGapDp",gap)
                .put("scrollYDp",((ScrollView)get(editor,"configScroll")).getScrollY()/density)
                .put("path",bounds(path,density)).put("preview",bounds(preview,density)).put("networkCard",bounds(outer,density))
                .put("header",bounds(networkHeader,density)).put("enabled",fold.control.isChecked())
                .put("expanded",fold.content.getVisibility()==View.VISIBLE).put("arrowEnabled",fold.arrow.isEnabled());
        JSONObject networkColumns=columns(networkHeader,density);layout.put("networkColumns",networkColumns);
        ViewGroup.MarginLayoutParams cardMargins=(ViewGroup.MarginLayoutParams)outer.getLayoutParams();
        JSONObject cardSpacing=new JSONObject().put("topPaddingDp",outer.getPaddingTop()/density).put("bottomPaddingDp",outer.getPaddingBottom()/density)
                .put("topMarginDp",cardMargins.topMargin/density).put("bottomMarginDp",cardMargins.bottomMargin/density);
        layout.put("networkCardSpacing",cardSpacing);
        observe(outer.getPaddingTop()==0&&outer.getPaddingBottom()==0&&cardMargins.topMargin==0&&cardMargins.bottomMargin==0,
                state,"Network feature has no extra outer vertical padding or margin",cardSpacing);
        JSONArray referenceColumns=new JSONArray();
        for(View view:all(page.getWindow().getDecorView()))if("feature-row".equals(view.getTag())&&view!=networkHeader&&view.isShown()&&view.getWidth()>0&&view.getHeight()>0){
            View switchView=find(view,Switch.class);if(switchView==null||!(switchView.getTag() instanceof String)||!((String)switchView.getTag()).startsWith("config:"))continue;
            View nativeFeature=ancestor(view,"native-feature:");if(nativeFeature==null)continue;
            JSONObject reference=columns((ViewGroup)view,density);reference.put("feature",nativeFeature.getTag());referenceColumns.put(reference);
            for(String column:new String[]{"helpRightDp","switchRightDp","arrowRightDp"}){
                if(networkColumns.has(column)&&reference.has(column))observe(Math.abs(networkColumns.getDouble(column)-reference.getDouble(column))<=1,state,"Network "+column+" aligns with native feature",new JSONObject().put("feature",nativeFeature.getTag()).put("networkDp",networkColumns.getDouble(column)).put("referenceDp",reference.getDouble(column)));
            }
        }
        require(referenceColumns.length()>0,"Native network features supply a column reference");layout.put("nativeFeatureColumns",referenceColumns);
        observe(networkHeader.getHeight()/density>=43.5f,state,"Network header keeps a 44dp touch target",bounds(networkHeader,density));
        if(fold.content.getVisibility()==View.VISIBLE){
            float indent=(left(fold.content)-left(networkHeader)+fold.content.getPaddingLeft())/density;
            layout.put("body",bounds(fold.content,density)).put("bodyIndentDp",indent);
            observe(Math.abs(indent-12)<=.5f,state,"Expanded network body is indented 12dp",new JSONObject().put("indentDp",indent));
            JSONArray rows=new JSONArray();View previousControl=null;
            for(int i=0;i<TITLES.length;i++){
                TextView label=text(fold.content,TITLES[i]);View value=control(fold.content,i);
                require(label!=null&&value!=null,"Real parameter title and control exist: "+TITLES[i]);
                View header=(View)label.getParent(),group=(View)header.getParent();
                JSONObject row=new JSONObject().put("label",TITLES[i]).put("header",bounds(header,density)).put("control",bounds(value,density)).put("group",bounds(group,density));
                float topPadding=group.getPaddingTop()/density,bottomPadding=group.getPaddingBottom()/density;
                row.put("groupTopPaddingDp",topPadding).put("groupBottomPaddingDp",bottomPadding);
                observe(group!=fold.content&&Math.abs(topPadding-3)<=.5f&&Math.abs(bottomPadding-8)<=.5f,state,"Parameter row uses shared 3dp/8dp spacing: "+TITLES[i],row);
                observe(value.getHeight()/density>=47.5f,state,"Parameter control keeps a 48dp touch target: "+TITLES[i],bounds(value,density));
                observe(Math.abs(left(header)-left(value))/density<=.5f,state,"Parameter header and input share a left edge: "+TITLES[i],row);
                if(previousControl!=null){float rowGap=(top(header)-bottom(previousControl))/density;row.put("previousControlGapDp",rowGap);observe(range(rowGap,8,12),state,"Adjacent parameter rows are separated by 8–12dp: "+TITLES[i],new JSONObject().put("gapDp",rowGap));}
                rows.put(row);previousControl=value;
            }
            layout.put("parameterRows",rows);
        }
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Measurement queues no configuration save");
        require(!landscape||page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE,"Requested landscape is rendered");
        layouts.put(layout);return null;
    });}

    private JSONObject columns(ViewGroup row,float density)throws Exception{
        Switch control=find(row,Switch.class);require(control!=null,"Feature row has its native switch");
        View arrow=row.getChildAt(row.getChildCount()-1);ImageButton help=null;
        for(View view:all(row))if(view instanceof ImageButton&&view.getContentDescription()!=null&&view.getContentDescription().toString().startsWith("查看")){help=(ImageButton)view;break;}
        JSONObject result=new JSONObject().put("switchRightDp",right(control)/density).put("arrowRightDp",right(arrow)/density)
                .put("switch",bounds(control,density)).put("arrow",bounds(arrow,density));
        if(help!=null)result.put("helpRightDp",right(help)/density).put("help",bounds(help,density));
        return result;
    }
    private View control(View body,int index){return index==1?find(body,Spinner.class):description(body,CONTROLS[index],index==2||index==3?EditText.class:SeekBar.class);}
    private UiKit.Fold fold()throws Exception{return (UiKit.Fold)getMap(editor,"componentFolds","network");}
    private static Object getMap(Object object,String field,String key)throws Exception{return ((Map<?,?>)get(object,field)).get(key);}
    private void observe(boolean value,String state,String rule,JSONObject observed)throws Exception{checks++;if(!value)violations.put(new JSONObject().put("state",state).put("rule",rule).put("observed",observed));}
    private static boolean range(float value,float min,float max){return value>=min-.5f&&value<=max+.5f;}
    private static JSONObject bounds(View view,float density)throws Exception{return new JSONObject().put("leftDp",left(view)/density).put("topDp",top(view)/density).put("rightDp",right(view)/density).put("bottomDp",bottom(view)/density).put("widthDp",view.getWidth()/density).put("heightDp",view.getHeight()/density).put("visibility",view.getVisibility());}
    // Layout bounds exclude the fold arrow's 180-degree rendering rotation.
    private static float left(View view){if(view.getParent() instanceof View){View parent=(View)view.getParent();return left(parent)+view.getLeft()-parent.getScrollX();}int[] xy=new int[2];view.getLocationInWindow(xy);return xy[0];}
    private static float top(View view){if(view.getParent() instanceof View){View parent=(View)view.getParent();return top(parent)+view.getTop()-parent.getScrollY();}int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private static float right(View view){return left(view)+view.getWidth();}
    private static float bottom(View view){return top(view)+view.getHeight();}
    private static List<View> all(View root){List<View> views=new ArrayList<>();views.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)views.addAll(all(((ViewGroup)root).getChildAt(i)));return views;}
    private static View ancestor(View view,String prefix){while(view!=null){if(view.getTag() instanceof String&&((String)view.getTag()).startsWith(prefix))return view;view=view.getParent() instanceof View?(View)view.getParent():null;}return null;}
    private static TextView text(View root,String label){for(View view:all(root))if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return (TextView)view;return null;}
    private static <T extends View>T find(View root,Class<T> type){for(View view:all(root))if(type.isInstance(view))return type.cast(view);return null;}
    private static View description(View root,String label,Class<? extends View> type){for(View view:all(root))if(type.isInstance(view)&&label.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;return null;}
    private Activity await(Activity previous){long until=SystemClock.uptimeMillis()+10000;while(SystemClock.uptimeMillis()<until){Activity page=resumed;if(page!=null&&page!=previous&&!page.isFinishing()&&ROUTE.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(30);}throw new AssertionError("Network page did not resume after orientation request");}
    private void settle(Activity page)throws Exception{test.waitForIdleSync();CountDownLatch frames=new CountDownLatch(1);main(()->{page.getWindow().getDecorView().postOnAnimation(()->page.getWindow().getDecorView().postOnAnimation(frames::countDown));return null;});require(frames.await(3,TimeUnit.SECONDS),"Network page laid out");test.waitForIdleSync();}
    private void capture(Activity page,String name)throws Exception{settle(page);Bitmap image=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(image!=null,"Device screenshot is available");File file=new File(directory,name+".png");try(FileOutputStream stream=new FileOutputStream(file)){require(image.compress(Bitmap.CompressFormat.PNG,100,stream),"Screenshot saved");}finally{image.recycle();}screenshots.put(file.getAbsolutePath());}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static void set(Object object,String name,Object value)throws Exception{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);field.set(object,value);}
    private static Object invoke(Object object,String name)throws Exception{Method method=object.getClass().getDeclaredMethod(name);method.setAccessible(true);return method.invoke(object);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);}
    public void onActivityResumed(Activity activity){resumed=activity;}
    public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityStarted(Activity activity){}public void onActivityStopped(Activity activity){}public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
