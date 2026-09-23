package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import java.util.*;
import ls.augment.com.SystemOptions;
import ls.augment.com.OtaBufferPolicy;

/** OEM application adapters verified against the captured NX809J Android 16 components. */
final class OemAppExtrasHook {
    private static final Set<String> INSTALLED=new HashSet<>();
    private OemAppExtrasHook() { }
    static synchronized void install(AugmentModule module,ClassLoader loader,String pkg) {
        if(!INSTALLED.add(pkg))return;
        if("com.android.packageinstaller".equals(pkg))installer(module,loader);
        if("com.zte.zdm".equals(pkg))ota(module,loader);
        if("com.android.systemui".equals(pkg))DefaultAssistantUiHook.install(module,loader);
        if("com.android.systemui".equals(pkg)||"com.android.ztescreenshot".equals(pkg))SystemRulesHook.installCapture(module,loader);
        CaptureVisibilityHook.install(module,loader,pkg);
        ThemeExtrasHook.install(module,loader,pkg);
        DefaultLauncherRoleHook.install(module,loader,pkg);
    }
    private static String key(String suffix){return SystemOptions.key(suffix);}
    private static void installer(AugmentModule m,ClassLoader l) {
        InstallerStartupHook.install(m,l);
        String type="com.android.packageinstaller.PackageInstallerActivity";
        for(String method:new String[]{"bindUi","bindUiPerm","bindUiPermRed"})
            OemHooks.methods(m,l,type,method,void.class,2,key("installer_hide_store"),chain->{
                Object result=chain.proceed();Object owner=chain.getThisObject();
                for(String field:new String[]{"mMarketContainer","mMarketGuide","mMarket","marketReplace"}) {
                    Object view=OemHooks.field(owner,field);if(view instanceof View)((View)view).setVisibility(View.GONE);
                }
                return result;
            });
        OemHooks.methods(m,l,type,"getCookUI",null,6,key("installer_hide_purify"),chain->{
            Object result=chain.proceed();
            for(String field:new String[]{"cleanBgColor","hidePureModeSwitchLayout","hideWarningLayout"})OemHooks.set(result,true,field);
            for(String field:new String[]{"needIsolate","showRiskCheckbox","showSwlimitLearnMore"})OemHooks.set(result,false,field);
            return result;
        });
        OemHooks.methods(m,l,"com.android.packageinstaller.InstallStaging","installScanningInit",void.class,1,key("installer_skip_scan"),chain->{
            Object owner=chain.getThisObject(),uri=chain.getArg(0);
            // StagingAsyncTask has already validated the session and assigned mPackageURI.
            // Use the exact native no-scan continuation, retaining session/result cleanup.
            if(!(uri instanceof Uri)||!uri.equals(OemHooks.field(owner,"mPackageURI")))return chain.proceed();
            try{OemHooks.invoke(owner,"gotoDeleteStagedFile");return null;}
            catch(ReflectiveOperationException|RuntimeException unavailable){return chain.proceed();}
        });
        OemHooks.result(m,l,"com.android.packageinstaller.InstallStart","getCallingPackageNameForUid",String.class,1,key("installer_cts"),"zuji.cts");
    }
    private static void ota(AugmentModule m,ClassLoader l) {
        OtaReadObservationHook.install(m,l);
        OemHooks.methods(m,l,"android.os.UpdateEngine","applyPayload",void.class,4,"",chain->{
            Context context=OemHooks.context(chain.getThisObject(),chain.getArgs());
            Object first=chain.getArg(0);
            if(first instanceof String&&FeatureSettings.enabled(context,key("ota_capture_url")))captureUrl(context,(String)first);
            if(FeatureSettings.enabled(context,key("ota_block")))return null;
            return chain.proceed();
        });
        String dev="com.zte.zdm.mo.DevInfo",ex="com.zte.zdm.mo.DevInfoEX";
        stringReader(m,l,dev,"b","imei");stringReader(m,l,dev,"c","model");
        stringReader(m,l,ex,"c","signature");
        stringReader(m,l,"com.zte.zdm.application.util.g1","b","internal");
        stringReader(m,l,"com.zte.zdm.application.util.g1","e","display");
        stringReader(m,l,"com.zte.zdm.application.util.m1","e","variant");
        bufferReader(m,l,dev,"e","locale");bufferReader(m,l,dev,"f","manufacturer");bufferReader(m,l,ex,"i","fingerprint");
    }
    private static boolean matchingOta(Context c) {
        if(c==null||android.os.Build.VERSION.SDK_INT!=36)return false;
        try {return c.getPackageManager().getPackageInfo("com.zte.zdm",0).getLongVersionCode()==160000
                &&"NX809J".equals(android.os.Build.MODEL)&&"RedMagicOS11.5.7MR1".equals(android.os.Build.DISPLAY);}
        catch(Exception ignored){return false;}
    }
    private static String replacement(Context c,String field) {
        if(!matchingOta(c)||!FeatureSettings.enabled(c,key("ota_spoof_enabled"))||!FeatureSettings.enabled(c,key("ota_"+field+"_enabled")))return "";
        return FeatureSettings.text(c,key("ota_"+field),"");
    }
    private static void stringReader(AugmentModule m,ClassLoader l,String type,String method,String field) {
        OemHooks.methods(m,l,type,method,String.class,0,key("ota_"+field+"_enabled"),chain->{
            String value=replacement(OemHooks.context(chain.getThisObject(),chain.getArgs()),field);
            return value.isEmpty()?chain.proceed():value;
        });
    }
    private static void bufferReader(AugmentModule m,ClassLoader l,String type,String method,String field) {
        OemHooks.methods(m,l,type,method,int.class,2,key("ota_"+field+"_enabled"),chain->{
            String value=replacement(OemHooks.context(chain.getThisObject(),chain.getArgs()),field);
            if(value.isEmpty()||(chain.getArg(1)!=null&&!(chain.getArg(1) instanceof byte[])))return chain.proceed();
            return OtaBufferPolicy.read(value,(byte[])chain.getArg(1));
        });
    }
    private static void captureUrl(Context c,String url) {
        if(c==null||!OtaBufferPolicy.validUrl(url))return;
        try {
            Bundle data=new Bundle();data.putString("url",url);
            c.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"ota_url_set",null,data);
        } catch(RuntimeException ignored) { }
    }
}
