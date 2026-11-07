package ls.augment.com;

import android.app.NotificationChannel;
import android.content.Context;
import android.os.IBinder;
import android.os.Process;
import java.util.List;
import org.json.JSONObject;

/** On-demand, read-only channel inventory for one installed app in the editor's user. */
public final class IslandNoticeChannels {
    private static final String SUCCESS = "DUO_CHANNELS ";
    private static final String FAILURE = "DUO_CHANNEL_ERROR ";
    private IslandNoticeChannels() { }

    static JSONObject read(Context context, String pkg) throws Exception {
        int user = Process.myUid() / 100000;
        int uid = context.getPackageManager().getApplicationInfo(pkg, 0).uid;
        if (uid / 100000 != user || IslandNoticeRules.app(user, pkg).isEmpty())
            throw new IllegalArgumentException("应用身份不可用");
        String command = "CLASSPATH=" + RootShell.quote(context.getApplicationInfo().sourceDir)
                + " exec /system/bin/app_process /system/bin ls.augment.com.IslandNoticeChannels "
                + RootShell.quote(pkg) + " " + uid;
        RootShell.Result result = RootShell.run(command, null, 8, 512 * 1024);
        if (result.capture != null && !result.capture.reliable())
            throw new IllegalStateException("channel_query_incomplete");
        for (String line : result.output.split("\n")) {
            if (result.isSuccess() && line.startsWith(SUCCESS))
                return new JSONObject(line.substring(SUCCESS.length()).trim());
            if (line.startsWith(FAILURE)) throw new IllegalStateException(line.trim());
        }
        throw new IllegalStateException(result.timedOut ? "channel_query_timeout" : "channel_query_exit_" + result.exitCode);
    }

    public static void main(String[] args) {
        String stage = "caller";
        try {
            if (Process.myUid() != 0 || args.length != 2) throw new SecurityException();
            int uid = Integer.parseInt(args[1]);
            if (IslandNoticeRules.app(uid / 100000, args[0]).isEmpty() || uid < 0) throw new SecurityException();
            stage = "notification_service";
            IBinder binder = (IBinder) Class.forName("android.os.ServiceManager")
                    .getMethod("getService", String.class).invoke(null, "notification");
            Class<?> service = Class.forName("android.app.INotificationManager");
            Object manager = Class.forName("android.app.INotificationManager$Stub")
                    .getMethod("asInterface", IBinder.class).invoke(null, binder);
            stage = "getNotificationChannelsForPackage";
            java.lang.reflect.Method query = service.getMethod("getNotificationChannelsForPackage",
                    String.class, int.class, boolean.class);
            if (!"android.content.pm.ParceledListSlice".equals(query.getReturnType().getName()))
                throw new NoSuchMethodException();
            Object slice = query.invoke(manager, args[0], uid, false);
            stage = "ParceledListSlice.getList";
            java.lang.reflect.Method getList = query.getReturnType().getMethod("getList");
            if (!List.class.isAssignableFrom(getList.getReturnType())) throw new NoSuchMethodException();
            getList.setAccessible(true);
            List<?> rows = (List<?>) getList.invoke(slice);
            JSONObject channels = new JSONObject();
            stage = "NotificationChannel";
            for (Object row : rows) {
                NotificationChannel channel = (NotificationChannel) row;
                if (!IslandNoticeRules.channel(uid / 100000, args[0], channel.getId()).isEmpty())
                    channels.put(channel.getId(), channel.getName() == null ? channel.getId() : channel.getName().toString());
            }
            System.out.println(SUCCESS + channels);
        } catch (Exception | LinkageError missing) {
            System.err.println(FAILURE + stage + " " + missing.getClass().getSimpleName());
            System.exit(1);
        }
    }
}
