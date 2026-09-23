package ls.augment.com;

import java.util.*;

/** Unsaved launcher drafts are keyed by user/package, not by the visible editor. */
final class LauncherEditQueue {
    static final class Draft {
        final int user;final String pkg,name,icon;final long generation;
        Draft(int user,String pkg,String name,String icon,long generation){this.user=user;this.pkg=pkg;this.name=name;this.icon=icon;this.generation=generation;}
        String key(){return user+":"+pkg;}
        LauncherOverrides.Entry entry(){try{return new LauncherOverrides.Entry(user,pkg,name,icon);}catch(IllegalArgumentException invalid){return null;}}
    }
    private final Map<String,Draft> drafts=new LinkedHashMap<>();
    private final Map<String,Long> queued=new HashMap<>();
    private long generation;
    Draft put(int user,String pkg,String name,String icon){
        String key=user+":"+pkg;Draft old=drafts.get(key);
        if(old!=null&&old.name.equals(name)&&old.icon.equals(icon))return old;
        Draft draft=new Draft(user,pkg,name,icon,++generation);drafts.put(key,draft);return draft;
    }
    Draft get(int user,String pkg){return drafts.get(user+":"+pkg);}
    List<Draft> snapshot(){return new ArrayList<>(drafts.values());}
    static String encode(Draft draft){return Base64.getEncoder().encodeToString(draft.name.getBytes(java.nio.charset.StandardCharsets.UTF_8))+"|"+draft.icon;}
    void restore(String key,String value){
        try{int colon=key.indexOf(':');int user=Integer.parseInt(key.substring(0,colon));String pkg=key.substring(colon+1);String[] parts=value.split("\\|",-1);if(parts.length!=2)return;new LauncherOverrides.Entry(user,pkg,"",parts[1]);put(user,pkg,new String(Base64.getDecoder().decode(parts[0]),java.nio.charset.StandardCharsets.UTF_8),parts[1]);}catch(RuntimeException ignored){}
    }
    List<Draft> takePending(){
        List<Draft> result=new ArrayList<>();for(Draft draft:drafts.values())if(draft.entry()!=null&&queued.getOrDefault(draft.key(),-1L)!=draft.generation){queued.put(draft.key(),draft.generation);result.add(draft);}return result;
    }
    void complete(Draft completed,boolean success){
        Draft current=drafts.get(completed.key());
        if(success&&current!=null&&current.generation==completed.generation)drafts.remove(completed.key());
        if(queued.getOrDefault(completed.key(),-1L)==completed.generation)queued.remove(completed.key());
    }
}
