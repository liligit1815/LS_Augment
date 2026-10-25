"""Exercise the production split WorkspaceProfile adapter with an unrelated b0 decoy."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
fixture=ROOT/'tools/test-launcher-grid-named-runtime.py'
namespace={'__file__':str(fixture)}
exec(compile(fixture.read_text(encoding='utf-8').split('with tempfile.TemporaryDirectory')[0],str(fixture),'exec'),namespace)
sources=namespace['sources']
JAVA=namespace['JAVA']
sources.pop('ls/augment/com/hook/NativeNamedDispatch.java',None)
sources.pop('com/android/launcher3/MFVDeviceProfile.java',None)
sources['com/android/launcher3/b0.java']='package com.android.launcher3;public class b0 { public void r(){} }'
sources['com/android/launcher3/DeviceProfile.java']='''package com.android.launcher3;
public class DeviceProfile {
 public InvariantDeviceProfile inv=InvariantDeviceProfile.active;
 public boolean mIsScalableGrid,mIsResponsiveGrid;
 public com.android.launcher3.deviceprofile.WorkspaceProfile profile=new com.android.launcher3.deviceprofile.WorkspaceProfile();
 public com.android.launcher3.deviceprofile.WorkspaceProfile getWorkspaceProfile(){return profile;}
}'''
sources['com/android/launcher3/InvariantDeviceProfile.java']=sources['com/android/launcher3/InvariantDeviceProfile.java'].replace('onConfigChanged(android.content.Context c)','onConfigChanged()').replace('NativeDispatch.point(c)','NativeDispatch.point(new android.content.Context())')
for name in ['DeviceProperties','HotseatProfileInitialValues']:
    sources['com/android/launcher3/deviceprofile/'+name+'.java']='package com.android.launcher3.deviceprofile;public class '+name+'{}'
sources['com/android/launcher3/deviceprofile/WorkspaceProfile.java']='''package com.android.launcher3.deviceprofile;
import android.graphics.Point;
public class WorkspaceProfile {
 public int iconSizePx=195,iconTextSizePx=42,iconDrawablePaddingPx=10;
 public Point cellSize=new Point(94,158);
 public Point getCellSize(){return cellSize;}
 public WorkspaceProfile changeIconSize(int value){WorkspaceProfile copy=new WorkspaceProfile();copy.cellSize=cellSize;copy.iconSizePx=value;copy.iconTextSizePx=iconTextSizePx;copy.iconDrawablePaddingPx=iconDrawablePaddingPx;return copy;}
 public void setIconTextSizePx(int value){iconTextSizePx=value;}
}'''
sources['com/android/launcher3/deviceprofile/WorkspaceProfileNonResponsiveFactory.java']='''package com.android.launcher3.deviceprofile;
public class WorkspaceProfileNonResponsiveFactory {
 public WorkspaceProfile original=new WorkspaceProfile();
 public WorkspaceProfile createWorkspaceProfileNonResponsive(android.content.Context c,android.content.res.Resources r,DeviceProperties p,float scale,com.android.launcher3.InvariantDeviceProfile idp,boolean a,boolean b,int i,android.util.DisplayMetrics metrics,int j,int k,boolean x,boolean y,HotseatProfileInitialValues hotseat){return original;}
}'''
runner=sources['ls/augment/com/hook/TestLauncherGridRuntime.java'].split(' public static void main')[0]
runner=runner.replace('check(m.hooks.size()==10,"all named native endpoints including OEM label reset");check(controller().t.adapter.equals("android15_named"),"named adapter selected as a complete contract");',
                      'check(m.hooks.size()==8,"split native endpoints");check(controller().t.adapter.equals("named_workspace_profile"),"complete named profile beats unrelated b0");')
runner+='''
 static Object profile(AugmentModule module,Object factory,InvariantDeviceProfile idp,Context context)throws Throwable {
  return module.call(factory,controller().t.split.factory,context,context.getResources(),new com.android.launcher3.deviceprofile.DeviceProperties(),1f,idp,false,false,0,context.getResources().getDisplayMetrics(),0,0,false,false,new com.android.launcher3.deviceprofile.HotseatProfileInitialValues());
 }
 public static void main(String[] args)throws Throwable {
  FeatureSettings.verified=true;SQLiteDatabase.data=new long[0][];
  Context context=new Context();request(true,8,6);AugmentModule m=fresh();DesktopGrid desktop=new DesktopGrid();InvariantDeviceProfile idp=new InvariantDeviceProfile();set(m,desktop,idp,context,6,4);
  check(idp.numRows==8&&idp.numColumns==6&&controller().owns,"custom geometry applied before new profile factory");
  check(controller().t.refreshProfile.getParameterCount()==0,"new zero-argument profile refresh selected");
  var factory=new com.android.launcher3.deviceprofile.WorkspaceProfileNonResponsiveFactory();
  var fitted=(com.android.launcher3.deviceprofile.WorkspaceProfile)profile(m,factory,idp,context);
  check(fitted!=factory.original&&factory.original.iconSizePx==195&&factory.original.iconTextSizePx==42,"native shared profile is immutable to adapter");
  check(fitted.iconSizePx<94&&fitted.iconTextSizePx<=42&&fitted.cellSize==factory.original.cellSize,"glyph fits native cell without changing occupancy");
  var foreign=new InvariantDeviceProfile();check(profile(m,factory,foreign,context)==factory.original,"unrelated IDP keeps native profile");
  InvariantDeviceProfile.active=idp;bound(m,8,6);check(controller().workspaceCols==6&&controller().workspaceRows==8&&controller().boundIdpConsistent,"readout follows split profile to bound native geometry");
  request(false,8,6);m=fresh();desktop=new DesktopGrid();idp=new InvariantDeviceProfile();set(m,desktop,idp,context,6,4);bound(m,6,4);
  check(!controller().owns&&context.prefs.values.isEmpty(),"disable restores native grid and clears recovery metadata only after bound proof");
  check(profile(m,factory,idp,context)==factory.original,"disabled split factory remains native");
  System.out.println("PASS split workspace runtime: "+checks+" assertions");
 }
}'''
sources['ls/augment/com/hook/TestLauncherGridRuntime.java']=runner
with tempfile.TemporaryDirectory(prefix='launcher-grid-split-') as temp:
    out=Path(temp)
    for name,content in sources.items():
        path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8')
    production=[JAVA/'hook'/name for name in ['LauncherGridHook.java','LauncherWorkspaceProfile.java','LauncherDatabaseIdentity.java','LauncherGridIconFit.java']]
    production += [JAVA/name for name in ['LauncherGridSpec.java','LauncherGridSafety.java','LauncherGridMigrationCheck.java']]
    subprocess.run(['javac','-encoding','UTF-8','-d',str(out),*map(str,out.rglob('*.java')),*map(str,production)],check=True)
    subprocess.run(['java','-cp',str(out),'ls.augment.com.hook.TestLauncherGridRuntime'],check=True)
