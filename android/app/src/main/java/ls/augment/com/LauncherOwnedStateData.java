package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Strict wire format for module-owned launcher state, never OEM preferences. */
public final class LauncherOwnedStateData {
    private LauncherOwnedStateData() { }
    public static Map<String,Object> decode(String kind,String text) throws Exception {
        if(text==null||text.length()>16384)throw new IllegalArgumentException("launcher_state_size");
        JSONTokener parser=new JSONTokener(text);Object parsed=parser.nextValue();
        if(!(parsed instanceof JSONObject)||parser.nextClean()!=0)throw new IllegalArgumentException("launcher_state_json");
        JSONObject json=(JSONObject)parsed;Map<String,Object> values=new TreeMap<>();
        for(java.util.Iterator<String> keys=json.keys();keys.hasNext();){String key=keys.next();values.put(key,json.get(key));}
        validate(kind,values);return Collections.unmodifiableMap(new LinkedHashMap<>(values));
    }
    public static String encode(String kind,Map<String,?> values)throws Exception {
        validate(kind,values);JSONObject json=new JSONObject();
        for(Map.Entry<String,?> item:new TreeMap<>(values).entrySet())json.put(item.getKey(),item.getValue());
        String raw=json.toString();if(raw.length()>16384)throw new IllegalArgumentException("launcher_state_size");return raw;
    }
    private static void validate(String kind,Map<String,?> values){
        if("grid".equals(kind)){
            for(Map.Entry<String,?> item:values.entrySet())switch(item.getKey()){
                case "owned", "migration_pending":
                    if(!(item.getValue() instanceof Boolean))throw new IllegalArgumentException("grid_flag");break;
                case "original_rows", "original_columns", "effective_rows", "effective_columns":
                    if(!(item.getValue() instanceof Integer)||((Integer)item.getValue())<1||((Integer)item.getValue())>32)
                        throw new IllegalArgumentException("grid_dimension");break;
                default:throw new IllegalArgumentException("grid_key");
            }
            if(Boolean.TRUE.equals(values.get("owned"))&&!values.keySet().containsAll(Set.of(
                    "original_rows","original_columns","effective_rows","effective_columns","migration_pending")))
                throw new IllegalArgumentException("grid_recovery_incomplete");
        }else if("pages".equals(kind)){
            for(Map.Entry<String,?> item:values.entrySet())switch(item.getKey()){
                case "keep_empty":if(!(item.getValue() instanceof Boolean))throw new IllegalArgumentException("pages_flag");break;
                case "empty_origins":
                    if(!(item.getValue() instanceof String))throw new IllegalArgumentException("pages_origins");
                    LauncherPageOrigins.validate((String)item.getValue());break;
                case "order":
                    if(!(item.getValue() instanceof String))throw new IllegalArgumentException("pages_order");
                    String order=(String)item.getValue();Set<Integer> ids=new java.util.HashSet<>();
                    if(!order.isEmpty())for(String part:order.split(",",-1)){
                        if(!part.matches("[0-9]{1,10}"))throw new IllegalArgumentException("pages_id");
                        int id=Integer.parseInt(part);if(id<0||!ids.add(id)||ids.size()>128)throw new IllegalArgumentException("pages_id");
                    }break;
                default:throw new IllegalArgumentException("pages_key");
            }
        }else throw new IllegalArgumentException("launcher_state_kind");
    }
}
