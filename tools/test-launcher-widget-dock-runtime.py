"""Exercise the production widget/Dock hooks against both verified OEM member families.

These Android and OEM doubles expose metadata, native call boundaries, drawable
bounds, OEM slot geometry and loader occupancy. Geometry assertions call the
production hooks; phone rendering/drag/persistence are verified separately.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
COMMON = {
    'android/content/Context.java': '''package android.content;public class Context {public Context getApplicationContext(){return this;}
        public java.io.File getDatabasePath(String n){try{return java.io.File.createTempFile("dock-fixture-",".db");}catch(Exception e){throw new RuntimeException(e);}}}''',
    'android/os/Bundle.java': 'package android.os;public class Bundle {public String getString(String k,String d){return d;}}',
    'android/database/Cursor.java': '''package android.database;public class Cursor implements AutoCloseable {public int rows=100,position=-1;
        public long[][] data=new long[0][];public int getCount(){return rows;}public android.os.Bundle getExtras(){return new android.os.Bundle();}
        public boolean moveToNext(){return ++position<data.length;}public long getLong(int i){return data[position][i];}public int getInt(int i){return (int)getLong(i);}public void close(){}}''',
    'android/database/sqlite/SQLiteDatabase.java': '''package android.database.sqlite;import java.util.*;import android.database.Cursor;
        public class SQLiteDatabase implements AutoCloseable {public static final int OPEN_READONLY=1;public static SQLiteDatabase current=new SQLiteDatabase();
        public final Map<String,List<long[]>> tables=new HashMap<>();public boolean fail;public int reads,writes;
        public static SQLiteDatabase openDatabase(String p,Object f,int flag){if(flag!=OPEN_READONLY)throw new AssertionError("read-only loader database");return current;}
        public Cursor rawQuery(String sql,String[] args){reads++;if(fail)throw new IllegalStateException("read failed");
        String table=sql.contains("favorites_tmp")?"favorites_tmp":"favorites";List<long[]> rows=tables.getOrDefault(table,new ArrayList<>());
        List<long[]> result=new ArrayList<>();for(long[] row:rows)if(row[2]==-101)result.add(sql.startsWith("SELECT _id")?new long[]{row[0],row[1]}:new long[]{row[1],rows.size()});
        Cursor c=new Cursor();c.data=result.toArray(new long[0][]);c.rows=c.data.length;return c;}public void close(){}}
    ''',
    'android/view/ViewParent.java': 'package android.view;public interface ViewParent {ViewParent getParent();}',
    'android/view/View.java': '''package android.view;import android.content.Context;public class View implements ViewParent {
        public final Context context;public ViewParent parent;public Object tag;public int measuredWidth=1080,measuredHeight=210;
        public int left,top,right,bottom,paddingLeft,paddingRight,paddingTop,paddingBottom;public float scaleX=1,scaleY=1;
        public View(Context c){context=c;}public Context getContext(){return context;}public ViewParent getParent(){return parent;}public Object getTag(){return tag;}
        public int getMeasuredWidth(){return measuredWidth;}public int getMeasuredHeight(){return measuredHeight;}
        public int getPaddingLeft(){return paddingLeft;}public int getPaddingRight(){return paddingRight;}
        public int getPaddingTop(){return paddingTop;}public int getPaddingBottom(){return paddingBottom;}
        public void setPadding(int l,int t,int r,int b){paddingLeft=l;paddingTop=t;paddingRight=r;paddingBottom=b;}
        public void invalidate(){}public static class MeasureSpec {public static int getSize(int s){return s&0x3fffffff;}}}''',
    'android/view/ViewGroup.java': '''package android.view;import android.content.Context;import java.util.*;public class ViewGroup extends View {
        public final List<View> children=new ArrayList<>();public ViewGroup(Context c){super(c);}public int getChildCount(){return children.size();}
        public void addView(View v){children.add(v);v.parent=this;}public View getChildAt(int i){return children.get(i);}
        public void onViewRemoved(View v){children.remove(v);v.parent=null;}}''',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect {public int left,top,right,bottom;
        public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
        public int width(){return right-left;}public int height(){return bottom-top;}}''',
    'android/graphics/Point.java': 'package android.graphics;public class Point {public int x,y;public Point(int x,int y){this.x=x;this.y=y;}}',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;import android.graphics.Rect;
        public class Drawable {public final Rect bounds=new Rect();public Rect getBounds(){return bounds;}
        public void setBounds(int l,int t,int r,int b){bounds.left=l;bounds.top=t;bounds.right=r;bounds.bottom=b;}}''',
    'android/appwidget/AppWidgetProviderInfo.java': '''package android.appwidget;public class AppWidgetProviderInfo {
        public static final int RESIZE_HORIZONTAL=1,RESIZE_VERTICAL=2;public int resizeMode;}''',
    'android/appwidget/AppWidgetHostView.java': '''package android.appwidget;import android.content.Context;import android.view.View;
        public class AppWidgetHostView extends View {public AppWidgetProviderInfo info;public AppWidgetHostView(Context c){super(c);}
        public AppWidgetProviderInfo getAppWidgetInfo(){return info;}}''',
    'android/util/SparseArray.java': '''package android.util;import java.util.*;public class SparseArray<T> {
        final Map<Integer,T> values=new HashMap<>();public T get(int k){return values.get(k);}public void put(int k,T v){values.put(k,v);}}''',
    'android/os/Process.java': 'package android.os;public class Process {public static int myPid(){return 991;}}',
    'org/json/JSONObject.java': '''package org.json;import java.util.*;public class JSONObject {final Map<String,Object> values=new LinkedHashMap<>();
        public JSONObject put(String k,Object v){values.put(k,v);return this;}public String toString(){return values.toString();}}''',
    'org/json/JSONArray.java': '''package org.json;import java.util.*;public class JSONArray {final List<Object> values=new ArrayList<>();
        public JSONArray put(Object v){values.add(v);return this;}public String toString(){return values.toString();}}''',
    'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20543;}',
    'ls/augment/com/LauncherOptions.java': '''package ls.augment.com;public class LauncherOptions {
        public static final String WIDGET_RESIZE="ls_augment_rm_launcher_widget_resize",DOCK_UNLIMITED="ls_augment_rm_launcher_dock_unlimited";}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;import java.util.*;
        class FeatureSettings {static final Map<String,Boolean> values=new HashMap<>();static final Map<String,String> reports=new HashMap<>();
        static final List<Runnable> listeners=new ArrayList<>();static boolean enabled(Context c,String k){return values.getOrDefault(k,false);}
        static void addSnapshotListener(Context c,Runnable r){listeners.add(r);}static void diagnostic(Context c,String k,String v){reports.put(k,v);}
        static void change(String k,boolean v){values.put(k,v);for(Runnable r:new ArrayList<>(listeners))r.run();}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
        public class AugmentModule {public static AugmentModule active;public AugmentModule(){active=this;}
        public final Map<Method,Hook> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();
        interface Interceptor {Object call(Chain c)throws Throwable;}static class Hook {final Method m;Interceptor i;Hook(Method m){this.m=m;}
        Hook intercept(Interceptor i){this.i=i;return this;}}Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}
        void registerFeatureHook(Hook h){hooks.put(h.m,h);}void logFeatureError(String k,Throwable t){errors.add(t);}
        static class Chain {final Object owner;final Method method;final Object[] args;Chain(Object o,Method m,Object[] a){owner=o;method=m;args=a;}
        Object getThisObject(){return owner;}Object getArg(int i){return args[i];}Object proceed()throws Throwable {return proceed(args);}
        Object proceed(Object[] values)throws Throwable {try{method.setAccessible(true);
        return method.invoke(owner,values);}catch(InvocationTargetException e){throw e.getCause();}}}
        public Object call(Object o,Method m,Object...args)throws Throwable {Hook h=hooks.get(m);return h==null?new Chain(o,m,args).proceed():h.i.call(new Chain(o,m,args));}}''',
    'com/android/launcher3/dragndrop/DragLayer.java': 'package com.android.launcher3.dragndrop;public class DragLayer {}',
}


def sources(named):
    ids = dict(idp='InvariantDeviceProfile', provider='LauncherAppWidgetProviderInfo', host='LauncherAppWidgetHostView',
               item='ItemInfo', launcher='Launcher', grid='GridOccupancy', cursor='com.android.launcher3.model.LoaderCursor',
               utils='com.android.launcher3.hotseat.HotseatUtils', animation='com.android.launcher3.hotseat.HotseatDivideAnimation',
               rows='numRows', cols='numColumns', dbcount='numDatabaseHotseatIcons', minx='minSpanX', miny='minSpanY',
               maxx='maxSpanX', maxy='maxSpanY', init='initSpans', setup='setupForWidget', resize='resizeWidgetIfNeeded',
               capacity='getNumHotseatIcons', bind='setHotseatCountXY', enter='enterHotseatLayout', reset='resetHotseatChildPosition',
               animlauncher='mLauncher', gethotseat='getHotseat', placement='checkItemPlacement', cursoridp='mIDP',
               occupied='mOccupied', cells='cells', bubble3='setIconSize',folder3='setIconSize',apply='applyCompoundDrawables',
               preview='PreviewBackground',activity='ActivityContext',previewsetup='setup',mfv='com.android.launcher3.mfvUtil.MFVUtils',recent='isSupportHotseatRecent')
    if not named:
        ids.update(idp='F1', provider='U', host='T', item='y', launcher='C2', grid='t0', cursor='z1.y1', utils='p1.f',
                   animation='p1.a', rows='G0', cols='H0', dbcount='e1', minx='i', miny='j', maxx='k', maxy='l', init='v',
                   setup='l0', resize='j0', capacity='g', bind='A', enter='c', reset='i', animlauncher='g',
                   gethotseat='X1', placement='e', cursoridp='l', occupied='p', cells='c',bubble3='K0',folder3='k0',apply='t',
                   preview='u0',activity='k',previewsetup='Z0',mfv='x1.O',recent='C3')
    ids.update(migration='com.android.launcher3.model.GridSizeMigrationUtil' if named else 'z1.i1',
               helper='com.android.launcher3.model.DatabaseHelper' if named else 'z1.I0',
               state='com.android.launcher3.model.DeviceGridState' if named else 'z1.L0',
               reader='DbReader' if named else 'a', migrationmethod='migrate' if named else 't',
               readerdb='mDb' if named else 'a',readertable='mTableName' if named else 'b',readercontext='mContext' if named else 'c',
               cursorcontext='mContext' if named else 'h',dbfile='dbFile' if named else 'E1')
    data = dict(COMMON)
    def add(name, source):
        data[name.replace('.', '/')+'.java'] = source.format(**ids)
    add('com.android.launcher3.'+ids['idp'], '''package com.android.launcher3;public class {idp} {{
        public int {rows}=6,{cols}=4,{dbcount}=4;public String {dbfile}="launcher.db";public int nativeMinimumX=2,nativeMinimumY=3;}}''')
    add('com.android.launcher3.model.data.'+ids['item'], '''package com.android.launcher3.model.data;public class {item} {{
        public int id,container=-101,screenId,spanX=2,spanY=3;}}''')
    add('com.android.launcher3.LauncherSettings' if named else 'com.android.launcher3.S3',
        'package com.android.launcher3;public class LauncherSettings {{public static class Favorites {{public static String TABLE_NAME="favorites";}}}}'
        if named else 'package com.android.launcher3;public class S3 {{public static String a="favorites";}}')
    for key in ['helper','state']:
        name=ids[key];add(name,'package '+name.rsplit('.',1)[0]+';public class '+name.rsplit('.',1)[1]+' {{}}')
    migration_args='int bound,android.graphics.Point grid,{state} sourceState,{state} targetState' if named else 'int sourceBound,int bound,android.graphics.Point grid,{state} sourceState,{state} targetState'
    name=ids['migration'];add(name,'package '+name.rsplit('.',1)[0]+';public class '+name.rsplit('.',1)[1]+''' {{
        public static int calls,observedBound;public static boolean fail;public static class {reader} {{
        private final android.database.sqlite.SQLiteDatabase {readerdb};private final String {readertable};private final android.content.Context {readercontext};
        public {reader}(android.database.sqlite.SQLiteDatabase d,String t,android.content.Context c){{this.{readerdb}=d;this.{readertable}=t;this.{readercontext}=c;}}}}
        public static boolean {migrationmethod}({helper} helper,{reader} source,{reader} target,'''+migration_args+'''){{
        calls++;observedBound=bound;if(fail)throw new IllegalStateException("native migration failed");return true;}}}}''')
    add('com.android.launcher3.widget.'+ids['provider'], '''package com.android.launcher3.widget;import android.content.Context;
        public class {provider} extends android.appwidget.AppWidgetProviderInfo {{public int {minx}=2,{miny}=3,{maxx}=2,{maxy}=3;
        public int nativeInit;public void {init}(Context c,com.android.launcher3.{idp} idp) {{nativeInit++;resizeMode=0;
        {minx}=idp.nativeMinimumX;{miny}=idp.nativeMinimumY;{maxx}=2;{maxy}=3;}}}}''')
    host_override = 'public android.appwidget.AppWidgetProviderInfo getAppWidgetInfo(){return super.getAppWidgetInfo();}' if named else ''
    data['com/android/launcher3/widget/'+ids['host']+'.java'] = ('package com.android.launcher3.widget;import android.content.Context;'
        'public class '+ids['host']+' extends android.appwidget.AppWidgetHostView {public '+ids['host']+'(Context c){super(c);}'+host_override+'}')
    add('com.android.launcher3.CellLayout', '''package com.android.launcher3;import android.content.Context;import android.view.*;
        public class CellLayout extends ViewGroup {{public final ViewGroup content;public int x=4,y=6,measuredCapacity;
        public CellLayout(Context c){{super(c);content=new ViewGroup(c);addView(content);}}public int getCountX(){{return x;}}
        public int getCountY(){{return y;}}public ViewGroup getShortcutsAndWidgets(){{return content;}}
        protected void onMeasure(int w,int h){{measuredCapacity=ls.augment.com.hook.Dispatch.capacity(getContext());}}}}''')
    add('com.android.launcher3.Hotseat', 'package com.android.launcher3;public class Hotseat extends CellLayout {{public Hotseat(android.content.Context c){{super(c);}}}}')
    add('com.android.launcher3.views.'+ids['activity'], 'package com.android.launcher3.views;public interface {activity} {{}}')
    add(ids['mfv'], 'package '+ids['mfv'].rsplit('.',1)[0]+';public class '+ids['mfv'].rsplit('.',1)[1]+''' {{
        public static boolean enabled;public static boolean {recent}(){{return enabled;}}}}''')
    add('com.android.launcher3.BubbleTextView','''package com.android.launcher3;import android.content.Context;import android.graphics.drawable.Drawable;
        public class BubbleTextView extends android.view.View {{public int iconSize=148,dotSize=148,defaultSize=148;public boolean nativeRecent;
        public Drawable icon=new Drawable();public BubbleTextView(Context c){{super(c);icon.setBounds(0,0,148,148);}}
        public int getIconSize(){{return iconSize;}}public Drawable getIcon(){{return icon;}}
        public void setIconSize(int size){{iconSize=size;dotSize=size;icon.setBounds(0,0,size,size);}}
        public void {bubble3}(int size,int w,int h){{if(ls.augment.com.hook.Dispatch.recent())setIconSize(size);}}
        protected void onMeasure(int w,int h){{measuredWidth=w;measuredHeight=h;if(nativeRecent)ls.augment.com.hook.Dispatch.size3(this,defaultSize,w,h);}}
        protected void {apply}(Drawable value){{value.setBounds(0,0,iconSize,iconSize);icon=value;}}
        public void setIconBoundsScale(float ratio){{int inset=(int)((defaultSize-defaultSize*ratio)/2);icon.setBounds(inset,inset,defaultSize-inset,defaultSize-inset);}}}}''')
    add('com.android.launcher3.folder.FolderIcon','''package com.android.launcher3.folder;import android.content.Context;
        public class FolderIcon extends android.view.ViewGroup {{public int iconSize=148,defaultSize=148,dotSize=148,previewSize=148;
        public final {preview} background=new {preview}();public boolean nativeRecent;public FolderIcon(Context c){{super(c);background.icon=this;}}
        public int getIconSize(){{return iconSize;}}public void setIconSize(int s){{ls.augment.com.hook.Dispatch.size3(this,s,0,0);}}
        public void {folder3}(int s,int w,int h){{if(!ls.augment.com.hook.Dispatch.recent())return;iconSize=s;dotSize=s;previewSize=s;}}
        protected void onMeasure(int w,int h){{measuredWidth=w;measuredHeight=h;if(nativeRecent)ls.augment.com.hook.Dispatch.size3(this,defaultSize,w,h);}}
        public void draw(){{ls.augment.com.hook.Dispatch.preview(background,this,measuredWidth,getPaddingTop());}}}}''')
    add('com.android.launcher3.folder.'+ids['preview'],'''package com.android.launcher3.folder;import android.content.Context;import android.view.View;
        public class {preview} {{public FolderIcon icon;public int size=148,offsetX;public boolean fail;
        public void {previewsetup}(Context c,com.android.launcher3.views.{activity} a,View v,int w,int h){{
        size=ls.augment.com.hook.Dispatch.recent()?((FolderIcon)v).getIconSize():148;offsetX=(w-size)/2;
        if(fail)throw new IllegalStateException("native folder preview failure");}}}}''')
    add('com.android.launcher3.'+ids['launcher'], '''package com.android.launcher3;public class {launcher} {{public final Hotseat dock;
        public {launcher}(android.content.Context c){{dock=new Hotseat(c);}}public Hotseat {gethotseat}(){{return dock;}}}}''')
    add('com.android.launcher3.AppWidgetResizeFrame', '''package com.android.launcher3;import com.android.launcher3.widget.*;
        public class AppWidgetResizeFrame {{public int observedMode,minX,maxX,minY,maxY,nativeResizeCalls;public {host} view;
        private void {setup}({host} h,CellLayout c,com.android.launcher3.dragndrop.DragLayer drag){{view=h;
        {provider} info=({provider})ls.augment.com.hook.Dispatch.info(h);observedMode=info.resizeMode;minX=info.{minx};maxX=info.{maxx};minY=info.{miny};maxY=info.{maxy};}}
        private void {resize}(boolean commit){{nativeResizeCalls++;}}protected void onDetachedFromWindow(){{{resize}(true);}}}}''')
    add(ids['utils'], '''package '''+ids['utils'].rsplit('.', 1)[0]+''';import android.content.Context;import com.android.launcher3.*;
        public class '''+ids['utils'].rsplit('.', 1)[1]+''' {{public static int {capacity}(Context c){{return 4;}}
        public static void {bind}(Hotseat dock,int count){{dock.x=Math.max(1,count);dock.y=1;}}}}''')
    add(ids['animation'], '''package '''+ids['animation'].rsplit('.', 1)[0]+''';import com.android.launcher3.*;import android.view.*;
        public class '''+ids['animation'].rsplit('.', 1)[1]+''' {{private final {launcher} {animlauncher};public int observedCapacity;public boolean fail;
        public '''+ids['animation'].rsplit('.', 1)[1]+'''({launcher} l){{{animlauncher}=l;}}
        private void {enter}(CellLayout cell,View v,boolean fromDock){{observedCapacity=ls.augment.com.hook.Dispatch.capacity(cell.getContext());
        ls.augment.com.hook.Dispatch.measure(cell);if(fail)throw new IllegalStateException("native animation failure");}}
        public void {reset}(boolean close){{observedCapacity=ls.augment.com.hook.Dispatch.capacity({animlauncher}.dock.getContext());}}}}''')
    add('com.android.launcher3.util.'+ids['grid'], '''package com.android.launcher3.util;public class {grid} {{
        public final boolean[][] {cells};public {grid}(int x,int y){{{cells}=new boolean[x][y];}}}}''')
    add(ids['cursor'], '''package '''+ids['cursor'].rsplit('.', 1)[0]+''';import com.android.launcher3.*;import com.android.launcher3.model.data.*;
        import com.android.launcher3.util.*;import android.util.SparseArray;public class '''+ids['cursor'].rsplit('.', 1)[1]+''' extends android.database.Cursor {{
        private final {idp} {cursoridp};private final android.content.Context {cursorcontext}=new android.content.Context();
        private final SparseArray<{grid}> {occupied}=new SparseArray<>();public int calls,observedBound;public boolean fail;
        public '''+ids['cursor'].rsplit('.', 1)[1]+'''({idp} idp){{{cursoridp}=idp;}}
        protected boolean {placement}({item} item,boolean allApps){{calls++;observedBound={cursoridp}.{dbcount};if(fail)throw new IllegalStateException("native loader failure");
        if(item.container!=-101)return true;if(item.screenId>=observedBound)return false;{grid} g={occupied}.get(-101);
        if(g==null){{g=new {grid}(observedBound,1);{occupied}.put(-101,g);}}if(g.{cells}[item.screenId][0])return false;
        g.{cells}[item.screenId][0]=true;return true;}}}}''')
    add('ls.augment.com.hook.Dispatch', '''package ls.augment.com.hook;import android.content.Context;import android.appwidget.*;
        import com.android.launcher3.*;import java.lang.reflect.*;public class Dispatch {{
        public static int capacity(Context c){{try{{Class<?> utils=Class.forName("{utils}");Method m=utils.getDeclaredMethod("{capacity}",Context.class);
        return (Integer)AugmentModule.active.call(null,m,c);}}catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static AppWidgetProviderInfo info(AppWidgetHostView host){{try{{return (AppWidgetProviderInfo)AugmentModule.active.call(host,host.getClass().getMethod("getAppWidgetInfo"));}}
        catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static void measure(CellLayout cell){{try{{AugmentModule.active.call(cell,CellLayout.class.getDeclaredMethod("onMeasure",int.class,int.class),100,20);}}
        catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static boolean recent(){{try{{return (Boolean)AugmentModule.active.call(null,Class.forName("{mfv}").getDeclaredMethod("{recent}"));}}
        catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static void size3(Object v,int s,int w,int h){{try{{String name=v instanceof BubbleTextView?"{bubble3}":"{folder3}";
        AugmentModule.active.call(v,v.getClass().getDeclaredMethod(name,int.class,int.class,int.class),s,w,h);}}
        catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static void preview(Object p,View v,int w,int h){{try{{AugmentModule.active.call(p,p.getClass().getDeclaredMethod("{previewsetup}",Context.class,
        com.android.launcher3.views.{activity}.class,View.class,int.class,int.class),v.getContext(),null,v,w,h);}}
        catch(Throwable t){{throw new RuntimeException(t);}}}}}}'''.replace('import com.android.launcher3.*;import java.lang.reflect.*;','import com.android.launcher3.*;import android.view.View;import java.lang.reflect.*;'))
    add('ls.augment.com.hook.TestWidgetDock', '''package ls.augment.com.hook;import android.content.Context;import android.view.*;
        import android.appwidget.*;import com.android.launcher3.*;import com.android.launcher3.widget.*;import com.android.launcher3.model.data.*;
        import java.lang.reflect.*;import ls.augment.com.LauncherOptions;
        public class TestWidgetDock {{static int checks;static void check(boolean v,String label){{checks++;if(!v)throw new AssertionError(label);}}
        static void reset(Class<?> type)throws Exception{{Field f=type.getDeclaredField("installed");f.setAccessible(true);f.setBoolean(null,false);}}
        public static void main(String[]args)throws Throwable{{Context context=new Context();AugmentModule m=new AugmentModule();
        LauncherWidgetResizeHook.install(m,TestWidgetDock.class.getClassLoader());LauncherDockCapacityHook.install(m,TestWidgetDock.class.getClassLoader());
        check(m.errors.isEmpty(),"both complete OEM contracts install");check(m.hooks.size()==20,"all native boundaries registered");
        {idp} idp=new {idp}();{provider} info=new {provider}();Method init=info.getClass().getDeclaredMethod("{init}",Context.class,{idp}.class);
        m.call(info,init,context,idp);check(info.resizeMode==0&&info.{minx}==2&&info.{miny}==3,"disabled metadata remains native");
        FeatureSettings.change(LauncherOptions.WIDGET_RESIZE,true);check(info.resizeMode==3&&info.{minx}==1&&info.{miny}==1,"config enables both resize axes");
        check(info.{maxx}==4&&info.{maxy}==6,"initial resize bounds follow IDP grid");
        CellLayout workspace=new CellLayout(context);workspace.x=5;workspace.y=7;{host} host=new {host}(context);host.info=info;workspace.content.addView(host);
        check(Dispatch.info(host)==info&&info.{maxx}==5&&info.{maxy}==7,"entry preserves provider identity and current custom grid bounds");
        AppWidgetResizeFrame frame=new AppWidgetResizeFrame();Method setup=frame.getClass().getDeclaredMethod("{setup}",{host}.class,CellLayout.class,com.android.launcher3.dragndrop.DragLayer.class);
        setup.setAccessible(true);setup.invoke(frame,host,workspace,null);check(frame.observedMode==3&&frame.minX==1&&frame.maxX==5&&frame.maxY==7,"OEM frame sees handles and unlocked bounds");
        {item} widget=new {item}();widget.spanX=1;widget.spanY=2;host.tag=widget;FeatureSettings.change(LauncherOptions.WIDGET_RESIZE,false);
        check(info.resizeMode==0&&info.{minx}==2&&info.{maxx}==2,"disable restores provider policy");check(widget.spanX==1&&widget.spanY==2,"disable never rewrites saved widget placement");
        FeatureSettings.change(LauncherOptions.WIDGET_RESIZE,true);idp.nativeMinimumX=3;m.call(info,init,context,idp);
        FeatureSettings.change(LauncherOptions.WIDGET_RESIZE,false);check(info.{minx}==3&&info.nativeInit==2,"theme reinit captures updated OEM bounds");
        AppWidgetHostView foreign=new AppWidgetHostView(context);foreign.info=new AppWidgetProviderInfo();FeatureSettings.change(LauncherOptions.WIDGET_RESIZE,true);
        Dispatch.info(foreign);check(foreign.info.resizeMode==0,"framework host hook isolates foreign widgets");
        Method detached=frame.getClass().getDeclaredMethod("onDetachedFromWindow");detached.setAccessible(true);detached.invoke(frame);
        check(frame.nativeResizeCalls==1,"native resize commit remains reachable");
        {launcher} launcher=new {launcher}(context);Class<?> utils=Class.forName("{utils}");Method bind=utils.getDeclaredMethod("{bind}",Hotseat.class,int.class);
        Method cap=utils.getDeclaredMethod("{capacity}",Context.class);Class<?> animType=Class.forName("{animation}");Object animation=animType.getConstructor({launcher}.class).newInstance(launcher);
        Method enter=animType.getDeclaredMethod("{enter}",CellLayout.class,View.class,boolean.class);Field observed=animType.getField("observedCapacity");
        for(int n:new int[]{{4,5,8,17,27}}){{launcher.dock.content.children.clear();for(int i=0;i<n;i++)launcher.dock.content.addView(new View(context));
        m.call(null,bind,launcher.dock,n);FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);check((Integer)m.call(null,cap,context)==n,"layout capacity is actual count "+n);
        m.call(animation,enter,launcher.dock,null,false);check(observed.getInt(animation)==n+1,"native animation gets next slot with no fixed cap "+n);
        check(launcher.dock.measuredCapacity==n,"nested native measurement excludes prospective slot "+n);
        FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,false);m.call(animation,enter,launcher.dock,null,false);
        check(observed.getInt(animation)==n,"disabled retains existing extras and stops new expansion "+n);}}
        FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);animType.getField("fail").setBoolean(animation,true);boolean threw=false;
        try{{m.call(animation,enter,launcher.dock,null,false);}}catch(IllegalStateException expected){{threw=true;}}
        check(threw&&(Integer)m.call(null,cap,context)==27,"native animation exception restores expansion scope");
        Class<?> cursorType=Class.forName("{cursor}");Object cursor=cursorType.getConstructor({idp}.class).newInstance(idp);
        Method placement=cursorType.getDeclaredMethod("{placement}",{item}.class,boolean.class);Field bound=cursorType.getField("observedBound");
        FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,false);for(int rank:new int[]{{1,7,3,26,4}}){{{item} item=new {item}();item.screenId=rank;
        check((Boolean)m.call(cursor,placement,item,false),"saved extra Dock rank retained "+rank);check(idp.{dbcount}==4,"loader bound restored after rank "+rank);}}
        {item} duplicate=new {item}();duplicate.screenId=3;check(!(Boolean)m.call(cursor,placement,duplicate,false),"occupancy growth preserves duplicate rejection");
        check(bound.getInt(cursor)==4,"lower ranks retain native model bound");{item} desktop=new {item}();desktop.container=-100;desktop.screenId=999;
        check((Boolean)m.call(cursor,placement,desktop,false)&&idp.{dbcount}==4,"workspace bypasses Dock adapter");
        cursorType.getField("fail").setBoolean(cursor,true);{item} extra=new {item}();extra.screenId=40;threw=false;
        try{{m.call(cursor,placement,extra,false);}}catch(IllegalStateException expected){{threw=true;}}
        check(threw&&idp.{dbcount}==4,"native loader error restores IDP without migration");
        {item} invalid=new {item}();invalid.screenId=-1;check(!(Boolean)m.call(cursor,placement,invalid,false),"negative rank never allocates occupancy");
        invalid.screenId=Integer.MAX_VALUE-1;int priorCalls=cursorType.getField("calls").getInt(cursor);
        check(!(Boolean)m.call(cursor,placement,invalid,false)&&cursorType.getField("calls").getInt(cursor)==priorCalls,"corrupt huge rank is rejected before native array allocation");
        cursorType.getField("fail").setBoolean(cursor,false);((android.database.Cursor)cursor).rows=1000;{item} large=new {item}();large.screenId=800;
        check((Boolean)m.call(cursor,placement,large,false)&&idp.{dbcount}==4,"database-derived protection grows without a fixed Dock app cap");
        m.call(null,bind,launcher.dock,1);check(launcher.dock.x==801,"initial binding includes the loaded rank extent before item views exist");
        String widgetReport=FeatureSettings.reports.get(LauncherWidgetResizeHook.DIAGNOSTIC),dockReport=FeatureSettings.reports.get(LauncherDockCapacityHook.DIAGNOSTIC);
        check(widgetReport.contains("supported=true")&&dockReport.contains("dynamicCapacity=true"),"runtime reports supported adapters and dynamic contract");
        geometry(m,launcher,bind,context);
        sparseLoader(m,context,idp,cursorType,placement,bind,launcher);
        migration(m,context);
        reset(LauncherWidgetResizeHook.class);AugmentModule rejected=new AugmentModule();ClassLoader missing=new ClassLoader(TestWidgetDock.class.getClassLoader()){{
        protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{{if(name.equals("com.android.launcher3.AppWidgetResizeFrame"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}}}};
        LauncherWidgetResizeHook.install(rejected,missing);check(rejected.hooks.isEmpty()&&!rejected.errors.isEmpty(),"incomplete widget contract never registers metadata mutation");
        reset(LauncherDockCapacityHook.class);rejected=new AugmentModule();missing=new ClassLoader(TestWidgetDock.class.getClassLoader()){{
        protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{{if(name.equals("{cursor}"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}}}};
        LauncherDockCapacityHook.install(rejected,missing);check(rejected.hooks.isEmpty()&&!rejected.errors.isEmpty(),"incomplete persistence contract never registers Dock expansion");
        System.out.println("Widget/Dock production runtime '''+('Android 15 named' if named else 'Android 16 obfuscated')+''': "+checks+" assertions passed");}}
        static void sparseLoader(AugmentModule m,Context context,{idp} idp,Class<?> cursorType,Method placement,Method bind,{launcher} launcher)throws Throwable{{
            android.database.sqlite.SQLiteDatabase db=new android.database.sqlite.SQLiteDatabase();android.database.sqlite.SQLiteDatabase.current=db;
            java.util.List<long[]> rows=new java.util.ArrayList<>();rows.add(new long[]{{77,27,-101}});rows.add(new long[]{{78,3,-101}});db.tables.put("favorites",rows);
            Object filtered=cursorType.getConstructor({idp}.class).newInstance(idp);((android.database.Cursor)filtered).rows=1;
            {item} saved=new {item}();saved.id=77;saved.screenId=27;FeatureSettings.values.remove(LauncherOptions.DOCK_UNLIMITED);
            check((Boolean)m.call(filtered,placement,saved,false),"cold unready config retains saved sparse rank outside filtered and true row counts");
            check(idp.{dbcount}==4&&db.writes==0,"sparse loader restores IDP and only reads original DB");
            m.call(null,bind,launcher.dock,1);check(launcher.dock.x==28,"sparse stored rank remains inside the first binding grid");
            BubbleTextView retained=new BubbleTextView(context);retained.tag=saved;launcher.dock.content.addView(retained);
            m.call(null,bind,launcher.dock,1);check(launcher.dock.x==28,"later binding retains rank extent from actual Dock item tags");
            launcher.dock.content.children.clear();m.call(null,bind,launcher.dock,4);check(launcher.dock.x==4,"removed sparse items do not keep stale binding extent");
            {item} other=new {item}();other.id=78;other.screenId=3;check((Boolean)m.call(filtered,placement,other,false)&&db.reads==1,"persisted identity lookup is cached per loading cursor");
            {item} duplicate=new {item}();duplicate.id=77;duplicate.screenId=27;check(!(Boolean)m.call(filtered,placement,duplicate,false),"sparse saved ranks still retain duplicate occupancy rejection");
            {item} foreign=new {item}();foreign.id=99;foreign.screenId=27;int before=cursorType.getField("calls").getInt(filtered);
            check(!(Boolean)m.call(filtered,placement,foreign,false)&&cursorType.getField("calls").getInt(filtered)==before,"fabricated out-of-query row cannot allocate from a different saved identity");
            foreign.id=77;foreign.screenId=29;check(!(Boolean)m.call(filtered,placement,foreign,false),"persisted identity also requires matching container and rank");
            check(rows.get(0)[1]==27&&rows.get(1)[1]==3&&db.writes==0,"loading and binding never compact or rewrite saved app positions");
            m.call(null,bind,launcher.dock,4);
        }}
        static void migration(AugmentModule m,Context context)throws Throwable{{
            Class<?> type=Class.forName("{migration}"),reader=Class.forName("{migration}${reader}");
            Method method=java.util.Arrays.stream(type.getDeclaredMethods()).filter(v->v.getName().equals("{migrationmethod}")).findFirst().get();
            java.lang.reflect.Constructor<?> ctor=reader.getConstructor(android.database.sqlite.SQLiteDatabase.class,String.class,Context.class);
            android.database.sqlite.SQLiteDatabase from=new android.database.sqlite.SQLiteDatabase(),to=new android.database.sqlite.SQLiteDatabase();
            java.util.List<long[]> source=new java.util.ArrayList<>(),target=new java.util.ArrayList<>();
            from.tables.put("favorites_tmp",source);to.tables.put("favorites",target);
            Object s=ctor.newInstance(from,"favorites_tmp",context),d=ctor.newInstance(to,"favorites",context);
            Object[] args=method.getParameterCount()==7?new Object[]{{null,s,d,5,null,null,null}}:new Object[]{{null,s,d,5,5,null,null,null}};
            int targetIndex=method.getParameterCount()==7?3:4;
            for(int count:new int[]{{5,9,27}}){{source.clear();for(int i=0;i<count;i++)source.add(new long[]{{i,i,-101}});
                type.getField("calls").setInt(null,0);check((Boolean)m.call(null,method,args),"native migration return propagates");
                check(type.getField("observedBound").getInt(null)==count&&type.getField("calls").getInt(null)==1,"native migration copies all saved slots when switch is off "+count);
                check(args[targetIndex].equals(5)&&source.size()==count&&from.writes==0&&to.writes==0,"only invocation bounds expand; caller grid state and tables unchanged "+count);}}
            source.clear();source.add(new long[]{{77,27,-101}});type.getField("calls").setInt(null,0);m.call(null,method,args);
            check(type.getField("observedBound").getInt(null)==28&&source.get(0)[1]==27,"migration protects genuine sparse persisted rank without moving it");
            source.clear();source.add(new long[]{{77,Integer.MAX_VALUE-1L,-101}});m.call(null,method,args);
            check(type.getField("observedBound").getInt(null)==5&&FeatureSettings.reports.get(LauncherDockCapacityHook.MIGRATION_DIAGNOSTIC).contains("sourceRankOutsideDenseMemoryBudget=true"),"damaged huge stored rank cannot enlarge native migration allocation");
            source.clear();for(int i=0;i<9;i++)source.add(new long[]{{i,i,-101}});for(int i=0;i<7;i++)target.add(new long[]{{100+i,i,-101}});
            m.call(null,method,args);check(type.getField("observedBound").getInt(null)==16,"different source and destination Dock entries have enough union slots");
            Object same=ctor.newInstance(from,"favorites_tmp",context);args[2]=same;m.call(null,method,args);
            check(type.getField("observedBound").getInt(null)==9,"identical database table is not counted twice");args[2]=d;
            type.getField("fail").setBoolean(null,true);type.getField("calls").setInt(null,0);boolean threw=false;
            try{{m.call(null,method,args);}}catch(IllegalStateException expected){{threw=true;}}
            check(threw&&type.getField("calls").getInt(null)==1,"native migration error propagates once and never retries the writer");type.getField("fail").setBoolean(null,false);
            from.fail=true;type.getField("calls").setInt(null,0);m.call(null,method,args);
            check(type.getField("calls").getInt(null)==1&&type.getField("observedBound").getInt(null)==5,"preparation read failure invokes unmodified native call once");from.fail=false;
            String report=FeatureSettings.reports.get(LauncherDockCapacityHook.MIGRATION_DIAGNOSTIC);
            check(report.contains("preserveExistingWhenDisabled=true")&&report.contains("nativeGridPreferencesChanged=false"),"migration evidence distinguishes retention and temporary bounds");
        }}
        static void geometry(AugmentModule m,{launcher} launcher,Method bind,Context context)throws Throwable{{
        Hotseat dock=launcher.dock;Method bubbleMeasure=BubbleTextView.class.getDeclaredMethod("onMeasure",int.class,int.class);
        Class<?> folder=Class.forName("com.android.launcher3.folder.FolderIcon");Method folderMeasure=folder.getDeclaredMethod("onMeasure",int.class,int.class);
        Method removed=ViewGroup.class.getDeclaredMethod("onViewRemoved",View.class);Method set=BubbleTextView.class.getDeclaredMethod("setIconSize",int.class);
        Method bounds=BubbleTextView.class.getDeclaredMethod("setIconBoundsScale",float.class);
        Method apply=BubbleTextView.class.getDeclaredMethod("{apply}",android.graphics.drawable.Drawable.class);
        for(boolean vertical:new boolean[]{{false,true}})for(int extent:new int[]{{816,1080,1800}})for(int count:new int[]{{4,6,7,8,9,12,17,27}}){{
            dock.content.children.clear();m.call(null,bind,dock,count);dock.x=vertical?1:count;dock.y=vertical?count:1;
            dock.content.measuredWidth=vertical?210:extent;dock.content.measuredHeight=vertical?extent:210;
            dock.content.setPadding(vertical?0:24,vertical?24:0,vertical?0:24,vertical?24:0);
            int available=extent-48,slot=available/count;double previous=-1;
            FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);
            for(int i=0;i<count;i++){{View view=i==count-1?(View)folder.getConstructor(Context.class).newInstance(context):new BubbleTextView(context);
                dock.content.addView(view);view.left=vertical?0:i*slot;view.top=vertical?i*slot:0;
                view.right=view.left+(vertical?210:slot);view.bottom=view.top+(vertical?slot:210);
            }}
            for(int i=0;i<count;i++){{View v=dock.content.getChildAt(i);m.call(v,v instanceof BubbleTextView?bubbleMeasure:folderMeasure,vertical?210:slot,vertical?slot:210);
                int size=(Integer)v.getClass().getMethod("getIconSize").invoke(v);double center=(i+0.5)*slot;
                double start=center-size*1.1/2,end=center+size*1.1/2;
                check(start>=previous-0.001&&end<=available+0.001,"native drawable/press geometry nonoverlap "+vertical+"/"+extent+"/"+count+"/"+i);
                previous=end;check(v.scaleX==1&&v.scaleY==1,"touch Views retain native scale");
                if(v instanceof BubbleTextView){{BubbleTextView b=(BubbleTextView)v;check(b.icon.bounds.width()==size&&b.dotSize==size,"native drawable and dot sizes updated");
                    b.nativeRecent=true;m.call(b,bubbleMeasure,vertical?210:slot,vertical?slot:210);check(b.iconSize==size,"native recent size writer stays fitted");
                    for(float scale:new float[]{{1.1f,1f,0.75f}}){{m.call(b,bounds,scale);android.graphics.Rect r=b.icon.getBounds();
                        check(size==b.defaultSize||r.width()<=size&&r.left==0&&r.top==0,"fitted animation drawable uses normalized size coordinates");
                        double glyphStart=i*slot+(slot-size)/2.0+(vertical?r.top:r.left),glyphEnd=glyphStart+(vertical?r.height():r.width());
                        check(glyphStart>=i*slot-0.001&&glyphEnd<=(i+1)*slot+0.001,"actual drawable offsets stay inside native slot "+vertical+"/"+extent+"/"+count+"/"+i);
                    }}
                    android.graphics.drawable.Drawable replacement=new android.graphics.drawable.Drawable();m.call(b,apply,replacement);
                    check(b.icon==replacement&&replacement.bounds.width()==size,"native themed/custom drawable refresh retains fit");
                    m.call(b,bubbleMeasure,vertical?210:slot,vertical?slot:210);check(b.iconSize==size,"repeat measurement never compounds shrink");
                }}else{{v.getClass().getMethod("draw").invoke(v);Object bg=v.getClass().getField("background").get(v);
                    int preview=bg.getClass().getField("size").getInt(bg),offset=bg.getClass().getField("offsetX").getInt(bg);
                    check(preview==size&&offset==(v.measuredWidth-size)/2,"native folder preview equals fitted size and is centered");
                    check(!Dispatch.recent(),"folder native size scope restores global feature flag");}}
            }}
            FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,false);
            for(View v:new java.util.ArrayList<>(dock.content.children)){{int previousSize=(Integer)v.getClass().getMethod("getIconSize").invoke(v);
                m.call(v,v instanceof BubbleTextView?bubbleMeasure:folderMeasure,vertical?210:slot,vertical?slot:210);
                int size=(Integer)v.getClass().getMethod("getIconSize").invoke(v);
                check(count>4?size==previousSize:size==148,"disabled keeps extra items readable and restores native capacity size");}}
            View taken=dock.content.getChildAt(0);m.call(dock.content,removed,taken);check(((BubbleTextView)taken).iconSize==148,"drag removal restores native icon size");
            workspace.content.addView(taken);m.call(taken,bubbleMeasure,240,240);check(((BubbleTextView)taken).iconSize==148,"workspace icon after Dock departure remains native");
            workspace.content.children.clear();taken.parent=null;
        }}
        BubbleTextView desktop=new BubbleTextView(context);CellLayout workspace=new CellLayout(context);workspace.content.addView(desktop);
        FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);m.call(desktop,bubbleMeasure,70,210);check(desktop.iconSize==148,"narrow workspace does not receive Dock fitting");
        dock.content.children.clear();m.call(null,bind,dock,7);dock.content.measuredWidth=1080;dock.content.measuredHeight=210;dock.content.setPadding(24,0,24,0);
        com.android.launcher3.folder.FolderIcon folderItem=new com.android.launcher3.folder.FolderIcon(context);dock.content.addView(folderItem);
        BubbleTextView label=new BubbleTextView(context);folderItem.addView(label);m.call(label,bubbleMeasure,70,210);check(label.iconSize==148,"nested folder labels are isolated");
        BubbleTextView growing=new BubbleTextView(context);dock.content.addView(growing);m.call(growing,bubbleMeasure,147,210);
        m.call(growing,set,180);check(growing.iconSize<180,"native icon style change is fitted");m.call(dock.content,removed,growing);
        check(growing.iconSize==180,"departure restores latest native style size instead of stale original");
        m.call(folderItem,folderMeasure,147,210);folderItem.background.fail=true;boolean failed=false;
        try{{folderItem.draw();}}catch(RuntimeException expected){{failed=true;}}
        check(failed&&!Dispatch.recent(),"native folder preview error restores sizing scope in finally");
        folderItem.background.fail=false;folderItem.draw();check(folderItem.background.size==folderItem.iconSize,"folder preview can draw normally after native error");
        check(m.errors.isEmpty(),"geometry hooks complete without runtime errors");
        }} }}'''.replace('workspace.content.addView(taken);','CellLayout workspace=new CellLayout(context);workspace.content.addView(taken);'))
    return data


def main():
    for named in [False, True]:
        with tempfile.TemporaryDirectory(prefix='launcher-widget-dock-') as directory:
            root = Path(directory)
            for name, content in sources(named).items():
                target = root / name
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(content, encoding='utf-8')
            production = [JAVA / 'hook/LauncherWidgetResizeHook.java', JAVA / 'hook/LauncherDockCapacityHook.java']
            subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root), *map(str, root.rglob('*.java')), *map(str, production)], check=True)
            subprocess.run(['java', '-cp', str(root), 'ls.augment.com.hook.TestWidgetDock'], check=True)


if __name__ == '__main__':
    main()
