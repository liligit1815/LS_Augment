package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.provider.Settings;

/** OEM capability publication, shared by the settings page and authenticated selection endpoint. */
public final class NativeIslandMode {
    public static final String LEGACY="ordinary", MODERN="fullscreen", UNKNOWN="unknown";
    public static final String DIAGNOSTIC="ls_augment_native_island_mode";
    public static final String PACKAGE="com.android.systemui";
    public static final String OLD_PAGE="com.zte.feature.dynamicisland.settings.DynamicIslandSettingsActivity";
    public static final String NEW_PAGE="com.zte.feature.dynamicisland.settings.DynamicIslandFullScreenSettingsActivity";
    public static String key(String mode){return MODERN.equals(mode)?"dynamic_island_function_switch":"dynamic_island_switch_state";}
    public static String page(String mode){return MODERN.equals(mode)?NEW_PAGE:OLD_PAGE;}
    public static String name(String mode){return MODERN.equals(mode)?"魔力岛":LEGACY.equals(mode)?"星云岛":"原厂岛";}
    public static boolean known(String mode){return MODERN.equals(mode)||LEGACY.equals(mode);}
    public static String stamp(Context context,String mode){
        try{return mode+":"+BuildConfig.VERSION_CODE+":"+context.getPackageManager().getPackageInfo(PACKAGE,0).lastUpdateTime;}
        catch(PackageManager.NameNotFoundException missing){return "";}
    }
    public static String detect(Context context){
        String value=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(DIAGNOSTIC,"");
        for(String mode:new String[]{MODERN,LEGACY}){String current=stamp(context,mode);if(!current.isEmpty()&&value.equals(current))return mode;}
        // An enabled OEM entry can be opened before SystemUI has published its runtime contract.
        // Presence alone is insufficient: both branches can be packaged on the same firmware.
        if(enabledPage(context,NEW_PAGE))return MODERN;
        if(enabledPage(context,OLD_PAGE))return LEGACY;
        return UNKNOWN;
    }
    private static boolean enabledPage(Context context,String name){
        try{
            PackageManager pm=context.getPackageManager();ComponentName component=new ComponentName(PACKAGE,name);
            ActivityInfo info=pm.getActivityInfo(component,PackageManager.MATCH_DISABLED_COMPONENTS);
            int state=pm.getComponentEnabledSetting(component);
            return info.applicationInfo.enabled&&(state==PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                    ||state==PackageManager.COMPONENT_ENABLED_STATE_DEFAULT&&info.enabled);
        }catch(PackageManager.NameNotFoundException missing){return false;}
    }
    public static boolean enabled(Context context,String mode){
        return known(mode)&&Settings.System.getInt(context.getContentResolver(),key(mode),0)==1;
    }
    private NativeIslandMode(){}
}
