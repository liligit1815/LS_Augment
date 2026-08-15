package ls.augment.com;

import android.content.Context;
import android.os.Build;
import android.service.quicksettings.Tile;

final class TilePresentation {
    static final String KEY_LABEL = "ls_augment_tile_label";
    static final String KEY_DESCRIPTION = "ls_augment_tile_description";
    static final String DEFAULT_LABEL = "LS_Augment";
    static final String DEFAULT_DESCRIPTION = "应用隐藏";

    private TilePresentation() {}

    static String label(Context context) {
        return value(context, KEY_LABEL, DEFAULT_LABEL, 30);
    }

    static String description(Context context) {
        return value(context, KEY_DESCRIPTION, DEFAULT_DESCRIPTION, 60);
    }

    static String stateDescription(String state) {
        if ("ALL_VISIBLE".equals(state)) return "全部显示";
        if ("ALL_HIDDEN".equals(state)) return "全部隐藏";
        if ("MIXED".equals(state)) return "状态混合，点击恢复显示";
        if ("EMPTY".equals(state)) return "未配置应用";
        if ("ERROR".equals(state)) return "状态异常，点击恢复显示";
        return "状态未知";
    }

    static void apply(Context context, Tile tile, String state) {
        String label = label(context);
        String description = description(context);
        String stateText = stateDescription(state);
        tile.setLabel(label);
        if (Build.VERSION.SDK_INT >= 29) tile.setSubtitle(description);
        if (Build.VERSION.SDK_INT >= 30) tile.setStateDescription(stateText);
        String content = description.isEmpty()
                ? label + "，" + stateText
                : label + "，" + description + "，" + stateText;
        tile.setContentDescription(content);
    }

    private static String value(Context context, String key, String fallback, int maxCodePoints) {
        String raw = new AppConfig(context).get(key);
        if (raw == null) return fallback;
        String value = raw.replace('\r', ' ').replace('\n', ' ').trim();
        if (value.isEmpty()) return fallback;
        int cps = value.codePointCount(0, value.length());
        if (cps <= maxCodePoints) return value;
        int end = value.offsetByCodePoints(0, maxCodePoints);
        return value.substring(0, end);
    }
}
