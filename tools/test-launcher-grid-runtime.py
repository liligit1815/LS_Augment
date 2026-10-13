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
'ls/augment/com/hook/LauncherOwnedStateClient.java':'package ls.augment.com.hook;import android.content.*;class LauncherOwnedStateClient {static boolean unavailable;static SharedPreferences preferences(Context c,String kind){if(unavailable)throw new IllegalStateException("provider unavailable");return c.prefs;}}',
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
public class Context {public static final int MODE_PRIVATE=0;public final SharedPreferences prefs=new SharedPreferences();public final File dir;
 public Context(){try{dir=java.nio.file.Files.createTempDirectory("grid-db-").toFile();getDatabasePath("launcher.db").createNewFile();}catch(Exception e){throw new RuntimeException(e);}}
 public Context getApplicationContext(){return this;}public SharedPreferences getSharedPreferences(String n,int m){return prefs;}public File getDatabasePath(String n){return new File(dir,n);}public android.content.res.Resources getResources(){return new android.content.res.Resources();}
}''',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=3.25f;}',
'android/database/Cursor.java': r'''
package android.database;
public class Cursor implements AutoCloseable {long[][] rows;int i=-1;public Cursor(long[][] data){rows=data;}public boolean moveToNext(){return ++i<rows.length;}public long getLong(int c){return c==6&&rows[i].length==6?0:rows[i][c];}public int getInt(int c){return (int)rows[i][c];}public void close(){}}
''',
'android/database/sqlite/SQLiteDatabase.java': r'''
package android.database.sqlite;import android.database.Cursor;
public class SQLiteDatabase implements AutoCloseable {public static final int OPEN_READONLY=1;public static long[][] data={};public static boolean fail;public static int reads;
 public static SQLiteDatabase openDatabase(String p,Object factory,int mode){if(mode!=OPEN_READONLY)throw new AssertionError("database writable");if(fail)throw new IllegalStateException("unreadable");reads++;return new SQLiteDatabase();}
 public Cursor rawQuery(String sql,String[]args){if(!sql.equals("SELECT _id,container,cellX,cellY,spanX,spanY,screen FROM favorites"))throw new AssertionError(sql);return new Cursor(data);}public void close(){}}
