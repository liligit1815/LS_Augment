package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;

/** Inject actual two-finger Android input into the foreground module crop UI. */
public final class UiGestureRunner extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments=args; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            UiAutomation automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            SystemClock.sleep(300);
            AccessibilityNodeInfo root=automation.getRootInActiveWindow();
            if(root==null || !"ls.augment.com".contentEquals(root.getPackageName()))
                throw new IllegalStateException("The module must be foreground");
            float cx=number("cx"),cy=number("cy"),start=number("startSpan"),end=number("endSpan");
            int minimum=android.view.ViewConfiguration.get(getTargetContext()).getScaledMinimumScalingSpan();
            result.putInt("minimumScalingSpanPx",minimum);
            result.putFloat("startSpanPx",start);result.putFloat("endSpanPx",end);
            if(Math.max(start,end)<minimum)
                throw new IllegalArgumentException("Both pointer spans are below the device's scale-gesture threshold: "+minimum);
            if(start<20 || end<20 || Math.max(start,end)>1000 || cx<500 || cx>716 || cy<100 || cy>2500)
                throw new IllegalArgumentException("Invalid observed crop gesture bounds");
            MotionEvent.PointerProperties[] properties=new MotionEvent.PointerProperties[2];
            MotionEvent.PointerCoords[] coordinates=new MotionEvent.PointerCoords[2];
            for(int i=0;i<2;i++) {
                properties[i]=new MotionEvent.PointerProperties(); properties[i].id=i;
                properties[i].toolType=MotionEvent.TOOL_TYPE_FINGER;
                coordinates[i]=new MotionEvent.PointerCoords();coordinates[i].pressure=1;coordinates[i].size=1;
            }
            long down=SystemClock.uptimeMillis();
            position(coordinates,cx,cy,start);
            inject(automation,down,MotionEvent.ACTION_DOWN,1,properties,coordinates);
            SystemClock.sleep(30);
            inject(automation,down,MotionEvent.ACTION_POINTER_DOWN|(1<<MotionEvent.ACTION_POINTER_INDEX_SHIFT),2,properties,coordinates);
            for(int i=1;i<=36;i++) {
                SystemClock.sleep(20);position(coordinates,cx,cy,start+(end-start)*i/36f);
                inject(automation,down,MotionEvent.ACTION_MOVE,2,properties,coordinates);
            }
            inject(automation,down,MotionEvent.ACTION_POINTER_UP|(1<<MotionEvent.ACTION_POINTER_INDEX_SHIFT),2,properties,coordinates);
            SystemClock.sleep(30);inject(automation,down,MotionEvent.ACTION_UP,1,properties,coordinates);
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        } catch(Throwable error) {
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED,result);
        }
    }
    private float number(String key) { return Float.parseFloat(arguments.getString(key)); }
    private static void position(MotionEvent.PointerCoords[] c,float x,float y,float span) {
        c[0].x=x-span/2;c[1].x=x+span/2;c[0].y=c[1].y=y;
    }
    private static void inject(UiAutomation automation,long down,int action,int count,
                               MotionEvent.PointerProperties[] p,MotionEvent.PointerCoords[] c) {
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,count,p,c,0,0,1,1,0,0,InputDevice.SOURCE_TOUCHSCREEN,0);
        try { if(!automation.injectInputEvent(event,true))throw new IllegalStateException("Android rejected touch event"); }
        finally { event.recycle(); }
    }
}
