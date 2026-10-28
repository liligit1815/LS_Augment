package ls.augment.com;

import java.util.*;
import java.util.function.Function;

/** Explicit field ownership. An untouched status bar belongs to the OEM. */
public final class StatusBarEditPolicy {
    public static final String KEY="ls_augment_statusbar_edit_policy_v1";
    private static final Set<String> FIELDS=new HashSet<>(Arrays.asList("zone","order","size","visible","rows"));
    public final boolean full;
    private final Set<String> fields;
    private StatusBarEditPolicy(boolean full,Set<String> fields){this.full=full;this.fields=Collections.unmodifiableSet(new TreeSet<>(fields));}
    public static StatusBarEditPolicy partial(){return new StatusBarEditPolicy(false,Collections.emptySet());}
    public static StatusBarEditPolicy full(){return new StatusBarEditPolicy(true,Collections.emptySet());}
    public static StatusBarEditPolicy parse(String raw){
        if(raw==null||raw.isEmpty())return partial();if(raw.length()>32768)return null;
        String[] tokens=raw.split(";",-1);if(tokens.length<2||tokens.length>514||!tokens[0].equals("SE1")||!Arrays.asList("partial","full").contains(tokens[1]))return null;
        Set<String> fields=new TreeSet<>();for(int i=2;i<tokens.length;i++){String[] pair=tokens[i].split(",",-1);if(pair.length!=2||!StatusBarIconCatalog.validId(pair[0])||!FIELDS.contains(pair[1])||!fields.add(tokens[i]))return null;}
        if(tokens[1].equals("full")&&!fields.isEmpty())return null;return new StatusBarEditPolicy(tokens[1].equals("full"),fields);
    }
    public static StatusBarEditPolicy resolve(Function<String,String> values){
        String saved=values.apply(KEY);if(saved!=null&&!saved.isEmpty()){StatusBarEditPolicy result=parse(saved);return result==null?partial():result;}
        String raw=values.apply(ConfigSchema.STATUSBAR_GRID);
        // The old switch wrote the untouched defaults as if they were a layout.
        // Real legacy layouts and explicit presets continue through the full path.
        if(raw!=null&&!raw.isEmpty()&&!raw.equals(StatusBarGridSpec.defaults().serialize()))return full();
        StatusBarEditPolicy result=partial();StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(values.apply(StatusBarWorkspaceSpec.ICONS));
        if(positions!=null)for(String id:positions.ids()){result=result.with(id,"zone",true).with(id,"order",true);if(positions.get(id).size!=0)result=result.with(id,"size",true);}
        return result;
    }
    public boolean owns(String id,String field){return full||fields.contains(id+","+field);}
    public boolean item(String id){for(String field:FIELDS)if(owns(id,field))return true;return false;}
    public boolean empty(){return !full&&fields.isEmpty();}
    public StatusBarEditPolicy with(String id,String field,boolean enabled){
        if(!StatusBarIconCatalog.validId(id)||!FIELDS.contains(field))throw new IllegalArgumentException("invalid status bar field");
        if(full)return this;Set<String> next=new TreeSet<>(fields);if(enabled)next.add(id+","+field);else next.remove(id+","+field);return new StatusBarEditPolicy(false,next);
    }
    public Set<String> ids(){Set<String> ids=new LinkedHashSet<>();for(String field:fields)ids.add(field.substring(0,field.lastIndexOf(',')));return ids;}
    public String serialize(){StringBuilder out=new StringBuilder(full?"SE1;full":"SE1;partial");for(String field:fields)out.append(';').append(field);return out.toString();}
    public static StatusBarGridSpec nativeGrid(){StatusBarGridSpec grid=StatusBarGridSpec.defaults();for(String id:StatusBarGridSpec.IDS){StatusBarGridSpec.Item i=grid.get(id);if(StatusBarGridSpec.nativeComponent(id))grid=grid.with(id,new StatusBarGridSpec.Item(i.zone,i.order,0,i.visible));}return grid;}
    public StatusBarGridSpec grid(String raw){
        StatusBarGridSpec saved=StatusBarGridSpec.parse(raw);if(saved==null)saved=StatusBarGridSpec.defaults();if(full)return saved;
        StatusBarGridSpec result=nativeGrid();for(String id:StatusBarGridSpec.IDS){StatusBarGridSpec.Item a=result.get(id),b=saved.get(id);result=result.with(id,new StatusBarGridSpec.Item(owns(id,"zone")?b.zone:a.zone,owns(id,"order")?b.order:a.order,owns(id,"size")?b.size:a.size,owns(id,"visible")?b.visible:a.visible));}return result;
    }
    public String effective(String key,String value){
        if(full)return value;
        if(key.equals(StatusBarWorkspaceSpec.ROWS)&&"0".equals(value))return "1";
        if(key.equals(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)&&!owns("notifications","rows"))return "0";
        if(key.equals(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS)&&!owns("system_icons","rows"))return "0";
        if(key.equals(ConfigSchema.STATUSBAR_CLOCK_ROWS)&&!owns("clock","rows"))return "1";
        return value;
    }
}
