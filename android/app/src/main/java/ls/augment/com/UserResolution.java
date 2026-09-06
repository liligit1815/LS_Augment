package ls.augment.com;

import java.util.Collection;

/** Explicit result for current Android-user discovery; failure is never user 0. */
public final class UserResolution {
    public final boolean resolved;
    public final int userId;
    public final String message;

    private UserResolution(boolean resolved, int userId, String message) {
        this.resolved = resolved;
        this.userId = userId;
        this.message = message == null ? "" : message;
    }

    public static UserResolution resolve(boolean primarySucceeded, String primaryOutput,
            boolean fallbackSucceeded, String fallbackOutput, Collection<Integer> knownUsers) {
        Integer primary = primarySucceeded ? parse(primaryOutput) : null;
        Integer fallback = fallbackSucceeded ? parse(fallbackOutput) : null;
        if (primarySucceeded && primary == null) {
            return failure("主系统接口返回了空值或无法识别的用户编号");
        }
        if (fallbackSucceeded && fallback == null) {
            return failure("备用系统接口返回了空值或无法识别的用户编号");
        }
        if (primary != null && fallback != null && !primary.equals(fallback)) {
            return failure("两种系统接口返回了不同的当前用户");
        }
        Integer selected = primary != null ? primary : fallback;
        if (selected == null) return failure("无法识别当前用户");
        if (knownUsers == null || knownUsers.isEmpty() || !knownUsers.contains(selected)) {
            return failure("当前用户不在系统用户列表中：" + selected);
        }
        return new UserResolution(true, selected, "当前用户 " + selected);
    }

    public static UserResolution failure(String message) {
        return new UserResolution(false, -1, message);
    }

    private static Integer parse(String output) {
        if (output == null) return null;
        String value = output.trim();
        if (!value.matches("[0-9]{1,5}")) return null;
        try {
            int parsed = Integer.parseInt(value);
            return parsed >= 0 && parsed <= 99999 ? parsed : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