''',
'android/graphics/Point.java':'package android.graphics;public class Point{public int x,y;public Point(int x,int y){this.x=x;this.y=y;}}',
'android/view/View.java':'package android.view;public class View{}',
'android/view/ViewGroup.java':'package android.view;import java.util.*;public class ViewGroup extends View{public final List<View> children=new ArrayList<>();public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}',
'android/os/Process.java':'package android.os;public class Process{public static int myPid(){return 321;}}',
'org/json/JSONObject.java':'package org.json;import java.util.*;public class JSONObject{Map<String,Object> m=new LinkedHashMap<>();public JSONObject put(String k,Object v){m.put(k,v);return this;}public String toString(){return m.toString();}}',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig{public static int VERSION_CODE=20391;}',
'ls/augment/com/hook/FeatureSettings.java':r'''
package ls.augment.com.hook;import android.content.*;import java.util.*;
class FeatureSettings {static Map<String,String> values=new HashMap<>();static boolean verified=true;static List<Runnable> listeners=new ArrayList<>();static String report;
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
public class NativeDispatch{public static void call(Object owner,String name,Context context){try{Method m=owner.getClass().getDeclaredMethod(name,Context.class);m.setAccessible(true);AugmentModule.active.call(owner,m,context);}catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}}
''',
'com/android/launcher3/F1.java':'package com.android.launcher3;public class F1{public int G0=6,H0=4;public String E1="launcher.db";}',
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
public class b0{public boolean d;public Map<Integer,ArrayList<Object>> a=new HashMap<>();public boolean repackFlag;public int nativePlaced,gridCalls,repackCalls;
 private void r(F1 idp,Context c,int rows,int cols){idp.G0=rows;idp.H0=cols;gridCalls++;}
 public Point i(Context c){return new Point(6,4);}public Point k(Context c){return new Point(6,4);}public int j(Context c){return 0x64;}
 public boolean u(Context c,F1 idp,y item,t0 occupancy){nativePlaced++;return false;}
 public void g(F1 idp,z1.y0 model,Context c,boolean restore){repackCalls++;repackFlag=restore;}}
''',
'com/android/launcher3/h0.java':'package com.android.launcher3;import android.graphics.Point;import android.content.Context;public class h0{public int B1=195,C1=42,D1=10,J2=195,K2=10,H2=300,I2=215,H1,I1,calls,width=189,height=316;public float N2=42;public boolean Z0,b1,failDrawer;public Point k0(){return new Point(width,height);}public void p1(float scale,Context c){calls++;H1=B1+10;I1=B1+D1+C1;ls.augment.com.hook.NativeDispatch.call(this,"h1",c);}private void h1(Context c){J2=B1;N2=C1;K2=D1;H2=J2+(int)(N2*1.3)+K2;I2=J2+K2*2;if(failDrawer)throw new IllegalStateException("native drawer failed");}}',
'com/android/launcher3/CellLayout.java':'package com.android.launcher3;import android.view.View;public class CellLayout extends View{public int rows,cols;public h0 dp=new h0();public CellLayout(int rows,int cols){this.rows=rows;this.cols=cols;}public int getCountX(){return cols;}public int getCountY(){return rows;}public h0 getDeviceProfile(){return dp;}}',
'com/android/launcher3/C2.java':'package com.android.launcher3;import android.view.ViewGroup;public class C2{public ViewGroup ws=new ViewGroup();public void h(com.android.launcher3.util.z0 data){}public ViewGroup B2(){return ws;}}',
'ls/augment/com/hook/TestLauncherGridRuntime.java':r'''
package ls.augment.com.hook;
import android.content.*;import android.database.sqlite.SQLiteDatabase;import android.graphics.Point;import com.android.launcher3.*;import com.android.launcher3.model.data.y;import com.android.launcher3.util.t0;import java.lang.reflect.*;import java.util.*;import ls.augment.com.*;
public class TestLauncherGridRuntime {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static b0 currentDesktop;static F1 currentIdp;static Context currentContext;
 static void request(boolean enabled,int rows,int cols){FeatureSettings.values.putAll(new LauncherGridSpec(enabled,rows,cols).values());}
 static AugmentModule fresh()throws Exception{Field f=LauncherGridHook.class.getDeclaredField("installed");f.setAccessible(true);f.setBoolean(null,false);FeatureSettings.listeners.clear();AugmentModule m=new AugmentModule();LauncherGridHook.install(m,TestLauncherGridRuntime.class.getClassLoader());check(m.errors.isEmpty(),"signature install");check(m.hooks.size()==9,"all native endpoints");return m;}
 static LauncherGridHook.Controller controller()throws Exception{Field f=LauncherGridHook.class.getDeclaredField("controller");f.setAccessible(true);return (LauncherGridHook.Controller)f.get(null);}
 static void set(AugmentModule m,b0 grid,F1 idp,Context context,int rows,int cols)throws Throwable{currentDesktop=grid;currentIdp=idp;currentContext=context;m.call(grid,controller().t.setGrid,idp,context,rows,cols);}
 static void bound(AugmentModule m,int rows,int cols)throws Throwable{
  if(controller().owns&&controller().saved.getBoolean("migration_pending",false)&&controller().migratedRows==null){
   for(long[] row:SQLiteDatabase.data)if(row[1]==-100){y item=new y((int)row[2],(int)row[3],(int)row[4],(int)row[5]);item.id=row[0];item.screenId=row.length>6?(int)row[6]:0;m.call(currentDesktop,controller().t.placeItem,currentContext,currentIdp,item,new t0());}
   m.call(currentDesktop,controller().t.repack,currentIdp,new z1.y0(),currentContext,false);
  }
  C2 launcher=new C2();launcher.ws.children.add(new CellLayout(rows,cols));m.call(launcher,controller().t.finished,new com.android.launcher3.util.z0());}
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
  LauncherOwnedStateClient.unavailable=false;
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
    production = [JAVA / 'hook/LauncherGridHook.java', JAVA / 'hook/LauncherGridIconFit.java', JAVA / 'LauncherGridSpec.java', JAVA / 'LauncherGridSafety.java', JAVA / 'LauncherGridMigrationCheck.java']
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(out), *map(str, out.rglob('*.java')), *map(str, production)], check=True)
    subprocess.run(['java', '-cp', str(out), 'ls.augment.com.hook.TestLauncherGridRuntime'], check=True)
