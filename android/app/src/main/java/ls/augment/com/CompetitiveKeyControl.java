package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Module-process Root work; no computer helper is involved in configuration or execution. */
final class CompetitiveKeyControl {
    private static final LinkedHashMap<String,Boolean> EVENTS=new LinkedHashMap<>();
    private CompetitiveKeyControl(){}
    static AppConfig.SaveResult setEnabled(Context context,boolean enabled){
        // AppConfig owns the native-setting transaction for every write path, including import.
        return new AppConfig(context).save(Collections.singletonMap(CompetitiveKeyOptions.ENABLED,enabled?"1":"0"));
    }

    /** Called only by the authenticated system-server route in LSConfigProvider. */
    static Bundle executeShell(Context context,Bundle extras){
        Bundle reply=new Bundle();
        if(extras==null||extras.size()!=3||!extras.containsKey("up"))return reply;
        String event=extras.getString("eventId","");long revision=extras.getLong("revision",-1);
        if(!event.matches("[0-9]+:[0-9]+:[01]")||event.length()>100)return reply;
        ConfigSnapshot snapshot=new AppConfig(context).configSnapshot();
        boolean up=extras.getBoolean("up");
        if(!ConfigSchema.truthy(snapshot.get(CompetitiveKeyOptions.ENABLED))||revision!=snapshot.revision
                ||CompetitiveKeyPolicy.action(snapshot::get,up)!=CompetitiveKeyPolicy.SHELL)return reply;
        String command=CompetitiveKeyPolicy.decodeShell(snapshot.get(up?CompetitiveKeyOptions.UP_SHELL:CompetitiveKeyOptions.DOWN_SHELL));
        if(command==null||command.trim().isEmpty()){reply.putString("message","此方向未配置命令");return reply;}
        synchronized(EVENTS){
            if(EVENTS.containsKey(event)){reply.putString("message","重复事件已忽略");return reply;}
            EVENTS.put(event,Boolean.TRUE);
            while(EVENTS.size()>64)EVENTS.remove(EVENTS.keySet().iterator().next());
        }
        // Send exact UTF-8 script on stdin. Quotes, redirects and line breaks are never interpolated.
        RootShell.Result result=RootShell.run("/system/bin/sh",command,15,8192);
        reply.putBoolean("ok",result.isSuccess());
        reply.putString("message",result.isSuccess()?"命令已执行":result.timedOut?"命令执行超时":"命令执行失败（退出码 "+result.exitCode+"）");
        return reply;
    }
}
