package ls.augment.com;

import java.util.*;

/** Ranks system hints only. Eligibility must be supplied by the original system pipeline. */
public final class StatusBarIconOrderPolicy {
    public static final String ENABLED="ls_augment_statusbar_hint_priority";
    public static final String LIMIT="ls_augment_statusbar_hint_limit";
    public static final String ORDER="ls_augment_statusbar_hint_order";
    public static final String DEFAULT_ORDER="privacy.camera,privacy.microphone,privacy.projection,privacy.location,vpn,screen_record,cast,connected_display,location,sensors_off,zen,mute,volume,alarm_clock,bluetooth,headset,nfc,hotspot,airplane,data_saver,managed_profile,rotate,tty,cooling_fan,liquid_cooling,refresh_rate";
    public static final List<String> IDS=Collections.unmodifiableList(Arrays.asList(DEFAULT_ORDER.split(",")));
    private StatusBarIconOrderPolicy(){}
    public static boolean hint(String id){return IDS.contains(id);}
    public static String normalize(String raw){
        if(raw==null||raw.length()>2048)return null;if(raw.trim().isEmpty())return "";
        Set<String> found=new LinkedHashSet<>();for(String id:raw.split(",",-1)){id=id.trim();if(!hint(id)||!found.add(id))return null;}return String.join(",",found);
    }
    public static List<String> order(String raw){String clean=normalize(raw);LinkedHashSet<String> result=new LinkedHashSet<>();if(clean!=null&&!clean.isEmpty())result.addAll(Arrays.asList(clean.split(",")));result.addAll(IDS);return new ArrayList<>(result);}
    /** Stable tie-breaks retain original system order for duplicate slots and unranked objects. */
    public static <T> List<T> prioritize(List<T> original,java.util.function.Function<T,String> id,String configured){
        List<String> order=order(configured);List<T> hints=new ArrayList<>();for(T item:original)if(hint(id.apply(item)))hints.add(item);
        hints.sort(Comparator.comparingInt(item->order.indexOf(id.apply(item))));return hints;
    }
    public static <T> Set<T> retain(List<T> eligible,java.util.function.Function<T,String> id,String configured,int limit){
        if(limit<0)throw new IllegalArgumentException("negative icon limit");
        List<T> ranked=prioritize(eligible,id,configured);Set<T> retained=new LinkedHashSet<>();
        for(T item:eligible)if(!hint(id.apply(item)))retained.add(item);
        for(int i=0;i<ranked.size()&&(limit==0||i<Math.max(0,limit));i++)retained.add(ranked.get(i));return retained;
    }
    /** The caller reserves core connectivity first and supplies only OEM-eligible views. */
    public static <T> Set<T> fitHints(List<T> eligible,java.util.function.Function<T,String> id,java.util.function.ToDoubleFunction<T> width,String configured,int capacity,double room){
        if(capacity<0||Double.isNaN(room)||room<0)throw new IllegalArgumentException("invalid capacity");
        Set<T> result=new LinkedHashSet<>();
        for(T item:prioritize(eligible,id,configured)){double needed=width.applyAsDouble(item);if(!Double.isFinite(needed)||needed<0)continue;
            if(result.size()<capacity&&needed<=room){result.add(item);room-=needed;}
        }return result;
    }
}
