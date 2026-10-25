package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.SystemClock;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import org.json.JSONObject;

/** Exercises the real switch listeners with in-memory drafts; never enables health processing. */
final class HealthSettingsUiCases {
    static JSONObject run(Instrumentation test)throws Exception{
        Activity activity=test.startActivitySync(new Intent(test.getTargetContext(),HealthSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        AppConfig config=new AppConfig(activity);Map<String,String> before=config.snapshot();
        SharedPreferences diagnostics=activity.getSharedPreferences(AppConfig.DIAGNOSTICS,0);
        String oldRuntime=diagnostics.getString(HealthAccountState.RUNTIME,null),oldBinding=diagnostics.getString(HealthAccountState.BINDING,null);
        Object editor=get(activity,"editor");String savedBound=(String)get(editor,"bound");
        String[] names={"multiplyEnabled","planEnabled","dailyLimitEnabled"};
        String[] folds={"multiplyFold","planFold","limitFold"};
        String fixture="c".repeat(64);int rejected=0;
        try{
            test.waitForIdleSync();
            onMain(test,()->set(editor,"resumed",false));
            onMain(test,()->{
                View root=activity.getWindow().getDecorView();
                View navigation=root.findViewWithTag("page-path"),title=root.findViewWithTag("section-title:账号绑定");
                int[] navPoint=new int[2],titlePoint=new int[2];navigation.getLocationInWindow(navPoint);title.getLocationInWindow(titlePoint);
                float gap=(titlePoint[1]-navPoint[1]-navigation.getHeight())/activity.getResources().getDisplayMetrics().density;
                require(gap>=7.5f&&gap<=12.5f,"Navigation-to-section gap exceeds 8–12dp: "+gap);
                require(hasText(root,"小米运动健康")&&!hasText(root,"步数与每日计划"),"Navigation title was not updated");
                require(!hasText(root,"运行与帮助")&&!hasText(root,"运行状态")&&!hasText(root,"使用说明"),"Removed group remains in the page");
                require(!hasText(root,"设置自动保存")&&!hasText(root,"设置自动保持"),"Auto-save description remains in the page");
            });
            for(String state:new String[]{"unbound","switched","expired","logged-out"}){
                onMain(test,()->{
                    set(editor,"bound",state.equals("unbound")?"":fixture);
                    String value=HealthAccountState.encode(state.equals("logged-out")?"":state.equals("switched")?"d".repeat(64):fixture,state.equals("logged-out")?"":"1234567890",System.currentTimeMillis()-(state.equals("expired")?100_000:0));
                    diagnostics.edit().putString(HealthAccountState.RUNTIME,value).apply();
                    set(editor,"resumed",true);
                });
                for(String name:names){
                    onMain(test,()->{
                        Switch control=(Switch)get(editor,name);set(editor,"loading",true);control.setChecked(false);set(editor,"loading",false);
                        control.performClick();require(!control.isChecked(),state+" gate failed for "+name);
                        require(!(Boolean)get(editor,"dirty"),"Rejected toggle queued a configuration write");
                    });
                    test.waitForIdleSync();SystemClock.sleep(120);
                    android.view.accessibility.AccessibilityNodeInfo root=test.getUiAutomation().getRootInActiveWindow();
                    require(root!=null&&!root.findAccessibilityNodeInfosByText("去绑定").isEmpty(),"Binding prompt has no actionable entry");
                    if(state.equals("unbound")&&name.equals("dailyLimitEnabled"))capture(test,activity,"unbound-limit.png");
                    test.sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);test.waitForIdleSync();rejected++;
                }
                onMain(test,()->set(editor,"resumed",false));
            }
            onMain(test,()->{
                set(editor,"bound",fixture);diagnostics.edit().putString(HealthAccountState.RUNTIME,HealthAccountState.encode(fixture,"1234567890",System.currentTimeMillis())).apply();
                invoke(editor,"showAccount");
                require(((TextView)get(editor,"accountView")).getText().toString().equals("已绑定本机账户：1234567890"),"Account label is not the actual Xiaomi account");
                set(editor,"planDraftChanged",true);
                for(int i=0;i<names.length;i++){
                    Switch control=(Switch)get(editor,names[i]);UiKit.Fold fold=(UiKit.Fold)get(editor,folds[i]);
                    control.performClick();require(control.isChecked(),"Verified binding did not allow "+names[i]);discard(editor);
                    require(fold.content.getVisibility()==View.VISIBLE&&fold.arrow.isEnabled(),"Enabled editor did not open: "+names[i]);
                    control.performClick();discard(editor);
                    require(fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled editor did not collapse: "+names[i]);
                    ((View)control.getParent()).performClick();fold.arrow.performClick();fold.show(true);
                    require(fold.content.getVisibility()==View.GONE,"Disabled editor can expand: "+names[i]);
                }
                // The popup rejects invalid user input; inject a stale invalid draft to retain
                // coverage of the existing recovery path when a feature is reopened.
                Switch plan=(Switch)get(editor,"planEnabled");plan.setChecked(true);discard(editor);
                set(get(editor,"executions"),"saved","");discard(editor);plan.setChecked(false);discard(editor);
                plan.setChecked(true);discard(editor);require(plan.isChecked()&&((View)get(editor,"planBody")).getVisibility()==View.VISIBLE,"Invalid plan draft prevented reopening");
                require(Integer.parseInt(((ParameterSlider)get(editor,"executions")).getValue())>0,"Plan draft was not restored");plan.setChecked(false);discard(editor);
                Switch limit=(Switch)get(editor,"dailyLimitEnabled");limit.setChecked(true);discard(editor);
                set(get(editor,"dailyLimitSteps"),"saved","");discard(editor);limit.setChecked(false);discard(editor);
                limit.setChecked(true);discard(editor);require(limit.isChecked()&&((UiKit.Fold)get(editor,"limitFold")).content.getVisibility()==View.VISIBLE,"Invalid limit draft prevented reopening");
                require(ConfigSchema.normalize(ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,((ParameterSlider)get(editor,"dailyLimitSteps")).getValue())!=null,"Limit draft was not restored");limit.setChecked(false);discard(editor);
                for(String field:new String[]{"executions","steps","dailyLimitSteps"}){
                    ParameterSlider numeric=(ParameterSlider)get(editor,field);
                    require(numeric.bar instanceof ParameterSeekBar,"Numeric field does not use the shared native slider: "+field);
                    require(get(numeric,"editor") instanceof NumericParameterEditor,"Numeric field has no precise input: "+field);
                }
                CheckBox[] days=(CheckBox[])get(editor,"days");require(days.length==7,"Week selector incomplete");
                for(CheckBox day:days)require(day.getLayoutParams().height>=Math.round(48*activity.getResources().getDisplayMetrics().density),"Week selector touch target too small");
                SeekBar slider=(SeekBar)get(editor,"multiplier");require(slider.getMax()==9,"Multiplier range changed");
            });
            test.waitForIdleSync();capture(test,activity,"disabled-features.png");
            onMain(test,()->{((Switch)get(editor,"planEnabled")).setChecked(true);discard(editor);});
            test.waitForIdleSync();capture(test,activity,"expanded-plan.png");
            onMain(test,()->((Button)get(editor,"fromButton")).performClick());test.waitForIdleSync();
            capture(test,activity,"time-picker.png");test.sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);test.waitForIdleSync();
            require(before.equals(config.snapshot()),"UI test changed persistent health configuration");
            return new JSONObject().put("success",true).put("rejectedToggleCases",rejected).put("verifiedToggleCases",3)
                    .put("realAccountLabel",true).put("disabledFeatureCases",3).put("collapseOnDisable",true).put("disabledFeaturesCannotExpand",true)
                    .put("invalidDraftReenableCases",2).put("navigationTitleUpdated",true).put("removedGroupAndDescription",true)
                    .put("navigationSectionGapWithin8To12Dp",true)
                    .put("timePickerCancelSafe",true).put("configurationUnchanged",true);
        }finally{
            onMain(test,()->{discard(editor);set(editor,"bound",savedBound);set(editor,"resumed",false);activity.finish();});
            SharedPreferences.Editor restore=diagnostics.edit();restore(restore,HealthAccountState.RUNTIME,oldRuntime);restore(restore,HealthAccountState.BINDING,oldBinding);restore.commit();
        }
    }
    private static void onMain(Instrumentation test,Runnable action){
        java.util.concurrent.atomic.AtomicReference<Throwable> error=new java.util.concurrent.atomic.AtomicReference<>();
        test.runOnMainSync(()->{try{action.run();}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new AssertionError("Health UI action failed",error.get());
    }
    private static void restore(SharedPreferences.Editor editor,String key,String value){if(value==null)editor.remove(key);else editor.putString(key,value);}
    private static void discard(Object editor){((Handler)get(editor,"main")).removeCallbacks((Runnable)get(editor,"autoSave"));set(editor,"dirty",false);}
    private static Object get(Object target,String name){try{Field field=target.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(target);}catch(Exception error){throw new AssertionError(error);}}
    private static void set(Object target,String name,Object value){try{Field field=target.getClass().getDeclaredField(name);field.setAccessible(true);field.set(target,value);}catch(Exception error){throw new AssertionError(error);}}
    private static void invoke(Object target,String name){try{Method method=target.getClass().getDeclaredMethod(name);method.setAccessible(true);method.invoke(target);}catch(Exception error){throw new AssertionError(error);}}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static boolean hasText(View view,String text){
        if(view instanceof TextView&&((TextView)view).getText().toString().contains(text))return true;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)if(hasText(group.getChildAt(i),text))return true;}
        return false;
    }
    private static void capture(Instrumentation test,Activity activity,String name)throws Exception{
        SystemClock.sleep(350);test.waitForIdleSync();
        Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot unavailable");
        File folder=new File(activity.getExternalFilesDir(null),"health-ui-regression");folder.mkdirs();
        try(FileOutputStream stream=new FileOutputStream(new File(folder,name))){bitmap.compress(Bitmap.CompressFormat.PNG,100,stream);}finally{bitmap.recycle();}
    }
}
