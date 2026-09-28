package ls.augment.com;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Tests ROM identity mapping, cross-toggle independence and traversal-resistant audio names. */
public final class TestCollabPolicy {
    private static void require(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    public static void main(String[] args){
        String[] features={"nx809j_w_ip_mc_cn","nx809j_w_saga","nx789s_ip_mc_cn","nx789s_w_ip_mk_cn","nx789s_w_ip_pb_cn","nx789j_ip_mp_cn","nx769j_ip_tf_cn","nx729j_ip_tf_cn"};
        String[] variants={"IP_MC_W_CN","IP_PB_CN","IP_MC_CN","IP_MK_CN","IP_PB_CN","IP_MP_CN","IP_TF_CN","IP_TF_CN"};
        for(int i=0;i<8;i++){require(features[i].equals(CollabPolicy.themeFeature(i)),"theme feature "+i);require(variants[i].equals(CollabPolicy.themeProperty(i)),"theme property "+i);}
        require(CollabPolicy.themeFeature(-1)==null&&CollabPolicy.themeFeature(8)==null,"invalid variant must not silently enable another theme");
        require(java.util.Arrays.equals(CollabPolicy.themeVariants("NX809J","NX809J"),new int[]{0,1}),"809J only its two own themes");
        require(java.util.Arrays.equals(CollabPolicy.themeVariants("nx789s","NX809J"),new int[]{2,3,4}),"device identity takes precedence");
        require(java.util.Arrays.equals(CollabPolicy.themeVariants("unknown","NX789J"),new int[]{2,4,5}),"model fallback excludes S-only theme");
        require(CollabPolicy.resolveThemeVariant(6,"NX809J","NX809J")==0,"stale Bumblebee selection corrected on 809J");
        require(CollabPolicy.resolveThemeVariant(1,"NX809J","NX809J")==1,"valid local selection retained");
        require(CollabPolicy.resolveThemeVariant(0,"NX999J","NX999J")==-1,"unknown models do not select foreign theme");
        require("gold".equals(CollabPolicy.fingerprintBranch(true,true)),"gold wins over chun");
        require("chun".equals(CollabPolicy.fingerprintBranch(true,false)),"chun independent");
        require("native".equals(CollabPolicy.fingerprintBranch(false,false)),"disabled native");
        require("redmagic_charge_000.webp".equals(CollabPolicy.chargeFilename(0,false,1,0)),"zero-indexed native frame");
        require("redmagic_fast_charge_009.webp".equals(CollabPolicy.chargeFilename(9,true,1,0)),"fast frame");
        require("redmagic_wireless_pb_fast_charge_012.webp".equals(CollabPolicy.chargeFilename(12,true,4,1)),"gold wireless");
        require("redmagic_pb_charge_010.webp".equals(CollabPolicy.chargeFilename(10,false,1,1)),"gold wired");
        require(CollabPolicy.chargeFilename(-1,false,1,0)==null&&CollabPolicy.chargeFilename(1000,false,1,0)==null&&CollabPolicy.chargeFilename(0,false,1,9)==null,"invalid frames");
        require(CollabPolicy.validAudioName("千咲 通知音.ogg"),"Unicode ROM audio");
        require(!CollabPolicy.validAudioName("../a.ogg")&&!CollabPolicy.validAudioName("a/b.ogg")&&!CollabPolicy.validAudioName("a\nb.ogg")&&!CollabPolicy.validAudioName("$(id).ogg")&&!CollabPolicy.validAudioName("a\\b.ogg"),"unsafe audio names");
        require(CollabPolicy.audioDestinationName("IP_MC_CN","a.ogg").equals("红魔Duo_IP_MC_CN_a.ogg"),"stable destination");
        require(!CollabPolicy.audioDestinationName("IP_MC_CN","a.ogg").equals(CollabPolicy.audioDestinationName("IP_TF_CN","a.ogg")),"variants cannot overwrite one another");
        require(CollabPolicy.audioDestinationName("../IP_MC_CN","a.ogg")==null,"invalid variant path");
        require(!CollabPolicy.validAudioCategory("music"),"only requested audio categories");
        List<EnhancementOption> options=CollabOptions.options();Set<String> keys=new HashSet<>();int toggles=0;
        for(EnhancementOption option:options){require(keys.add(option.key),"unique keys");if(option.kind==EnhancementOption.Kind.BOOLEAN){toggles++;require("0".equals(option.defaultValue),"default off");}}
        require(toggles==7&&options.size()==9,"independent feature switches and choices");
        require(options.get(1).normalize("8")==null&&options.get(8).normalize("2")==null,"reject unavailable variants");
        System.out.println("Collab policy tests passed");
    }
}
