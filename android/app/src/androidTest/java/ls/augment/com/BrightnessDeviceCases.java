package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import org.json.JSONObject;
import java.util.Map;

/** Real root readback and exit-path tests; never packaged in the shipped APK. */
final class BrightnessDeviceCases {
    static JSONObject run(Context context) throws Exception {
        AppConfig config=new AppConfig(context);
        String original=config.get(BrightnessRange.ENABLED);
        String mode=root("settings get system screen_brightness_mode");
        String brightness=root("settings get system screen_brightness");
        JSONObject result=new JSONObject();
        FullBrightnessControl control=FullBrightnessControl.get(context);
        try {
            require(config.save(Map.of(BrightnessRange.ENABLED,"1")).success,"enable");
            root("settings put system screen_brightness_mode 0; cmd display set-brightness 0.8584");
            long deadline=SystemClock.uptimeMillis()+6000;
            while(!control.call("brightness_read",null).getBoolean("ready") && SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);
            select(control,0);awaitDriver(1);result.put("minimum",1);
            select(control,BrightnessRange.SLIDER_MAX);awaitDriver(8190);result.put("maximum",8190);
            select(control,BrightnessRange.NORMAL_END);awaitDriver(7030);result.put("returnToNativeMaximum",7030);
            root("cmd display set-brightness 0.0039196345");
            select(control,0);awaitDriver(1);
            select(control,BrightnessRange.NORMAL_START);awaitDriver(2);result.put("returnToNativeMinimum",2);
            root("cmd display set-brightness 0.8584");
            select(control,BrightnessRange.SLIDER_MAX);awaitDriver(8190);
            require(config.save(Map.of(BrightnessRange.ENABLED,"0")).success,"disable");
            awaitDriver(7030);result.put("disableRestoresNative",7030);
            require(config.save(Map.of(BrightnessRange.ENABLED,"1")).success,"reenable");
            select(control,BrightnessRange.SLIDER_MAX);awaitDriver(8190);
            root("settings put system screen_brightness_mode 1");
            deadline=SystemClock.uptimeMillis()+5000;
            while(control.call("brightness_read",null).getInt("selected")>=0 && SystemClock.uptimeMillis()<deadline)SystemClock.sleep(100);
            require(control.call("brightness_read",null).getInt("selected")==-1,"automatic mode releases override");
            result.put("automaticModeReleases",true);
            return result;
        } catch(Throwable failure) {
            throw new AssertionError(failure+"; state="+control.call("brightness_read",null),failure);
        } finally {
            config.save(Map.of(BrightnessRange.ENABLED,"0"));SystemClock.sleep(700);
            if(mode.matches("[01]")&&brightness.matches("\\d{1,3}")) {
                int value=Integer.parseInt(brightness);
                float normalized=value>=219?0.8584f:value<=2?0.0039196345f:(value-1)/254f;
                root("settings put system screen_brightness_mode "+mode+"; cmd display set-brightness "+normalized);
            }
            config.save(Map.of(BrightnessRange.ENABLED,original));
        }
    }
    private static void select(FullBrightnessControl control,int position) {
        Bundle b=new Bundle();b.putInt("position",position);
        require(control.call("brightness_select",b).getBoolean("ok"),"select "+position);
    }
    private static void awaitDriver(int expected) {
        long deadline=SystemClock.uptimeMillis()+6000;String actual="";
        do {
            actual=root("cat /sys/class/backlight/panel0-backlight/brightness");
            if(actual.equals(String.valueOf(expected))) {SystemClock.sleep(650);if(root("cat /sys/class/backlight/panel0-backlight/brightness").equals(actual))return;}
            SystemClock.sleep(100);
        } while(SystemClock.uptimeMillis()<deadline);
        throw new AssertionError("driver expected="+expected+" actual="+actual);
    }
    private static String root(String command) {
        RootShell.Result r=RootShell.run(command,null,5,4096);require(r.isSuccess(),r.output);return r.output.trim();
    }
    private static void require(boolean ok,String reason){if(!ok)throw new AssertionError(reason);}
}
