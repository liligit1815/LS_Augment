package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Process;
import java.util.Arrays;
import java.util.UUID;

/** Bounded, module-private paused-recorder recovery. Native notification identity is rechecked by the host. */
final class NativeIslandRecoveryStore {
    static final String METHOD="native_island_record_recovery", PREFS="native-island-record-recovery-v1";
    private static final String SESSION=UUID.randomUUID().toString();
    static Bundle call(Context context,String arg,Bundle input,int uid,String caller,String[] packages){
        Bundle reply=new Bundle();
        if(arg!=null||input==null||input.size()>10||uid/100000!=Process.myUid()/100000
                ||!"com.android.systemui".equals(caller)||packages==null||!Arrays.asList(packages).contains(caller))return reply;
        try{
            if(context.getPackageManager().getApplicationInfo(caller,0).uid!=uid)return reply;
            synchronized(ResetWriteFence.class){
                if(ResetWriteFence.active())return reply;
                SharedPreferences prefs=context.getSharedPreferences(PREFS,0);
                String epoch=SESSION+":"+ResetWriteFence.generation(),op=input.getString("op","");
                if(!"get".equals(op)){
                    if(!epoch.equals(input.getString("epoch","")))return reply;
                    if("clear".equals(op)){
                        if(!prefs.edit().clear().putBoolean("migrated",true).commit())return reply;
                    }else if("put".equals(op)||"import".equals(op)){
                        boolean importing="import".equals(op);
                        if(!importing||!prefs.getBoolean("migrated",false)){
                            SharedPreferences.Editor edit=prefs.edit().clear().putBoolean("migrated",true);
                            if(input.containsKey("status")){
                                int boot=input.getInt("boot",-1);String key=input.getString("key",""),duration=input.getString("duration",""),raw=input.getString("rawCount","");
                                if(input.getInt("status",-1)!=2||boot<=0||boot!=RuntimeEnvironment.bootCount(context)
                                        ||key.isEmpty()||key.length()>1024||input.getLong("posted",0)<=0
                                        ||duration.length()>128||!duration.matches("[0-9]{2,}:[0-5][0-9]:[0-5][0-9]")||raw.length()>128)return reply;
                                edit.putInt("status",2).putInt("boot",boot).putString("key",key).putLong("posted",input.getLong("posted"))
                                        .putString("duration",duration).putString("rawCount",raw);
                            }else if(!importing)return reply;
                            if(!edit.commit())return reply;
                        }
                    }else return reply;
                }
                reply.putBoolean("ok",true);reply.putString("epoch",epoch);reply.putBoolean("migrated",prefs.getBoolean("migrated",false));
                if(prefs.contains("status")&&prefs.getInt("boot",-1)==RuntimeEnvironment.bootCount(context)){
                    reply.putInt("status",2);reply.putInt("boot",prefs.getInt("boot",-1));reply.putLong("posted",prefs.getLong("posted",0));
                    for(String key:new String[]{"key","duration","rawCount"})reply.putString(key,prefs.getString(key,""));
                }
            }
        }catch(Exception unavailable){reply.clear();}
        return reply;
    }
    static boolean clearForReset(Context context){synchronized(ResetWriteFence.class){return context.getSharedPreferences(PREFS,0).edit().clear().putBoolean("migrated",true).commit();}}
}
