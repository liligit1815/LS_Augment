package ls.augment.com;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.IBinder;
import android.provider.Settings;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;
import java.util.ArrayList;
import java.util.concurrent.*;

/** One private SQLite owner thread; authenticated health clients never receive database paths. */
final class HealthLedgerStore {
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"LSA-HealthLedger");t.setDaemon(true);return t;});
    private static HealthLedgerDatabase database;
    private static Session owner;
    private static boolean transaction;
    /** Survives provider death while the client is still committing its native health DAO. */
    private static final class Lease {
        final int boot,uid,pid;final String token,account;
        Lease(int boot,int uid,int pid,String token,String account){this.boot=boot;this.uid=uid;this.pid=pid;this.token=token;this.account=account;}
        boolean matches(int uid,int pid,String token){return this.uid==uid&&this.pid==pid&&this.token.equals(token);}
        String encode(){return boot+":"+uid+":"+pid+":"+token+":"+account;}
        static Lease read(HealthLedgerDatabase ledger){
            try(Cursor c=ledger.getReadableDatabase().rawQuery("SELECT value FROM migration WHERE key='session_lease'",null)){
                if(!c.moveToFirst())return null;String[] p=c.getString(0).split(":",-1);
                if(p.length!=5||!p[3].matches("[0-9a-f-]{36}")||!p[4].matches("[0-9a-f]{64}"))throw new IllegalStateException("invalid lease");
                Lease value=new Lease(Integer.parseInt(p[0]),Integer.parseInt(p[1]),Integer.parseInt(p[2]),p[3],p[4]);
                if(value.uid<0||value.pid<=0||value.boot< -1)throw new IllegalStateException("invalid lease identity");return value;
            }
        }
        void save(HealthLedgerDatabase ledger){ledger.getWritableDatabase().execSQL("INSERT OR REPLACE INTO migration(key,value) VALUES('session_lease',?)",new Object[]{encode()});}
        static void clear(HealthLedgerDatabase ledger){ledger.getWritableDatabase().execSQL("DELETE FROM migration WHERE key='session_lease'");}
        boolean ended(int currentBoot){
            if(boot>=0&&currentBoot>=0&&boot!=currentBoot)return true;
            try{Os.kill(pid,0);return false;}
            catch(ErrnoException e){return e.errno==OsConstants.ESRCH;}
            catch(RuntimeException unavailable){return false;}
        }
    }
    private static final class Session {
        final int uid,pid;final String token,account;final IBinder binder;final long generation;
        IBinder.DeathRecipient death;
        Session(int uid,int pid,String token,String account,IBinder binder){this.uid=uid;this.pid=pid;this.token=token;this.account=account;this.binder=binder;generation=ResetWriteFence.generation();}
    }
    private HealthLedgerStore(){}
    private static HealthLedgerDatabase db(Context c){if(database==null)database=new HealthLedgerDatabase(c);return database;}
    static Bundle call(Context context,Bundle request,int uid,int pid){
        if(request==null)return failure("invalid_request");
        Bundle input=new Bundle(request);
        try{return WORKER.submit(()->execute(context.getApplicationContext(),input,uid,pid)).get(10,TimeUnit.SECONDS);}
        catch(InterruptedException interrupted){Thread.currentThread().interrupt();return failure("ledger_unavailable");}
        catch(Exception unavailable){return failure("ledger_unavailable");}
    }
    private static Bundle execute(Context context,Bundle input,int uid,int pid){
        try{
            String op=input.getString("op",""),token=input.getString("session","");
            if(!token.matches("[0-9a-f-]{36}"))return failure("invalid_session");
            if("release".equals(op)){
                if(matches(uid,pid,token))drop(owner);
                else if(owner==null){
                    HealthLedgerDatabase ledger=db(context);Lease lease=Lease.read(ledger);
                    // The native DAO may have completed after the provider process restarted.
                    if(lease!=null&&lease.matches(uid,pid,token))Lease.clear(ledger);
                }
                return success();
            }
            if(ResetWriteFence.active())return failure("reset_in_progress");
            if("acquire".equals(op)){
                if(owner!=null)return matches(uid,pid,token)?success():failure("busy");
                String account=input.getString("account","");IBinder binder=input.getBinder("client");
                AppConfig config=new AppConfig(context);
                if(!account.matches("[0-9a-f]{64}")||!account.equals(config.get(ConfigSchema.HEALTH_ACCOUNT))
                        ||!config.getBoolean(ConfigSchema.HEALTH_ENABLED)||binder==null||!binder.isBinderAlive())return failure("inactive_binding");
                HealthLedgerDatabase ledger=db(context);
                if(!ledger.ready()){
                    if(input.getBoolean("legacy",true))return failure("legacy_migration_required");
                    ledger.markReady();
                }
                int boot=bootCount(context);Lease lease=Lease.read(ledger);
                if(lease!=null&&!lease.matches(uid,pid,token)&&!lease.ended(boot))return failure("busy");
                if(lease!=null&&lease.matches(uid,pid,token)&&!lease.account.equals(account))return failure("inactive_binding");
                Session session=new Session(uid,pid,token,account,binder);
                session.death=()->WORKER.execute(()->drop(session));
                binder.linkToDeath(session.death,0);
                try{new Lease(boot,uid,pid,token,account).save(ledger);owner=session;}
                catch(RuntimeException failure){binder.unlinkToDeath(session.death,0);throw failure;}
                if(!binder.isBinderAlive()){drop(session);return failure("client_died");}
                return success();
            }
            if(!matches(uid,pid,token)||owner.generation!=ResetWriteFence.generation())return failure("expired_session");
            HealthLedgerDatabase ledger=db(context);SQLiteDatabase sql=ledger.getWritableDatabase();
            Bundle result=success();String account=owner.account;
            switch(op){
                case "begin":if(transaction)throw new IllegalStateException("nested transaction");sql.beginTransaction();transaction=true;break;
                case "commit":if(!transaction)throw new IllegalStateException("missing transaction");try{sql.setTransactionSuccessful();}finally{try{sql.endTransaction();}finally{transaction=false;}}break;
                case "rollback":if(transaction){try{sql.endTransaction();}finally{transaction=false;}}break;
                case "get":{
                    HealthLedgerDatabase.Record row=ledger.get(account,sid(input),input.getLong("time"));
                    if(row!=null)result.putBundle("record",record(row));break;
                }
                case "put":requireTransaction();ledger.put(account,sid(input),input.getLong("time"),new HealthLedgerDatabase.Record(text(input,"raw"),text(input,"output"),text(input,"token"),input.getBoolean("generated")));break;
                case "award_get":{
                    HealthLedgerDatabase.Award award=ledger.award(account,input.getLong("time"));
                    if(award!=null){result.putBoolean("present",true);result.putInt("requested",award.requested);result.putInt("allowed",award.allowed);}break;
                }
                case "award_put":ledger.award(account,input.getLong("time"),input.getInt("requested"),input.getInt("allowed"));break;
                case "admit":{
                    StepPlan plan=StepPlan.parse(text(input,"plan"));if(plan==null||!account.equals(plan.account))throw new IllegalArgumentException("invalid plan");
                    ledger.admit(plan,input.getLong("now"));break;
                }
                case "records":{
                    int offset=offset(input),used=0;ArrayList<Bundle> rows=new ArrayList<>();
                    try(Cursor cursor=sql.rawQuery("SELECT sid,time,raw,output,token,generated FROM records WHERE account=? AND time>=? AND time<? ORDER BY time,sid LIMIT 128 OFFSET ?",
                            new String[]{account,""+input.getLong("start"),""+input.getLong("end"),""+offset})){
                        while(cursor.moveToNext()){
                            int size=cursor.getString(0).length()+cursor.getString(2).length()+cursor.getString(3).length()+cursor.getString(4).length()+128;
                            if(size>65536)throw new IllegalStateException("oversized ledger record");
                            if(used+size>98304&&!rows.isEmpty())break;
                            Bundle row=new Bundle();row.putString("sid",cursor.getString(0));row.putLong("time",cursor.getLong(1));row.putString("raw",cursor.getString(2));row.putString("output",cursor.getString(3));row.putString("token",cursor.getString(4));row.putBoolean("generated",cursor.getInt(5)!=0);rows.add(row);used+=size;
                        }
                    }
                    result.putParcelableArrayList("rows",rows);break;
                }
                case "admitted":{
                    ArrayList<Bundle> rows=new ArrayList<>();try(Cursor cursor=sql.rawQuery("SELECT time,SUM(steps) FROM events WHERE account=? AND admitted=1 GROUP BY time ORDER BY time LIMIT 512 OFFSET ?",new String[]{account,""+offset(input)})){
                        while(cursor.moveToNext()){Bundle row=new Bundle();row.putLong("time",cursor.getLong(0));row.putInt("steps",cursor.getInt(1));rows.add(row);}
                    }result.putParcelableArrayList("rows",rows);break;
                }
                default:return failure("unknown_operation");
            }
            return result;
        }catch(Exception invalid){return failure("ledger_operation_failed");}
    }
    private static int offset(Bundle b){int n=b.getInt("offset",-1);if(n<0)throw new IllegalArgumentException("offset");return n;}
    private static String sid(Bundle b){String s=text(b,"sid");if(s.isEmpty()||s.length()>1024)throw new IllegalArgumentException("source");return s;}
    private static String text(Bundle b,String key){String s=b.getString(key);if(s==null||s.length()>32768)throw new IllegalArgumentException("value");return s;}
    private static void requireTransaction(){if(!transaction)throw new IllegalStateException("transaction required");}
    private static boolean matches(int uid,int pid,String token){return owner!=null&&owner.uid==uid&&owner.pid==pid&&owner.token.equals(token);}
    private static Bundle record(HealthLedgerDatabase.Record r){Bundle b=new Bundle();b.putString("raw",r.raw);b.putString("output",r.output);b.putString("token",r.token);b.putBoolean("generated",r.generated);return b;}
    private static int bootCount(Context context){
        try{return Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT,-1);}
        catch(RuntimeException unavailable){return -1;}
    }
    private static void drop(Session session){
        if(owner!=session||session==null)return;
        try{if(transaction&&database!=null)database.getWritableDatabase().endTransaction();if(database!=null)Lease.clear(database);}
        finally{transaction=false;owner=null;try{session.binder.unlinkToDeath(session.death,0);}catch(RuntimeException ignored){}}
    }
    static boolean ready(Context context){try{return WORKER.submit(()->db(context).ready()).get(10,TimeUnit.SECONDS);}catch(Exception e){return false;}}
    static boolean importLegacy(Context context,File source){
        try{return WORKER.submit(()->{
            HealthLedgerDatabase ledger=db(context);if(ledger.ready())return source==null;
            if(owner!=null)return false;
            return HealthLedgerMigration.importDatabase(ledger,source);
        }).get(30,TimeUnit.SECONDS);}catch(Exception unavailable){return false;}
    }
    static boolean finishMigration(Context context){
        try{return WORKER.submit(()->{if(db(context).ready())return true;if(owner!=null)return false;db(context).markReady();return db(context).ready();}).get(10,TimeUnit.SECONDS);}
        catch(Exception unavailable){return false;}
    }
    static boolean clearPrivate(Context context){
        try{return WORKER.submit(()->{
            if(owner!=null&&owner.binder.isBinderAlive())return false;
            if(owner!=null)drop(owner);
            if(database!=null){database.close();database=null;}
            return !context.getDatabasePath(HealthLedgerDatabase.NAME).exists()||context.deleteDatabase(HealthLedgerDatabase.NAME);
        }).get(10,TimeUnit.SECONDS);}catch(Exception unavailable){return false;}
    }
    static boolean hasRecords(Context context){
        if(!context.getDatabasePath(HealthLedgerDatabase.NAME).exists())return false;
        try{return WORKER.submit(()->{
            try(Cursor c=db(context).getReadableDatabase().rawQuery("SELECT EXISTS(SELECT 1 FROM records UNION ALL SELECT 1 FROM plans UNION ALL SELECT 1 FROM events UNION ALL SELECT 1 FROM plan_awards)",null)){
                return !c.moveToFirst()||c.getInt(0)!=0;
            }
        }).get(10,TimeUnit.SECONDS);}catch(Exception unavailable){return true;}
    }
    private static Bundle success(){Bundle b=new Bundle();b.putBoolean("ok",true);return b;}
    private static Bundle failure(String reason){Bundle b=new Bundle();b.putBoolean("ok",false);b.putString("state",reason);return b;}
}
