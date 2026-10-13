package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Looper;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import ls.augment.com.ConfigSchema;
import ls.augment.com.StepPlan;

/** Authenticated client for the module-private ledger; never creates host files. */
final class StepLedger {
    private static final ReentrantLock WRITER=new ReentrantLock(true);
    private static final Binder CLIENT=new Binder();
    private static String session,pendingRelease;
    private final Context context;
    private final Transaction transaction=new Transaction();
    StepLedger(Context context){this.context=context.getApplicationContext();}
    Guard guard()throws IOException{return new Guard();}
    final class Guard implements AutoCloseable {
        private boolean closed;
        Guard()throws IOException{
            if(Looper.myLooper()==Looper.getMainLooper())throw new IOException("健康保存回调位于主线程，本次保留原生保存");
            try{if(!WRITER.tryLock(5,TimeUnit.SECONDS))throw new IOException("健康账本正在处理其他记录");}
            catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new IOException(interrupted);}
            try{
                if(WRITER.getHoldCount()>1)return;
                if(pendingRelease!=null){session=pendingRelease;request("release",new Bundle());pendingRelease=null;}
                session=UUID.randomUUID().toString();
                Bundle args=new Bundle();args.putString("account",FeatureSettings.text(context,ConfigSchema.HEALTH_ACCOUNT,""));args.putBinder("client",CLIENT);
                boolean legacy=context.getDatabasePath("ls_augment_steps_v1.db").exists()
                        ||context.getDatabasePath("ls_augment_steps_v1.db-wal").exists()
                        ||context.getDatabasePath("ls_augment_steps_v1.db-shm").exists()
                        ||context.getDatabasePath("ls_augment_steps_v1.db-journal").exists()
                        ||new java.io.File(context.getFilesDir(),"ls_augment_steps.lock").exists();
                args.putBoolean("legacy",legacy);
                long until=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
                for(;;){
                    Bundle response=invoke("acquire",args);
                    if(response!=null&&response.getBoolean("ok",false))break;
                    if(response==null||!"busy".equals(response.getString("state"))||System.nanoTime()>=until)
                        throw new IOException("模块健康私有账本不可用，等待迁移或重试");
                    Thread.sleep(25);
                }
            }catch(Exception failure){
                if(failure instanceof InterruptedException)Thread.currentThread().interrupt();
                if(WRITER.getHoldCount()==1&&session!=null){try{request("release",new Bundle());}catch(RuntimeException unavailable){pendingRelease=session;}session=null;}
                WRITER.unlock();throw failure instanceof IOException?(IOException)failure:new IOException(failure);
            }
        }
        @Override public void close(){
            if(closed)return;closed=true;
            try{if(WRITER.getHoldCount()==1){
                try{if(transaction.active){transaction.success=false;transaction.endTransaction();}request("release",new Bundle());}
                catch(RuntimeException unavailable){pendingRelease=session;}
                finally{session=null;}
            }}finally{WRITER.unlock();}
        }
    }
    final class Transaction {
        boolean active,success;
        void beginTransaction(){if(active)throw new IllegalStateException("nested transaction");request("begin",new Bundle());active=true;success=false;}
        void setTransactionSuccessful(){if(!active)throw new IllegalStateException("missing transaction");success=true;}
        void endTransaction(){if(!active)return;try{request(success?"commit":"rollback",new Bundle());}finally{active=false;success=false;}}
    }
    Transaction getWritableDatabase(){return transaction;}
    private Bundle invoke(String op,Bundle args){args.putString("op",op);args.putString("session",session);return context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"health_ledger",null,args);}
    private Bundle request(String op,Bundle args){
        if(!WRITER.isHeldByCurrentThread()||session==null)throw new IllegalStateException("health guard required");
        Bundle result=invoke(op,args);if(result==null||!result.getBoolean("ok",false))throw new IllegalStateException("私有健康账本操作未完成");return result;
    }
    static final class Record {
        final String raw,output,token;final boolean generated;
        Record(String raw,String output,String token,boolean generated){this.raw=raw;this.output=output;this.token=token;this.generated=generated;}
    }
    static final class SavedRecord {
        final String sid;final long time;final Record record;
        SavedRecord(String sid,long time,Record record){this.sid=sid;this.time=time;this.record=record;}
    }
    static final class Award {final int requested,allowed;Award(int requested,int allowed){this.requested=requested;this.allowed=allowed;}}
    private static Record record(Bundle b){return b==null?null:new Record(b.getString("raw"),b.getString("output"),b.getString("token"),b.getBoolean("generated"));}
    private static Bundle key(String sid,long time){Bundle b=new Bundle();b.putString("sid",sid);b.putLong("time",time);return b;}
    Record get(String account,String sid,long time){return record(request("get",key(sid,time)).getBundle("record"));}
    void put(String account,String sid,long time,Record r){Bundle b=key(sid,time);b.putString("raw",r.raw);b.putString("output",r.output);b.putString("token",r.token);b.putBoolean("generated",r.generated);request("put",b);}
    Award award(String account,long time){Bundle b=request("award_get",key("",time));return b.getBoolean("present",false)?new Award(b.getInt("requested"),b.getInt("allowed")):null;}
    void award(String account,long time,int requested,int allowed){Bundle b=key("",time);b.putInt("requested",requested);b.putInt("allowed",allowed);request("award_put",b);}
    List<SavedRecord> records(String account,long start,long end){
        List<SavedRecord> result=new ArrayList<>();int offset=0;
        for(;;){Bundle b=new Bundle();b.putLong("start",start);b.putLong("end",end);b.putInt("offset",offset);
            ArrayList<Bundle> rows=request("records",b).getParcelableArrayList("rows");if(rows==null)throw new IllegalStateException("missing records");
            for(Bundle row:rows)result.add(new SavedRecord(row.getString("sid"),row.getLong("time"),record(row)));
            if(rows.isEmpty())return result;offset=Math.addExact(offset,rows.size());
        }
    }
    void admit(StepPlan p,long now){Bundle b=new Bundle();b.putString("plan",p.serialize());b.putLong("now",now);request("admit",b);}
    Map<Long,Integer> admitted(String account){
        Map<Long,Integer> result=new TreeMap<>();int offset=0;
        for(;;){Bundle b=new Bundle();b.putInt("offset",offset);ArrayList<Bundle> rows=request("admitted",b).getParcelableArrayList("rows");if(rows==null)throw new IllegalStateException("missing events");
            for(Bundle row:rows)result.put(row.getLong("time"),row.getInt("steps"));if(rows.isEmpty())return result;offset=Math.addExact(offset,rows.size());}
    }
}
