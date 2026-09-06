package ls.augment.com;

import android.content.Context;
import android.os.*;
import org.json.*;
import java.io.File;

final class DiagnosticStore {
    static synchronized Bundle record(Context context,Bundle extras) {
        Bundle result=new Bundle();if(extras==null)return result;
        try{
            int pid=Binder.getCallingPid(),uid=Binder.getCallingUid();
            String raw=extras.getString("snapshot","");if(raw.length()>256*1024)return result;
            JSONObject snapshot=new JSONObject(raw);if(snapshot.getInt("pid")!=pid)return result;
            snapshot.put("sourceUid",uid).put("receivedAt",System.currentTimeMillis());
            android.content.SharedPreferences prefs=context.getSharedPreferences("hook-processes",0);
            android.content.SharedPreferences.Editor editor=prefs.edit();
            if(prefs.getAll().size()>64){String oldest=null;long time=Long.MAX_VALUE;for(java.util.Map.Entry<String,?> e:prefs.getAll().entrySet())try{long at=new JSONObject(e.getValue().toString()).optLong("receivedAt");if(at<time){time=at;oldest=e.getKey();}}catch(Exception ignored){}if(oldest!=null)editor.remove(oldest);}
            editor.putString("pid_"+pid,snapshot.toString()).apply();
            String eventsRaw=extras.getString("events","[]");if(eventsRaw.length()>512*1024)return result;
            JSONArray events=new JSONArray(eventsRaw);AppConfig config=new AppConfig(context);
            for(int i=0;i<Math.min(128,events.length());i++){
                JSONObject event=events.getJSONObject(i);String feature=event.optString("feature");
                if(!feature.equals("AI")&&!feature.equals("SHOULDER"))continue;
                if(!config.getBoolean(feature.equals("AI")?ConfigSchema.AI_TRIGGER_DIAGNOSTICS:ConfigSchema.SHOULDER_DIAGNOSTICS))continue;
                event.put("pid",pid).put("uid",uid).put("process",snapshot.optString("process")).put("moduleVersion",snapshot.optString("moduleVersion"));
                String line=event.toString();if(line.length()>4000)continue;
                boolean rotated=BoundedLog.append(new File(context.getFilesDir(),"detail-"+feature+".log"),line,512*1024,256*1024);
                if(rotated){android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);stats.edit().putLong(feature+"_rotations",stats.getLong(feature+"_rotations",0)+1).apply();}
            }
            result.putBoolean("ok",true);
        }catch(Exception error){result.putString("error",error.getClass().getSimpleName());}
        return result;
    }
}
