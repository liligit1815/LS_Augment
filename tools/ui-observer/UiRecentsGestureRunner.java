package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;

/** Controlled Settings-only gesture for privacy entry/cancel frame recordings. */
public final class UiRecentsGestureRunner extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle value) { super.onCreate(value); args=value; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle(); UiAutomation ui=null;long down=0;float x=0,y=0;boolean held=false;
        try {
            ui=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityNodeInfo root=ui.getRootInActiveWindow();
            for(int i=0;i<15&&(root==null||!"com.android.settings".contentEquals(root.getPackageName()));i++){
                SystemClock.sleep(100);root=ui.getRootInActiveWindow();
            }
            if(root==null||!"com.android.settings".contentEquals(root.getPackageName())) throw new IllegalStateException("Settings must be foreground; actual="+(root==null?"null":root.getPackageName()));
            int width=getContext().getResources().getDisplayMetrics().widthPixels;
            int height=getContext().getResources().getDisplayMetrics().heightPixels;
            x=width/2f;y=height-4;float start=y,end=height*.66f;
            down=SystemClock.uptimeMillis();inject(ui,down,MotionEvent.ACTION_DOWN,x,y);held=true;
            for(int i=1;i<=30;i++){SystemClock.sleep(16);y=start+(end-start)*i/30;inject(ui,down,MotionEvent.ACTION_MOVE,x,y);}
            SystemClock.sleep(650);
            boolean cancel="true".equals(args.getString("cancel"));
            inject(ui,down,cancel?MotionEvent.ACTION_CANCEL:MotionEvent.ACTION_UP,x,y);held=false;
            result.putString("status","gesture_injected;visual_result_requires_recording");finish(Activity.RESULT_OK,result);
        }catch(Throwable error){
            if(held)try{inject(ui,down,MotionEvent.ACTION_CANCEL,x,y);}catch(Throwable ignored){}
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);
        }
    }
    private static void inject(UiAutomation ui,long down,int action,float x,float y){
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{if(!ui.injectInputEvent(event,true))throw new IllegalStateException("Input rejected");}finally{event.recycle();}
    }
}
