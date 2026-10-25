package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.Switch;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real page geometry, shared configuration and exact phone-side command execution. */
final class NewCustomizationUiCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final File directory;
    private final JSONArray pages=new JSONArray();
    private Activity current;
    private NewCustomizationUiCases(Instrumentation test){
        this.test=test;context=test.getTargetContext();config=new AppConfig(context);
        directory=new File(context.getExternalFilesDir(null),"new-customization-ui");
    }
    static JSONObject run(Instrumentation test)throws Exception{return new NewCustomizationUiCases(test).execute();}
    private JSONObject execute()throws Exception{
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        String originalNative=Settings.System.getString(context.getContentResolver(),CompetitiveKeyOptions.NATIVE_SETTING);
        require(!config.getBoolean(CompetitiveKeyOptions.ENABLED),"Fixture requires an initially disabled competitive key");
        require(directory.isDirectory()||directory.mkdirs(),"Create screenshot directory");
        JSONObject report=new JSONObject().put("pages",pages).put("device",android.os.Build.MODEL);
        try{
            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"0",SystemUiOptions.SIGNAL_DUAL,"0",
                    ConfigSchema.SYSTEMUI_MASTER,"1",ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,"1"));
            require(!signalRead().getBoolean("dual"),"Settings bridge reads shared flat state");
            require(signalSelect(true).getBoolean("ok")&&config.getBoolean(SystemUiOptions.SIGNAL_DUAL),"Settings bridge selects shared merged state");
            save(Map.of(SystemUiOptions.SIGNAL_DUAL,"0"));
            require(!signalRead().getBoolean("dual"),"Settings bridge reflects external Duo update");
            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"1"));
            Bundle conflict=signalSelect(true);
            require(!conflict.getBoolean("ok")&&"请先关闭三合一图标".equals(conflict.getString("message")),"Settings bridge reports three-in-one conflict");
            require(!config.getBoolean(SystemUiOptions.SIGNAL_DUAL),"Conflict preserves flat selection");
            AppConfig.SaveResult rejected=config.save(Map.of(SystemUiOptions.SIGNAL_DUAL,"1"));
            require(!rejected.success&&"请先关闭三合一图标".equals(rejected.message),"Shared authority reports exact conflict");
            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"0",SystemUiOptions.SIGNAL_DUAL,"1"));
            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"1"));
            require(!config.getBoolean(SystemUiOptions.SIGNAL_DUAL),"Enabling three-in-one atomically clears dual flag");
            report.put("signalBridgeSynchronization",true).put("signalMutualExclusion",true);

            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"0",ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,"1"));
            launch(StatusBarSettingsActivity.class,"status_battery");
            main(()->{Switch control=find(current.getWindow().getDecorView(),"原生电池图标",Switch.class);ViewGroup row=(ViewGroup)control.getParent();row.getChildAt(row.getChildCount()-1).performClick();return null;});
            require(main(()->find(current.getWindow().getDecorView(),"电池预设样式",Spinner.class)!=null),"Native battery owns preset dropdown");
            Spinner preset=main(()->find(current.getWindow().getDecorView(),"电池预设样式",Spinner.class));
            require(main(()->preset.getAdapter().getCount()==2),"Native and iOS are the two presets");
            main(()->{preset.setSelection(1);return null;});
            await(()->"1".equals(config.get(SystemUiOptions.PREFIX+"battery_preset")),"iOS preset is saved by the editor");
            capture("03-battery-ios");close();

            save(Map.of(CompetitiveKeyOptions.CATEGORY,"0",CompetitiveKeyOptions.APP_PACKAGE,"ls.augment.com",
                    CompetitiveKeyOptions.UP_ACTION,"0",CompetitiveKeyOptions.DOWN_ACTION,"0"));
            save(Map.of(CompetitiveKeyOptions.ENABLED,"1"));
            require("0".equals(Settings.System.getString(context.getContentResolver(),CompetitiveKeyOptions.NATIVE_SETTING)),"Enabled key clears real OEM operation");
            launch(CompetitiveKeySettingsActivity.class,"competitive_key");capture("04-competitive-app");
            for(int category=1;category<=3;category++){
                final int selected=category;
                main(()->{((Spinner)tag("config:"+CompetitiveKeyOptions.CATEGORY)).setSelection(selected);return null;});
                await(()->String.valueOf(selected).equals(config.get(CompetitiveKeyOptions.CATEGORY))
                        &&main(()->((Spinner)tag("config:"+CompetitiveKeyOptions.CATEGORY)).getSelectedItemPosition()==selected),"Save category "+category);
                require(main(()->tag("config:"+CompetitiveKeyOptions.UP_ACTION) instanceof Spinner
                        &&tag("config:"+CompetitiveKeyOptions.DOWN_ACTION) instanceof Spinner),"Both directions are independently selectable");
                capture("0"+(category+4)+"-competitive-category-"+category);
            }
            await(()->config.getInt(CompetitiveKeyOptions.UP_ACTION,-1)==CompetitiveKeyPolicy.SHELL
                    &&config.getInt(CompetitiveKeyOptions.DOWN_ACTION,-1)==CompetitiveKeyPolicy.SHELL
                    &&main(()->tag("config:"+CompetitiveKeyOptions.UP_SHELL) instanceof EditText
                            &&tag("config:"+CompetitiveKeyOptions.DOWN_SHELL) instanceof EditText),"Both shell directions and their visible editors are ready");
            String up="answer='a b'\n[ \"$answer\" = 'a b' ]\ntrue",down="true\nfalse";
            main(()->{((EditText)tag("config:"+CompetitiveKeyOptions.UP_SHELL)).setText(up);
                ((EditText)tag("config:"+CompetitiveKeyOptions.DOWN_SHELL)).setText(down);return null;});
            await(()->CompetitiveKeyPolicy.encodeShell(up).equals(config.get(CompetitiveKeyOptions.UP_SHELL))
                    &&CompetitiveKeyPolicy.encodeShell(down).equals(config.get(CompetitiveKeyOptions.DOWN_SHELL)),"Real command inputs save each direction exactly");
            require(up.equals(CompetitiveKeyPolicy.decodeShell(config.get(CompetitiveKeyOptions.UP_SHELL))),"Multiline command preserves exact original");
            long eventTime=SystemClock.elapsedRealtimeNanos();String upEvent="901:"+eventTime+":1";
            Bundle success=command(true,upEvent),failure=command(false,"901:"+(eventTime+1)+":0");
            require(success.getBoolean("ok"),"Phone Root executes multiline up command");
            require(!failure.getBoolean("ok")&&failure.getString("message","").contains("退出码 1"),"Down command preserves newline semantics and nonzero exit");
            require(!command(true,upEvent).getBoolean("ok"),"Duplicate event is not executed twice");
            save(Map.of(CompetitiveKeyOptions.ENABLED,"0"));
            require(up.equals(CompetitiveKeyPolicy.decodeShell(config.get(CompetitiveKeyOptions.UP_SHELL))),"Disable retains commands");
            require(java.util.Objects.equals(originalNative,Settings.System.getString(context.getContentResolver(),CompetitiveKeyOptions.NATIVE_SETTING)),"Disable restores original OEM operation");
            report.put("nativeKeyRecovery",true).put("multilinePhoneShell",true).put("fourCategoryPages",true);
        }finally{
            close();AppConfig.SaveResult restored=config.save(before);
            require(restored.success,"Restore baseline configuration");
            require(before.equals(config.snapshot()),"All original values restored");
        }
        report.put("baselineRestored",true).put("success",true);
        return report;
    }
    private Bundle command(boolean up,String event){Bundle b=new Bundle();b.putBoolean("up",up);b.putString("eventId",event);b.putLong("revision",config.configSnapshot().revision);return CompetitiveKeyControl.executeShell(context,b);}
    private void save(Map<String,String> values){AppConfig.SaveResult r=config.save(values);require(r.success,r.message);}
    private void launch(Class<? extends Activity> cls,String route)throws Exception{
        current=test.startActivitySync(new Intent(context,cls).putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        main(()->{current.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
        SystemClock.sleep(700);test.waitForIdleSync();
    }
    private void close()throws Exception{if(current!=null){Activity a=current;main(()->{a.finish();return null;});current=null;test.waitForIdleSync();}}
    private void capture(String name)throws Exception{
        JSONObject geometry=main(()->{
            View path=tag("page-path");require(path!=null,"Shared breadcrumbs");ViewGroup chrome=(ViewGroup)path.getParent();
            View first=first(chrome.getChildAt(chrome.indexOfChild(path)+2));
            float density=current.getResources().getDisplayMetrics().density;
            float gap=(top(first)-top(path)-path.getHeight())/density;
            require(gap>=7.5f&&gap<=12.5f,"Breadcrumb content gap: "+gap);
            return new JSONObject().put("screen",name).put("gapDp",gap).put("density",density)
                    .put("fontScale",current.getResources().getConfiguration().fontScale);
        });
        Bitmap screen=test.getUiAutomation().takeScreenshot();require(screen!=null,"Take screenshot");
        File file=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(file)){screen.compress(Bitmap.CompressFormat.PNG,100,out);}finally{screen.recycle();}
        geometry.put("screenshot",file.getAbsolutePath());pages.put(geometry);
    }
    private View tag(String value){return current.getWindow().getDecorView().findViewWithTag(value);}
    private Bundle signalRead(){return context.getContentResolver().call(android.net.Uri.parse("content://ls.augment.com.config"),SignalStylePolicy.READ,null,null);}
    private Bundle signalSelect(boolean dual){Bundle data=new Bundle();data.putBoolean("dual",dual);return context.getContentResolver().call(android.net.Uri.parse("content://ls.augment.com.config"),SignalStylePolicy.SELECT,null,data);}
    private static View first(View v){if(v instanceof LiquidGlassLayout||!(v instanceof ViewGroup))return v;for(int i=0;i<((ViewGroup)v).getChildCount();i++){View c=((ViewGroup)v).getChildAt(i);if(c.getVisibility()==View.VISIBLE&&c.getHeight()>0)return first(c);}return v;}
    private static int top(View v){int[] xy=new int[2];v.getLocationInWindow(xy);return xy[1];}
    private static <T extends View>T find(View root,String description,Class<T> cls){if(cls.isInstance(root)&&description.contentEquals(root.getContentDescription()==null?"":root.getContentDescription()))return cls.cast(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T v=find(((ViewGroup)root).getChildAt(i),description,cls);if(v!=null)return v;}return null;}
    private interface Check{boolean get()throws Exception;}
    private void await(Check check,String message)throws Exception{long deadline=SystemClock.uptimeMillis()+8000;while(!check.get()&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);require(check.get(),message);test.waitForIdleSync();}
    private interface Work<T>{T get()throws Exception;}
    private <T>T main(Work<T> work)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(work.get());}catch(Throwable e){failure.set(e);}});if(failure.get()!=null)throw new AssertionError(failure.get());return value.get();}
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
