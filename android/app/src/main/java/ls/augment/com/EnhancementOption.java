package ls.augment.com;

import java.util.Locale;
import java.util.function.UnaryOperator;

/** Shared, platform-independent definition for a setting and its validation. */
public final class EnhancementOption {
    public enum Kind { BOOLEAN, INTEGER, DECIMAL, TEXT, CHOICE, COLOR, INTERNAL }
    public final String key, group, title, summary, defaultValue;
    public final Kind kind;
    public final String[] choices;
    public final double minimum, maximum;
    private final UnaryOperator<String> validator;

    private EnhancementOption(String key, String group, String title, String summary,
            Kind kind, String value, double min, double max, String[] choices,
            UnaryOperator<String> validator) {
        this.key=key; this.group=group; this.title=title; this.summary=summary;
        this.kind=kind; this.defaultValue=value; this.minimum=min; this.maximum=max;
        this.choices=choices==null?new String[0]:choices.clone(); this.validator=validator;
        if (normalize(value)==null) throw new IllegalArgumentException("Invalid default: "+key);
    }
    public String normalize(String value) {
        if(value==null) return null;
        try { return validator.apply(value.trim()); } catch(RuntimeException ignored) { return null; }
    }
    public static EnhancementOption toggle(String key,String group,String title,String summary) {
        return new EnhancementOption(key,group,title,summary,Kind.BOOLEAN,"0",0,1,null,
            v->"1".equals(v)||"true".equalsIgnoreCase(v)?"1":
                "0".equals(v)||"false".equalsIgnoreCase(v)?"0":null);
    }
    public static EnhancementOption integer(String key,String group,String title,String summary,int value,int min,int max) {
        return new EnhancementOption(key,group,title,summary,Kind.INTEGER,String.valueOf(value),min,max,null,
            v->{int n=Integer.parseInt(v);return n>=min&&n<=max?String.valueOf(n):null;});
    }
    public static EnhancementOption decimal(String key,String group,String title,String summary,double value,double min,double max) {
        return new EnhancementOption(key,group,title,summary,Kind.DECIMAL,String.valueOf(value),min,max,null,
            v->{double n=Double.parseDouble(v);return Double.isFinite(n)&&n>=min&&n<=max?String.valueOf(n):null;});
    }
    public static EnhancementOption text(String key,String group,String title,String summary,String value,int maxLength) {
        return new EnhancementOption(key,group,title,summary,Kind.TEXT,value,0,maxLength,null,
            v->v.length()<=maxLength&&v.indexOf('\u0000')<0?v:null);
    }
    public static EnhancementOption choice(String key,String group,String title,String summary,int value,String... choices) {
        return new EnhancementOption(key,group,title,summary,Kind.CHOICE,String.valueOf(value),0,choices.length-1,choices,
            v->{int n=Integer.parseInt(v);return n>=0&&n<choices.length?String.valueOf(n):null;});
    }
    public static EnhancementOption color(String key,String group,String title,String summary,String value) {
        return new EnhancementOption(key,group,title,summary,Kind.COLOR,value,0,0,null,
            v->v.matches("#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?")?v.toUpperCase(Locale.ROOT):null);
    }
    public static EnhancementOption custom(String key,String group,String title,String summary,String value,UnaryOperator<String> validator) {
        return new EnhancementOption(key,group,title,summary,Kind.TEXT,value,0,65536,null,validator);
    }
    public static EnhancementOption internal(String key,String value,UnaryOperator<String> validator) {
        return new EnhancementOption(key,"internal","","",Kind.INTERNAL,value,0,65536,null,validator);
    }
}
