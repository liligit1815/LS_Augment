package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Objects;
import java.util.function.Function;

/** Direction, category and command validation shared by the editor and runtime. */
public final class CompetitiveKeyPolicy {
    public static final int NONE=0, APP_OPEN=1, APP_CLOSE=2, SILENT=3, RING=4, POWER_ON=5, POWER_OFF=6, SHELL=7;
    public static final int MAX_SHELL_BYTES=16*1024;
    private CompetitiveKeyPolicy(){}
    public static int[] actions(int category){
        switch(category){case 0:return new int[]{NONE,APP_OPEN,APP_CLOSE};case 1:return new int[]{NONE,SILENT,RING};
            case 2:return new int[]{NONE,POWER_ON,POWER_OFF};case 3:return new int[]{NONE,SHELL};default:return new int[]{NONE};}
    }
    public static String actionName(int action){
        switch(action){case APP_OPEN:return "打开指定app";case APP_CLOSE:return "关闭指定app";case SILENT:return "切换静音";
            case RING:return "切换响铃";case POWER_ON:return "开启省电模式";case POWER_OFF:return "关闭省电模式";case SHELL:return "执行命令";default:return "无动作";}
    }
    public static int defaultAction(int category,boolean up){
        return category==0?(up?APP_OPEN:APP_CLOSE):category==1?(up?SILENT:RING):category==2?(up?POWER_ON:POWER_OFF):SHELL;
    }
    public static int action(Function<String,String> values,boolean up){
        int category=integer(values.apply(CompetitiveKeyOptions.CATEGORY),-1);
        int selected=integer(values.apply(up?CompetitiveKeyOptions.UP_ACTION:CompetitiveKeyOptions.DOWN_ACTION),-1);
        for(int option:actions(category))if(option==selected)return selected;
        return NONE; // Never execute a saved action belonging to a different category.
    }
    public static String normalizePackage(String raw){
        if(raw==null)return null;
        return raw.isEmpty()||raw.length()<=255&&raw.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")?raw:null;
    }
    public static String encodeShell(String command){
        if(command==null||command.indexOf('\0')>=0||command.getBytes(StandardCharsets.UTF_8).length>MAX_SHELL_BYTES)return null;
        return command.isEmpty()?"":Base64.getEncoder().encodeToString(command.getBytes(StandardCharsets.UTF_8));
    }
    public static String normalizeShell(String encoded){
        if(encoded==null||encoded.length()>((MAX_SHELL_BYTES+2)/3)*4)return null;
        try{byte[] bytes=Base64.getDecoder().decode(encoded);
            if(bytes.length>MAX_SHELL_BYTES)return null;
            String text=new String(bytes,StandardCharsets.UTF_8);
            return encoded.equals(encodeShell(text))?encoded:null;
        }catch(IllegalArgumentException invalid){return null;}
    }
    public static String decodeShell(String encoded){
        return normalizeShell(encoded)==null?null:new String(Base64.getDecoder().decode(encoded),StandardCharsets.UTF_8);
    }
    public static int integer(String value,int fallback){try{return Integer.parseInt(value);}catch(RuntimeException invalid){return fallback;}}

    /** Unrelated settings saves do not retire an otherwise unchanged physical-key action. */
    public static boolean sameConfiguration(Function<String,String> first,Function<String,String> second){
        for(String key:new String[]{CompetitiveKeyOptions.ENABLED,CompetitiveKeyOptions.CATEGORY,CompetitiveKeyOptions.UP_ACTION,
                CompetitiveKeyOptions.DOWN_ACTION,CompetitiveKeyOptions.APP_PACKAGE,CompetitiveKeyOptions.UP_SHELL,CompetitiveKeyOptions.DOWN_SHELL})
            if(!Objects.equals(first.apply(key),second.apply(key)))return false;
        return true;
    }

    /** Boot/screen-state replays and duplicate route deliveries cannot rerun a command. */
    public static final class Edges {
        private long lastWhen; private Boolean position;
        public synchronized boolean accept(long whenNanos,boolean up){
            if(whenNanos<=0)return false;
            if(whenNanos<=lastWhen||position!=null&&position==up)return false;
            lastWhen=whenNanos;position=up;return true;
        }
        public synchronized void reset(){lastWhen=0;position=null;}
    }
}
