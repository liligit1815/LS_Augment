"""Exercise production shoulder switching with controlled OEM and Android boundaries.

The model follows the inspected GameSpace 261 (2601091520) selection/data
contracts. This is a JVM scheduling regression, not device/Xposed proof.
"""
from pathlib import Path
import argparse
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
FILES = {
    'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public final class BuildConfig {public static final int VERSION_CODE=20531;}',
    'ls/augment/com/hook/ShoulderMacroSwitchHook.java': 'package ls.augment.com.hook;final class ShoulderMacroSwitchHook {static final String CAPABILITIES_CALL="ls_augment_shoulder_macro_capabilities";}',
    'android/util/DisplayMetrics.java': 'package android.util; public class DisplayMetrics {public float density=1;}',
    'android/content/res/Configuration.java': 'package android.content.res; public class Configuration {public int orientation=2;}',
    'android/content/res/Resources.java': '''package android.content.res; public class Resources {
        public final Configuration configuration=new Configuration();
        public Configuration getConfiguration(){return configuration;}
        public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}
    }''',
    'android/net/Uri.java': '''package android.net; public class Uri {
        public final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}
        public String getAuthority(){return value.substring(value.indexOf("://")+3).split("/")[0];}public String getPath(){String tail=value.substring(value.indexOf("://")+3);int n=tail.indexOf('/');return n<0?"":tail.substring(n);}
        public String toString(){return value;}
    }''',
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {
        final Map<String,Object> values=new HashMap<>();
        public Object get(String k){return values.get(k);}public boolean containsKey(String k){return values.containsKey(k);}public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
        public void putInt(String k,int v){values.put(k,v);}public int getInt(String k){return getInt(k,0);}public int getInt(String k,int d){return ((Number)values.getOrDefault(k,d)).intValue();}
        public void putLong(String k,long v){values.put(k,v);}public long getLong(String k){return getLong(k,0L);}public long getLong(String k,long d){return ((Number)values.getOrDefault(k,d)).longValue();}
        public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}
    }''',
    'android/os/Process.java': 'package android.os;public class Process {public static int myUid(){return 10285;}public static int myPid(){return 3344;}}',
    'android/os/Binder.java': 'package android.os;public class Binder {public static int uid=10285;public static int getCallingUid(){return uid;}}',
    'android/os/Looper.java': '''package android.os;public class Looper {
        private static final Looper MAIN=new Looper();private static final Thread MAIN_THREAD=Thread.currentThread();public static Looper getMainLooper(){return MAIN;}
        public static Looper myLooper(){return Thread.currentThread()==MAIN_THREAD?MAIN:null;}
    }''',
    'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
        public static final Queue<Runnable> tasks=new java.util.concurrent.ConcurrentLinkedQueue<>();
        public Handler(){}public Handler(Looper l){}public boolean post(Runnable r){tasks.add(r);return true;}
        public boolean postDelayed(Runnable r,long n){tasks.add(r);return true;}public void removeMessages(int i){}
        public void handleMessage(Message m){}public boolean sendMessage(Message m){return post(()->{handleMessage(m);m.recycle();});}
        public boolean sendMessageDelayed(Message m,long delay){return sendMessage(m);}public Message obtainMessage(int what,Object obj){Message m=Message.obtain();m.what=what;m.obj=obj;return m;}
        public Looper getLooper(){return Looper.getMainLooper();}
        public void removeCallbacks(Runnable r){tasks.remove(r);}public static int drain(){int n=0;Runnable r;while((r=tasks.poll())!=null){r.run();n++;}return n;}
    }''',
    'android/os/Message.java': '''package android.os;public class Message {
        public int what,arg1,arg2;public Object obj;public boolean recycled;public static int copies,recycles;
        public static Message obtain(){return new Message();}public static Message obtain(Message src){if(src.recycled)throw new IllegalStateException("copy of recycled message");Message m=new Message();m.what=src.what;m.arg1=src.arg1;m.arg2=src.arg2;m.obj=src.obj;copies++;return m;}
        public void recycle(){if(recycled)throw new IllegalStateException("message recycled twice");recycled=true;what=-1;arg1=arg2=0;obj=null;recycles++;}
    }''',
    'android/os/AsyncTask.java': '''package android.os;import java.util.concurrent.*;public abstract class AsyncTask<P,U,R> {
        public static final ExecutorService SERIAL_EXECUTOR=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"OEM-serial-test");t.setDaemon(true);return t;});
        protected abstract R doInBackground(P...args);protected void onPostExecute(R result){}
        @SafeVarargs public final AsyncTask<P,U,R> execute(P...args){SERIAL_EXECUTOR.execute(()->{R result=doInBackground(args);new Handler(Looper.getMainLooper()).post(()->onPostExecute(result));});return this;}
    }''',
    'android/content/Intent.java': '''package android.content;import java.util.*;public class Intent {
        final Map<String,Object> values=new HashMap<>();public Intent putExtra(String k,String v){values.put(k,v);return this;}public String getStringExtra(String k){return (String)values.get(k);}
    }''',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect {
        public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
        public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}public int width(){return right-left;}public int height(){return bottom-top;}
        public int centerX(){return (left+right)/2;}public int centerY(){return (top+bottom)/2;}
    }''',
    'android/content/Context.java': '''package android.content;public class Context {
        public final android.content.res.Resources resources=new android.content.res.Resources();
        public final ContentResolver resolver;public Context(){this(new ContentResolver());}public Context(ContentResolver r){resolver=r;}public Context getApplicationContext(){return this;}
        public android.content.res.Resources getResources(){return resources;}public ContentResolver getContentResolver(){return resolver;}
        public String getPackageName(){return "cn.nubia.gamelauncher";}
    }''',
    'android/content/ContentValues.java': '''package android.content;import java.util.*;public class ContentValues extends HashMap<String,Object>{
        public ContentValues(){}public ContentValues(ContentValues c){super(c);}
        public void put(String k,String v){super.put(k,v);}public void put(String k,Integer v){super.put(k,v);}
        public void put(String k,Long v){super.put(k,v);}public void put(String k,Boolean v){super.put(k,v);}
        public Integer getAsInteger(String k){Object v=get(k);return v==null?null:((Number)v).intValue();}
        public Long getAsLong(String k){Object v=get(k);return v==null?null:((Number)v).longValue();}
        public String getAsString(String k){Object v=get(k);return v==null?null:v.toString();}
    }''',
    'android/content/ContentProviderOperation.java': '''package android.content;import android.net.Uri;public class ContentProviderOperation {
        public final Uri uri;public final ContentValues values;public final String selection;public final String[] args;
        private ContentProviderOperation(Builder b){uri=b.uri;values=b.values;selection=b.selection;args=b.args;}
        public static Builder newUpdate(Uri u){return new Builder(u);}public static class Builder {
            final Uri uri;ContentValues values=new ContentValues();String selection;String[] args;
            Builder(Uri u){uri=u;}public Builder withValue(String k,Object v){values.put(k,v);return this;}
            public Builder withValues(ContentValues v){values=new ContentValues(v);return this;}
            public Builder withSelection(String s,String[] a){selection=s;args=a;return this;}
            public Builder withExpectedCount(int n){return this;}public ContentProviderOperation build(){return new ContentProviderOperation(this);}
        }
    }''',
    'android/content/ContentProviderResult.java': 'package android.content;public class ContentProviderResult {public final Integer count;public ContentProviderResult(int c){count=c;}}',
    'android/database/Cursor.java': '''package android.database;import java.util.*;import cn.nubia.tgk.data.TgkData;public class Cursor implements AutoCloseable {
        final List<Object[]> rows=new ArrayList<>();final String[] columns;int index=-1;public Cursor(List<TgkData> r){columns=new String[]{"_id","state","show_name","package_name"};for(TgkData d:r)rows.add(new Object[]{d.ID,d.state,d.showName,d.packageName});}
        public Cursor(String[] c,List<Object[]> r){columns=c;rows.addAll(r);}public boolean moveToNext(){return ++index<rows.size();}
        public boolean moveToFirst(){index=0;return !rows.isEmpty();}public int getCount(){return rows.size();}public int getColumnCount(){return columns.length;}
        public int getColumnIndex(String k){for(int i=0;i<columns.length;i++)if(columns[i].equals(k))return i;return -1;}
        public int getColumnIndexOrThrow(String k){int n=getColumnIndex(k);if(n<0)throw new IllegalArgumentException(k);return n;}
        public long getLong(int n){return ((Number)rows.get(index)[n]).longValue();}public int getInt(int n){return ((Number)rows.get(index)[n]).intValue();}
        public String getString(int n){Object value=rows.get(index)[n];return value==null?null:value.toString();}public boolean isNull(int n){return rows.get(index)[n]==null;}public void close(){}
    }''',
    'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;import android.os.Bundle;import cn.nubia.tgk.data.*;import java.util.*;import java.util.concurrent.*;
    public class ContentResolver {
        public final Map<String,TgkData> database=new ConcurrentHashMap<>();public volatile boolean failUpdate,failQuery;
        public volatile boolean macroCapabilitiesMissing,macroCapabilitiesOk=true,macroCapabilitiesReady=true;public volatile int macroCapabilitiesVersion=ls.augment.com.BuildConfig.VERSION_CODE,macroCapabilitiesCalls;
        public volatile CountDownLatch entered,release,commitEntered,commitRelease;public volatile int writes,queries,batches;public volatile boolean failUpdateOnce;
        public void block(){entered=new CountDownLatch(1);release=new CountDownLatch(1);}
        public void blockCommit(){commitEntered=new CountDownLatch(1);commitRelease=new CountDownLatch(1);}
        public void unblockCommit(){CountDownLatch latch=commitRelease;if(latch!=null)latch.countDown();commitRelease=null;}
        public void commitGate(){CountDownLatch latch=commitRelease;if(latch!=null){commitEntered.countDown();try{if(!latch.await(5,TimeUnit.SECONDS))throw new IllegalStateException("test commit latch timeout");}catch(InterruptedException e){throw new IllegalStateException(e);}}}
        public void unblock(){CountDownLatch latch=release;if(latch!=null)latch.countDown();release=null;}
        public void gate(){CountDownLatch latch=release;if(latch!=null){entered.countDown();try{if(!latch.await(5,TimeUnit.SECONDS))throw new IllegalStateException("test storage latch timeout");}catch(InterruptedException e){Thread.currentThread().interrupt();throw new IllegalStateException(e);}}}
        public static String key(int table,long id){return table+":"+id;}public void put(int table,TgkData d){database.put(key(table,d.ID),d.copy());}
        public List<TgkData> rows(int table,String pkg){if(failQuery)throw new IllegalStateException("DB query failure");queries++;
            List<TgkData> list=new ArrayList<>();for(Map.Entry<String,TgkData> e:database.entrySet())if(e.getKey().startsWith(table+":")&&(pkg==null||pkg.equals(e.getValue().packageName)))list.add(e.getValue().copy());
            list.sort(table==0?Comparator.comparingLong(d->d.ID):(a,b)->Long.compare(b.ID,a.ID));return list;}
        public long selected(String pkg){long id=-1;for(int table=0;table<=1;table++)for(TgkData d:rows(table,pkg))if((d.state&1)!=0)id=d.ID;return id;}
        public int update(Uri uri,ContentValues values,String selection,String[] args){return new cn.nubia.tgk.data.TgkDataProvider(this).update(uri,values,selection,args);}
        public int updateRaw(Uri uri,ContentValues values,String selection,String[] args){gate();if(failUpdate)throw new IllegalStateException("DB update failure");
            int table=uri.toString().contains("import_case_table")?1:0;long id=-1;String pkg=null;
            if(selection!=null&&selection.contains("_id")&&args!=null&&args.length>0)id=Long.parseLong(args[0]);
            else if(args!=null&&args.length>0)pkg=args[0];int count=0;
            for(Map.Entry<String,TgkData> e:database.entrySet())if(e.getKey().startsWith(table+":")){
                TgkData d=e.getValue();if(id>=0&&d.ID!=id||pkg!=null&&!pkg.equals(d.packageName))continue;
                TgkData next=values.get("fixture_data") instanceof TgkData?((TgkData)values.get("fixture_data")).copy():d.copy();
                Integer state=values.getAsInteger("state");if(state!=null)next.state=state;database.put(e.getKey(),next);count++;writes++;
            }return count;}
        public ContentProviderResult[] applyBatch(String authority,ArrayList<ContentProviderOperation> ops){batches++;ContentProviderResult[] out=new ContentProviderResult[ops.size()];
            for(int i=0;i<ops.size();i++){ContentProviderOperation op=ops.get(i);out[i]=new ContentProviderResult(update(op.uri,op.values,op.selection,op.args));}return out;}
        public android.database.Cursor query(Uri uri,String[] projection,String selection,String[] args,String order){return new android.database.Cursor(rows(uri.toString().contains("import_case_table")?1:0,args==null?null:args[0]));}
        public Bundle call(Uri uri,String method,String arg,Bundle b){if(uri.getAuthority().equals("cn.nubia.tgk.data.TgkDataProvider"))return new cn.nubia.tgk.data.TgkDataProvider(this).call(method,arg,b);
            if(method.equals("ls_augment_shoulder_macro_capabilities")){macroCapabilitiesCalls++;if(macroCapabilitiesMissing)return null;Bundle out=new Bundle();out.putBoolean("ok",macroCapabilitiesOk);out.putBoolean("ready",macroCapabilitiesReady);out.putInt("versionCode",macroCapabilitiesVersion);return out;}
            Bundle out=new Bundle();out.putBoolean("ok",true);out.putBoolean("hasTouchLink",true);out.putString("hasTouchLinkName","macro:"+b.getString("touch_key_name"));return out;}
    }''',
    'android/content/ContentProvider.java': '''package android.content;public class ContentProvider {
        protected final Context context;public ContentProvider(Context c){context=c;}public Context getContext(){return context;}
    }''',
    'android/database/sqlite/SQLiteOpenHelper.java': '''package android.database.sqlite;public class SQLiteOpenHelper {
        final SQLiteDatabase db;public SQLiteOpenHelper(android.content.ContentResolver r){db=new SQLiteDatabase(r);}public SQLiteDatabase getWritableDatabase(){return db;}
    }''',
    'android/database/sqlite/SQLiteDatabase.java': '''package android.database.sqlite;import android.content.ContentResolver;import android.database.Cursor;import cn.nubia.tgk.data.TgkData;import java.util.*;
    public class SQLiteDatabase {
        final ContentResolver resolver;Map<String,TgkData> stage;boolean successful;int changed;
        public SQLiteDatabase(ContentResolver r){resolver=r;}
        public void beginTransaction(){resolver.gate();stage=new LinkedHashMap<>();for(Map.Entry<String,TgkData> e:resolver.database.entrySet())stage.put(e.getKey(),e.getValue().copy());successful=false;}
        public void setTransactionSuccessful(){successful=true;}public void endTransaction(){if(successful){resolver.database.clear();resolver.database.putAll(stage);resolver.commitGate();}stage=null;}
        public void execSQL(String sql,Object[] args){if(resolver.failUpdate||resolver.failUpdateOnce){resolver.failUpdateOnce=false;throw new IllegalStateException("DB update failure");}changed=0;int table=sql.contains("import_case_table")?1:0;
            String pkg=args[args.length-1].toString();Long id=sql.contains("_id=?")?((Number)args[0]).longValue():null;
            for(Map.Entry<String,TgkData> e:stage.entrySet()){TgkData d=e.getValue();if(!e.getKey().startsWith(table+":")||!d.packageName.equals(pkg)||id!=null&&d.ID!=id)continue;
                if(sql.contains("~1")){if((d.state&1)!=0){d.state&=~1;changed++;}}else{d.state|=1;changed++;}resolver.writes++;}}
        public Cursor rawQuery(String sql,String[] args){if(resolver.failQuery)throw new IllegalStateException("DB query failure");resolver.queries++;
            if(sql.startsWith("PRAGMA")){return new Cursor(new String[]{"name","type","pk"},Arrays.asList(new Object[]{"_id","INTEGER",1},new Object[]{"state","INTEGER",0},new Object[]{"package_name","TEXT",0}));}
            if(sql.equals("SELECT changes()"))return new Cursor(new String[]{"changes()"},Collections.singletonList(new Object[]{changed}));
            int table=sql.contains("import_case_table")?1:0;List<Object[]> out=new ArrayList<>();Map<String,TgkData> data=stage==null?resolver.database:stage;
            if(sql.contains("count(*)")){int count=0;for(Map.Entry<String,TgkData> e:data.entrySet())if(e.getKey().startsWith(table+":")&&e.getValue().packageName.equals(args[0])&&(e.getValue().state&1)!=0)count++;return new Cursor(new String[]{"count(*)"},Collections.singletonList(new Object[]{count}));}
            for(Map.Entry<String,TgkData> e:data.entrySet()){TgkData d=e.getValue();if(e.getKey().startsWith(table+":")&&d.ID==Long.parseLong(args[0])&&(args.length<2||d.packageName.equals(args[1])))out.add(sql.contains("state, package_name")?new Object[]{d.state,d.packageName}:sql.startsWith("SELECT package_name")?new Object[]{d.packageName}:new Object[]{d.state});}
            return new Cursor(sql.contains("state, package_name")?new String[]{"state","package_name"}:sql.startsWith("SELECT package_name")?new String[]{"package_name"}:new String[]{"state"},out);
        }
    }''',
    'cn/nubia/tgk/data/TgkDataContract.java': '''package cn.nubia.tgk.data;public class TgkDataContract {public static class TgkEntry {
        public static final String PRESET_CASE_TABLE_NAME="preset_case_table",IMPORT_CASE_TABLE_NAME="import_case_table",_ID="_id",TGK_CASE_STATE="state",TGK_PACKAGE_NAME="package_name";
    }}''',
    'cn/nubia/tgk/data/TgkDataProvider.java': '''package cn.nubia.tgk.data;import android.content.*;import android.os.Bundle;public class TgkDataProvider extends ContentProvider {
        public static final String AUTHORITY="cn.nubia.tgk.data.TgkDataProvider";public final android.database.sqlite.SQLiteOpenHelper mSqliteHelper;
        public TgkDataProvider(ContentResolver r){super(new Context(r));mSqliteHelper=new android.database.sqlite.SQLiteOpenHelper(r);}
        public Bundle call(String method,String arg,Bundle b){try{return (Bundle)ls.augment.com.hook.AugmentModule.dispatch(this,"call",new Class[]{String.class,String.class,Bundle.class},new Object[]{method,arg,b},()->null);}catch(Throwable t){throw new IllegalStateException(t);}}
        public int update(android.net.Uri uri,ContentValues values,String where,String[] args){try{return (Integer)ls.augment.com.hook.AugmentModule.dispatch(this,"update",new Class[]{android.net.Uri.class,ContentValues.class,String.class,String[].class},new Object[]{uri,values,where,args},()->native_update(uri,values,where,args));}catch(Throwable t){throw new IllegalStateException(t);}}
        public int native_update(android.net.Uri uri,ContentValues values,String where,String[] args){return context.resolver.updateRaw(uri,values,where,args);}
    }''',
    'android/util/Log.java': '''package android.util;public class Log {
        public static final java.util.List<String> messages=new java.util.concurrent.CopyOnWriteArrayList<>();
        public static int e(String tag,String msg){return write("e",tag,msg,null);}public static int e(String tag,String msg,Throwable t){return write("e",tag,msg,t);}
        public static int i(String tag,String msg){return write("i",tag,msg,null);}public static int d(String tag,String msg){return write("d",tag,msg,null);}public static int w(String tag,String msg){return write("w",tag,msg,null);}
        private static int write(String level,String tag,String msg,Throwable error){
            try{return (Integer)ls.augment.com.hook.AugmentModule.dispatch(Log.class,level,error==null?new Class[]{String.class,String.class}:new Class[]{String.class,String.class,Throwable.class},error==null?new Object[]{tag,msg}:new Object[]{tag,msg,error},()->{messages.add(tag+":"+msg);return 0;});}
            catch(Throwable t){throw new IllegalStateException(t);}
        }
    }''',
    'cn/nubia/tgk/data/TgkData.java': '''package cn.nubia.tgk.data;import android.graphics.Rect;public class TgkData {
        public long ID;public int state,isLandscape=1,change;public long updateTime;public String packageName="game.one",showName="",originalName="",uniqueId="",shotPicture="";
        public boolean mainSw=true,vibrateSw=true;public boolean[] optionSwArray={true,true,false};public int[] optionArray={0,0,9},sensitivityArray={1,1},rapidFireCountArray={4,4,4},setLinkFlagArray={0,0,0};
        public Rect[][] pointsArray=new Rect[3][2];public Object picture;
        public TgkData(){}public TgkData(long id,String name,int base,int leftMode){ID=id;showName=name;state=4;optionArray[0]=leftMode;for(int i=0;i<3;i++)for(int j=0;j<2;j++)pointsArray[i][j]=new Rect(base+i*100+j*20,40,base+i*100+j*20+10,50);}
        public TgkData copy(){TgkData d=new TgkData();d.ID=ID;d.state=state;d.packageName=packageName;d.showName=showName;d.mainSw=mainSw;d.vibrateSw=vibrateSw;d.isLandscape=isLandscape;
            d.optionArray=optionArray.clone();d.optionSwArray=optionSwArray.clone();d.sensitivityArray=sensitivityArray.clone();d.rapidFireCountArray=rapidFireCountArray.clone();d.setLinkFlagArray=setLinkFlagArray.clone();
            for(int i=0;i<3;i++)for(int j=0;j<2;j++)d.pointsArray[i][j]=pointsArray[i][j]==null?null:new Rect(pointsArray[i][j]);return d;}
        public static int getTableId(int s){return (s&8)!=0||((s&4)==0)?1:0;}public int getIsLandscape(){return isLandscape;}
    }''',
    'cn/nubia/tgk/data/TgkGameInfo.java': '''package cn.nubia.tgk.data;import java.util.*;public class TgkGameInfo {
        public String gameName="game.one";public int selectedTableId,selectedCasePosition,isLandscape=1;public Object picture;
        public boolean topVisualEffectSw=true,centerVisualEffectSw=true;public int centerVisualEffectTransparency=100;
        public ArrayList<TgkData> presetTableList=new ArrayList<>(),importTableList=new ArrayList<>();
        public TgkGameInfo(){}public TgkGameInfo(String p){gameName=p;}public TgkData getSelectedCaseData(){ArrayList<TgkData> l=selectedTableId==1?importTableList:presetTableList;return l.isEmpty()?null:l.get(selectedCasePosition);}
        public int getIsLandscape(){return isLandscape;}
    }''',
    'cn/nubia/tgk/proxy/InputManagerProxy.java': '''package cn.nubia.tgk.proxy;import android.content.Context;import android.graphics.Rect;import java.util.*;
    public class InputManagerProxy {
        public final Context mContext;public final android.hardware.input.InputManager mInputManager;public final Map<Integer,int[]> points=new HashMap<>();public final Map<Integer,Integer> modes=new HashMap<>();
        public volatile boolean failPoints,failMode,failPointsOnce,failModeOnce,mutatePointArguments,gameEnabled;public volatile long macroCaseId=-1;public volatile int applies,pointCalls;public final java.util.List<Long> appliedIds=new java.util.concurrent.CopyOnWriteArrayList<>();
        public InputManagerProxy(Context c){mContext=c;mInputManager=new android.hardware.input.InputManager(this);}
        private void input(String name,Class<?>[] types,Object...args){try{android.hardware.input.InputManager.class.getDeclaredMethod(name,types).invoke(mInputManager,args);}catch(Exception e){android.util.Log.e("InputManagerProxy",name+" failed");}}
        private void call(String method,Class<?>[] types,Object[] args,ls.augment.com.hook.AugmentModule.Original original){try{ls.augment.com.hook.AugmentModule.dispatch(this,method,types,args,original);}catch(Throwable t){throw new IllegalStateException(t);}}
        public void setTgkPoint(int[] a,int[] b,int key){call("setTgkPoint",new Class[]{int[].class,int[].class,int.class},new Object[]{a,b,key},()->{
            input("setTgkPoint",new Class[]{int[].class,int[].class,int.class},a,b,key);return null;});}
        public void setTgkMode(int mode,int key){call("setTgkMode",new Class[]{int.class,int.class},new Object[]{mode,key},()->{input("setTgkMode",new Class[]{int.class,int.class},mode,key);return null;});}
        public void sendTgkRectsToNative(Rect[][] r){for(int i=0;i<3;i++){Rect a=r[i][0],b=r[i][1];setTgkPoint(a==null?new int[]{-1,-1}:new int[]{a.centerX(),a.centerY()},b==null?new int[]{-1,-1}:new int[]{b.centerX(),b.centerY()},new int[]{137,138,136}[i]);}}
        public void setGameKeyLinkFunctionEnable(int key){input(key==137?"setGameLeftKeyLinkFunction":key==138?"setGameRightKeyLinkFunction":"setGameMiddleKeyLinkFunction",new Class[]{int.class},key);}
        public void setDefaultGameKeyLinkFunctionEnable(int n){for(String name:new String[]{"setGameLeftKeyLinkFunction","setGameRightKeyLinkFunction","setGameMiddleKeyLinkFunction"})input(name,new Class[]{int.class},n);}
        public void setGameKeyEnable(boolean b){input("setGameKeyEnable",new Class[]{boolean.class,Context.class},b,mContext);}public void setLeftTgkEnable(boolean b){input("setLeftTgkEnable",new Class[]{boolean.class},b);}
        public void setRightTgkEnable(boolean b){input("setRightTgkEnable",new Class[]{boolean.class},b);}public void setMiddleTgkEnable(boolean b){input("setMiddleTgkEnable",new Class[]{boolean.class},b);}public void setTgkSensitivity(int n,int k){input("setTgkSensitivity",new Class[]{int.class,int.class},n+1,k);}
        public void setTgkRapidFireCount(int n,int k){input("setTgkRapidFireCount",new Class[]{int.class,int.class},n,k);}public void setTouchHapticFeedbackEnable(boolean b){input("setTouchHapticFeedbackEnable",new Class[]{boolean.class},b);}
        public void releaseTgk(){input("releaseTgk",new Class[]{});}
        public void setTgkTopEffectEnable(boolean b){input("setTgkTopEffectEnable",new Class[]{boolean.class},b);}public void setTgkCenterEffectEnable(boolean b){input("setTgkCenterEffectEnable",new Class[]{boolean.class},b);}public void setTgkTransparency(int n){input("setTgkTransparency",new Class[]{int.class},n);}
    }''',
    'android/hardware/input/InputManager.java': '''package android.hardware.input;import cn.nubia.tgk.proxy.InputManagerProxy;public class InputManager {
        public final InputManagerProxy owner;public InputManager(InputManagerProxy p){owner=p;}
        private void dispatch(String name,Class<?>[] types,Object[] args,ls.augment.com.hook.AugmentModule.Original body){try{ls.augment.com.hook.AugmentModule.dispatch(this,name,types,args,body);}catch(Throwable t){if(t instanceof RuntimeException)throw (RuntimeException)t;throw new IllegalStateException(t);}}
        public void setTgkPoint(int[] a,int[] b,int key){dispatch("setTgkPoint",new Class[]{int[].class,int[].class,int.class},new Object[]{a,b,key},()->{owner.pointCalls++;if(owner.failPoints||owner.failPointsOnce){owner.failPointsOnce=false;throw new IllegalStateException("input point failure");}owner.points.put(key,new int[]{a[0],a[1],b[0],b[1]});if(owner.mutatePointArguments){a[0]+=50;b[0]+=50;}return null;});}
        public void setTgkMode(int mode,int key){dispatch("setTgkMode",new Class[]{int.class,int.class},new Object[]{mode,key},()->{if(owner.failMode||owner.failModeOnce){owner.failModeOnce=false;throw new IllegalStateException("input mode failure");}owner.modes.put(key,mode);return null;});}
        public void setGameLeftKeyLinkFunction(int key){link("setGameLeftKeyLinkFunction",key);}public void setGameRightKeyLinkFunction(int key){link("setGameRightKeyLinkFunction",key);}public void setGameMiddleKeyLinkFunction(int key){link("setGameMiddleKeyLinkFunction",key);}
        private void link(String name,int key){dispatch(name,new Class[]{int.class},new Object[]{key},()->{if(key!=0)owner.macroCaseId=owner.mContext.resolver.selected("game.one");return null;});}
        public void setGameKeyEnable(boolean b,android.content.Context c){dispatch("setGameKeyEnable",new Class[]{boolean.class,android.content.Context.class},new Object[]{b,c},()->{owner.gameEnabled=b;return null;});}
        public void setLeftTgkEnable(boolean b){bool("setLeftTgkEnable",b);}public void setRightTgkEnable(boolean b){bool("setRightTgkEnable",b);}public void setMiddleTgkEnable(boolean b){bool("setMiddleTgkEnable",b);}
        public void setTouchHapticFeedbackEnable(boolean b){bool("setTouchHapticFeedbackEnable",b);}public void setTgkTopEffectEnable(boolean b){bool("setTgkTopEffectEnable",b);}public void setTgkCenterEffectEnable(boolean b){bool("setTgkCenterEffectEnable",b);}
        private void bool(String name,boolean b){dispatch(name,new Class[]{boolean.class},new Object[]{b},()->null);}
        public void setTgkSensitivity(int n,int key){ints("setTgkSensitivity",n,key);}public void setTgkRapidFireCount(int n,int key){ints("setTgkRapidFireCount",n,key);}
        private void ints(String name,int n,int key){dispatch(name,new Class[]{int.class,int.class},new Object[]{n,key},()->null);}
        public void setTgkTransparency(int n){dispatch("setTgkTransparency",new Class[]{int.class},new Object[]{n},()->null);}
        public void releaseTgk(){dispatch("releaseTgk",new Class[]{},new Object[]{},()->null);}
    }''',
    'cn/nubia/tgk/TgkHelper.java': '''package cn.nubia.tgk;import android.content.*;import cn.nubia.tgk.data.*;import cn.nubia.tgk.proxy.InputManagerProxy;import java.util.*;
    public class TgkHelper {
        public static boolean IS_SUPPORT_MIDDLE_TGK=false;
        public static void loadingTgkCases(ContentResolver c,TgkGameInfo info){info.presetTableList=new ArrayList<>(c.rows(0,info.gameName));info.importTableList=new ArrayList<>(c.rows(1,info.gameName));
            for(int table=0;table<=1;table++){List<TgkData> l=table==0?info.presetTableList:info.importTableList;for(int i=0;i<l.size();i++)if((l.get(i).state&1)!=0){info.selectedTableId=table;info.selectedCasePosition=i;}}}
        public static ContentValues getContentValuesByTgkDataNoPicture(TgkData d){ContentValues v=new ContentValues();v.put("state",d.state);v.put("fixture_data",d.copy());return v;}
        public static void updateTgkCaseExceptPicture(ContentResolver c,int table,TgkData d){int n=c.update(getUriByTableId(table),getContentValuesByTgkDataNoPicture(d),"_id=?",new String[]{""+d.ID});if(n!=1)throw new IllegalStateException("missing case row");}
        public static android.net.Uri getUriByTableId(int table){return android.net.Uri.parse("content://cn.nubia.tgk.data.TgkDataProvider/"+(table==1?"import_case_table":"preset_case_table"));}
        public static TgkGameInfo getGameInfoForEnableTgk(Context c,String pkg){TgkGameInfo info=new TgkGameInfo(pkg);loadingTgkCases(c.resolver,info);return info;}
        public static void queryTgkLinkState(ContentResolver c,String pkg,long id,int state){}
        public static String getTgkLinkKey(long id,int state,int key){return TgkData.getTableId(state)+"|"+id+"|"+key;}
        public static void setTgkParaToNative(InputManagerProxy p,TgkData d,TgkGameInfo info,int orientation){p.applies++;p.appliedIds.add(d.ID);p.setDefaultGameKeyLinkFunctionEnable(0);p.setGameKeyEnable(d.mainSw);if(!d.mainSw){p.setLeftTgkEnable(false);p.setRightTgkEnable(false);p.setMiddleTgkEnable(false);return;}
            p.sendTgkRectsToNative(d.pointsArray);for(int i=0;i<3;i++)if(d.optionSwArray[i]){int key=new int[]{137,138,136}[i];if(d.optionArray[i]==4)p.setGameKeyLinkFunctionEnable(key);if(d.optionArray[i]==6)p.setTgkRapidFireCount(d.rapidFireCountArray[i],key);p.setTgkMode(d.optionArray[i],key);}
            p.setLeftTgkEnable(d.optionSwArray[0]);p.setRightTgkEnable(d.optionSwArray[1]);p.setMiddleTgkEnable(d.optionSwArray[2]);p.setTgkSensitivity(d.sensitivityArray[0],137);p.setTgkSensitivity(d.sensitivityArray[1],138);
            p.setTouchHapticFeedbackEnable(d.vibrateSw);p.setTgkTopEffectEnable(info.topVisualEffectSw);p.setTgkCenterEffectEnable(info.centerVisualEffectSw);p.setTgkTransparency(info.centerVisualEffectTransparency);}
        public static void setTgkParaToNativeEnable(InputManagerProxy p,TgkData d,TgkGameInfo info,int orientation){setTgkParaToNative(p,d,info,orientation);}
        public static void updateValidRect(TgkData d,int orientation){}
        public static void reportClickTgkCaseButton(Context c,String pkg){}
    }''',
    'cn/nubia/tgk/widget/TgkCaseShowView.java': '''package cn.nubia.tgk.widget;public class TgkCaseShowView {
        public String title="A";public boolean normal=true;public boolean getIsNormal(){return normal;}
        public void setTgkCaseTvTitle(String t){title=t;}public void setTgkCaseStates(boolean b){}
    }''',
    'cn/nubia/tgk/widget/TgkShowCaseListViewAdapter.java': '''package cn.nubia.tgk.widget;import cn.nubia.tgk.data.TgkData;import java.util.*;
    public class TgkShowCaseListViewAdapter {
        public interface onDataChangeListener {void onChanged(int table,int index);void onTgkDataChanged(int table,TgkData d);}
        public onDataChangeListener listener;public final ArrayList<TgkData> list=new ArrayList<>();
        public void setListener(onDataChangeListener l){try{ls.augment.com.hook.AugmentModule.dispatch(this,"setListener",new Class[]{onDataChangeListener.class},new Object[]{l},()->{listener=l;return null;});}catch(Throwable t){throw new IllegalStateException(t);}}
        @SuppressWarnings("unchecked")public ArrayList<TgkData> getList(){try{return (ArrayList<TgkData>)ls.augment.com.hook.AugmentModule.dispatch(this,"getList",new Class[]{},new Object[]{},()->list);}catch(Throwable t){throw new IllegalStateException(t);}}
        public void setSelected(ArrayList<TgkData> all,int position,boolean value){try{ls.augment.com.hook.AugmentModule.dispatch(this,"setSelected",new Class[]{ArrayList.class,int.class,boolean.class},new Object[]{all,position,value},()->null);}catch(Throwable t){throw new IllegalStateException(t);}}
    }''',
    'cn/nubia/tgk/widget/TgkCaseListViewAdapter.java': '''package cn.nubia.tgk.widget;public class TgkCaseListViewAdapter {
        public class TgkCaseHolder {public android.view.ViewGroup itemView;public android.widget.TextView tv;public void onBindViewHolder(int index){}}
    }''',
    'cn/nubia/tgk/TgkService.java': '''package cn.nubia.tgk;import android.content.Context;import cn.nubia.tgk.data.*;import cn.nubia.tgk.widget.*;import cn.nubia.tgk.proxy.InputManagerProxy;
    public class TgkService {
        public final Context mContext;public String mPackageName="game.one";public TgkGameInfo mTgkGameInfo;
        public final InputManagerProxy mInputManagerProxy;public final android.os.Handler mHandler=new WorkHandler();
        public TgkCaseShowView mTgkCaseShowView=new TgkCaseShowView();public Object mTgkCaseListShowView;public TgkMapView mTgkMapView;public int originalClicks,editorOpened,lastEditorArg1,lastEditorArg2;
        public final TgkShowCaseListViewAdapter.onDataChangeListener tgkCaseListViewAdapterListener=new TgkShowCaseListViewAdapter.onDataChangeListener(){
            public void onChanged(int table,int index){mTgkGameInfo.selectedTableId=table;mTgkGameInfo.selectedCasePosition=index;mTgkCaseShowView.setTgkCaseTvTitle(mTgkGameInfo.getSelectedCaseData().showName);TgkHelper.setTgkParaToNative(mInputManagerProxy,mTgkGameInfo.getSelectedCaseData(),mTgkGameInfo,1);}
            public void onTgkDataChanged(int table,TgkData d){UiAsyncTask task=new UiAsyncTask(TgkService.this);task.setTableData(table,d);task.execute();}
        };
        public TgkService(Context c){mContext=c;mInputManagerProxy=new InputManagerProxy(c);mTgkGameInfo=TgkHelper.getGameInfoForEnableTgk(c,mPackageName);TgkHelper.setTgkParaToNative(mInputManagerProxy,mTgkGameInfo.getSelectedCaseData(),mTgkGameInfo,1);}
        public void onTgkCaseViewBottonClick(int side)throws Throwable {ls.augment.com.hook.AugmentModule.dispatch(this,"onTgkCaseViewBottonClick",new Class[]{int.class},new Object[]{side},()->{originalClicks++;return null;});}
        public void hideTgkCaseListPopView(){}public void sendMsgDelayed(int what,Object obj,int delay){}
        public void tgkCaseListPopViewScrollToPosition(int table,int index){}public void disableTgkMap(String pkg){lifecycle("disableTgkMap",new Class[]{String.class},new Object[]{pkg},()->null);}public void onDestroy(){lifecycle("onDestroy",new Class[]{},new Object[]{},()->null);}
        private void lifecycle(String name,Class<?>[] types,Object[] args,ls.augment.com.hook.AugmentModule.Original body){try{ls.augment.com.hook.AugmentModule.dispatch(this,name,types,args,body);}catch(Throwable t){throw new IllegalStateException(t);}}
        public void enableTgkMap(String pkg,int reason){lifecycle("enableTgkMap",new Class[]{String.class,int.class},new Object[]{pkg,reason},()->{mPackageName=pkg;reloadOriginal();return null;});}
        public void reload(){enableTgkMap(mPackageName,1);}private void reloadOriginal(){mTgkGameInfo=TgkHelper.getGameInfoForEnableTgk(mContext,mPackageName);TgkHelper.setTgkParaToNative(mInputManagerProxy,mTgkGameInfo.getSelectedCaseData(),mTgkGameInfo,1);}
        public int onStartCommand(android.content.Intent intent,int flags,int startId){try{return (Integer)ls.augment.com.hook.AugmentModule.dispatch(this,"onStartCommand",new Class[]{android.content.Intent.class,int.class,int.class},new Object[]{intent,flags,startId},()->0);}catch(Throwable t){throw new IllegalStateException(t);}}
        public static class UiAsyncTask extends android.os.AsyncTask<Void,Void,Void> {
            public final java.lang.ref.WeakReference<TgkService> tgkServiceWeakReference;public TgkData mTgkData;public int mTableId;
            public UiAsyncTask(TgkService s){tgkServiceWeakReference=new java.lang.ref.WeakReference<>(s);}public void setTableData(int t,TgkData d){mTableId=t;mTgkData=d;}
            @Override public Void doInBackground(Void... args){try{return (Void)ls.augment.com.hook.AugmentModule.dispatch(this,"doInBackground",new Class[]{Void[].class},new Object[]{args},()->{TgkService s=tgkServiceWeakReference.get();if(s!=null)TgkHelper.updateTgkCaseExceptPicture(s.mContext.resolver,mTableId,mTgkData);return null;});}catch(Throwable t){throw new IllegalStateException(t);}}
        }
        public static class DismissViewAsyncTask extends android.os.AsyncTask<Long,Void,Integer> {
            public final java.lang.ref.WeakReference<TgkService> tgkServiceWeakReference;public TgkGameInfo mTgkGameInfo;public boolean disableNative;
            public DismissViewAsyncTask(TgkService s){tgkServiceWeakReference=new java.lang.ref.WeakReference<>(s);}public void setTgkGameInfo(TgkGameInfo i){mTgkGameInfo=i;}
            @Override public Integer doInBackground(Long... args){try{return (Integer)ls.augment.com.hook.AugmentModule.dispatch(this,"doInBackground",new Class[]{Long[].class},new Object[]{args},()->{TgkService s=tgkServiceWeakReference.get();if(s!=null){for(TgkData d:mTgkGameInfo.presetTableList)TgkHelper.updateTgkCaseExceptPicture(s.mContext.resolver,0,d);for(TgkData d:mTgkGameInfo.importTableList)TgkHelper.updateTgkCaseExceptPicture(s.mContext.resolver,1,d);s.mTgkGameInfo=mTgkGameInfo;if(disableNative)s.mInputManagerProxy.setGameKeyEnable(false);}return 0;});}catch(Throwable t){throw new IllegalStateException(t);}}
        }
        public class WorkHandler extends android.os.Handler {
            @Override public void handleMessage(android.os.Message message){try{ls.augment.com.hook.AugmentModule.dispatch(this,"handleMessage",new Class[]{android.os.Message.class},new Object[]{message},()->{
                if(message.what==0&&mTgkMapView==null){mTgkMapView=new TgkMapView(mContext);mTgkMapView.initTgkMapView((String)message.obj);editorOpened++;lastEditorArg1=message.arg1;lastEditorArg2=message.arg2;}return null;
            });}catch(Throwable t){throw new IllegalStateException(t);}}
        }
    }''',
    'cn/nubia/tgk/TgkMapView.java': '''package cn.nubia.tgk;public class TgkMapView {
        public final android.content.Context mContext;public int initializations;public long initializedId=-1;
        public TgkMapView(){this(ls.augment.com.hook.FeatureSettings.current);}public TgkMapView(android.content.Context c){mContext=c;}
        public void initTgkMapView(String pkg){try{ls.augment.com.hook.AugmentModule.dispatch(this,"initTgkMapView",new Class[]{String.class},new Object[]{pkg},()->{initializedId=TgkHelper.getGameInfoForEnableTgk(mContext,pkg).getSelectedCaseData().ID;initializations++;return null;});}catch(Throwable t){throw new IllegalStateException(t);}}
    }''',
    'android/view/Gravity.java': 'package android.view;public class Gravity {public static final int CENTER_VERTICAL=16,END=32,BOTTOM=64;}',
    'android/view/View.java': '''package android.view;import android.content.Context;public class View {
        public static final int VISIBLE=0,GONE=8;final Context context;Object tag;int visibility;
        ViewGroup.LayoutParams params=new ViewGroup.LayoutParams(-1,-2);public View(Context c){context=c;}
        public Context getContext(){return context;}public android.content.res.Resources getResources(){return context.getResources();}
        public void setTag(Object t){tag=t;}public Object getTag(){return tag;}public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}
        public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}
        public boolean post(Runnable r){return new android.os.Handler().post(r);}public void setEnabled(boolean b){}
        public void setContentDescription(String s){}
    }''',
    'android/view/ViewGroup.java': '''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View {
        final List<View> children=new ArrayList<>();public ViewGroup(Context c){super(c);}
        public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}
        public void addView(View v,LayoutParams p){v.setLayoutParams(p);children.add(v);}
        public static class LayoutParams {public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
    }''',
    'android/widget/TextView.java': '''package android.widget;import android.content.Context;public class TextView extends android.view.View {
        int l,t,r,b;public TextView(Context c){super(c);}public void setText(String s){}public void setTextSize(float n){}
        public Object getTextColors(){return "color";}public void setTextColor(Object c){}public void setGravity(int g){}
        public void setPadding(int a,int x,int c,int d){l=a;t=x;r=c;b=d;}public int getPaddingLeft(){return l;}public int getPaddingTop(){return t;}public int getPaddingRight(){return r;}public int getPaddingBottom(){return b;}
        public void setSingleLine(boolean b){}public void setMinHeight(int n){}public void setMinimumHeight(int n){}
    }''',
    'android/widget/CompoundButton.java': '''package android.widget;import android.content.Context;public class CompoundButton extends TextView {
        public interface OnCheckedChangeListener {void onCheckedChanged(CompoundButton b,boolean c);}
        OnCheckedChangeListener listener;boolean checked;public CompoundButton(Context c){super(c);}
        public void setOnCheckedChangeListener(OnCheckedChangeListener l){listener=l;}public void setChecked(boolean v){checked=v;}public boolean isChecked(){return checked;}
    }''',
    'android/widget/CheckBox.java': 'package android.widget;public class CheckBox extends CompoundButton {public CheckBox(android.content.Context c){super(c);}}',
    'android/widget/LinearLayout.java': '''package android.widget;public class LinearLayout extends android.view.ViewGroup {
        public static final int VERTICAL=1;int orientation;public LinearLayout(android.content.Context c){super(c);}
        public int getOrientation(){return orientation;}public void setOrientation(int i){orientation=i;}
        public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h){super(w,h);}}
    }''',
    'android/widget/FrameLayout.java': '''package android.widget;public class FrameLayout extends android.view.ViewGroup {
        public FrameLayout(android.content.Context c){super(c);}public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h,int g){super(w,h);}}
    }''',
    'android/widget/RelativeLayout.java': '''package android.widget;public class RelativeLayout extends android.view.ViewGroup {
        public static final int ALIGN_PARENT_BOTTOM=1,ALIGN_PARENT_END=2;public RelativeLayout(android.content.Context c){super(c);}
        public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h){super(w,h);}public void addRule(int r){}}
    }''',
    'android/widget/Toast.java': '''package android.widget;public class Toast {
        public static final int LENGTH_SHORT=0;public static final java.util.List<String> messages=new java.util.ArrayList<>();
        final String message;Toast(String s){message=s;}public static Toast makeText(android.content.Context c,String s,int n){return new Toast(s);}public void show(){messages.add(message);}
    }''',
    'ls/augment/com/GameOptions.java': 'package ls.augment.com;public class GameOptions {public static final String QUICK_SWITCH="quick";}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;import java.util.*;
    public class FeatureSettings {
        public static final String GAME_MASTER="master";public static Context current;public static boolean on=true;public static String candidates="TQ1";
        public static final Map<String,String> diagnostics=new java.util.concurrent.ConcurrentHashMap<>();
        public static final List<Runnable> listeners=new ArrayList<>();
        static Context from(Object o){if(o instanceof Context)return (Context)o;try{return (Context)TargetReflection.field(o,"mContext");}catch(Exception e){return current;}}
        static boolean enabled(Context c,String k,boolean d){return on;}static boolean enabled(Context c,String k){return on;}
        static String text(Context c,String k,String d){return candidates;}static void invalidateSnapshot(){}
        static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
        static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
        public static void publish(boolean v){on=v;for(Runnable r:new ArrayList<>(listeners))r.run();}
    }''',
    'ls/augment/com/hook/HookTelemetry.java': '''package ls.augment.com.hook;public class HookTelemetry {
        public static final java.util.List<String> events=new java.util.concurrent.CopyOnWriteArrayList<>();
        public static void shoulderSwitch(String level,String text){events.add(level+":"+text);}
    }''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
    public class AugmentModule {
        public static AugmentModule active;public static String failRoute="",failReadRoute="";public AugmentModule(){active=this;}
        public interface Interceptor {Object run(Chain c)throws Throwable;}public interface Original {Object run()throws Throwable;}
        public interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;Object proceed(Object[] replacement)throws Throwable;}
        public static class Registration {final Method method;final String id;final Interceptor interceptor;Registration(Method m,String id,Interceptor i){method=m;this.id=id;interceptor=i;}}
        public static class Builder {final Method method;final String id;Builder(Method m,String id){method=m;this.id=id;}public Registration intercept(Interceptor i){return new Registration(method,id,i);}}
        public final Map<Method,Registration> hooks=new LinkedHashMap<>();public final List<String> logs=new ArrayList<>();public final List<Throwable> errors=new ArrayList<>();
        public Builder prepareFeatureHook(Method m,String id,boolean b){if(m.getName().equals(failRoute))throw new IllegalStateException("test hook registration unavailable");return new Builder(m,id);}public void registerFeatureHook(Registration r){hooks.put(r.method,r);}
        public void logFeatureInfo(String s){logs.add(s);}public void logFeatureError(String s,Throwable e){logs.add(s);errors.add(e);}
        public boolean deoptimize(java.lang.reflect.Executable m){return true;}
        public static Object dispatch(Object owner,String name,Class<?>[] types,Object[] args,Original original)throws Throwable {
            Class<?> cls=owner instanceof Class?(Class<?>)owner:owner.getClass();Method m=cls.getDeclaredMethod(name,types);
            Registration r=active==null?null:active.hooks.get(m);if(r==null)return original.run();
            return r.interceptor.run(new Chain(){public Object getThisObject(){return owner instanceof Class?null:owner;}public Object getArg(int i){if(name.equals(failReadRoute))throw new IllegalStateException("test unreadable argument");return args[i];}public Object proceed()throws Throwable{return original.run();}
                public Object proceed(Object[] replacement)throws Throwable{try{Method nativeMethod=cls.getDeclaredMethod("native_"+name,types);nativeMethod.setAccessible(true);return nativeMethod.invoke(owner,replacement);}catch(InvocationTargetException e){throw e.getCause();}}
            });
        }
    }''',
}


def java_program(name):
    found = shutil.which(name)
    if found:
        return found
    candidate = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin') / (name + '.exe')
    if candidate.is_file():
        return str(candidate)
    raise RuntimeError(f'{name} is unavailable; set PATH to a JDK')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--keep-output', type=Path)
    parser.add_argument('--coordinator-only', action='store_true')
    parser.add_argument('--native-only', action='store_true')
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='lsa-shoulder-switch-') as directory:
        root = Path(directory)
        for name, source in ({} if args.coordinator_only else FILES).items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
        production = [SRC / 'ShoulderQuickSwitchPolicy.java', SRC / 'hook/ShoulderSwitchCoordinator.java', ROOT / 'tools/TestShoulderSwitchCoordinator.java']
        if not args.coordinator_only:
            production += [SRC / 'hook' / name for name in [
                'ShoulderHookTargets.java', 'TargetReflection.java',
            ]]
            if not args.native_only:
                production += [SRC / 'hook/ShoulderQuickSwitchHook.java', SRC / 'hook/ShoulderQuickSwitchRuntime.java', ROOT / 'tools/TestShoulderSwitchRuntime.java']
            if (SRC / 'hook/ShoulderNativeApply.java').is_file():
                production.append(SRC / 'hook/ShoulderNativeApply.java')
                production.append(ROOT / 'tools/TestShoulderNativeApply.java')
                production.append(ROOT / 'tools/TestShoulderNativeMissing.java')
            if not args.native_only and (SRC / 'hook/ShoulderSelectionStore.java').is_file():
                production.append(SRC / 'hook/ShoulderSelectionStore.java')
        files = list(root.rglob('*.java')) + production
        subprocess.run([java_program('javac'), '--release', '17', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run([java_program('java'), '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestShoulderSwitchCoordinator'], check=True)
        if not args.coordinator_only:
            for missing in ['required', 'middle']:
                subprocess.run([java_program('java'), '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestShoulderNativeMissing', missing], check=True)
            subprocess.run([java_program('java'), '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestShoulderNativeApply'], check=True)
            if not args.native_only:
                subprocess.run([java_program('java'), '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestShoulderSwitchRuntime'], check=True)
        if args.keep_output:
            args.keep_output.mkdir(parents=True, exist_ok=True)
            shutil.copytree(root, args.keep_output / 'jvm', dirs_exist_ok=True)


if __name__ == '__main__':
    main()
