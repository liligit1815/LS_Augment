package ls.augment.com;

import android.app.*;
import android.os.*;
import android.view.*;
import android.view.accessibility.*;

/** Development-only real edge swipe/hold for the OEM transfer-station recognizer. */
public final class UiEdgeHoldRunner extends Instrumentation {
    Bundle args;
    @Override public void onCreate(Bundle args){super.onCreate(args);this.args=args;start();}
    @Override public void onStart(){
        Bundle result=new Bundle();
        try{
            UiAutomation ui=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            android.accessibilityservice.AccessibilityServiceInfo service=ui.getServiceInfo();
            service.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;ui.setServiceInfo(service);
            SystemClock.sleep(600);
            String expected=args.getString("expectedPackage");boolean observed=false;
            for(AccessibilityWindowInfo w:ui.getWindows()){
                AccessibilityNodeInfo root=w.getRoot();
                if(root!=null && expected!=null && expected.contentEquals(root.getPackageName()))observed=true;
            }
            if(!observed)throw new IllegalStateException("Expected visible app missing");
            float x=Float.parseFloat(args.getString("x")),y=Float.parseFloat(args.getString("y")),end=Float.parseFloat(args.getString("endX"));
            int width=getTargetContext().getResources().getDisplayMetrics().widthPixels,height=getTargetContext().getResources().getDisplayMetrics().heightPixels;
            if(x<0 || end<0 || x>=width || end>=width || y<0 || y>=height || Math.abs(end-x)>width/2)throw new IllegalArgumentException("Observed edge coordinates required");
            long down=SystemClock.uptimeMillis();inject(ui,down,MotionEvent.ACTION_DOWN,x,y);
            for(int n=1;n<=18;n++){SystemClock.sleep(16);inject(ui,down,MotionEvent.ACTION_MOVE,x+(end-x)*n/18f,y);}
            SystemClock.sleep(700);inject(ui,down,MotionEvent.ACTION_UP,end,y);
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}
    }
    void inject(UiAutomation ui,long down,int action,float x,float y){
        MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);e.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{if(!ui.injectInputEvent(e,true))throw new IllegalStateException("Input rejected");}finally{e.recycle();}
    }
}
