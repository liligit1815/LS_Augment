package ls.augment.com;

import android.content.Context;
import android.provider.Settings;

/** Same prerequisite in the editor and the SystemUI execution path. */
public final class VolumePositionSettings {
    public static final String NATIVE_ENABLED="allow_media_app_volume";
    private VolumePositionSettings(){}
    public static boolean multiAppEnabled(Context context){
        try{return context!=null&&Settings.System.getInt(context.getContentResolver(),NATIVE_ENABLED,0)==1;}
        catch(RuntimeException unavailable){return false;}
    }
}
