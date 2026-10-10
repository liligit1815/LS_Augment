package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Bounded sidecar; old string readers remain compatible. Hash binds metadata to its value. */
final class DiagnosticEvidenceStore {
    static final String STORE = "diagnostic-evidence-v1";
    private DiagnosticEvidenceStore() { }
    static void record(Context context, int uid, int pid, String key, String value, Bundle extras) {
        try {
            android.content.SharedPreferences prefs=context.getSharedPreferences(STORE,0);
            if(!prefs.contains(key)&&prefs.getAll().size()>=DiagnosticWritePolicy.MAX_KEYS)return;
            String version=extras==null?"":extras.getString("moduleVersion","");
            String process=extras==null?"":extras.getString("process","");
            if(version.length()>100||process.length()>180)return;
            long observed=extras==null?0:extras.getLong("observedAt",0);
            long elapsed=extras==null?0:extras.getLong("observedElapsed",0);
            JSONObject out=new JSONObject().put("valueDigest",digest(value))
                    .put("moduleVersion",version).put("process",process).put("sourceUid",uid)
                    .put("pid",pid).put("boot",RuntimeEnvironment.bootCount(context))
                    .put("observedAt",observed).put("observedElapsed",elapsed)
                    .put("receivedAt",System.currentTimeMillis()).put("receivedElapsed",SystemClock.elapsedRealtime());
            prefs.edit().putString(key,out.toString()).apply();
        } catch(Exception ignored) { /* Diagnostic metadata cannot change feature behavior. */ }
    }
    static JSONObject describe(Context context,String key,String value,java.util.Map<Integer,String> live) {
        try {
            JSONObject record=new JSONObject(context.getSharedPreferences(STORE,0).getString(key,"{}"));
            int pid=record.optInt("pid",-1);String process=record.optString("process");
            boolean alive=live.containsKey(pid)&&(process.equals(live.get(pid))
                    ||("system".equals(process)&&"system_server".equals(live.get(pid))));
            String status=DiagnosticEvidencePolicy.classify(digest(value).equals(record.optString("valueDigest")),
                    record.optString("moduleVersion"),BuildConfig.VERSION_NAME,record.optInt("boot",-1),
                    RuntimeEnvironment.bootCount(context),pid,alive,record.optLong("observedElapsed"),
                    SystemClock.elapsedRealtime(),record.optLong("receivedElapsed"));
            record.remove("valueDigest");
            return record.put("key",key).put("evidenceStatus",status)
                    .put("meaning","last observation; not proof of execution or recovery");
        } catch(Exception ignored) {return new JSONObject();}
    }
    /** A recent Binder-attributed observation, without claiming a separate PID liveness check. */
    static boolean matchesRecentSource(Context context,String key,String value,String process,int uid,int expectedPid,long maxAge) {
        try {
            JSONObject record=new JSONObject(context.getSharedPreferences(STORE,0).getString(key,"{}"));
            long now=SystemClock.elapsedRealtime(),wall=System.currentTimeMillis();
            long observed=record.optLong("observedElapsed"),received=record.optLong("receivedElapsed"),receivedAt=record.optLong("receivedAt");
            int boot=RuntimeEnvironment.bootCount(context);
            return digest(value).equals(record.optString("valueDigest"))
                    &&BuildConfig.VERSION_NAME.equals(record.optString("moduleVersion"))
                    &&process.equals(record.optString("process"))&&record.optInt("sourceUid",-1)==uid
                    &&expectedPid>0&&record.optInt("pid",-1)==expectedPid&&boot>=0&&record.optInt("boot",-1)==boot
                    &&observed>0&&observed<=received&&received<=now&&now-observed<=maxAge
                    &&receivedAt>0&&receivedAt<=wall&&wall-receivedAt<=maxAge;
        } catch(Exception unavailable) {return false;}
    }
    private static String digest(String value)throws Exception {
        byte[] bytes=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder out=new StringBuilder(64);for(byte b:bytes){out.append(Character.forDigit((b>>>4)&15,16));out.append(Character.forDigit(b&15,16));}
        return out.toString();
    }
}
