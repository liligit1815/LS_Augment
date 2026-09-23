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
        card.addView(ui.text("以下开关直接修改手机系统设置。",11.5f,ui.muted,false),ui.margins(0,0,0,6));
        // Namespaces and boolean values match the current Settings controllers.
        String[][] keys={{"global","development_settings_enabled","开发者选项"},{"global","adb_enabled","USB 调试"},
                {"system","adb_install_enabled","USB 安装"},{"system","lock_refresh_rate","锁定刷新率（原厂开关）"}};
        for(String[] row:keys){Switch toggle=new Switch(a);ui.styleSwitch(toggle);toggle.setChecked(read(a,row));card.addView(ui.featureRow(row[2],FeatureHelp.forDeviceSetting(row[1]),toggle),ui.wrap());boolean[] binding={false};
            toggle.setOnCheckedChangeListener((v,checked)->{if(binding[0])return;toggle.setEnabled(false);worker.execute(()->{
                RootShell.Result result=RootShell.run("settings put "+row[0]+" "+row[1]+" "+(checked?"1":"0"));
                a.runOnUiThread(()->{boolean actual=read(a,row);binding[0]=true;toggle.setChecked(actual);binding[0]=false;toggle.setEnabled(true);
                    String message=result.isSuccess()&&actual==checked?"已应用":result.isSuccess()?"系统未接受此项设置":"未应用："+result.publicError();
                    Toast.makeText(a,message,Toast.LENGTH_LONG).show();});});});
        }
    }
    private static boolean read(Activity a,String[] row){
        return (row[0].equals("system")?Settings.System.getInt(a.getContentResolver(),row[1],0)
                :Settings.Global.getInt(a.getContentResolver(),row[1],0))!=0;
    }
}
