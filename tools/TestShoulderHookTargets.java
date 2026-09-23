package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.util.List;

public final class TestShoulderHookTargets {
    static class Context { }
    static class View { }
    static class ViewGroup extends View { }
    static class Obfuscated {
        View t;
        static String[] d(Context c, String p) { return null; }
        static boolean k(Context c, String p) { return false; }
        static boolean l(Context c, String p, String a) { return false; }
        static List<?> g(Context c) { return null; }
        void V(ViewGroup v) { }
        void onTgkCaseViewBottonClick(int side) { }
    }
    static class Readable15 {
        View mKeys;
        static String[] getBlackList(Context c, String p) { return null; }
        static boolean isPluginEnable(Context c, String p) { return false; }
        static boolean isPluginEnable(Context c, String p, String a, boolean local) { return false; }
        static List<?> getPluginList(Context c, String a) { return null; }
        void initView(View v) { }
        void initView(ViewGroup v) { }
        void onTgkCaseViewBottonClick() { }
    }
    static class Readable16 {
        View mKeys;
        static String[] getBlackList(Context c, String p) { return null; }
        static boolean isPluginEnable(Context c, String p) { return false; }
        static boolean isPluginEnable(Context c, String p, String a) { return false; }
        static List<?> getPluginList(Context c) { return null; }
        void initView(ViewGroup v) { }
        void onTgkCaseViewBottonClick(int side) { }
    }
    static class WrongShape {
        String mKeys;
        String[] getBlackList(Context c, String p) { return null; } // Must be static.
        static boolean isPluginEnable(Context c, Object p) { return false; }
        static List<?> getPluginList(Context c, Object p) { return null; }
        boolean onTgkCaseViewBottonClick() { return false; } // Wrong return.
        void initView(ViewGroup view) { }
    }
    private static int checks;
    static void check(boolean ok, String message) {
        checks++;
        if (!ok) throw new AssertionError(message);
    }
    static void profile(Class<?> type, String field, int eligibilityArgs, int listArgs, int clickArgs) {
        check(ShoulderHookTargets.pluginBlacklist(type, Context.class) != null, "blacklist: " + type);
        check(ShoulderHookTargets.pluginEnabled(type, Context.class) != null, "plugin enabled: " + type);
        check(ShoulderHookTargets.pluginEligibility(type, Context.class).getParameterCount() == eligibilityArgs,
                "eligibility signature: " + type);
        check(ShoulderHookTargets.pluginList(type, Context.class).getParameterCount() == listArgs,
                "list package semantics: " + type);
        check(ShoulderHookTargets.quickSwitchClick(type).getParameterCount() == clickArgs,
                "click signature: " + type);
        Method bind = ShoulderHookTargets.toolbarBind(type, ViewGroup.class);
        check(bind.getParameterTypes()[0] == ViewGroup.class, "avoid View bridge: " + type);
        check(ShoulderHookTargets.toolbarButton(type, bind, View.class).getName().equals(field),
                "button matches binding profile: " + type);
    }
    public static void main(String[] args) {
        profile(Obfuscated.class, "t", 3, 1, 1);
        profile(Readable15.class, "mKeys", 4, 2, 0);
        profile(Readable16.class, "mKeys", 3, 1, 1);
        check(ShoulderHookTargets.pluginBlacklist(WrongShape.class, Context.class) == null, "reject instance blacklist");
        check(ShoulderHookTargets.pluginEnabled(WrongShape.class, Context.class) == null, "reject broad Object parameter");
        check(ShoulderHookTargets.pluginList(WrongShape.class, Context.class) == null, "reject unknown list contract");
        check(ShoulderHookTargets.quickSwitchClick(WrongShape.class) == null, "reject nonvoid click");
        check(ShoulderHookTargets.toolbarButton(WrongShape.class,
                ShoulderHookTargets.toolbarBind(WrongShape.class, ViewGroup.class), View.class) == null,
                "reject non-View button");
        System.out.println("PASS shoulder exact targets: " + checks + " assertions");
    }
}
