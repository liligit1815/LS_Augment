package ls.augment.com;

import android.content.Context;
import java.io.*;
import java.nio.file.Files;
import org.json.*;

/** A durable history boundary, independent of configuration and recovery state. */
final class LogHistory {
    static final Object LOCK=new Object();
    private static File boundary(Context context) {
        return new File(context.createDeviceProtectedStorageContext().getFilesDir(),"log-history-boundary");
    }
    static long cutoff(Context context) {
        File file=boundary(context);
        if(!file.exists()&&!new File(file.getPath()+".bak").exists())return 0;
        try {
            if(Files.isSymbolicLink(file.toPath())||Files.isSymbolicLink(new File(file.getPath()+".bak").toPath()))return Long.MAX_VALUE;
            byte[] bytes=new android.util.AtomicFile(file).readFully();if(bytes.length!=8)return Long.MAX_VALUE;
            try(DataInputStream input=new DataInputStream(new ByteArrayInputStream(bytes))){return Math.max(0,input.readLong());}
        }catch(IOException error){return Long.MAX_VALUE;}
    }
    static void mark(Context context,long time)throws IOException {
        File file=boundary(context);File parent=file.getParentFile().getCanonicalFile();
        if(Files.isSymbolicLink(file.toPath())||!file.getCanonicalFile().getParentFile().equals(parent))
            throw new IOException("日志清理标记路径异常");
        android.util.AtomicFile atomic=new android.util.AtomicFile(file);
        FileOutputStream output=null;
        try{output=atomic.startWrite();DataOutputStream data=new DataOutputStream(output);data.writeLong(time);data.flush();atomic.finishWrite(output);}
        catch(IOException error){if(output!=null)atomic.failWrite(output);throw error;}
    }
    static boolean old(Context context,long observedAt){long cutoff=cutoff(context);return cutoff>0&&observedAt<=cutoff;}
    /** Live registration remains useful; an old sender must not resurrect cleared counters/stacks. */
    static JSONObject registrationOnly(JSONObject input)throws JSONException {
        JSONObject clean=new JSONObject();
        for(String key:new String[]{"pid","sourceUid","receivedAt","receivedBoot","process","package","packages",
                "moduleVersion","framework","moduleLoadedAt","processStartedElapsed","moduleLoadedElapsed","snapshotAt","moduleLoaded"})
            if(input.has(key))clean.put(key,input.get(key));
        JSONArray hooks=new JSONArray(),old=input.optJSONArray("hooks");
        if(old!=null)for(int i=0;i<old.length();i++){
            JSONObject item=old.getJSONObject(i),hook=new JSONObject();
            for(String key:new String[]{"id","target","registration"})if(item.has(key))hook.put(key,item.get(key));
            hooks.put(hook);
        }
        return clean.put("hooks",hooks).put("historyCleared",true).put("historyMeaning","registration only; awaiting sender history reset");
    }
    static boolean currentValue(Context context,String key) {
        long cutoff=cutoff(context);if(cutoff==0)return true;
        try{return new JSONObject(context.getSharedPreferences(DiagnosticEvidenceStore.STORE,0).getString(key,"{}"))
                .optLong("observedAt")>cutoff;}catch(JSONException error){return false;}
    }
}
