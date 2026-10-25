package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Switch;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real OEM page clicks and real provider writes; restores only the tested switch keys. */
final class NativeIslandSettingsDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final UiAutomation automation;
    private final JSONArray checks=new JSONArray();
    private Activity activity;
    private File directory;
    private NativeIslandSettingsDeviceCases(Instrumentation t){test=t;context=t.getTargetContext();config=new AppConfig(context);
        automation=t.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);}
    static JSONObject run(Instrumentation t)throws Exception{return new NativeIslandSettingsDeviceCases(t).run();}
    private JSONObject run()throws Exception{
        Map<String,String> before=config.snapshot();
        String nativeBefore=Settings.System.getString(context.getContentResolver(),NativeIslandControl.SETTING);
        Map<String,String> restore=new LinkedHashMap<>();
        restore.put(SystemUiOptions.ISLAND,before.get(SystemUiOptions.ISLAND));
        restore.put(ConfigSchema.NATIVE_ISLAND_SELECTED,before.get(ConfigSchema.NATIVE_ISLAND_SELECTED));
        directory=new File(context.getExternalFilesDir(null),"native-island-settings-"+BuildConfig.VERSION_CODE);directory.mkdirs();
        try{
            require(config.save(java.util.Collections.singletonMap(SystemUiOptions.ISLAND,"1")).success,"Duo enabled for test");
            shell("settings put system "+NativeIslandControl.SETTING+" 1");
            Bundle deniedArgs=new Bundle();deniedArgs.putBoolean("enabled",true);
            Bundle denied=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),NativeIslandControl.METHOD,null,deniedArgs);
            require(denied!=null&&!denied.getBoolean("ok"),"App cannot impersonate OEM selection caller");
            activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target","notifications").putExtra(ModuleNavigation.EXTRA_ROUTE,"group/notifications/island")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            await(()->activity.hasWindowFocus(),"Duo page foreground");
            main(()->{
                View entry=activity.getWindow().getDecorView().findViewWithTag("navigation:native-island-settings");
                require(entry!=null&&entry.isShown(),"Native settings entry visible with configuration collapsed");
                require(entry.getHeight()/activity.getResources().getDisplayMetrics().density>=48,"Entry has standard touch height");
            });
            capture("01-entry");
            main(()->activity.getWindow().getDecorView().findViewWithTag("navigation:native-island-settings").performClick());
            await(()->nativeSwitch()!=null,"Actual OEM page opened");
            SystemClock.sleep(1200);
            require("1".equals(config.get(SystemUiOptions.ISLAND)),"Browsing already-on OEM page preserves Duo");
            require("0".equals(config.get(ConfigSchema.NATIVE_ISLAND_SELECTED)),"Browsing does not select native owner");
            capture("02-native-browse");
            clickNative();await(()->nativeValue()==0,"OEM switch OFF persisted");SystemClock.sleep(700);
            require("1".equals(config.get(SystemUiOptions.ISLAND)),"Turning native OFF does not close Duo");
            clickNative();await(()->nativeValue()==1&&"0".equals(config.get(SystemUiOptions.ISLAND))
                    &&"1".equals(config.get(ConfigSchema.NATIVE_ISLAND_SELECTED)),"Native ON atomically disables Duo");
            await(()->context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString("ls_augment_native_island","").startsWith("native_selected;"),"Native engine takes ownership");
            capture("03-native-on");
            automation.performGlobalAction(android.accessibilityservice.AccessibilityService.GLOBAL_ACTION_BACK);
            await(()->activity.hasWindowFocus(),"Return to Duo page");
            main(()->{
                Switch master=activity.getWindow().getDecorView().findViewWithTag("config:"+SystemUiOptions.ISLAND);
                require(!master.isChecked(),"Duo switch refreshes on return");
            });
            capture("04-duo-off");
            Map<String,String> after=config.snapshot();
            for(String key:before.keySet())if(key.startsWith(SystemUiOptions.PREFIX+"island_")&&!key.equals(SystemUiOptions.ISLAND))
                require(before.get(key).equals(after.get(key)),"Parameter retained: "+key);
            main(()->activity.getWindow().getDecorView().findViewWithTag("navigation:native-island-settings").performClick());
            await(()->nativeSwitch()!=null,"Entry still works with Duo disabled");
            clickNative();await(()->nativeValue()==0&&"0".equals(config.get(ConfigSchema.NATIVE_ISLAND_SELECTED)),"Native OFF clears native selection");
            require("0".equals(config.get(SystemUiOptions.ISLAND)),"Native OFF does not silently re-enable Duo");
            return new JSONObject().put("checks",checks).put("evidenceDirectory",directory.getAbsolutePath());
        }finally{
            shell("settings "+(nativeBefore==null?"delete":"put")+" system "+NativeIslandControl.SETTING+(nativeBefore==null?"":" "+nativeBefore));
            require(config.save(restore).success,"Original island selections restored");
            if(activity!=null)main(()->activity.finish());
        }
    }
    private int nativeValue(){return Settings.System.getInt(context.getContentResolver(),NativeIslandControl.SETTING,-1);}
    private AccessibilityNodeInfo nativeSwitch(){return find(automation.getRootInActiveWindow());}
    private AccessibilityNodeInfo find(AccessibilityNodeInfo node){
        if(node==null)return null;
        if("com.android.systemui".contentEquals(node.getPackageName()==null?"":node.getPackageName())&&node.isCheckable())return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=find(node.getChild(i));if(found!=null)return found;}return null;
    }
    private void clickNative(){AccessibilityNodeInfo node=nativeSwitch();require(node!=null,"Native switch found");
        while(node!=null&&!node.isClickable())node=node.getParent();require(node!=null&&node.performAction(AccessibilityNodeInfo.ACTION_CLICK),"Native switch clicked");}
    private void shell(String command)throws Exception{try(android.os.ParcelFileDescriptor fd=automation.executeShellCommand(command);
        java.io.FileInputStream in=new java.io.FileInputStream(fd.getFileDescriptor())){in.readAllBytes();}}
    private void capture(String name)throws Exception{SystemClock.sleep(300);Bitmap image=automation.takeScreenshot();require(image!=null,"Screenshot "+name);
        try(FileOutputStream stream=new FileOutputStream(new File(directory,name+".png"))){image.compress(Bitmap.CompressFormat.PNG,100,stream);}finally{image.recycle();}}
    private interface Check{boolean ready()throws Exception;}
    private void await(Check c,String message)throws Exception{long until=SystemClock.uptimeMillis()+12000;while(!c.ready()){if(SystemClock.uptimeMillis()>until)throw new AssertionError(message);SystemClock.sleep(80);}checks.put(message);}
    private void main(Runnable r)throws Exception{AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{r.run();}catch(Throwable t){error.set(t);}});if(error.get()!=null)throw new AssertionError(error.get());}
    private void require(boolean value,String message){if(!value)throw new AssertionError(message);checks.put(message);}
}
