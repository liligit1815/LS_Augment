package ls.augment.com;

/** Current on-phone header capacity; never inferred from a different display profile. */
public final class StatusBarHeaderSpacingObservation {
    public static final String KEY="ls_augment_statusbar_header_spacing_capacity_";
    public static final long MAX_AGE_MS=10*60_000L;
    public final long bootEpoch,at;
    public final int build,display,rotation,densityMilli,fontMilli,rtl,vertical;
    public StatusBarHeaderSpacingObservation(long bootEpoch,long at,int build,int display,int rotation,int densityMilli,int fontMilli,int rtl,int vertical){
        this.bootEpoch=bootEpoch;this.at=at;this.build=build;this.display=display;this.rotation=rotation;this.densityMilli=densityMilli;this.fontMilli=fontMilli;this.rtl=rtl;this.vertical=vertical;
    }
    public static boolean child(String id){return id!=null&&(id.startsWith("wifi.")||id.startsWith("secondary_wifi.")||id.startsWith("mobile1.")||id.startsWith("mobile2."))&&StatusBarIconSpacingSpec.independentChild(id);}
    public String serialize(){return "HSC1|"+bootEpoch+"|"+at+"|"+build+"|"+display+"|"+rotation+"|"+densityMilli+"|"+fontMilli+"|"+rtl+"|"+vertical;}
    public static StatusBarHeaderSpacingObservation parse(String raw){
        if(raw==null||raw.length()>250)return null;String[] v=raw.split("\\|",-1);if(v.length!=10||!v[0].equals("HSC1"))return null;
        try{StatusBarHeaderSpacingObservation result=new StatusBarHeaderSpacingObservation(Long.parseLong(v[1]),Long.parseLong(v[2]),Integer.parseInt(v[3]),Integer.parseInt(v[4]),Integer.parseInt(v[5]),Integer.parseInt(v[6]),Integer.parseInt(v[7]),Integer.parseInt(v[8]),Integer.parseInt(v[9]));
            return result.at<0||result.rotation<0||result.rotation>3||result.densityMilli<=0||result.fontMilli<=0||result.rtl<0||result.rtl>1||result.vertical<0||result.vertical>48?null:result;
        }catch(IllegalArgumentException malformed){return null;}
    }
    public boolean current(long now,long epoch,int currentBuild,int currentDisplay,int currentRotation,int currentDensity,int currentFont,int currentRtl){
        return at<=now&&now-at<=MAX_AGE_MS&&Math.abs(epoch-bootEpoch)<5000&&build==currentBuild&&display==currentDisplay&&rotation==currentRotation&&densityMilli==currentDensity&&fontMilli==currentFont&&rtl==currentRtl;
    }
    public boolean accepts(StatusBarIconSpacingSpec.Insets edge){return edge.vertical()<=vertical;}
    public int maximum(int opposite){return Math.max(0,Math.min(StatusBarIconSpacingSpec.MAX_DP,vertical-opposite));}
}
