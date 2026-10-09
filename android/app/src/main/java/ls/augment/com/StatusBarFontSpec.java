package ls.augment.com;

import java.util.*;

/** An absent role inherits the global choice; an explicit original choice bypasses it. */
public final class StatusBarFontSpec {
    public static final String KEY="ls_augment_statusbar_fonts_v1";
    public static final String[] ROLES={"clock","network","metrics","battery","bluetooth","other"};
    private final LinkedHashMap<String,String> values;
    private StatusBarFontSpec(LinkedHashMap<String,String> values){this.values=values;}
    public static StatusBarFontSpec empty(){return new StatusBarFontSpec(new LinkedHashMap<>());}
    public static StatusBarFontSpec parse(String raw){
        if(raw==null||raw.length()>4096)return null;if(raw.isEmpty())return empty();
        String[] entries=raw.split(";",-1);if(entries.length<2||entries.length>36||!entries[0].equals("1")&&!entries[0].equals("2"))return null;
        LinkedHashMap<String,String> result=new LinkedHashMap<>();
        for(int i=1;i<entries.length;i++){String[] p=entries[i].split("=",-1);if(p.length!=2||!validValue(p[1]))return null;
            String[] key=p[0].split(":",-1);String surface=key.length==1?StatusBarSurfaceSpec.ALL:key[0],role=key.length==1?key[0]:key[1];
            if(key.length>2||entries[0].equals("1")&&key.length!=1||!StatusBarSurfaceSpec.validScope(surface)||!validRole(role)||result.put(key(surface,role),p[1])!=null)return null;}
        return new StatusBarFontSpec(result);
    }
    private static String key(String surface,String role){return surface+":"+role;}
    public String get(String role){return get(role,StatusBarSurfaceSpec.ALL);}
    public String get(String role,String surface){return values.getOrDefault(key(surface,role),"inherit");}
    public String resolve(String role){return resolve(role,StatusBarSurfaceSpec.ALL);}
    public String resolve(String role,String surface){
        String value=get(role,surface);if(value.equals("inherit"))value=get("global",surface);
        if(value.equals("inherit")&&!StatusBarSurfaceSpec.ALL.equals(surface)){value=get(role);if(value.equals("inherit"))value=get("global");}
        return value.equals("inherit")?"":value;
    }
    public StatusBarFontSpec with(String role,String value){
        return with(role,value,StatusBarSurfaceSpec.ALL);
    }
    public StatusBarFontSpec with(String role,String value,String surface){
        if(!StatusBarSurfaceSpec.validScope(surface)||!validRole(role)||!validValue(value))throw new IllegalArgumentException("字体设置无效");
        LinkedHashMap<String,String> copy=new LinkedHashMap<>(values);if(value.equals("inherit"))copy.remove(key(surface,role));else copy.put(key(surface,role),value);return new StatusBarFontSpec(copy);
    }
    public String serialize(){boolean scoped=false;for(String key:values.keySet())if(!key.startsWith(StatusBarSurfaceSpec.ALL+":")){scoped=true;break;}
        StringBuilder out=new StringBuilder(scoped?"2":"1");for(String surface:StatusBarSurfaceSpec.SCOPES)for(String role:new String[]{"global","clock","network","metrics","battery","bluetooth","other"}){
            String value=get(role,surface);if(!value.equals("inherit"))out.append(';').append(scoped?surface+":":"").append(role).append('=').append(value);}
        return out.length()==1?"":out.toString();}
    public Set<String> hashes(){Set<String> hashes=new LinkedHashSet<>();for(String value:values.values())if(value.startsWith("font:"))hashes.add(value.substring(5));return hashes;}
    public static boolean validRole(String role){return "global".equals(role)||Arrays.asList(ROLES).contains(role);}
    public static boolean validValue(String value){return value!=null&&(value.equals("inherit")||value.equals("original")||value.matches("font:[0-9a-f]{64}"));}
}
