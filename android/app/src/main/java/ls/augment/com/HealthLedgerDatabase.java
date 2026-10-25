package ls.augment.com;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.time.*;
import java.util.*;

/** Module-private durable health intents, isolated by account and source. */
final class HealthLedgerDatabase extends SQLiteOpenHelper {
    static final String NAME="health-step-ledger-v1.db";
    static final long MAX_BYTES=256L*1024*1024, RETENTION_SECONDS=400L*86400;
    HealthLedgerDatabase(Context c){super(c.getApplicationContext(),NAME,null,4);if(!"ls.augment.com".equals(c.getPackageName()))throw new IllegalArgumentException("module context required");setWriteAheadLoggingEnabled(true);}
    @Override public void onCreate(SQLiteDatabase d){
        d.execSQL("CREATE TABLE records(account TEXT NOT NULL,sid TEXT NOT NULL,time INTEGER NOT NULL,raw TEXT NOT NULL,output TEXT NOT NULL,token TEXT NOT NULL,generated INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(account,sid,time))");
        d.execSQL("CREATE TABLE plans(account TEXT NOT NULL,id TEXT NOT NULL,day TEXT NOT NULL,spec TEXT NOT NULL,PRIMARY KEY(account,id,day))");
        d.execSQL("CREATE TABLE events(account TEXT NOT NULL,id TEXT NOT NULL,day TEXT NOT NULL,time INTEGER NOT NULL,steps INTEGER NOT NULL,admitted INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(account,id,day,time))");
        createAwards(d);
        createMeta(d);
        createIndexes(d);
    }
    @Override public void onUpgrade(SQLiteDatabase d,int old,int next){
        if(old<1||old>3||next!=4)throw new IllegalStateException("unknown step ledger schema");
        if(old==1)createAwards(d);if(old<3)createMeta(d);createIndexes(d);
    }
    private static void createIndexes(SQLiteDatabase d){
        d.execSQL("CREATE INDEX IF NOT EXISTS records_by_time ON records(account,time,sid)");
        d.execSQL("CREATE INDEX IF NOT EXISTS events_by_time ON events(account,admitted,time)");
        d.execSQL("CREATE INDEX IF NOT EXISTS events_by_plan ON events(account,id,admitted,time)");
    }
    long retiredBefore(){try(Cursor c=getReadableDatabase().rawQuery("SELECT value FROM migration WHERE key='retired_before'",null)){return c.moveToFirst()?Long.parseLong(c.getString(0)):0;}}
    /** Archive only outside the old 366-day catch-up window, plus a timezone/retry margin.
     * The tombstone is committed with deletion: old clients fail closed instead of treating
     * a deleted intent as a new reading. Native health data is never deleted or rewritten. */
    void maintain(long now){
        SQLiteDatabase d=getWritableDatabase();long before=Math.max(0,(now-RETENTION_SECONDS)/86400*86400);
        if(before>retiredBefore()){
            d.beginTransaction();
            try{
                d.execSQL("INSERT OR REPLACE INTO migration(key,value) VALUES('retired_before',?)",new Object[]{""+before});
                for(String table:new String[]{"records","events","plan_awards"})d.execSQL("DELETE FROM "+table+" WHERE time<?",new Object[]{before});
                // Plans are keyed by their original timezone day, including overnight events.
                String day=Instant.ofEpochSecond(before).atZone(ZoneOffset.UTC).toLocalDate().minusDays(2).toString();
                d.execSQL("DELETE FROM plans WHERE day<?",new Object[]{day});
                d.setTransactionSuccessful();
            }finally{d.endTransaction();}
        }
        d.setMaximumSize(MAX_BYTES);
    }
    void requireRecent(long time){if(time<retiredBefore())throw new IllegalStateException("历史记录已归档，本次保留原生步数");}
    private static void createMeta(SQLiteDatabase d){d.execSQL("CREATE TABLE migration(key TEXT PRIMARY KEY,value TEXT NOT NULL)");}
    boolean ready(){try(Cursor c=getReadableDatabase().rawQuery("SELECT value FROM migration WHERE key='legacy_imported'",null)){return c.moveToFirst()&&"1".equals(c.getString(0));}}
    void markReady(){getWritableDatabase().execSQL("INSERT OR REPLACE INTO migration(key,value) VALUES('legacy_imported','1')");}
    private static void createAwards(SQLiteDatabase d){
        d.execSQL("CREATE TABLE plan_awards(account TEXT NOT NULL,time INTEGER NOT NULL,requested INTEGER NOT NULL,allowed INTEGER NOT NULL CHECK(allowed>=0 AND allowed<=requested),PRIMARY KEY(account,time))");
    }
    static final class Record {
        final String raw,output,token;final boolean generated;
        Record(String raw,String output,String token,boolean generated){this.raw=raw;this.output=output;this.token=token;this.generated=generated;}
    }
    static final class SavedRecord {
        final String sid;final long time;final Record record;
        SavedRecord(String sid,long time,Record record){this.sid=sid;this.time=time;this.record=record;}
    }
    List<SavedRecord> records(String account,long startInclusive,long endExclusive){
        List<SavedRecord> values=new ArrayList<>();
        try(Cursor c=getReadableDatabase().rawQuery("SELECT sid,time,raw,output,token,generated FROM records WHERE account=? AND time>=? AND time<? ORDER BY time,sid",new String[]{account,""+startInclusive,""+endExclusive})){
            while(c.moveToNext())values.add(new SavedRecord(c.getString(0),c.getLong(1),new Record(c.getString(2),c.getString(3),c.getString(4),c.getInt(5)!=0)));
        }
        return values;
    }
    static final class Award {
        final int requested,allowed;
        Award(int requested,int allowed){this.requested=requested;this.allowed=allowed;}
    }
    Award award(String account,long time){
        requireRecent(time);
        try(Cursor c=getReadableDatabase().rawQuery("SELECT requested,allowed FROM plan_awards WHERE account=? AND time=?",new String[]{account,""+time})){
            return c.moveToFirst()?new Award(c.getInt(0),c.getInt(1)):null;
        }
    }
    void award(String account,long time,int requested,int allowed){
        requireRecent(time);
        if(allowed<0||allowed>requested)throw new IllegalArgumentException("invalid plan award");
        ContentValues v=new ContentValues();v.put("account",account);v.put("time",time);v.put("requested",requested);v.put("allowed",allowed);
        if(getWritableDatabase().insertWithOnConflict("plan_awards",null,v,SQLiteDatabase.CONFLICT_REPLACE)<0)
            throw new IllegalStateException("无法保存计划步数上限判断");
    }
    Record get(String account,String sid,long time){
        requireRecent(time);
        try(Cursor c=getReadableDatabase().rawQuery("SELECT raw,output,token,generated FROM records WHERE account=? AND sid=? AND time=?",new String[]{account,sid,""+time})){
            return c.moveToFirst()?new Record(c.getString(0),c.getString(1),c.getString(2),c.getInt(3)!=0):null;
        }
    }
    void put(String account,String sid,long time,Record r){
        requireRecent(time);
        ContentValues v=new ContentValues();v.put("account",account);v.put("sid",sid);v.put("time",time);
        v.put("raw",r.raw);v.put("output",r.output);v.put("token",r.token);v.put("generated",r.generated?1:0);
        if(getWritableDatabase().insertWithOnConflict("records",null,v,SQLiteDatabase.CONFLICT_REPLACE)<0)
            throw new IllegalStateException("无法保存增步去重记录");
    }
    void admit(StepPlan p,long now){
        SQLiteDatabase d=getWritableDatabase();d.beginTransaction();
        try{
            // Seal v1 generated minutes before any plan can add new requests to
            // the same minute. This also works when callers reconcile by day.
            try(Cursor sealed=d.rawQuery("SELECT value FROM migration WHERE key='awards_sealed'",null)){
                if(!sealed.moveToFirst()){
                    d.execSQL("INSERT OR IGNORE INTO plan_awards(account,time,requested,allowed) SELECT e.account,e.time,SUM(e.steps),SUM(e.steps) FROM events e WHERE e.admitted=1 AND EXISTS(SELECT 1 FROM records r WHERE r.account=e.account AND r.generated=1 AND r.time>=e.time AND r.time<e.time+60) GROUP BY e.account,e.time");
                    d.execSQL("INSERT INTO migration(key,value) VALUES('awards_sealed','1')");
                }
            }
            LocalDate today=Instant.ofEpochSecond(now).atZone(ZoneId.of(p.zone)).toLocalDate();
            // An old configuration cannot silently schedule years of missed work.
            LocalDate first=p.startDate.isBefore(today.minusDays(366))?today.minusDays(366):p.startDate;
            try(Cursor existing=d.rawQuery("SELECT MAX(day) FROM plans WHERE account=? AND id=?",new String[]{p.account,p.id})){
                if(existing.moveToFirst()&&!existing.isNull(0)){
                    LocalDate last=LocalDate.parse(existing.getString(0));if(last.isAfter(first))first=last;
                }
            }
            for(LocalDate day=first;!day.isAfter(today);day=day.plusDays(1)){
                if(!p.repeat&&!day.equals(p.startDate))continue;
                ContentValues plan=new ContentValues();plan.put("account",p.account);plan.put("id",p.id);plan.put("day",day.toString());plan.put("spec",p.serialize());
                if(d.insertWithOnConflict("plans",null,plan,SQLiteDatabase.CONFLICT_IGNORE)>=0)
                    for(Map.Entry<Long,Integer> e:p.timetable(day).entrySet()){
                        ContentValues v=new ContentValues();v.put("account",p.account);v.put("id",p.id);v.put("day",day.toString());v.put("time",e.getKey());v.put("steps",e.getValue());
                        d.insertOrThrow("events",null,v);
                    }
            }
            d.execSQL("UPDATE events SET admitted=1 WHERE account=? AND id=? AND admitted=0 AND time<=?",new Object[]{p.account,p.id,now});
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
