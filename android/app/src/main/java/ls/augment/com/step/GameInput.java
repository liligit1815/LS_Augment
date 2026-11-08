package ls.augment.com.step;

import android.app.ActivityManager;
import android.content.pm.ApplicationInfo;
import android.os.Process;
import android.view.WindowManager;
import java.io.FileInputStream;
import java.security.MessageDigest;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Scope native raw coordinates to the foreground full-screen game on display zero. */
final class GameInput {
    static volatile boolean installed;
    static volatile String status="未探测";
    static float scale=1,x,y;
    static int target=-1;
    static native boolean installNative();
    static native void configure(int uid,float scale,float x,float y,int width,int height);
    static native int counter(int index);
    static boolean file(String name,String expected)throws Exception{
        MessageDigest digest=MessageDigest.getInstance("SHA-256");
        try(FileInputStream in=new FileInputStream("/system/lib64/"+name+".so")){
            byte[] bytes=new byte[32768];int n;while((n=in.read(bytes))!=-1)digest.update(bytes,0,n);
        }
        StringBuilder hex=new StringBuilder();for(byte b:digest.digest())hex.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
        return expected.contentEquals(hex);
    }
    static boolean attempted;
    static synchronized void prepare(){
        if(attempted)return;attempted=true;
        new Thread(()->{
            try{
                if(Process.myUid()!=Process.SYSTEM_UID)return;
                if(!file("libinputflinger","fb8fa1d7b6bac65cb3673afbc27df344218bbceef658889bd9b2e15f8a419216") ||
                   !file("libinput","593e656439cbf4f259498cd64d34823b6c12aa5b329900d7d207a8db8deb52fa") ||
                   !file("libui","50c19568e2b29b954141743766ecd8ac4754f5762194d282f6d599af4f816bd5")){
                    status="系统输入库未标定";return;
                }
                StepHooks.module.loadStepInputLibrary();
                installed=installNative();status=installed?"已就绪":"原厂分发入口未接管";
            }catch(Exception|LinkageError missing){status=missing.toString();}
            finally{android.util.Log.i("StepGameInput",status);}
        },"StepInputCapability").start();
    }
    static void geometry(float next,float dx,float dy){scale=next;x=dx;y=dy;refresh();}
    static void refreshUnderLock(){if(installed && active && !ending && Thread.holdsLock(Wm.lock))refresh();}
    static void refresh(){
        if(!installed)return;
        int uid=-1;
        float inputScale=scale,inputX=x,inputY=y;
        int width=logical==null?0:logical.width(),height=logical==null?0:logical.height();
        try{
            if(active && !ending && scale>0 && scale<1 && logical!=null){
                Object win=field(Wm.display,"mCurrentFocus");
                Object task=win==null?null:call(win,"getTask");
                if(task!=null && task==call(Wm.display,"getFocusedRootTask") && !ownsTask(task)
                        && (Integer)call(task,"getWindowingMode")==1 && (Integer)call(task,"getActivityType")==1){
                    Object a=call(task,"topRunningActivity");
                    WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(win,"mAttrs");
                    if(a!=null && a==field(win,"mActivityRecord") && attrs.type>=1 && attrs.type<=2){
                        ApplicationInfo app=((android.content.pm.ActivityInfo)field(a,"info")).applicationInfo;
                        if(app.uid==(Integer)field(win,"mOwnerUid") && (app.category==ApplicationInfo.CATEGORY_GAME ||
                                (app.flags&ApplicationInfo.FLAG_IS_GAME)!=0 || (attrs.flags&WindowManager.LayoutParams.FLAG_FULLSCREEN)!=0))
                            uid=app.uid;
                        // Main landscape now quarter-turns inside the original
                        // portrait footprint. The calibrated native mapper reads
                        // that rotation from the window matrix; keep the outer
                        // scale, origin and pre-rotation dimensions unchanged.
                    }
                }
            }
        }catch(RuntimeException|LinkageError missing){uid=-1;}
        target=uid;configure(uid,inputScale,inputX,inputY,width,height);
    }
    static String details(){
        return status+(installed?"/uid="+target+"/eligible="+counter(0)+"/corrected="+counter(1)+"/multi="+counter(2)+"/peak="+counter(3):"");
    }
}
