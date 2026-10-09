package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.io.File;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Root transport/mount-namespace diagnosis. No application processes or files are changed. */
final class TotalResetRootPathsDeviceCases {
    private static final String[] PACKAGES={"cn.nubia.gamehelpmodule","com.mi.health","com.zte.mifavor.launcher"};
    private static final String QUERY="""
            printf 'IDENTITY\n'
            id
            printf 'SELINUX\n'
            id -Z 2>&1
            getenforce 2>&1
            printf 'MOUNT_NAMESPACE\n'
            readlink /proc/self/ns/mnt 2>&1
            printf 'INIT_MOUNT_NAMESPACE\n'
            readlink /proc/1/ns/mnt 2>&1
            printf 'TOOLS\n'
            command -v nsenter 2>&1
            command -v stat 2>&1
            for package in cn.nubia.gamehelpmodule com.mi.health com.zte.mifavor.launcher; do
              base=/data/user/0/$package
              printf 'PATH %s\n' "$base"
              if [ -d "$base" ]; then printf 'DIRECTORY=true\n'; else printf 'DIRECTORY=false\n'; fi
              if [ -L "$base" ]; then printf 'SYMLINK=true\n'; else printf 'SYMLINK=false\n'; fi
              ls -ldZ "$base" 2>&1
              stat -c 'TYPE=%F UID=%u GID=%g INODE=%i DEVICE=%d MODE=%a' "$base" 2>&1
              printf 'CANONICAL='; readlink -f "$base" 2>&1
              printf 'RAW_LINK='; readlink "$base" 2>&1
              printf 'PARENT='; stat -c 'TYPE=%F UID=%u GID=%g INODE=%i DEVICE=%d MODE=%a' /data/user/0 2>&1
            done
            printf 'DIAGNOSIS_COMPLETE\n'
            exit 0
            """;
    private TotalResetRootPathsDeviceCases() { }
    static JSONObject run(Context context)throws Exception {
        Map<String,?> before=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        JSONArray identities=new JSONArray();
        for(String name:PACKAGES) {
            JSONObject row=new JSONObject().put("package",name);
            try {ApplicationInfo app=context.getPackageManager().getApplicationInfo(name,0);
                row.put("installed",true).put("uid",app.uid).put("dataDir",app.dataDir).put("packageName",app.packageName);
            } catch(PackageManager.NameNotFoundException missing) {row.put("installed",false);}
            identities.put(row);
        }
        RootShell.Result inherited=RootShell.run("sh",QUERY,15,16384);
        RootShell.Result init=RootShell.run("nsenter -t 1 -m -- sh",QUERY,15,16384);
        String appNamespace;
        try {appNamespace=Files.readSymbolicLink(new File("/proc/self/ns/mnt").toPath()).toString();}
        catch(Exception error) {appNamespace="unreadable:"+error.getClass().getSimpleName();}
        boolean stable=before.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        boolean probesComplete=complete(inherited)&&complete(init);
        return new JSONObject().put("success",stable&&probesComplete).put("probesComplete",probesComplete)
                .put("readOnly",true).put("appUid",android.os.Process.myUid())
                .put("appPid",android.os.Process.myPid()).put("appMountNamespace",appNamespace)
                .put("packageIdentities",identities).put("inheritedRootNamespace",result(inherited))
                .put("initRootNamespace",result(init)).put("configurationUnchanged",stable)
                .put("noForceStopNoResetNoDatabaseReads",true);
    }
    private static boolean complete(RootShell.Result result) {
        return result.isSuccess()&&result.capture!=null&&result.capture.reliable()
                &&result.output.endsWith("DIAGNOSIS_COMPLETE");
    }
    private static JSONObject result(RootShell.Result result)throws Exception {
        return new JSONObject().put("exitCode",result.exitCode).put("timedOut",result.timedOut)
                .put("reliableCapture",result.capture!=null&&result.capture.reliable()).put("output",result.output);
    }
}
