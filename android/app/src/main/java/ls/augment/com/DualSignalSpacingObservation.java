package ls.augment.com;

import java.util.*;

/** Completed phone layout inputs. UI and runtime use the same full-cell Plan. */
public final class DualSignalSpacingObservation {
    public static final String KEY="ls_augment_dual_signal_space_";
    public final StatusBarHeaderSpacingObservation profile;
    public final String surface,environmentKey,reason;
    public final long generation;
    public final boolean activityEnabled,wholeConsumes,ios;
    public final int activityRow;
    public final int[] rowSlots;
    public final float[][] badgeAspects;
    public final float referenceHeight,glyphScale,left,top;
    /** Rounded content-union coordinates before the final fixed glyph transform. */
    public final int maxWidth,maxHeight;
    public DualSignalSpacingObservation(StatusBarHeaderSpacingObservation profile,String surface,String environmentKey,
            String reason,long generation,int[] slots,float[][] aspects,int activityRow,boolean activityEnabled,
            boolean wholeConsumes,float referenceHeight,float glyphScale,float left,float top,int maxWidth,int maxHeight){
        this(profile,surface,environmentKey,reason,generation,slots,aspects,activityRow,activityEnabled,wholeConsumes,
                referenceHeight,glyphScale,left,top,maxWidth,maxHeight,false);
    }
    public DualSignalSpacingObservation(StatusBarHeaderSpacingObservation profile,String surface,String environmentKey,
            String reason,long generation,int[] slots,float[][] aspects,int activityRow,boolean activityEnabled,
            boolean wholeConsumes,float referenceHeight,float glyphScale,float left,float top,int maxWidth,int maxHeight,boolean ios){
        this.ios=ios;
        this.profile=profile;this.surface=surface;this.environmentKey=environmentKey;this.reason=reason;this.generation=generation;
        this.rowSlots=slots.clone();this.badgeAspects=new float[aspects.length][];for(int i=0;i<aspects.length;i++)this.badgeAspects[i]=aspects[i].clone();
        this.activityRow=activityRow;this.activityEnabled=activityEnabled;this.wholeConsumes=wholeConsumes;
        this.referenceHeight=referenceHeight;this.glyphScale=glyphScale;this.left=left;this.top=top;this.maxWidth=maxWidth;this.maxHeight=maxHeight;
    }
    public static String key(String surface,int rotation){return KEY+surface+"_"+rotation;}
    public String carrier(){return wholeConsumes?"whole_covered":rowSlots.length==0?"unknown":"virtual_dual";}
    public boolean measured(){return rowSlots.length>0&&referenceHeight>0&&glyphScale>0;}
    public float units(){return profile.densityMilli/1000f/glyphScale;}
    public DualSignalLayout plan(StatusBarIconSpacingSpec spec){
        if(!measured())return null;
        try{return DualSignalLayout.spaced(referenceHeight,activityEnabled,rowSlots,badgeAspects,activityRow,
                (slot,part)->wholeConsumes||reason.equals("disabled")||reason.equals("native_hidden")?StatusBarIconSpacingSpec.ZERO:spec.resolve(surface,"mobile"+(slot+1)+"."+part),units(),profile.rtl==1,ios);}
        catch(IllegalArgumentException malformed){return null;}
    }
    public int[] required(StatusBarIconSpacingSpec spec){
        DualSignalLayout p=plan(spec);return p==null?null:rounded(left,top,p.width,p.height);
    }
    public static int[] rounded(float left,float top,float width,float height){return new int[]{(int)Math.ceil(left+width)-(int)Math.floor(left),(int)Math.ceil(top+height)-(int)Math.floor(top)};}
    public boolean accepts(StatusBarIconSpacingSpec spec){
        if(!reason.equals("ok")&&!reason.equals("capacity")&&!reason.equals("whole_covered"))return false;
        int[] size=required(spec);return size!=null&&maxWidth>0&&maxHeight>0&&size[0]<=maxWidth&&size[1]<=maxHeight;
    }
    public boolean eligible(int slot,String part){
        if(wholeConsumes||reason.equals("disabled")||reason.equals("native_hidden"))return false;
        for(int r=0;r<rowSlots.length;r++)if(rowSlots[r]==slot){
            if(part.equals("signal"))return true;
            if(part.equals("activity_inout"))return activityEnabled&&activityRow==r;
            int b=Arrays.asList("type","roaming","volte").indexOf(part);return b>=0&&badgeAspects[r][b]>0;
        }
        return false;
    }
    public static String environment(Map<String,String> values){
        TreeMap<String,String> copy=new TreeMap<>(values);copy.keySet().removeIf(key->!ConfigSchema.isRuntimeKey(key));
        StatusBarIconSpacingSpec p=StatusBarIconSpacingSpec.parse(copy.get(StatusBarIconSpacingSpec.KEY));
        if(p!=null){for(String scope:new String[]{"all","main","lock","control","notification"})for(int slot=1;slot<=2;slot++)
            for(String part:new String[]{"signal","type","roaming","volte","activity_inout"})p=p.with(scope,"mobile"+slot+"."+part,null);
            copy.put(StatusBarIconSpacingSpec.KEY,p.serialize());}
        return StatusBarWifiAssetSpacingObservation.fingerprint(copy.toString());
    }
    public interface Fits {boolean test(int width,int height);}
    /** The far corner is tested as one complete pack, never independent axis maxima. */
    public static int[] envelope(int zeroWidth,int zeroHeight,int widthLimit,int heightLimit,Fits fits){
        if(zeroWidth<=0||zeroHeight<=0||!fits.test(zeroWidth,zeroHeight))return new int[]{0,0};
        int h=maximum(zeroHeight,Math.max(zeroHeight,heightLimit),v->fits.test(zeroWidth,v));
        int w=maximum(zeroWidth,Math.max(zeroWidth,widthLimit),v->fits.test(v,h));
        return fits.test(w,h)?new int[]{w,h}:new int[]{0,0};
    }
    private interface OneFits {boolean test(int value);}
    private static int maximum(int low,int high,OneFits fits){while(low<high){int mid=low+(high-low+1)/2;if(fits.test(mid))low=mid;else high=mid-1;}return low;}
    public String serialize(){
        StringBuilder rows=new StringBuilder();for(int i=0;i<rowSlots.length;i++){if(i>0)rows.append('/');rows.append(rowSlots[i]);for(float a:badgeAspects[i])rows.append(',').append(a);}
        return "DSS2;"+surface+";"+environmentKey+";"+reason+";"+generation+";"+rows+";"+activityRow+";"+(activityEnabled?1:0)+";"+(wholeConsumes?1:0)+";"+referenceHeight+";"+glyphScale+";"+left+";"+top+";"+maxWidth+";"+maxHeight+";"+(ios?1:0)+";"+profile.serialize();
    }
    public static DualSignalSpacingObservation parse(String raw){
        if(raw==null||raw.length()>1000)return null;String[] v=raw.split(";",-1);
        boolean ios=false;
        if(v.length==17&&v[0].equals("DSS2")){
            if(!v[15].matches("[01]"))return null;
            ios=v[15].equals("1");String[] previous=new String[16];System.arraycopy(v,0,previous,0,15);
            previous[0]="DSS1";previous[15]=v[16];v=previous;
        }
        if(v.length!=16||!v[0].equals("DSS1")||!StatusBarSurfaceSpec.valid(v[1])||!v[2].matches("[a-f0-9]{64}")
                ||!Arrays.asList("ok","capacity","whole_covered","awaiting_layout","slot_unknown","tint_unknown","disabled","native_hidden","grid_pending").contains(v[3]))return null;
        try{
            StatusBarHeaderSpacingObservation profile=StatusBarHeaderSpacingObservation.parse(v[15]);if(profile==null)return null;
            String[] rows=v[5].isEmpty()?new String[0]:v[5].split("/",-1);if(rows.length>2)return null;
            int[] slots=new int[rows.length];float[][] aspects=new float[rows.length][3];
            for(int r=0;r<rows.length;r++){String[] q=rows[r].split(",",-1);if(q.length!=4)return null;slots[r]=Integer.parseInt(q[0]);if(slots[r]<0||slots[r]>1||r>0&&slots[r]==slots[r-1])return null;
                for(int i=0;i<3;i++){aspects[r][i]=Float.parseFloat(q[i+1]);if(!Float.isFinite(aspects[r][i])||aspects[r][i]<0||aspects[r][i]>100)return null;}}
            long generation=Long.parseLong(v[4]);int ar=Integer.parseInt(v[6]),mw=Integer.parseInt(v[13]),mh=Integer.parseInt(v[14]);
            float h=Float.parseFloat(v[9]),s=Float.parseFloat(v[10]),l=Float.parseFloat(v[11]),t=Float.parseFloat(v[12]);
            if(generation<0||ar< -1||ar>=rows.length||!v[7].matches("[01]")||!v[8].matches("[01]")||mw<0||mh<0||mw>32768||mh>32768)return null;
            if(!Float.isFinite(h)||h<0||h>4096||!Float.isFinite(s)||s<=0||s>100||!Float.isFinite(l)||!Float.isFinite(t)||Math.abs(l)>4096||Math.abs(t)>4096)return null;
            float units=profile.densityMilli/1000f/s;if(!Float.isFinite(units)||units<=0)return null;
            DualSignalSpacingObservation result=new DualSignalSpacingObservation(profile,v[1],v[2],v[3],generation,slots,aspects,ar,v[7].equals("1"),v[8].equals("1"),h,s,l,t,mw,mh,ios);
            if((v[3].equals("ok")||v[3].equals("capacity")||v[3].equals("whole_covered"))&&!result.measured())return null;
            return result;
        }catch(IllegalArgumentException malformed){return null;}
    }
}
