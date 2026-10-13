"""Compile the production provider route and exercise it against real SQLite.

Android Bundle/Binder/hook transport are host doubles. SQLiteDatabase delegates to
the cached SQLite JDBC engine, including transaction rollback and reader isolation.
No phone is written and no production source is edited by this test.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
SQLITE = next((Path.home() / '.gradle/caches/modules-2/files-2.1/org.xerial/sqlite-jdbc').rglob('sqlite-jdbc-*.jar'))
STUBS = {
'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {
private final Map<String,Object> values=new HashMap<>();
public boolean containsKey(String k){return values.containsKey(k);}
public Object get(String k){return values.get(k);}public void putString(String k,String v){values.put(k,v);}
public String getString(String k){return (String)values.get(k);}public String getString(String k,String d){return values.containsKey(k)?(String)values.get(k):d;}
public void putInt(String k,int v){values.put(k,v);}public int getInt(String k,int d){return values.containsKey(k)?(Integer)values.get(k):d;}
public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){return values.containsKey(k)?(Long)values.get(k):d;}
public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k,boolean d){return values.containsKey(k)?(Boolean)values.get(k):d;}
}''',
'android/os/Binder.java': 'package android.os;public class Binder {public static int uid=10001;public static int getCallingUid(){return uid;}}',
'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 10001;}}',
'android/net/Uri.java': 'package android.net;public class Uri {public final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}public String getAuthority(){return java.net.URI.create(value).getAuthority();}public String getPath(){return java.net.URI.create(value).getPath();}}',
'android/content/ContentProvider.java': 'package android.content;public class ContentProvider {public Context getContext(){return new Context();}}',
'android/content/Context.java': 'package android.content;public class Context {}',
'android/content/ContentValues.java': '''package android.content;import java.util.*;public class ContentValues {
public final Map<String,Object> values=new LinkedHashMap<>();public ContentValues(){}public ContentValues(ContentValues v){values.putAll(v.values);}
public boolean containsKey(String k){return values.containsKey(k);}public void put(String k,Integer v){values.put(k,v);}public void put(String k,Long v){values.put(k,v);}public void put(String k,String v){values.put(k,v);}
public Integer getAsInteger(String k){Object v=values.get(k);return v==null?null:v instanceof Number?((Number)v).intValue():Integer.valueOf(v.toString());}
public Long getAsLong(String k){Object v=values.get(k);return v==null?null:v instanceof Number?((Number)v).longValue():Long.valueOf(v.toString());}
public String getAsString(String k){Object v=values.get(k);return v==null?null:v.toString();}
}''',
'android/database/Cursor.java': '''package android.database;import java.util.*;public class Cursor implements AutoCloseable {
private final List<Object[]> rows;private final List<String> columns;private int position=-1;
public Cursor(List<Object[]> r,List<String> c){rows=r;columns=c;}
public boolean moveToFirst(){position=0;return !rows.isEmpty();}public boolean moveToNext(){return ++position<rows.size();}
public String getString(int i){Object v=rows.get(position)[i];return v==null?null:v.toString();}
public int getInt(int i){Object v=rows.get(position)[i];return v==null?0:((Number)v).intValue();}
public boolean isNull(int i){return rows.get(position)[i]==null;}public int getColumnIndex(String n){return columns.indexOf(n);}
public void close(){}
}''',
'android/database/sqlite/SQLiteOpenHelper.java': '''package android.database.sqlite;public class SQLiteOpenHelper {
private final SQLiteDatabase db;public SQLiteOpenHelper(SQLiteDatabase d){db=d;}public SQLiteDatabase getWritableDatabase(){return db;}
}''',
'android/database/sqlite/SQLiteDatabase.java': '''package android.database.sqlite;
import android.database.Cursor;import java.sql.*;import java.util.*;
public class SQLiteDatabase implements AutoCloseable {
public final Connection connection;private boolean successful;public int begins,execCalls,failExec=-1;public Runnable afterExec;
public SQLiteDatabase(String url){try{Class.forName("org.sqlite.JDBC");connection=DriverManager.getConnection(url);}catch(Exception e){throw new IllegalStateException(e);}}
public void beginTransaction(){try{connection.setAutoCommit(false);successful=false;begins++;}catch(SQLException e){throw new IllegalStateException(e);}}
public void setTransactionSuccessful(){successful=true;}
public void endTransaction(){try{if(successful)connection.commit();else connection.rollback();connection.setAutoCommit(true);}catch(SQLException e){throw new IllegalStateException(e);}}
public boolean inTransaction(){try{return !connection.getAutoCommit();}catch(SQLException e){throw new IllegalStateException(e);}}
public void execSQL(String sql,Object[] args){if(++execCalls==failExec)throw new IllegalStateException("injected write failure");
try(PreparedStatement p=connection.prepareStatement(sql)){if(args!=null)for(int i=0;i<args.length;i++)p.setObject(i+1,args[i]);p.executeUpdate();}
catch(SQLException e){throw new IllegalStateException(e);}if(afterExec!=null)afterExec.run();}
public Cursor rawQuery(String sql,String[] args){try(PreparedStatement p=connection.prepareStatement(sql)){
if(args!=null)for(int i=0;i<args.length;i++)p.setString(i+1,args[i]);try(ResultSet r=p.executeQuery()){
List<Object[]> rows=new ArrayList<>();List<String> names=new ArrayList<>();int count=r.getMetaData().getColumnCount();
for(int i=1;i<=count;i++)names.add(r.getMetaData().getColumnLabel(i));while(r.next()){Object[] row=new Object[count];for(int i=1;i<=count;i++)row[i-1]=r.getObject(i);rows.add(row);}return new Cursor(rows,names);}}
catch(SQLException e){throw new IllegalStateException(e);}}
public void close(){try{connection.close();}catch(SQLException e){throw new IllegalStateException(e);}}
}''',
'cn/nubia/tgk/data/TgkDataProvider.java': '''package cn.nubia.tgk.data;
import android.content.*;import android.database.*;import android.database.sqlite.*;import android.os.Bundle;import android.net.Uri;import java.util.*;
public class TgkDataProvider extends ContentProvider {
public static final String AUTHORITY="cn.nubia.tgk.data.TgkDataProvider";private SQLiteOpenHelper mSqliteHelper;
public TgkDataProvider(SQLiteOpenHelper h){mSqliteHelper=h;}public Bundle call(String method,String arg,Bundle extras){Bundle b=new Bundle();b.putString("oem",method);return b;}
public static RuntimeException updateError;public static int updateCalls;
public int update(Uri uri,ContentValues values,String where,String[] args){updateCalls++;if(updateError!=null)throw updateError;
String table=uri.getPath().substring(1);StringJoiner fields=new StringJoiner(",");List<Object> bind=new ArrayList<>();
for(Map.Entry<String,Object> e:values.values.entrySet()){fields.add(e.getKey()+"=?");bind.add(e.getValue());}Collections.addAll(bind,args);
android.database.sqlite.SQLiteDatabase db=mSqliteHelper.getWritableDatabase();db.execSQL("UPDATE "+table+" SET "+fields+" WHERE "+where,bind.toArray());
try(Cursor c=db.rawQuery("SELECT changes()",null)){c.moveToFirst();return c.getInt(0);}}
}''',
'cn/nubia/tgk/data/TgkDataContract.java': '''package cn.nubia.tgk.data;public class TgkDataContract {
public static final class TgkEntry {public static final String PRESET_CASE_TABLE_NAME="preset_case_table",IMPORT_CASE_TABLE_NAME="import_case_table",_ID="_id",TGK_CASE_STATE="state",TGK_PACKAGE_NAME="package_name";}
}''',
'ls/augment/com/hook/HookTelemetry.java': '''package ls.augment.com.hook;import java.util.*;class HookTelemetry {
static boolean fail;static final List<String> events=new ArrayList<>();static void shoulderSwitch(String l,String v){if(fail)throw new IllegalStateException("diagnostic unavailable");events.add(l+":"+v);}}
''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;class AugmentModule {
Hooker callback;java.util.Map<String,Hooker> callbacks=new java.util.HashMap<>();int registered;Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(this,m);}
void registerFeatureHook(Object handle){registered++;}void logFeatureError(String s,Throwable e){}
interface Hooker {Object intercept(Chain c)throws Throwable;}
static class Chain {Object owner;Object[] args;Method method;int proceeded;Chain(Object o,Method m,Object...a){owner=o;method=m;args=a;}
Object getArg(int i){return args[i];}Object getThisObject(){return owner;}Object proceed()throws Throwable{return proceed(args);}Object proceed(Object[] v)throws Throwable{proceeded++;try{return method.invoke(owner,v);}catch(InvocationTargetException e){throw e.getCause();}}}
static class Builder {AugmentModule m;Method method;Builder(AugmentModule a,Method b){m=a;method=b;}Object intercept(Hooker h){if(method.getName().equals("call"))m.callback=h;m.callbacks.put(method.getName(),h);return h;}}
}''',
'ls/augment/com/hook/FeatureSettings.java': 'package ls.augment.com.hook;class FeatureSettings {static final String GAME_MASTER="master";static boolean enabled=true,master=true;static boolean enabled(android.content.Context c,String key,boolean d){return enabled;}static boolean enabled(android.content.Context c,String key){return master;}}',
'ls/augment/com/GameOptions.java': 'package ls.augment.com;public class GameOptions {public static final String QUICK_SWITCH="quick";}',
}
TEST = r'''package ls.augment.com.hook;
import android.os.*;import android.database.*;import android.database.sqlite.*;import android.content.*;import android.net.Uri;
import cn.nubia.tgk.data.*;import java.lang.reflect.*;import java.nio.file.*;
public class TestShoulderSelectionStore {
static int checks;static final String PKG="test.example.game";
static final String[] TABLES={"preset_case_table","import_case_table"};
static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static void sql(SQLiteDatabase db,String s){db.execSQL(s,null);}
static void schema(SQLiteDatabase db){for(String t:TABLES)sql(db,"CREATE TABLE "+t+"(_id INTEGER PRIMARY KEY,state INTEGER,package_name TEXT,left_points TEXT,left_option INTEGER,show_name TEXT)");}
static void fill(SQLiteDatabase db){schema(db);
sql(db,"INSERT INTO preset_case_table VALUES(1,7,'"+PKG+"','100,100',0,'A'),(2,6,'"+PKG+"','500,300',2,'B'),(3,5,'other.example.game','999,999',4,'other')");
sql(db,"INSERT INTO import_case_table VALUES(2,10,'"+PKG+"','700,400',1,'import')");db.execCalls=0;}
static Bundle request(int table,long id){Bundle b=new Bundle();b.putString("gamePackage",PKG);b.putInt("tableId",table);b.putLong("caseId",id);return b;}
static Bundle tagged(int table,long id,String tag){Bundle b=request(table,id);b.putString("leaseTag",tag);return b;}
static long number(SQLiteDatabase db,String query){try(Cursor c=db.rawQuery(query,null)){check(c.moveToFirst(),"missing scalar");return c.getInt(0);}}
static String text(SQLiteDatabase db,String query){try(Cursor c=db.rawQuery(query,null)){check(c.moveToFirst(),"missing text");return c.getString(0);}}
static Object invoke(AugmentModule m,TgkDataProvider p,String method,Bundle b)throws Throwable{
Method call=TgkDataProvider.class.getDeclaredMethod("call",String.class,String.class,Bundle.class);
return m.callback.intercept(new AugmentModule.Chain(p,call,method,null,b));}
static Bundle select(AugmentModule m,SQLiteDatabase db,Bundle b)throws Throwable{return (Bundle)invoke(m,new TgkDataProvider(new SQLiteOpenHelper(db)),ShoulderSelectionStore.CALL,b);}
static Bundle release(AugmentModule m,SQLiteDatabase db,String tag)throws Throwable{Bundle b=new Bundle();b.putString("gamePackage",PKG);b.putString("leaseTag",tag);return (Bundle)invoke(m,new TgkDataProvider(new SQLiteOpenHelper(db)),ShoulderSelectionStore.RELEASE_CALL,b);}
static Bundle cancel(AugmentModule m,SQLiteDatabase db,String tag,int table,long id)throws Throwable{Bundle b=new Bundle();b.putString("gamePackage",PKG);b.putString("leaseTag",tag);b.putInt("rollbackTableId",table);b.putLong("rollbackCaseId",id);return (Bundle)invoke(m,new TgkDataProvider(new SQLiteOpenHelper(db)),ShoulderSelectionStore.RELEASE_CALL,b);}
static int update(AugmentModule m,SQLiteDatabase db,int table,int id,ContentValues v)throws Throwable{
Method method=TgkDataProvider.class.getDeclaredMethod("update",Uri.class,ContentValues.class,String.class,String[].class);
return (Integer)m.callbacks.get("update").intercept(new AugmentModule.Chain(new TgkDataProvider(new SQLiteOpenHelper(db)),method,Uri.parse("content://"+ShoulderSelectionStore.AUTHORITY+"/"+TABLES[table]),v,"_id=?",new String[]{Integer.toString(id)}));}
static void error(Bundle b,String code){check(!b.getBoolean("ok",true)&&code.equals(b.getString("error")),"wrong failure:"+code);}
static long state(SQLiteDatabase db,String table,int id){return number(db,"SELECT state FROM "+table+" WHERE _id="+id);}
public static void main(String[] args)throws Throwable{
AugmentModule unavailable=new AugmentModule();ClassLoader missing=new ClassLoader(TestShoulderSelectionStore.class.getClassLoader()){
@Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals(ShoulderSelectionStore.AUTHORITY))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
check(ShoulderSelectionStore.install(unavailable,missing)==0&&unavailable.registered==0,"missing contract registered");
check(HookTelemetry.events.stream().anyMatch(e->e.contains("INSTALL_FAILED")),"install error unlogged");
AugmentModule module=new AugmentModule();check(ShoulderSelectionStore.install(module,TestShoulderSelectionStore.class.getClassLoader())==2&&module.registered==2,"install routes");
check(ShoulderSelectionStore.install(module,TestShoulderSelectionStore.class.getClassLoader())==0&&module.registered==2,"duplicate registration");
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);TgkDataProvider provider=new TgkDataProvider(new SQLiteOpenHelper(db));
Bundle passthrough=(Bundle)invoke(module,provider,"getTgkFileUri",null);check("getTgkFileUri".equals(passthrough.getString("oem"))&&db.begins==0,"OEM call changed");
Binder.uid=0;error(select(module,db,request(0,2)),"caller_uid");Binder.uid=10001;check(db.begins==0,"denied caller accessed DB");
error(select(module,db,null),"invalid_request");error(select(module,db,request(2,2)),"invalid_request");error(select(module,db,request(0,0)),"invalid_request");
Bundle bad=request(0,2);bad.putString("gamePackage","bad/pkg");error(select(module,db,bad),"invalid_request");
bad=request(0,2);bad.putLong("tableId",0);error(select(module,db,bad),"invalid_request");check(db.begins==0,"invalid request opened transaction");
error(select(module,db,request(0,999)),"case_missing");bad=request(0,3);error(select(module,db,bad),"package_mismatch");check(state(db,TABLES[0],1)==7&&!db.inTransaction(),"missing/mismatch changed state");
Bundle b=select(module,db,request(0,2));check(b.getBoolean("ok",false)&&b.getBoolean("changed",false)&&b.getInt("tableId",-1)==0&&b.getLong("caseId",-1)==2,"selection response");
check(state(db,TABLES[0],1)==6&&state(db,TABLES[0],2)==7&&state(db,TABLES[1],2)==10,"same-table selection flags");
check(state(db,TABLES[0],3)==5,"other app state changed");
check("500,300".equals(text(db,"SELECT left_points FROM preset_case_table WHERE _id=2"))&&number(db,"SELECT left_option FROM preset_case_table WHERE _id=2")==2,"mapping overwritten");
check("B".equals(text(db,"SELECT show_name FROM preset_case_table WHERE _id=2")),"content overwritten");
b=select(module,db,request(0,2));check(b.getBoolean("ok",false)&&!b.getBoolean("changed",true),"idempotent response");
b=select(module,db,request(1,2));check(b.getBoolean("ok",false)&&state(db,TABLES[0],2)==6&&state(db,TABLES[1],2)==11,"cross-table selection");
check("700,400".equals(text(db,"SELECT left_points FROM import_case_table WHERE _id=2")),"cross-table content changed");
HookTelemetry.fail=true;b=select(module,db,request(0,2));HookTelemetry.fail=false;
check(b.getBoolean("ok",false)&&state(db,TABLES[0],2)==7,"diagnostics changed committed result");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);db.failExec=2;error(select(module,db,request(1,2)),"database_error");
check(state(db,TABLES[0],1)==7&&state(db,TABLES[0],2)==6&&state(db,TABLES[1],2)==10&&!db.inTransaction(),"partial update survived rollback");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);sql(db,"CREATE TRIGGER block_target BEFORE UPDATE ON import_case_table WHEN (NEW.state & 1)!=0 BEGIN SELECT RAISE(IGNORE);END");
error(select(module,db,request(1,2)),"target_write");check(state(db,TABLES[0],1)==7&&state(db,TABLES[1],2)==10,"target failure did not roll back clear");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);sql(db,"CREATE TRIGGER block_clear BEFORE UPDATE ON preset_case_table WHEN OLD._id=1 AND (NEW.state & 1)=0 BEGIN SELECT RAISE(IGNORE);END");
error(select(module,db,request(1,2)),"selection_write");check(state(db,TABLES[0],1)==7&&state(db,TABLES[1],2)==10,"silently blocked clear committed duplicate selection");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);sql(db,"UPDATE import_case_table SET state=NULL WHERE _id=2");
error(select(module,db,request(1,2)),"invalid_state");check(state(db,TABLES[0],1)==7,"invalid state changed prior selection");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
sql(db,"CREATE TABLE preset_case_table(_id INTEGER PRIMARY KEY,state INTEGER,package_name TEXT)");
sql(db,"CREATE TABLE import_case_table(_id INTEGER PRIMARY KEY,wrong_state INTEGER,package_name TEXT)");
sql(db,"INSERT INTO preset_case_table VALUES(1,5,'"+PKG+"')");error(select(module,db,request(0,1)),"schema_unavailable");check(state(db,TABLES[0],1)==5,"schema mismatch wrote state");
}
Path file=Files.createTempFile("shoulder-store-isolation-",".db");String url="jdbc:sqlite:"+file;
try(SQLiteDatabase writer=new SQLiteDatabase(url);SQLiteDatabase reader=new SQLiteDatabase(url)){
fill(writer);sql(writer,"UPDATE import_case_table SET state=11 WHERE _id=2");writer.execCalls=0;
final int[] observations={0};writer.afterExec=()->{check(state(reader,TABLES[0],1)==7&&state(reader,TABLES[1],2)==11,"reader saw partial transaction");observations[0]++;};
Bundle b=select(module,writer,request(0,2));writer.afterExec=null;
check(b.getBoolean("ok",false)&&observations[0]==3,"isolation updates not observed");
check(state(reader,TABLES[0],1)==6&&state(reader,TABLES[0],2)==7&&state(reader,TABLES[1],2)==10,"reader missed committed choice");
}finally{Files.deleteIfExists(file);}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);Bundle chosen=select(module,db,tagged(1,2,"lease1"));check(chosen.getBoolean("ok",false),"tagged selection");
ContentValues old=new ContentValues();old.put("state",7);old.put("left_points","old-write-content");old.put("left_option",1);old.put("show_name","edited-name");
check(update(module,db,0,1,old)==1&&state(db,TABLES[0],1)==6,"old full row reselected preset");
check(old.getAsInteger("state")==7&&"old-write-content".equals(text(db,"SELECT left_points FROM preset_case_table WHERE _id=1"))&&"edited-name".equals(text(db,"SELECT show_name FROM preset_case_table WHERE _id=1")),"guard changed original values or lost content");
ContentValues targetOld=new ContentValues();targetOld.put("state",10);targetOld.put("left_option",2);
check(update(module,db,1,2,targetOld)==1&&state(db,TABLES[1],2)==11&&number(db,"SELECT left_option FROM import_case_table WHERE _id=2")==2,"old target row cleared selected bit/content");
check(select(module,db,tagged(0,2,"lease2")).getBoolean("ok",false),"new tagged choice");
check(!release(module,db,"lease1").getBoolean("released",true),"old release removed newer lease");
Bundle rollback=tagged(0,1,"lease1");rollback.putString("expectedLeaseTag","lease1");error(select(module,db,rollback),"stale_lease");
check(state(db,TABLES[0],2)==7&&state(db,TABLES[0],1)==6,"old rollback replaced new choice");
check(!release(module,db,"cancel-before-select").getBoolean("released",true),"absent release claims removal");
error(select(module,db,tagged(1,2,"cancel-before-select")),"stale_lease");
rollback=tagged(0,1,"lease2");rollback.putString("expectedLeaseTag","lease2");check(select(module,db,rollback).getBoolean("ok",false)&&state(db,TABLES[0],1)==7,"latest CAS rollback failed");
check(release(module,db,"lease2").getBoolean("released",false),"matching release failed");
check(update(module,db,1,2,targetOld)==1&&state(db,TABLES[1],2)==10,"released lease still guarded user edit");
select(module,db,tagged(1,2,"featureoff"));FeatureSettings.enabled=false;
check(update(module,db,0,1,old)==1&&state(db,TABLES[0],1)==7,"featureoff changed OEM update");FeatureSettings.enabled=true;
error(select(module,db,tagged(1,2,"featureoff")),"stale_lease");
select(module,db,tagged(1,2,"masteroff"));FeatureSettings.master=false;
check(update(module,db,0,1,old)==1&&state(db,TABLES[0],1)==7,"game master off changed OEM update");FeatureSettings.master=true;
error(select(module,db,tagged(1,2,"masteroff")),"stale_lease");
select(module,db,tagged(1,2,"otheruid"));Binder.uid=20002;
check(update(module,db,0,1,old)==1&&state(db,TABLES[0],1)==7,"other UID update guarded");
error(release(module,db,"otheruid"),"caller_uid");Binder.uid=10001;
error(select(module,db,tagged(1,2,"otheruid")),"stale_lease");
select(module,db,tagged(1,2,"exception"));RuntimeException original=new IllegalStateException("original OEM update failure");TgkDataProvider.updateError=original;TgkDataProvider.updateCalls=0;
try{update(module,db,0,1,old);throw new AssertionError("OEM exception swallowed");}catch(RuntimeException e){check(e==original&&TgkDataProvider.updateCalls==1,"OEM exception changed or update repeated");}finally{TgkDataProvider.updateError=null;}
HookTelemetry.fail=true;check(update(module,db,0,1,old)==1&&state(db,TABLES[0],1)==6,"logging failure changed guarded write");HookTelemetry.fail=false;
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);select(module,db,tagged(1,2,"schema-lease"));sql(db,"ALTER TABLE preset_case_table RENAME COLUMN state TO old_state");
ContentValues values=new ContentValues();values.put("state",7);RuntimeException original=new IllegalStateException("original update failure after schema change");TgkDataProvider.updateError=original;TgkDataProvider.updateCalls=0;
try{update(module,db,0,1,values);throw new AssertionError("schema passthrough missed OEM failure");}catch(RuntimeException e){check(e==original&&TgkDataProvider.updateCalls==1,"schema diagnostic changed original update");}finally{TgkDataProvider.updateError=null;}
Bundle rollback=tagged(0,1,"schema-lease");rollback.putString("expectedLeaseTag","schema-lease");error(select(module,db,rollback),"stale_lease");
check(number(db,"SELECT old_state FROM preset_case_table WHERE _id=1")==6,"guard synthesized schema update");
}
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
fill(db);Bundle b=cancel(module,db,"cancel-atomic-before",0,1);check(b.getBoolean("ok",false)&&!b.getBoolean("restored",true),"preselect cancel changed DB");
error(select(module,db,tagged(1,2,"cancel-atomic-before")),"stale_lease");check(state(db,TABLES[0],1)==7,"late select after cancel committed");
select(module,db,tagged(1,2,"cancel-atomic-after"));b=cancel(module,db,"cancel-atomic-after",0,1);
check(b.getBoolean("ok",false)&&b.getBoolean("restored",false)&&b.getBoolean("released",false)&&b.getInt("tableId",-1)==0&&b.getLong("caseId",-1)==1,"atomic restore/release response");
check(state(db,TABLES[0],1)==7&&state(db,TABLES[1],2)==10,"atomic cancel did not restore prior scheme");
error(select(module,db,tagged(1,2,"cancel-atomic-after")),"stale_lease");
select(module,db,tagged(1,2,"cancel-older"));select(module,db,tagged(0,2,"cancel-newer"));b=cancel(module,db,"cancel-older",0,1);
check(b.getBoolean("ok",false)&&!b.getBoolean("released",true)&&!b.getBoolean("restored",true)&&state(db,TABLES[0],2)==7,"old atomic cancel undid newer selection");
select(module,db,tagged(1,2,"cancel-transaction-fails"));db.execCalls=0;db.failExec=2;
error(cancel(module,db,"cancel-transaction-fails",0,1),"database_error");db.failExec=-1;
check(state(db,TABLES[0],1)==6&&state(db,TABLES[1],2)==11,"failed cancel partially restored selection");
Bundle same=tagged(1,2,"cancel-transaction-fails");same.putString("expectedLeaseTag","cancel-transaction-fails");check(select(module,db,same).getBoolean("ok",false),"failed cancel cleared/retired lease");
b=cancel(module,db,"cancel-transaction-fails",0,1);check(b.getBoolean("ok",false)&&b.getBoolean("restored",false),"failed cancel could not retry");
}
System.out.println("PASS production ShoulderSelectionStore: "+checks+" checks; real SQLite cross-table commit, rollback, readers, target integrity and OEM passthrough.");
System.out.println("LIMIT: JVM transport/Binder/Input are doubles; SQLite is real. No Android device or physical shoulder validation.");
}}
'''

def main():
    with tempfile.TemporaryDirectory(prefix='ls-shoulder-selection-store-') as temporary:
        directory = Path(temporary)
        for name, content in STUBS.items():
            path = directory / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
        source = directory / 'ls/augment/com/hook/ShoulderSelectionStore.java'
        source.write_bytes((ROOT / 'android/app/src/main/java/ls/augment/com/hook/ShoulderSelectionStore.java').read_bytes())
        (source.parent / 'TestShoulderSelectionStore.java').write_text(TEST, encoding='utf-8')
        classes = directory / 'classes'
        classes.mkdir()
        subprocess.run([str(JDK / 'javac.exe'), '-encoding', 'UTF-8', '-cp', str(SQLITE),
                        '-d', str(classes), *map(str, directory.rglob('*.java'))], check=True)
        subprocess.run([str(JDK / 'java.exe'), '-cp', os.pathsep.join([str(classes), str(SQLITE)]),
                        'ls.augment.com.hook.TestShoulderSelectionStore'], check=True)

if __name__ == '__main__':
    main()
