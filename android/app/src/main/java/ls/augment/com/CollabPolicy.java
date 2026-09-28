package ls.augment.com;

import java.util.Locale;

/** ROM identifiers and path decisions, separated from Android for regression tests. */
public final class CollabPolicy {
    private static final String[] FEATURES={"nx809j_w_ip_mc_cn","nx809j_w_saga","nx789s_ip_mc_cn","nx789s_w_ip_mk_cn",
            "nx789s_w_ip_pb_cn","nx789j_ip_mp_cn","nx769j_ip_tf_cn","nx729j_ip_tf_cn"};
    private static final String[] VARIANTS={"IP_MC_W_CN","IP_PB_CN","IP_MC_CN","IP_MK_CN","IP_PB_CN","IP_MP_CN","IP_TF_CN","IP_TF_CN"};
    public static final String CHARGE_DIRECTORY="/system/etc/custom_config/app/systemUI/charge/";
    private CollabPolicy() { }
    public static String themeFeature(int variant){return validVariant(variant)?FEATURES[variant]:null;}
    public static String themeProperty(int variant){return validVariant(variant)?VARIANTS[variant]:null;}
    public static boolean validVariant(int variant){return variant>=0&&variant<FEATURES.length;}
    public static int[] themeVariants(String device,String model){
        String value=device==null?"":device.trim().toUpperCase(Locale.ROOT);
        if(!value.matches("NX[0-9]{3}[JS]"))value=model==null?"":model.trim().toUpperCase(Locale.ROOT);
        switch(value){
            case "NX809J":return new int[]{0,1};
            case "NX789S":return new int[]{2,3,4};
            case "NX789J":return new int[]{2,4,5};
            case "NX769J":return new int[]{6};
            case "NX729J":return new int[]{7};
            default:return new int[0];
        }
    }
    public static int resolveThemeVariant(int selected,String device,String model){
        int[] variants=themeVariants(device,model);
        for(int value:variants)if(value==selected)return selected;
        return variants.length==0?-1:variants[0];
    }
    public static String fingerprintBranch(boolean chun,boolean gold){return gold?"gold":chun?"chun":"native";}
    public static String chargeFilename(int frame,boolean fast,int plug,int style){
        if(frame<0||frame>999||style<0||style>1)return null;
        String stem=style==1?(plug==4?"redmagic_wireless_pb_":"redmagic_pb_"):"redmagic_";
        return String.format(Locale.ROOT,stem+(fast?"fast_charge_0%02d.webp":"charge_0%02d.webp"),frame);
    }
    public static boolean validAudioCategory(String value){return "ringtones".equals(value)||"notifications".equals(value)||"alarms".equals(value);}
    public static boolean validAudioName(String value){return value!=null&&value.length()<=160&&value.matches("[\\p{L}\\p{N}][\\p{L}\\p{N} ._-]*\\.ogg")&&!value.contains("..");}
    public static boolean validAudioVariant(String value){return value!=null&&value.matches("IP_[A-Z0-9_]{1,64}");}
    public static String audioDestinationName(String variant,String name){
        return validAudioVariant(variant)&&validAudioName(name)?"红魔Duo_"+variant+"_"+name:null;
    }
}
