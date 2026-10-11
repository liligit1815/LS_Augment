package ls.augment.com;

import android.content.Context;

/** Extra Dim uses the platform color transform, independently of panel brightness. */
final class ExtraDimControl {
    static final String ACTIVE = "reduce_bright_colors_activated";
    static final String LEVEL = "reduce_bright_colors_level";
    private static volatile boolean active, ready, verified;
    private static volatile int strength=50;
    private static int stateUser=-1;
    private static volatile String message="正在读取极暗执行状态";
    private ExtraDimControl() { }
    /** Called through the authenticated provider by a background SystemUI worker. */
    static android.os.Bundle call(Context context,String method,android.os.Bundle extras) {
        boolean ok=false;
        if("extra_dim_read".equals(method) && extras==null) ok=read(context);
        else if("extra_dim_select".equals(method) && extras!=null && extras.size()==2
                && extras.get("active") instanceof Boolean && extras.get("strength") instanceof Integer) {
            int level=extras.getInt("strength",-1);
            if(level>=0 && level<=100)ok=set(context,extras.getBoolean("active"),level);
        }
        android.os.Bundle result=new android.os.Bundle();result.putBoolean("ok",ok);
        result.putBoolean("active",active);result.putInt("strength",strength);
        result.putBoolean("ready",ready);result.putString("message",message);return result;
    }
    static boolean active(Context context) { return active; }
    static boolean ready() { return ready; }
    static boolean verified() { return verified; }
    static String message() { return message; }
    static int strength(Context context) { return strength; }
    static synchronized boolean read(Context context) {
        int user=android.os.Process.myUid()/100000;
        if(stateUser!=user){active=false;strength=50;ready=false;verified=false;stateUser=user;}
        RootShell.Result r=RootShell.run("dumpsys color_display",null,4,32768);
        if(!r.isSuccess()){ready=false;verified=false;message="无法读取系统显示服务，请检查 Root 授权";return false;}
        ExtraDimRuntime.Snapshot actual=ExtraDimRuntime.parse(r.output);
        if(actual==null) {
            readRequested(user);
            ready=false;verified=false;message="无法核验此 ROM 的极暗执行状态，请确认系统作用域并重启；仍无反馈时，此 ROM 暂不支持";return false;
        }
        if(actual.user!=user){active=false;strength=50;ready=false;verified=false;message="极暗仅支持当前前台用户，不能从工作资料控制其他用户的屏幕";return false;}
        active=actual.active;strength=actual.strength;
        ready=actual.available;
        verified=ready&&actual.transform;
        if(!ready)readRequested(user);
        message=!ready?"此系统未提供可用的极暗色彩变换":actual.transform?"":"系统极暗色彩变换尚未完成";
        return ready;
    }
    private static void readRequested(int user) {
        // Only expose a saved request for turning it OFF when execution cannot
        // be inspected. This never establishes capability or application success.
        RootShell.Result request=RootShell.run("settings --user "+user+" get secure "+ACTIVE
                +"; settings --user "+user+" get secure "+LEVEL,null,4,512);
        if(!request.isSuccess())return;
        String[] values=request.output.trim().split("\\s+");
        if(values.length!=2||!values[0].matches("0|1|null")||!values[1].matches("[0-9]{1,3}|null"))return;
        int amount=values[1].equals("null")?50:Integer.parseInt(values[1]);
        if(amount<=100){active=values[0].equals("1");strength=amount;}
    }
    static synchronized boolean set(Context context, boolean active, int strength) {
        if (strength < 0 || strength > 100) return false;
        int user=android.os.Process.myUid()/100000;
        if(stateUser!=user){ExtraDimControl.active=false;ExtraDimControl.strength=50;ready=false;verified=false;stateUser=user;}
        // Enabling requires a real native pipeline. Disabling always remains
        // possible, including after a firmware change removed that pipeline.
        if(active && !read(context))return false;
        ModuleSystemSettings.WriteResult result = ModuleSystemSettings.setExtraDim(context, active, strength);
        if(!result.success){message=result.message;return false;}
        // Native transitions take 2.6s (3s under CTS). Share one deadline across
        // polling and bounded dumps, without multiplying 4s process timeouts.
        long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(4);
        while(System.nanoTime()<deadline) {
            RootShell.Result r=RootShell.run("dumpsys color_display",null,1,32768);
            ExtraDimRuntime.Snapshot actual=r.isSuccess()?ExtraDimRuntime.parse(r.output):null;
            if(actual!=null && actual.user==user) {
                ExtraDimControl.active=actual.active;ExtraDimControl.strength=actual.strength;ready=actual.available;verified=ready&&actual.transform;
                if(actual.matches(user,active,strength)){message="";return true;}
            }else if(actual!=null) {
                ExtraDimControl.active=false;ExtraDimControl.strength=50;ready=false;verified=false;
                message="当前前台用户已变化，未使用其他用户的极暗执行状态";return false;
            }
            long remaining=deadline-System.nanoTime();
            if(remaining<=0)break;
            try {Thread.sleep(Math.min(350,Math.max(1,java.util.concurrent.TimeUnit.NANOSECONDS.toMillis(remaining))));}
            catch(InterruptedException interrupted){Thread.currentThread().interrupt();break;}
        }
        message=active?"系统未完成极暗色彩变换，设置已保存但未确认生效":"关闭请求已保存，尚未确认系统移除极暗色彩变换";
        verified=false;
        return false;
    }
}
