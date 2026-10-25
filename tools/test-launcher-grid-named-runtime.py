"""Run the grid safety lifecycle against Android 15's verified named contracts.

Reuse the existing migration assertions so both ROM adapters must retain the same
placement, recovery, persistence and drawer isolation behavior. The named member
mapping is verified separately against the 25.5 launcher APK.
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

types = {'F1': 'InvariantDeviceProfile', 'b0': 'DesktopGrid', 'h0': 'DeviceProfile',
         'C2': 'Launcher', 't0': 'GridOccupancy', 'z0': 'IntSet'}
fields = {'C0': 'inv', 'G0': 'numRows', 'H0': 'numColumns', 'E1': 'dbFile',
          'B1': 'iconSizePx', 'C1': 'iconTextSizePx', 'D1': 'iconDrawablePaddingPx',
          'Z0': 'mIsScalableGrid', 'b1': 'mIsResponsiveGrid',
          'J2': 'allAppsIconSizePx', 'N2': 'allAppsIconTextSizePx',
          'K2': 'allAppsIconDrawablePaddingPx', 'H2': 'allAppsCellHeightPx', 'I2': 'allAppsCellWidthPx'}

sources = {}
for name, content in original.items():
    for old, new in types.items():
        name = re.sub(r'\b' + old + r'\b', new, name)
        content = re.sub(r'\b' + old + r'\b', new, content)
    if name.startswith('com/android/launcher3/') or name.endswith('/TestLauncherGridRuntime.java'):
        name = name.replace('/data/y.java', '/data/ItemInfo.java')
        content = re.sub(r'(?<![.\w])y(?!\w)', 'ItemInfo', content).replace('.data.y', '.data.ItemInfo')
        for old, new in fields.items():
            content = re.sub(r'\b' + old + r'\b', new, content)
    content = content.replace('z1.y0', 'com.android.launcher3.model.BgDataModel')
    if name == 'z1/y0.java':
        name = 'com/android/launcher3/model/BgDataModel.java'
        content = 'package com.android.launcher3.model;public class BgDataModel{}'
    if name.endswith('/DesktopGrid.java'):
        for old, new in [(' r(', ' setGridSize('), (' i(', ' getGridNumOfRowsAndColumns('),
                         (' k(', ' getRowsAndColumnsFromInt('), (' j(', ' getGridNumOfRowsAndColumnsInt('),
                         (' u(', ' updateGridData('), (' g(', ' doReGridData(')]:
            content = content.replace(old, new)
        content = content.replace('boolean d;', 'boolean mShouldResize;').replace('>> a=', '>> mResizeGridMap=')
    if name.endswith('/GridOccupancy.java'):
        content = content.replace(' d(', ' isRegionVacant(').replace(' g(', ' markCells(')
    if name.endswith('/DeviceProfile.java'):
        content = content.replace(' k0(', ' getCellSize(').replace(' p1(', ' updateIconSize(')
        content = content.replace(' h1(', ' updateAllAppsContainerWidth(').replace('"h1"', '"updateAllAppsContainerWidth"')
        content = content.replace('public class DeviceProfile{', 'public class DeviceProfile extends MFVDeviceProfile{public int nativeLabel=42;')
        content = content.replace('public InvariantDeviceProfile inv;', 'public InvariantDeviceProfile inv=InvariantDeviceProfile.active;')
        content = content.replace('calls++;', 'calls++;ls.augment.com.hook.NativeNamedDispatch.glyphs(this,c,scale);')
    if name.endswith('/Launcher.java'):
        content = content.replace(' h(', ' finishBindingItems(').replace(' B2(', ' getWorkspace(')
    if name.endswith('/ItemInfo.java'):
        content = content.replace('public long id;', 'public int id;')
    if name.endswith('/InvariantDeviceProfile.java'):
        content = content.replace(' K0(', ' onConfigChanged(')
        content = content.replace('public class InvariantDeviceProfile{', 'public class InvariantDeviceProfile{public static InvariantDeviceProfile active;public InvariantDeviceProfile(){active=this;}')
    if name.endswith('/TestLauncherGridRuntime.java'):
        content = content.replace('desktop.d', 'desktop.mShouldResize').replace('desktop.a', 'desktop.mResizeGridMap')
        content = content.replace('dp.b1', 'dp.mIsResponsiveGrid')
        content = content.replace('item.id=row[0]', 'item.id=(int)row[0]')
        content = content.replace('dp.iconTextSizePx=48;', 'dp.iconTextSizePx=48;dp.nativeLabel=48;')
        content = content.replace('dp.iconSizePx=210;', '''
  dp.iconDrawablePaddingPx=12;m.call(dp,controller().t.metrics,1f,context);
  check(dp.allAppsIconSizePx==195&&dp.allAppsIconDrawablePaddingPx==12&&dp.iconDrawablePaddingPx==12,"native gap-only refresh preserves original drawer icon and new gap");
  dp.iconSizePx=210;''')
        content = content.replace('LauncherGrid production runtime:', 'LauncherGrid Android 15 named runtime:')
        content = content.replace('check(m.hooks.size()==9,"all native endpoints");',
                                  'check(m.hooks.size()==10,"all named native endpoints including OEM label reset");check(controller().t.adapter.equals("android15_named"),"named adapter selected as a complete contract");')
        content = content.replace('System.out.println("LauncherGrid Android 15 named runtime:', '''
  Context feedback=new Context();SQLiteDatabase.data=new long[0][];request(true,8,6);
  m=fresh();desktop=new DesktopGrid();idp=new InvariantDeviceProfile();set(m,desktop,idp,feedback,6,4);
  check(idp.numRows==8&&idp.numColumns==6,"feedback configuration applies exactly eight rows and six columns");
  Point chosen=(Point)m.call(desktop,controller().t.getRawPoint,feedback);
  check(chosen.x==8&&chosen.y==6,"raw OEM getter agrees with feedback geometry");
  bound(m,8,6);
  check(FeatureSettings.report.contains("state=active")&&FeatureSettings.report.contains("bound=true")
    &&FeatureSettings.report.contains("workspaceRows=8")&&FeatureSettings.report.contains("workspaceColumns=6")
    &&FeatureSettings.report.contains("migrationPending=false")&&FeatureSettings.report.contains("supported=true"),"feedback requires actual bound workspace geometry and finished migration");
  InvariantDeviceProfile matching=InvariantDeviceProfile.active;new InvariantDeviceProfile();
  DeviceProfile unrelated=new DeviceProfile();InvariantDeviceProfile.active=matching;unrelated.width=94;unrelated.height=158;
  m.call(unrelated,controller().t.metrics,1f,other);
  check(unrelated.iconSizePx==195&&unrelated.iconTextSizePx==42&&unrelated.allAppsIconSizePx==195,"other native IDP remains untouched");
  boolean badType=false;try{LauncherGridHook.Targets.field(DeviceProfile.class,"allAppsIconTextSizePx",int.class);}catch(IllegalStateException expected){badType=true;}
  check(badType,"float field cannot be accepted as integer glyph metric");
  boolean badReturn=false;try{LauncherGridHook.Targets.method(DeviceProfile.class,"getCellSize",void.class);}catch(IllegalStateException expected){badReturn=true;}
  check(badReturn,"incorrect method return rejected");
  boolean badStatic=false;try{LauncherGridHook.Targets.field(InvariantDeviceProfile.class,"active",InvariantDeviceProfile.class);}catch(IllegalStateException expected){badStatic=true;}
  check(badStatic,"static profile cannot be accepted as instance field");
  int readsBefore=SQLiteDatabase.reads;
  for(String blocked:new String[]{"com.android.launcher3.DesktopGrid","com.android.launcher3.MFVDeviceProfile"}){
   Field installed=LauncherGridHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.setBoolean(null,false);
   Field observer=LauncherGridHook.class.getDeclaredField("installObserverRegistered");observer.setAccessible(true);observer.setBoolean(null,false);
   Field ctl=LauncherGridHook.class.getDeclaredField("controller");ctl.setAccessible(true);ctl.set(null,null);
   AugmentModule rejected=new AugmentModule();ClassLoader filtered=new ClassLoader(TestLauncherGridRuntime.class.getClassLoader()){
    @Override protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.equals(blocked))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}
   };
   LauncherGridHook.install(rejected,filtered);
   check(!rejected.errors.isEmpty()&&rejected.hooks.size()==1,"incomplete contract registers only lifecycle diagnostic, never partial grid hooks");
   android.app.Application app=new android.app.Application();
   Method lifecycle=android.app.Instrumentation.class.getDeclaredMethod("callApplicationOnCreate",android.app.Application.class);
   rejected.call(new android.app.Instrumentation(),lifecycle,app);
   check(FeatureSettings.report.contains("state=unsupported")&&FeatureSettings.report.contains("supported=false")
     &&FeatureSettings.report.contains("version=")&&FeatureSettings.report.contains("pid=")&&FeatureSettings.report.contains("adapter=none"),"unsupported current app/build/pid diagnostic");
   check(app.prefs.values.isEmpty()&&SQLiteDatabase.reads==readsBefore,"unsupported adapter neither starts migration nor touches recovery/database");
  }
  System.out.println("LauncherGrid Android 15 named runtime:''')
    sources[name] = content

sources['com/android/launcher3/MFVDeviceProfile.java'] = '''
package com.android.launcher3;
public class MFVDeviceProfile {
 public void updateIconSize_DeviceProfile(DeviceProfile dp,android.content.res.Resources res,float scale){
  dp.iconTextSizePx=dp.nativeLabel;
 }
}
'''
sources['ls/augment/com/hook/NativeNamedDispatch.java'] = '''
package ls.augment.com.hook;
import com.android.launcher3.*;import android.content.Context;
public class NativeNamedDispatch {
 public static void glyphs(DeviceProfile dp,Context c,float scale){
  try{java.lang.reflect.Method m=MFVDeviceProfile.class.getDeclaredMethod("updateIconSize_DeviceProfile",DeviceProfile.class,android.content.res.Resources.class,float.class);
   AugmentModule.active.call(dp,m,dp,c.getResources(),scale);
  }catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}
 }
}
'''

with tempfile.TemporaryDirectory(prefix='launcher-grid-named-') as tmp:
    out = Path(tmp)
    for name, content in sources.items():
        path = out / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
    production = [JAVA / 'hook/LauncherGridHook.java', JAVA / 'hook/LauncherWorkspaceProfile.java', JAVA / 'hook/LauncherDatabaseIdentity.java', JAVA / 'hook/LauncherGridIconFit.java',
                  JAVA / 'LauncherGridSpec.java', JAVA / 'LauncherGridSafety.java', JAVA / 'LauncherGridMigrationCheck.java']
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(out),
                    *map(str, out.rglob('*.java')), *map(str, production)], check=True)
    subprocess.run(['java', '-cp', str(out), 'ls.augment.com.hook.TestLauncherGridRuntime'], check=True)
