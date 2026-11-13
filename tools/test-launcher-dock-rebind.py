"""Exercise actual native rebind rejection, occupancy and unchanged non-Dock paths."""
from pathlib import Path
import runpy, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java/ls/augment/com/hook'
base=runpy.run_path(str(ROOT/'tools/test-launcher-widget-dock-runtime.py'))['COMMON']
for named in (True,False):
 for missing in (False,True):
  names=dict(add='addViewToCellLayout' if named else 'e', grid='setGridSize' if named else 'C0', mark='markCellsAsOccupiedForView' if named else 'f0',
   x='getCellX' if named else 'a', y='getCellY' if named else 'b', sx='cellHSpan' if named else 'f',sy='cellVSpan' if named else 'g',item='ItemInfo' if named else 'y')
  sources={k:base[k] for k in ['ls/augment/com/hook/AugmentModule.java','android/content/Context.java']}
  sources['ls/augment/com/hook/AugmentModule.java']=sources['ls/augment/com/hook/AugmentModule.java'].replace('public static AugmentModule active;', 'void deoptimize(Method m){} public static AugmentModule active;')
  sources.update({
   'android/view/View.java':'''package android.view;public class View {Object tag;ViewGroup.LayoutParams lp;public View(){}public Object getTag(){return tag;}public void setTag(Object t){tag=t;}public ViewGroup.LayoutParams getLayoutParams(){return lp;}public void setLayoutParams(ViewGroup.LayoutParams v){lp=v;}public android.content.Context getContext(){return new android.content.Context();}}''',
   'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View {public static class LayoutParams {}public final java.util.List<View> items=new java.util.ArrayList<>();public int getChildCount(){return items.size();}public View getChildAt(int i){return items.get(i);}}''',
   'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;class FeatureSettings {static void diagnostic(android.content.Context c,String k,String v){}}''',
   'com/android/launcher3/model/data/'+names['item']+'.java':'''package com.android.launcher3.model.data;public class ITEM {public int container=-101;}'''.replace('ITEM',names['item']),
   'com/android/launcher3/Params.java':'''package com.android.launcher3;public class Params extends android.view.ViewGroup.LayoutParams {public int X,Y,SX=1,SY=1;public int XX(){return X;}public int YY(){return Y;}public Params(int x,int y){X=x;Y=y;}}'''.replace('SX',names['sx']).replace('SY',names['sy']).replace('XX',names['x']).replace('YY',names['y']),
   'com/android/launcher3/Hotseat.java':'package com.android.launcher3;public class Hotseat extends CellLayout {}',
   'com/android/launcher3/ChildHotseat.java':'package com.android.launcher3;public class ChildHotseat extends Hotseat {}',
   'com/android/launcher3/CellLayout.java':'''package com.android.launcher3;import android.view.*;import java.lang.reflect.*;
    public class CellLayout extends ViewGroup {public final ViewGroup content=new ViewGroup();public int x=5,y=1;public boolean[][] cells=new boolean[x][y];public int nativeCalls;
    public int getCountX(){return x;}public int getCountY(){return y;}public ViewGroup getShortcutsAndWidgets(){return content;}
    public void GRID(int a,int b){x=a;y=b;cells=new boolean[a][b];}
    public void MARK(View v){Params p=(Params)v.getLayoutParams();cells[p.X][p.Y]=true;}
    public boolean ADD(View v,int index,int id,Params p,boolean mark){nativeCalls++;if(p.X<0||p.Y<0||p.X>=x||p.Y>=y)return false;
      v.setLayoutParams(p);content.items.add(v);if(mark)MARK(v);return true;}}
    '''.replace('GRID',names['grid']).replace('MARK',names['mark']).replace('ADD',names['add']),
  })
  test='''package ls.augment.com.hook;import android.view.*;import com.android.launcher3.*;import java.lang.reflect.*;
   public class TestRebind {static int checks;static void check(boolean x,String m){checks++;if(!x)throw new AssertionError(m);}
   static View icon(){View v=new View();v.setTag(new com.android.launcher3.model.data.ITEM());return v;}
   public static void main(String[] args)throws Throwable {AugmentModule m=new AugmentModule();LauncherDockRebindHook.install(m,TestRebind.class.getClassLoader());
   if(MISSING){check(m.hooks.isEmpty(),"missing native occupancy leaves all native hooks unchanged");return;}
   Method add=CellLayout.class.getDeclaredMethod("ADD",View.class,int.class,int.class,Params.class,boolean.class),grid=CellLayout.class.getDeclaredMethod("GRID",int.class,int.class);
   Hotseat d=new ChildHotseat();
   for(int cycle=0;cycle<3;cycle++){d.content.items.clear();m.call(d,grid,5,1);for(int i=0;i<7;i++)check((Boolean)m.call(d,add,icon(),-1,i,new Params(i,0),true),"all seven cached model items bind after native reset");
    check(d.content.getChildCount()==7&&d.x==7&&d.y==1,"complete seven icon dock");
    for(int i=0;i<7;i++)check(d.cells[i][0],"growth retains earlier occupied cells");m.call(d,grid,5,1);check(d.x==7&&d.cells[6][0],"profile update retains live children and occupancy");}
   d.content.items.remove(6);d.content.items.remove(5);m.call(d,grid,5,1);check(d.x==5,"user removed shortcuts do not leave stale minimum");
   d.content.items.clear();m.call(d,grid,1,5);for(int i=0;i<7;i++)check((Boolean)m.call(d,add,icon(),-1,i,new Params(0,i),true),"vertical native rebind");
   check(d.x==1&&d.y==7&&d.cells[0][0],"vertical occupancy preserved");
   CellLayout workspace=new CellLayout();check(!(Boolean)m.call(workspace,add,icon(),0,1,new Params(6,0),true)&&workspace.x==5,"workspace rejection unchanged");
   Hotseat other=new Hotseat();View invalid=new View();invalid.setTag(new Object());check(!(Boolean)m.call(other,add,invalid,0,1,new Params(6,0),true),"unknown tag stays native");
   Params wide=new Params(6,0);wide.SX=2;check(!(Boolean)m.call(other,add,icon(),0,1,wide,true),"unknown multi-cell item stays native");
   check(!(Boolean)m.call(other,add,icon(),0,1,new Params(-1,0),true),"negative coordinate rejected");
   check(!(Boolean)m.call(other,add,icon(),0,1,new Params(Integer.MAX_VALUE,0),true),"overflow does not allocate");
   check(m.errors.isEmpty(),"no runtime errors");System.out.println("Dock rebind checks="+checks);}}
  '''
  for a,b in [('ITEM',names['item']),('ADD',names['add']),('GRID',names['grid']),('SX',names['sx']),('MISSING',str(missing).lower())]:test=test.replace(a,b)
  sources['ls/augment/com/hook/TestRebind.java']=test
  if missing:sources['com/android/launcher3/CellLayout.java']=sources['com/android/launcher3/CellLayout.java'].replace('public void '+names['mark'],'public void unsupportedMark').replace('if(mark)'+names['mark'],'if(mark)unsupportedMark')
  with tempfile.TemporaryDirectory(prefix='dock-rebind-') as temp:
   out=Path(temp)
   for name,source in sources.items():p=out/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf8')
   subprocess.run(['javac','-encoding','UTF-8','-d',str(out),*map(str,out.rglob('*.java')),str(JAVA/'LauncherDockRebindHook.java'),str(JAVA/'HookCompatibility.java')],check=True)
   subprocess.run(['java','-cp',str(out),'ls.augment.com.hook.TestRebind'],check=True)
