package ls.augment.com.hook;

import android.content.Context;
import java.util.*;

/** Reads the ROM's actual icon tables once. No resource-number/name heuristics infer a network state. */
final class StatusBarNativeStateTable {
    private final Map<String,LinkedHashSet<String>> states=new HashMap<>();
    private final Set<String> ambiguous=new HashSet<>();

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi,PrivateApi
    StatusBarNativeStateTable(Context context){
        ClassLoader loader=context.getClassLoader();
        // Exact NX809J ROM resources used by PhoneStatusBarPolicy's shared volume slot.
        // Missing/renamed resources remain unknown; no substring or ringer-mode guess.
        for(String[] mapping:new String[][]{{"statusbar_vibration","vibrate"},{"stat_sys_ringer_vibrate","vibrate"},
                {"statusbar_notifications_off","silent"},{"stat_sys_ringer_silent","silent"}})try{
            int resource=context.getResources().getIdentifier(mapping[0],"drawable","com.android.systemui");
            add(context,"volume",resource,mapping[1]);
        }catch(RuntimeException missing){}

        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.connectivity.WifiIcons",true,loader);
            for(String standard:new String[]{"","4_","5_","6_","7_"})for(String condition:new String[]{"FULL","NO_INTERNET"}){
                try{Object raw=type.getField("WIFI_"+standard+condition+"_ICONS").get(null);
                    if(raw instanceof int[]){int[] icons=(int[])raw;if(icons.length<2||icons.length>6)continue;
                        for(int level=0;level<icons.length;level++)add(context,"wifi",icons[level],"level"+level,
                                condition.equals("NO_INTERNET")?"no_internet":"",standard.isEmpty()?"":"wifi"+standard.charAt(0));}
                }catch(ReflectiveOperationException|RuntimeException ignored){}
            }
            for(String field:new String[]{"WIFI_NO_NETWORK","QS_WIFI_NO_NETWORK","QS_WIFI_DISABLED"})try{
                Object raw=type.getField(field).get(null);if(raw instanceof Integer)add(context,"wifi",(Integer)raw,"disconnected");
            }catch(ReflectiveOperationException|RuntimeException ignored){}
        }catch(ReflectiveOperationException|RuntimeException|LinkageError ignored){}
        try{
            Class<?> type=Class.forName("com.zte.feature.signal.icons.StrengthIcon",true,loader);Object owner=type.getConstructor().newInstance();
            for(String field:new String[]{"strengths","strengthsSingle"}){
                Object raw=type.getField(field).get(owner);if(!(raw instanceof List))continue;List<?> icons=(List<?>)raw;
                if(icons.size()<2||icons.size()>6)continue;
                for(int level=0;level<icons.size();level++)if(icons.get(level) instanceof Integer)add(context,"mobile",(Integer)icons.get(level),"level"+level);
            }
        }catch(ReflectiveOperationException|RuntimeException|LinkageError ignored){}
        try{
            Class<?> type=Class.forName("com.android.settingslib.mobile.TelephonyIcons",true,loader);
            for(String[] mapping:new String[][]{{"ICON_G","2g"},{"ICON_E","2g"},{"ICON_1X","2g"},{"ICON_3G","3g"},
                    {"ICON_H","3g"},{"ICON_H_PLUS","3g"},{"ICON_LTE","4g"},{"ICON_4G","4g"},{"ICON_4G_LTE","4g"},
                    {"ICON_LTE_PLUS","4g_plus"},{"ICON_4G_PLUS","4g_plus"},{"ICON_4G_LTE_PLUS","4g_plus"},
                    {"ICON_5G","5g"},{"ICON_5G_BASIC","5g"},{"ICON_5G_SA","5g"},{"ICON_5G_PLUS","5g_plus"}}){
                try{Object raw=type.getField(mapping[0]).get(null);if(raw instanceof Integer)add(context,"type",(Integer)raw,mapping[1]);}
                catch(ReflectiveOperationException|RuntimeException ignored){}
            }
        }catch(ReflectiveOperationException|RuntimeException|LinkageError ignored){}
    }
    private void add(Context context,String family,int resource,String...values){
        if(resource==0)return;String name;try{name=context.getResources().getResourceEntryName(resource);}catch(RuntimeException missing){return;}
        String key=family+":"+name;if(ambiguous.contains(key))return;
        LinkedHashSet<String> known=states.computeIfAbsent(key,unused->new LinkedHashSet<>());
        for(String value:values){if(value.isEmpty())continue;
            // Reused resource IDs cannot provide a unique semantic state.
            for(String previous:known)if(value.startsWith("level")&&previous.startsWith("level")&&!previous.equals(value)
                    ||(family.equals("type")||family.equals("volume"))&&!previous.equals(value)){states.remove(key);ambiguous.add(key);return;}
            known.add(value);
        }
    }
    String[] resolve(String id,String resource){
        String family=id.equals("volume")?"volume":id.endsWith(".type")?"type":id.startsWith("wifi")||id.startsWith("secondary_wifi")?"wifi":id.matches("mobile[12](\\.signal)?")?"mobile":"";
        Set<String> found=states.get(family+":"+resource);return found==null?new String[0]:found.toArray(new String[0]);
    }
}
