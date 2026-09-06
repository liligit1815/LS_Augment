package ls.augment.com;

/** Extended volume steps represent amplitude gain, never a fabricated hardware index. */
public final class AudioGainPolicy {
    private AudioGainPolicy() { }
    public static String stream(int stream) {
        return stream == 3 ? "media" : stream == 2 ? "ring" : stream == 4 ? "alarm" : "";
    }
    public static String key(String route, int stream) {
        if (!route.equals("speaker") && !route.equals("wired") && !route.equals("bluetooth")) return "";
        String type = stream(stream);
        return type.isEmpty() ? "" : "ls_augment_audio_limit_" + route + "_" + type;
    }
    public static int extraSteps(int limit, int step) {
        if (limit < 100 || limit > 300 || step < 1 || step > 20) return 0;
        return (limit - 100 + step - 1) / step;
    }
    public static int percent(int extra, int step, int limit) {
        return Math.min(Math.max(100, limit), 100 + Math.max(0, extra) * Math.max(1, step));
    }
    public static int milliBel(int percent) {
        return (int) Math.round(2000 * Math.log10(Math.max(100, Math.min(300, percent)) / 100.0));
    }
}
