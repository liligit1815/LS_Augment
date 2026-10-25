package ls.augment.com;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import java.lang.reflect.Method;

/** Direct activity launch for the phone's private UID-0 app_process backend. */
final class AtomicWorkbenchLaunchBridge {
    private AtomicWorkbenchLaunchBridge() { }

    static void verifyAvailable(Object service) throws Exception {
        launchMethod(service);
    }

    static int start(Object service, Intent intent, Bundle options, int userId) throws Exception {
        return start(service, intent, options, userId, null);
    }

    static int start(Object service, Intent intent, Bundle options, int userId, String resolvedType) throws Exception {
        if (intent == null || intent.getComponent() == null || userId < 0)
            throw new IllegalArgumentException("工作区应用启动参数无效");
        Method method = launchMethod(service);
        // systemMain() creates an ApplicationThread that is not registered with ATMS.
        // Supplying it makes the ROM return START_PERMISSION_DENIED (-94). A null
        // caller uses this root process's real Binder UID; do not borrow the UI's thread.
        // "android" is the root system Context's package, not the target application's.
        Object result = method.invoke(service, null, "android", null, intent, resolvedType,
                null, null, -1, 0, null, options, userId);
        if (!(result instanceof Integer)) throw new IllegalStateException("系统未返回工作区启动结果");
        return (Integer) result;
    }

    static void requireAccepted(int result) {
        // START_SUCCESS, START_RETURN_INTENT_TO_CALLER, START_TASK_TO_FRONT,
        // START_DELIVERED_TO_TOP. None proves the task reached the requested display.
        if (result < 0 || result > 3)
            throw new IllegalStateException("系统未接受工作区应用启动请求（返回码 " + result + "）");
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static Method launchMethod(Object service) throws Exception {
        if (android.os.Process.myUid() != 0)
            throw new SecurityException("工作区启动桥只能在手机 ROOT 进程使用");
        if (service == null) throw new IllegalStateException("应用任务服务不可用");
        // This exact 12-argument signature is verified against the target Android 16 ROM.
        // Fail closed on a different contract; Context.startActivityAsUser discards its int.
        Method method = service.getClass().getMethod("startActivityAsUser",
                Class.forName("android.app.IApplicationThread"), String.class, String.class,
                Intent.class, String.class, IBinder.class, String.class, int.class, int.class,
                Class.forName("android.app.ProfilerInfo"), Bundle.class, int.class);
        if (method.getReturnType() != int.class)
            throw new IllegalStateException("系统工作区启动接口返回类型不兼容");
        method.setAccessible(true);
        return method;
    }
}
