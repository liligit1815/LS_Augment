package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.*;

/** User-scoped rules for standard text Toasts. No notification or application data is persisted. */
public final class IslandToastRules {
    public static final String ENABLED=NativeIslandSceneOptions.key("toast");
    public static final String KEY=SystemUiOptions.PREFIX+"island_toast_rules";
    public static final int COPY=1,REPLACE=2,FILTER=3;
    private final TreeMap<String,Rule> entries=new TreeMap<>();
    public static final class Rule {
        public final int mode,seconds;
        public final boolean whitelist,firstExpand,updateExpand;
        public final String include,exclude;
        public Rule(int mode,int seconds,boolean whitelist,boolean first,boolean update,String include,String exclude){
            this.mode=mode;this.seconds=seconds;this.whitelist=whitelist;firstExpand=first;updateExpand=update;
            this.include=keywords(include);this.exclude=keywords(exclude);
        }
        public boolean valid(){return mode>=COPY&&mode<=FILTER&&seconds>=1&&seconds<=20&&include!=null&&exclude!=null;}
        public boolean accepts(String text){
            if(text==null)return false;
            if(include.isEmpty()&&exclude.isEmpty())return true;
            String lower=text.toLowerCase(Locale.ROOT);
            if(matches(lower,exclude))return false;
            return !whitelist||matches(lower,include);
        }
        private static boolean matches(String lower,String words){
            if(words.isEmpty())return false;
            for(String word:words.split("\n"))if(lower.contains(word.toLowerCase(Locale.ROOT)))return true;
            return false;
        }
        public static Rule defaults(){return new Rule(COPY,5,false,false,false,"","");}
        String encode(){return mode+"|"+seconds+"|"+(whitelist?1:0)+"|"+(firstExpand?1:0)+"|"+(updateExpand?1:0)+"|"+b64(include)+"|"+b64(exclude);}
    }
    public static String keywords(String text){
        if(text==null||text.length()>2048)return null;
        LinkedHashSet<String> words=new LinkedHashSet<>();
        for(String line:text.replace("\r\n","\n").split("\n",-1)){
            String word=line.trim();if(word.isEmpty())continue;
            if(word.length()>128||word.chars().anyMatch(Character::isISOControl))return null;
            words.add(word);if(words.size()>32)return null;
        }
        return String.join("\n",words);
    }
    public static IslandToastRules parse(String raw){
        if(raw==null||raw.length()>32768)return null;
        IslandToastRules out=new IslandToastRules();if(raw.isEmpty())return out;
        try{for(String line:raw.split(";",-1)){
            String[] p=line.split("\\|",-1);if(p.length!=9)return null;
            int user=Integer.parseInt(p[0]);if(!IslandDownloadConfig.validApp(user,p[1])||!p[0].equals(String.valueOf(user)))return null;
            if(!bit(p[4])||!bit(p[5])||!bit(p[6]))return null;
            Rule rule=new Rule(Integer.parseInt(p[2]),Integer.parseInt(p[3]),"1".equals(p[4]),"1".equals(p[5]),"1".equals(p[6]),decode(p[7]),decode(p[8]));
            if(!rule.valid()||!line.equals(user+"|"+p[1]+"|"+rule.encode())||out.entries.put(user+"|"+p[1],rule)!=null||out.entries.size()>64)return null;
        }}catch(IllegalArgumentException invalid){return null;}
        return out;
    }
    private static boolean bit(String text){return "0".equals(text)||"1".equals(text);}
    private static String b64(String text){return Base64.getUrlEncoder().withoutPadding().encodeToString(text.getBytes(StandardCharsets.UTF_8));}
    private static String decode(String text){String decoded=new String(Base64.getUrlDecoder().decode(text),StandardCharsets.UTF_8);if(!b64(decoded).equals(text))throw new IllegalArgumentException();return decoded;}
    public static String normalize(String raw){IslandToastRules out=parse(raw);return out==null?null:out.encode();}
    public Rule rule(int user,String pkg){return entries.get(user+"|"+pkg);}
    Set<String> packages(int user){Set<String> result=new TreeSet<>();String start=user+"|";for(String key:entries.keySet())if(key.startsWith(start))result.add(key.substring(start.length()));return result;}
    String updated(int user,String pkg,Rule rule){
        if(!IslandDownloadConfig.validApp(user,pkg)||rule!=null&&!rule.valid())return null;
        IslandToastRules next=new IslandToastRules();next.entries.putAll(entries);
        if(rule==null)next.entries.remove(user+"|"+pkg);else next.entries.put(user+"|"+pkg,rule);
        return normalize(next.encode());
    }
    private String encode(){StringJoiner join=new StringJoiner(";");entries.forEach((key,rule)->join.add(key+"|"+rule.encode()));return join.toString();}
}
