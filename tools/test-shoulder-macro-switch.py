"""Run the production exact macro resolver with real SQLite selection queries.

GameHelper cache, hook dispatch and Android ContentResolver are host facades.
The tests do not execute a physical shoulder key or a real macro playback engine.
"""
from pathlib import Path
import importlib.util
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('selection_fixture', ROOT / 'tools/test-shoulder-selection-store.py')
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)
FILES = dict(BASE.STUBS)
FILES['android/database/Cursor.java'] = FILES['android/database/Cursor.java'].replace(
    'public int getInt(int i)', 'public long getLong(int i){return ((Number)rows.get(position)[i]).longValue();}\npublic int getInt(int i)')
FILES['android/database/Cursor.java'] = FILES['android/database/Cursor.java'].replace(
    'public void close(){}', 'public int getColumnIndexOrThrow(String n){int i=getColumnIndex(n);if(i<0)throw new IllegalArgumentException(n);return i;}public void close(){}')
FILES['android/content/Context.java'] = '''package android.content;public class Context {
public final ContentResolver resolver;public Context(){resolver=null;}public Context(ContentResolver r){resolver=r;}
public ContentResolver getContentResolver(){return resolver;}}
'''
FILES['android/content/ContentResolver.java'] = '''package android.content;
import android.net.Uri;import android.database.*;import android.database.sqlite.*;
public class ContentResolver {
public final SQLiteDatabase database;public boolean denied,missingColumn,nullCursor;public int queries;public Runnable afterQuery;
public ContentResolver(SQLiteDatabase d){database=d;}
public Cursor query(Uri uri,String[] projection,String selection,String[] args,String order){queries++;if(denied)throw new SecurityException("read denied");if(nullCursor)return null;
String table=uri.getPath().substring(1);String columns=String.join(",",projection);if(missingColumn)columns=columns.replace("left_option","missing_option");
Cursor c=database.rawQuery("SELECT "+columns+" FROM "+table+" WHERE "+selection+" ORDER BY "+order,args);
if(afterQuery!=null)afterQuery.run();return c;}}
'''
FILES['ls/augment/com/hook/FeatureSettings.java'] = '''package ls.augment.com.hook;class FeatureSettings {
static final String GAME_MASTER="master";static boolean enabled=true,master=true;static android.content.Context context;
static android.content.Context from(Object owner){return context;}
static boolean enabled(android.content.Context c,String key,boolean d){return enabled;}
static boolean enabled(android.content.Context c,String key){return master;}}
'''
FILES['ls/augment/com/hook/AugmentModule.java'] = FILES['ls/augment/com/hook/AugmentModule.java'].replace(
    'void registerFeatureHook(Object handle)', 'java.util.Set<String> deoptimized=new java.util.HashSet<>();void deoptimize(Method m){deoptimized.add(m.getDeclaringClass().getName()+"."+m.getName());}void registerFeatureHook(Object handle)')
