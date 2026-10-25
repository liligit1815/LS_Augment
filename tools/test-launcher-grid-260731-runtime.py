"""Exercise the complete grid safety lifecycle using the July Android 16 contract.

Class/member names and the native glyph-reset boundary are checked separately
against the supplied 16.0.010.000.2607311748 APK. These doubles run production
hooks; they do not replace native phone migration or certify a device result.
"""
import ast
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
tree = ast.parse((ROOT / 'tools/test-launcher-grid-runtime.py').read_text(encoding='utf-8'))
assignment = next(node for node in tree.body if isinstance(node, ast.Assign)
                  and any(isinstance(target, ast.Name) and target.id == 'sources' for target in node.targets))
original = ast.literal_eval(assignment.value)
types = {'F1': 'H1', 'C2': 'E2', 't0': 'u0', 'z0': 'A0'}
fields = {'G0': 'K0', 'H0': 'L0', 'E1': 'I1', 'C0': 'D0',
          'B1': 'C1', 'C1': 'D1', 'D1': 'E1', 'Z0': 'a1', 'b1': 'c1',
          'J2': 'K2', 'N2': 'O2', 'K2': 'L2', 'H2': 'I2', 'I2': 'J2'}


def rename(content, mapping):
    return re.sub(r'\b(' + '|'.join(map(re.escape, mapping)) + r')\b',
                  lambda m: mapping[m.group()], content)


