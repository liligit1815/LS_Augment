package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import org.json.JSONObject;

/** The guide is completed by the real framework gesture and focused Step activity. */
final class AtomicWorkbenchGestureGuideDeviceCases {
    static JSONObject run(Instrumentation test) throws Exception {
        SharedPreferences prefs=test.getTargetContext().getSharedPreferences(AtomicWorkbenchGestureGuide.PREFS,0);
        boolean had=prefs.contains(AtomicWorkbenchGestureGuide.SEEN),seen=prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN,false);
        Activity settings=null,step=null;
        AppConfig config=new AppConfig(test.getTargetContext());
        if(!config.getBoolean(AtomicWorkbenchConfig.ENABLED))throw new AssertionError("Enable Step before the gesture exercise");
        try {
            prefs.edit().remove(AtomicWorkbenchGestureGuide.SEEN).commit();
            settings=test.startActivitySync(new Intent(test.getTargetContext(),AtomicWorkbenchSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            Activity owner=settings;
            Field field=AtomicWorkbenchSettingsActivity.class.getDeclaredField("gestureGuide");field.setAccessible(true);
            long deadline=SystemClock.uptimeMillis()+10000;
            while(field.get(settings)==null&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);
            AtomicWorkbenchGestureGuide guide=(AtomicWorkbenchGestureGuide)field.get(settings);
            require(guide!=null&&guide.isShowing(),"Actual practice overlay visible");
            AtomicWorkbenchGestureGuide.Practice practice=(AtomicWorkbenchGestureGuide.Practice)guide.view();
            require(practice.getWidth()>0&&practice.getHeight()>0,"Full-screen practice measured");
            require(!prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN,false),"Viewing never completes practice");
            File file=new File(test.getTargetContext().getExternalFilesDir(null),"step-practice-"+BuildConfig.VERSION_CODE+".png");
            Bitmap image=test.getUiAutomation().takeScreenshot();
            try(FileOutputStream out=new FileOutputStream(file)){image.compress(Bitmap.CompressFormat.PNG,100,out);}finally{image.recycle();}
            test.runOnMainSync(guide::cancel);SystemClock.sleep(150);
            require(!prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN,false),"Skip does not mark complete");
            test.runOnMainSync(()->owner.getWindow().getDecorView().findViewWithTag("step-gesture-guide-replay").performClick());
            SystemClock.sleep(250);guide=(AtomicWorkbenchGestureGuide)field.get(settings);
            require(guide!=null&&guide.isShowing(),"Manual practice reopens");
            Instrumentation.ActivityMonitor monitor=test.addMonitor(AtomicWorkbenchActivity.class.getName(),null,false);
            AtomicWorkbenchGesturePolicy.Geometry g=practice.geometry;
            float start=g.width-g.edge/2,end=start-(g.minInward+24)*g.density,y=(g.minY+g.maxY)/2;
            long down=SystemClock.uptimeMillis();
            for(int i=0;i<=18;i++){
                long now=SystemClock.uptimeMillis();
                MotionEvent event=MotionEvent.obtain(down,now,i==0?0:i==18?1:2,start+(end-start)*i/18,y,0);
                event.setSource(InputDevice.SOURCE_TOUCHSCREEN);test.getUiAutomation().injectInputEvent(event,true);event.recycle();SystemClock.sleep(20);
            }
            step=test.waitForMonitorWithTimeout(monitor,10000);test.removeMonitor(monitor);
            require(step!=null,"Framework gesture actually opened Step");
            deadline=SystemClock.uptimeMillis()+5000;
            while(!prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN,false)&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);
            require(prefs.getBoolean(AtomicWorkbenchGestureGuide.SEEN,false),"Focused accepted entry completes guide");
            return new JSONObject().put("success",true).put("checks",7).put("screenshot",file.getAbsolutePath());
        } finally {
            Activity a=step,b=settings;test.runOnMainSync(()->{if(a!=null)a.finish();if(b!=null)b.finish();});
            SharedPreferences.Editor edit=prefs.edit().remove("practice-start");
            if(had)edit.putBoolean(AtomicWorkbenchGestureGuide.SEEN,seen);else edit.remove(AtomicWorkbenchGestureGuide.SEEN);edit.commit();
        }
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
