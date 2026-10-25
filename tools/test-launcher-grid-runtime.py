"""Compile and execute the complete production RedMagic grid adapter against ROM-shaped doubles.

The OEM repack double is deliberately only an observer: assertions inspect the actual
hook's invocation/queue, never substitute an invented implementation of OEM migration.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
sources = {
'ls/augment/com/hook/LauncherOwnedStateClient.java':'package ls.augment.com.hook;import android.content.*;class LauncherOwnedStateClient {static boolean unavailable;static java.util.List<Runnable> listeners=new java.util.ArrayList<>();static SharedPreferences preferences(Context c,String kind){if(unavailable)throw new IllegalStateException("provider unavailable");return c.prefs;}static SharedPreferences readyPreferences(Context c,String k){return unavailable?null:c.prefs;}static boolean addReadyListener(Context c,String k,Runnable r){listeners.add(r);return true;}static void ready(){unavailable=false;for(Runnable r:new java.util.ArrayList<>(listeners))r.run();listeners.clear();}}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'package android.os;public class Handler{public static java.util.ArrayDeque<Runnable> queue=new java.util.ArrayDeque<>();public Handler(Looper l){}public boolean post(Runnable r){queue.add(r);return true;}public static void drain(){for(int i=0;!queue.isEmpty();i++){if(i>100)throw new AssertionError("ready loop");queue.remove().run();}}}',
'android/content/SharedPreferences.java': r'''
package android.content;import java.util.*;
public class SharedPreferences {public final Map<String,Object> values=new HashMap<>();public boolean writable=true;public Map<String,?> getAll(){return new HashMap<>(values);}
 public int getInt(String k,int d){return ((Number)values.getOrDefault(k,d)).intValue();}public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}
 public Editor edit(){return new Editor();}public class Editor{Map<String,Object> changes=new HashMap<>();Set<String> removes=new HashSet<>();boolean cleared;
 public Editor putInt(String k,int v){changes.put(k,v);return this;}public Editor putBoolean(String k,boolean v){changes.put(k,v);return this;}
 public Editor remove(String k){removes.add(k);return this;}public Editor clear(){cleared=true;return this;}public boolean commit(){if(!writable)return false;if(cleared)values.clear();removes.forEach(values::remove);values.putAll(changes);return true;}}
}''',
'android/content/Context.java': r'''
package android.content;import java.io.*;import java.util.*;
public class Context {public static final int MODE_PRIVATE=0;public final SharedPreferences prefs=new SharedPreferences();public final File dir;public boolean failPath;
 public Context(){try{dir=java.nio.file.Files.createTempDirectory("grid-db-").toFile();getDatabasePath("launcher.db").createNewFile();}catch(Exception e){throw new RuntimeException(e);}}
 public boolean deviceProtected;public int displayId=0;public boolean isDeviceProtectedStorage(){return deviceProtected;}public android.view.Display getDisplay(){return new android.view.Display(displayId);}public Context getApplicationContext(){return this;}public SharedPreferences getSharedPreferences(String n,int m){return prefs;}public File getDatabasePath(String n){if(failPath)throw new SecurityException("private path");return new File(dir,n);}public android.content.res.Resources getResources(){return new android.content.res.Resources();}
}''',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
'android/app/Application.java':'package android.app;public class Application extends android.content.Context{}',
'android/app/Instrumentation.java':'package android.app;public class Instrumentation{public void callApplicationOnCreate(Application app){}}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=3.25f;}',
'android/database/Cursor.java': r'''
package android.database;
public class Cursor implements AutoCloseable {public static int failAfter=-1;public static boolean failClose;long[][] rows;int i=-1;public Cursor(long[][] data){rows=data;}public boolean moveToNext(){if(failAfter>=0&&i+1>=failAfter)throw new IllegalStateException("partial cursor");return ++i<rows.length;}public long getLong(int c){return c==6&&rows[i].length==6?0:rows[i][c];}public int getInt(int c){return (int)rows[i][c];}public void close(){if(failClose)throw new IllegalStateException("cursor close failed");}}
''',
'android/database/sqlite/SQLiteDatabase.java': r'''
package android.database.sqlite;import android.database.Cursor;
public class SQLiteDatabase implements AutoCloseable {public static final int OPEN_READONLY=1,NO_LOCALIZED_COLLATORS=16;public static long[][] data={};public static boolean fail,failQuery,failClose;public static int reads,lastFlags;
 public static SQLiteDatabase openDatabase(String p,Object factory,int mode){if((mode&OPEN_READONLY)==0||(mode&~(OPEN_READONLY|NO_LOCALIZED_COLLATORS))!=0)throw new AssertionError("database writable or unexpected flag");lastFlags=mode;if(fail)throw new IllegalStateException("unreadable");reads++;return new SQLiteDatabase();}
 public Cursor rawQuery(String sql,String[]args){if(!sql.equals("SELECT _id,container,cellX,cellY,spanX,spanY,screen FROM favorites"))throw new AssertionError(sql);if(failQuery)throw new UnsupportedOperationException("incompatible schema");return new Cursor(data);}public void close(){if(failClose)throw new IllegalArgumentException("database close failed");}}
''',
'android/graphics/Point.java':'package android.graphics;public class Point{public int x,y;public Point(int x,int y){this.x=x;this.y=y;}}',
'android/view/View.java':'package android.view;public class View{}',
'android/view/ViewGroup.java':'package android.view;import java.util.*;public class ViewGroup extends View{public final List<View> children=new ArrayList<>();public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}',
'android/os/Process.java':'package android.os;public class Process{public static int uid=10055;public static int myUid(){return uid;}public static int myPid(){return 321;}}',
'android/view/Display.java':'package android.view;public class Display{final int id;public Display(int id){this.id=id;}public int getDisplayId(){return id;}}',
'android/system/StructStat.java':'package android.system;public class StructStat{public long st_dev,st_ino;public int st_uid;}',
'android/system/Os.java':'package android.system;public class Os{public static long generation;public static StructStat stat(String p)throws Exception{var a=java.nio.file.Files.readAttributes(java.nio.file.Path.of(p),java.nio.file.attribute.BasicFileAttributes.class);StructStat s=new StructStat();s.st_dev=1;s.st_ino=(a.fileKey()==null?a.creationTime().hashCode():a.fileKey().hashCode())+(generation<<32);if(s.st_ino==0)s.st_ino=1;s.st_uid=android.os.Process.myUid();return s;}}',
'org/json/JSONObject.java':'package org.json;import java.util.*;public class JSONObject{Map<String,Object> m=new LinkedHashMap<>();public JSONObject put(String k,Object v){m.put(k,v);return this;}public String toString(){return m.toString();}}',
'org/json/JSONArray.java':'package org.json;public class JSONArray{java.util.List<Object> values=new java.util.ArrayList<>();public JSONArray(){}public JSONArray(java.util.Collection<?> v){values.addAll(v);}public JSONArray put(Object value){values.add(value);return this;}public String toString(){return values.toString();}}',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig{public static int VERSION_CODE=20391;}',
'ls/augment/com/ConfigSnapshot.java':'package ls.augment.com;import java.util.*;public class ConfigSnapshot{public final long revision;final Map<String,String> values;public ConfigSnapshot(Map<String,String> source,long r){values=new HashMap<>(source);revision=r;}public String get(String k){return values.get(k);}}',
'ls/augment/com/hook/FeatureSettings.java':r'''
package ls.augment.com.hook;import android.content.*;import java.util.*;
class FeatureSettings {static Map<String,String> values=new HashMap<>();static boolean verified=true;static long revision=17;static List<Runnable> listeners=new ArrayList<>();static String report;
 static Context from(Object owner){return owner instanceof Context?(Context)owner:null;}
 static void awaitLauncherGridSnapshot(){}
 static ls.augment.com.ConfigSnapshot verifiedSnapshot(Context c){return verified?new ls.augment.com.ConfigSnapshot(values,revision):null;}
 static boolean hasVerifiedSnapshot(Context c){return verified;}static String text(Context c,String k,String d){return values.getOrDefault(k,d);}
 static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}static void diagnostic(Context c,String k,String v){report=v;}}
''',
'ls/augment/com/hook/AugmentModule.java':r'''
package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
class AugmentModule {static AugmentModule active;AugmentModule(){active=this;}Map<Method,Hook> hooks=new HashMap<>();List<Throwable> errors=new ArrayList<>();
 interface Interceptor{Object invoke(Chain c)throws Throwable;}static class Hook{Method m;Interceptor i;Hook(Method m){this.m=m;}Hook intercept(Interceptor i){this.i=i;return this;}}
 Hook prepareFeatureHook(Method m,String n,boolean flag){return new Hook(m);}void registerFeatureHook(Hook h){hooks.put(h.m,h);}void logFeatureError(String n,Throwable t){errors.add(t);}
 static class Chain{Object owner;Object[]args;Method m;Chain(Object o,Method m,Object...args){owner=o;this.m=m;this.args=args;}Object getArg(int i){return args[i];}Object getThisObject(){return owner;}
 Object proceed()throws Throwable{return proceed(args);}Object proceed(Object[]a)throws Throwable{try{return m.invoke(owner,a);}catch(InvocationTargetException e){throw e.getCause();}}}
 Object call(Object o,Method m,Object...a)throws Throwable{return hooks.get(m).i.invoke(new Chain(o,m,a));}}
''',
'ls/augment/com/hook/NativeDispatch.java':r'''
package ls.augment.com.hook;import java.lang.reflect.*;import android.content.Context;
/** Simulates ART dispatch of a nested native call through its independently registered hook. */
public class NativeDispatch{public static void call(Object owner,String name,Context context){try{Method m=owner.getClass().getDeclaredMethod(name,Context.class);m.setAccessible(true);AugmentModule.active.call(owner,m,context);}catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
public static android.graphics.Point point(Context context){try{java.lang.reflect.Field f=LauncherGridHook.class.getDeclaredField("controller");f.setAccessible(true);LauncherGridHook.Controller c=(LauncherGridHook.Controller)f.get(null);return (android.graphics.Point)AugmentModule.active.call(c.desktop,c.t.getPoint,context);}catch(Throwable e){throw new RuntimeException(e);}}}
''',
'com/android/launcher3/F1.java':'package com.android.launcher3;public class F1{public int G0=6,H0=4,refreshCalls;public boolean failRefresh;public String E1="launcher.db";public void K0(android.content.Context c){refreshCalls++;if(failRefresh)throw new IllegalStateException("refresh failure");android.graphics.Point p=ls.augment.com.hook.NativeDispatch.point(c);G0=p.x;H0=p.y;}}',
'com/android/launcher3/model/data/y.java':r'''
package com.android.launcher3.model.data;
public class y{public int container=-100,cellX,cellY,spanX=1,spanY=1,screenId;public long id;public int widgetId=17;public y(int x,int yy,int sx,int sy){cellX=x;cellY=yy;spanX=sx;spanY=sy;}}
''',
'com/android/launcher3/util/t0.java':r'''
package com.android.launcher3.util;import com.android.launcher3.model.data.y;
public class t0{public boolean free=true;public int marked;public boolean d(int x,int yy,int sx,int sy){return free;}public void g(y item,boolean occupied){marked++;}}
''',
'com/android/launcher3/util/z0.java':'package com.android.launcher3.util;public class z0{}',
'z1/y0.java':'package z1;public class y0{}',
'com/android/launcher3/b0.java':r'''
package com.android.launcher3;import android.content.Context;import android.graphics.Point;import java.util.*;import com.android.launcher3.model.data.y;import com.android.launcher3.util.t0;
public class b0{public boolean d;public boolean failProfile;public Map<Integer,ArrayList<Object>> a=new HashMap<>();public boolean repackFlag;public int nativePlaced,gridCalls,repackCalls;
 private void r(F1 idp,Context c,int rows,int cols){gridCalls++;if(failProfile)throw new IllegalStateException("native profile failure");idp.G0=rows;idp.H0=cols;}
 public Point i(Context c){return new Point(6,4);}public Point k(Context c){return new Point(6,4);}public int j(Context c){return 0x64;}
 public boolean u(Context c,F1 idp,y item,t0 occupancy){nativePlaced++;return false;}
 public void g(F1 idp,z1.y0 model,Context c,boolean restore){repackCalls++;repackFlag=restore;}}
''',
'com/android/launcher3/h0.java':'package com.android.launcher3;import android.graphics.Point;import android.content.Context;public class h0{public F1 C0;public int B1=195,C1=42,D1=10,J2=195,K2=10,H2=300,I2=215,H1,I1,calls,width=189,height=316;public float N2=42;public boolean Z0,b1,failDrawer;public Point k0(){return new Point(width,height);}public void p1(float scale,Context c){calls++;H1=B1+10;I1=B1+D1+C1;ls.augment.com.hook.NativeDispatch.call(this,"h1",c);}private void h1(Context c){J2=B1;N2=C1;K2=D1;H2=J2+(int)(N2*1.3)+K2;I2=J2+K2*2;if(failDrawer)throw new IllegalStateException("native drawer failed");}}',
'com/android/launcher3/CellLayout.java':'package com.android.launcher3;public class CellLayout extends android.view.ViewGroup{public int rows,cols;public h0 dp=new h0();public CellLayout(int rows,int cols){this.rows=rows;this.cols=cols;}public int getCountX(){return cols;}public int getCountY(){return rows;}public h0 getDeviceProfile(){return dp;}}',
'com/android/launcher3/Workspace.java':'package com.android.launcher3;public class Workspace extends android.view.ViewGroup{}',
'com/android/launcher3/C2.java':'package com.android.launcher3;public class C2{public Workspace ws=new Workspace();public void h(com.android.launcher3.util.z0 data){}public Workspace B2(){return ws;}}',
'ls/augment/com/hook/TestLauncherGridRuntime.java':r'''
package ls.augment.com.hook;
import android.content.*;import android.database.sqlite.SQLiteDatabase;import android.graphics.Point;import com.android.launcher3.*;import com.android.launcher3.model.data.y;import com.android.launcher3.util.t0;import java.lang.reflect.*;import java.util.*;import ls.augment.com.*;
public class TestLauncherGridRuntime {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static b0 currentDesktop;static F1 currentIdp;static Context currentContext;
 static void request(boolean enabled,int rows,int cols){FeatureSettings.values.putAll(new LauncherGridSpec(enabled,rows,cols).values());}
 static AugmentModule fresh()throws Exception{Field f=LauncherGridHook.class.getDeclaredField("installed");f.setAccessible(true);f.setBoolean(null,false);FeatureSettings.listeners.clear();LauncherOwnedStateClient.listeners.clear();android.os.Handler.queue.clear();AugmentModule m=new AugmentModule();LauncherGridHook.install(m,TestLauncherGridRuntime.class.getClassLoader());check(m.errors.isEmpty(),"signature install");check(m.hooks.size()==9,"all native endpoints");return m;}
 static LauncherGridHook.Controller controller()throws Exception{Field f=LauncherGridHook.class.getDeclaredField("controller");f.setAccessible(true);return (LauncherGridHook.Controller)f.get(null);}
 static void set(AugmentModule m,b0 grid,F1 idp,Context context,int rows,int cols)throws Throwable{currentDesktop=grid;currentIdp=idp;currentContext=context;m.call(grid,controller().t.setGrid,idp,context,rows,cols);}
 static void bound(AugmentModule m,int rows,int cols)throws Throwable{
  if(controller().owns&&!controller().storageUnavailable&&controller().saved!=null&&controller().saved.getBoolean("migration_pending",false)&&controller().migratedRows==null){
   for(long[] row:SQLiteDatabase.data)if(row[1]==-100){y item=new y((int)row[2],(int)row[3],(int)row[4],(int)row[5]);item.id=row[0];item.screenId=row.length>6?(int)row[6]:0;m.call(currentDesktop,controller().t.placeItem,currentContext,currentIdp,item,new t0());}
   m.call(currentDesktop,controller().t.repack,currentIdp,new z1.y0(),currentContext,false);
  }
  C2 launcher=new C2();CellLayout boundPage=new CellLayout(rows,cols);controller().t.observedDpIdp.set(boundPage.dp,currentIdp);launcher.ws.children.add(boundPage);m.call(launcher,controller().t.finished,new com.android.launcher3.util.z0());}
 public static void main(String[] args)throws Throwable{
  FeatureSettings.verified=true;SQLiteDatabase.fail=false;SQLiteDatabase.data=new long[][]{{1,-100,0,5,1,1},{2,-101,4,0,1,1}};
  Context context=new Context();request(false,6,4);AugmentModule m=fresh();b0 desktop=new b0();F1 idp=new F1();int reads=SQLiteDatabase.reads;
  set(m,desktop,idp,context,6,4);check(!controller().owns,"disabled untouched");check(SQLiteDatabase.reads==reads,"disabled does not read db");check(context.prefs.values.isEmpty(),"disabled no persistent changes");
  y item=new y(0,0,1,1);Object nativeResult=m.call(desktop,controller().t.placeItem,context,idp,item,new t0());check(Boolean.FALSE.equals(nativeResult)&&desktop.nativePlaced==1,"disabled native placement");
  request(true,6,6);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);
  check(controller().owns&&idp.G0==6&&idp.H0==6,"actual IDP custom geometry");check(desktop.d,"changed grid enables native repack");check(context.prefs.getInt("original_columns",0)==4,"original cols retained");
  check(context.prefs.getInt("effective_columns",0)==6,"crash recovery saved before migration");Point p=(Point)m.call(desktop,controller().t.getPoint,context);check(p.x==6&&p.y==6,"getter shares grid");check(((Integer)m.call(desktop,controller().t.getEncoded,context))==0x66,"encoded getter shares grid");
  check(context.prefs.getBoolean("migration_pending",false),"unfinished migration persisted");
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(desktop.d,"cold crash repeats pending migration even if all old cells fit");
  h0 dp=new h0();m.call(dp,controller().t.metrics,1f,context);check(dp.B1<=dp.width&&dp.B1==163,"real 195px icon fits 189px six-column cell");check(dp.calls==2&&dp.H1==dp.B1+10&&dp.I1==dp.B1+dp.D1+dp.C1,"native geometry recalculated after fit");check(dp.J2==195,"drawer icon size unaffected");
  dp=new h0();dp.width=94;dp.height=158;m.call(dp,controller().t.metrics,1f,context);check(dp.B1<94&&dp.C1<=42&&dp.I1<=158,"12-column icon and label fit real cell");
  check(dp.J2==195&&dp.N2==42&&dp.K2==10&&dp.H2==259&&dp.I2==215,"OEM post-fit alias keeps original drawer glyphs and derived geometry");
  int fittedIcon=dp.B1,fittedLabel=dp.C1;m.call(dp,controller().t.metrics,.8f,context);check(dp.B1==fittedIcon&&dp.C1==fittedLabel&&dp.J2==195&&dp.N2==42,"repeated p1 refresh cannot shrink drawer");
  dp.failDrawer=true;boolean drawerThrew=false;try{m.call(dp,controller().t.drawerMetrics,context);}catch(IllegalStateException expected){drawerThrew=true;}check(drawerThrew&&dp.B1==fittedIcon&&dp.C1==fittedLabel&&dp.D1==10,"native drawer failure restores workspace fields in finally");dp.failDrawer=false;
  dp.B1=210;dp.C1=48;dp.D1=12;m.call(dp,controller().t.metrics,1f,context);check(dp.B1<94&&dp.J2==210&&dp.N2==48&&dp.K2==12,"native k1 style refresh establishes new original drawer size");
  dp=new h0();dp.width=380;dp.height=600;m.call(dp,controller().t.metrics,1f,context);check(dp.B1==195&&dp.calls==1,"spacious grid retains OEM dimensions");
  dp=new h0();dp.Z0=true;m.call(dp,controller().t.metrics,1f,context);check(dp.B1==195&&dp.calls==1,"native scalable profiles retain their own algorithm");
  t0 occupancy=new t0();item=new y(1,2,2,3);int widget=item.widgetId;
  check((Boolean)m.call(desktop,controller().t.placeItem,context,idp,item,occupancy),"native item accepted");check(occupancy.marked==1&&desktop.a.isEmpty(),"valid coordinates kept");check(item.spanX==2&&item.spanY==3&&item.widgetId==widget,"widget span/identity intact");
  item=new y(5,5,2,3);occupancy=new t0();m.call(desktop,controller().t.placeItem,context,idp,item,occupancy);check(desktop.a.get(0).contains(item),"overflow queued");check(item.cellX==5&&item.cellY==5&&item.spanX==2&&item.spanY==3,"queue keeps all original geometry");check(occupancy.marked==0,"overflow not prematurely marked");
  m.call(desktop,controller().t.placeItem,context,idp,item,occupancy);check(desktop.a.get(0).size()==1,"queue identity deduplicated");
  y collision=new y(0,0,1,1);occupancy.free=false;m.call(desktop,controller().t.placeItem,context,idp,collision,occupancy);check(desktop.a.get(0).contains(collision),"collision kept for repack");
  y dock=new y(8,0,1,1);dock.container=-101;check(!(Boolean)m.call(desktop,controller().t.placeItem,context,idp,dock,occupancy),"dock not moved by workspace queue");
  boolean threw=false;try{m.call(desktop,controller().t.placeItem,context,idp,new y(0,0,7,1),occupancy);}catch(IllegalStateException expected){threw=true;}check(threw,"unexpected oversized live item stops migration");
  controller().loadingItems.clear();y boundItem=new y(0,5,1,1);boundItem.id=1;m.call(desktop,controller().t.placeItem,context,idp,boundItem,new t0());
  m.call(desktop,controller().t.repack,idp,new z1.y0(),context,false);check(desktop.repackFlag&&desktop.repackCalls==1,"OEM multi-page branch forced");check(controller().repacked,"repack evidence");
  bound(m,6,6);check(controller().actualCols==6&&controller().workspaceCols==6,"independent actual IDP and CellLayout evidence");check(FeatureSettings.report.contains("bound=true")&&FeatureSettings.report.contains("workspaceColumns=6"),"diagnostic bound geometry");
  check(!context.prefs.getBoolean("migration_pending",true),"fully bound valid database commits migration");
  request(true,7,5);for(Runnable r:FeatureSettings.listeners)r.run();check(controller().state.equals("pending_restart"),"live change awaits restart");set(m,desktop,idp,context,6,4);check(idp.G0==6&&idp.H0==6,"same-process reload cannot apply half new setting");
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(idp.G0==7&&idp.H0==5,"new process applies rectangle");check(context.prefs.getInt("original_columns",0)==4&&context.prefs.getInt("original_rows",0)==6,"native base not overwritten by second request");
  request(false,7,5);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(idp.G0==6&&idp.H0==4&&desktop.d,"disable restores via repack");check(controller().state.equals("restored"),"restore state");bound(m,6,4);check(!context.prefs.getBoolean("owned",false)&&context.prefs.values.isEmpty(),"all recovery metadata released only after verified native restoration");
  check(!controller().owns,"restore relinquishes current-process ownership");set(m,desktop,idp,context,8,5);check(idp.G0==8&&idp.H0==5,"subsequent OEM grid change is not suppressed");check(controller().actualRows==8&&controller().actualCols==5,"native profile changes still reported");
  check(controller().applicationResult.equals("native_profile")&&controller().rows==8&&controller().cols==5,"relinquished customization accepts the subsequent OEM target without a false mismatch");
  bound(m,8,5);check(controller().applicationResult.equals("native_bound")&&controller().error.isEmpty(),"native binding after restoration is checked against the current OEM shape");
  request(true,6,6);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);bound(m,6,6);SQLiteDatabase.data=new long[][]{{9,-100,0,0,6,2}};
  request(true,3,3);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(controller().state.equals("blocked")&&idp.H0==6,"large widget rejects shrink and retains custom");check(controller().error.contains("9"),"blocked identifies item");check(!desktop.d,"rejected shrink does not start resize");
  request(false,3,3);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(controller().state.equals("blocked")&&idp.H0==6,"disable cannot delete large new widget");bound(m,6,6);check(context.prefs.getBoolean("owned",false),"blocked disable retains restore metadata");
  context.prefs.edit().putBoolean("migration_pending",true).commit();SQLiteDatabase.fail=true;request(true,12,12);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(controller().state.equals("blocked")&&idp.H0==6,"incomplete read cannot change grid");check(desktop.d,"retained pending migration remains safe when DB read fails");SQLiteDatabase.fail=false;
  FeatureSettings.values.put(LauncherGridSpec.ROWS,"broken");m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(controller().owns&&desktop.d&&idp.H0==6,"exception fallback restores pending OEM resize mode");
  FeatureSettings.verified=false;request(false,6,4);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,context,6,4);check(idp.H0==6&&controller().state.equals("pending_restart"),"placeholder off retains last custom geometry");FeatureSettings.verified=true;
  Context other=new Context();SQLiteDatabase.data=new long[][]{{9,-100,0,0,5,2}};request(true,3,3);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(!controller().owns&&idp.H0==4,"first impossible request remains native");check(other.prefs.values.isEmpty(),"blocked first request creates no ownership");
  other=new Context();other.prefs.writable=false;SQLiteDatabase.data=new long[][]{{1,-100,0,0,1,1}};request(true,8,8);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(!controller().owns&&idp.H0==4&&!desktop.d,"recovery write failure preserves native");
  other=new Context();request(true,3,3);SQLiteDatabase.data=new long[1000][6];for(int i=0;i<1000;i++)SQLiteDatabase.data[i]=new long[]{i,-100,i%4,i%6,1,1};m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(idp.G0==3&&idp.H0==3,"many items accepted for OEM pagination");check(desktop.d,"out of bounds require repack");
  for(int i=0;i<1000;i++){y many=new y(3,5,1,1);many.id=i;many.screenId=i/24;m.call(desktop,controller().t.placeItem,other,idp,many,new t0());}
  int count=desktop.a.values().stream().mapToInt(List::size).sum();check(count==1000,"every overflow item queued without fixed page cap");
  check(!LauncherGridHook.Readout.read(other,"../launcher.db").complete,"unsafe database name rejected");check(!LauncherGridHook.Readout.read(other,"missing.db").complete,"missing database not treated as empty");
  SQLiteDatabase.data=new long[][]{{1,-100,0,0,2,2,0},{2,-100,1,1,1,1,0}};check(!LauncherGridHook.Readout.read(other,"launcher.db").fits(6,4),"same-page overlap prevents migration commit");
  SQLiteDatabase.data=new long[][]{{1,-100,0,0,2,2,0},{2,-100,0,0,2,2,1}};check(LauncherGridHook.Readout.read(other,"launcher.db").fits(6,4),"distinct pages have separate occupancy");
  SQLiteDatabase.data=new long[][]{{1,-100,-1,0,1,1,0}};check(!LauncherGridHook.Readout.read(other,"launcher.db").fits(6,4),"negative coordinate cannot commit");
  SQLiteDatabase.data=new long[][]{{1,-100,3,0,2,2,0}};check(!LauncherGridHook.Readout.read(other,"launcher.db").fits(6,4),"full span bound validated after migration");
  other=new Context();request(true,6,6);SQLiteDatabase.data=new long[][]{{44,-100,0,0,1,1,0},{54,-100,0,0,1,1,0}};
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);y visible=new y(0,0,1,1);visible.id=54;m.call(desktop,controller().t.placeItem,other,idp,visible,new t0());m.call(desktop,controller().t.repack,idp,new z1.y0(),other,false);
  visible.cellX=5;check(controller().migratedRows.get(0).x==0,"g snapshot freezes values, not mutable native object");bound(m,6,6);check(!other.prefs.getBoolean("migration_pending",true),"dormant row 44 overlap does not block visible row 54 completion");
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(!desktop.d,"unchanged grid does not repeatedly reflow dormant overlaps");
  request(false,6,6);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);visible=new y(0,0,1,1);visible.id=54;m.call(desktop,controller().t.placeItem,other,idp,visible,new t0());m.call(desktop,controller().t.repack,idp,new z1.y0(),other,false);bound(m,6,4);check(!controller().owns&&!other.prefs.getBoolean("owned",false),"dormant row retained while native restoration completes");
  other=new Context();request(true,6,4);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(!desktop.d,"same native shape needs no migration");request(false,6,4);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,4);check(!controller().owns&&!other.prefs.getBoolean("owned",false),"same-shape disable relinquishes without fabricating a migration snapshot");
  other=new Context();LauncherOwnedStateClient.unavailable=true;request(true,3,3);SQLiteDatabase.data=new long[][]{{77,-100,8,9,2,2,0}};
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);
  check(controller().storageUnavailable&&idp.G0==11&&idp.H0==10,"private provider failure preserves actual occupied bounds");
  check(!desktop.d&&other.prefs.values.isEmpty(),"provider failure cannot start migration or fabricate ownership");
  C2 protectedLauncher=new C2();protectedLauncher.ws.children.add(new CellLayout(11,10));m.call(protectedLauncher,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().workspaceRows==11&&controller().workspaceCols==10&&controller().applicationResult.equals("blocked"),"private-state outage still records actual bound fallback geometry without reporting applied");
  check(FeatureSettings.report.contains("configuration_received")&&FeatureSettings.report.contains("binding_result"),"failed private-state read retains requested configuration and actual binding history");
  LauncherOwnedStateClient.unavailable=false;
  other=new Context();FeatureSettings.verified=false;request(true,8,6);SQLiteDatabase.data=new long[][]{{77,-100,0,0,1,1,0}};
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);
  check(controller().requested==null&&!controller().configurationVerified,"startup placeholder never impersonates a saved disabled request");
  check(controller().decision.equals("waiting_config")&&controller().state.equals("pending_restart"),"late startup snapshot explicitly reports wait and safe restart requirement");
  check(idp.G0==6&&idp.H0==4&&!desktop.d,"late snapshot cannot start an unverified migration");
  FeatureSettings.verified=true;FeatureSettings.revision=19;for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().latestRequested.enabled&&controller().latestRequested.rows==8&&controller().latestRevision==19,"ready snapshot preserves real enabled values and revision");
  check(FeatureSettings.report.contains("savedRows=8")&&FeatureSettings.report.contains("savedColumns=6")&&FeatureSettings.report.contains("saved_configuration_observed"),"latest saved configuration and phase history survive in exported runtime evidence");
  check(idp.G0==6&&idp.H0==4&&!desktop.d,"late delivery cannot mutate an already selected model shape");
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,8,6);
  check(controller().applicationResult.equals("applied")&&FeatureSettings.report.contains("binding_result")&&FeatureSettings.report.contains("profile_result"),"new process applies verified geometry with independent phase evidence");
  other=new Context();request(true,6,6);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);
  item=new y(0,0,1,1);item.id=77;m.call(desktop,controller().t.placeItem,other,idp,item,new t0());m.call(desktop,controller().t.repack,idp,new z1.y0(),other,false);
  C2 twoPages=new C2();twoPages.ws.children.add(new CellLayout(6,6));twoPages.ws.children.add(new CellLayout(6,4));m.call(twoPages,controller().t.finished,new com.android.launcher3.util.z0());
  check(other.prefs.getBoolean("migration_pending",false),"one mismatched workspace page cannot confirm migration even when the first page matches");
  check(controller().workspacePages==2&&!controller().workspaceConsistent&&controller().applicationResult.equals("geometry_mismatch"),"all native workspace pages contribute actual geometry evidence");
  check(FeatureSettings.report.contains("workspaceGeometry=[{childIndex=0, rows=6, columns=6}, {childIndex=1, rows=6, columns=4}]")&&FeatureSettings.report.contains("workspaceGeometryTruncated=false"),"each observed page records its actual rows and columns, including the mismatched second page");
  twoPages.ws.children.set(1,new CellLayout(6,6));idp.H0=4;m.call(twoPages,controller().t.finished,new com.android.launcher3.util.z0());
  check(other.prefs.getBoolean("migration_pending",false)&&controller().applicationResult.equals("geometry_mismatch"),"matching pages cannot hide a mismatched IDP or release recovery ownership");
  idp.H0=6;other.prefs.writable=false;m.call(twoPages,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().applicationResult.equals("recovery_commit_failed")&&other.prefs.getBoolean("migration_pending",false),"failed completion write remains pending and cannot report success");
  other.prefs.writable=true;m.call(twoPages,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().applicationResult.equals("applied")&&!other.prefs.getBoolean("migration_pending",true)&&controller().error.isEmpty(),"complete actual geometry and durable completion recover the result");
  request(true,7,5);FeatureSettings.revision=20;for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().requested.rows==6&&controller().latestRequested.rows==7&&controller().latestRevision==20,"pending setting preserves applied request while exposing latest saved values");
  check(FeatureSettings.report.contains("savedRows=7")&&FeatureSettings.report.contains("requestedRows=6")&&FeatureSettings.report.contains("applicationResult=pending_restart"),"export distinguishes saved selection and still-active applied geometry");
  request(true,6,6);FeatureSettings.revision=21;for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().state.equals("active")&&controller().applicationResult.equals("applied")&&controller().error.isEmpty()&&!controller().settingsPending,"returning to the already applied request clears only the pending settings overlay");
  check(FeatureSettings.report.contains("customApplied=true")&&FeatureSettings.report.contains("saved_configuration_matches_current"),"matched selection exports the independently verified prior application result");
  request(true,7,5);for(Runnable listener:FeatureSettings.listeners)listener.run();twoPages.ws.children.set(1,new CellLayout(6,4));m.call(twoPages,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().observedApplicationResult.equals("geometry_mismatch")&&FeatureSettings.report.contains("observedError=桌面实际行列与目标不一致"),"a real binding fault during pending settings replaces the underlying application evidence");
  request(true,6,6);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().applicationResult.equals("geometry_mismatch")&&!controller().error.isEmpty()&&FeatureSettings.report.contains("customApplied=false"),"reverting settings preserves a newer actual geometry fault and cannot report success");
  for(int i=0;i<30;i++)controller().event("later_bind","sequence="+i);controller().report(true);
  check(controller().events.size()==12&&FeatureSettings.report.contains("configuration_received")&&FeatureSettings.report.contains("grid_decision")&&FeatureSettings.report.contains("sequence=29"),"bounded history retains original request and decision alongside the newest actual observation");
  other=new Context();request(true,8,6);m=fresh();desktop=new b0();desktop.failProfile=true;idp=new F1();boolean profileFailed=false;
  try{set(m,desktop,idp,other,6,4);}catch(IllegalStateException expected){profileFailed=true;}
  check(profileFailed&&desktop.gridCalls==1&&idp.G0==6&&idp.H0==4,"native profile failure is propagated unchanged and never retried or patched directly");
  check(controller().applicationResult.equals("native_profile_failed")&&FeatureSettings.report.contains("native_profile_failed")&&FeatureSettings.report.contains("customApplied=false"),"native application exception remains explicit failure in the default runtime export");
  request(true,7,5);for(Runnable listener:FeatureSettings.listeners)listener.run();request(true,8,6);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().applicationResult.equals("native_profile_failed")&&!controller().error.isEmpty(),"reverting settings cannot erase an OEM application exception");
  other=new Context();request(true,3,3);SQLiteDatabase.data=new long[][]{{91,-100,0,0,5,2,0}};m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);String blockedReason=controller().error;
  request(true,8,8);for(Runnable listener:FeatureSettings.listeners)listener.run();request(true,3,3);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().state.equals("blocked")&&controller().applicationResult.equals("blocked")&&controller().error.equals(blockedReason),"reverting to a blocked request restores its precheck reason instead of declaring success");
  other=new Context();request(true,6,6);SQLiteDatabase.data=new long[][]{{77,-100,0,0,1,1,0}};m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);C2 incomplete=new C2();incomplete.ws.children.add(new CellLayout(6,6));m.call(incomplete,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().applicationResult.equals("migration_incomplete"),"binding without a completed model repack remains incomplete");
  request(true,7,5);for(Runnable listener:FeatureSettings.listeners)listener.run();request(true,6,6);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().applicationResult.equals("migration_incomplete")&&other.prefs.getBoolean("migration_pending",false),"reverting settings preserves unfinished migration and recovery ownership");
  item=new y(0,0,1,1);item.id=77;m.call(desktop,controller().t.placeItem,other,idp,item,new t0());m.call(desktop,controller().t.repack,idp,new z1.y0(),other,false);other.prefs.writable=false;m.call(incomplete,controller().t.finished,new com.android.launcher3.util.z0());
  request(true,7,5);for(Runnable listener:FeatureSettings.listeners)listener.run();m.call(incomplete,controller().t.finished,new com.android.launcher3.util.z0());request(true,6,6);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().applicationResult.equals("recovery_commit_failed")&&other.prefs.getBoolean("migration_pending",false),"a newer failed completion write during pending settings survives reversion");
  other=new Context();request(false,6,4);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);set(m,desktop,idp,other,7,5);bound(m,7,5);
  check(controller().applicationResult.equals("native_bound")&&!controller().owns&&controller().error.isEmpty(),"initial disabled native mode follows authoritative OEM grid changes without false mismatch");
  request(true,8,8);for(Runnable listener:FeatureSettings.listeners)listener.run();set(m,desktop,idp,other,8,5);bound(m,8,5);
  check(controller().settingsPending&&controller().latestRequested.enabled&&controller().latestRequested.columns==8&&!controller().owns&&controller().observedApplicationResult.equals("native_bound"),"a pending future custom request cannot make legitimate current native geometry a false mismatch or take ownership");
  request(false,6,4);for(Runnable listener:FeatureSettings.listeners)listener.run();
  check(controller().applicationResult.equals("native_bound")&&controller().error.isEmpty()&&controller().rows==8&&controller().cols==5&&!controller().settingsPending,"returning to saved off retains the latest authoritative native target under the former overlay");
  other=new Context();request(true,6,6);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,6);request(true,8,8);for(Runnable listener:FeatureSettings.listeners)listener.run();set(m,desktop,idp,other,8,5);bound(m,6,6);
  check(controller().owns&&controller().settingsPending&&controller().rows==6&&controller().cols==6&&idp.G0==6&&idp.H0==6,"pending requests cannot relax ownership or accept OEM targets over an applied custom shape");
  other=new Context();LauncherOwnedStateClient.unavailable=true;request(false,6,4);m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);request(true,8,8);for(Runnable listener:FeatureSettings.listeners)listener.run();set(m,desktop,idp,other,8,5);
  check(controller().storageUnavailable&&controller().rows==6&&controller().cols==4&&controller().observedApplicationResult.equals("profile_mismatch"),"private-state failures cannot be relabeled native-authoritative by a pending request");LauncherOwnedStateClient.unavailable=false;
  // The supplied 20542 log selected 5 columns x 7 rows but bound native 5 x 6
  // after an incomplete DB preflight. Reproduce the refusal and the next safe start,
  // and require phase evidence rather than merely a registered or returned hook.
  other=new Context();request(true,7,5);SQLiteDatabase.fail=true;FeatureSettings.revision=42;
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,5);bound(m,6,5);
  check(controller().requested.enabled&&controller().requested.rows==7&&controller().requested.columns==5,"log request reaches the actual hook as one verified generation");
  check(!controller().owns&&!desktop.d&&desktop.repackCalls==0&&other.prefs.values.isEmpty(),"incomplete first read preserves native grid and never migrates or claims ownership");
  check(controller().applicationResult.equals("blocked")&&controller().workspaceRows==6&&controller().workspaceCols==5,"bound=true cannot turn the logged native 5 x 6 refusal into custom success");
  check(FeatureSettings.report.contains("databaseReadState=read_failed")&&FeatureSettings.report.contains("databaseReadStage=open")&&FeatureSettings.report.contains("databaseReadError=IllegalStateException")&&FeatureSettings.report.contains("customApplied=false"),"new log identifies the failed DB phase alongside actual geometry");
  check(controller().error.contains("read_failed / open / IllegalStateException"),"blocked explanation includes bounded failure state and exception type");
  SQLiteDatabase.fail=false;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,5);bound(m,7,5);
  check(idp.G0==7&&idp.H0==5&&controller().workspaceRows==7&&controller().workspaceCols==5&&controller().applicationResult.equals("applied"),"fresh complete preflight applies logged 5 x 7 through native profile, model and actual workspace");
  check(SQLiteDatabase.lastFlags==(SQLiteDatabase.OPEN_READONLY|SQLiteDatabase.NO_LOCALIZED_COLLATORS),"read-only opener matches verified OEM NoLocaleSQLiteHelper flags");
  check(!other.prefs.getBoolean("migration_pending",true)&&FeatureSettings.report.contains("database_preflight")&&FeatureSettings.report.contains("profile_result")&&FeatureSettings.report.contains("binding_result"),"5 x 7 completion requires durable migration and all application phases");
  other.failPath=true;LauncherGridHook.Readout unread=LauncherGridHook.Readout.read(other,"launcher.db");
  check(!unread.complete&&unread.state.equals("read_failed")&&unread.stage.equals("path")&&unread.error.equals("SecurityException"),"database-path failure remains a classified incomplete read");other.failPath=false;
  SQLiteDatabase.failQuery=true;unread=LauncherGridHook.Readout.read(other,"launcher.db");SQLiteDatabase.failQuery=false;
  check(!unread.complete&&unread.stage.equals("query")&&unread.error.equals("UnsupportedOperationException")&&unread.items.isEmpty(),"schema/query failures remain distinguishable from opening failures");
  SQLiteDatabase.data=new long[][]{{77,-100,8,9,2,2,0},{78,-100,0,0,1,1,0}};android.database.Cursor.failAfter=1;
  unread=LauncherGridHook.Readout.read(other,"launcher.db");android.database.Cursor.failAfter=-1;
  check(!unread.complete&&unread.stage.equals("rows")&&unread.items.isEmpty()&&unread.placements.isEmpty()&&unread.slots.isEmpty()&&unread.extentRows==0&&unread.extentCols==0,"partial cursor rows and their extents never escape as a usable preflight snapshot");
  android.database.Cursor.failClose=true;unread=LauncherGridHook.Readout.read(other,"launcher.db");android.database.Cursor.failClose=false;
  check(!unread.complete&&unread.state.equals("read_failed")&&unread.stage.equals("cursor_close")&&unread.error.equals("IllegalStateException")&&unread.items.isEmpty()&&unread.extentRows==0,"cursor close failure cannot publish complete rows or partial extents");
  SQLiteDatabase.failClose=true;unread=LauncherGridHook.Readout.read(other,"launcher.db");SQLiteDatabase.failClose=false;
  check(!unread.complete&&unread.state.equals("read_failed")&&unread.stage.equals("database_close")&&unread.error.equals("IllegalArgumentException")&&unread.items.isEmpty()&&unread.extentCols==0,"database close failure cannot publish complete rows or partial extents");
  android.database.Cursor.failAfter=1;SQLiteDatabase.failClose=true;unread=LauncherGridHook.Readout.read(other,"launcher.db");android.database.Cursor.failAfter=-1;SQLiteDatabase.failClose=false;
  check(!unread.complete&&unread.stage.equals("rows")&&unread.error.equals("IllegalStateException"),"suppressed close failure cannot replace the original row failure phase");
  // A private-state outage resolves through the real production controller and
  // OEM profile callback boundary, only after the initial model has finished.
  other=new Context();SQLiteDatabase.data=new long[][]{{77,-100,0,0,1,1,0}};request(true,8,6);
  LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);
  LauncherOwnedStateClient.ready();android.os.Handler.drain();
  check(controller().storageUnavailable&&idp.refreshCalls==0&&other.prefs.values.isEmpty(),"readiness cannot mutate a model before its first complete binding");
  bound(m,6,4);android.os.Handler.drain();
  check(!controller().storageUnavailable&&controller().owns&&idp.G0==8&&idp.H0==6,"ready private state did not re-evaluate and apply actual native profile");
  check(idp.refreshCalls==1&&desktop.d&&other.prefs.getBoolean("migration_pending",false),"recovery must persist migration responsibility before native model refresh");
  check(!controller().bindingObserved&&!controller().applicationResult.equals("applied"),"profile refresh was falsely reported as completed migration");
  bound(m,8,6);
  check(controller().applicationResult.equals("applied")&&!other.prefs.getBoolean("migration_pending",true),"native rebind did not validate and complete delayed migration");
  LauncherOwnedStateClient.ready();android.os.Handler.drain();bound(m,8,6);android.os.Handler.drain();
  check(idp.refreshCalls==1,"repeated ready/bound deliveries repeated migration");

  other=new Context();SQLiteDatabase.data=new long[][]{{88,-100,0,0,5,2,0}};request(true,3,3);
  LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,5);
  LauncherOwnedStateClient.ready();android.os.Handler.drain();
  check(controller().state.equals("blocked")&&!controller().storageUnavailable&&idp.refreshCalls==0,"late recovery bypassed oversize widget safety");
  check(other.prefs.values.isEmpty()&&!desktop.d,"blocked recovery wrote ownership or moved placements");
  check(controller().rows==6&&controller().cols==5&&idp.H0==5&&((Point)m.call(desktop,controller().t.getPoint,other)).y==5,"rejected ready target shrank protected occupied fallback geometry");

  other=new Context();SQLiteDatabase.data=new long[][]{{77,-100,0,0,1,1,0}};request(true,6,4);
  LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,4);
  LauncherOwnedStateClient.ready();android.os.Handler.drain();
  check(controller().applicationResult.equals("applied")&&controller().bindingObserved&&idp.refreshCalls==0,"matching shape waited forever for an OEM profile change that would not occur");
  check(other.prefs.getBoolean("owned",false)&&!other.prefs.getBoolean("migration_pending",true),"same-shape recovery did not durably re-establish ownership");

  other=new Context();SQLiteDatabase.data=new long[][]{{77,-100,0,0,1,1,0}};request(true,8,6);
  LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,4);
  other.prefs.writable=false;LauncherOwnedStateClient.ready();android.os.Handler.drain();
  check(controller().state.equals("blocked")&&idp.refreshCalls==0&&!desktop.d,"failed durable recovery write must not refresh or migrate");

  other=new Context();request(true,8,6);LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,4);
  request(false,6,4);LauncherOwnedStateClient.ready();android.os.Handler.drain();bound(m,6,4);
  check(!controller().owns&&controller().applicationResult.equals("native_bound")&&!other.prefs.getBoolean("owned",false),"disabled setting while waiting was replaced by stale enabled request");

  other=new Context();request(true,8,6);LauncherOwnedStateClient.unavailable=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);bound(m,6,4);
  idp.failRefresh=true;LauncherOwnedStateClient.ready();android.os.Handler.drain();
  check(controller().applicationResult.equals("profile_refresh_failed")&&other.prefs.getBoolean("migration_pending",false),"native refresh failure lost durable recovery responsibility or forged success");
  other=new Context();request(true,6,4);LauncherOwnedStateClient.unavailable=false;
  other.prefs.values.putAll(Map.of("owned",true,"original_rows",5,"original_columns",4,"effective_rows",6,"effective_columns",4,"migration_pending",false));
  check(other.getDatabasePath("launcher.db").delete(),"fixture missing database setup");SQLiteDatabase.data=new long[][]{{1,-100,0,0,1,1,0}};
  m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);check(controller().state.equals("blocked"),"missing database initially claimed success");
  other.getDatabasePath("launcher.db").createNewFile();int gridCalls=desktop.gridCalls;bound(m,6,4);
  check(controller().state.equals("active")&&controller().applicationResult.equals("applied")&&controller().error.isEmpty(),"complete same-source database left safe existing geometry permanently blocked");
  check(desktop.gridCalls==gridCalls&&desktop.repackCalls==0&&!desktop.d,"read recovery modified native geometry or placements");
  check(FeatureSettings.report.contains("databaseSource=")&&FeatureSettings.report.contains("canonicalPathHash=")&&FeatureSettings.report.contains("storage=credential")&&FeatureSettings.report.contains("configuredIdpIdentity="),"source identity metadata missing");
  check(!FeatureSettings.report.contains(other.dir.getAbsolutePath()),"private absolute database path leaked to diagnostics");

  other=new Context();request(true,8,6);other.prefs.values.putAll(Map.of("owned",true,"original_rows",5,"original_columns",4,"effective_rows",6,"effective_columns",4,"migration_pending",false));
  other.getDatabasePath("launcher.db").delete();m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);other.getDatabasePath("launcher.db").createNewFile();bound(m,6,4);
  check(controller().state.equals("blocked")&&controller().applicationResult.equals("blocked")&&idp.G0==6&&idp.H0==4&&desktop.repackCalls==0,"complete read blindly applied a different requested shape");

  other=new Context();request(true,6,4);SQLiteDatabase.fail=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);SQLiteDatabase.fail=false;
  SQLiteDatabase.data=new long[][]{{1,-100,0,0,9,1,0}};bound(m,6,4);
  check(controller().state.equals("blocked")&&desktop.repackCalls==0&&!other.prefs.getBoolean("owned",false),"read recovery bypassed widget/span safety");

  other=new Context();request(true,6,4);SQLiteDatabase.fail=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);SQLiteDatabase.fail=false;SQLiteDatabase.data=new long[][]{{1,-100,0,0,1,1,0}};
  java.io.File original=other.getDatabasePath("launcher.db");java.nio.file.Files.move(original.toPath(),new java.io.File(other.dir,"retained.db").toPath());original.createNewFile();android.system.Os.generation++;bound(m,6,4);
  check(controller().state.equals("blocked")&&controller().error.contains("来源已改变"),"new inode inherited old database decision");

  other=new Context();request(true,6,4);SQLiteDatabase.fail=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);SQLiteDatabase.fail=false;idp.E1="other.db";other.getDatabasePath("other.db").createNewFile();bound(m,6,4);
  check(controller().state.equals("blocked")&&controller().error.contains("来源已改变"),"same profile changed database basename without a source barrier");

  other=new Context();request(true,6,4);SQLiteDatabase.fail=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);SQLiteDatabase.fail=false;request(true,8,8);for(Runnable listener:FeatureSettings.listeners)listener.run();bound(m,6,4);
  check(controller().settingsPending&&controller().applicationResult.equals("pending_restart")&&controller().observedApplicationResult.equals("applied")&&idp.G0==6&&idp.H0==4,"read recovery promoted newer pending settings instead of original current geometry");
  other=new Context();request(true,6,4);SQLiteDatabase.fail=true;m=fresh();desktop=new b0();idp=new F1();set(m,desktop,idp,other,6,4);SQLiteDatabase.fail=false;
  C2 changedLauncher=new C2();CellLayout changedProfilePage=new CellLayout(6,4);controller().t.observedDpIdp.set(changedProfilePage.dp,new F1());changedLauncher.ws.children.add(changedProfilePage);m.call(changedLauncher,controller().t.finished,new com.android.launcher3.util.z0());
  check(controller().state.equals("blocked")&&controller().error.contains("来源已改变"),"read recovery trusted cached IDP after actual bound CellLayout changed profile object");
  final Context metadataContext=other;final Thread callerThread=Thread.currentThread();java.util.concurrent.CountDownLatch metadataDone=new java.util.concurrent.CountDownLatch(1);java.util.concurrent.atomic.AtomicReference<Thread> readThread=new java.util.concurrent.atomic.AtomicReference<>();java.util.concurrent.atomic.AtomicReference<LauncherDatabaseIdentity.Snapshot> asyncSource=new java.util.concurrent.atomic.AtomicReference<>();
  LauncherDatabaseIdentity.request(()->{readThread.set(Thread.currentThread());return LauncherDatabaseIdentity.read(metadataContext,"launcher.db");},value->{asyncSource.set(value);metadataDone.countDown();});
  check(metadataDone.await(5,java.util.concurrent.TimeUnit.SECONDS)&&readThread.get()!=callerThread&&readThread.get().getName().equals("LSA-LauncherDatabaseIdentity"),"database source metadata ran on UI/caller instead of bounded worker");check(asyncSource.get().valid()&&!asyncSource.get().signature().contains(metadataContext.dir.getAbsolutePath()),"asynchronous source lost real metadata identity or leaked private path");
  System.out.println("LauncherGrid production runtime: "+checks+" assertions PASS");
 }
}
'''
}

with tempfile.TemporaryDirectory(prefix='launcher-grid-') as tmp:
    out = Path(tmp)
    for name, content in sources.items():
        path = out / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
    production = [JAVA / 'hook/LauncherGridHook.java', JAVA / 'hook/LauncherWorkspaceProfile.java', JAVA / 'hook/LauncherDatabaseIdentity.java', JAVA / 'hook/LauncherGridIconFit.java', JAVA / 'LauncherGridSpec.java', JAVA / 'LauncherGridSafety.java', JAVA / 'LauncherGridMigrationCheck.java']
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(out), *map(str, out.rglob('*.java')), *map(str, production)], check=True)
    subprocess.run(['java', '-cp', str(out), 'ls.augment.com.hook.TestLauncherGridRuntime'], check=True)
