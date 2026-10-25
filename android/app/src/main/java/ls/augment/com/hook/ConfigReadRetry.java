package ls.augment.com.hook;

/** A single reconnect for read-only IPC; callers already run on their own workers. */
final class ConfigReadRetry {
    private static final String AUTHORITY = "ls.augment.com.config";
    private static final String URI = "content://" + AUTHORITY;

    interface Read<T> { T run() throws Exception; }

    private ConfigReadRetry() { }

    static <T> T read(Read<T> operation) throws Exception {
        try { return operation.run(); }
        catch (Exception first) {
            if (!transientProviderFailure(first)) throw first;
            // Repeating a read cannot replay an automation, shell command or
            // settings write after a lost reply. Such operations never use this helper.
            return operation.run();
        }
    }

    static boolean transientProviderFailure(Throwable failure) {
        Throwable current = failure;
        boolean transientFailure = false;
        for (int depth = 0; current != null && depth < 4; depth++, current = current.getCause()) {
            if (current instanceof SecurityException) return false;
            String message = current.getMessage();
            if ("android.os.DeadObjectException".equals(current.getClass().getName())) transientFailure = true;
            else if (current instanceof IllegalArgumentException && unknownAuthority(message)) transientFailure = true;
            else if (current instanceof java.io.FileNotFoundException && message != null
                    && message.startsWith("No content provider: ") && moduleUri(message.substring(21)))
                transientFailure = true;
        }
        return transientFailure;
    }

    static String failure(Throwable failure) {
        if (failure instanceof SecurityException) return "permission_denied;exception=SecurityException";
        if (transientProviderFailure(failure)) return "provider_unavailable;exception=" + safeType(failure);
        return "read_failed;exception=" + safeType(failure);
    }

    static boolean unknownAuthority(String message) {
        return ("Unknown authority " + AUTHORITY).equals(message)
                || ("Unknown authority: " + AUTHORITY).equals(message);
    }

    private static boolean moduleUri(String value) {
        return value.equals(URI) || value.startsWith(URI + "/");
    }

    private static String safeType(Throwable failure) {
        String name = failure.getClass().getName();
        return name.length() <= 160 && name.matches("[A-Za-z0-9_.$]+") ? name : "unknown";
    }
}
