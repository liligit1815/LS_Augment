package ls.augment.com;

/** Four display choices; zero preserves configurations saved before these choices existed. */
public final class StatusBarNetworkDisplay {
    private StatusBarNetworkDisplay() { }
    public static final String[] LABELS = {"单排仅上传网速", "单排仅下载网速", "单排上行/下行", "双排上行/下行"};
    public static int resolve(String value, boolean legacyTwoRows) {
        try { int mode=Integer.parseInt(value); if(mode>=1&&mode<=4)return mode; }
        catch (Exception ignored) { }
        return legacyTwoRows?4:3;
    }
    public static String format(int mode, String upload, String download) {
        if(mode==1)return "↑"+upload;
        if(mode==2)return "↓"+download;
        return "↑"+upload+(mode==4?"\n":" ")+"↓"+download;
    }
}
