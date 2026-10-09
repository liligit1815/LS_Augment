package ls.augment.com;

/** One atomic identity observation; the display account never replaces the runtime binding. */
public final class HealthAccountState {
    public static final String RUNTIME = "ls_augment_health_account_observation";
    static final String BINDING = "ls_augment_health_account_binding";
    public static final long FRESH_MS = 90_000L;
    public final String binding, account;
    public final long observedAt;

    private HealthAccountState(String binding, String account, long observedAt) {
        this.binding = binding; this.account = account; this.observedAt = observedAt;
    }
    public static String encode(String binding, String account, long now) {
        if (now <= 0 || binding == null || account == null) return "";
        if (binding.isEmpty() && account.isEmpty()) return "HA1|" + now + "||";
        if (!binding.matches("[0-9a-f]{64}") || !account.matches("[0-9]{1,32}")) return "";
        return "HA1|" + now + "|" + binding + "|" + account;
    }
    public static HealthAccountState parse(String value) {
        if (value == null) return null;
        try {
            String[] parts = value.split("\\|", -1);
            if (parts.length != 4 || !"HA1".equals(parts[0])) return null;
            long at = Long.parseLong(parts[1]);
            if (!value.equals(encode(parts[2], parts[3], at))) return null;
            return new HealthAccountState(parts[2], parts[3], at);
        } catch (RuntimeException ignored) { return null; }
    }
    public boolean fresh(long now) { return now >= observedAt && now - observedAt < FRESH_MS; }
    public boolean signedIn() { return !binding.isEmpty() && !account.isEmpty(); }
    public boolean matches(String bound) { return signedIn() && binding.equals(bound); }
    public static boolean canEnable(String bound, HealthAccountState active, long now) {
        return bound != null && active != null && active.fresh(now) && active.matches(bound);
    }
}
