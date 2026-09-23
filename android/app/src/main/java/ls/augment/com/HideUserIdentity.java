package ls.augment.com;

import android.content.Context;
import android.os.UserHandle;
import android.os.UserManager;

/** A checked user-lifetime snapshot; it is not a lock across a later PM command. */
public final class HideUserIdentity {
    private HideUserIdentity() { }

    public static Snapshot read(Context context, int userId) {
        if (context == null || userId < 0 || userId > 99999)
            return Snapshot.failure(userId, "目标用户无效");
        try {
            int uid = Math.multiplyExact(userId, 100000);
            UserHandle handle = UserHandle.getUserHandleForUid(uid);
            UserManager users = context.getSystemService(UserManager.class);
            if (users == null) return Snapshot.failure(userId, "无法读取目标用户身份");
            long serial = users.getSerialNumberForUser(handle);
            if (serial < 0 || serial > Integer.MAX_VALUE)
                return Snapshot.failure(userId, "目标用户不存在或序列号不可用");
            // Android may cache the forward lookup. Also check its reverse mapping;
            // neither read makes the eventual PackageManager mutation atomic.
            UserHandle reverse = users.getUserForSerialNumber(serial);
            if (!handle.equals(reverse))
                return Snapshot.failure(userId, "目标用户身份查询不一致");
            return new Snapshot(true, userId, serial, "");
        } catch (ArithmeticException overflow) {
            return Snapshot.failure(userId, "目标用户标识超出可表示范围");
        } catch (RuntimeException error) {
            return Snapshot.failure(userId, "目标用户身份读取失败");
        }
    }

    public static Snapshot match(Context context, int userId, long expectedSerial) {
        if (expectedSerial < 0) return Snapshot.failure(userId, "应用选择尚未确认用户身份");
        Snapshot current = read(context, userId);
        if (!current.success) return current;
        return current.userSerial == expectedSerial ? current
                : Snapshot.failure(userId, "原用户空间已移除或重建，请重新选择应用");
    }

    public static final class Snapshot {
        public final boolean success;
        public final int userId;
        public final long userSerial;
        public final String message;
        private Snapshot(boolean success, int userId, long userSerial, String message) {
            this.success = success;
            this.userId = userId;
            this.userSerial = userSerial;
            this.message = message;
        }
        private static Snapshot failure(int userId, String message) {
            return new Snapshot(false, userId, -1, message);
        }
    }
}
