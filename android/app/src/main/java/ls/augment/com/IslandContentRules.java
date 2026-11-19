package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.*;

/** Per-field channel > app > scene content rules. This never admits a source or replaces an action. */
public final class IslandContentRules {
    public static final String KEY="ls_augment_rm_island_content_rules";
    public static final List<String> SCENES=List.of("notifications","ongoing","notification_count","downloads");
    public static final int COMPACT=0,TITLE=1,DETAIL=2,LAYOUT=3,COMPACT_ICON=4,PANEL_ICON=5;
    public static final List<String> LAYOUTS=List.of("auto","image_buttons","cover_buttons","primary_action","image_progress","text_progress");
    public static final List<String> ICONS=List.of("auto","notif_small","notif_large","app_icon");
    private static final List<String> EMPTY=List.of("","","","","","");
    private final TreeMap<String,List<String>> values=new TreeMap<>();
    public static String key(int user,String scene,String pkg,String channel){
        if(user<0||user>21474||scene==null||!SCENES.contains(scene)||pkg==null||channel==null)return "";
        if(pkg.isEmpty()){if(!channel.isEmpty())return "";}
        else if(!IslandDownloadConfig.validApp(user,pkg))return "";
        if(channel.length()>1000)return "";
        return user+"|"+scene+"|"+pkg+"|"+encodeText(channel);
    }
    public static String[] parts(String key){
        try{
            String[] p=key.split("\\|",-1);if(p.length!=4)return null;int user=Integer.parseInt(p[0]);
            String channel=decodeText(p[3]);return key.equals(key(user,p[1],p[2],channel))?new String[]{p[0],p[1],p[2],channel}:null;
        }catch(RuntimeException invalid){return null;}
    }
    public static IslandContentRules parse(String raw){
        if(raw==null||raw.length()>32768)return null;IslandContentRules result=new IslandContentRules();if(raw.isEmpty())return result;
        try{
            for(String row:raw.split(",",-1)){
                String[] p=row.split("~",-1);if(p.length<4||p.length>7||parts(p[0])==null)return null;
                List<String> expressions=new ArrayList<>();for(int i=1;i<4;i++){
                    String text=decodeText(p[i]);if(!IslandTextExpression.error(text).isEmpty())return null;expressions.add(text);
                }
                for(int field=LAYOUT;field<=PANEL_ICON;field++){
                    String option=p.length>field+1?p[field+1]:"";if(!validOption(field,option))return null;expressions.add(option);
                }
                if(expressions.stream().allMatch(String::isEmpty)||result.values.put(p[0],List.copyOf(expressions))!=null||result.values.size()>128)return null;
            }return result;
        }catch(RuntimeException invalid){return null;}
    }
    public static String normalize(String raw){IslandContentRules rules=parse(raw);return rules==null?null:rules.encode();}
    public String expression(String key,int field){return field>=0&&field<EMPTY.size()?values.getOrDefault(key,EMPTY).get(field):"";}
    public String resolve(int user,String scene,String pkg,String channel,int field){
        if(key(user,scene,pkg,channel).isEmpty())return "";
        for(String selected:new String[]{key(user,scene,pkg,channel),key(user,scene,pkg,""),key(user,scene,"","")}){
            String value=expression(selected,field);if(!value.isEmpty())return value;
        }return "";
    }
    public String updated(String key,int field,String expression){
        if(parts(key)==null||field<0||field>=EMPTY.size()||expression==null
                ||(field>=LAYOUT?!validOption(field,expression):!IslandTextExpression.error(expression).isEmpty()))return null;
        IslandContentRules copy=new IslandContentRules();copy.values.putAll(values);
        List<String> row=new ArrayList<>(values.getOrDefault(key,EMPTY));row.set(field,expression);
        if(row.stream().allMatch(String::isEmpty))copy.values.remove(key);else copy.values.put(key,List.copyOf(row));
        String raw=copy.encode();return copy.values.size()<=128&&raw.length()<=32768?raw:null;
    }
    public Set<String> keys(){return Collections.unmodifiableSet(values.keySet());}
    public String render(int user,String scene,String pkg,String channel,int field,Map<String,String> vars,String fallback){
        if(field<0||field>DETAIL)return fallback;
        return IslandTextExpression.render(resolve(user,scene,pkg,channel,field),vars,fallback);
    }
    public String layout(int user,String scene,String pkg,String channel){String value=resolve(user,scene,pkg,channel,LAYOUT);return value.isEmpty()?"auto":value;}
    public String icon(int user,String scene,String pkg,String channel,boolean panel){String value=resolve(user,scene,pkg,channel,panel?PANEL_ICON:COMPACT_ICON);return value.isEmpty()?"auto":value;}
    private static boolean validOption(int field,String value){return value!=null&&(value.isEmpty()||(field==LAYOUT?LAYOUTS:ICONS).contains(value));}
    public static Map<String,String> variables(IslandNotificationContent data,String app,String pkg,String channel){
        Map<String,String> vars=new HashMap<>();vars.put("title",data.title);vars.put("text",data.text);vars.put("subtext",data.subtext);
        vars.put("bigtext",data.bigtext);vars.put("info",data.info);vars.put("lines",String.join("\n",data.lines));
        vars.put("app",app);vars.put("package",pkg);vars.put("channel",channel==null?"":channel);return vars;
    }
    private String encode(){
        StringJoiner result=new StringJoiner(",");values.forEach((key,row)->{
            StringBuilder encoded=new StringBuilder(key).append('~').append(encodeText(row.get(0))).append('~').append(encodeText(row.get(1))).append('~').append(encodeText(row.get(2)));
            int last=PANEL_ICON;while(last>=LAYOUT&&row.get(last).isEmpty())last--;
            for(int i=LAYOUT;i<=last;i++)encoded.append('~').append(row.get(i));result.add(encoded.toString());
        });return result.toString();
    }
    private static String encodeText(String text){return Base64.getUrlEncoder().withoutPadding().encodeToString(text.getBytes(StandardCharsets.UTF_8));}
    private static String decodeText(String text){String decoded=new String(Base64.getUrlDecoder().decode(text),StandardCharsets.UTF_8);if(!encodeText(decoded).equals(text))throw new IllegalArgumentException();return decoded;}
}
