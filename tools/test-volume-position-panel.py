"""Production constrained-panel adapter: side selection, restore and missing contract."""
from pathlib import Path
import os,shutil,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/hook/VolumePositionHook.java').read_text(encoding='utf-8')
start=source.index('    private static final class Panel{')
end=source.index('    private abstract static class Binding',start)
panel=source[start:end]
java='''import java.lang.ref.WeakReference;
class View {static final int LAYOUT_DIRECTION_LTR=0;View parent;ViewGroup.LayoutParams params;int l=0,r=10,t=3,b=4,direction,changes;Object getParent(){return parent;}Object getContext(){return this;}ViewGroup.LayoutParams getLayoutParams(){return params;}void setLayoutParams(ViewGroup.LayoutParams p){params=p;changes++;}int getPaddingLeft(){return l;}int getPaddingRight(){return r;}int getPaddingTop(){return t;}int getPaddingBottom(){return b;}int getLayoutDirection(){return direction;}void setPadding(int l,int t,int r,int b){this.l=l;this.r=r;this.t=t;this.b=b;}}
class ViewGroup extends View {static class LayoutParams{}}
class NativeParams extends ViewGroup.LayoutParams {public int startToStart=-1,endToEnd=0;}
class SubParams extends NativeParams{}
class FeatureSettings {static int diagnostics;static void diagnostic(Object context,String key,String value){diagnostics++;}}
class HookCompatibility {static java.lang.reflect.Field field(Class<?> type,Class<?> expected,boolean isStatic,String name)throws ReflectiveOperationException{while(type!=null){try{var f=type.getDeclaredField(name);if(f.getType()!=expected)throw new NoSuchFieldException(name);f.setAccessible(true);return f;}catch(NoSuchFieldException missing){type=type.getSuperclass();}}throw new NoSuchFieldException(name);}}
public class TestVolumePanel {
'''+panel+'''
static int n;static void check(boolean value){n++;if(!value)throw new AssertionError("check "+n);}
public static void main(String[] args){
 View root=new View(),container=new View();root.parent=container;SubParams p=new SubParams();root.params=p;
 Panel adapter=Panel.create(root);check(adapter!=null);adapter.apply(root,true,true);check(p.startToStart==0&&p.endToEnd==-1&&container.l==10&&container.r==0);
 int changes=root.changes;adapter.apply(root,true,true);check(root.changes==changes);adapter.apply(root,true,false);check(p.startToStart==-1&&p.endToEnd==0&&container.l==0&&container.r==10);
 adapter.apply(root,true,true);adapter.apply(root,false,true);check(p.startToStart==-1&&p.endToEnd==0&&container.l==0&&container.r==10&&container.t==3&&container.b==4);
 container.direction=1;adapter.apply(root,true,true);check(p.startToStart==-1&&p.endToEnd==0);adapter.apply(root,true,false);check(p.startToStart==0&&p.endToEnd==-1);adapter.apply(root,false,false);
 root.params=new ViewGroup.LayoutParams();check(Panel.create(root)==null&&FeatureSettings.diagnostics==1);p.startToStart=23;root.params=p;check(Panel.create(root)==null&&p.startToStart==23&&FeatureSettings.diagnostics==2);
 System.out.println("Volume panel checks="+n);
}}
'''
bin_dir=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else None
javac_command,java_command=[str(bin_dir/(name+('.exe' if os.name=='nt' else ''))) if bin_dir else (shutil.which(name) or name) for name in ('javac','java')]
with tempfile.TemporaryDirectory(prefix='duo-volume-panel-') as temp:
 path=Path(temp)/'TestVolumePanel.java';path.write_text(java,encoding='utf-8')
 subprocess.run([javac_command,'-encoding','UTF-8',str(path)],check=True)
 subprocess.run([java_command,'-cp',temp,'TestVolumePanel'],check=True)
