package ls.augment.com;
import java.util.*;
import java.lang.reflect.*;
import java.nio.file.*;

/** Read-only export of the Android UI catalogue; no Android runtime/device access. */
public final class ExportCurrent {
  static Map<String,Object> obj(Object... v) { Map<String,Object> m=new LinkedHashMap<>(); for(int i=0;i<v.length;i+=2)m.put((String)v[i],v[i+1]);return m; }
  static Object option(EnhancementOption o) {return obj("key",o.key,"group",o.group,"title",o.title,"summary",o.summary,"help",FeatureHelp.forOption(o),"kind",o.kind.name(),"defaultValue",o.defaultValue,"minimum",o.minimum,"maximum",o.maximum,"choices",o.choices,"targetId",HookAppCatalog.targetForKey(o.key),"affectedPackages",HookAppCatalog.affectedPackages(o.key));}
  static Object feature(NativeFeatureGroups.Feature f) {return obj("id",f.id,"title",f.title,"toggleKey",f.toggleKey,"parameterKeys",f.parameterKeys,"features",Arrays.stream(f.children).map(ExportCurrent::feature).toList(),"activation",obj("noOpValue",f.noOpValue,"comparison",f.comparison),"hasConfiguration",f.hasConfiguration(),"objectGroup",NativeFeatureGroups.objectGroup(f),"destination",f.id.startsWith("systemui:")?NativeFeatureGroups.statusBarDestination(f):"");}
  static String json(Object o) throws Exception {
    if(o==null)return "null";
    if(o instanceof String s){StringBuilder b=new StringBuilder("\"");for(char c:s.toCharArray()){switch(c){case '"':b.append("\\\"");break;case '\\':b.append("\\\\");break;case '\n':b.append("\\n");break;case '\r':b.append("\\r");break;case '\t':b.append("\\t");break;default:if(c<32)b.append(String.format("\\u%04x",(int)c));else b.append(c);}}return b.append('"').toString();}
    if(o instanceof Number||o instanceof Boolean)return o.toString();
    if(o.getClass().isArray()){List<Object> a=new ArrayList<>();for(int i=0;i<Array.getLength(o);i++)a.add(Array.get(o,i));return json(a);}
    if(o instanceof Collection<?> a){List<String> s=new ArrayList<>();for(Object x:a)s.add(json(x));return "["+String.join(",",s)+"]";}
    Map<?,?> m;if(o instanceof Map<?,?> map)m=map;else {Map<String,Object> r=new LinkedHashMap<>();for(Field f:o.getClass().getFields())if(!Modifier.isStatic(f.getModifiers()))r.put(f.getName(),f.get(o));m=r;}
    List<String>s=new ArrayList<>();for(var e:m.entrySet())s.add(json(e.getKey())+":"+json(e.getValue()));return "{"+String.join(",",s)+"}";
  }
  public static void main(String[] args)throws Exception{
    List<Object> targets=new ArrayList<>(),groups=new ArrayList<>();
    for(var t:HookAppCatalog.targets()){
      List<Object> secs=new ArrayList<>();for(var s:HookAppCatalog.sections(t.id))secs.add(obj("id",s.id,"title",s.title,"options",s.options.stream().map(ExportCurrent::option).toList()));
      targets.add(obj("id",t.id,"title",t.title,"summary",t.summary,"packageName",t.packageName,"packages",t.packages,"restartScope",t.restartScope,"entries",HookAppCatalog.entries(t.id),"sections",secs));
      List<Object> ss=new ArrayList<>();for(var s:NativeFeatureGroups.forTarget(t.id))ss.add(obj("id",s.id,"title",s.title,"features",s.features.stream().map(ExportCurrent::feature).toList()));
      groups.add(obj("id",t.id,"sections",ss));
    }
    Map<String,Object> defs=new LinkedHashMap<>();for(Field f:ConfigSchema.class.getFields())if(f.getType()==String.class){String key=(String)f.get(null);if(ConfigSchema.contains(key))defs.put(f.getName(),obj("key",key,"default",ConfigSchema.defaultValue(key)));}
    List<Object> presets=new ArrayList<>();for(int i=0;i<StatusBarPresets.NAMES.length;i++)presets.add(obj("name",StatusBarPresets.NAMES[i],"description",StatusBarPresets.DESCRIPTIONS[i],"values",StatusBarPresets.values(i)));
    Files.writeString(Path.of(args[0]),json(obj("version","test20378","targets",targets,"options",EnhancementCatalog.options().stream().filter(o->o.kind!=EnhancementOption.Kind.INTERNAL).map(ExportCurrent::option).toList(),"groups",groups,"defaults",defs,"allDefaults",ConfigSchema.defaults(),"presets",presets)));
    System.out.println("Exported "+targets.size()+" targets, "+EnhancementCatalog.options().size()+" definitions");
  }
}
