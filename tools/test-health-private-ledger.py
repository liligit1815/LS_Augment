"""Run production private health SQLite migration, session store and client against SQLite JDBC.

Only disposable host files are touched. JDBC is a test adapter, never shipped in the APK.
"""
from pathlib import Path
import os, shutil, subprocess, tempfile, urllib.request

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
CACHE=ROOT/'audit-output/health-ledger-jdbc'
CACHE.mkdir(parents=True,exist_ok=True)
deps={
 'sqlite-jdbc.jar':'https://repo.maven.apache.org/maven2/org/xerial/sqlite-jdbc/3.45.3.0/sqlite-jdbc-3.45.3.0.jar',
 'slf4j-api.jar':'https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/2.0.12/slf4j-api-2.0.12.jar',
 'slf4j-nop.jar':'https://repo.maven.apache.org/maven2/org/slf4j/slf4j-nop/2.0.12/slf4j-nop-2.0.12.jar'}
for name,url in deps.items():
 if not (CACHE/name).exists():urllib.request.urlretrieve(url,CACHE/name)
home=os.environ.get('JAVA_HOME')
javac=str(Path(home)/'bin/javac') if home else shutil.which('javac')
java=str(Path(home)/'bin/java') if home else shutil.which('java')
assert javac and java,'JAVA_HOME or JDK PATH required'
files={
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle{final Map<String,Object> values=new HashMap<>();public Bundle(){}public Bundle(Bundle b){values.putAll(b.values);}public String getString(String k){return (String)values.get(k);}public String getString(String k,String d){String s=getString(k);return s==null?d:s;}public void putString(String k,String v){values.put(k,v);}public int getInt(String k){return getInt(k,0);}public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}public void putInt(String k,int v){values.put(k,v);}public long getLong(String k){Object v=values.get(k);return v instanceof Long?(Long)v:0;}public void putLong(String k,long v){values.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}public void putBoolean(String k,boolean v){values.put(k,v);}public void putBundle(String k,Bundle v){values.put(k,v);}public Bundle getBundle(String k){return (Bundle)values.get(k);}public void putBinder(String k,IBinder v){values.put(k,v);}public IBinder getBinder(String k){return (IBinder)values.get(k);}public void putParcelableArrayList(String k,ArrayList<Bundle> v){values.put(k,v);}@SuppressWarnings("unchecked")public ArrayList<Bundle> getParcelableArrayList(String k){return (ArrayList<Bundle>)values.get(k);}}''',
'android/os/IBinder.java':'''package android.os;public interface IBinder{interface DeathRecipient{void binderDied();}boolean isBinderAlive();void linkToDeath(DeathRecipient d,int flags);boolean unlinkToDeath(DeathRecipient d,int flags);}''',
'android/os/Binder.java':'''package android.os;public class Binder implements IBinder{boolean alive=true;final java.util.List<DeathRecipient> listeners=new java.util.concurrent.CopyOnWriteArrayList<>();public boolean isBinderAlive(){return alive;}public void linkToDeath(DeathRecipient d,int f){listeners.add(d);}public boolean unlinkToDeath(DeathRecipient d,int f){return listeners.remove(d);}public void die(){alive=false;for(DeathRecipient d:listeners)d.binderDied();}}''',
'android/os/Looper.java':'''package android.os;public class Looper{private static final Looper MAIN=new Looper();public static boolean ui;public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return ui?MAIN:null;}}''',
'android/os/Process.java':'package android.os;public class Process{public static int myUid(){return 10424;}}',
'android/provider/Settings.java':'package android.provider;public class Settings{public static class Global{public static final String BOOT_COUNT="boot_count";public static int boot=1;public static int getInt(android.content.ContentResolver r,String key,int fallback){return boot;}}}',
'android/system/ErrnoException.java':'package android.system;public class ErrnoException extends Exception{public final int errno;public ErrnoException(String call,int e){errno=e;}}',
'android/system/OsConstants.java':'package android.system;public class OsConstants{public static final int ESRCH=3,EPERM=1;}',
'android/system/Os.java':'package android.system;public class Os{public static int error;public static void chmod(String path,int mode){if(mode!=0700)throw new AssertionError("private staging mode");}public static void kill(int pid,int signal)throws ErrnoException{if(signal!=0)throw new AssertionError("only process existence probe permitted");if(error!=0)throw new ErrnoException("kill",error);}}',
'android/net/Uri.java':'package android.net;public class Uri{public static Uri parse(String value){return new Uri();}}',
'android/content/ContentResolver.java':'''package android.content;public class ContentResolver{public static java.util.function.BiFunction<String,android.os.Bundle,android.os.Bundle> bridge;public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){if(!"health_ledger".equals(method))throw new AssertionError(method);return bridge.apply(method,extras);}}''',
'android/content/SharedPreferences.java':'package android.content;public class SharedPreferences{}',
'android/content/res/AssetManager.java':'package android.content.res;public class AssetManager{public java.io.InputStream open(String n)throws java.io.IOException{return new java.io.FileInputStream(n);}}',
'android/content/pm/ApplicationInfo.java':'package android.content.pm;public class ApplicationInfo{public int uid=10177;}',
'android/content/pm/PackageManager.java':'package android.content.pm;public class PackageManager{public static class NameNotFoundException extends Exception{}public ApplicationInfo getApplicationInfo(String n,int f)throws NameNotFoundException{return new ApplicationInfo();}}',
'android/content/Context.java':'''package android.content;public class Context{public static final int MODE_PRIVATE=0;public final java.io.File root;private final String packageName;public Context(java.io.File r,String p){root=r;packageName=p;}public Context getApplicationContext(){return this;}public String getPackageName(){return packageName;}public java.io.File getDatabasePath(String n){return new java.io.File(new java.io.File(root,"databases"),n);}public java.io.File getFilesDir(){return new java.io.File(root,"files");}public java.io.File getCacheDir(){java.io.File f=new java.io.File(root,"cache");f.mkdirs();return f;}public boolean deleteDatabase(String name){java.io.File f=getDatabasePath(name);boolean ok=!f.exists()||f.delete();for(String s:new String[]{"-wal","-shm","-journal"})new java.io.File(f.toString()+s).delete();return ok;}public ContentResolver getContentResolver(){return new ContentResolver();}public SharedPreferences getSharedPreferences(String n,int mode){return new SharedPreferences();}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}public android.content.res.AssetManager getAssets(){return new android.content.res.AssetManager();}}''',
'android/content/ContentValues.java':'''package android.content;public class ContentValues extends java.util.LinkedHashMap<String,Object>{public void put(String k,String v){super.put(k,v);}public void put(String k,Integer v){super.put(k,v);}public void put(String k,Long v){super.put(k,v);}}''',
'android/database/Cursor.java':r'''package android.database;public final class Cursor implements AutoCloseable{public static final int FIELD_TYPE_INTEGER=1,FIELD_TYPE_STRING=3;final java.util.List<Object[]> rows=new java.util.ArrayList<>();int at=-1;public Cursor(java.sql.ResultSet r)throws java.sql.SQLException{int n=r.getMetaData().getColumnCount();while(r.next()){Object[] row=new Object[n];for(int i=0;i<n;i++)row[i]=r.getObject(i+1);rows.add(row);}}public boolean moveToNext(){return ++at<rows.size();}public boolean moveToFirst(){at=0;return !rows.isEmpty();}public String getString(int i){Object v=rows.get(at)[i];return v==null?null:v.toString();}public int getInt(int i){return (int)getLong(i);}public long getLong(int i){Object v=rows.get(at)[i];return v instanceof Number?((Number)v).longValue():Long.parseLong(v.toString());}public int getType(int i){Object v=rows.get(at)[i];return v instanceof Number?FIELD_TYPE_INTEGER:FIELD_TYPE_STRING;}public boolean isNull(int i){return rows.get(at)[i]==null;}public void close(){}}''',
'android/database/sqlite/SQLiteDatabase.java':r'''package android.database.sqlite;
import java.sql.*;import android.database.Cursor;import android.content.ContentValues;public final class SQLiteDatabase{
 public static final int OPEN_READONLY=1,OPEN_READWRITE=0,CONFLICT_REPLACE=5,CONFLICT_IGNORE=4;public static volatile boolean failCommit;private final Connection db;private int depth;private boolean successful,rollback;
 private SQLiteDatabase(String path,boolean readonly){try{Class.forName("org.sqlite.JDBC");if(!readonly)new java.io.File(path).getParentFile().mkdirs();db=DriverManager.getConnection("jdbc:sqlite:"+(readonly?"file:"+path.replace('\\','/')+"?mode=ro":path));}catch(Exception e){throw new RuntimeException(e);}}
 public static SQLiteDatabase openDatabase(String path,Object factory,int flags){return new SQLiteDatabase(path,flags==OPEN_READONLY);}public static SQLiteDatabase create(String path){return new SQLiteDatabase(path,false);}
 public Cursor rawQuery(String sql,String[] args){try(PreparedStatement p=db.prepareStatement(sql)){if(args!=null)for(int i=0;i<args.length;i++)p.setString(i+1,args[i]);try(ResultSet r=p.executeQuery()){return new Cursor(r);}}catch(Exception e){throw new RuntimeException(sql,e);}}
 public void execSQL(String sql){execSQL(sql,null);}public void execSQL(String sql,Object[] args){try(PreparedStatement p=db.prepareStatement(sql)){if(args!=null)for(int i=0;i<args.length;i++)p.setObject(i+1,args[i]);p.execute();}catch(Exception e){throw new RuntimeException(sql,e);}}
 public long insertOrThrow(String table,String hack,ContentValues v){return insertWithOnConflict(table,hack,v,0);}public long insertWithOnConflict(String table,String hack,ContentValues v,int conflict){String names=String.join(",",v.keySet()),marks=String.join(",",java.util.Collections.nCopies(v.size(),"?"));String op=conflict==CONFLICT_REPLACE?" OR REPLACE":conflict==CONFLICT_IGNORE?" OR IGNORE":"";try(PreparedStatement p=db.prepareStatement("INSERT"+op+" INTO "+table+"("+names+") VALUES("+marks+")")){int i=1;for(Object value:v.values())p.setObject(i++,value);return p.executeUpdate()==0?-1:1;}catch(Exception e){throw new RuntimeException(e);}}
 public int delete(String table,String where,String[] args){execSQL("DELETE FROM "+table+(where==null?"":" WHERE "+where),args);return 1;}
 public void beginTransaction(){try{if(depth++==0){db.setAutoCommit(false);rollback=false;}successful=false;}catch(Exception e){throw new RuntimeException(e);}}
 public void setTransactionSuccessful(){successful=true;}public void endTransaction(){if(depth<=0)throw new IllegalStateException("no transaction");if(!successful)rollback=true;if(--depth>0)return;try{if(failCommit){failCommit=false;db.rollback();throw new IllegalStateException("simulated durable commit failure");}if(rollback)db.rollback();else db.commit();}catch(SQLException e){throw new RuntimeException(e);}finally{try{db.setAutoCommit(true);}catch(SQLException e){throw new RuntimeException(e);}}}
 public int getVersion(){try(Cursor c=rawQuery("PRAGMA user_version",null)){c.moveToFirst();return c.getInt(0);}}public void close(){try{db.close();}catch(Exception e){throw new RuntimeException(e);}}
}''',
'android/database/sqlite/SQLiteOpenHelper.java':'''package android.database.sqlite;public abstract class SQLiteOpenHelper{private final android.content.Context context;private final String name;private final int version;private SQLiteDatabase db;private boolean wal;public SQLiteOpenHelper(android.content.Context c,String n,Object f,int v){context=c;name=n;version=v;}public void setWriteAheadLoggingEnabled(boolean e){wal=e;}public SQLiteDatabase getWritableDatabase(){if(db==null){db=SQLiteDatabase.create(context.getDatabasePath(name).toString());if(wal)try(android.database.Cursor c=db.rawQuery("PRAGMA journal_mode=WAL",null)){c.moveToFirst();}int old=db.getVersion();if(old==0)onCreate(db);else if(old!=version)onUpgrade(db,old,version);db.execSQL("PRAGMA user_version="+version);}return db;}public SQLiteDatabase getReadableDatabase(){return getWritableDatabase();}public void close(){if(db!=null){db.close();db=null;}}public abstract void onCreate(SQLiteDatabase db);public abstract void onUpgrade(SQLiteDatabase db,int old,int next);}''',
'org/json/JSONObject.java':'package org.json;public class JSONObject{}',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema{public static final String HEALTH_ACCOUNT="account",HEALTH_ENABLED="enabled";}',
'ls/augment/com/AppConfig.java':'package ls.augment.com;public final class AppConfig{public static final String ACCOUNT="a".repeat(64);public static boolean enabled=true;AppConfig(android.content.Context c){}String get(String k){return ACCOUNT;}boolean getBoolean(String k){return enabled;}}',
'ls/augment/com/DurablePreferences.java':'package ls.augment.com;final class DurablePreferences{DurablePreferences(Object p){}boolean getBoolean(String k,boolean d){return d;}Editor edit(){return new Editor();}static class Editor{Editor putBoolean(String k,boolean v){return this;}boolean commit(){return true;}}}',
'ls/augment/com/RootShell.java':'package ls.augment.com;final class RootShell{static String quote(String s){return s;}static Result run(String c,String i,long t,int n){throw new AssertionError("no Root in this fixture");}static class Result{String output;boolean isSuccess(){return false;}String publicError(){return "fixture failure";}}}',
'ls/augment/com/AuditLog.java':'package ls.augment.com;final class AuditLog{static void write(android.content.Context c,String event,String message){}}',
'ls/augment/com/HideUserIdentity.java':'package ls.augment.com;final class HideUserIdentity{static class Snapshot{boolean success=true;long userSerial;}static Snapshot read(android.content.Context c,int user){return new Snapshot();}static Snapshot match(android.content.Context c,int user,long serial){return new Snapshot();}}',
'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;final class FeatureSettings{static String text(android.content.Context c,String k,String d){return ls.augment.com.AppConfig.ACCOUNT;}}',
'ls/augment/com/hook/TestHealthPrivateClient.java':r'''package ls.augment.com.hook;
import android.content.Context;import android.os.Looper;public final class TestHealthPrivateClient{
 public static int run(Context context)throws Exception{int checks=0;StepLedger ledger=new StepLedger(context);Looper.ui=true;try{ledger.guard();throw new AssertionError("main thread should pass through");}catch(java.io.IOException expected){checks++;}finally{Looper.ui=false;}
 try(StepLedger.Guard ignored=ledger.guard()){
  StepLedger.Transaction tx=ledger.getWritableDatabase();tx.beginTransaction();ledger.put("a".repeat(64),"phone",500,new StepLedger.Record("raw-client","out-client","token-client",false));tx.setTransactionSuccessful();tx.endTransaction();
  if(!ledger.get("a".repeat(64),"phone",500).output.equals("out-client"))throw new AssertionError("client durable commit");checks++;
  tx.beginTransaction();ledger.put("a".repeat(64),"phone",501,new StepLedger.Record("rollback","rollback","rollback",false));tx.endTransaction();
  if(ledger.get("a".repeat(64),"phone",501)!=null)throw new AssertionError("client rollback");checks++;
  tx.beginTransaction();ledger.put("a".repeat(64),"phone",502,new StepLedger.Record("failed","failed","failed",false));tx.setTransactionSuccessful();android.database.sqlite.SQLiteDatabase.failCommit=true;
  try{tx.endTransaction();throw new AssertionError("failed private commit must reach caller before native entity changes");}catch(IllegalStateException expected){checks++;}
  if(ledger.get("a".repeat(64),"phone",502)!=null)throw new AssertionError("failed client commit persisted");checks++;
  try(StepLedger.Guard nested=ledger.guard()){if(ledger.records("a".repeat(64),0,1000).isEmpty())throw new AssertionError("nested guard");checks++;}
 }
 if(context.root.exists()&&java.nio.file.Files.walk(context.root.toPath()).anyMatch(java.nio.file.Files::isRegularFile))throw new AssertionError("client created host storage");checks++;
 return checks;}
}''',
'ls/augment/com/TestHealthPrivateLedger.java':r'''package ls.augment.com;
import android.content.*;import android.os.*;import android.database.*;import android.database.sqlite.*;import java.io.*;import java.util.*;
public final class TestHealthPrivateLedger {
 static int checks;static void check(boolean yes,String label){checks++;if(!yes)throw new AssertionError(label);}static String token(){return UUID.randomUUID().toString();}
 static Bundle call(Context context,String session,String op){Bundle b=new Bundle();b.putString("session",session);b.putString("op",op);return HealthLedgerStore.call(context,b,10177,21);}
 static Bundle acquire(Context context,String session,Binder client,boolean legacy){Bundle b=new Bundle();b.putString("session",session);b.putString("op","acquire");b.putString("account",AppConfig.ACCOUNT);b.putBinder("client",client);b.putBoolean("legacy",legacy);return HealthLedgerStore.call(context,b,10177,21);}
 static Bundle put(Context context,String session,long time){Bundle b=new Bundle();b.putString("session",session);b.putString("op","put");b.putString("sid","phone");b.putLong("time",time);b.putString("raw","raw-"+time);b.putString("output","out-"+time);b.putString("token","token-"+time);return HealthLedgerStore.call(context,b,10177,21);}
 static Bundle get(Context context,String session,long time){Bundle b=new Bundle();b.putString("session",session);b.putString("op","get");b.putString("sid","phone");b.putLong("time",time);return HealthLedgerStore.call(context,b,10177,21);}
 static long count(SQLiteDatabase db,String table){try(Cursor c=db.rawQuery("SELECT COUNT(*) FROM "+table,null)){c.moveToFirst();return c.getLong(0);}}
 static void restartProvider()throws Exception{
  // Simulate process death: SQLite rolls back its open transaction; only durable private rows survive.
  java.lang.reflect.Field field=HealthLedgerStore.class.getDeclaredField("database");field.setAccessible(true);HealthLedgerDatabase ledger=(HealthLedgerDatabase)field.get(null);if(ledger!=null)ledger.close();field.set(null,null);
  field=HealthLedgerStore.class.getDeclaredField("owner");field.setAccessible(true);field.set(null,null);
  field=HealthLedgerStore.class.getDeclaredField("transaction");field.setAccessible(true);field.setBoolean(null,false);
 }
 public static void main(String[] args)throws Exception{
  File root=new File(args[0]);Context sourceContext=new Context(new File(root,"source"),"ls.augment.com");HealthLedgerDatabase old=new HealthLedgerDatabase(sourceContext);SQLiteDatabase original=old.getWritableDatabase();
  old.put(AppConfig.ACCOUNT,"phone",100,new HealthLedgerDatabase.Record("{\"steps\":10}","{\"steps\":20}","stable-token",false));old.award(AppConfig.ACCOUNT,60,40,20);
  StepPlan plan=new StepPlan("b".repeat(32),AppConfig.ACCOUNT,"UTC",java.time.LocalDate.of(2026,1,1),0,60,30,false,42);old.admit(plan,java.time.Instant.parse("2026-01-02T00:00:00Z").getEpochSecond());
  original.execSQL("DROP TABLE migration");original.execSQL("PRAGMA user_version=2");File source=sourceContext.getDatabasePath(HealthLedgerDatabase.NAME);
  Context privateContext=new Context(new File(root,"private"),"ls.augment.com");HealthLedgerDatabase target=new HealthLedgerDatabase(privateContext);
  check(HealthLedgerMigration.importDatabase(target,source),"legacy WAL snapshot imports into private SQLite");check(!target.ready(),"import alone cannot admit writers before cleanup");
  check(target.get(AppConfig.ACCOUNT,"phone",100).token.equals("stable-token")&&target.award(AppConfig.ACCOUNT,60).allowed==20,"idempotency tokens and reserved awards survive");
  for(String table:new String[]{"records","plans","events","plan_awards"})check(count(original,table)==count(target.getReadableDatabase(),table),"every table count preserved: "+table);
  check(HealthLedgerMigration.importDatabase(target,null)&&target.get(AppConfig.ACCOUNT,"phone",100)!=null,"retry after legacy deletion preserves committed staged import");
  original.execSQL("INSERT INTO records VALUES(?,?,?,?,?,?,?)",new Object[]{AppConfig.ACCOUNT,"phone",101,"raw-later","out-later","later-token",0});
  check(HealthLedgerMigration.importDatabase(target,source)&&count(target.getReadableDatabase(),"records")==2,"changed source safely replaces staging before readiness");
  Context failedContext=new Context(new File(root,"failed"),"ls.augment.com");HealthLedgerDatabase failed=new HealthLedgerDatabase(failedContext);failed.getWritableDatabase();SQLiteDatabase.failCommit=true;
  check(!HealthLedgerMigration.importDatabase(failed,source)&&count(failed.getReadableDatabase(),"records")==0,"failed durable import rolls back every table");check(count(original,"records")==2,"failed import preserves source database");
  original.execSQL("PRAGMA user_version=99");check(!HealthLedgerMigration.importDatabase(failed,source),"unknown legacy schema is retained");original.execSQL("PRAGMA user_version=2");
  old.close();target.close();failed.close();
  Context module=new Context(new File(root,"module"),"ls.augment.com");Binder binder=new Binder();String session=token();
  check(!acquire(module,session,binder,true).getBoolean("ok"),"existing old ledger gates new enhancements until migration");
  check(HealthLedgerStore.importLegacy(module,source)&&HealthLedgerStore.finishMigration(module),"module import completes after verified cleanup");
  check(acquire(module,session,binder,true).getBoolean("ok"),"private session admitted after migration");
  check(!HealthLedgerStore.importLegacy(module,source),"already-active private ledger never authorizes deletion of reappeared legacy source");
  check(HealthLedgerStore.importLegacy(module,null),"no-source migration completion does not block an active private client");
  check(!acquire(module,token(),new Binder(),false).getBoolean("ok"),"another writer cannot overlap native commit guard");
  check(!put(module,session,200).getBoolean("ok"),"intent write requires transaction");
  check(call(module,session,"begin").getBoolean("ok")&&put(module,session,200).getBoolean("ok")&&call(module,session,"commit").getBoolean("ok"),"intent transaction commits durably before native mutation");
  Bundle stolen=new Bundle();stolen.putString("session",session);stolen.putString("op","get");stolen.putString("sid","phone");stolen.putLong("time",200);
  check(!HealthLedgerStore.call(module,stolen,10177,99).getBoolean("ok"),"another process cannot reuse a session token");
  call(module,session,"begin");put(module,session,201);call(module,session,"release");check(acquire(module,session,binder,false).getBoolean("ok")&&get(module,session,201).getBundle("record")==null,"guard release rolls back uncommitted intents");
  call(module,session,"begin");put(module,session,202);SQLiteDatabase.failCommit=true;check(!call(module,session,"commit").getBoolean("ok")&&get(module,session,202).getBundle("record")==null,"failed commit never exposes an intent as durable");
  call(module,session,"begin");put(module,session,203);binder.die();String replacement=token();Binder next=new Binder();
  check(acquire(module,replacement,next,false).getBoolean("ok")&&get(module,replacement,203).getBundle("record")==null,"client death rolls back transaction and releases cross-process guard");
  check(get(module,replacement,200).getBundle("record")!=null,"committed intent survives client death for idempotent native retry");
  ResetWriteFence.begin();check(!get(module,replacement,200).getBoolean("ok"),"reset fences live session operations");call(module,replacement,"release");ResetWriteFence.end();
  String prior=token();Binder live=new Binder();check(acquire(module,prior,live,false).getBoolean("ok"),"acquire guard before provider crash");
  call(module,prior,"begin");put(module,prior,204);call(module,prior,"commit");restartProvider();
  String contender=token();check(!acquire(module,contender,new Binder(),false).getBoolean("ok"),"provider restart retains guard while original health process can still commit native data");
  Bundle wrongRelease=new Bundle();wrongRelease.putString("session",prior);wrongRelease.putString("op","release");HealthLedgerStore.call(module,wrongRelease,10177,99);
  check(!acquire(module,contender,new Binder(),false).getBoolean("ok"),"wrong PID cannot release persisted guard");
  call(module,token(),"release");check(!acquire(module,contender,new Binder(),false).getBoolean("ok"),"wrong token cannot release persisted guard");
  check(call(module,prior,"release").getBoolean("ok")&&acquire(module,contender,new Binder(),false).getBoolean("ok"),"original client can release after provider restart and native completion");
  check(get(module,contender,204).getBundle("record")!=null,"private durable intent survives provider restart");
  call(module,contender,"begin");put(module,contender,205);restartProvider();
  check(acquire(module,contender,new Binder(),false).getBoolean("ok")&&get(module,contender,205).getBundle("record")==null,"same authenticated session can recover a lost acquire reply; process death rolls back transaction");
  restartProvider();android.system.Os.error=android.system.OsConstants.EPERM;
  String orphan=token();check(!acquire(module,orphan,new Binder(),false).getBoolean("ok"),"process permission denial cannot expire a possibly live lease");
  android.system.Os.error=android.system.OsConstants.ESRCH;check(acquire(module,orphan,new Binder(),false).getBoolean("ok"),"confirmed dead process permits orphan lease recovery");android.system.Os.error=0;
  restartProvider();android.provider.Settings.Global.boot=2;String rebooted=token();check(acquire(module,rebooted,new Binder(),false).getBoolean("ok"),"a new Android boot expires old PID lease safely");
  call(module,rebooted,"release");
  java.util.concurrent.CountDownLatch unblock=new java.util.concurrent.CountDownLatch(1);
  Binder slow=new Binder(){@Override public void linkToDeath(IBinder.DeathRecipient recipient,int flags){super.linkToDeath(recipient,flags);try{unblock.await();}catch(InterruptedException e){Thread.currentThread().interrupt();throw new IllegalStateException(e);}}};
  String timedOut=token();Bundle timedOutReply=acquire(module,timedOut,slow,false);unblock.countDown();
  check(!timedOutReply.getBoolean("ok")&&"ledger_unavailable".equals(timedOutReply.getString("state")),"real provider timeout returns failure while queued acquire may still finish");
  check(call(module,timedOut,"release").getBoolean("ok"),"release after timeout is ordered after late acquire and removes its durable lease");
  String afterTimeout=token();check(acquire(module,afterTimeout,new Binder(),false).getBoolean("ok"),"late acquire cannot strand the next health writer");call(module,afterTimeout,"release");
  android.content.ContentResolver.bridge=(method,extras)->HealthLedgerStore.call(module,extras,10177,21);
  checks+=ls.augment.com.hook.TestHealthPrivateClient.run(new Context(new File(root,"health-host"),"com.mi.health"));
  check(HealthLedgerStore.hasRecords(module),"private reset detects historical intents");check(HealthLedgerStore.clearPrivate(module)&&!module.getDatabasePath(HealthLedgerDatabase.NAME).exists(),"explicit reset closes and removes module-private SQLite");
  String fresh=token();check(acquire(module,fresh,new Binder(),false).getBoolean("ok"),"first guard after reset creates a ready private ledger when no legacy source remains");call(module,fresh,"release");HealthLedgerStore.clearPrivate(module);
  check(source.exists(),"tests never delete or mutate native health stores");
  System.out.println("PASS Health private ledger: "+checks+" real SQLite migration/transaction/session/client/reset checks; no device commands");
 }
}'''
}
with tempfile.TemporaryDirectory(prefix='duo-health-private-') as folder:
 work=Path(folder)
 sources=[SRC/n for n in ('StepPlan.java','ResetWriteFence.java','HealthLedgerDatabase.java','HealthLedgerMigration.java','HealthLedgerStore.java','hook/StepLedger.java')]
 for name,source in files.items():
  p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');sources.append(p)
 cp=os.pathsep.join([folder,*[str(CACHE/n) for n in deps]])
 subprocess.run([javac,'-encoding','UTF-8','--release','17','-cp',cp,'-d',folder,*map(str,sources)],check=True)
 subprocess.run([java,'-cp',cp,'ls.augment.com.TestHealthPrivateLedger',str(work/'data')],check=True,timeout=60)
