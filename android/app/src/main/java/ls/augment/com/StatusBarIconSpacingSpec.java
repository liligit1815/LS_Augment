package ls.augment.com;

import java.util.*;

/** Extra layout space around a semantic icon, in logical dp; never changes its bitmap. */
public final class StatusBarIconSpacingSpec {
    public static final String KEY="ls_augment_statusbar_icon_spacing_v1";
    public static final int MAX_DP=24;
    public static final class Insets {
        public final int start,top,end,bottom;
        public Insets(int start,int top,int end,int bottom){
            if(start<0||top<0||end<0||bottom<0||start>MAX_DP||top>MAX_DP||end>MAX_DP||bottom>MAX_DP)throw new IllegalArgumentException("每边间距须为 0–24 dp");
            this.start=start;this.top=top;this.end=end;this.bottom=bottom;
        }
        public boolean isZero(){return start==0&&top==0&&end==0&&bottom==0;}
        public int horizontal(){return start+end;}
        public int vertical(){return top+bottom;}
        public int left(boolean rtl){return rtl?end:start;}
        public int right(boolean rtl){return rtl?start:end;}
    }
    public static final Insets ZERO=new Insets(0,0,0,0);
    private final SortedMap<String,Insets> rules;
    private StatusBarIconSpacingSpec(Map<String,Insets> rules){this.rules=Collections.unmodifiableSortedMap(new TreeMap<>(rules));}
    public static StatusBarIconSpacingSpec empty(){return new StatusBarIconSpacingSpec(Collections.emptyMap());}
    public static boolean supported(String id){
        // The dot has a bounded controller adapter; it is never an ordinary margin child.
        if("system_icons".equals(id)||"notifications".equals(id)||"privacy.dot".equals(id))return true;
        StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(id);
        // These are actual ImageViews in NX809J's currently bound Modern layouts.
        // Painted layers, the active-data-SIM alias and unbound alternate layouts
        // must not acquire a second, imaginary layout box.
        return icon!=null&&(!id.contains(".")||independentChild(id))&&!Arrays.asList("mobile_data","dual_signal","system_activity").contains(id);
    }
    public static boolean independentChild(String id){
        if(id==null)return false;
        if(Arrays.asList("privacy.camera","privacy.microphone","privacy.location","privacy.projection","user_avatar").contains(id))return true;
        int dot=id.indexOf('.');if(dot<0)return false;
        String owner=id.substring(0,dot),part=id.substring(dot+1);
        if(owner.equals("wifi")||owner.equals("secondary_wifi"))return part.equals("signal")||part.equals("activity_inout");
        return (owner.equals("mobile1")||owner.equals("mobile2"))&&Arrays.asList("signal","type","activity_inout","roaming","volte").contains(part);
    }
    public static StatusBarIconSpacingSpec parse(String raw){
        if(raw==null||raw.isEmpty())return empty();if(raw.length()>32768)return null;
        String[] lines=raw.split(";",-1);if(!"IS1".equals(lines[0])||lines.length>257)return null;
        Map<String,Insets> rules=new TreeMap<>();
        try{for(int i=1;i<lines.length;i++){String[] v=lines[i].split(",",-1);if(v.length!=6||!StatusBarSurfaceSpec.validScope(v[0])||!supported(v[1]))return null;
            String key=v[0]+","+v[1];if(rules.containsKey(key))return null;
            rules.put(key,new Insets(Integer.parseInt(v[2]),Integer.parseInt(v[3]),Integer.parseInt(v[4]),Integer.parseInt(v[5])));
        }}catch(IllegalArgumentException malformed){return null;}
        return new StatusBarIconSpacingSpec(rules);
    }
    public Insets explicit(String surface,String id){return rules.get(surface+","+id);}
    public Insets resolve(String surface,String id){Insets exact=explicit(surface,id);if(exact!=null)return exact;Insets common=explicit("all",id);if(common!=null)return common;
        if(id!=null&&!id.contains(".")&&!Arrays.asList("clock","battery","notifications","connectivity").contains(id)&&StatusBarIconCatalog.find(id)!=null){
            Insets defaults=explicit(surface,"system_icons");if(defaults==null)defaults=explicit("all","system_icons");if(defaults!=null)return defaults;
        }return ZERO;}
    public StatusBarIconSpacingSpec with(String surface,String id,Insets value){
        if(!StatusBarSurfaceSpec.validScope(surface)||!supported(id))throw new IllegalArgumentException("此对象没有独立图标边界");
        Map<String,Insets> next=new TreeMap<>(rules);String key=surface+","+id;
        if(value==null)next.remove(key);else next.put(key,value);
        if(next.size()>256)throw new IllegalArgumentException("图标规则过多");return new StatusBarIconSpacingSpec(next);
    }
    public boolean isEmpty(){return rules.isEmpty();}
    public Set<String> ids(){Set<String> ids=new LinkedHashSet<>();for(String rule:rules.keySet())ids.add(rule.substring(rule.indexOf(',')+1));return Collections.unmodifiableSet(ids);}
    public String serialize(){if(rules.isEmpty())return "";StringBuilder out=new StringBuilder("IS1");for(Map.Entry<String,Insets> rule:rules.entrySet()){Insets v=rule.getValue();out.append(';').append(rule.getKey()).append(',').append(v.start).append(',').append(v.top).append(',').append(v.end).append(',').append(v.bottom);}return out.toString();}
}