FILES['ls/augment/com/BuildConfig.java'] = 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20531;}'
FILES['cn/nubia/gamehelper/bean/TouchKeyMapBean.java'] = '''package cn.nubia.gamehelper.bean;
public class TouchKeyMapBean {public String packageName,touchKeyName,motionName;
public TouchKeyMapBean(String pkg,String key,String name){packageName=pkg;touchKeyName=key;motionName=name;}}
'''
FILES['cn/nubia/gamehelper/manager/GameMotionHelperManager.java'] = '''package cn.nubia.gamehelper.manager;
import android.content.Context;import cn.nubia.gamehelper.bean.TouchKeyMapBean;import java.util.*;
public class GameMotionHelperManager {
private static Context mContext;private HashMap<String,TouchKeyMapBean> mTouchKeyBeanMap=new HashMap<>();
private final Object mTouchKeyBeanMapLock=new Object();public final HashMap<String,TouchKeyMapBean> databaseBindings=new HashMap<>();
public int originalCalls,refreshes;public boolean failRefresh;public Runnable duringRefresh;
public GameMotionHelperManager(Context c){mContext=c;}
public void recoveryMotionByTouchKey(String key,String pkg){getTouchKeyBean(key,pkg);}
public void seedOld(TouchKeyMapBean b){mTouchKeyBeanMap.put(b.touchKeyName,b);}
private void updateTouchKeyMapSync(){refreshes++;if(!Thread.holdsLock(mTouchKeyBeanMapLock))throw new AssertionError("refresh without OEM lock");if(failRefresh)throw new IllegalStateException("refresh failed");
if(duringRefresh!=null)duringRefresh.run();synchronized(mTouchKeyBeanMapLock){mTouchKeyBeanMap=new LockedMap(mTouchKeyBeanMapLock);mTouchKeyBeanMap.putAll(databaseBindings);}}
// Faithful reduced version of the inspected OEM first-suffix lookup.
private TouchKeyMapBean getTouchKeyBean(String key,String pkg){originalCalls++;
for(Map.Entry<String,TouchKeyMapBean> e:mTouchKeyBeanMap.entrySet())if(pkg.equals(e.getValue().packageName)
&& (e.getKey().equals(key)||e.getKey().endsWith(key)||key.endsWith(e.getKey())))return e.getValue();return null;}
private static class LockedMap extends HashMap<String,TouchKeyMapBean>{final Object lock;LockedMap(Object l){lock=l;}
@Override public TouchKeyMapBean get(Object key){if(!Thread.holdsLock(lock))throw new AssertionError("map read without OEM lock");return super.get(key);}}
}
'''
FILES['cn/nubia/gamehelper/db/GameTouchProvider$3.java'] = '''package cn.nubia.gamehelper.db;
public class GameTouchProvider$3 implements Runnable {public void run(){}}
'''
FILES['cn/nubia/gamehelper/db/GameTouchProvider.java'] = '''package cn.nubia.gamehelper.db;
import android.content.*;import android.os.Bundle;public class GameTouchProvider extends ContentProvider {
public final Context context;public int originalCalls;public RuntimeException error;
public GameTouchProvider(Context c){context=c;}@Override public Context getContext(){return context;}
public Bundle call(String method,String arg,Bundle extras){originalCalls++;if(error!=null)throw error;Bundle b=new Bundle();b.putString("oem",method);return b;}}
'''
TEST = r'''package ls.augment.com.hook;
import android.content.*;import android.database.*;import android.database.sqlite.*;
import android.os.Bundle;import cn.nubia.gamehelper.db.GameTouchProvider;import ls.augment.com.BuildConfig;
import cn.nubia.gamehelper.bean.*;import cn.nubia.gamehelper.manager.*;import java.lang.reflect.*;
public class TestShoulderMacroSwitch {
static int checks;static final String PKG="test.example.game";
static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
static void sql(SQLiteDatabase d,String s){d.execSQL(s,null);}
static TouchKeyMapBean bean(String key,String name){return new TouchKeyMapBean(PKG,key,name);}
static TouchKeyMapBean resolve(AugmentModule module,GameMotionHelperManager owner,String key,String pkg)throws Throwable{
Method method=GameMotionHelperManager.class.getDeclaredMethod("getTouchKeyBean",String.class,String.class);method.setAccessible(true);
return (TouchKeyMapBean)module.callbacks.get("getTouchKeyBean").intercept(new AugmentModule.Chain(owner,method,key,pkg));}
static Bundle call(AugmentModule module,GameTouchProvider owner,String method)throws Throwable {
Method target=GameTouchProvider.class.getDeclaredMethod("call",String.class,String.class,Bundle.class);
return (Bundle)module.callbacks.get("call").intercept(new AugmentModule.Chain(owner,target,method,null,null));}
static long scalar(SQLiteDatabase d,String query){try(Cursor c=d.rawQuery(query,null)){check(c.moveToFirst(),"scalar");return c.getLong(0);}}
static void selection(SQLiteDatabase db,int table,int id){for(String t:new String[]{"preset_case_table","import_case_table"})sql(db,"UPDATE "+t+" SET state=(state & ~1)");
sql(db,"UPDATE "+(table==0?"preset_case_table":"import_case_table")+" SET state=(state | 1) WHERE _id="+id);}
public static void main(String[] args)throws Throwable{
AugmentModule module=new AugmentModule();check(ShoulderMacroSwitchHook.install(module,TestShoulderMacroSwitch.class.getClassLoader())==2,"install both hooks");
check(ShoulderMacroSwitchHook.install(module,TestShoulderMacroSwitch.class.getClassLoader())==0&&module.registered==2,"single registration");
check(module.deoptimized.size()==3&&module.deoptimized.contains("cn.nubia.gamehelper.manager.GameMotionHelperManager.getTouchKeyBean")
&&module.deoptimized.contains("cn.nubia.gamehelper.manager.GameMotionHelperManager.recoveryMotionByTouchKey")
&&module.deoptimized.contains("cn.nubia.gamehelper.db.GameTouchProvider$3.run"),"private resolver and actual callers deoptimized");
try(SQLiteDatabase db=new SQLiteDatabase("jdbc:sqlite::memory:")){
for(String table:new String[]{"preset_case_table","import_case_table"})sql(db,"CREATE TABLE "+table+"(_id INTEGER PRIMARY KEY,state INTEGER,package_name TEXT,main_sw INTEGER,left_sw INTEGER,right_sw INTEGER,middle_sw INTEGER,left_option INTEGER,right_option INTEGER,middle_option INTEGER)");
sql(db,"INSERT INTO preset_case_table VALUES(8,5,'"+PKG+"',1,1,1,1,4,4,4),(9,4,'"+PKG+"',1,1,1,1,4,4,4)");
sql(db,"INSERT INTO import_case_table VALUES(8,8,'"+PKG+"',1,1,1,1,4,4,4)");
ContentResolver resolver=new ContentResolver(db);Context context=new Context(resolver);FeatureSettings.context=context;
GameTouchProvider provider=new GameTouchProvider(context);int readCount=resolver.queries,writeCount=db.execCalls;
Bundle capability=call(module,provider,ShoulderMacroSwitchHook.CAPABILITIES_CALL);
check(capability.getBoolean("ok",false)&&capability.getBoolean("ready",false)&&capability.getInt("versionCode",-1)==BuildConfig.VERSION_CODE,"capability installed enabled current version");
check(resolver.queries==readCount&&db.execCalls==writeCount&&provider.originalCalls==0,"capability contains no DB/content work");
FeatureSettings.enabled=false;check(!call(module,provider,ShoulderMacroSwitchHook.CAPABILITIES_CALL).getBoolean("ready",true),"capability quick off");FeatureSettings.enabled=true;
FeatureSettings.master=false;check(!call(module,provider,ShoulderMacroSwitchHook.CAPABILITIES_CALL).getBoolean("ready",true),"capability master off");FeatureSettings.master=true;
check(!call(module,new GameTouchProvider(null),ShoulderMacroSwitchHook.CAPABILITIES_CALL).getBoolean("ready",true),"capability missing provider context");
check("oem_method".equals(call(module,provider,"oem_method").getString("oem"))&&provider.originalCalls==1,"non-capability OEM call preserved");
RuntimeException oemError=new IllegalStateException("original failure");provider.error=oemError;
try{call(module,provider,"oem_method");throw new AssertionError("OEM exception swallowed");}catch(RuntimeException error){check(error==oemError&&provider.originalCalls==2,"OEM exception original once");}provider.error=null;
GameMotionHelperManager manager=new GameMotionHelperManager(context);TouchKeyMapBean a=bean("0_8_137","macro A"),b=bean("0_9_137","macro B"),imported=bean("1_8_137","macro import");
manager.seedOld(a);manager.databaseBindings.put(a.touchKeyName,a);manager.databaseBindings.put(b.touchKeyName,b);manager.databaseBindings.put(imported.touchKeyName,imported);
FeatureSettings.enabled=false;check(resolve(module,manager,"137",PKG)==a&&manager.originalCalls==1,"baseline first-suffix stale A");FeatureSettings.enabled=true;
selection(db,0,9);check(resolve(module,manager,"137",PKG)==b&&manager.originalCalls==1&&manager.refreshes==1,"B selected returns fresh exact B");
selection(db,0,8);check(resolve(module,manager,"137",PKG)==a,"A switch back");
selection(db,1,8);check(resolve(module,manager,"137",PKG)==imported,"same ID across tables exact import binding");
check(manager.databaseBindings.size()==3&&"macro A".equals(a.motionName)&&"macro B".equals(b.motionName),"bindings/names changed");
TouchKeyMapBean replaced=bean("1_8_137","macro changed in OEM database");manager.databaseBindings.put(replaced.touchKeyName,replaced);
check(resolve(module,manager,"137",PKG)==replaced,"non-null cache refreshed on every numeric lookup");
manager.databaseBindings.put("1_8_138",bean("1_8_138","right macro"));manager.databaseBindings.put("1_8_136",bean("1_8_136","middle macro"));
check(resolve(module,manager,"138",PKG).touchKeyName.equals("1_8_138"),"right key exact binding");
check(resolve(module,manager,"136",PKG).touchKeyName.equals("1_8_136"),"middle key exact binding");
int originals=manager.originalCalls,queries=resolver.queries;
check(resolve(module,manager,"1_8_137",PKG)==replaced&&manager.originalCalls==originals+1&&resolver.queries==queries,"full keys preserve OEM path");
check(resolve(module,manager,"139",PKG)==null&&manager.originalCalls==originals+2,"unknown keys preserve OEM path");
FeatureSettings.master=false;check(resolve(module,manager,"137",PKG)!=null&&resolver.queries==queries,"master off preserves OEM path");FeatureSettings.master=true;
manager.databaseBindings.remove("1_8_137");originals=manager.originalCalls;
check(resolve(module,manager,"137",PKG)==null&&manager.originalCalls==originals,"missing exact target never falls back to old A");manager.databaseBindings.put(replaced.touchKeyName,replaced);
manager.databaseBindings.put("1_8_137",new TouchKeyMapBean("foreign.example.game","1_8_137","wrong pkg"));check(resolve(module,manager,"137",PKG)==null,"foreign package bean refused");manager.databaseBindings.put(replaced.touchKeyName,replaced);
manager.databaseBindings.put("1_8_137",bean("0_8_137","wrong bean key"));check(resolve(module,manager,"137",PKG)==null,"map key/bean key mismatch refused");manager.databaseBindings.put(replaced.touchKeyName,replaced);
manager.databaseBindings.put("1_8_137",bean("1_8_137",""));check(resolve(module,manager,"137",PKG)==null,"empty macro name refused");manager.databaseBindings.put(replaced.touchKeyName,replaced);
sql(db,"UPDATE import_case_table SET left_option=0 WHERE _id=8");check(resolve(module,manager,"137",PKG)==null,"ordinary touch scheme cannot play stale macro");sql(db,"UPDATE import_case_table SET left_option=4,left_sw=0 WHERE _id=8");
check(resolve(module,manager,"137",PKG)==null,"disabled left macro refused");sql(db,"UPDATE import_case_table SET left_sw=1,main_sw=0 WHERE _id=8");check(resolve(module,manager,"137",PKG)==null,"main off macro refused");sql(db,"UPDATE import_case_table SET main_sw=1 WHERE _id=8");
sql(db,"UPDATE preset_case_table SET state=(state|1) WHERE _id=8");check(resolve(module,manager,"137",PKG)==null,"multiple selected rows fail closed");selection(db,1,8);
resolver.denied=true;check(resolve(module,manager,"137",PKG)==null,"query denied fails closed");resolver.denied=false;
resolver.nullCursor=true;check(resolve(module,manager,"137",PKG)==null,"null query fails closed");resolver.nullCursor=false;
resolver.missingColumn=true;check(resolve(module,manager,"137",PKG)==null,"schema mismatch fails closed");resolver.missingColumn=false;
manager.failRefresh=true;check(resolve(module,manager,"137",PKG)==null,"refresh error fails closed");manager.failRefresh=false;
manager.duringRefresh=()->selection(db,0,9);check(resolve(module,manager,"137",PKG)==null,"selection changed during refresh cannot play old macro");manager.duringRefresh=null;
check(resolve(module,manager,"137",PKG)==b,"next press after commit resolves B");
HookTelemetry.fail=true;check(resolve(module,manager,"137",PKG)==b,"diagnostic error changed exact resolver");HookTelemetry.fail=false;
check(resolve(module,manager,"137","bad/pkg")==null,"malformed package fail closed");check(resolve(module,manager,"137","missing.example.game")==null,"no selected scheme fail closed");
check(scalar(db,"SELECT count(*) FROM preset_case_table")==2&&scalar(db,"SELECT count(*) FROM import_case_table")==1,"resolver modified DB rows");
check(HookTelemetry.events.stream().anyMatch(v->v.contains("stage=MACRO_RESOLVED")&&v.contains("caseId=9")),"selected ID diagnostic missing");
System.out.println("PASS production ShoulderMacroSwitchHook: "+checks+" checks; exact selected scheme, fresh map, no suffix fallback, switches, ambiguity and errors.");
System.out.println("LIMIT: real SQLite queries; Android/GameHelper facades. Not physical shoulder or OEM macro playback proof.");
}}
}
'''


def main():
    with tempfile.TemporaryDirectory(prefix='ls-shoulder-macro-switch-') as temporary:
        folder = Path(temporary)
        for name, value in FILES.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding='utf-8')
        target = folder / 'ls/augment/com/hook/ShoulderMacroSwitchHook.java'
        target.write_bytes((ROOT / 'android/app/src/main/java/ls/augment/com/hook/ShoulderMacroSwitchHook.java').read_bytes())
        (target.parent / 'TestShoulderMacroSwitch.java').write_text(TEST, encoding='utf-8')
        classes = folder / 'classes'
        classes.mkdir()
        subprocess.run([str(BASE.JDK / 'javac.exe'), '-encoding', 'UTF-8', '-cp', str(BASE.SQLITE),
                        '-d', str(classes), *map(str, folder.rglob('*.java'))], check=True)
        subprocess.run([str(BASE.JDK / 'java.exe'), '-cp', os.pathsep.join([str(classes), str(BASE.SQLITE)]),
                        'ls.augment.com.hook.TestShoulderMacroSwitch'], check=True)


if __name__ == '__main__':
    main()
