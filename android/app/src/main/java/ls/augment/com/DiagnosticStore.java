package ls.augment.com;

import android.content.Context;
import android.os.*;
import org.json.*;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

final class DiagnosticStore {
    static final String LIFTARC_FILE="detail-LIFTARC.log";
    static final String SHOULDER_SWITCH_FILE=ShoulderSwitchLogPolicy.FILE;
    static final int DETAIL_MAX_BYTES=512*1024,DETAIL_KEEP_BYTES=256*1024;
    private static final int MAX_DETAIL_BATCHES=256;
    private static final long DETAIL_BATCH_RETENTION_MS=60000;
    // A bounded, process-local retry ledger; it is not a promise of durable delivery.
    private static final LinkedHashMap<String,DetailBatch> detailBatches=new LinkedHashMap<>();
    private static final class DetailBatch {
        final byte[] payloadHash;
        long touched;
        int nextEvent;
        boolean accepted;
        String terminalError="";
        DetailBatch(byte[] hash,long now){payloadHash=hash;touched=now;}
    }
    static synchronized Bundle record(Context context,Bundle extras) {
        Bundle result=new Bundle();if(extras==null||ResetWriteFence.blocked())return result;
        try{
            int pid=Binder.getCallingPid(),uid=Binder.getCallingUid();
            String raw=extras.getString("snapshot","");if(raw.length()>256*1024)return result;
            JSONObject snapshot=new JSONObject(raw);if(snapshot.getInt("pid")!=pid)return result;
            snapshot.put("sourceUid",uid).put("receivedAt",System.currentTimeMillis())
                    .put("receivedBoot",RuntimeEnvironment.bootCount(context));
            android.content.SharedPreferences prefs=context.getSharedPreferences("hook-processes",0);
            android.content.SharedPreferences.Editor editor=prefs.edit();
            if(prefs.getAll().size()>64){String oldest=null;long time=Long.MAX_VALUE;for(java.util.Map.Entry<String,?> e:prefs.getAll().entrySet())try{long at=new JSONObject(e.getValue().toString()).optLong("receivedAt");if(at<time){time=at;oldest=e.getKey();}}catch(Exception ignored){}if(oldest!=null)editor.remove(oldest);}
            editor.putString("pid_"+pid,snapshot.toString()).apply();
            String eventsRaw=extras.getString("events","[]");if(eventsRaw.length()>512*1024)return result;
            JSONArray events=new JSONArray(eventsRaw);AppConfig config=null;
            DetailBatch batch=detailBatch(uid,pid,snapshot.optLong("moduleLoadedElapsed"),extras.getString("eventBatchId",""),eventsRaw);
            if(batch!=null&&!batch.terminalError.isEmpty())return appendUnconfirmed(result,batch.terminalError);
            if(batch!=null&&batch.accepted){result.putBoolean("ok",true);result.putBoolean("duplicateBatch",true);return result;}
            for(int i=batch==null?0:batch.nextEvent;i<Math.min(128,events.length());i++){
                if(batch!=null)batch.nextEvent=i;
                JSONObject event=events.getJSONObject(i);String feature=event.optString("feature");
                if(feature.equals("LIFTARC")||feature.equals(ShoulderSwitchLogPolicy.FEATURE)){
                    String level=event.optString("level");
                    if(!ShoulderSwitchLogPolicy.runtime(feature,level))continue;
                    if(feature.equals(ShoulderSwitchLogPolicy.FEATURE))
                        event=new JSONObject().put("feature",feature).put("level",level)
                                .put("value",ShoulderSwitchLogPolicy.safeSwitch(event.optString("value")));
                    // Necessary runtime state logs are independent of optional traces.
                }else{
                    if(!feature.equals("AI")&&!feature.equals("SHOULDER"))continue;
                    if(config==null)config=new AppConfig(context);
                    if(!config.getBoolean(feature.equals("AI")?ConfigSchema.AI_TRIGGER_DIAGNOSTICS:ConfigSchema.SHOULDER_DIAGNOSTICS))continue;
                }
                event.put("pid",pid).put("uid",uid).put("process",snapshot.optString("process")).put("moduleVersion",snapshot.optString("moduleVersion"));
                String line=event.toString();if(line.length()>4000)continue;
                File file=new File(context.getFilesDir(),"detail-"+feature+".log");
                boolean rotated;
                try {rotated=BoundedLog.append(file,line,DETAIL_MAX_BYTES,DETAIL_KEEP_BYTES);}
                catch(IOException error){
                    // write/close can fail after some bytes reached disk. Replaying this
                    // event could duplicate a line or append to a partial line. Keep a
                    // terminal tombstone so even a lost failure reply cannot replay it.
                    String type=error.getClass().getSimpleName();
                    if(batch!=null)batch.terminalError=type;
                    return appendUnconfirmed(result,type);
                }
                if(batch!=null)batch.nextEvent=i+1;
                if(rotated){android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);stats.edit().putLong(feature+"_rotations",stats.getLong(feature+"_rotations",0)+1).apply();}
            }
            if(batch!=null)batch.accepted=true;
            result.putBoolean("ok",true);
        }catch(Exception error){result.putString("error",error.getClass().getSimpleName());}
        return result;
    }
    private static Bundle appendUnconfirmed(Bundle result,String type){
        result.putBoolean("retryable",false);result.putString("error",type);
        result.putString("detailFailure","APPEND_COMMIT_UNKNOWN");return result;
    }
    private static DetailBatch detailBatch(int uid,int pid,long loaded,String id,String payload)throws Exception {
        if(id.isEmpty())return null; // Earlier module versions have no retry identity.
        if(loaded<=0||id.length()>96||!id.matches("[A-Za-z0-9:-]+"))throw new IllegalArgumentException("invalid_event_batch_id");
        long now=SystemClock.elapsedRealtime();
        Iterator<DetailBatch> stale=detailBatches.values().iterator();
        while(stale.hasNext())if(now-stale.next().touched>=DETAIL_BATCH_RETENTION_MS)stale.remove();
        String key=uid+":"+pid+":"+loaded+":"+id;
        byte[] hash=MessageDigest.getInstance("SHA-256").digest(payload.getBytes(StandardCharsets.UTF_8));
        DetailBatch batch=detailBatches.get(key);
        if(batch!=null){
            if(!Arrays.equals(batch.payloadHash,hash))throw new IllegalArgumentException("event_batch_payload_changed");
            batch.touched=now;return batch;
        }
        if(detailBatches.size()>=MAX_DETAIL_BATCHES)detailBatches.remove(detailBatches.keySet().iterator().next());
        batch=new DetailBatch(hash,now);detailBatches.put(key,batch);return batch;
    }
}
