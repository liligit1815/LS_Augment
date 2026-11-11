package ls.augment.com.hook;

import android.content.ContentProvider;
import android.content.Context;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** A live SystemUI endpoint; diagnostic strings are never used as cross-process capabilities. */
final class NativeIslandRecorderBridge {
    static final Uri URI=Uri.parse("content://com.android.systemui.zte");
    static final String PUBLISH="ls.augment.recorder.snapshot.v1", QUERY="ls.augment.recorder.owner.v1";
    static boolean install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type=Class.forName("com.zte.feature.callnotify.ClientProvider",false,loader);
            Method method=NativeIslandSceneContract.method(type,"call",Bundle.class,String.class,String.class,Bundle.class);
            if (!ContentProvider.class.isAssignableFrom(type) || method==null || Modifier.isStatic(method.getModifiers())
                    || method.getDeclaringClass()==ContentProvider.class) throw new NoSuchMethodException("provider_call_override");
            module.registerFeatureHook(module.prepareFeatureHook(method,"rm.ui.native_scene.recorder_endpoint",false).intercept(chain->{
                String action=(String)chain.getArg(0);
                if (!PUBLISH.equals(action) && !QUERY.equals(action)) return chain.proceed();
                Bundle reply=new Bundle();
                Context context=((ContentProvider)chain.getThisObject()).getContext();
                if (context==null || !allowed(context,PUBLISH.equals(action)?"cn.zte.recorder":"com.zte.mifavor.launcher")) return reply;
                if (QUERY.equals(action)) {
                    Object scene=chain.getArg(1);
                    reply.putBoolean("owned",NativeIslandScenes.capsuleOwned(scene instanceof String?(String)scene:"record"));
                }
                else {
                    Bundle data=(Bundle)chain.getArg(2);
                    if (data!=null && data.containsKey("state") && data.containsKey("foreground")) {
                        NativeIslandRecorderState.Snapshot value=new NativeIslandRecorderState.Snapshot(
                                data.getLong("generation"),data.getLong("sequence"),data.getLong("observed"),
                                data.getInt("state"),data.getBoolean("foreground"),data.getString("count"));
                        reply.putBoolean("accepted",NativeIslandScenes.recorderSnapshot(value));
                    }
                }
                return reply;
            }));
            return true;
        } catch (Throwable missing) { module.logFeatureError("NATIVE_RECORDER_ENDPOINT",missing); return false; }
    }
    private static boolean allowed(Context context,String pkg) {
        try {
            int uid=context.getPackageManager().getApplicationInfo(pkg,0).uid;
            return Binder.getCallingUid()==uid && uid/100000==Process.myUid()/100000;
        } catch (Exception absent) { return false; }
    }
    static boolean publish(Context context,long generation,long sequence,int state,boolean foreground,String count) {
        Bundle data=new Bundle(); data.putLong("generation",generation);data.putLong("sequence",sequence);
        data.putLong("observed",SystemClock.elapsedRealtime());data.putInt("state",state);
        data.putBoolean("foreground",foreground);data.putString("count",count);
        try {
            Bundle reply=context.getContentResolver().call(URI,PUBLISH,null,data);
            return reply!=null && reply.getBoolean("accepted");
        } catch (RuntimeException unavailable) { return false; }
    }
    static boolean owns(Context context) {
        return owns(context,"record");
    }
    static boolean owns(Context context,String scene) {
        try {
            Bundle reply=context.getContentResolver().call(URI,QUERY,scene,null);
            return reply!=null && reply.getBoolean("owned");
        } catch (RuntimeException unavailable) { return false; }
    }
    private NativeIslandRecorderBridge() { }
}
