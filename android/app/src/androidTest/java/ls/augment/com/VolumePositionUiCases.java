package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import org.json.JSONObject;

/** Real shared page and geometry; browsing cannot change saved feature values. */
final class VolumePositionUiCases {
    static JSONObject run(Instrumentation test)throws Exception{
        Context context=test.getTargetContext();Map<String,String> before=new AppConfig(context).snapshot();
        Activity activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                .putExtra("target","audio").putExtra(ModuleNavigation.EXTRA_ROUTE,"group/audio/volume_position").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        JSONObject report=new JSONObject();Throwable[] failure={null};
        try{
            test.waitForIdleSync();SystemClock.sleep(400);
            test.runOnMainSync(()->{try{
                View root=activity.getWindow().getDecorView();
                View path=root.findViewWithTag("page-path"),card=root.findViewWithTag("application-category:audio:volume_position");
                if(path==null||card==null)throw new AssertionError("Missing common page/card");
                int[] a=new int[2],b=new int[2];path.getLocationOnScreen(a);card.getLocationOnScreen(b);
                float gap=(b[1]-a[1]-path.getHeight())/activity.getResources().getDisplayMetrics().density;
                if(gap<7.5f||gap>12.5f)throw new AssertionError("Navigation gap="+gap);
                for(String route:new String[]{"home","target-audio","group/audio/volume_position"})if(root.findViewWithTag("breadcrumb:"+route)==null)throw new AssertionError(route);
                Switch toggle=root.findViewWithTag("config:"+SystemUiOptions.VOLUME_SAME_SIDE);
                boolean prerequisite=VolumePositionSettings.multiAppEnabled(activity);
                if(toggle==null||toggle.isEnabled()!=prerequisite)throw new AssertionError("Native prerequisite mismatch");
                Field field=activity.getClass().getDeclaredField("controls");field.setAccessible(true);
                Spinner choice=(Spinner)((Map<?,?>)field.get(activity)).get(SystemUiOptions.VOLUME_POSITION);
                if(choice.getCount()!=2||!"左侧".equals(choice.getItemAtPosition(0))||!"右侧".equals(choice.getItemAtPosition(1)))throw new AssertionError("Choice labels");
                ViewGroup row=(ViewGroup)toggle.getParent();row.getChildAt(row.getChildCount()-1).performClick();
                report.put("contentGapDp",gap).put("prerequisite",prerequisite).put("fontScale",activity.getResources().getConfiguration().fontScale).put("orientation",activity.getResources().getConfiguration().orientation);
            }catch(Throwable error){failure[0]=error;}});
            if(failure[0]!=null)throw new AssertionError(failure[0]);
            test.waitForIdleSync();SystemClock.sleep(300);
            File dir=new File(context.getExternalFilesDir(null),"volume-position-ui-"+BuildConfig.VERSION_CODE);if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("Evidence directory");
            File file=new File(dir,"page-"+report.get("fontScale")+"-"+report.get("orientation")+"-"+report.get("prerequisite")+".png");
            Bitmap pixels=test.getUiAutomation().takeScreenshot();try(FileOutputStream out=new FileOutputStream(file)){pixels.compress(Bitmap.CompressFormat.PNG,100,out);}finally{pixels.recycle();}
            if(!before.equals(new AppConfig(context).snapshot()))throw new AssertionError("Browsing changed configuration");
            return report.put("screenshot",file.getAbsolutePath()).put("success",true);
        }finally{test.runOnMainSync(activity::finish);}
    }
}
