package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

/** Additional hiding rules. Never forces a system-controlled icon to appear. */
public final class StatusBarVisibilitySpec {
    public static final String KEY = "ls_augment_statusbar_visibility";
    private static final int MAX_RULES = 512;
    private final Set<String> rules;
    private StatusBarVisibilitySpec(Set<String> rules) {
        this.rules = Collections.unmodifiableSet(new TreeSet<>(rules));
    }
    public static StatusBarVisibilitySpec empty() { return new StatusBarVisibilitySpec(Collections.emptySet()); }
    public static StatusBarVisibilitySpec parse(String raw) {
        if (raw == null || raw.isEmpty()) return empty();
        if (raw.length() > 32768) return null;
        String[] parts = raw.split(";", -1);
        if (!"SV1".equals(parts[0]) || parts.length > MAX_RULES + 1) return null;
        Set<String> result = new LinkedHashSet<>();
        for (int i=1; i<parts.length; i++) {
            String[] row=parts[i].split(",",-1);
            if (row.length!=3 || !surface(row[0]) || !StatusBarIconCatalog.validId(row[1])
                    || !"hide".equals(row[2]) || !result.add(row[0]+","+row[1])) return null;
        }
        return new StatusBarVisibilitySpec(result);
    }
    private static boolean surface(String value) {
        return "all".equals(value)||"main".equals(value)||"lock".equals(value)
                ||"notification".equals(value)||"control".equals(value);
    }
    public boolean isEmpty() { return rules.isEmpty(); }
    public boolean explicitlyHidden(String surface,String id) { return rules.contains(surface+","+id); }
    /** A hidden composite owns its children; a child can never reveal a hidden parent. */
    public boolean hidden(String surface,String id) {
        if (!surface(surface)||id==null) return false;
        for (String current=id; !current.isEmpty();) {
            if (explicitlyHidden(surface,current)||explicitlyHidden("all",current)) return true;
            int dot=current.lastIndexOf('.'); if(dot<0) break; current=current.substring(0,dot);
        }
        return false;
    }
    public StatusBarVisibilitySpec with(String surface,String id,boolean hidden) {
        if(!surface(surface)||!StatusBarIconCatalog.validId(id)) throw new IllegalArgumentException("无效的图标位置");
        Set<String> next=new LinkedHashSet<>(rules);
        if(hidden) next.add(surface+","+id); else next.remove(surface+","+id);
        if(next.size()>MAX_RULES)throw new IllegalArgumentException("隐藏规则过多");
        return new StatusBarVisibilitySpec(next);
    }
    public String serialize() {
        if(rules.isEmpty())return "";
        StringBuilder out=new StringBuilder("SV1");
        for(String rule:rules)out.append(';').append(rule).append(",hide");
        return out.toString();
    }
}
