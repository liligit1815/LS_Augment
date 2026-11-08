"""Exercise the production IME pose and rollback across native parent/owner changes."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'WorkspaceFloatingIme.java').read_text(encoding='utf8')
def method(signature):
    start=source.index(signature);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end].replace('android.graphics.Point','Point')
harness=r'''
package ls.augment.com.step;
public class FloatingImeCases {
    static int checks,writes,commits;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    static void near(float actual,float expected,String why){check(Math.abs(actual-expected)<.02f,why+": "+actual+" / "+expected);}
    static class Rect {int left,top,right,bottom;Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}int width(){return right-left;}int height(){return bottom-top;}boolean isEmpty(){return width()<=0 || height()<=0;}}
    static class Point {int x,y;}
    static class Surface {boolean valid=true;float scale=1,x,y;}
    static class Container {Surface surface=new Surface();Point position=new Point();}
    static class Context {Context getResources(){return this;}Context getDisplayMetrics(){return this;}float density=3.25f;}
    static class Wm {static Object display=new Object();static Context context=new Context();}
    static Container container=new Container();static Object tx=new Object(),parent=new Object(),app=new Object(),input=new Object();
    static class Probe {Object invoke(Object display){return container;}}
    static class PhysicalIme {static Probe container=new Probe();}
    static class WorkspaceIme {static boolean available=true;}
    static class LocalLandscape {static Object main=app;static boolean owned=true,scene=true;static boolean scene(){return scene;}static boolean owned(Object o){return owned;}static Object main(){return main;}}
    static class NativeTransitionPose {static WorkspaceTransform pose=new WorkspaceTransform(1,0,0);static WorkspaceTransform inherited(Object node){return pose;}}
    static boolean available=true,active=true,ending,sideLeft;static Object surface,pendingCommit;
    static Rect logical=new Rect(0,0,1216,2688);
    static Object field(Object o,String name){return o==input?app:new Object();}
    static void diagnostic(String name,String detail){}
    static void trackCommit(Object tx,Object group){commits++;}
    static void validSurface(Object value){if(!(value instanceof Surface s) || !s.valid)throw new IllegalStateException();}
    static Object call(Object o,String name,Object... args){
        if(o==container)return switch(name){case "getSurfaceControl"->container.surface;case "getLastSurfacePosition"->container.position;case "getParent"->parent;default->throw new AssertionError(name);};
        if(o==Wm.display)return tx;
        if(o instanceof Surface s)return s.valid;
        if(o==tx){
            if(name.equals("setMatrix")){Surface s=(Surface)args[0];s.scale=(Float)args[1];near((Float)args[2]+(Float)args[3],0,"no IME shear/rotation");near(s.scale,(Float)args[4],"uniform keyboard scale");writes++;}
            if(name.equals("setPosition")){Surface s=(Surface)args[0];s.x=(Float)args[1];s.y=(Float)args[2];writes++;}
            return null;
        }
        return null;
    }
    METHODS
    public static void main(String[] args)throws Exception{
        Rect keyboard=new Rect(0,1630,1216,2688);
        for(boolean left:new boolean[]{false,true})for(WorkspaceTransform inherited:new WorkspaceTransform[]{new WorkspaceTransform(1,0,0),new WorkspaceTransform(.74665f,0,681)}){
            sideLeft=left;NativeTransitionPose.pose=inherited;check(update(true,keyboard,input),"eligible native IME floats");
            Surface s=container.surface;WorkspaceTransform world=new WorkspaceTransform(s.scale,s.x,s.y).then(inherited);
            WorkspaceLayout layout=new WorkspaceLayout(1216,2688,3.25f,left);
            check(world.x>=layout.mainX,"keyboard stays inside main left boundary");
            check(world.x+1216*world.scale<=layout.mainX+1216*layout.mainScale,"keyboard stays outside side rail");
            near(world.y+2688*world.scale,2610,"bottom clearance in physical coordinates survives native magnification");
            check(world.y+1630*world.scale>1093,"keyboard stays within lower main partition");
            pendingCommit=new Object();reset();near(s.scale,1,"exit restores native scale");near(s.x+s.y,0,"exit restores native position");check(surface==null,"no stale ownership after exit");
        }
        int before=writes;LocalLandscape.owned=false;check(!update(true,keyboard,input) && writes==before,"unowned activity stays native");LocalLandscape.owned=true;
        WorkspaceIme.available=false;check(!forWindow(input) && !update(true,keyboard,input),"missing native IME source keeps app insets and keyboard native");WorkspaceIme.available=true;
        LocalLandscape.main=new Object();check(!update(true,keyboard,input),"side activity never receives main floating IME");LocalLandscape.main=app;
        before=writes;check(!update(true,new Rect(50,1800,800,2600),input) && writes==before,"native floating geometry preserved");
        update(true,keyboard,input);Surface old=container.surface;container.surface=new Surface();before=writes;reset();check(writes==before && container.surface.scale==1,"replacement native surface never receives stale rollback");
        update(true,keyboard,input);ending=true;check(!update(true,keyboard,input) && surface==null,"ending scene restores keyboard before returning tasks");
        check(commits>0,"exit reset participates in surface commit barrier");
        System.out.println("PASS "+checks+" production floating IME geometry/ownership checks");
    }
}
'''.replace('METHODS','\n'.join(method(s) for s in ['static boolean forWindow(', 'static boolean update(', 'static void reset(']))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-floating-ime-') as tmp:
    folder=Path(tmp);test=folder/'FloatingImeCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test,STEP/'WorkspaceLayout.java',STEP/'WorkspaceTransform.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.FloatingImeCases'],check=True)
