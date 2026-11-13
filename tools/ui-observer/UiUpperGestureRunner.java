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

/** Development-only injection, gated to an observed original app in the top band. */
public final class UiUpperGestureRunner extends Instrumentation {
    Bundle args;
    @Override public void onCreate(Bundle value){super.onCreate(value);args=value;start();}
    @Override public void onStart(){
        Bundle result=new Bundle();
        try{
            String expected=args.getString("expectedPackage"),direction=args.getString("direction");
            boolean wallpaper="wallpaper".equals(args.getString("expectedPage"));
            if(expected==null || expected.isEmpty() || expected.equals("com.android.systemui")!=wallpaper
                    || !("up".equals(direction)||"down".equals(direction)||"pinch".equals(direction)||"cancel".equals(direction)||"tap".equals(direction)))
                throw new IllegalArgumentException("Explicit app package and gesture direction required");
            UiAutomation ui=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityServiceInfo info=ui.getServiceInfo();info.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;ui.setServiceInfo(info);
            SystemClock.sleep(500);
            int width=getTargetContext().getResources().getDisplayMetrics().widthPixels;
            int height=Math.round(width*9f/16f);boolean found=false;
            for(AccessibilityWindowInfo window:ui.getWindows()){
                AccessibilityNodeInfo root=window.getRoot();Rect r=new Rect();window.getBoundsInScreen(r);
                if(root!=null && expected.contentEquals(root.getPackageName()) && r.top>=0 && r.top<height/2 && r.bottom<=height+2 && r.height()>height/2
                        && (!wallpaper || wallpaperNode(root)))found=true;
            }
            if(!found)throw new IllegalStateException("Expected app is not in the physical top window: "+expected);
            MotionEvent.PointerProperties[] p=new MotionEvent.PointerProperties[2];MotionEvent.PointerCoords[] c=new MotionEvent.PointerCoords[2];
            for(int n=0;n<2;n++){p[n]=new MotionEvent.PointerProperties();p[n].id=n;p[n].toolType=MotionEvent.TOOL_TYPE_FINGER;c[n]=new MotionEvent.PointerCoords();c[n].pressure=1;c[n].size=1;}
            boolean up="up".equals(direction);float startY=height*(up?.75f:.25f),delta=height*(up?-.42f:.42f);
            if("pinch".equals(direction)||"tap".equals(direction)){startY=height*.5f;delta=0;}
            c[0].x=width*.38f;c[1].x=width*.62f;c[0].y=c[1].y=startY;
            long down=SystemClock.uptimeMillis();inject(ui,down,0,1,p,c);SystemClock.sleep(40);inject(ui,down,5|(1<<8),2,p,c);
            for(int n=1;n<=20;n++){
                SystemClock.sleep(16);float progress=n/20f;c[0].y=c[1].y=startY+delta*progress;
                if("pinch".equals(direction)){c[0].x=width*(.38f-.12f*progress);c[1].x=width*(.62f+.12f*progress);}
                inject(ui,down,2,2,p,c);
            }
            if("cancel".equals(direction))inject(ui,down,3,2,p,c);
            else{inject(ui,down,6|(1<<8),2,p,c);SystemClock.sleep(30);inject(ui,down,1,1,p,c);}
            result.putString("status","pass");result.putString("direction",direction);finish(Activity.RESULT_OK,result);
        }catch(Throwable e){result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}
    }
    static boolean wallpaperNode(AccessibilityNodeInfo node){
        CharSequence label=node.getContentDescription();
        if(node.isVisibleToUser() && label!=null && label.toString().startsWith("顶部壁纸，点击将主区应用移到顶部"))return true;
        for(int n=0;n<node.getChildCount();n++){AccessibilityNodeInfo child=node.getChild(n);if(child!=null && wallpaperNode(child))return true;}
        return false;
    }
    static void inject(UiAutomation ui,long down,int action,int count,MotionEvent.PointerProperties[] p,MotionEvent.PointerCoords[] c){
        MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,count,p,c,0,0,1,1,0,0,InputDevice.SOURCE_TOUCHSCREEN,0);
        try{if(!ui.injectInputEvent(e,true))throw new IllegalStateException("Input injection rejected");}finally{e.recycle();}
    }
}
