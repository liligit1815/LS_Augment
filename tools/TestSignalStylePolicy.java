package ls.augment.com;

import java.util.HashMap;
import java.util.Map;

/** Shared style, exclusivity and strict Settings caller cases. */
public final class TestSignalStylePolicy {
    private static int checks;
    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        check(SignalStylePolicy.style(null)==0&&SignalStylePolicy.style("0")==0, "existing configurations retain Honor style");
        check(SignalStylePolicy.style("1")==1&&SignalStylePolicy.style("invalid")==0, "iOS selection is explicit and malformed style fails back to Honor");
        check("荣耀双排".equals(SignalStylePolicy.styleLabel(0))&&"iOS双排".equals(SignalStylePolicy.styleLabel(1)), "shared labels distinguish both dual styles");
        check(SignalStylePolicy.choice(false,0)==0&&SignalStylePolicy.choice(false,1)==0,"flat has one canonical selection regardless of remembered style");
        check(SignalStylePolicy.choice(true,0)==1&&SignalStylePolicy.choice(true,1)==2,"dual gate and renderer identify distinct native choices");
        check("平铺".equals(SignalStylePolicy.choiceLabel(0))&&"荣耀双排".equals(SignalStylePolicy.choiceLabel(1))&&"iOS双排".equals(SignalStylePolicy.choiceLabel(2)),"native choices have three explicit labels");
        for(int choice=0;choice<3;choice++){
            Map<String,String> updates=SignalStylePolicy.selection(choice);
            check(Integer.toString(choice==0?0:1).equals(updates.get(SystemUiOptions.SIGNAL_DUAL)),"choice controls the actual dual gate");
            check(choice==0?!updates.containsKey(SystemUiOptions.SIGNAL_DUAL_STYLE):Integer.toString(choice-1).equals(updates.get(SystemUiOptions.SIGNAL_DUAL_STYLE)),"choice atomically selects its renderer while flat preserves memory");
        }
        for(int invalid:new int[]{-1,3,Integer.MAX_VALUE}){
            boolean rejected=false;try{SignalStylePolicy.selection(invalid);}catch(IllegalArgumentException expected){rejected=true;}
            check(rejected,"unknown native choice rejected");
        }
        check(!SignalStylePolicy.selection(true).containsKey(SystemUiOptions.SIGNAL_DUAL_STYLE)&&!SignalStylePolicy.selection(false).containsKey(SystemUiOptions.SIGNAL_DUAL_STYLE), "native merge and flat choices preserve the saved dual style");
        for (String dual : new String[]{"0", "1"}) for (String group : new String[]{"0", "1"}) {
            String conflict = SignalStylePolicy.conflict(Map.of(SystemUiOptions.SIGNAL_DUAL, dual,
                    ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, group));
            check(("1".equals(dual) && "1".equals(group)) == (conflict != null),
                    "dual and three-in-one must be exclusive");
            if (conflict != null) check("请先关闭三合一图标".equals(conflict), "clear conflict wording");
        }
        Map<String, String> draft = new HashMap<>(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "1"));
        draft.putAll(SignalStylePolicy.selection(true));
        check(SignalStylePolicy.conflict(draft) != null, "Settings selection cannot silently clear three-in-one");
        check("1".equals(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)), "selection keeps opponent state");
        check("1".equals(draft.get(ConfigSchema.SYSTEMUI_MASTER)), "selection enables required SystemUI gate");
        check(SignalStylePolicy.selection(false).size() == 1, "flat selection changes only the dual feature");
        check("0".equals(SignalStylePolicy.selection(false).get(SystemUiOptions.SIGNAL_DUAL)), "flat uses the native path");
        check(SignalStylePolicy.allowedCaller(20000, 20000, null, null), "application self caller");
        check(SignalStylePolicy.allowedCaller(1000, 20000, "com.android.settings",
                new String[]{"android", "com.android.settings"}), "verified Settings shared UID");
        check(!SignalStylePolicy.allowedCaller(1000, 20000, "android", new String[]{"com.android.settings"}),
                "shared UID alone cannot impersonate Settings");
        check(!SignalStylePolicy.allowedCaller(1000, 20000, "com.android.settings", new String[]{"android"}),
                "claimed package must belong to calling UID");
        check(!SignalStylePolicy.allowedCaller(1001000, 20000, "com.android.settings", new String[]{"com.android.settings"}),
                "Settings in another user cannot change configuration");
        check(!SignalStylePolicy.allowedCaller(2000, 20000, "com.android.shell", new String[]{"com.android.shell"}),
                "shell cannot write this user feature");
        check(SignalStylePolicy.conflict(Map.of(SystemUiOptions.SIGNAL_DUAL, "true",
                ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "true")) != null, "normal truthy values conflict");
        System.out.println("SignalStylePolicy: " + checks + " behavior assertions passed");
    }
}
