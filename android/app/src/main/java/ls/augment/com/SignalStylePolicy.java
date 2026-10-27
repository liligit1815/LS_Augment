package ls.augment.com;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/** The Settings entry and Duo editor share the existing dual-signal configuration. */
public final class SignalStylePolicy {
    public static final String READ = "signal_style_read";
    public static final String SELECT = "signal_style_select";
    public static final String CONFLICT_MESSAGE = "请先关闭三合一图标";
    public static final int FLAT=0, HONOR_DUAL=1, IOS_DUAL=2;
    private SignalStylePolicy() { }

    /** Existing installations keep the original Honor rendering unless iOS is selected. */
    public static int style(String value) { return "1".equals(value) ? 1 : 0; }
    public static String styleLabel(int style) { return style == 1 ? "iOS双排" : "荣耀双排"; }
    public static int choice(boolean dual,int style) { return dual ? (style == 1 ? IOS_DUAL : HONOR_DUAL) : FLAT; }
    public static String choiceLabel(int choice) {
        switch(choice){case FLAT:return "平铺";case HONOR_DUAL:return "荣耀双排";case IOS_DUAL:return "iOS双排";
            default:throw new IllegalArgumentException("信号样式无效");}
    }

    /** Null means valid. Call only when an affected feature is being enabled. */
    public static String conflict(Map<String, String> next) {
        return ConfigSchema.truthy(next.get(SystemUiOptions.SIGNAL_DUAL))
                && ConfigSchema.truthy(next.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))
                ? CONFLICT_MESSAGE : null;
    }

    public static Map<String, String> selection(boolean dual) {
        LinkedHashMap<String, String> updates = new LinkedHashMap<>();
        updates.put(SystemUiOptions.SIGNAL_DUAL, dual ? "1" : "0");
        // Dual signals have their own runtime gate. Enabling the whole status-bar
        // editor here also applies its saved clock size, icon limits and layout.
        return updates;
    }

    /** One committed generation selects both the real dual gate and its rendering. */
    public static Map<String,String> selection(int choice) {
        if(choice<FLAT||choice>IOS_DUAL)throw new IllegalArgumentException("信号样式无效");
        LinkedHashMap<String,String> updates=new LinkedHashMap<>(selection(choice!=FLAT));
        // Flat retains the last dual style for a later Duo enable operation.
        if(choice!=FLAT)updates.put(SystemUiOptions.SIGNAL_DUAL_STYLE,choice==IOS_DUAL?"1":"0");
        return updates;
    }

    public static boolean allowedCaller(int uid, int ownUid, String caller, String[] packages) {
        if (uid == ownUid) return true;
        return uid >= 0 && uid / 100000 == ownUid / 100000
                && "com.android.settings".equals(caller) && packages != null
                && Arrays.asList(packages).contains(caller);
    }
}
