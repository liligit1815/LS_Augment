package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.widget.SeekBar;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real settings input only: no workbench displays, app tasks or external content. */
final class AtomicWorkbenchEntryUiDeviceCases {
    private static final String AREA="atomic_workbench_trigger_area_scale";
    private static final String SENSITIVITY="atomic_workbench_corner_sensitivity";
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final UiAutomation automation;
    private final JSONArray screens=new JSONArray();
    private Activity activity;
    private File directory;

    private AtomicWorkbenchEntryUiDeviceCases(Instrumentation test) {
        this.test=test; context=test.getTargetContext();config=new AppConfig(context);
        automation=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
    }
    static JSONObject run(Instrumentation test)throws Exception{return new AtomicWorkbenchEntryUiDeviceCases(test).execute();}

    private JSONObject execute()throws Exception {
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        directory=new File(context.getExternalFilesDir(null),"workbench-entry-ui-"+BuildConfig.VERSION_CODE
                +"-font-"+context.getResources().getConfiguration().fontScale);
        require(directory.isDirectory()||directory.mkdirs(),"Screenshot directory");
        JSONObject result=new JSONObject().put("fontScale",context.getResources().getConfiguration().fontScale)
                .put("screens",screens).put("scope","PHONE_NATIVE_SETTINGS_INPUT_NO_WORKBENCH_SESSION");
        try {
            require(!AtomicWorkbenchCleanup.pending(),"Previous cleanup must finish");
            save(Map.of(AtomicWorkbenchConfig.ENABLED,"1",AREA,"100",SENSITIVITY,"100"));
            open();
            float gap=main(()->{
                View path=tag("page-path"),title=tag("section-title:全局手势");
                return (bounds(title).top-bounds(path).bottom)/activity.getResources().getDisplayMetrics().density;
            });
            require(gap>=7.5f&&gap<=12.5f,"Navigation gap: "+gap);
            require(main(()->!bar(AREA).isShown()),"Enabled settings begin folded");
            capture("01-collapsed");
            main(()->{((UiKit.Fold)field(activity,"fold")).arrow.performClick();return null;});
            settle();
            require(main(()->bar(AREA).getMin()==50&&bar(AREA).getMax()==120
                    &&bar(SENSITIVITY).getMin()==60&&bar(SENSITIVITY).getMax()==160),"Actual slider ranges");
            edit(AREA,80,true);
            require("100".equals(config.get(AREA)),"Cancel preserves saved region");
            require(main(()->bar(AREA).getProgress()==100),"Cancel restores region control");
            edit(AREA,110,false);
            await(()->config.getInt(AREA,0)==110,"Region release saves");
            await(()->main(()->field(appearance(),"preview")!=null),"Two-corner region preview appears");
            capture("02-region-preview");
            SystemClock.sleep(2200);
            require(main(()->field(appearance(),"preview")==null),"Region preview expires");
            edit(SENSITIVITY,130,false);
            await(()->config.getInt(SENSITIVITY,0)==130,"Sensitivity release saves");
            capture("03-sensitivity-saved");
            close();open();
            require(main(()->!bar(AREA).isShown()),"Reentry remains folded");
            require(main(()->bar(AREA).getProgress()==110&&bar(SENSITIVITY).getProgress()==130),"Saved values survive reentry");
            require(main(()->field(activity,"session")!=null),"Ordinary settings session remains valid");
            result.put("contentGapDp",gap).put("cancelPreservesSavedValue",true)
                    .put("releasePersistsBothParameters",true).put("previewExpired",true)
                    .put("reentryFoldedAndValuesPreserved",true).put("success",true);
        } finally {
            try { close(); }
            finally {
                Map<String,String> restore=new LinkedHashMap<>();
                for(String key:new String[]{AtomicWorkbenchConfig.ENABLED,AREA,SENSITIVITY})restore.put(key,before.get(key));
                save(restore);
                Map<String,String> after=config.snapshot();
                for(String key:before.keySet())require(before.get(key).equals(after.get(key)),"Setting changed after restoration: "+key);
                result.put("settingsRestored",true);
            }
        }
        return result;
    }

    private void open()throws Exception {
        activity=test.startActivitySync(new Intent(context,AtomicWorkbenchSettingsActivity.class)
                .putExtra(ModuleNavigation.EXTRA_ROUTE,"atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        main(()->{activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
        settle();
    }
    private void close()throws Exception {
        Activity closing=activity;
        if(closing!=null){main(()->{closing.finish();return null;});test.waitForIdleSync();activity=null;}
    }
    private void edit(String key,int next,boolean cancel)throws Exception {
        SeekBar slider=main(()->bar(key));
        main(()->{slider.requestRectangleOnScreen(new Rect(0,0,slider.getWidth(),slider.getHeight()),true);return null;});
        settle();
        Rect rect=main(()->bounds(slider));
        require(main(slider::isShown)&&rect.height()>0,"Slider visible for physical input");
        int left=main(slider::getPaddingLeft),right=main(slider::getPaddingRight);
        int min=main(slider::getMin),max=main(slider::getMax),current=main(slider::getProgress);
        float width=rect.width()-left-right;
        float x=rect.left+left+width*(current-min)/(max-min),to=rect.left+left+width*(next-min)/(max-min);
        float y=rect.exactCenterY();long down=SystemClock.uptimeMillis();
        String saved=config.get(key);
        touch(down,MotionEvent.ACTION_DOWN,x,y);SystemClock.sleep(80);
        touch(down,MotionEvent.ACTION_MOVE,to,y);SystemClock.sleep(100);
        require(saved.equals(config.get(key)),"Touch draft must not save before release");
        touch(down,cancel?MotionEvent.ACTION_CANCEL:MotionEvent.ACTION_UP,to,y);
        settle();
    }
    private void touch(long down,int action,float x,float y){
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,x,y,0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{require(automation.injectInputEvent(event,true),"Physical slider input accepted");}finally{event.recycle();}
    }
    private SeekBar bar(String key){return (SeekBar)tag("config:"+key);}
    private View tag(String tag){View view=activity.getWindow().getDecorView().findViewWithTag(tag);require(view!=null,"Missing "+tag);return view;}
    private Object appearance()throws Exception{return field(activity,"appearance");}
    private static Object field(Object owner,String name)throws Exception{Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(owner);}
    private static Rect bounds(View view){int[] p=new int[2];view.getLocationOnScreen(p);return new Rect(p[0],p[1],p[0]+view.getWidth(),p[1]+view.getHeight());}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(250);}
    private void save(Map<String,String> values){AppConfig.SaveResult saved=config.save(values);require(saved.success,saved.message);}
    private void capture(String name)throws Exception {
        Bitmap bitmap=automation.takeScreenshot();require(bitmap!=null,"Screenshot available");
        File file=new File(directory,name+".png");
        try(FileOutputStream out=new FileOutputStream(file)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot saved");}finally{bitmap.recycle();}
        screens.put(file.getAbsolutePath());
    }
    private interface Work<T>{T run()throws Exception;}
    private <T>T main(Work<T> work)throws Exception{
        AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();
        test.runOnMainSync(()->{try{value.set(work.run());}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new AssertionError(error.get());return value.get();
    }
    private interface Check{boolean get()throws Exception;}
    private void await(Check check,String why)throws Exception{long end=SystemClock.uptimeMillis()+8000;while(!check.get()&&SystemClock.uptimeMillis()<end)SystemClock.sleep(50);require(check.get(),why);}
    private static void require(boolean ok,String why){if(!ok)throw new AssertionError(why);}
}
