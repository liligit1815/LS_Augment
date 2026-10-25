package ls.augment.com;

import java.util.*;

/** Source-derived inventory; includes structured subfields in the accompanying document. */
public final class ExportStatusBarInventory {
    private static String clean(String value){return value==null?"":value.replace('\t',' ').replace('\n',' ');}
    public static void main(String[] args){
        Set<String> emitted=new LinkedHashSet<>();
        for(EnhancementOption option:EnhancementCatalog.group("statusbar")){
            String range=option.kind==EnhancementOption.Kind.CHOICE?String.join(" / ",option.choices):
                    option.kind==EnhancementOption.Kind.INTEGER||option.kind==EnhancementOption.Kind.DECIMAL?
                            option.minimum+"～"+option.maximum:option.kind==EnhancementOption.Kind.COLOR?"#RRGGBB / #AARRGGBB":option.kind.toString();
            System.out.println("OPTION\t"+option.key+"\t"+option.title+"\t"+option.defaultValue+"\t"+range+"\t"+clean(FeatureHelp.forOption(option)));
            emitted.add(option.key);
        }
        Map<String,String> names=new LinkedHashMap<>();
        try{for(java.lang.reflect.Field field:ConfigSchema.class.getFields())if(field.getType()==String.class){
            Object value=field.get(null);if(value!=null)names.put(value.toString(),field.getName());
        }}catch(ReflectiveOperationException failure){throw new AssertionError(failure);}
        for(String key:ConfigSchema.keys())if((key.startsWith("ls_augment_statusbar_")||key.equals(ConfigSchema.SYSTEMUI_MASTER))&&emitted.add(key))
            System.out.println("CORE\t"+key+"\t"+names.getOrDefault(key,"")+"\t"+ConfigSchema.defaultValue(key)+"\t\t"+clean(FeatureDescriptions.forKey(key,key)));
        for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all())
            System.out.println("ICON\t"+icon.id+"\t"+icon.title+"\t"+icon.group+"\t"+String.join(" / ",icon.states)+"\t"+String.join(" / ",icon.layers));
    }
}
