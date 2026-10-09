package ls.augment.com;

import java.util.*;
/** Phone-measured geometry; editor candidates share CircleConnectivityPlan.Measured.solve. */
public final class CircleConnectivitySpacingObservation {
    public static final String KEY="ls_augment_circle_signal_space_";
    public static final int MAX_LENGTH=1900;
    public final StatusBarHeaderSpacingObservation profile;
    public final String surface,environmentKey,reason;
    public final long generation;
    public final CircleConnectivityPlan.Measured measured;
    public final int maxWidth,maxHeight;
    public CircleConnectivitySpacingObservation(StatusBarHeaderSpacingObservation profile,String surface,String environment,String reason,long generation,
            CircleConnectivityPlan.Measured measured,int width,int height){
        if(profile==null||!StatusBarSurfaceSpec.valid(surface)||environment==null||!environment.matches("[a-f0-9]{64}")||!reason(reason)||generation<0
                ||width<0||height<0||width>32768||height>32768)throw new IllegalArgumentException("Invalid circle observation");
        if(measured!=null&&(Math.abs(measured.density-profile.densityMilli/1000f)>.001f||measured.rtl!=(profile.rtl==1)))throw new IllegalArgumentException("Profile/geometry mismatch");
        this.profile=profile;this.surface=surface;environmentKey=environment;this.reason=reason;this.generation=generation;this.measured=measured;maxWidth=width;maxHeight=height;
    }
    public static String key(String surface,int rotation){return KEY+surface+"_"+rotation;}
    public String carrier(){return measured==null?"unknown":measured.wholeCovered?"whole_covered":"circle";}
    public boolean eligible(String id){if(measured==null||measured.wholeCovered||!observed())return false;for(CircleConnectivityPlan.Seed seed:measured.seeds)if(seed.semantic().equals(id))return true;return false;}
    public CircleConnectivityPlan plan(StatusBarIconSpacingSpec spec){if(measured==null||spec==null)return null;
        try{return measured.solve(id->spec.resolve(surface,id),Math.max(1,maxWidth),Math.max(1,maxHeight));}catch(IllegalArgumentException invalid){return null;}}
    public int[] required(StatusBarIconSpacingSpec spec){CircleConnectivityPlan p=plan(spec);return p==null?null:new int[]{(int)Math.ceil(p.width),(int)Math.ceil(p.height)};}
    private boolean observed(){return !Arrays.asList("disabled","native_hidden","awaiting_layout","grid_pending","overflow","slot_unknown","slot_ambiguous","unmeasured_stationary","invalid_stationary").contains(reason);}
    public boolean accepts(StatusBarIconSpacingSpec spec){CircleConnectivityPlan p=plan(spec);return observed()&&p!=null&&(p.accepted||p.wholeCovered)&&maxWidth>0&&maxHeight>0&&p.width<=maxWidth&&p.height<=maxHeight;}
    public static String environment(Map<String,String> values){TreeMap<String,String> copy=new TreeMap<>(values);copy.keySet().removeIf(key->!ConfigSchema.isRuntimeKey(key));
        StatusBarIconSpacingSpec p=StatusBarIconSpacingSpec.parse(copy.get(StatusBarIconSpacingSpec.KEY));if(p!=null){
            for(String surface:new String[]{"all","main","lock","control","notification"})for(String id:new String[]{"wifi.signal","mobile1.signal","mobile2.signal"})p=p.with(surface,id,null);
            copy.put(StatusBarIconSpacingSpec.KEY,p.serialize());}
        return StatusBarWifiAssetSpacingObservation.fingerprint(copy.toString());}
    private static boolean reason(String value){return Arrays.asList("ok","capacity","whole_covered","awaiting_layout","disabled","native_hidden","grid_pending","overflow","slot_unknown","slot_ambiguous",
            "cell_overlap","stationary_overlap","nonlower_ring_overlap","ring_interval_unsupported","ring_material_gap","unmeasured_stationary","invalid_stationary","legacy_zero").contains(value);}
    private static String box(CircleConnectivityPlan.Box b){return b.left+","+b.top+","+b.right+","+b.bottom;}
    private static String measured(CircleConnectivityPlan.Measured m){if(m==null)return "";
        StringBuilder out=new StringBuilder().append(m.diameter).append(',').append(m.density).append(',').append(m.stroke).append(',').append(m.gap).append(',').append(m.rtl?1:0).append(',').append(m.ringArtwork?1:0).append(',').append(m.wholeCovered?1:0).append(',').append(m.ringShown?1:0);
        out.append('|');for(CircleConnectivityPlan.Seed seed:m.seeds){if(out.charAt(out.length()-1)!='|')out.append('/');out.append(seed.region).append(',').append(seed.slot).append(',').append(box(seed.glyph)).append(',').append(box(seed.footprint));}
        out.append('|');if(m.stationary==null)out.append('?');else for(CircleConnectivityPlan.Box b:m.stationary){if(out.charAt(out.length()-1)!='|')out.append('/');out.append(box(b));}
        return out.toString();}
    public String serialize(){String result="CCS1;"+surface+";"+environmentKey+";"+reason+";"+generation+";"+maxWidth+";"+maxHeight+";"+measured(measured)+";"+profile.serialize();
        if(result.length()<=MAX_LENGTH)return result;
        return new CircleConnectivitySpacingObservation(profile,surface,environmentKey,"overflow",generation,null,0,0).serialize();}
    private static float finite(String value){float f=Float.parseFloat(value);if(!Float.isFinite(f)||Math.abs(f)>32768)throw new IllegalArgumentException("Invalid coordinate");return f;}
    private static CircleConnectivityPlan.Box box(String[] p,int at){return new CircleConnectivityPlan.Box(finite(p[at]),finite(p[at+1]),finite(p[at+2]),finite(p[at+3]));}
    public static CircleConnectivitySpacingObservation parse(String raw){if(raw==null||raw.length()>MAX_LENGTH)return null;String[] v=raw.split(";",-1);if(v.length!=9||!v[0].equals("CCS1"))return null;
        try{StatusBarHeaderSpacingObservation profile=StatusBarHeaderSpacingObservation.parse(v[8]);CircleConnectivityPlan.Measured m=null;
            if(!v[7].isEmpty()){String[] chunks=v[7].split("\\|",-1);if(chunks.length!=3)return null;String[] p=chunks[0].split(",",-1);if(p.length!=8||!p[4].matches("[01]")||!p[5].matches("[01]")||!p[6].matches("[01]")||!p[7].matches("[01]"))return null;
                List<CircleConnectivityPlan.Seed> seeds=new ArrayList<>();if(!chunks[1].isEmpty())for(String cell:chunks[1].split("/",-1)){String[] c=cell.split(",",-1);if(c.length!=10)return null;seeds.add(new CircleConnectivityPlan.Seed(Integer.parseInt(c[0]),Integer.parseInt(c[1]),box(c,2),box(c,6)));}
                List<CircleConnectivityPlan.Box> blockers=chunks[2].equals("?")?null:new ArrayList<>();if(blockers!=null&&!chunks[2].isEmpty())for(String b:chunks[2].split("/",-1)){String[] c=b.split(",",-1);if(c.length!=4)return null;blockers.add(box(c,0));}
                m=new CircleConnectivityPlan.Measured(finite(p[0]),finite(p[1]),finite(p[2]),finite(p[3]),p[4].equals("1"),p[5].equals("1"),p[6].equals("1"),p[7].equals("1"),seeds,blockers,"observed");}
            CircleConnectivitySpacingObservation result=new CircleConnectivitySpacingObservation(profile,v[1],v[2],v[3],Long.parseLong(v[4]),m,Integer.parseInt(v[5]),Integer.parseInt(v[6]));
            if((result.reason.equals("ok")||result.reason.equals("legacy_zero")||result.reason.equals("whole_covered"))&&m==null)return null;
            return result;
        }catch(IllegalArgumentException malformed){return null;}}
}
