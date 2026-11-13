package ls.augment.com.hook;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Looper;
import android.provider.Settings;
import android.view.View;
import android.widget.Toast;
import cn.zte.chargeseparation.ChargeSeparationController;
import cn.zte.gamefloat.gamekeys.entity.PerformanceModeChangeToast;
import com.zte.powersavemode.common.ui.CustomSeekBarPreference;
import com.zte.powersavemode.common.utils.SwitchTools;
import com.zte.powersavemode.main.PowerSaveModeApp;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.util.*;
import ls.augment.com.BypassChargingOptions;
import ls.augment.com.BypassSettingsLease;
import ls.augment.com.GameOptions;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk=36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class BypassAwakeningAndroidTest {
    Context context;AugmentModule module;
    @Before public void reset()throws Exception{
        FeatureSettings.clear();context=RuntimeEnvironment.getApplication();module=new AugmentModule();AugmentModule.active=module;
        var state=BypassChargingHook.class.getDeclaredField("state");state.setAccessible(true);state.set(null,null);
        context.createDeviceProtectedStorageContext().getSharedPreferences("duo_bypass_native_backup",0).edit().clear().commit();
        put(BypassSettingsLease.THRESHOLD,80);put(BypassSettingsLease.AUTO,0);
    }
    void put(String key,int value){Settings.Global.putInt(context.getContentResolver(),key,value);}
    int get(String key){String value=Settings.Global.getString(context.getContentResolver(),key);return value==null?Settings.Global.getInt(context.getContentResolver(),key,-1):Integer.parseInt(value);}
    Object call(Object target,String method,Class<?>[] types,Object...args)throws Throwable{return module.invoke(target,method,types,args);}
    Object call(Object target,String method)throws Throwable{return call(target,method,new Class<?>[0]);}
    void enabled(String key,boolean value){FeatureSettings.values.put(key,value?"1":"0");}
    static class NamedResources extends Resources {
        final Map<String,Integer> ids=new HashMap<>();final Map<Integer,String> text=new HashMap<>();
        NamedResources(Resources source){super(source.getAssets(),source.getDisplayMetrics(),source.getConfiguration());}
        void add(String name,int id,String value){ids.put(name,id);text.put(id,value);}
        @Override public int getIdentifier(String name,String type,String pkg){return ids.getOrDefault(name,0);}
        @Override public CharSequence getText(int id){return text.containsKey(id)?text.get(id):super.getText(id);}
    }
    Context named(String pkg,NamedResources resources){return new ContextWrapper(context){@Override public Resources getResources(){return resources;}@Override public String getPackageName(){return pkg;}};}
    NamedResources resources(){NamedResources r=new NamedResources(context.getResources());r.add("performance_mode_high_toast",501,"已切换至高档位模式，设备的温度和耗电将显著增加");r.add("ic_qs_charge_separation_open_warning_text",502,"已开启旁路充电");r.add("ic_qs_charge_separation_close_warning_text",503,"旁路充电已关闭");r.add("ic_qs_charge_separation_battery_low20_warning_text",504,"电量低于20%");return r;}
    @Test public void awakeningOnlyDropsHighAndCanBeDisabled()throws Throwable{
        assertEquals(1,AwakeningPromptHook.install(module,getClass().getClassLoader()));
        PerformanceModeChangeToast toast=new PerformanceModeChangeToast(named("cn.zte.gamefloat",resources()));
        call(toast,"setType",new Class<?>[]{String.class},"high");enabled(GameOptions.HIDE_AWAKENING_TIP,true);
        call(toast,"setType",new Class<?>[]{String.class},"high");call(toast,"setType",new Class<?>[]{String.class},"low");call(toast,"setType",new Class<?>[]{String.class},"unknown");
        enabled(GameOptions.HIDE_AWAKENING_TIP,false);call(toast,"setType",new Class<?>[]{String.class},"high");
        assertEquals(Arrays.asList("high","low","unknown","high"),toast.delivered);
    }
    @Test public void awakeningSubclassAndMissingResourceKeepNativeBehavior()throws Throwable{
        AwakeningPromptHook.install(module,getClass().getClassLoader());enabled(GameOptions.HIDE_AWAKENING_TIP,true);
        PerformanceModeChangeToast child=new PerformanceModeChangeToast(named("cn.zte.gamefloat",resources())){};
        call(child,"setType",new Class<?>[]{String.class},"high");assertTrue(child.delivered.isEmpty());
        PerformanceModeChangeToast unknown=new PerformanceModeChangeToast(context);
        call(unknown,"setType",new Class<?>[]{String.class},"high");assertEquals(Collections.singletonList("high"),unknown.delivered);
    }
    @Test public void missingOemClassesRegisterNoUnsafeEntry(){
        ClassLoader missing=new ClassLoader(getClass().getClassLoader()){@Override public Class<?> loadClass(String name)throws ClassNotFoundException{if(name.startsWith("cn.zte."))throw new ClassNotFoundException(name);return super.loadClass(name);}};
        assertEquals(0,AwakeningPromptHook.install(module,missing));BypassChargingHook.install(module,missing,BypassChargingOptions.SERVICE_PACKAGE);
        assertTrue(FeatureSettings.diagnostics.get("ls_augment_bypass_capability").startsWith("unavailable:"));
    }
    @Test public void bypassConfirmationRetainsPlugAndLowBatteryChecks()throws Throwable{
        BypassChargingHook.install(module,getClass().getClassLoader(),BypassChargingOptions.SERVICE_PACKAGE);
        ChargeSeparationController c=new ChargeSeparationController(context);
        call(c,"showAlertDialog");assertEquals(1,c.dialogs);enabled(BypassChargingOptions.HIDE_PROMPTS,true);
        call(c,"showAlertDialog");assertEquals(1,c.starts);assertEquals(1,c.dialogs);
        c.mLevel=19;call(c,"showAlertDialog");c.mLevel=80;c.mPluggedIn=false;call(c,"showAlertDialog");assertEquals(3,c.dialogs);assertEquals(1,c.starts);
    }
    @Test public void quickTileKeepsNativeLowBatteryError()throws Throwable{
        BypassChargingHook.install(module,getClass().getClassLoader(),"com.android.systemui");enabled(BypassChargingOptions.HIDE_PROMPTS,true);
        var tile=new com.zte.qs.tiles.ChargeSeparationTile(context);call(tile,"showAlertDialog");assertEquals(1,tile.starts);
        tile.level=19;call(tile,"showAlertDialog");assertEquals(1,tile.errors);tile.charging=false;call(tile,"showAlertDialog");assertEquals(1,tile.dialogs);
    }
    @Test public void informationalResourceMatcherExcludesErrorsAndUnrelatedMessages(){
        Context c=named("cn.zte.chargeseparation",resources());
        assertTrue(BypassPromptHook.matches(c,502));assertTrue(BypassPromptHook.matches(c,"已开启旁路充电"));assertTrue(BypassPromptHook.matches(c,"旁路充电已关闭"));
        assertFalse(BypassPromptHook.matches(c,504));assertFalse(BypassPromptHook.matches(c,"电量低于20%"));assertFalse(BypassPromptHook.matches(c,"充电器过热"));assertFalse(BypassPromptHook.matches(context,502));
    }
    @Test public void reusedToastTextDoesNotSuppressNewError()throws Throwable{
        BypassPromptHook.install(module,"cn.zte.chargeseparation");enabled(BypassChargingOptions.HIDE_PROMPTS,true);Context c=named("cn.zte.chargeseparation",resources());
        Method make=Toast.class.getDeclaredMethod("makeText",Context.class,CharSequence.class,int.class);
        Toast toast=(Toast)module.call(make,null,c,"已开启旁路充电",Toast.LENGTH_SHORT);
        Method show=Toast.class.getDeclaredMethod("show");module.call(show,toast);assertEquals(0,org.robolectric.shadows.ShadowToast.shownToastCount());
        module.call(Toast.class.getDeclaredMethod("setText",CharSequence.class),toast,"电量低于20%");module.call(show,toast);assertEquals(1,org.robolectric.shadows.ShadowToast.shownToastCount());
    }
    @Test public void serviceRestartPreserves100ButRejectsInvalid101()throws Throwable{
        BypassChargingHook.install(module,getClass().getClassLoader(),BypassChargingOptions.SERVICE_PACKAGE);var c=new ChargeSeparationController(context);
        for(int value:new int[]{91,99,100}){put(BypassSettingsLease.THRESHOLD,value);call(c,"updateThresholdForInit");assertEquals(value,get(BypassSettingsLease.THRESHOLD));}
        put(BypassSettingsLease.THRESHOLD,101);call(c,"updateThresholdForInit");assertEquals(90,get(BypassSettingsLease.THRESHOLD));assertEquals(1,c.migrations);
    }
    @Test public void powerMigrationOnlySkipsStartupClamp()throws Throwable{
        BypassNativeRangeHook.power(module,getClass().getClassLoader());put(BypassSettingsLease.THRESHOLD,100);call(new PowerSaveModeApp(context),"onCreate");assertEquals(100,get(BypassSettingsLease.THRESHOLD));
        module.call(SwitchTools.class.getDeclaredMethod("setSeparationThreshold",Context.class,int.class),null,context,90);assertEquals(90,get(BypassSettingsLease.THRESHOLD));
        put(BypassSettingsLease.THRESHOLD,101);call(new PowerSaveModeApp(context),"onCreate");assertEquals(90,get(BypassSettingsLease.THRESHOLD));
    }
    @Test public void nativeSliderSharesRangeAndRestoresOriginal()throws Throwable{
        BypassNativeRangeHook.power(module,getClass().getClassLoader());var p=new CustomSeekBarPreference(context);Class<?>[] types={androidx.preference.PreferenceViewHolder.class};var holder=new androidx.preference.PreferenceViewHolder();
        call(p,"onBindViewHolder",types,holder);assertEquals(90,p.rendered);enabled(BypassChargingOptions.AUTO,true);call(p,"onBindViewHolder",types,holder);assertEquals(100,p.rendered);
        var unrelated=new CustomSeekBarPreference(context);unrelated.key="screen_brightness";call(unrelated,"onBindViewHolder",types,holder);assertEquals(90,unrelated.rendered);
        enabled(BypassChargingOptions.AUTO,false);call(p,"onBindViewHolder",types,holder);assertEquals(90,p.rendered);
    }
    @Test public void verifiedConfigurationOwnsNativeSettingsAndRestoresOnDisable()throws Throwable{
        // Robolectric keeps int and String writes typed, while the real Settings
        // provider stores strings. Match the production lease's string API here.
        Settings.Global.putString(context.getContentResolver(),BypassSettingsLease.THRESHOLD,"80");
        Settings.Global.putString(context.getContentResolver(),BypassSettingsLease.AUTO,"0");
        BypassChargingHook.install(module,getClass().getClassLoader(),BypassChargingOptions.SERVICE_PACKAGE);enabled(BypassChargingOptions.AUTO,true);FeatureSettings.values.put(BypassChargingOptions.LEVEL,"100");FeatureSettings.verified=false;
        call(new ChargeSeparationController(context),"init");Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(80,get(BypassSettingsLease.THRESHOLD));
        FeatureSettings.verified=true;FeatureSettings.changed();Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(100,get(BypassSettingsLease.THRESHOLD));assertEquals(1,get(BypassSettingsLease.AUTO));
        enabled(BypassChargingOptions.AUTO,false);FeatureSettings.changed();Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(80,get(BypassSettingsLease.THRESHOLD));assertEquals(0,get(BypassSettingsLease.AUTO));
    }
    static class Store implements BypassSettingsLease.Store {
        Map<String,String> nativeValues=new HashMap<>(),backup=new HashMap<>();String fail="";boolean backupFail;final List<String>writes=new ArrayList<>();
        Store(){nativeValues.put(BypassSettingsLease.THRESHOLD,"80");nativeValues.put(BypassSettingsLease.AUTO,"0");}
        public String get(String k){return nativeValues.get(k);}public String saved(String k){return backup.get(k);}
        public boolean put(String k,String v){writes.add(k+"="+v);if(k.equals(fail))return false;if(v==null)nativeValues.remove(k);else nativeValues.put(k,v);return true;}
        public boolean save(String l,String a,String d,String o){if(backupFail)return false;backup.put("level",l);backup.put("auto",a);backup.put("desired",d);backup.put("owned",o);return true;}
        public boolean clear(){backup.clear();return true;}
    }
    @Test public void leaseRangeAndIdempotence(){
        Store s=new Store();for(int bad:new int[]{-1,0,19,101,200})assertEquals("invalid_level",BypassSettingsLease.apply(s,true,bad));assertTrue(s.writes.isEmpty());
        for(int value:new int[]{20,80,90,91,99,100})assertEquals("active;threshold="+value,BypassSettingsLease.apply(s,true,value));
        int writes=s.writes.size();BypassSettingsLease.apply(s,true,100);assertEquals(writes,s.writes.size());assertEquals("restored",BypassSettingsLease.apply(s,false,100));assertEquals("80",s.get(BypassSettingsLease.THRESHOLD));assertEquals("0",s.get(BypassSettingsLease.AUTO));
    }
    @Test public void leaseRestoresDurableOriginalAfterFailedUpdateAndRestart(){
        Store s=new Store();BypassSettingsLease.apply(s,true,95);s.fail=BypassSettingsLease.THRESHOLD;assertEquals("write_failed",BypassSettingsLease.apply(s,true,100));s.fail="";
        Store restarted=new Store();restarted.nativeValues=s.nativeValues;restarted.backup=s.backup;BypassSettingsLease.apply(restarted,false,100);assertEquals("80",restarted.get(BypassSettingsLease.THRESHOLD));assertEquals("0",restarted.get(BypassSettingsLease.AUTO));
    }
    @Test public void failedBackupNeverChangesNativeValues(){Store s=new Store();s.backupFail=true;assertEquals("backup_failed",BypassSettingsLease.apply(s,true,100));assertTrue(s.writes.isEmpty());}
    @Test public void partialEnableRestoresAndAbsentOriginalRemainsAbsent(){
        Store s=new Store();s.nativeValues.clear();s.fail=BypassSettingsLease.AUTO;assertEquals("write_failed",BypassSettingsLease.apply(s,true,100));s.fail="";BypassSettingsLease.apply(s,false,100);assertNull(s.get(BypassSettingsLease.THRESHOLD));assertNull(s.get(BypassSettingsLease.AUTO));
    }
    @Test public void restorePreservesLaterNativeEditsIncludingDeletion(){
        Store s=new Store();BypassSettingsLease.apply(s,true,100);s.nativeValues.remove(BypassSettingsLease.THRESHOLD);s.nativeValues.put(BypassSettingsLease.AUTO,"0");BypassSettingsLease.apply(s,false,100);assertNull(s.get(BypassSettingsLease.THRESHOLD));assertEquals("0",s.get(BypassSettingsLease.AUTO));
    }
    @Test public void failedRestoreKeepsBackupAndDisablesAutoBeforeThreshold(){
        Store s=new Store();BypassSettingsLease.apply(s,true,100);s.fail=BypassSettingsLease.AUTO;s.writes.clear();assertEquals("restore_failed",BypassSettingsLease.apply(s,false,100));assertEquals(Collections.singletonList(BypassSettingsLease.AUTO+"=0"),s.writes);assertFalse(s.backup.isEmpty());
        s.fail="";s.writes.clear();assertEquals("restored",BypassSettingsLease.apply(s,false,100));assertEquals(BypassSettingsLease.AUTO+"=0",s.writes.get(0));assertEquals(BypassSettingsLease.THRESHOLD+"=80",s.writes.get(1));
    }
    @Test public void c17NativeDrawingIsCompactAndScalesTextWithoutProvider()throws Exception{
        for(float scale:new float[]{1f,1.3f,2f}){
            android.content.res.Configuration config=new android.content.res.Configuration(context.getResources().getConfiguration());config.fontScale=scale;
            Context c=context.createConfigurationContext(config);float density=c.getResources().getDisplayMetrics().density;
            View view=new View(c){@Override public boolean isAttachedToWindow(){return true;}};int w=Math.round(132*density),h=Math.round(60*density);view.layout(0,0,w,h);
            CleanupIconImage art=new CleanupIconImage(view);art.update(CleanupIconImage.C17);assertTrue(art.ready());Bitmap bitmap=Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);assertTrue(art.draw(new Canvas(bitmap),w/2f,h/2f,h/2f));
            assertEquals(0,bitmap.getPixel(0,h/2));assertTrue(android.graphics.Color.alpha(bitmap.getPixel(w/2,h/2))>0);
            File file=new File(System.getProperty("duo.evidence"),"c17-font-"+scale+".png");try(FileOutputStream out=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}
            art.clear();assertFalse(art.ready());
        }
    }
}
