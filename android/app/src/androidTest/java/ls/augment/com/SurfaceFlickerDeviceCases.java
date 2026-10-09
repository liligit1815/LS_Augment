package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.inspector.WindowInspector;
import android.widget.ScrollView;
import android.widget.Button;
import android.widget.ImageButton;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Read-only rendering sweep of Home, Module and the actual application settings pages. */
final class SurfaceFlickerDeviceCases {
    static JSONObject run(Instrumentation test) throws Exception {
        require(!OnboardingActivity.needsConsent(test.getTargetContext()),"This inspection must not accept an agreement");
        Map<String,String> before=new AppConfig(test.getTargetContext()).snapshot();
        JSONArray pages=new JSONArray(),dialogs=new JSONArray();
        Activity home=test.startActivitySync(new Intent(test.getTargetContext(),SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        try {
            settle(test);
            main(test,()->{select(home,"home");return null;});
            pages.put(inspectPage(test,home,"home"));
            main(test,()->{select(home,"settings");return null;});
            pages.put(inspectPage(test,home,"module"));
            inspectHelp(test,home,dialogs,2);
            for(HookAppCatalog.Target target:HookAppCatalog.targets()){
                Activity detail=test.startActivitySync(new Intent(test.getTargetContext(),EnhancementSettingsActivity.class)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK).putExtra("target",target.id));
                try {
                    pages.put(inspectPage(test,detail,target.id));
                    inspectHelp(test,detail,dialogs,1);
                    int expanded=expandReadOnlyGroups(test,detail);
                    if(expanded>0){
                        JSONObject expandedPage=inspectPage(test,detail,target.id+"-expanded");
                        expandedPage.put("expandedGroups",expanded);pages.put(expandedPage);
                    }
                } finally {main(test,()->{detail.finish();return null;});settle(test);}
            }
            Activity status=test.startActivitySync(new Intent(test.getTargetContext(),StatusBarSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            try {pages.put(inspectPage(test,status,"statusbar-editor"));inspectHelp(test,status,dialogs,1);}
            finally {main(test,()->{status.finish();return null;});settle(test);}
            Activity reset=test.startActivitySync(new Intent(test.getTargetContext(),ConfigTransferActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK).putExtra("action","reset"));
            try {
                settle(test);
                dialogs.put(inspectDialog(test,reset,"reset-confirmation"));
                test.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);settle(test);
            } finally {main(test,()->{if(!reset.isDestroyed())reset.finish();return null;});}
            require(before.equals(new AppConfig(test.getTargetContext()).snapshot()),"UI inspection changed saved feature values");
            require(!OnboardingActivity.needsConsent(test.getTargetContext()),"UI inspection changed existing consent");
            return new JSONObject().put("success",true).put("moduleVersion",BuildConfig.VERSION_NAME).put("pages",pages)
                    .put("dialogs",dialogs).put("savedFeatureValuesUnchanged",true).put("consentUnchanged",true)
                    .put("configurationActionsConfirmed",false).put("scope","Home, Module, actual application settings including read-only expanded groups, statusbar editor and representative dialogs; no Hook feature activation");
        } finally {main(test,()->{home.finish();return null;});}
    }
    private static JSONObject inspectPage(Instrumentation test,Activity activity,String name)throws Exception{
        settle(test);
        ScrollView scroll=main(test,()->visibleScroll(activity.getWindow().getDecorView()));
        require(scroll!=null,"Missing scroll container: "+name);
        main(test,()->{scroll.scrollTo(0,0);return null;});settle(test);
        int range=main(test,()->Math.max(0,scroll.getChildAt(0).getHeight()-scroll.getHeight()+scroll.getPaddingTop()+scroll.getPaddingBottom()));
        int rendered=main(test,()->checkGlass(activity.getWindow().getDecorView()));
        require(rendered>0||"statusbar-editor".equals(name),"No visible optical surface on "+name);
        capture(test,activity,name+"-top");
        for(int y:new int[]{range/3,range,range/2,0}){
            main(test,()->{scroll.scrollTo(0,y);return null;});settle(test);
            require(main(test,()->checkGlass(activity.getWindow().getDecorView()))>=Math.min(1,rendered),"Optical surfaces disappeared while scrolling "+name);
        }
        capture(test,activity,name+"-returned");
        return new JSONObject().put("page",name).put("scrollRangePx",range).put("visibleGlassSurfaces",rendered)
                .put("opticalSurfacesRemainVisible",true).put("returnedToTop",main(test,scroll::getScrollY)==0);
    }
    private static int expandReadOnlyGroups(Instrumentation test,Activity activity)throws Exception{
        int expanded=0;
        for(int round=0;round<5;round++){
            List<View> actions=main(test,()->{List<View> found=new ArrayList<>();collectExpansion(activity.getWindow().getDecorView(),found);return found;});
            if(actions.isEmpty())break;
            for(View action:actions){main(test,()->{action.performClick();return null;});expanded++;settle(test);}
        }
        return expanded;
    }
    private static void collectExpansion(View view,List<View> result){
        if(!view.isShown()||!view.isEnabled())return;
        CharSequence description=view.getContentDescription();
        boolean expand=view instanceof ImageButton&&description!=null&&description.toString().startsWith("展开");
        if(view instanceof Button&&"展开".contentEquals(((Button)view).getText()))expand=true;
        if(expand&&view.isClickable())result.add(view);
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)collectExpansion(((ViewGroup)view).getChildAt(i),result);
    }
    private static ScrollView visibleScroll(View view){
        if(!view.isShown())return null;
        if(view instanceof ScrollView)return (ScrollView)view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            ScrollView child=visibleScroll(((ViewGroup)view).getChildAt(i));if(child!=null)return child;
        }
        return null;
    }
    private static void inspectHelp(Instrumentation test,Activity activity,JSONArray dialogs,int limit)throws Exception{
        List<View> buttons=main(test,()->{List<View> found=new ArrayList<>();collectHelp(activity.getWindow().getDecorView(),found);return found;});
        for(int i=0;i<Math.min(limit,buttons.size());i++){
            View help=buttons.get(i);
            String label=main(test,()->help.getContentDescription().toString());
            main(test,()->{help.performClick();return null;});settle(test);
            dialogs.put(inspectDialog(test,activity,label));
            test.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);settle(test);
        }
    }
    private static JSONObject inspectDialog(Instrumentation test,Activity activity,String name)throws Exception{
        LiquidGlassLayout glass=main(test,()->{
            for(View window:WindowInspector.getGlobalWindowViews()){
                LiquidGlassLayout value=window.findViewWithTag("liquid-glass-dialog");if(value!=null&&value.isShown())return value;
            }
            return null;
        });
        require(glass!=null,"Missing actual explanation/confirmation dialog: "+name);
        require(main(test,glass::opticalEffectActive),"Explanation/confirmation glass is inactive: "+name);
        int generation=main(test,glass::captureGeneration);
        ScrollView scroll=main(test,()->find(glass,ScrollView.class));
        int range=scroll==null?0:main(test,()->Math.max(0,scroll.getChildAt(0).getHeight()-scroll.getHeight()));
        if(scroll!=null)for(int y:new int[]{range/2,range,0}){
            main(test,()->{scroll.scrollTo(0,y);return null;});settle(test);
            require(main(test,glass::captureGeneration)==generation,"Dialog background recaptured during document scrolling: "+name);
            require(main(test,glass::opticalEffectActive),"Dialog glass disappeared while scrolling: "+name);
        }
        capture(test,activity,"dialog-"+Math.abs(name.hashCode()));
        return new JSONObject().put("dialog",name).put("scrollRangePx",range).put("backgroundCapturesDuringScroll",0).put("opticalEffectPreserved",true);
    }
    private static int checkGlass(View view)throws Exception{
        int count=0;
        if(view instanceof LiquidGlassLayout&&view.isShown()&&view.getGlobalVisibleRect(new android.graphics.Rect())){
            LiquidGlassLayout glass=(LiquidGlassLayout)view;
            require(glass.getAlpha()==1,"Visible glass unexpectedly faded");
            require(!(Boolean)field(glass,"failed")&&!(Boolean)field(glass,"captureDisabled"),"Glass rendering fell back after a capture or shader failure");
            require(glass.opticalEffectActive(),"Visible glass lost its optical shader");count++;
        }
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=checkGlass(((ViewGroup)view).getChildAt(i));
        return count;
    }
    private static void collectHelp(View view,List<View> result){
        CharSequence description=view.getContentDescription();
        if(view.isShown()&&view.isClickable()&&view.isEnabled()&&description!=null&&description.toString().startsWith("查看")&&description.toString().endsWith("说明"))result.add(view);
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)collectHelp(((ViewGroup)view).getChildAt(i),result);
    }
    private static Object field(Object object,String name)throws Exception{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(object);}
    private static void select(Activity home,String tab)throws Exception{Method method=SettingsActivity.class.getDeclaredMethod("selectTab",String.class);method.setAccessible(true);method.invoke(home,tab);}
    private static <T>T main(Instrumentation test,Callable<T> action){
        AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();
        test.runOnMainSync(()->{try{result.set(action.call());}catch(Throwable error){failure.set(error);}});
        if(failure.get()!=null)throw new AssertionError(failure.get());return result.get();
    }
    private static <T extends View>T find(View view,Class<T> type){
        if(type.isInstance(view))return type.cast(view);
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T child=find(((ViewGroup)view).getChildAt(i),type);if(child!=null)return child;}
        return null;
    }
    private static void settle(Instrumentation test){SystemClock.sleep(220);test.waitForIdleSync();}
    private static void capture(Instrumentation test,Activity activity,String name)throws Exception{
        File file=new File(activity.getFilesDir(),"device-regression-results/surface-flicker/"+name+".png");file.getParentFile().mkdirs();
        Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot unavailable");
        try(FileOutputStream output=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
