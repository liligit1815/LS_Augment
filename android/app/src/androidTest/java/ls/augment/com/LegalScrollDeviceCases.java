package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Scroll the actual About documents without changing consent or feature settings. */
final class LegalScrollDeviceCases {
    static JSONObject run(Instrumentation test) throws Exception {
        require(!OnboardingActivity.needsConsent(test.getTargetContext()),"Existing consent is required; this check must not accept an agreement");
        Map<String,String> before=new AppConfig(test.getTargetContext()).snapshot();
        Activity activity=test.startActivitySync(new Intent(test.getTargetContext(),SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        JSONArray documents=new JSONArray();
        try {
            main(test,()->{
                Method select=SettingsActivity.class.getDeclaredMethod("selectTab",String.class);select.setAccessible(true);select.invoke(activity,"about");return null;
            });
            settle(test);
            UiKit ui=main(test,()->{Field field=SettingsActivity.class.getDeclaredField("ui");field.setAccessible(true);return (UiKit)field.get(activity);});
            for(boolean privacy:new boolean[]{false,true}){
                String name=privacy?"privacy":"terms";
                Dialog dialog=main(test,()->privacy?ModuleLegal.showPrivacy(activity,ui):ModuleLegal.showTerms(activity,ui));
                try {
                    settle(test);
                    LiquidGlassLayout glass=main(test,()->dialog.getWindow().getDecorView().findViewWithTag("liquid-glass-dialog"));
                    ScrollView scroll=main(test,()->find(glass,ScrollView.class));
                    require(glass!=null&&scroll!=null,"Missing actual legal dialog or document scroll");
                    int generation=main(test,glass::captureGeneration);
                    require(generation>0&&main(test,glass::opticalEffectActive),"Legal dialog must retain the optical glass effect");
                    int range=main(test,()->scroll.getChildAt(0).getHeight()-scroll.getHeight());
                    require(range>0,"Actual legal document must be scrollable");
                    capture(test,activity,name+"-top");
                    int maximum=0;
                    for(int y:new int[]{range/3,range*2/3,range,range/3,0,range,0}){
                        main(test,()->{scroll.scrollTo(0,y);return null;});
                        settle(test);
                        maximum=Math.max(maximum,main(test,scroll::getScrollY));
                        require(main(test,glass::captureGeneration)==generation,"Document scrolling recaptured an unchanged Activity backdrop: "+name);
                        require(main(test,glass::opticalEffectActive),"Glass effect disappeared while reading "+name);
                    }
                    require(maximum==range&&main(test,scroll::getScrollY)==0,"Document failed to reach its bottom and return to the top");
                    capture(test,activity,name+"-returned");
                    int width=main(test,()->dialog.getWindow().getAttributes().width);
                    main(test,()->{dialog.getWindow().setLayout(width-ui.dp(16),-2);return null;});
                    settle(test);
                    require(main(test,glass::captureGeneration)>generation,"A resized dialog must refresh its backdrop mapping");
                    require(main(test,glass::opticalEffectActive),"Resizing removed the glass effect");
                    documents.put(new JSONObject().put("document",name).put("scrollRangePx",range)
                            .put("backgroundCapturesDuringScroll",0).put("reachedBottomAndReturned",true)
                            .put("resizeRefreshesBackdrop",true).put("opticalEffectPreserved",true));
                } finally {main(test,()->{dialog.dismiss();return null;});}
            }
            require(before.equals(new AppConfig(activity).snapshot()),"Legal reading changed feature configuration");
            require(!OnboardingActivity.needsConsent(activity),"Legal reading changed existing consent");
            return new JSONObject().put("success",true).put("documents",documents).put("configurationUnchanged",true).put("consentUnchanged",true);
        } finally {main(test,()->{activity.finish();return null;});}
    }
    private static <T>T main(Instrumentation test,Callable<T> action){
        AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();
        test.runOnMainSync(()->{try{result.set(action.call());}catch(Throwable error){failure.set(error);}});
        if(failure.get()!=null)throw new AssertionError(failure.get());return result.get();
    }
    private static <T extends View>T find(View view,Class<T> type){
        if(type.isInstance(view))return type.cast(view);
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            T child=find(((ViewGroup)view).getChildAt(i),type);if(child!=null)return child;
        }
        return null;
    }
    private static void settle(Instrumentation test){SystemClock.sleep(350);test.waitForIdleSync();}
    private static void capture(Instrumentation test,Activity activity,String name)throws Exception{
        File file=new File(activity.getFilesDir(),"device-regression-results/legal-scroll/"+name+".png");file.getParentFile().mkdirs();
        Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Legal screenshot unavailable");
        try(FileOutputStream output=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
