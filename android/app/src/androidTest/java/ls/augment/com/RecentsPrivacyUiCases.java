package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.os.SystemClock;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import java.util.concurrent.*;
import org.json.JSONObject;

/** Real privacy controls and searchable picker, with durable backup and exact restoration. */
final class RecentsPrivacyUiCases {
    static JSONObject run(Instrumentation test) throws Exception {
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot()),saved=new LinkedHashMap<>();
        for(String key:new String[]{RecentsPrivacyOptions.ENABLED,RecentsPrivacyOptions.APPS})saved.put(key,before.get(key));
        File backup=new File(context.getFilesDir(),"recents-privacy-ui-backup.json");
        check(!backup.exists(),"unfinished privacy test backup requires restoration");
        java.nio.file.Files.write(backup.toPath(),new JSONObject(saved).toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
        Activity page=null;
        try {
            Map<String,String> seed=new LinkedHashMap<>();seed.put(RecentsPrivacyOptions.ENABLED,"0");seed.put(RecentsPrivacyOptions.APPS,"");check(config.save(seed).success,"seed saved");
            check(ModuleHierarchy.group("group/desktop/recents_privacy")!=null,"desktop privacy navigation registered");
            page=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class).putExtra("target","desktop")
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,"group/desktop/recents_privacy").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            Activity activity=page;settle(test);
            main(test,()->{activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
            float gap=main(test,()->{View root=activity.getWindow().getDecorView(),path=root.findViewWithTag("page-path"),first=root.findViewWithTag("section-title:隐私屏");
                if(first==null)first=root.findViewWithTag("application-category:desktop:recents_privacy");check(path!=null&&first!=null,"shared navigation boundaries");int[] p=new int[2],f=new int[2];path.getLocationOnScreen(p);first.getLocationOnScreen(f);float distance=(f[1]-p[1]-path.getHeight())/context.getResources().getDisplayMetrics().density;check(distance>=8&&distance<=12,"privacy content gap "+distance);return distance;});
            Switch toggle=main(test,()->(Switch)activity.getWindow().getDecorView().findViewWithTag("config:"+RecentsPrivacyOptions.ENABLED));
            Button picker=main(test,()->(Button)activity.getWindow().getDecorView().findViewWithTag("config:"+RecentsPrivacyOptions.APPS));
            main(test,()->{check(!toggle.isChecked()&&!picker.isShown(),"disabled settings initially folded");toggle.performClick();return null;});
            settle(test);await(test,()->"1".equals(config.get(RecentsPrivacyOptions.ENABLED)));
            main(test,()->{check(picker.isShown()&&picker.isEnabled(),"enable unfolds picker");picker.performClick();return null;});settle(test);
            View dialog=main(test,()->dialogRoot());
            main(test,()->{find(dialog,EditText.class).setText("com.android.settings");return null;});
            await(test,()->{try{return main(test,()->packagePosition(find(dialog,ListView.class))>=0);}catch(Exception e){throw new RuntimeException(e);}});
            main(test,()->{ListView list=find(dialog,ListView.class);int index=packagePosition(list);check(index>=0,"settings present in picker");if(!list.isItemChecked(index))list.performItemClick(list.getChildAt(index),index,list.getItemIdAtPosition(index));check(list.isItemChecked(index),"picker row checked");dialog.findViewById(android.R.id.button1).performClick();return null;});
            await(test,()->"com.android.settings".equals(config.get(RecentsPrivacyOptions.APPS)));
            main(test,()->{check(picker.getText().toString().contains("1"),"selection count updated");picker.performClick();return null;});settle(test);
            main(test,()->{View root=dialogRoot();root.findViewById(android.R.id.button3).performClick();root.findViewById(android.R.id.button2).performClick();return null;});settle(test);
            check("com.android.settings".equals(config.get(RecentsPrivacyOptions.APPS)),"clear then cancel preserves selection");
            File folder=new File(context.getExternalFilesDir(null),"recents-privacy-ui");folder.mkdirs();
            main(test,()->{View root=activity.getWindow().getDecorView();Bitmap image=Bitmap.createBitmap(root.getWidth(),root.getHeight(),Bitmap.Config.ARGB_8888);root.draw(new Canvas(image));try(OutputStream out=new FileOutputStream(new File(folder,"privacy-enabled.png"))){image.compress(Bitmap.CompressFormat.PNG,100,out);}image.recycle();toggle.performClick();return null;});
            await(test,()->"0".equals(config.get(RecentsPrivacyOptions.ENABLED)));
            check("com.android.settings".equals(config.get(RecentsPrivacyOptions.APPS)),"disable preserves selection");
            main(test,()->{check(!picker.isShown(),"disable folds configuration");return null;});
            return new JSONObject().put("success",true).put("pickerConfirmed",true).put("cancelPreservedSelection",true)
                    .put("disablePreservedSelection",true).put("gapDp",gap).put("fontScale",context.getResources().getConfiguration().fontScale)
                    .put("orientation",context.getResources().getConfiguration().orientation).put("screenshotDirectory",folder.getAbsolutePath());
        } finally {
            if(page!=null){Activity activity=page;Field field=EnhancementSettingsActivity.class.getDeclaredField("worker");field.setAccessible(true);ExecutorService worker=(ExecutorService)field.get(page);
                CountDownLatch drained=new CountDownLatch(1);main(test,()->{activity.finish();worker.execute(drained::countDown);return null;});check(drained.await(15,TimeUnit.SECONDS),"pending saves drained");}
            check(config.save(saved).success&&before.equals(config.snapshot()),"all original settings restored");
            java.nio.file.Files.delete(backup.toPath());
        }
    }
    private static int packagePosition(ListView list){for(int i=0;i<list.getCount();i++)if(list.getItemAtPosition(i).toString().endsWith("\ncom.android.settings"))return i;return -1;}
    private static View dialogRoot(){for(View root:android.view.inspector.WindowInspector.getGlobalWindowViews())if(root.findViewById(android.R.id.button1)!=null&&root.isShown())return root;throw new AssertionError("dialog missing");}
    private static <T extends View>T find(View root,Class<T> type){if(type.isInstance(root))return type.cast(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T found=find(((ViewGroup)root).getChildAt(i),type);if(found!=null)return found;}return null;}
    private static <T>T main(Instrumentation test,Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);test.runOnMainSync(task);return task.get();}
    private static void settle(Instrumentation test){test.waitForIdleSync();SystemClock.sleep(300);test.waitForIdleSync();}
    private static void await(Instrumentation test,java.util.function.BooleanSupplier condition){long until=SystemClock.uptimeMillis()+15000;while(!condition.getAsBoolean()&&SystemClock.uptimeMillis()<until){SystemClock.sleep(150);test.waitForIdleSync();}check(condition.getAsBoolean(),"expected UI/save state");}
    private static void check(boolean okay,String message){if(!okay)throw new AssertionError(message);}
}
