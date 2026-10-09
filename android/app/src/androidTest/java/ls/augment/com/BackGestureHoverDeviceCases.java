package ls.augment.com;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.accessibilityservice.AccessibilityService;
import android.app.Instrumentation;
import android.app.KeyguardManager;
import android.app.UiAutomation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only. Every injected event is journaled before dispatch; gestures end with CANCEL. */
final class BackGestureHoverDeviceCases {
    private static final String LAUNCHER="com.zte.mifavor.launcher",ASSIST="com.zte.floatassist";
    final Instrumentation test;final Context context;final UiAutomation automation;final AppConfig config;
    final File directory;final JSONObject report=new JSONObject();final JSONArray actions=new JSONArray(),screens=new JSONArray(),samples=new JSONArray(),cases=new JSONArray();
    final Map<String,String> before=new LinkedHashMap<>();
    BackGestureHoverDeviceCases(Instrumentation test,Bundle args)throws Exception{
        this.test=test;context=test.getTargetContext();automation=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);config=new AppConfig(context);
        String label=args.getString("label","back-gesture-hover");require(label.matches("[A-Za-z0-9_.-]+"),"Invalid evidence label");
        directory=new File(context.getExternalFilesDir(null),"back-gesture-tests/"+label);
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory unavailable");
        report.put("actions",actions).put("screenshots",screens).put("screenshotTiming",samples).put("cases",cases).put("evidence",directory.getAbsolutePath());
    }
    static JSONObject run(Instrumentation test,Bundle args)throws Exception{return new BackGestureHoverDeviceCases(test,args).run();}
    JSONObject run()throws Exception{
        PowerManager power=context.getSystemService(PowerManager.class);KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
        require(power!=null&&power.isInteractive()&&keyguard!=null&&!keyguard.isKeyguardLocked(),"Wake and unlock before gesture verification");
        int assist=Settings.System.getInt(context.getContentResolver(),"zte_float",1);
        int method=Settings.System.getInt(context.getContentResolver(),"start_floatassist_way",1);
        // This OEM preference is inverted: FullScreenGestureFeature enables
        // GestureStubBar feedback only when getNaviGestureNeedFeedback(0) == 0.
        int feedback=Settings.System.getInt(context.getContentResolver(),"gesture_visual_feedback",0);
        boolean installed;try{installed=context.getPackageManager().getApplicationInfo(ASSIST,0).enabled;}catch(Exception absent){installed=false;}
        report.put("oemFloatAssistEnabled",assist).put("oemFloatAssistMethod",method).put("oemGestureVisualFeedback",feedback)
                .put("oemGestureVisualFeedbackEnabled",feedback==0).put("oemFloatAssistInstalled",installed).put("diagnosticsBefore",diagnostics());
        if(assist!=1||method!=1||!installed||feedback!=0){
            report.put("skipped",true).put("reason","Requires installed/enabled gesture shortcut sidebar and gesture_visual_feedback=0 (OEM 0=on, 1=off); native settings were not changed")
                    .put("configurationRestored",true);persist();return report;
        }
        for(String key:BackGestureIconPolicy.parameterKeys())before.put(key,config.get(key));
        before.put(BackGestureIconPolicy.ENABLED,config.get(BackGestureIconPolicy.ENABLED));
        before.put(ConfigSchema.SYSTEMUI_MASTER,config.get(ConfigSchema.SYSTEMUI_MASTER));
        require(before.size()==20,"Expected all twenty gesture/master keys");report.put("before",new JSONObject(before));persist();
        Set<String> existing=new LinkedHashSet<>();File iconDirectory=LauncherIconStore.directory(context);
        File[] files=iconDirectory.listFiles();if(files!=null)for(File file:files)existing.add(file.getName());
        String[] hashes=null;AccessibilityServiceInfo oldInfo=automation.getServiceInfo();int oldFlags=oldInfo==null?0:oldInfo.flags;
        boolean configured=false;Throwable failure=null;
        try{
            AccessibilityServiceInfo info=automation.getServiceInfo();info.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;automation.setServiceInfo(info);
            home();capture("00-before");requireLauncher();
            Bitmap baseline=automation.takeScreenshot();require(baseline!=null,"Display size unavailable");int width=baseline.getWidth(),height=baseline.getHeight();baseline.recycle();
            require(height>width,"Run portrait verification at the current device density");report.put("displayWidth",width).put("displayHeight",height);
            hashes=BackGesturePresets.importMiku(context);Map<String,String> values=new LinkedHashMap<>();
            values.putAll(BackGesturePresets.values(0,hashes));values.putAll(BackGesturePresets.values(1,hashes));
            values.put(BackGestureIconPolicy.ENABLED,"1");values.put(ConfigSchema.SYSTEMUI_MASTER,"1");
            configured=true;require(config.save(values).success,"Cannot apply Miku preset");
            report.put("applied",new JSONObject(values));persist();waitForArtwork();
            for(int side=0;side<2;side++)gesture(side,width,height);
        }catch(Throwable error){failure=error;report.put("error",error.toString());}
        finally{
            try{
                if(configured)require(config.save(before).success,"Cannot restore gesture configuration");
                for(Map.Entry<String,String> entry:before.entrySet())require(entry.getValue().equals(config.get(entry.getKey())),"Changed key after restore: "+entry.getKey());
                report.put("configurationRestored",true).put("restoredKeyCount",before.size()).put("diagnosticsAfter",diagnostics());
                // Presets are bundled user-facing resources. Leave newly imported
                // hashes available rather than infer ownership from current refs.
                JSONArray retained=new JSONArray();if(hashes!=null)for(String hash:hashes)if(!existing.contains(hash+".png"))retained.put(hash);
                report.put("newPresetAssetsRetained",retained).put("assetCleanup","No pre-existing or newly imported user-facing preset image was deleted");
                home();SystemClock.sleep(500);capture("99-restored");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            if(oldInfo!=null){oldInfo.flags=oldFlags;automation.setServiceInfo(oldInfo);}persist();
        }
        if(failure!=null)throw new AssertionError("Gesture verification failed; evidence at "+directory,failure);
        report.put("visualReviewRequired",true).put("validationScope","Shortcut window visibility proves hover only; inspect the normal/hover PNGs for Miku artwork and retained background");persist();return report;
    }
    void gesture(int side,int width,int height)throws Exception{
        home();requireLauncher();String name=side==0?"left":"right";JSONObject item=new JSONObject().put("side",name).put("diagnosticsBefore",diagnostics());cases.put(item);persist();
        float start=side==0?1:width-2,y=height*.55f,destination=side==0?width*.23f:width*.77f;
        float at=start;boolean pressed=false;long down=SystemClock.uptimeMillis();Sample normal=null,hover=null;
        try{
            send(down,MotionEvent.ACTION_DOWN,start,y);pressed=true;
            for(int step=1;step<=12;step++){at=start+(destination-start)*step/12;send(down,MotionEvent.ACTION_MOVE,at,y);SystemClock.sleep(22);}
            // Capture pixels immediately, but defer expensive PNG compression
            // until after CANCEL so it cannot advance the hold between samples.
            normal=sample(name+"-normal",down);
            JSONArray normalWindows=windows();item.put("normalElapsedMillis",normal.timing.getLong("sampleStartedElapsedMillis"))
                    .put("normalWindows",normalWindows).put("normalSampleBeforeShortcutWindow",!containsAssist(normalWindows));
            SystemClock.sleep(850);hover=sample(name+"-hover",down);
            JSONArray windows=windows();item.put("hoverElapsedMillis",SystemClock.uptimeMillis()-down).put("hoverWindows",windows)
                    .put("shortcutWindowVisible",containsAssist(windows)).put("hoverConfirmedByShortcutWindow",containsAssist(windows))
                    .put("diagnosticsAfter",diagnostics());persist();
        }finally{
            try{if(pressed)send(down,MotionEvent.ACTION_CANCEL,at,y);}
            finally{try{if(normal!=null)write(normal);}finally{if(hover!=null)write(hover);}}
        }
        SystemClock.sleep(350);capture(name+"-cancelled");
    }
    void send(long down,int action,float x,float y)throws Exception{
        long now=SystemClock.uptimeMillis();actions.put(new JSONObject().put("action",action).put("x",x).put("y",y).put("downTime",down).put("eventTime",now));persist();
        MotionEvent event=MotionEvent.obtain(down,now,action,x,y,0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{require(automation.injectInputEvent(event,true),"Input injection rejected: "+action);}finally{event.recycle();}
    }
    void home()throws Exception{
        actions.put(new JSONObject().put("action","HOME").put("at",SystemClock.uptimeMillis()));persist();
        require(automation.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME),"Cannot return to launcher");SystemClock.sleep(500);
    }
    void requireLauncher(){AccessibilityNodeInfo root=automation.getRootInActiveWindow();try{
        require(root!=null&&LAUNCHER.contentEquals(root.getPackageName()==null?"":root.getPackageName()),"Only the confirmed system launcher may receive the side gesture");
    }finally{if(root!=null)root.recycle();}}
    void waitForArtwork()throws Exception{
        long started=SystemClock.uptimeMillis();JSONObject state;
        // Allow the config observer to refresh even if a previous run left the
        // same resource diagnostic. Diagnostics supplement, not replace, pixels.
        SystemClock.sleep(1200);
        while(true){
            state=diagnostics();String resources=state.getString("resources");String adapter=state.getString("adapter");
            if(resources.equals("left=icon_and_background_ready;right=icon_and_background_ready")&&adapter.contains("installed=true")&&adapter.contains("wave=true"))break;
            if(SystemClock.uptimeMillis()-started>=8000)break;SystemClock.sleep(200);
        }
        report.put("artworkReadyWaitMillis",SystemClock.uptimeMillis()-started).put("diagnosticsReady",state);persist();
        require(state.getString("resources").equals("left=icon_and_background_ready;right=icon_and_background_ready")
                &&state.getString("adapter").contains("installed=true")&&state.getString("adapter").contains("wave=true"),"Custom arrow/background adapter is not ready; inspect diagnosticsReady");
    }
    JSONObject diagnostics()throws Exception{
        JSONObject state=new JSONObject();for(String suffix:new String[]{"adapter","resources","error","left","right"})state.put(suffix,config.diagnostic("ls_augment_back_icon_"+suffix));return state;
    }
    static final class Sample{
        final Bitmap bitmap;final File file;final JSONObject timing;
        Sample(Bitmap bitmap,File file,JSONObject timing){this.bitmap=bitmap;this.file=file;this.timing=timing;}
    }
    Sample sample(String name,long down)throws Exception{
        long started=SystemClock.uptimeMillis();Bitmap bitmap=automation.takeScreenshot();long completed=SystemClock.uptimeMillis();
        require(bitmap!=null,"Screenshot unavailable: "+name);File file=new File(directory,name+".png");
        JSONObject timing=new JSONObject().put("name",name).put("sampleStartedUptimeMillis",started).put("sampleCompletedUptimeMillis",completed)
                .put("sampleDurationMillis",completed-started);
        if(down>0)timing.put("sampleStartedElapsedMillis",started-down).put("sampleCompletedElapsedMillis",completed-down);
        samples.put(timing);return new Sample(bitmap,file,timing);
    }
    void write(Sample sample)throws Exception{
        try(FileOutputStream out=new FileOutputStream(sample.file)){require(sample.bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot write failed");}finally{sample.bitmap.recycle();}
        sample.timing.put("fileWrittenUptimeMillis",SystemClock.uptimeMillis());screens.put(sample.file.getAbsolutePath());persist();
    }
    void capture(String name)throws Exception{write(sample(name,0));}
    JSONArray windows()throws Exception{
        JSONArray result=new JSONArray();for(AccessibilityWindowInfo window:automation.getWindows()){
            AccessibilityNodeInfo root=window.getRoot();if(root==null)continue;
            try{Rect bounds=new Rect();window.getBoundsInScreen(bounds);result.put(new JSONObject().put("package",String.valueOf(root.getPackageName()))
                    .put("bounds",bounds.flattenToString()).put("active",window.isActive()).put("visible",root.isVisibleToUser()));}finally{root.recycle();}
        }return result;
    }
    boolean containsAssist(JSONArray windows)throws Exception{for(int i=0;i<windows.length();i++){JSONObject item=windows.getJSONObject(i);if(ASSIST.equals(item.getString("package"))&&item.getBoolean("visible"))return true;}return false;}
    void persist()throws Exception{Files.write(new File(directory,"evidence.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));}
    static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