sources = {}
for name, content in original.items():
    name, content = rename(name, types), rename(content, types)
    if name == 'z1/y0.java':
        name, content = 'C1/y0.java', 'package C1;public class y0{}'
    if name.startswith('com/android/launcher3/') or name.endswith('/TestLauncherGridRuntime.java'):
        content = rename(content, fields)
    content = content.replace('z1.y0', 'C1.y0')
    if name.endswith('/H1.java'):
        content = content.replace('public class H1{', 'public class H1{public P3 I0=new P3();public static H1 active;public H1(){active=this;}')
        content = content.replace(' K0(', ' L0(')
    if name.endswith('/h0.java'):
        content = content.replace(' k0(', ' n0(').replace(' p1(', ' s1(')
        content = content.replace(' h1(', ' k1(').replace('"h1"', '"k1"')
        content = content.replace('public class h0{', 'public class h0 extends d4{public int nativeLabel=42;')
        content = content.replace('public H1 D0;', 'public H1 D0=com.android.launcher3.H1.active;')
        content = content.replace('calls++;', 'calls++;ls.augment.com.hook.NativeJulyDispatch.glyphs(this,c,scale);')
    if name.endswith('/E2.java'):
        content = content.replace(' B2(', ' C2(').replace(' h(', ' i(')
    if name.endswith('/TestLauncherGridRuntime.java'):
        content = content.replace('check(m.hooks.size()==9,"all native endpoints");',
            'check(m.hooks.size()==10,"all July native endpoints");check(controller().t.adapter.equals("android16_260731"),"actual profile setter selects the July family despite old class names existing");')
        content = content.replace('dp.D1=48;', 'dp.D1=48;dp.nativeLabel=48;')
        content = content.replace('System.out.println("LauncherGrid production runtime:', '''
  Context julyFeedback=new Context();SQLiteDatabase.data=new long[0][];request(true,6,6);
  m=fresh();desktop=new b0();idp=new H1();set(m,desktop,idp,julyFeedback,6,4);bound(m,6,6);
  check(idp.K0==6&&idp.L0==6&&FeatureSettings.report.contains("state=active")
    &&FeatureSettings.report.contains("workspaceRows=6")&&FeatureSettings.report.contains("workspaceColumns=6")
    &&FeatureSettings.report.contains("bound=true")&&FeatureSettings.report.contains("migrationPending=false"),"July feedback requires actual bound six-column workspace and finished native migration");
  h0 unrelated=new h0();unrelated.D0=new H1();unrelated.width=94;unrelated.height=158;
  m.call(unrelated,controller().t.metrics,1f,julyFeedback);
  check(unrelated.C1==195&&unrelated.D1==42,"another actual profile remains native");
  boolean badType=false;try{LauncherGridHook.Targets.field(h0.class,"O2",int.class);}catch(IllegalStateException expected){badType=true;}
  check(badType,"drawer floating metric cannot replace an integer workspace metric");
  for(String table:new String[]{"doubleFavorites","easeFavorites","streamerFavorites","broken/table"}){
   Context alternate=new Context();alternate.prefs.values.putAll(Map.of("owned",true,"original_rows",6,"original_columns",4,"effective_rows",6,"effective_columns",6,"migration_pending",true));
   Map<String,?> beforeMode=new HashMap<>(alternate.prefs.getAll());int beforeReads=SQLiteDatabase.reads;
   Y3.a=table;request(true,6,6);m=fresh();desktop=new b0();idp=new H1();set(m,desktop,idp,alternate,6,4);
   check(!controller().owns&&controller().state.equals("blocked")&&controller().decision.equals("unsupported_table")&&idp.K0==6&&idp.L0==4,"alternate native table must not be mistaken for an empty primary desktop");
   check(alternate.prefs.getAll().equals(beforeMode)&&SQLiteDatabase.reads==beforeReads&&!desktop.d,"alternate mode preserves existing recovery record and native data");
   check(FeatureSettings.report.contains("databaseTable="+(table.contains("/")?"invalid":table)),"safe active table identifier explains blocked mode");
  }
  Y3.a="favorites";Context changedMode=new Context();request(true,6,6);m=fresh();desktop=new b0();idp=new H1();set(m,desktop,idp,changedMode,6,4);
  Map<String,?> pendingMode=new HashMap<>(changedMode.prefs.getAll());int beforeReads=SQLiteDatabase.reads;
  E2 afterSwitch=new E2();CellLayout switchedPage=new CellLayout(6,6);switchedPage.dp.D0=idp;afterSwitch.ws.children.add(switchedPage);Y3.a="doubleFavorites";
  m.call(afterSwitch,controller().t.finished,new com.android.launcher3.util.A0());
  check(!controller().owns&&controller().state.equals("blocked")&&controller().applicationResult.equals("blocked"),"mode change before binding never claims applied");
  check(changedMode.prefs.getAll().equals(pendingMode)&&changedMode.prefs.getBoolean("migration_pending",false)&&SQLiteDatabase.reads==beforeReads,"binding table barrier neither clears pending recovery nor reads the wrong table");
  Y3.a="favorites";
  for(String entry:new String[]{"profile","point","raw","encoded","place","repack","metrics","drawer","glyph"}){
   Context gate=new Context();request(true,6,6);m=fresh();desktop=new b0();idp=new H1();set(m,desktop,idp,gate,6,4);
   Map<String,?> beforeGate=new HashMap<>(gate.prefs.getAll());int beforeGateReads=SQLiteDatabase.reads;Y3.a="doubleFavorites";
   h0 gateDp=new h0();gateDp.width=94;gateDp.height=158;gateDp.D0=idp;
   if(entry.equals("profile")){set(m,desktop,idp,gate,6,4);check(idp.K0==6&&idp.L0==4,"changed mode uses native profile inputs");}
   else if(entry.equals("point")||entry.equals("raw")){Point nativePoint=(Point)m.call(desktop,entry.equals("point")?controller().t.getPoint:controller().t.getRawPoint,gate);check(nativePoint.x==6&&nativePoint.y==4,"changed mode cannot read stale custom shape");}
   else if(entry.equals("encoded"))check(((Integer)m.call(desktop,controller().t.getEncoded,gate))==0x64,"changed mode cannot read stale encoded custom shape");
   else if(entry.equals("place")){y nativeItem=new y(0,0,1,1);check(Boolean.FALSE.equals(m.call(desktop,controller().t.placeItem,gate,idp,nativeItem,new u0()))&&desktop.nativePlaced==1&&desktop.a.isEmpty(),"changed mode never executes custom placement or queues unchecked items");}
   else if(entry.equals("repack")){m.call(desktop,controller().t.repack,idp,new C1.y0(),gate,false);check(!desktop.repackFlag&&controller().migratedRows==null,"changed mode never forces custom repack or freezes unchecked placements");}
   else if(entry.equals("metrics")){m.call(gateDp,controller().t.metrics,1f,gate);check(gateDp.C1==195&&gateDp.calls==1,"changed mode never applies workspace glyph fitting");}
   else if(entry.equals("drawer"))m.call(gateDp,controller().t.drawerMetrics,gate);
   else m.call(gateDp,controller().t.glyphMetrics,gateDp,gate.getResources(),1f);
   check(!controller().owns&&controller().tableRejected&&controller().state.equals("blocked"),"every live endpoint checks table identity before customization: "+entry);
   check(gate.prefs.getAll().equals(beforeGate)&&SQLiteDatabase.reads==beforeGateReads&&gate.prefs.getBoolean("migration_pending",false),"live table barrier preserves recovery and avoids all database I/O: "+entry);
   Y3.a="favorites";Point afterReturn=(Point)m.call(desktop,controller().t.getPoint,gate);
   check(afterReturn.x==6&&afterReturn.y==4&&!controller().owns,"returning to primary mode requires a new safe process decision: "+entry);
  }
  Method detail=LauncherGridHook.class.getDeclaredMethod("missingInterface",Throwable.class);detail.setAccessible(true);
  check(detail.invoke(null,new ClassNotFoundException("Didn't find class "+(char)34+"com.android.launcher3.H1"+(char)34+" on path: /data/private/classes.dex")).equals("com.android.launcher3.H1"),"ART diagnostics retain only missing class, never DexPathList");
  check(detail.invoke(null,new NoSuchMethodException("com.android.launcher3.E2.i(com.android.launcher3.util.A0)")).equals("com.android.launcher3.E2.i(com.android.launcher3.util.A0)"),"method diagnostics retain the missing signature");
  check(detail.invoke(null,new ClassNotFoundException("/data/private/secret.db")).equals(""),"arbitrary path is rejected from missing-interface diagnostics");
  for(String source:new String[]{"","launcher.db"}){
   Context selection=new Context();request(true,6,6);m=fresh();desktop=new b0();idp=new H1();idp.I0.source=source;set(m,desktop,idp,selection,6,4);bound(m,6,6);
   check(controller().owns&&controller().applicationResult.equals("applied")&&controller().databaseSelection.equals("profile"),"empty or persisted matching native database name permits the verified profile");
  }
  for(boolean failedRead:new boolean[]{false,true}){
   Context selection=new Context();selection.prefs.values.putAll(Map.of("owned",true,"original_rows",6,"original_columns",4,"effective_rows",6,"effective_columns",6,"migration_pending",true));
   Map<String,?> selectionBefore=new HashMap<>(selection.prefs.getAll());int selectionReads=SQLiteDatabase.reads;
   request(true,6,6);m=fresh();desktop=new b0();idp=new H1();idp.I0.source="restore-source.db";idp.I0.failed=failedRead;set(m,desktop,idp,selection,6,4);
   check(controller().sourceRejected&&!controller().owns&&controller().state.equals("blocked")&&idp.K0==6&&idp.L0==4,"different native source or unreadable native selection keeps the original profile");
   check(selection.prefs.getAll().equals(selectionBefore)&&SQLiteDatabase.reads==selectionReads&&!desktop.d,"native restore source barrier preserves recovery and never inspects an unselected database");
   check(controller().decision.equals(failedRead?"native_database_unavailable":"native_database_pending"),"source mismatch and failed selection remain distinguishable");
   idp.I0.failed=false;idp.I0.source="launcher.db";bound(m,6,4);
   check(controller().state.equals("blocked")&&selection.prefs.getAll().equals(selectionBefore)&&SQLiteDatabase.reads==selectionReads,"source completion requires a fresh process preflight, never late promotion");
  }
  int readsBefore=SQLiteDatabase.reads;
  for(String blocked:new String[]{"C1.y0","com.android.launcher3.util.u0","com.android.launcher3.d4"}){
   Field installed=LauncherGridHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.setBoolean(null,false);
   Field observer=LauncherGridHook.class.getDeclaredField("installObserverRegistered");observer.setAccessible(true);observer.setBoolean(null,false);
   Field ctl=LauncherGridHook.class.getDeclaredField("controller");ctl.setAccessible(true);ctl.set(null,null);
   AugmentModule rejected=new AugmentModule();ClassLoader filtered=new ClassLoader(TestLauncherGridRuntime.class.getClassLoader()){
    @Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals(blocked))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}
   };
   LauncherGridHook.install(rejected,filtered);
   check(!rejected.errors.isEmpty()&&rejected.hooks.size()==1,"incomplete July contract never registers a partial grid adapter");
   android.app.Application app=new android.app.Application();Method lifecycle=android.app.Instrumentation.class.getDeclaredMethod("callApplicationOnCreate",android.app.Application.class);
   rejected.call(new android.app.Instrumentation(),lifecycle,app);
   check(FeatureSettings.report.contains("state=unsupported")&&FeatureSettings.report.contains("supported=false")
     &&FeatureSettings.report.contains("phase=resolve_interfaces")&&FeatureSettings.report.contains("missingInterface="+blocked),"missing July target records identifier and phase without claiming success");
   check(app.prefs.values.isEmpty()&&SQLiteDatabase.reads==readsBefore,"incomplete July mapping never opens layout data");
  }
  System.out.println("LauncherGrid July Android 16 runtime:''')
    sources[name] = content

