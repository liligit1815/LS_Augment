package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.File;
import java.io.FileOutputStream;

/** One continuous, timestamp-correct drag of an observed owned launcher fixture. */
public final class UiDragRunner extends Instrumentation {
    private Bundle args;
    private long down;
    private float x,y;
    private UiAutomation automation;
    @Override public void onCreate(Bundle value) { super.onCreate(value); args=value; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityNodeInfo root=automation.getRootInActiveWindow();
            if(root==null || !"com.zte.mifavor.launcher".contentEquals(root.getPackageName()))
                throw new IllegalStateException("Launcher must be foreground, with no popup");
            String label=args.getString("sourceLabel","");
            if(!label.equals("LSA_MAIN_33") && !label.equals("LSA_CLONE_33"))
                throw new IllegalArgumentException("Only the owned fixture may be moved");
            AccessibilityNodeInfo source=null;
            for(AccessibilityNodeInfo node:root.findAccessibilityNodeInfosByText(label))
                if(label.contentEquals(node.getText()) && node.isVisibleToUser() && node.isClickable()) source=node;
            if(source==null)throw new IllegalStateException("Observed source is unavailable");
            android.graphics.Rect bounds=new android.graphics.Rect();source.getBoundsInScreen(bounds);
            x=number("sx");y=number("sy");float vx=number("vx"),vy=number("vy"),tx=number("tx"),ty=number("ty");
            if(!bounds.contains((int)x,(int)y))throw new IllegalArgumentException("Source point is outside the observed icon");
            down=SystemClock.uptimeMillis();inject(MotionEvent.ACTION_DOWN);
            try {
                SystemClock.sleep(900);capture("held");
                move(x-75,y,300);capture("started");
                move(vx,vy,650);SystemClock.sleep(1500);capture("outside");
                move(tx,ty,650);SystemClock.sleep(700);capture("target");
            } finally { inject(MotionEvent.ACTION_UP); }
            SystemClock.sleep(900);capture("released");
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        } catch(Throwable failure) {
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(failure));
            finish(Activity.RESULT_CANCELED,result);
        }
    }
    private float number(String key) {
        float value=Float.parseFloat(args.getString(key));
        int limit=key.endsWith("x")?getContext().getResources().getDisplayMetrics().widthPixels
                :getContext().getResources().getDisplayMetrics().heightPixels;
        if(!Float.isFinite(value)||value<1||value>=limit)throw new IllegalArgumentException("Invalid screen point");
        return value;
    }
    private void move(float tx,float ty,int duration) {
        float sx=x,sy=y;int steps=30;
        for(int i=1;i<=steps;i++) {
            SystemClock.sleep(duration/steps);x=sx+(tx-sx)*i/steps;y=sy+(ty-sy)*i/steps;inject(MotionEvent.ACTION_MOVE);
        }
    }
    private void inject(int action) {
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { if(!automation.injectInputEvent(event,true))throw new IllegalStateException("Touch injection rejected"); }
        finally {event.recycle();}
    }
    private void capture(String stage) throws Exception {
        Bitmap image=automation.takeScreenshot();
        if(image==null)throw new IllegalStateException("Screenshot unavailable");
        File folder=new File(getContext().getFilesDir(),"owned-drag-evidence");folder.mkdirs();
        try(FileOutputStream output=new FileOutputStream(new File(folder,stage+".png"))) {
            image.compress(Bitmap.CompressFormat.PNG,100,output);
        }finally {image.recycle();}
    }
}
