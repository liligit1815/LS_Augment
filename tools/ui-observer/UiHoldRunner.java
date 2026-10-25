package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.util.ArrayList;

/** ADB-only stationary press: shared downTime, with no MOVE that cancels OEM long press. */
public final class UiHoldRunner extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments=args; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            UiAutomation automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityServiceInfo info=automation.getServiceInfo();
            info.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS
                    |AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS;
            automation.setServiceInfo(info);
            SystemClock.sleep(300);
            String id=arguments.getString("viewId", "com.android.systemui:id/dynamic_island_permanent");
            int duration=Integer.parseInt(arguments.getString("durationMs", "650"));
            if(!id.startsWith("com.android.systemui:id/") || duration<350 || duration>1600)
                throw new IllegalArgumentException("Invalid SystemUI hold request");
            ArrayList<AccessibilityNodeInfo> matches=new ArrayList<>();
            for(AccessibilityWindowInfo window:automation.getWindows()) {
                AccessibilityNodeInfo root=window.getRoot(); if(root==null)continue;
                for(AccessibilityNodeInfo node:root.findAccessibilityNodeInfosByViewId(id))
                    if(node.isVisibleToUser())matches.add(node);
            }
            if(matches.size()!=1)throw new IllegalStateException("Expected one visible native island, found "+matches.size());
            Rect bounds=new Rect();matches.get(0).getBoundsInScreen(bounds);
            if(bounds.isEmpty())throw new IllegalStateException("Empty observed bounds");
            float x=bounds.exactCenterX(),y=bounds.exactCenterY();
            long down=SystemClock.uptimeMillis();
            inject(automation,down,MotionEvent.ACTION_DOWN,x,y);
            try { SystemClock.sleep(duration); }
            finally { inject(automation,down,MotionEvent.ACTION_UP,x,y); }
            result.putString("bounds",bounds.toShortString());
            result.putString("events","DOWN,UP; sharedDownTime; no MOVE");
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        } catch(Throwable error) {
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED,result);
        }
    }
    private static void inject(UiAutomation automation,long down,int action,float x,float y) {
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { if(!automation.injectInputEvent(event,true))throw new IllegalStateException("Android rejected hold event"); }
        finally { event.recycle(); }
    }
}
