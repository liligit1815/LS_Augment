package ls.augment.com;

import java.util.Arrays;

/** Stable configuration identities. A shade header is never the whole shade or its tiles. */
public final class StatusBarSurfaceSpec {
    public static final String ALL="all", MAIN="main", LOCK="lock", NOTIFICATION="notification", CONTROL="control";
    public static final String[] SURFACES={MAIN,LOCK,NOTIFICATION,CONTROL};
    public static final String[] SCOPES={ALL,MAIN,LOCK,NOTIFICATION,CONTROL};
    private StatusBarSurfaceSpec() { }
    public static boolean valid(String value){return value!=null&&Arrays.asList(SURFACES).contains(value);}
    public static boolean validScope(String value){return ALL.equals(value)||valid(value);}
    /** Verified ZTE header roles: merged shade shares notification chrome; unrecognized roles remain unknown. */
    public static String fromPanelType(int type){return type==1?CONTROL:type==2||type==3?NOTIFICATION:"";}
    public static String label(String value){
        switch(value==null?"":value){case ALL:return "所有位置";case MAIN:return "桌面与应用";case LOCK:return "锁屏";
            case NOTIFICATION:return "通知中心";case CONTROL:return "控制中心";default:return "位置未确认";}
    }
}
