package ls.augment.com;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import org.json.JSONObject;
/** Version matching is reported separately from behavioral acceptance. */
public final class MigrationCompatibility {
    private MigrationCompatibility() { }
    public static String describe(Context context) {
        StringBuilder out=new StringBuilder();
        boolean device="NX809J".equals(Build.MODEL)&&Build.VERSION.SDK_INT==36&&"RedMagicOS11.5.7MR1".equals(Build.DISPLAY);
        out.append(device?"设备符合首批分析样本。\n":"当前设备或系统版本与首批分析样本不同。\n");
        out.append("支持自动适配的功能按应用代码结构识别入口，无需选择版本；具体结果以运行记录为准。\n");
        out.append("版本匹配或入口识别成功均不能代替功能实测。\n\n");
        try(InputStream input=context.getAssets().open("redmagic-baseline.json")) {
            JSONObject packages=new JSONObject(new String(input.readAllBytes(),StandardCharsets.UTF_8)).getJSONObject("packages");
            Iterator<String> keys=packages.keys();while(keys.hasNext()) {
                String pkg=keys.next();JSONObject expected=packages.getJSONObject(pkg);if(!expected.optBoolean("present"))continue;
                out.append(pkg).append("\n");
                try {
                    PackageInfo info=context.getPackageManager().getPackageInfo(pkg,0);
                    String version=expected.getJSONArray("versionName").getString(0);
                    long code=Long.parseLong(expected.getJSONArray("versionCode").getString(0));
                    boolean launcher="com.zte.mifavor.launcher".equals(pkg);
                    boolean match=version.equals(info.versionName)&&(launcher?info.getLongVersionCode()==260001:info.getLongVersionCode()==code);
                    out.append(match&&device?"与首批样本一致，功能待验收":"与首批样本不同，需查看功能运行记录").append("：").append(info.versionName).append(" (").append(info.getLongVersionCode()).append(")\n\n");
                }catch(Exception absent){out.append("未安装或不可读取\n\n");}
            }
        }catch(Exception unavailable){out.append("基准清单读取失败，当前适配状态未知。\n");}
        return out.toString();
    }
}
