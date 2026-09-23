package ls.augment.com;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Bundle;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Read-only check available before replacing the system launcher. */
public final class LauncherCompatibilityActivity extends Activity {
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private TextView result;
    private Button refresh;
    @Override public void onCreate(Bundle state){
        super.onCreate(state);UiKit ui=new UiKit(this);
        LinearLayout page=ui.detailPage("修改版桌面兼容性",null);
        page.setPadding(ui.dp(16),ui.dp(8),ui.dp(16),ui.dp(24));
        page.addView(ui.text("安装本项目修改版桌面前，先检查本机环境。检测不会安装应用或修改系统。",12,ui.muted,false));
        LinearLayout card=ui.card();card.setPadding(ui.dp(12),ui.dp(12),ui.dp(12),ui.dp(12));
        page.addView(card,ui.margins(0,8,0,8));
        result=ui.text("正在检测…",13,ui.text,false);result.setTextIsSelectable(true);card.addView(result);
        refresh=ui.tonalButton("重新检测");refresh.setOnClickListener(v->check());page.addView(refresh);
        page.addView(ui.text("检测仅针对当前项目底包。版本不同或结果未验证时，请勿直接覆盖安装；保留原厂桌面及布局备份。签名覆盖开关只解决安装签名检查，不能解决系统不兼容。",12,ui.muted,false));
        check();
    }
    private void check(){
        refresh.setEnabled(false);result.setText("正在检测…");
        worker.execute(()->{
            PackageManager pm=getPackageManager();boolean installed=false,system=false,permissions=false;
            String version="未安装",certificate="",error="";long code=0;
            try{
                PackageInfo info=pm.getPackageInfo(LauncherCompatibility.PACKAGE,PackageManager.GET_SIGNING_CERTIFICATES);
                installed=true;version=info.versionName;code=info.getLongVersionCode();
                system=info.applicationInfo!=null&&(info.applicationInfo.flags&(ApplicationInfo.FLAG_SYSTEM|ApplicationInfo.FLAG_UPDATED_SYSTEM_APP))!=0;
                permissions=pm.checkPermission("android.permission.START_TASKS_FROM_RECENTS",LauncherCompatibility.PACKAGE)==PackageManager.PERMISSION_GRANTED
                        &&pm.checkPermission("android.permission.MANAGE_ACTIVITY_TASKS",LauncherCompatibility.PACKAGE)==PackageManager.PERMISSION_GRANTED;
                Signature[] signatures=info.signingInfo==null?null:info.signingInfo.getApkContentsSigners();
                if(signatures!=null&&signatures.length==1){StringBuilder hash=new StringBuilder();
                    for(byte b:MessageDigest.getInstance("SHA-256").digest(signatures[0].toByteArray()))hash.append(String.format(Locale.ROOT,"%02x",b&255));
                    certificate=hash.toString();}
            }catch(PackageManager.NameNotFoundException missing){ /* explicitly reported below */ }
            catch(Exception e){error=e.getClass().getSimpleName();}
            LauncherCompatibility.Result check=LauncherCompatibility.evaluate(Build.MODEL,Build.VERSION.SDK_INT,
                    Arrays.asList(Build.SUPPORTED_ABIS).contains("arm64-v8a"),Build.DISPLAY,
                    installed,system,version,code,certificate,permissions,error);
            String title=check.status==LauncherCompatibility.Status.BASELINE_MATCH?"已知基准一致（仍需安装验证）"
                    :check.status==LauncherCompatibility.Status.MISMATCH?"检测到不匹配，请勿直接安装":"兼容性未验证，请勿直接安装";
            String text=title+"\n\n机型："+Build.MODEL+"\n系统："+Build.DISPLAY+"\nAndroid："+Build.VERSION.RELEASE
                    +"\n当前桌面："+version+"（"+code+"）\n\n"+String.join("\n\n",check.reasons);
            runOnUiThread(()->{if(isDestroyed())return;result.setText(text);refresh.setEnabled(true);});
        });
    }
    @Override protected void onDestroy(){worker.shutdown();super.onDestroy();}
}
