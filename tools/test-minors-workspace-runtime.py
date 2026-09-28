"""Exercise real workspace callbacks: occupied-cell reuse, reload and collision restoration."""
from pathlib import Path
import ast
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
tree = ast.parse((ROOT / 'tools/test-entry-visibility-runtime.py').read_text(encoding='utf-8'))
files = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
             and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets))
files.pop('ls/augment/com/hook/TestEntryVisibilityRuntime.java')
files.update({
    'android/content/ContextWrapper.java': '''package android.content;
public class ContextWrapper extends Context {final Context base;public ContextWrapper(Context c){super(c.getPackageName());base=c;}public Context getBaseContext(){return base;}}''',
    'android/view/ViewGroup.java': '''package android.view;import android.content.Context;import java.util.*;
public class ViewGroup extends View {public final List<View> children=new ArrayList<>();public ViewGroup(Context c){super(c);}
public void removeView(View v){children.remove(v);v.parent=null;}public void requestLayout(){}}''',
    'c1/b.java': '''package c1;public class b {int x,y;public b(int x,int y){this.x=x;this.y=y;}
public int a(){return x;}public int b(){return y;}public void e(int v){x=v;}public void g(int v){y=v;}}''',
    'com/android/launcher3/util/t0.java': '''package com.android.launcher3.util;
public class t0 {public boolean[][] c=new boolean[4][2];public boolean d(int x,int y,int w,int h){return !c[x][y];}
public boolean c(int[] at,int w,int h){for(int y=0;y<2;y++)for(int x=0;x<4;x++)if(!c[x][y]){at[0]=x;at[1]=y;return true;}return false;}}''',
    'com/android/launcher3/CellLayout.java': '''package com.android.launcher3;
import android.view.*;import android.content.Context;import c1.b;import ls.augment.com.hook.AugmentModule;
public class CellLayout extends ViewGroup {public final com.android.launcher3.util.t0 grid=new com.android.launcher3.util.t0();
public int adds;public CellLayout(Context c){super(c);}public com.android.launcher3.util.t0 getOccupied(){return grid;}
public boolean e(View v,int i,int id,b p,boolean mark){return (Boolean)AugmentModule.dispatch(this,CellLayout.class,"e",new Class[]{View.class,int.class,int.class,b.class,boolean.class},new Object[]{v,i,id,p,mark},()->{adds++;if(v.parent!=null)throw new IllegalStateException("already attached");v.parent=this;v.params=p;children.add(v);if(mark)grid.c[p.a()][p.b()]=true;return true;});}
public void removeView(View v){b p=(b)v.params;grid.c[p.a()][p.b()]=false;super.removeView(v);}}''',
    'com/android/launcher3/C2.java': '''package com.android.launcher3;public class C2 extends android.content.Context {
public final z1.J3 writer=new z1.J3();public C2(){super("com.zte.mifavor.launcher");}public z1.J3 i2(){return writer;}}''',
    'z1/J3.java': '''package z1;import com.android.launcher3.model.data.y;
public class J3 {public int writes;public void T(y item,int container,int screen,int x,int yy){writes++;item.cellX=x;item.cellY=yy;item.container=container;item.screenId=screen;}}''',
    'z1/y1.java': '''package z1;import com.android.launcher3.model.data.y;import ls.augment.com.hook.AugmentModule;
public class y1 {public int nativeChecks;protected boolean e(y item,boolean value){return (Boolean)AugmentModule.dispatch(this,y1.class,"e",new Class[]{y.class,boolean.class},new Object[]{item,value},()->{nativeChecks++;return value;});}public boolean check(y item,boolean value){return e(item,value);}}''',
    'ls/augment/com/hook/TestMinorsWorkspace.java': '''package ls.augment.com.hook;
import android.content.*;import android.view.*;import android.os.Handler;import com.android.launcher3.*;import com.android.launcher3.model.data.y;import ls.augment.com.EntryVisibilityOptions;
public class TestMinorsWorkspace {
static int checks;static final String KEY=EntryVisibilityOptions.HIDE_MINORS_ICON;
static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
static y item(String cls){return new y(new ComponentName("com.zte.usebalance",cls));}
static View view(C2 c,y item){View v=new View(c);v.setTag(item);return v;}
public static void main(String[] args){
AugmentModule m=new AugmentModule();AugmentModule.active=m;MinorsWorkspaceHook.install(m,TestMinorsWorkspace.class.getClassLoader());check(m.errors.isEmpty(),"verified shape installs");
C2 c=new C2();FeatureSettings.current=c;FeatureSettings.change(KEY,true);CellLayout cell=new CellLayout(c);
y minor=item("com.zte.usebalance.activity.home.MinorsModeActivity");View hidden=view(c,minor);
check(cell.e(hidden,-1,44,new c1.b(0,0),true),"binding reports accepted to preserve native model");Handler.drain();
check(hidden.getParent()==null&&cell.children.isEmpty()&&!cell.grid.c[0][0],"hidden entry has no child or occupied cell");
y other=item("com.zte.usebalance.OtherActivity");View real=view(c,other);cell.e(real,-1,45,new c1.b(0,0),true);
check(real.getParent()==cell&&cell.grid.c[0][0],"another app can claim exactly the freed cell");
z1.y1 cursor=new z1.y1();check(cursor.check(minor,false)&&cursor.nativeChecks==0,"model reload neither reserves hidden cell nor deletes reused item");
check(!cursor.check(other,false)&&cursor.nativeChecks==1,"non-target retains native validation");
y folder=item("com.zte.usebalance.activity.home.MinorsModeActivity");folder.container=22;
check(!cursor.check(folder,false)&&cursor.nativeChecks==2,"folder model is outside workspace interception");
FeatureSettings.change(KEY,false);
check(hidden.getParent()==cell&&cell.children.size()==2,"disable restores one icon");
check(minor.cellX==1&&minor.cellY==0&&c.writer.writes==1,"occupied original position relocates and persists via native writer");
check(cell.grid.c[0][0]&&cell.grid.c[1][0]&&real.getParent()==cell,"restoration never evicts existing app");
FeatureSettings.change(KEY,true);check(hidden.getParent()==null&&!cell.grid.c[1][0]&&cell.grid.c[0][0],"toggle frees only target cell");
FeatureSettings.change(KEY,false);check(hidden.getParent()==cell&&c.writer.writes==1,"free saved position restores without rewriting database");
cell.detach();check(cell.listeners.isEmpty(),"detached workspace releases retention listener");
FeatureSettings.change(KEY,true);check(hidden.getParent()==cell,"discarded old window is not mutated by later settings");
CellLayout next=new CellLayout(c);View rebound=view(c,minor);next.e(rebound,-1,44,new c1.b(1,0),true);Handler.drain();
check(rebound.getParent()==null&&!next.grid.c[1][0],"new workspace binding remains hidden after reload");
check(m.errors.isEmpty(),"callbacks complete without errors");System.out.println("PASS minors workspace: "+checks+" checks");
}}
''',
})
files['android/view/View.java'] = files['android/view/View.java'].replace(
    'public int nativeVisibilityCalls;', '''public ViewGroup parent;public Object tag,params;
 public java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
 public void detach(){for(var l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}
 public Object getTag(){return tag;}public void setTag(Object t){tag=t;}public ViewGroup getParent(){return parent;}
 public int nativeVisibilityCalls;''')
files['com/android/launcher3/model/data/y.java'] = files['com/android/launcher3/model/data/y.java'].replace(
    'public final ComponentName target;', 'public int container=-100,screenId,cellX,cellY;public final ComponentName target;')
files['ls/augment/com/hook/FeatureSettings.java'] = files['ls/augment/com/hook/FeatureSettings.java'].replace(
    'static void diagnostic(', 'static void diagnosticError(Context c,String k,String s,Throwable e){diagnostic(c,k,s+e);}static void diagnostic(')
for name in ('EnhancementOption.java', 'EntryVisibilityOptions.java', 'EntryVisibilityPolicy.java', 'hook/MinorsWorkspaceHook.java'):
    files['ls/augment/com/' + name] = (SRC / name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='lsa-minors-grid-') as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        sources.append(str(path))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, *sources], check=True)
    subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestMinorsWorkspace'], check=True)
