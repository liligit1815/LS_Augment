package ls.augment.com;

/** Bounded on-phone evidence exchanged through the existing diagnostics provider. */
public final class PrivacyDotSpacingObservation {
    public static final String KEY="ls_augment_privacy_dot_spacing_";
    public static final long MAX_AGE_MS=10*60_000L;
    public final long bootEpoch,at;
    public final int build,display,rotation,densityMilli,fontMilli,rtl,horizontal,vertical;
    public final String status;
    public PrivacyDotSpacingObservation(long bootEpoch,long at,int build,int display,int rotation,int densityMilli,int fontMilli,int rtl,int horizontal,int vertical,String status){
        this.bootEpoch=bootEpoch;this.at=at;this.build=build;this.display=display;this.rotation=rotation;this.densityMilli=densityMilli;this.fontMilli=fontMilli;this.rtl=rtl;this.horizontal=horizontal;this.vertical=vertical;this.status=status;
    }
    public String serialize(){return "PDS1|"+bootEpoch+"|"+at+"|"+build+"|"+display+"|"+rotation+"|"+densityMilli+"|"+fontMilli+"|"+rtl+"|"+horizontal+"|"+vertical+"|"+status;}
    public static PrivacyDotSpacingObservation parse(String raw){
        if(raw==null||raw.length()>400)return null;String[] p=raw.split("\\|",-1);if(p.length!=12||!p[0].equals("PDS1"))return null;
        try{PrivacyDotSpacingObservation o=new PrivacyDotSpacingObservation(Long.parseLong(p[1]),Long.parseLong(p[2]),Integer.parseInt(p[3]),Integer.parseInt(p[4]),Integer.parseInt(p[5]),Integer.parseInt(p[6]),Integer.parseInt(p[7]),Integer.parseInt(p[8]),Integer.parseInt(p[9]),Integer.parseInt(p[10]),p[11]);
            return o.at<0||o.rotation<0||o.rotation>3||o.densityMilli<=0||o.fontMilli<=0||o.rtl<0||o.rtl>1||o.horizontal<0||o.horizontal>48||o.vertical<0||o.vertical>48||!o.status.matches("[a-z_]{1,40}")?null:o;
        }catch(IllegalArgumentException malformed){return null;}
    }
    public boolean current(long now,long epoch,int currentBuild,int currentDisplay,int currentRotation,int currentDensity,int currentFont,int currentRtl){
        return at<=now&&now-at<=MAX_AGE_MS&&Math.abs(epoch-bootEpoch)<5000&&build==currentBuild&&display==currentDisplay&&rotation==currentRotation&&densityMilli==currentDensity&&fontMilli==currentFont&&rtl==currentRtl;
    }
    public boolean available(){return status.equals("native")||status.equals("applied")||status.equals("outside_capacity");}
    public boolean accepts(StatusBarIconSpacingSpec.Insets edge){return available()&&edge.horizontal()<=horizontal&&edge.vertical()<=vertical;}
    public int maximum(int edge,int opposite){return Math.max(0,Math.min(StatusBarIconSpacingSpec.MAX_DP,(edge==0||edge==2?horizontal:vertical)-opposite));}
}
