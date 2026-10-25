package ls.augment.com;

import android.os.Bundle;
import org.json.JSONArray;
import org.json.JSONObject;

/** The LinkSDK type-4 model, without destinations, coordinates or synthetic defaults. */
public final class AtomicWorkbenchAmapLinkData {
    public static final int MAX_PAYLOAD_CHARS = 262144;
    private AtomicWorkbenchAmapLinkData() { }

    public static Bundle parse(String plain) {
        if (plain == null || plain.isEmpty() || plain.length() > MAX_PAYLOAD_CHARS) return null;
        try {
            JSONObject root = new JSONObject(plain);
            Object raw = root.opt("datas");
            JSONArray entries = raw instanceof JSONArray ? (JSONArray) raw
                    : raw instanceof String ? new JSONArray((String) raw) : null;
            if (entries == null || entries.length() > 128) return null;
            Bundle latest = null;
            for (int i = 0; i < entries.length(); i++) {
                JSONObject entry = entries.optJSONObject(i);
                if (entry == null || !(entry.opt("type") instanceof Number)
                        || ((Number) entry.opt("type")).doubleValue() != 4d) continue;
                Object payload = entry.opt("data");
                JSONObject data = payload instanceof JSONObject ? (JSONObject) payload
                        : payload instanceof String ? new JSONObject((String) payload) : null;
                if (data == null) continue;
                Bundle fields = new Bundle();
                for (String key : new String[]{"eventType", "curManeuverID", "segmentRemainDist", "speed",
                        "routeRemainTime", "routeRemainDist"}) {
                    Object value = data.opt(key);
                    if (value instanceof Number) fields.putDouble(key, ((Number) value).doubleValue());
                }
                for (String key : new String[]{"curRouteName", "nextRouteName"}) {
                    Object value = data.opt(key);
                    if (value instanceof String && !"null".equalsIgnoreCase(((String) value).trim()))
                        fields.putString(key, AtomicWorkbenchAmapData.text((String) value));
                }
                Bundle frame = AtomicWorkbenchAmapData.structured(fields);
                if (frame != null) latest = frame;
            }
            return latest;
        } catch (Exception malformed) { return null; }
    }
}
