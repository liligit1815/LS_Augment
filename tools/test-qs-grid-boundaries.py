"""Exercise production scope and viewport methods, including shrink feedback."""
from pathlib import Path
import os,shutil,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/ControlCenterGridHook.java').read_text(encoding='utf-8')
def method(signature):
 start=source.index(signature);at=source.index('{',start);depth=1;end=at+1
 while depth:
  depth+=(source[end]=='{')-(source[end]=='}');end+=1
 return source[start:end]
body='\n'.join(method(s) for s in ['private static View gridOwner(', 'private static boolean active(', 'static Object countOverride(', 'private static boolean regular(', 'private static String id(', 'private static boolean land('])
viewport='\n'.join(method(s) for s in ['void applyViewport(', 'void restoreViewport('])
files={
'android/content/res/Configuration.java':'package android.content.res;public class Configuration{public static final int ORIENTATION_LANDSCAPE=2;public int orientation=1;}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public Configuration configuration=new Configuration();public Configuration getConfiguration(){return configuration;}public String getResourceEntryName(int id){return id==1?"control_center_all_tiles":id==2?"tile_page":id==3?"content_scroller":"wide_tiles";}}',
'android/view/View.java':'''package android.view;public class View{public static final int NO_ID=-1;public int id,height=1000,top,changes;public View parent;public ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();public final android.content.res.Resources resources=new android.content.res.Resources();public int getId(){return id;}public int getHeight(){return height;}public int getTop(){return top;}public View getParent(){return parent;}public Object getContext(){return this;}public android.content.res.Resources getResources(){return resources;}public ViewGroup.LayoutParams getLayoutParams(){return params;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;changes++;}}''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View{public int mCellHeight=100,mCellMarginVertical=10,mCellMarginTop=0;public static class LayoutParams{public static final int WRAP_CONTENT=-2;public int height=WRAP_CONTENT;}}''',
'ls/augment/com/hook/TestGrid.java':'''package ls.augment.com.hook;import android.view.*;import android.content.res.Configuration;import java.util.*;import java.lang.ref.WeakReference;
public class TestGrid{static final String P="ls_augment_rm_qs_";static final Object PASS=new Object();static final Map<View,Boolean> FAILED=new WeakHashMap<>();static Object field(Object o,String name){try{return o.getClass().getField(name).get(o);}catch(Exception e){return null;}}
static class FeatureSettings{static boolean on=true;static boolean enabled(Object c,String k){return on;}static int integer(Object c,String k,int d,int min,int max){return k.endsWith("rows")?5:k.contains("land")?10:7;}}
static class Adapter{public View mOwner;Adapter(View v){mOwner=v;}}
METHODS
static class State{final WeakReference<ViewGroup> reference;WeakReference<View> viewport=new WeakReference<>(null);Integer originalHeight;int rows=5;State(ViewGroup v){reference=new WeakReference<>(v);}VIEWPORT}
static int n;static void check(boolean b){n++;if(!b)throw new AssertionError("check "+n);}
public static void main(String[] args){ViewGroup grid=new ViewGroup();grid.id=1;Adapter a=new Adapter(grid);check(countOverride(a,"columns",4,2,10).equals(7));grid.resources.configuration.orientation=2;check(countOverride(a,"columns",4,2,10).equals(10));grid.id=2;check(countOverride(a,"rows",3,1,8).equals(5));grid.id=4;check(countOverride(a,"columns",4,2,10)==PASS);check(countOverride(new Adapter(null),"rows",3,1,8)==PASS);grid.id=1;FeatureSettings.on=false;check(countOverride(a,"rows",3,1,8)==PASS);FeatureSettings.on=true;FAILED.put(grid,true);check(countOverride(a,"rows",3,1,8)==PASS);
ViewGroup fixed=new ViewGroup(),wrap=new ViewGroup(),scroller=new ViewGroup();fixed.params.height=1000;wrap.parent=fixed;wrap.height=700;scroller.id=3;scroller.parent=wrap;grid.parent=scroller;grid.top=40;State s=new State(grid);s.applyViewport();check(scroller.params.height==580);wrap.height=580;scroller.height=580;s.applyViewport();check(scroller.params.height==580&&scroller.changes==1);s.restoreViewport();check(scroller.params.height==-2);System.out.println("QS scope/viewport checks="+n);}}
'''.replace('METHODS',body).replace('VIEWPORT',viewport)
}
bin_dir=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else None
javac_command,java_command=[str(bin_dir/(name+('.exe' if os.name=='nt' else ''))) if bin_dir else (shutil.which(name) or name) for name in ('javac','java')]
with tempfile.TemporaryDirectory(prefix='duo-grid-boundary-') as folder:
 paths=[]
 for name,value in files.items():
  p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8');paths.append(str(p))
 subprocess.run([javac_command,'-encoding','UTF-8','-d',folder,*paths],check=True)
 subprocess.run([java_command,'-cp',folder,'ls.augment.com.hook.TestGrid'],check=True)
