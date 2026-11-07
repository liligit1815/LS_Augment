package ls.augment.com.step;

import android.content.pm.ApplicationInfo;
import android.view.WindowManager;
import java.util.HashMap;
import java.util.Map;
import static ls.augment.com.step.StepRuntime.*;

/** Hardware sensor overlays stay in physical coordinates, including native input hit regions. */
final class PhysicalFingerprint {
    static Class<?> windowType;
    static final Map<String,Integer> trusted=new HashMap<>();
    static boolean observed;
    static void install(ClassLoader cl){
        try{
            windowType=Class.forName("com.android.server.wm.WindowState",false,cl);
            if(StepMembers.findField(windowType,"mAttrs").getType()!=WindowManager.LayoutParams.class
                    || StepMembers.findField(windowType,"mOwnerUid").getType()!=int.class)
                throw new NoSuchFieldException("fingerprint window identity");
            for(String pkg:new String[]{"com.fingerprint.sensorservice","com.zte.fingerprints","com.android.systemui"}){
                try{
                    ApplicationInfo app=Wm.context.getPackageManager().getApplicationInfo(pkg,0);
                    if((app.flags&(ApplicationInfo.FLAG_SYSTEM|ApplicationInfo.FLAG_UPDATED_SYSTEM_APP))!=0)trusted.put(pkg,app.uid);
                }catch(android.content.pm.PackageManager.NameNotFoundException absent){}
            }
        }catch(Exception|LinkageError missing){windowType=null;report(null,0,"物理指纹窗口身份接口不可用："+missing,-1);}
    }
    static boolean matches(String pkg,int type,String title,boolean trustedOwner,boolean hasTask){
        if(!trustedOwner || hasTask || type<WindowManager.LayoutParams.FIRST_SYSTEM_WINDOW)return false;
        if("com.fingerprint.sensorservice".equals(pkg) || "com.zte.fingerprints".equals(pkg))return true;
        return "com.android.systemui".equals(pkg) && ("UdfpsView".equals(title) || "UdfpsControllerOverlay".equals(title)
                || "UdfpsOverlay".equals(title) || "FingerprintOverlay".equals(title));
    }
    static boolean window(Object candidate){
        if(!NativeWorkspaceGuard.active || NativeWorkspaceGuard.ending || windowType==null || !windowType.isInstance(candidate))return false;
        WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(candidate,"mAttrs");
        if(attrs.type>=WindowManager.LayoutParams.FIRST_SUB_WINDOW && attrs.type<=WindowManager.LayoutParams.LAST_SUB_WINDOW){
            Object parent=call(candidate,"getParentWindow");return parent!=null && parent!=candidate && window(parent);
        }
        Integer uid=trusted.get(attrs.packageName);
        if(uid==null)return false;
        if(!matches(attrs.packageName,attrs.type,String.valueOf(attrs.getTitle()),uid!=null && uid.equals(field(candidate,"mOwnerUid")),call(candidate,"getTask")!=null))return false;
        if(call(candidate,"getDisplayContent")!=Wm.display)return false;
        if(!observed){observed=true;report(null,0,"指纹原厂窗口保持物理坐标；owner="+attrs.packageName+"；type="+attrs.type,-1);}
        return true;
    }
}