# Both names exist in the real July APK but are unrelated synthetic classes.
# Their presence must not make the module select the old mapping.
sources['com/android/launcher3/F1.java'] = 'package com.android.launcher3;public class F1 implements java.util.function.Predicate<Object>{public boolean test(Object o){return false;}}'
sources['com/android/launcher3/C2.java'] = 'package com.android.launcher3;public class C2 implements Runnable{public void run(){}}'
sources['com/android/launcher3/Y3.java'] = 'package com.android.launcher3;public class Y3{public static String a="favorites";}'
sources['com/android/launcher3/X.java'] = 'package com.android.launcher3;public class X{}'
sources['com/android/launcher3/P3.java'] = 'package com.android.launcher3;public class P3{public static X m=new X();public String source="";public boolean failed;public Object h(X key){if(failed)throw new IllegalStateException("native preferences unavailable");return source;}}'
sources['com/android/launcher3/d4.java'] = '''
package com.android.launcher3;public class d4 {
 public void L(h0 dp,android.content.res.Resources resources,float scale){dp.D1=dp.nativeLabel;}
}
'''
sources['ls/augment/com/hook/NativeJulyDispatch.java'] = '''
package ls.augment.com.hook;import com.android.launcher3.*;import android.content.Context;
public class NativeJulyDispatch {
 public static void glyphs(h0 dp,Context c,float scale){
  try{java.lang.reflect.Method m=d4.class.getDeclaredMethod("L",h0.class,android.content.res.Resources.class,float.class);
   AugmentModule.active.call(dp,m,dp,c.getResources(),scale);
  }catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}
 }
}
'''

with tempfile.TemporaryDirectory(prefix='launcher-grid-260731-') as tmp:
    out = Path(tmp)
    for name, content in sources.items():
        path = out / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
    production = [JAVA / 'hook/LauncherGridHook.java', JAVA / 'hook/LauncherWorkspaceProfile.java', JAVA / 'hook/LauncherDatabaseIdentity.java',
                  JAVA / 'hook/LauncherGridIconFit.java', JAVA / 'LauncherGridSpec.java',
                  JAVA / 'LauncherGridSafety.java', JAVA / 'LauncherGridMigrationCheck.java']
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(out),
                    *map(str, out.rglob('*.java')), *map(str, production)], check=True)
    subprocess.run(['java', '-cp', str(out), 'ls.augment.com.hook.TestLauncherGridRuntime'], check=True)
