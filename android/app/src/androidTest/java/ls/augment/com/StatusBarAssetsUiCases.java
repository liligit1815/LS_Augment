package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;

/** Test APK only. UI browsing is read-only; runtime changes have an explicit, durable restore file. */
final class StatusBarAssetsUiCases {
    static JSONObject run(Instrumentation test)throws Exception {
        Context context=test.getTargetContext();Map<String,String> before=new AppConfig(context).snapshot();
        Activity activity=test.startActivitySync(new Intent(context,StatusBarAssetsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        File folder=new File(context.getExternalFilesDir(null),"statusbar-asset-tests");folder.mkdirs();JSONArray shots=new JSONArray();
        try{
            test.waitForIdleSync();capture(test,activity,new File(folder,"ui-inventory.png"));shots.put("ui-inventory.png");
            click(test,activity,"Wi-Fi",true);test.waitForIdleSync();
            require(has(activity.getWindow().getDecorView(),"预览与编辑状态",false),"icon sample opens editor");
            capture(test,activity,new File(folder,"ui-wifi.png"));shots.put("ui-wifi.png");
            click(test,activity,"字体",false);test.waitForIdleSync();
            require(has(activity.getWindow().getDecorView(),"统一字体",false)&&has(activity.getWindow().getDecorView(),"硬件信息",false),"global and per-role fonts exist");
            capture(test,activity,new File(folder,"ui-fonts.png"));shots.put("ui-fonts.png");
            click(test,activity,"导入与分享",false);test.waitForIdleSync();
            require(has(activity.getWindow().getDecorView(),"打开社区素材库",false)&&has(activity.getWindow().getDecorView(),"选择图标和字体导出分享包",false),"sharing actions exist");
            capture(test,activity,new File(folder,"ui-sharing.png"));shots.put("ui-sharing.png");
            require(before.equals(new AppConfig(context).snapshot()),"browsing must leave all settings unchanged");
            return new JSONObject().put("success",true).put("screenshots",shots).put("settingsUnchanged",true);
        }finally{test.runOnMainSync(activity::finish);}
    }
    private static void click(Instrumentation test,Activity activity,String text,boolean description){
        test.runOnMainSync(()->{View view=find(activity.getWindow().getDecorView(),text,description);require(view!=null,"missing action: "+text);require(view.performClick(),"action not clickable: "+text);});
    }
    private static View find(View view,String text,boolean description){
        if(description&&view.getContentDescription()!=null&&view.getContentDescription().toString().contains(text)&&view.isClickable())return view;
        if(!description&&view instanceof TextView&&((TextView)view).getText().toString().equals(text))return view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=find(((ViewGroup)view).getChildAt(i),text,description);if(found!=null)return found;}return null;
    }
    private static boolean has(View view,String text,boolean description){return find(view,text,description)!=null;}
    private static void capture(Instrumentation test,Activity activity,File file)throws Exception {
        // waitForIdleSync can return before the next Choreographer layout after setContentView.
        java.util.concurrent.CountDownLatch frames=new java.util.concurrent.CountDownLatch(1);
        test.runOnMainSync(()->activity.getWindow().getDecorView().postOnAnimation(()->activity.getWindow().getDecorView().postOnAnimation(frames::countDown)));
        require(frames.await(3,java.util.concurrent.TimeUnit.SECONDS),"UI did not render");test.waitForIdleSync();
        Bitmap[] image=new Bitmap[1];test.runOnMainSync(()->{View view=activity.getWindow().getDecorView();image[0]=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);view.draw(new Canvas(image[0]));});
        try(OutputStream out=new FileOutputStream(file)){image[0].compress(Bitmap.CompressFormat.PNG,100,out);}finally{image[0].recycle();}
    }
    static JSONObject runtime(Context context,String stage)throws Exception {
        AppConfig config=new AppConfig(context);File baseline=new File(context.getFilesDir(),"statusbar-assets-test-baseline.json");
        if(stage.equals("apply")){
            require(!baseline.exists(),"restore previous fixture before applying again");
            JSONObject saved=new JSONObject().put(StatusBarThemeSpec.KEY,config.get(StatusBarThemeSpec.KEY)).put(StatusBarFontSpec.KEY,config.get(StatusBarFontSpec.KEY))
                    .put(SystemUiOptions.PREFIX+"keyguard_statusbar_hide",config.get(SystemUiOptions.PREFIX+"keyguard_statusbar_hide"));
            Files.write(baseline.toPath(),saved.toString().getBytes(StandardCharsets.UTF_8));
            File folder=context.getExternalFilesDir("statusbar-asset-tests");Map<String,String> next=new LinkedHashMap<>();
            next.put(StatusBarThemeSpec.KEY,"");next.put(StatusBarFontSpec.KEY,"");String animatedHash="";
            for(String filename:new String[]{"gentle-spin-1.0.0.zip","noto-sans-1.0.0.zip"}){
                StatusBarAssetPack.Preview pack;try(InputStream in=new FileInputStream(new File(folder,filename))){pack=StatusBarAssetPack.inspect(in);}
                StatusBarAssetPack.install(context,pack);next=StatusBarAssetPack.merge(next,pack);
                if(filename.startsWith("gentle"))animatedHash=StatusBarThemeSpec.parse(pack.theme).entries().get(0).asset;
            }
            // Animation lifecycle is independent of dynamic state replacement. Decorations
            // preserve the original signal, activity arrows and battery information.
            StatusBarThemeSpec theme=StatusBarThemeSpec.empty();
            for(String id:new String[]{"wifi","wifi.signal","bluetooth","connectivity"}){
                theme=theme.with(new StatusBarThemeSpec.Binding(id,"default","background",animatedHash,true,100,0,0,100,false));
                require(StatusBarAssetPolicy.resolve(theme,id,new String[]{"default"},"background","main").binding!=null,"animation fixture must use an applicable decoration");
            }
            next.put(StatusBarThemeSpec.KEY,theme.serialize());next.put(SystemUiOptions.PREFIX+"keyguard_statusbar_hide","0");AppConfig.SaveResult savedResult=config.save(next);require(savedResult.success,"fixture save failed");
        }else if(stage.equals("restore")){
            require(baseline.isFile(),"no saved fixture baseline");JSONObject saved=new JSONObject(new String(Files.readAllBytes(baseline.toPath()),StandardCharsets.UTF_8));Map<String,String> values=new LinkedHashMap<>();
            for(String key:new String[]{StatusBarThemeSpec.KEY,StatusBarFontSpec.KEY})values.put(key,saved.getString(key));
            if(saved.has(SystemUiOptions.PREFIX+"keyguard_statusbar_hide"))values.put(SystemUiOptions.PREFIX+"keyguard_statusbar_hide",saved.getString(SystemUiOptions.PREFIX+"keyguard_statusbar_hide"));
            require(config.save(values).success,"fixture restore failed");require(baseline.delete(),"cannot remove completed fixture baseline");
        }else require(stage.equals("observe"),"unknown fixture stage");
        Bundle response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);
        String payload=response==null?"":response.getString("payload","");
        // Polling and event publication each throttle at five seconds; allow both windows.
        if(stage.equals("observe"))for(int retry=0;payload.isEmpty()&&retry<48;retry++){
            android.os.SystemClock.sleep(250);
            response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);
            payload=response==null?"":response.getString("payload","");
        }
        return new JSONObject().put("stage",stage).put("enhancementEnabled",config.getBoolean(ConfigSchema.SYSTEMUI_MASTER)).put("positionOnly",config.getBoolean(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY))
                .put("theme",config.get(StatusBarThemeSpec.KEY)).put("fonts",config.get(StatusBarFontSpec.KEY)).put("inventory",payload.isEmpty()?JSONObject.NULL:new JSONObject(payload)).put("restorePending",baseline.exists());
    }
    static JSONObject lifecycle(Instrumentation test)throws Exception {
        Context context=test.getTargetContext();Map<String,String> before=new AppConfig(context).snapshot();JSONObject report=new JSONObject();
        try{
            shell(test,"input keyevent 224");shell(test,"wm dismiss-keyguard");shell(test,"input keyevent 3");
            runtime(context,"apply");
            JSONObject active=awaitRuntime(context,r->"main".equals(r.optString("activeSurface"))&&r.optInt("playingAnimations")>0);report.put("active",active);
            require(active.getJSONObject("runtime").getInt("playingAnimations")>0,"real visible animations must start");
            require(active.getJSONObject("runtime").getInt("playingAnimations")<=8,"real animation budget");
            screenshot(test,context,"runtime-active.png");
            shell(test,"input keyevent 223");
            JSONObject sleeping=awaitRuntime(context,r->!r.optBoolean("interactive",true)&&r.optInt("playingAnimations",-1)==0);report.put("sleeping",sleeping);
            require(!sleeping.getJSONObject("runtime").getBoolean("interactive"),"screen-off observed");
            require(sleeping.getJSONObject("runtime").getInt("playingAnimations")==0,"all real animations stop offscreen");
            shell(test,"input keyevent 224");
            JSONObject locked=awaitRuntime(context,r->r.optBoolean("interactive")&&"lock".equals(r.optString("activeSurface"))&&r.optInt("playingAnimations")>0);report.put("locked",locked);
            require("lock".equals(locked.getJSONObject("runtime").getString("activeSurface")),"lock screen independently observed");
            require(locked.getJSONObject("runtime").getInt("playingAnimations")>0,"top lock screen animations start");screenshot(test,context,"runtime-lock.png");
            shell(test,"wm dismiss-keyguard");shell(test,"input keyevent 3");
            JSONObject resumed=awaitRuntime(context,r->"main".equals(r.optString("activeSurface"))&&r.optInt("playingAnimations")>0);report.put("resumed",resumed);
            require(resumed.getJSONObject("runtime").getInt("playingAnimations")>0,"animations resume after wake");
            screenshot(test,context,"runtime-resumed.png");
        }finally{
            if(new File(context.getFilesDir(),"statusbar-assets-test-baseline.json").exists())runtime(context,"restore");
            shell(test,"input keyevent 224");shell(test,"wm dismiss-keyguard");shell(test,"input keyevent 3");
        }
        awaitRuntime(context,r->r.optInt("playingAnimations",-1)==0&&r.optInt("loadedDrawables",-1)==0);report.put("restored",runtime(context,"observe"));screenshot(test,context,"runtime-restored.png");
        require(before.equals(new AppConfig(context).snapshot()),"lifecycle test must restore all settings");return report.put("success",true).put("settingsRestored",true);
    }
    static JSONObject screenOff(Instrumentation test)throws Exception {
        Context context=test.getTargetContext();Map<String,String> before=new AppConfig(context).snapshot();
        JSONObject awake=awaitRuntime(context,r->r.optBoolean("interactive")&&r.optInt("playingAnimations")>0);
        try{
            shell(test,"input keyevent 223");
            JSONObject asleep=awaitRuntime(context,r->!r.optBoolean("interactive",true)&&r.optInt("playingAnimations",-1)==0);
            require(before.equals(new AppConfig(context).snapshot()),"Power observation leaves configuration unchanged");
            return new JSONObject().put("success",true).put("awake",awake.getJSONObject("runtime")).put("asleep",asleep.getJSONObject("runtime"));
        }finally{
            shell(test,"input keyevent 224");shell(test,"input keyevent 82");shell(test,"wm dismiss-keyguard");
        }
    }
    private static JSONObject awaitRuntime(Context context,java.util.function.Predicate<JSONObject> ready)throws Exception {
        // A state event and the regular inventory poll can span two five-second windows.
        long until=android.os.SystemClock.elapsedRealtime()+15000;JSONObject last=new JSONObject();
        do{Bundle response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);String text=response==null?"":response.getString("payload","");
            if(!text.isEmpty()){JSONObject snapshot=new JSONObject(text);last=snapshot.optJSONObject("runtime");if(last!=null&&ready.test(last))return snapshot;}
            android.os.SystemClock.sleep(200);
        }while(android.os.SystemClock.elapsedRealtime()<until);
        throw new AssertionError("Runtime did not settle: "+last);
    }
    private static void shell(Instrumentation test,String command)throws IOException {
        try(android.os.ParcelFileDescriptor descriptor=test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).executeShellCommand(command);InputStream in=new android.os.ParcelFileDescriptor.AutoCloseInputStream(descriptor)){byte[] buffer=new byte[1024];while(in.read(buffer)!=-1){} }
    }
    private static void screenshot(Instrumentation test,Context context,String name)throws IOException {
        Bitmap image=test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(image!=null,"screenshot unavailable");
        try(OutputStream out=new FileOutputStream(new File(context.getExternalFilesDir("statusbar-asset-tests"),name))){image.compress(Bitmap.CompressFormat.PNG,100,out);}finally{image.recycle();}
    }
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
