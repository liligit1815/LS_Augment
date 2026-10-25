package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import java.io.File;
import java.io.FileOutputStream;

/** Developer-only observed-screen gesture, keeps one downTime and records each phase. */
public final class UiSourceDragRunner extends Instrumentation {
    private Bundle args; private UiAutomation automation; private long down; private float x,y; private String label;
    @Override public void onCreate(Bundle value) { super.onCreate(value); args=value; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle(); boolean held=false;
        try {
            automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            String expected=args.getString("package","");
            if(!expected.equals("com.android.gallery3d")&&!expected.equals("ls.augment.com")&&!expected.equals("com.tencent.mobileqq")) throw new IllegalArgumentException("Unexpected source package");
            android.view.accessibility.AccessibilityNodeInfo root=automation.getRootInActiveWindow();
            if(root==null||!expected.contentEquals(root.getPackageName()))throw new IllegalStateException("Observed foreground changed");
            label=args.getString("label",""); if(!label.matches("[a-z0-9-]{1,60}"))throw new IllegalArgumentException("label");
            x=number("sx");y=number("sy");float tx=number("tx"),ty=number("ty");
            down=SystemClock.uptimeMillis();inject(MotionEvent.ACTION_DOWN);held=true;
            SystemClock.sleep(1500);capture("held");
            float sx=x,sy=y;
            for(int i=1;i<=50;i++){SystemClock.sleep(30);x=sx+(tx-sx)*i/50;y=sy+(ty-sy)*i/50;inject(MotionEvent.ACTION_MOVE);}
            SystemClock.sleep(1200);capture("target");
            inject("true".equals(args.getString("cancel"))?MotionEvent.ACTION_CANCEL:MotionEvent.ACTION_UP);held=false;
            SystemClock.sleep(900);capture("released");
            result.putString("status","gesture_completed_not_delivery_proof");finish(Activity.RESULT_OK,result);
        } catch(Throwable failure) {
            if(held)try{inject(MotionEvent.ACTION_CANCEL);}catch(Throwable ignored){}
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(failure));finish(Activity.RESULT_CANCELED,result);
        }
    }
    private float number(String key){float v=Float.parseFloat(args.getString(key));if(!Float.isFinite(v)||v<1||v>3000)throw new IllegalArgumentException(key);return v;}
    private void inject(int action){MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);e.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{if(!automation.injectInputEvent(e,true))throw new IllegalStateException("input_rejected");}finally{e.recycle();}}
    private void capture(String phase)throws Exception{Bitmap bitmap=automation.takeScreenshot();if(bitmap==null)throw new IllegalStateException("capture_failed");
        File dir=new File(getContext().getFilesDir(),"source-drag-evidence");dir.mkdirs();
        try(FileOutputStream out=new FileOutputStream(new File(dir,label+"-"+phase+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}}
}
