package ls.augment.com;

/** Phone-measured full-canvas budget, tied to the asset definition and display profile. */
public final class StatusBarWifiAssetSpacingObservation {
    public static final String KEY="ls_augment_statusbar_wifi_asset_space_";
    public final StatusBarHeaderSpacingObservation profile;
    public final String assetKey,reason;
    public final int canvasWidth,canvasHeight,maxWidth,maxHeight;
    public final float units;
    public final boolean signalPresent,activityPresent;
    public StatusBarWifiAssetSpacingObservation(StatusBarHeaderSpacingObservation profile,String assetKey,String reason,int w,int h,int mw,int mh,float units,boolean s,boolean a){
        this.profile=profile;this.assetKey=assetKey;this.reason=reason;canvasWidth=w;canvasHeight=h;maxWidth=mw;maxHeight=mh;this.units=units;signalPresent=s;activityPresent=a;
    }
    public static String fingerprint(String definition){
        try{byte[] value=java.security.MessageDigest.getInstance("SHA-256").digest((definition==null?"":definition).getBytes(java.nio.charset.StandardCharsets.UTF_8));StringBuilder out=new StringBuilder();for(byte b:value)out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return out.toString();}catch(java.security.NoSuchAlgorithmException impossible){throw new AssertionError(impossible);}
    }
    public static String key(String surface,int rotation,String id){return KEY+surface+"_"+rotation+"_"+id.substring(0,id.indexOf('.'));}
    public static String environment(java.util.Map<String,String> values,String id){
        java.util.TreeMap<String,String> copy=new java.util.TreeMap<>(values);String owner=id.substring(0,id.indexOf('.'));
        // AppConfig includes APK-only preferences; SystemUI receives runtime keys only.
        copy.keySet().removeIf(key->!ConfigSchema.isRuntimeKey(key));
        StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(copy.get(StatusBarIconSpacingSpec.KEY));
        if(spec!=null){for(String scope:new String[]{"all","main","lock","control","notification"}){spec=spec.with(scope,owner+".signal",null);spec=spec.with(scope,owner+".activity_inout",null);}copy.put(StatusBarIconSpacingSpec.KEY,spec.serialize());}
        return fingerprint(copy.toString());
    }
    public String serialize(){return "WAS1;"+assetKey+";"+reason+";"+canvasWidth+";"+canvasHeight+";"+maxWidth+";"+maxHeight+";"+units+";"+(signalPresent?1:0)+";"+(activityPresent?1:0)+";"+profile.serialize();}
    public static StatusBarWifiAssetSpacingObservation parse(String raw){
        if(raw==null||raw.length()>500)return null;String[] v=raw.split(";",-1);if(v.length!=11||!v[0].equals("WAS1")||!v[1].matches("[a-f0-9]{64}"))return null;
        try{StatusBarHeaderSpacingObservation p=StatusBarHeaderSpacingObservation.parse(v[10]);float u=Float.parseFloat(v[7]);int w=Integer.parseInt(v[3]),h=Integer.parseInt(v[4]),mw=Integer.parseInt(v[5]),mh=Integer.parseInt(v[6]);
            if(p==null||w<=0||h<=0||w>4096||h>4096||mw<0||mh<0||mw>32768||mh>32768||!Float.isFinite(u)||u<=0||u>100||!v[8].matches("[01]")||!v[9].matches("[01]"))return null;
            return new StatusBarWifiAssetSpacingObservation(p,v[1],v[2],w,h,mw,mh,u,v[8].equals("1"),v[9].equals("1"));
        }catch(IllegalArgumentException malformed){return null;}
    }
    public boolean accepts(StatusBarIconSpacingSpec spec,String surface,String id){
        String owner=id.substring(0,id.indexOf('.'));StatusBarWifiAssetSpacingPolicy.Plan p=StatusBarWifiAssetSpacingPolicy.plan(canvasWidth,canvasHeight,spec.resolve(surface,owner+".signal"),spec.resolve(surface,owner+".activity_inout"),units,profile.rtl==1,signalPresent,activityPresent);
        return maxWidth>0&&maxHeight>0&&p.fits(maxWidth,maxHeight);
    }
}
