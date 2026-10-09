package ls.augment.com;

import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: a real launcher drag; the caller owns layout verification and restoration. */
final class LauncherGridDragDeviceCases {
    private static final String LAUNCHER="com.zte.mifavor.launcher";
    private LauncherGridDragDeviceCases(){}

    static JSONObject run(Instrumentation test,Bundle args)throws Exception{
        Context context=test.getTargetContext();UiAutomation automation=test.getUiAutomation();
        PowerManager power=(PowerManager)context.getSystemService(Context.POWER_SERVICE);
        require(power!=null&&power.isInteractive(),"Wake and unlock the device before the launcher drag");
        AccessibilityNodeInfo root=automation.getRootInActiveWindow();
        require(root!=null&&LAUNCHER.contentEquals(root.getPackageName()==null?"":root.getPackageName()),"Foreground accessibility window must be the system launcher");
        int width=context.getResources().getDisplayMetrics().widthPixels,height=context.getResources().getDisplayMetrics().heightPixels;
        float destinationX=coordinate(args,"destinationX"),destinationY=coordinate(args,"destinationY");
        require(args.containsKey("startX")==args.containsKey("startY"),"Both startX and startY must be supplied together");
        float startX,startY;Rect selectedBounds=null;String label=args.getString("label","信息");
        if(args.containsKey("startX")){startX=coordinate(args,"startX");startY=coordinate(args,"startY");}
        else{
            AccessibilityNodeInfo item=findExact(root,label,0);require(item!=null,"Visible launcher item not found: "+label);
            selectedBounds=new Rect();item.getBoundsInScreen(selectedBounds);
            AccessibilityNodeInfo parent=item;
            for(int depth=0;parent!=null&&depth<8;depth++,parent=parent.getParent()){
                Rect bounds=new Rect();parent.getBoundsInScreen(bounds);
                if((parent.isLongClickable()||parent.isClickable())&&parent.isVisibleToUser()&&bounds.width()>0&&bounds.height()>0&&bounds.width()<width*.5f&&bounds.height()<height*.35f){selectedBounds=bounds;break;}
            }
            require(!selectedBounds.isEmpty(),"The chosen launcher item must have visible bounds");startX=selectedBounds.exactCenterX();startY=selectedBounds.exactCenterY();
        }
        require(inside(startX,startY,width,height)&&inside(destinationX,destinationY,width,height),"Drag coordinates must lie within the current display");
        require(Math.hypot(destinationX-startX,destinationY-startY)>12,"Drag destination must differ from the source");
        JSONObject report=new JSONObject().put("launcher",LAUNCHER).put("source",args.containsKey("startX")?"explicit-coordinates":"exact-accessibility-label")
                .put("label",label).put("startX",startX).put("startY",startY).put("destinationX",destinationX).put("destinationY",destinationY)
                .put("displayWidth",width).put("displayHeight",height).put("holdMillis",650);
        if(selectedBounds!=null)report.put("sourceBounds",selectedBounds.flattenToString());
        JSONArray actions=new JSONArray();report.put("actions",actions);
        File directory=new File(context.getExternalFilesDir(null),"launcher-grid-tests");
        require(directory.isDirectory()||directory.mkdirs(),"Launcher drag evidence directory is available");
        long downTime=SystemClock.uptimeMillis();boolean pressed=false;float lastX=startX,lastY=startY;Throwable failure=null;
        try{
            send(automation,actions,downTime,MotionEvent.ACTION_DOWN,startX,startY);pressed=true;
            SystemClock.sleep(650);
            for(int step=1;step<=16;step++){
                lastX=startX+(destinationX-startX)*step/16;lastY=startY+(destinationY-startY)*step/16;
                send(automation,actions,downTime,MotionEvent.ACTION_MOVE,lastX,lastY);SystemClock.sleep(25);
            }
            send(automation,actions,downTime,MotionEvent.ACTION_UP,destinationX,destinationY);pressed=false;
            long elapsed=SystemClock.uptimeMillis()-downTime;
            require(elapsed<5000,"Gesture injection exceeded the five-second bound");
            report.put("gestureMillis",elapsed).put("injectedEvents",actions.length()).put("success",true);
        }catch(Throwable problem){failure=problem;report.put("success",false).put("error",problem.toString());}
        finally{
            if(pressed)try{send(automation,actions,downTime,MotionEvent.ACTION_CANCEL,lastX,lastY);}catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            try{
                if(!"false".equalsIgnoreCase(String.valueOf(args.get("screenshot")))){
                    SystemClock.sleep(300);Bitmap image=automation.takeScreenshot();require(image!=null,"Launcher drag screenshot is available");
                    File shot=new File(directory,failure==null?"12x12-drag-after.png":"12x12-drag-failure.png");
                    try(FileOutputStream out=new FileOutputStream(shot)){require(image.compress(Bitmap.CompressFormat.PNG,100,out),"Launcher screenshot encoded");}finally{image.recycle();}
                    report.put("screenshot",shot.getAbsolutePath());
                }
                File evidence=new File(directory,"12x12-drag.json");Files.write(evidence.toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));report.put("evidence",evidence.getAbsolutePath());
            }catch(Throwable diagnostic){if(failure==null)failure=diagnostic;else failure.addSuppressed(diagnostic);}
        }
        if(failure!=null)throw new AssertionError("Real launcher drag failed: "+report,failure);
        return report;
    }
    private static void send(UiAutomation automation,JSONArray actions,long downTime,int action,float x,float y)throws Exception{
        long when=SystemClock.uptimeMillis();MotionEvent event=MotionEvent.obtain(downTime,when,action,x,y,0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{require(automation.injectInputEvent(event,true),"Android rejected launcher motion event "+action);}finally{event.recycle();}
        actions.put(new JSONObject().put("action",action).put("x",x).put("y",y).put("elapsedMillis",when-downTime));
    }
    private static AccessibilityNodeInfo findExact(AccessibilityNodeInfo node,String label,int depth){
        if(node==null||depth>32)return null;
        if(node.isVisibleToUser()&&(label.contentEquals(node.getText()==null?"":node.getText())||label.contentEquals(node.getContentDescription()==null?"":node.getContentDescription())))return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=findExact(node.getChild(i),label,depth+1);if(found!=null)return found;}return null;
    }
    private static float coordinate(Bundle args,String key){
        Object value=args.get(key);require(value!=null,"Required coordinate: "+key);
        float result=Float.parseFloat(String.valueOf(value));require(Float.isFinite(result),"Coordinate must be finite: "+key);return result;
    }
    private static boolean inside(float x,float y,int width,int height){return x>=0&&y>=0&&x<width&&y<height;}
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
