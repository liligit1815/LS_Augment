package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;

/** Hide identified status content without changing the window/root observed by island engines. */
final class StatusBarContentVisibility {
    private static final String PHONE="com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String LOCK="com.android.systemui.statusbar.phone.KeyguardStatusBarView";
    private static final Map<View,Float> OWNED=new WeakHashMap<>();
    private static final View.OnAttachStateChangeListener DETACH=new View.OnAttachStateChangeListener(){
        public void onViewAttachedToWindow(View view) { }
        public void onViewDetachedFromWindow(View view) { restore(view); }
    };
    static void apply(View view) {
        if(!FeatureSettings.enabled(view.getContext(),SystemUiOptions.PREFIX+"statusbar_hide")){
            restore(view);return;
        }
        boolean candidate=content(view);
        boolean hide=candidate&&phoneContent(view);
        // Even an identified icon container must not hide an embedded OEM island.
        if(hide&&protectedSubtree(view,0)){
            FeatureSettings.diagnostic(view.getContext(),"ls_augment_statusbar_hide_runtime",
                    "native_fallback:protected_island_subtree;target="+name(view));
            hide=false;
        }
        if(!hide){restore(view);return;}
        float current=view.getTransitionAlpha();
        if(!OWNED.containsKey(view)){
            OWNED.put(view,current);view.addOnAttachStateChangeListener(DETACH);
        }else if(current!=0f)OWNED.put(view,current);
        // A separate multiplier preserves OEM alpha, visibility and grid replacement state.
        if(current!=0f)view.setTransitionAlpha(0f);
    }
    static boolean hidden(View view){return OWNED.containsKey(view)&&view.getTransitionAlpha()==0f;}
    private static void restore(View view){
        Float original=OWNED.remove(view);if(original==null)return;
        if(view.getTransitionAlpha()==0f)view.setTransitionAlpha(original);
        view.removeOnAttachStateChangeListener(DETACH);
    }
    private static boolean phoneContent(View view){
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            if(island(at))return false;
            for(Class<?> type=at.getClass();type!=null;type=type.getSuperclass()){
                if(LOCK.equals(type.getName()))return false;
                if(PHONE.equals(type.getName()))return at!=view;
            }
        }
        return false;
    }
    private static boolean protectedSubtree(View view,int depth){
        if(island(view)||depth>18)return true;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++)if(protectedSubtree(group.getChildAt(i),depth+1))return true;
        }
        return false;
    }
    private static boolean island(View view){
        if(name(view).toLowerCase(java.util.Locale.ROOT).contains("island"))return true;
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())
            if(type.getSimpleName().toLowerCase(java.util.Locale.ROOT).contains("island"))return true;
        Object tag=view.getTag();return tag instanceof String&&((String)tag).toLowerCase(java.util.Locale.ROOT).contains("island");
    }
    private static boolean content(View view){
        Object tag=view.getTag();
        if("ls_augment_clock_line".equals(tag)||"ls_augment_network".equals(tag)
                ||"ls_augment_connectivity_circle".equals(tag)
                ||tag instanceof String&&((String)tag).startsWith("ls_augment_metrics_"))return true;
        switch(name(view)){
            case "clock":case "status_bar_clock":case "operator_name":
            case "notification_icon_area":case "notificationIcons":case "notification_icon_container":
            case "centered_icon_area":case "centeredIcon":case "notification_lights_out":
            case "system_icons":case "statusIcons":case "status_icons":case "battery":
            case "speed_group":case "speed_view_group":case "red_magic_function_icon_container":
            case "cooling_fan_view":case "liquid_cooling_view":case "refresh_rate_view":
            case "user_switcher_container":case "ongoing_activity_chip_primary":case "ongoing_activity_chip_secondary":
            case "heads_up_status_bar_view":return true;
            default:break;
        }
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())switch(type.getSimpleName()){
            case "Clock":case "StatusBarIconView":case "StatusIconContainer":case "NotificationIconContainer":
            case "MFVBatteryViewLayout":case "BatteryMeterView":case "StatusBarNetSpeedMFV":
            case "ModernStatusBarWifiView":case "ModernStatusBarMobileView":
            case "StatusBarWifiView":case "StatusBarMobileView":case "ConnectivityIconView":return true;
            default:break;
        }
        return false;
    }
    private static String name(View view){
        if(view.getId()==View.NO_ID||view.getId()==0)return "";
        try{return view.getResources().getResourceEntryName(view.getId());}catch(RuntimeException absent){return "";}
    }
    private StatusBarContentVisibility() { }
}
