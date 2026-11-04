package ls.augment.com.step;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.pm.ApplicationInfo;
import android.content.Context;
import android.os.*;
import static ls.augment.com.step.StepRuntime.*;

/** Accept only the unlocked foreground user or its explicitly typed, unlocked Android clone. */
final class WorkspaceUsers {
    static int id(UserHandle u){return (Integer)call(u,"getIdentifier");}
    static int foreground(){return (Integer)StepMembers.callStaticMethod(ActivityManager.class,"getCurrentUser");}
    static boolean allows(Context c,int owner,int user){
        try{
            if(owner<0 || user<0 || foreground()!=owner)return false;
            if(owner==user)return true;
            UserManager users=c.getSystemService(UserManager.class);
            UserHandle handle=(UserHandle)StepMembers.callStaticMethod(UserHandle.class,"of",user);
            Object parent=call(users,"getProfileParent",handle);
            if(!(parent instanceof UserHandle) || id((UserHandle)parent)!=owner || !users.isUserUnlocked(handle)
                    || users.isQuietModeEnabled(handle) || Boolean.TRUE.equals(call(c.getSystemService(KeyguardManager.class),"isDeviceLocked",user)))return false;
            Object info=call(users,"getUserInfo",user);
            if(info==null)return false;
            Object type=field(info,"userType");
            if("android.os.usertype.profile.CLONE".equals(type))return true;
            if(!"android.os.usertype.profile.MANAGED".equals(type))return false;
            ComponentName admin=(ComponentName)call(c.getSystemService(DevicePolicyManager.class),"getProfileOwnerAsUser",user);
            if(admin==null || !"com.zte.cn.doubleapp".equals(admin.getPackageName())
                    || !"com.zte.cn.doubleapp.receiver.BasicDeviceAdminReceiver".equals(admin.getClassName()))return false;
            return (c.getPackageManager().getApplicationInfo(admin.getPackageName(),0).flags&ApplicationInfo.FLAG_SYSTEM)!=0;
        }catch(Exception|LinkageError missing){return false;}
    }
}
