package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/** Actual public browser dispatch only. This deliberately does not claim an app-originated drag. */
final class AtomicWorkbenchBrowserSearchDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private AtomicWorkbenchActivity activity;
    private String stage="preflight";
    private int browserTask=-1;
    private String browserPackage;
    private AtomicWorkbenchBrowserSearchDeviceCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new AtomicWorkbenchBrowserSearchDeviceCases(test).run();}
    private JSONObject run()throws Exception{
        JSONObject report=new JSONObject().put("success",false).put("source","SYNTHETIC_TEXT_DISPATCH_NO_SOURCE_DRAG")
                .put("appToAppDragVerified",false).put("imageSearchVerified",false);
        AppConfig config=new AppConfig(context);String quick=config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        boolean dispatched=false,recovered=false,restored=false;int automationFlags=test.getUiAutomation().getServiceInfo().flags;
        try{
            android.accessibilityservice.AccessibilityServiceInfo info=test.getUiAutomation().getServiceInfo();
            info.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
            test.getUiAutomation().setServiceInfo(info);
            require(config.getBoolean(AtomicWorkbenchConfig.ENABLED)&&!AtomicWorkbenchCleanup.pending(),"workspace_preflight");
            require(!context.getSystemService(android.app.KeyguardManager.class).isKeyguardLocked(),"unlock_required");
            android.content.pm.ResolveInfo web=context.getPackageManager().resolveActivity(
                    new Intent(Intent.ACTION_VIEW,android.net.Uri.parse("https://example.com/")),android.content.pm.PackageManager.MATCH_DEFAULT_ONLY);
            require(web!=null&&web.activityInfo!=null,"browser_missing");browserPackage=web.activityInfo.packageName;
            require(AtomicWorkbenchBrowserSearch.textReceiver(context,browserPackage,web.activityInfo.applicationInfo.uid)!=null,"search_capability_missing");
            require(config.save(Collections.singletonMap(AtomicWorkbenchConfig.QUICK_OPEN_APPS,"1")).success,"quick_save");
            activity=(AtomicWorkbenchActivity)test.startActivitySync(new Intent(context,AtomicWorkbenchActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(()->{activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
            stage="workspace_ready";
            // A fresh workbench legitimately has no main app yet. Launch through
            // its ordinary tile, then require the real main frame/focus below.
            await(()->main(()->(Boolean)call("canInteract",new Class<?>[0])));
            stage="browser_repository";
            AtomicReference<AtomicWorkbenchAppRepository.App> app=new AtomicReference<>();
            await(()->main(()->{for(AtomicWorkbenchAppRepository.App a:(java.util.ArrayList<AtomicWorkbenchAppRepository.App>)field("apps"))
                if(browserPackage.equals(a.component.getPackageName())){app.set(a);return true;}return false;}));
            main(()->{View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+app.get().key());
                require(tile!=null,"browser_tile_missing");tile.requestRectangleOnScreen(new Rect(0,0,tile.getWidth(),tile.getHeight()),true);require(tile.performClick(),"browser_tile_click");return null;});
            stage="browser_slot_ready";
            await(()->main(()->{
                // A stale shelf offers this normal explicit alternative. Do not
                // bypass the task gate or treat a modal as a launched browser.
                android.app.Dialog dialog=(android.app.Dialog)field("closeDialog");
                if(dialog!=null&&dialog.isShowing()){
                    View create=findButton(dialog.getWindow().getDecorView(),"新开应用");
                    if(create!=null&&create.isEnabled()){require(create.performClick(),"new_browser_click");report.put("explicitNewAppSelected",true);}
                }
                AtomicWorkbenchWorkspaceModel m=(AtomicWorkbenchWorkspaceModel)field("model");
                return m.find(app.get().key())==m.mainWindowId()&&(Boolean)call("mainReady",new Class<?>[0]);}));
            final String query="RedMagicDuoDirectDrop"+UUID.randomUUID().toString().replace("-","").substring(0,8);
            stage="exact_browser_search";
            main(()->{
                AtomicWorkbenchWorkspaceModel m=(AtomicWorkbenchWorkspaceModel)field("model");int id=m.mainWindowId();Object slot=((Object[])field("slots"))[id];
                AtomicWorkbenchClient client=(AtomicWorkbenchClient)field("client");browserTask=(Integer)get(slot,"targetTaskId");
                AtomicWorkbenchDeliveryTarget target=new AtomicWorkbenchDeliveryTarget(client.inputSession(),(Long)field("launchGeneration"),(Integer)field("epoch"),
                        id,(Integer)get(slot,"displayId"),(String)get(slot,"displayName"),(String)get(slot,"displayUniqueId"),android.os.Process.myUid()/100000,
                        android.os.Process.myUid(),(Integer)get(slot,"targetUid"),browserTask,browserPackage,UUID.randomUUID().toString().replace("-",""),1,SystemClock.elapsedRealtime());
                report.put("originalTask",browserTask).put("originalDisplay",target.displayId);
                call("dispatchExactSearch",new Class<?>[]{AtomicWorkbenchDeliveryTarget.class,String.class},target,query);return null;
            });
            await(()->main(()->!(Boolean)field("busy")));
            String message=main(()->((android.widget.TextView)field("status")).getText().toString());
            report.put("searchAcknowledged",message.equals("已在目标浏览器中发起文字搜索"));
            require(report.getBoolean("searchAcknowledged"),"browser_search_not_acknowledged");
            await(()->queryVisible(report.getInt("originalDisplay"),query));
            report.put("queryObservedInsideOriginalDisplay",true).put("actualSearchPageObserved",true);dispatched=true;
            screenshot("passed");
        }catch(Exception|AssertionError failed){report.put("failureStage",stage).put("failureType",failed.getClass().getSimpleName());
            if(failed instanceof AssertionError)report.put("failureReason",failed.getMessage());
            if(activity!=null){report.put("workspaceStatus",main(()->((android.widget.TextView)field("status")).getText().toString()));screenshot("failed");}}
        finally{
            try{
                if(activity!=null){main(()->{call("requestCloseAll",new Class<?>[]{boolean.class},true);return null;});
                    await(()->!AtomicWorkbenchCleanup.pending()&&main(()->activity.isFinishing()||activity.isDestroyed()));
                    recovered=browserTask<0||taskOnPhone(browserTask,browserPackage);
                }else recovered=true;
            }catch(Exception|AssertionError failed){report.put("cleanupFailureType",failed.getClass().getSimpleName());}
            restored=config.save(Collections.singletonMap(AtomicWorkbenchConfig.QUICK_OPEN_APPS,quick)).success&&quick.equals(config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS));
            android.accessibilityservice.AccessibilityServiceInfo info=test.getUiAutomation().getServiceInfo();info.flags=automationFlags;test.getUiAutomation().setServiceInfo(info);
        }
        return report.put("browserSameTaskReturned",recovered).put("quickSettingRestored",restored).put("success",dispatched&&recovered&&restored);
    }
    private void screenshot(String result)throws Exception{
        android.graphics.Bitmap screenshot=test.getUiAutomation().takeScreenshot();
        if(screenshot!=null){java.io.File directory=new java.io.File(context.getFilesDir(),"device-regression-results");directory.mkdirs();
            try(java.io.FileOutputStream output=new java.io.FileOutputStream(new java.io.File(directory,"browser-search-"+BuildConfig.VERSION_CODE+"-"+result+".png"))){screenshot.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output);}finally{screenshot.recycle();}}
    }
    private static View findButton(View view,String label){
        if(view instanceof android.widget.Button&&label.contentEquals(((android.widget.Button)view).getText()))return view;
        if(view instanceof android.view.ViewGroup)for(int i=0;i<((android.view.ViewGroup)view).getChildCount();i++){
            View found=findButton(((android.view.ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}
        return null;
    }
    private boolean queryVisible(int display,String query){
        android.util.SparseArray<java.util.List<android.view.accessibility.AccessibilityWindowInfo>> all=test.getUiAutomation().getWindowsOnAllDisplays();
        java.util.List<android.view.accessibility.AccessibilityWindowInfo> windows=all.get(display);if(windows==null)return false;
        int[] remaining={4000};for(android.view.accessibility.AccessibilityWindowInfo w:windows){android.view.accessibility.AccessibilityNodeInfo root=w.getRoot();if(root!=null)try{if(findSearchPage(root,query,remaining,0))return true;}finally{root.recycle();}}return false;
    }
    private boolean findSearchPage(android.view.accessibility.AccessibilityNodeInfo node,String query,int[] remaining,int depth){
        if(--remaining[0]<0||depth>50)return false;
        if(node.isVisibleToUser()&&"android.webkit.WebView".contentEquals(node.getClassName()==null?"":node.getClassName())
                &&browserPackage.contentEquals(node.getPackageName()==null?"":node.getPackageName()))
            // A WebView title may appear before any page body is rendered.
            // Require query text inside its web document, not just its title.
            for(int i=0;i<node.getChildCount();i++){android.view.accessibility.AccessibilityNodeInfo child=node.getChild(i);if(child!=null)try{if(findQuery(child,query,remaining,depth+1))return true;}finally{child.recycle();}}
        for(int i=0;i<node.getChildCount();i++){android.view.accessibility.AccessibilityNodeInfo child=node.getChild(i);if(child!=null)try{if(findSearchPage(child,query,remaining,depth+1))return true;}finally{child.recycle();}}
        return false;
    }
    private boolean findQuery(android.view.accessibility.AccessibilityNodeInfo node,String query,int[] remaining,int depth){
        if(--remaining[0]<0||depth>50)return false;
        if(node.isVisibleToUser()&&browserPackage.contentEquals(node.getPackageName()==null?"":node.getPackageName())
                &&(node.getText()!=null&&node.getText().toString().contains(query)||node.getContentDescription()!=null&&node.getContentDescription().toString().contains(query)))return true;
        for(int i=0;i<node.getChildCount();i++){android.view.accessibility.AccessibilityNodeInfo child=node.getChild(i);if(child!=null)try{if(findQuery(child,query,remaining,depth+1))return true;}finally{child.recycle();}}return false;
    }
    private boolean taskOnPhone(int task,String pkg)throws Exception{
        try(android.os.ParcelFileDescriptor fd=test.getUiAutomation().executeShellCommand("dumpsys activity activities");java.io.InputStream input=new android.os.ParcelFileDescriptor.AutoCloseInputStream(fd)){
            byte[] data=input.readNBytes(1024*1024+1);require(data.length<=1024*1024,"task_read_truncated");int display=-1,count=0,found=-1;
            for(String line:new String(data,java.nio.charset.StandardCharsets.UTF_8).split("\\r?\\n")){
                if(line.startsWith("Display #")&&line.endsWith(" (activities from top to bottom):"))display=Integer.parseInt(line.substring(9,line.indexOf(' ',9)));
                if(line.startsWith("  * Task{")&&line.contains(" #"+task+" ")&&line.contains(":"+pkg+" U="+(android.os.Process.myUid()/100000)+" ")){count++;found=display;}}
            return count==1&&found==0;
        }
    }
    private Object field(String name)throws Exception{return get(activity,name);}
    private static Object get(Object object,String name)throws Exception{Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(object);}
    private Object call(String name,Class<?>[] types,Object...args)throws Exception{Method m=activity.getClass().getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(activity,args);}
    private <T>T main(Callable<T> callable)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(callable.call());}catch(Throwable t){error.set(t);}});if(error.get() instanceof Exception)throw(Exception)error.get();if(error.get()!=null)throw new AssertionError(error.get());return result.get();}
    private static void await(Callable<Boolean> state)throws Exception{long end=SystemClock.uptimeMillis()+20000;do{if(state.call())return;SystemClock.sleep(100);}while(SystemClock.uptimeMillis()<end);throw new AssertionError("browser_state_timeout");}
    private static void require(boolean value,String reason){if(!value)throw new AssertionError(reason);}
}
