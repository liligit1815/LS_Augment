package ls.augment.com;
import android.app.*;
import android.provider.Settings;
import android.widget.*;
import java.util.*;
import java.util.concurrent.ExecutorService;

/** Explicit actions use fixed system keys and validated numeric values. */
final class DeviceSettingsActions {
    private DeviceSettingsActions() { }
    static void add(Activity a,UiKit ui,LinearLayout card,ExecutorService worker){
        add(a,ui,card,worker,"development_settings_enabled","adb_enabled","adb_install_enabled","lock_refresh_rate");
    }
    static void add(Activity a,UiKit ui,LinearLayout card,ExecutorService worker,String... selected){
        // Namespaces and boolean values match the current Settings controllers.
        String[][] keys={{"global","development_settings_enabled","开发者选项"},{"global","adb_enabled","USB 调试"},
                {"system","adb_install_enabled","USB 安装"},{"system","lock_refresh_rate","锁定刷新率（原厂开关）"}};
        for(String[] row:keys){if(!Arrays.asList(selected).contains(row[1]))continue;
            if(card.getChildCount()>0)card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
            Switch toggle=new Switch(a);toggle.setTag("device-setting:"+row[1]);ui.styleSwitch(toggle);toggle.setChecked(read(a,row));card.addView(ui.featureRow(row[2],FeatureHelp.forDeviceSetting(row[1]),toggle),ui.wrap());boolean[] binding={false};
            toggle.setOnCheckedChangeListener((v,checked)->{if(binding[0])return;toggle.setEnabled(false);worker.execute(()->{
                ModuleSystemSettings.WriteResult result=ModuleSystemSettings.put(a,row[0],row[1],checked?"1":"0");
                a.runOnUiThread(()->{boolean actual=read(a,row);binding[0]=true;toggle.setChecked(actual);binding[0]=false;toggle.setEnabled(true);
                    String message=result.success&&actual==checked?"已应用":result.success?"系统未接受此项设置":"未应用："+result.message;
                    Toast.makeText(a,message,Toast.LENGTH_LONG).show();});});});
        }
    }
    private static boolean read(Activity a,String[] row){
        return (row[0].equals("system")?Settings.System.getInt(a.getContentResolver(),row[1],0)
                :Settings.Global.getInt(a.getContentResolver(),row[1],0))!=0;
    }
}
