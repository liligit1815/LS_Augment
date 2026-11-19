package ls.augment.com;

import java.util.*;

/** Presentation rules only. Source permissions, privacy and native host capability remain mandatory. */
public final class IslandEnvironmentRules {
    public static final String KEY="ls_augment_rm_island_environment_rules";
    public static final int INHERIT=0,OFF=1,COMPACT=2,EXPAND=3;
    public static final List<String> SCENES=List.of("notifications","ongoing","notification_count","downloads","toast");
    private final TreeMap<String,Integer> values=new TreeMap<>();
    public static final class Environment {
        public final String foreground;public final int foregroundUser;
        public final boolean dnd,fullscreen,landscape;
        public Environment(String foreground,int foregroundUser,boolean dnd,boolean fullscreen,boolean landscape){
            this.foreground=foreground;this.foregroundUser=foregroundUser;this.dnd=dnd;this.fullscreen=fullscreen;this.landscape=landscape;
        }
    }
    public static String key(char kind,int user,String scene,String pkg,String channel){
        if(user<0||user>21474||scene==null||pkg==null||channel==null)return "";
        if(kind=='A'||kind=='C'){
            if(!SCENES.contains(scene)||"notifications".equals(scene)||!IslandDownloadConfig.validApp(user,pkg))return "";
            if(kind=='A'&&!channel.isEmpty()||kind=='C'&&("toast".equals(scene)||channel.isEmpty()))return "";
        }else if(kind=='F'||kind=='X'){
            if(!scene.equals("*")||!channel.isEmpty()||!IslandDownloadConfig.validApp(user,pkg))return "";
        }else if(kind=='S'){
            if(!SCENES.contains(scene)||!pkg.isEmpty()||!channel.isEmpty())return "";
        }else if(kind=='D'||kind=='U'||kind=='L'){
            if(!scene.equals("*")||!pkg.isEmpty()||!channel.isEmpty())return "";
        }else return "";
        String encoded="";
        if(!channel.isEmpty()){
            String checked=IslandNoticeRules.channel(user,pkg,channel);if(checked.isEmpty())return "";
            encoded=checked.substring(checked.lastIndexOf('|')+1);
        }
        return kind+"|"+user+"|"+scene+"|"+pkg+"|"+encoded;
    }
    private static boolean valid(String key){
        String[] p=key.split("\\|",-1);if(p.length!=5||p[0].length()!=1)return false;
        try{
            int user=Integer.parseInt(p[1]);String channel="";
            if(!p[4].isEmpty()){String[] c=IslandNoticeRules.parts(p[1]+"|"+p[3]+"|"+p[4]);if(c==null)return false;channel=c[2];}
            return key.equals(key(p[0].charAt(0),user,p[2],p[3],channel));
        }catch(NumberFormatException invalid){return false;}
    }
    public static IslandEnvironmentRules parse(String raw){
        if(raw==null||raw.length()>32768)return null;IslandEnvironmentRules result=new IslandEnvironmentRules();
        if(raw.isEmpty())return result;
        for(String row:raw.split(",",-1)){
            if(row.length()<2)return null;int mode=row.charAt(0)-'0';String key=row.substring(1);
            if(mode<OFF||mode>EXPAND||!valid(key)||key.charAt(0)=='X'&&mode!=OFF
                    ||result.values.put(key,mode)!=null||result.values.size()>256)return null;
        }return result;
    }
    public static String normalize(String raw){IslandEnvironmentRules rules=parse(raw);return rules==null?null:rules.encode();}
    public int mode(String key){return values.getOrDefault(key,INHERIT);}
    public String updated(String key,int mode){
        if(!valid(key)||mode<INHERIT||mode>EXPAND||key.charAt(0)=='X'&&mode>OFF)return null;
        IslandEnvironmentRules copy=new IslandEnvironmentRules();copy.values.putAll(values);
        if(mode==INHERIT)copy.values.remove(key);else copy.values.put(key,mode);
        String raw=copy.encode();return raw.length()<=32768&&copy.values.size()<=256?raw:null;
    }
    public int resolve(int user,String scene,String pkg,String channel,int sourceMode,Environment environment){
        if(!SCENES.contains(scene)||!IslandDownloadConfig.validApp(user,pkg)||environment==null)return INHERIT;
        int result=mode(key('C',user,scene,pkg,channel));
        if(result==INHERIT)result=mode(key('A',user,scene,pkg,""));
        // Ordinary notification source rules remain in their existing, separately scoped configuration.
        if(result==INHERIT)result=sourceMode;
        if(result!=INHERIT)return result;
        if(mode(key('X',user,"*",pkg,""))==INHERIT&&environment.foregroundUser==user){
            result=mode(key('F',user,"*",environment.foreground==null?"":environment.foreground,""));
            if(result!=INHERIT)return result;
        }
        for(char kind:new char[]{'D','U','L'}){
            boolean applies=kind=='D'?environment.dnd:kind=='U'?environment.fullscreen:environment.landscape;
            if(applies&&(result=mode(key(kind,user,"*","","")))!=INHERIT)return result;
        }
        return mode(key('S',user,scene,"",""));
    }
    public Set<String> packages(char kind,int user){
        Set<String> result=new TreeSet<>();for(String key:values.keySet()){String[] p=key.split("\\|",-1);
            if(p[0].equals(String.valueOf(kind))&&p[1].equals(String.valueOf(user)))result.add(p[3]);}return result;
    }
    public String sourceRules(String scene){
        StringJoiner result=new StringJoiner(",");values.forEach((key,mode)->{String[] p=key.split("\\|",-1);
            if((p[0].equals("A")||p[0].equals("C"))&&p[2].equals(scene))result.add(mode+p[1]+"|"+p[3]+"|"+p[4]);});return result.toString();
    }
    public String withSources(String scene,String raw){
        if(!SCENES.contains(scene)||"notifications".equals(scene))return null;
        IslandNoticeRules sources=IslandNoticeRules.parse(raw);if(sources==null)return null;
        IslandEnvironmentRules copy=new IslandEnvironmentRules();copy.values.putAll(values);
        copy.values.keySet().removeIf(key->{String[] p=key.split("\\|",-1);return (p[0].equals("A")||p[0].equals("C"))&&p[2].equals(scene);});
        for(String source:sources.keys()){
            String[] p=source.split("\\|",-1);int user=Integer.parseInt(p[0]);String channel="";
            if(!p[2].isEmpty())channel=IslandNoticeRules.parts(source)[2];
            String key=key(channel.isEmpty()?'A':'C',user,scene,p[1],channel);if(key.isEmpty())return null;copy.values.put(key,sources.mode(source));
        }return normalize(copy.encode());
    }
    private String encode(){StringJoiner result=new StringJoiner(",");values.forEach((key,mode)->result.add(mode+key));return result.toString();}
}
