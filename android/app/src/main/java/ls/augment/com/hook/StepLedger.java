package ls.augment.com.hook;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import org.json.JSONObject;
import java.time.*;
import java.util.*;
import java.io.*;
import java.nio.channels.*;
import java.util.concurrent.locks.ReentrantLock;
import ls.augment.com.StepPlan;

/** Private write-ahead ledger in the health app sandbox, isolated by account and source. */
final class StepLedger extends SQLiteOpenHelper {
    private static final ReentrantLock WRITER=new ReentrantLock(true);
    private final File lockFile;
    StepLedger(Context c){super(c,"ls_augment_steps_v1.db",null,1);lockFile=new File(c.getFilesDir(),"ls_augment_steps.lock");setWriteAheadLoggingEnabled(true);}
    /** Covers the ledger and the native DAO commit together, across health processes. */
    Guard guard()throws IOException{return new Guard();}
    final class Guard implements AutoCloseable {
        private RandomAccessFile file;private FileLock lock;private boolean closed;
        Guard()throws IOException{
            WRITER.lock();
            try{if(WRITER.getHoldCount()==1){file=new RandomAccessFile(lockFile,"rw");lock=file.getChannel().lock();}}
            catch(IOException|RuntimeException e){if(file!=null)try{file.close();}catch(IOException ignored){}WRITER.unlock();throw e;}
        }
        @Override public void close(){if(closed)return;closed=true;try{if(lock!=null)lock.release();}catch(IOException ignored){}
            finally{try{if(file!=null)file.close();}catch(IOException ignored){}WRITER.unlock();}}
    }
    @Override public void onCreate(SQLiteDatabase d){
        d.execSQL("CREATE TABLE records(account TEXT NOT NULL,sid TEXT NOT NULL,time INTEGER NOT NULL,raw TEXT NOT NULL,output TEXT NOT NULL,token TEXT NOT NULL,generated INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(account,sid,time))");
        d.execSQL("CREATE TABLE plans(account TEXT NOT NULL,id TEXT NOT NULL,day TEXT NOT NULL,spec TEXT NOT NULL,PRIMARY KEY(account,id,day))");
        d.execSQL("CREATE TABLE events(account TEXT NOT NULL,id TEXT NOT NULL,day TEXT NOT NULL,time INTEGER NOT NULL,steps INTEGER NOT NULL,admitted INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(account,id,day,time))");
    }
    @Override public void onUpgrade(SQLiteDatabase d,int old,int next){throw new IllegalStateException("unknown step ledger schema");}
    static final class Record {
        final String raw,output,token;final boolean generated;
        Record(String raw,String output,String token,boolean generated){this.raw=raw;this.output=output;this.token=token;this.generated=generated;}
    }
    Record get(String account,String sid,long time){
        try(Cursor c=getReadableDatabase().rawQuery("SELECT raw,output,token,generated FROM records WHERE account=? AND sid=? AND time=?",new String[]{account,sid,""+time})){
            return c.moveToFirst()?new Record(c.getString(0),c.getString(1),c.getString(2),c.getInt(3)!=0):null;
        }
    }
    void put(String account,String sid,long time,Record r){
        ContentValues v=new ContentValues();v.put("account",account);v.put("sid",sid);v.put("time",time);
        v.put("raw",r.raw);v.put("output",r.output);v.put("token",r.token);v.put("generated",r.generated?1:0);
        if(getWritableDatabase().insertWithOnConflict("records",null,v,SQLiteDatabase.CONFLICT_REPLACE)<0)
            throw new IllegalStateException("无法保存增步去重记录");
    }
    void admit(StepPlan p,long now){
        SQLiteDatabase d=getWritableDatabase();d.beginTransaction();
        try{
            LocalDate today=Instant.ofEpochSecond(now).atZone(ZoneId.of(p.zone)).toLocalDate();
            // An old configuration cannot silently schedule years of missed work.
            LocalDate first=p.startDate.isBefore(today.minusDays(366))?today.minusDays(366):p.startDate;
            for(LocalDate day=first;!day.isAfter(today);day=day.plusDays(1)){
                if(!p.repeat&&!day.equals(p.startDate))continue;
                ContentValues plan=new ContentValues();plan.put("account",p.account);plan.put("id",p.id);plan.put("day",day.toString());plan.put("spec",p.serialize());
                if(d.insertWithOnConflict("plans",null,plan,SQLiteDatabase.CONFLICT_IGNORE)>=0)
                    for(Map.Entry<Long,Integer> e:p.timetable(day).entrySet()){
                        ContentValues v=new ContentValues();v.put("account",p.account);v.put("id",p.id);v.put("day",day.toString());v.put("time",e.getKey());v.put("steps",e.getValue());
                        d.insertOrThrow("events",null,v);
                    }
            }
            d.execSQL("UPDATE events SET admitted=1 WHERE account=? AND id=? AND time<=?",new Object[]{p.account,p.id,now});
            d.setTransactionSuccessful();
        }finally{d.endTransaction();}
    }
    Map<Long,Integer> admitted(String account){
        TreeMap<Long,Integer> values=new TreeMap<>();
        try(Cursor c=getReadableDatabase().rawQuery("SELECT time,SUM(steps) FROM events WHERE account=? AND admitted=1 GROUP BY time",new String[]{account})){
            while(c.moveToNext())values.put(c.getLong(0),c.getInt(1));
        }
        return values;
    }
}
