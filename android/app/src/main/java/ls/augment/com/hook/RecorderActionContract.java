package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.UserManager;

/** Validate for the recorder's current user, after credential-protected services become visible. */
final class RecorderActionContract {
    static void require(Context currentUser) {
        UserManager users=currentUser.getSystemService(UserManager.class);
        if(users==null||!users.isUserUnlocked())throw new IllegalStateException("recorder_waiting_user_unlock");
        for(String action:new String[]{"SET_TAG","PAUSE","RESUME","STOP","CANCEL"}){
            Intent intent=new Intent("recorder.intent.action."+action).setPackage("cn.zte.recorder")
                    .addCategory("recorder.intent.category.RECORDING");
            ResolveInfo result=currentUser.getPackageManager().resolveService(intent,0);
            if(result==null||result.serviceInfo==null||!result.serviceInfo.enabled||!result.serviceInfo.exported
                    ||!"cn.zte.recorder".equals(result.serviceInfo.packageName)||result.serviceInfo.name==null)
                throw new IllegalStateException("recorder_action_unavailable:"+action);
            String permission=result.serviceInfo.permission;
            if(permission!=null&&!permission.isEmpty()&&currentUser.checkSelfPermission(permission)!=PackageManager.PERMISSION_GRANTED)
                throw new IllegalStateException("recorder_action_permission:"+action);
        }
    }
    private RecorderActionContract(){}
}
