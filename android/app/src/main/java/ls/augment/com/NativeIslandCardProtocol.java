package ls.augment.com;

/** Live capability discovery, separate from the user's scene selection. */
public final class NativeIslandCardProtocol {
    public static final String METHOD = "native_island_card_host";
    public static final String DESCRIPTOR = "ls.augment.com.NativeIslandCardHost.v1";
    public static final String REDISCOVER = "ls.augment.com.action.NATIVE_ISLAND_CARD_REDISCOVER";
    public static final int QUERY = 1;
    public static final String BATTERY_ID_PREFIX = "duo_preflight_battery_";
    public static String scene(String sender, String cardId) {
        if ("zte.com.cn.alarmclock".equals(sender)
                && "zte.com.cn.alarmclock_timer_countdown".equals(cardId)) return "countdown";
        if ("cn.zte.recorder".equals(sender) && "cn.zte.recorder_recorder_background".equals(cardId)) return "record";
        if ("com.zte.cn.zteshare".equals(sender) && "com.zte.cn.zteshare_share_transfer".equals(cardId)) return "transfer";
        if ("com.zte.multscr".equals(sender) && "com.zte.multscr_com.zte.multscr.share_transfer".equals(cardId)) return "nfc_transfer";
        if ("com.android.dialer".equals(sender) && "com.android.dialer_call_background".equals(cardId)) return "call";
        if ("com.zte.personalagent".equals(sender)) {
            if (cardId != null && cardId.startsWith("com.zte.personalagent_")
                    && weatherId(cardId.substring("com.zte.personalagent_".length()))) return "weather_travel";
            if (cardId != null && cardId.startsWith("com.zte.personalagent_")
                    && batteryId(cardId.substring("com.zte.personalagent_".length()))) return "preflight_battery";
            if (cardId != null && cardId.startsWith("com.zte.personalagent_")
                    && flightId(cardId.substring("com.zte.personalagent_".length()))) return "flight";
            if ("com.zte.personalagent_ReturnBike".equals(cardId)) return "cycling";
            if ("com.zte.personalagent_ChargingPowerReminder".equals(cardId)
                    || "com.zte.personalagent_ChargingReminder".equals(cardId)) return "nearby_charging";
            if (personalId(cardId, "com.zte.personalagent_meeting_")) return "calendar_meeting";
            if (personalId(cardId, "com.zte.personalagent_electronic_guide_")) return "scenic_guide";
        }
        if ("com.zte.nebulatranslation".equals(sender)) {
            if ("com.zte.nebulatranslation_transcription".equals(cardId)) return "meeting";
            if ("com.zte.nebulatranslation_call".equals(cardId)) return "ai";
        }
        return null;
    }
    public static String sourcePackage(String scene) {
        if ("countdown".equals(scene)) return "zte.com.cn.alarmclock";
        if ("record".equals(scene)) return "cn.zte.recorder";
        if ("transfer".equals(scene)) return "com.zte.cn.zteshare";
        if ("nfc_transfer".equals(scene)) return "com.zte.multscr";
        if ("call".equals(scene)) return "com.android.dialer";
        if ("calendar_meeting".equals(scene) || "scenic_guide".equals(scene) || "nearby_charging".equals(scene) || "cycling".equals(scene) || "flight".equals(scene) || "preflight_battery".equals(scene) || "weather_travel".equals(scene)) return "com.zte.personalagent";
        if ("meeting".equals(scene) || "ai".equals(scene)) return "com.zte.nebulatranslation";
        return null;
    }
    public static int sceneBit(String scene) {
        return "countdown".equals(scene) ? 1 : "record".equals(scene) ? 2
                : "meeting".equals(scene) ? 4 : "ai".equals(scene) ? 8 : "transfer".equals(scene) ? 16
                : "nfc_transfer".equals(scene) ? 32 : "call".equals(scene) ? 64 : "calendar_meeting".equals(scene) ? 128
                : "scenic_guide".equals(scene) ? 256 : "nearby_charging".equals(scene) ? 512 : "cycling".equals(scene) ? 1024 : "flight".equals(scene) ? 2048 : "preflight_battery".equals(scene) ? 4096 : "weather_travel".equals(scene) ? 8192 : 0;
    }
    public static boolean weatherId(String id) {
        String prefix = "duo_weather_";
        if (id == null || !id.startsWith(prefix) || id.length() <= prefix.length() || id.length() > prefix.length() + 19) return false;
        for (int i = prefix.length(); i < id.length(); i++) if (id.charAt(i) < '0' || id.charAt(i) > '9') return false;
        return true;
    }
    public static boolean batteryId(String id) {
        if (id == null || !id.startsWith(BATTERY_ID_PREFIX) || id.length() != BATTERY_ID_PREFIX.length() + 64) return false;
        for (int i = BATTERY_ID_PREFIX.length(); i < id.length(); i++) {
            char c = id.charAt(i);
            if (!(c >= '0' && c <= '9') && !(c >= 'a' && c <= 'f')) return false;
        }
        return true;
    }
    public static boolean flightType(String type) {
        return "TRAVEL_FLIGHT_PLAN".equals(type) || "TRAVEL_FLIGHT_AIRPORT".equals(type)
                || "TRAVEL_CAROUSEL".equals(type) || "TRAVEL_FLIGHT_SCENIC_TINY".equals(type)
                || "FLIGHT_BOOK_HOTEL_CARD".equals(type);
    }
    public static boolean flightId(String id) {
        if (id == null || id.length() > 256) return false;
        for (int i = 0; i < id.length(); i++) if (Character.isISOControl(id.charAt(i))) return false;
        for (String type : new String[]{"TRAVEL_FLIGHT_PLAN", "TRAVEL_FLIGHT_AIRPORT", "TRAVEL_CAROUSEL",
                "TRAVEL_FLIGHT_SCENIC_TINY", "FLIGHT_BOOK_HOTEL_CARD"})
            if (id.length() > type.length() + 1 && id.endsWith("_" + type)) return true;
        return false;
    }
    private static boolean personalId(String id, String prefix) {
        if (id == null || id.length() > 256 || !id.startsWith(prefix)) return false;
        String suffix = id.substring(prefix.length());
        // OEM IDs end in a database ID, optionally preceded by a meeting code or scenic name.
        int split = suffix.lastIndexOf('_');
        String databaseId = suffix.substring(split + 1);
        if (databaseId.isEmpty() || split == 0) return false;
        for (int i = 0; i < suffix.length(); i++) if (Character.isISOControl(suffix.charAt(i))) return false;
        for (int i = 0; i < databaseId.length(); i++) if (databaseId.charAt(i) < '0' || databaseId.charAt(i) > '9') return false;
        return true;
    }
    public static boolean compactOnly(String scene) { return "meeting".equals(scene) || "ai".equals(scene) || compactCallback(scene); }
    public static boolean compactCallback(String scene) { return "call".equals(scene); }
    private NativeIslandCardProtocol() { }
}
