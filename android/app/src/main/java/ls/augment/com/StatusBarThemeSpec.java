package ls.augment.com;

import java.util.*;

/** Versioned, bounded, platform-independent artwork bindings. Contains no paths or executable content. */
public final class StatusBarThemeSpec {
    public static final String KEY="ls_augment_statusbar_artwork_v1";
    public static final int MAX_BINDINGS=384,MAX_LENGTH=64*1024;
    public static final class Binding {
        public final String id,state,layer,asset,surface;
        public final boolean originalColor,mirror;
        public final int scale,offsetX,offsetY,opacity;
        public Binding(String id,String state,String layer,String asset,boolean originalColor,int scale,int offsetX,int offsetY,int opacity,boolean mirror){
            this(id,state,layer,asset,originalColor,scale,offsetX,offsetY,opacity,mirror,StatusBarSurfaceSpec.ALL);
        }
        public Binding(String id,String state,String layer,String asset,boolean originalColor,int scale,int offsetX,int offsetY,int opacity,boolean mirror,String surface){
            if(!StatusBarIconCatalog.validId(id)||!validState(state)||!Arrays.asList("whole","background","foreground").contains(layer)
                    ||!StatusBarSurfaceSpec.validScope(surface)||asset==null||!asset.matches("[0-9a-f]{64}")||scale<10||scale>400||Math.abs((long)offsetX)>64||Math.abs((long)offsetY)>64||opacity<0||opacity>100)
                throw new IllegalArgumentException("图标素材配置无效");
            this.id=id;this.state=state;this.layer=layer;this.asset=asset;this.surface=surface;this.originalColor=originalColor;this.scale=scale;this.offsetX=offsetX;this.offsetY=offsetY;this.opacity=opacity;this.mirror=mirror;
        }
        private String key(){return surface+","+id+","+state+","+layer;}
        private String encode(boolean scoped){return id+","+state+","+layer+","+asset+","+(originalColor?1:0)+","+scale+","+offsetX+","+offsetY+","+opacity+","+(mirror?1:0)+(scoped?","+surface:"");}
    }
    private final LinkedHashMap<String,Binding> bindings;
    private StatusBarThemeSpec(LinkedHashMap<String,Binding> bindings){this.bindings=bindings;}
    public static StatusBarThemeSpec empty(){return new StatusBarThemeSpec(new LinkedHashMap<>());}
    public List<Binding> entries(){return Collections.unmodifiableList(new ArrayList<>(bindings.values()));}
    public static StatusBarThemeSpec parse(String value){
        if(value==null||value.length()>MAX_LENGTH)return null;
        if(value.isEmpty())return empty();
        String[] rows=value.split(";",-1);if(rows.length<2||rows.length>MAX_BINDINGS+1||!rows[0].equals("1")&&!rows[0].equals("2"))return null;
        boolean scoped=rows[0].equals("2");
        LinkedHashMap<String,Binding> entries=new LinkedHashMap<>();
        try{for(int i=1;i<rows.length;i++){
            String[] p=rows[i].split(",",-1);if(p.length!=(scoped?11:10)||!bit(p[4])||!bit(p[9]))return null;
            Binding b=new Binding(p[0],p[1],p[2],p[3],p[4].equals("1"),Integer.parseInt(p[5]),Integer.parseInt(p[6]),Integer.parseInt(p[7]),Integer.parseInt(p[8]),p[9].equals("1"),scoped?p[10]:StatusBarSurfaceSpec.ALL);
            if(entries.put(b.key(),b)!=null)return null;
        }}catch(IllegalArgumentException error){return null;}
        if(overlapping(entries.values()))return null;
        return new StatusBarThemeSpec(entries);
    }
    public StatusBarThemeSpec with(Binding binding){
        LinkedHashMap<String,Binding> copy=new LinkedHashMap<>(bindings);copy.put(binding.key(),binding);
        if(copy.size()>MAX_BINDINGS||overlapping(copy.values()))throw new IllegalArgumentException("素材状态重复、区间重叠或超过数量限制");
        StatusBarThemeSpec result=new StatusBarThemeSpec(copy);if(result.serialize().length()>MAX_LENGTH)throw new IllegalArgumentException("素材配置过大");return result;
    }
    public StatusBarThemeSpec without(String id){LinkedHashMap<String,Binding> copy=new LinkedHashMap<>(bindings);copy.values().removeIf(b->b.id.equals(id));return new StatusBarThemeSpec(copy);}
    public StatusBarThemeSpec without(String id,String surface){LinkedHashMap<String,Binding> copy=new LinkedHashMap<>(bindings);copy.values().removeIf(b->b.id.equals(id)&&b.surface.equals(surface));return new StatusBarThemeSpec(copy);}
    public StatusBarThemeSpec without(String id,String state,String layer){return without(id,state,layer,StatusBarSurfaceSpec.ALL);}
    public StatusBarThemeSpec without(String id,String state,String layer,String surface){LinkedHashMap<String,Binding> copy=new LinkedHashMap<>(bindings);copy.remove(surface+","+id+","+state+","+layer);return new StatusBarThemeSpec(copy);}
    public Binding exact(String id,String state,String layer,String surface){return bindings.get(surface+","+id+","+state+","+layer);}
    public Binding resolve(String id,String[] states,String layer){
        return resolve(id,states,layer,StatusBarSurfaceSpec.ALL);
    }
    /** A surface override owns this layer. Missing states retain native rendering, not another surface's artwork. */
    public Binding resolve(String id,String[] states,String layer,String surface){
        String scope=StatusBarSurfaceSpec.ALL;
        if(StatusBarSurfaceSpec.valid(surface))for(Binding b:bindings.values())if(b.id.equals(id)&&b.layer.equals(layer)&&b.surface.equals(surface)){scope=surface;break;}
        if(states!=null)for(String state:states){
            Binding exact=bindings.get(scope+","+id+","+state+","+layer);if(exact!=null)return exact;
            if(state!=null&&state.matches("battery[0-9]{1,3}")){
                int level=Integer.parseInt(state.substring(7));
                for(Binding b:bindings.values())if(b.surface.equals(scope)&&b.id.equals(id)&&b.layer.equals(layer)&&range(b.state)!=null){int[] band=range(b.state);if(level>=band[0]&&level<=band[1])return b;}
            }
        }
        return bindings.get(scope+","+id+",default,"+layer);
    }
    public String serialize(){if(bindings.isEmpty())return "";boolean scoped=false;for(Binding b:bindings.values())if(!b.surface.equals(StatusBarSurfaceSpec.ALL)){scoped=true;break;}List<String> keys=new ArrayList<>(bindings.keySet());Collections.sort(keys);StringBuilder out=new StringBuilder(scoped?"2":"1");for(String key:keys)out.append(';').append(bindings.get(key).encode(scoped));return out.toString();}
    public static boolean validState(String state){return state!=null&&state.matches("[A-Za-z0-9_.:-]{1,48}")&&(!state.startsWith("battery")||range(state)!=null||state.matches("battery(?:[0-9]|[1-9][0-9]|100)"));}
    private static boolean bit(String value){return value.equals("0")||value.equals("1");}
    private static int[] range(String state){
        if(state==null||!state.matches("battery[0-9]{1,3}_[0-9]{1,3}"))return null;
        String[] p=state.substring(7).split("_");int lo=Integer.parseInt(p[0]),hi=Integer.parseInt(p[1]);return lo<=hi&&hi<=100?new int[]{lo,hi}:null;
    }
    private static boolean overlapping(Collection<Binding> entries){
        List<Binding> bands=new ArrayList<>();for(Binding b:entries)if(range(b.state)!=null){int[] a=range(b.state);for(Binding other:bands)if(b.surface.equals(other.surface)&&b.id.equals(other.id)&&b.layer.equals(other.layer)){int[] c=range(other.state);if(a[0]<=c[1]&&c[0]<=a[1])return true;}bands.add(b);}return false;
    }
}
