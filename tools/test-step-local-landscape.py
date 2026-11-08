"""Exercise actual local-rotation presentation and restoration against ownership changes."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'LocalLandscape.java').read_text(encoding='utf8')
def method(signature):
    start=source.index(signature);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end].replace('android.graphics.Rect','Rect').replace('android.graphics.Point','Point')
harness=r'''
package ls.augment.com.step;
import java.util.*;
public class LandscapeCases {
    static int checks,traversals,applied;static boolean changing;static Object focused;
    static class ActivityInfo {static final int SCREEN_ORIENTATION_REVERSE_LANDSCAPE=8;}
    static class Probe {Object invoke(Object app,Object... args){return ((App)app).leash;}}
    static Probe leash=new Probe(),start=new Probe();
    static boolean scene(){return true;}static Object main(){return focused;}
    static void release(Object app){tokens.remove(app);}
    static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}
    static void near(float a,float b,String why){check(Math.abs(a-b)<.01f,why+": "+a+" / "+b);}
    static class Rect {int w,h;Rect(int w,int h){this.w=w;this.h=h;}int width(){return w;}int height(){return h;}}
    static class Point {int x=3,y=5;}
    static class Surface {boolean valid=true;}
    static class App {Object state=new Object();Task task;Surface surface=new Surface(),leash=new Surface();Tx tx=new Tx();Rect bounds=new Rect(2688,1216);Point at=new Point();boolean side;int request=0;}
    static class Task {Object display=Wm.display,root=this;App top;int mode=1,user;Task(App a){top=a;a.task=this;}}
    static class Tx {Map<Object,float[]> matrices=new HashMap<>(),positions=new HashMap<>();}
    static class Wm {static Object display=new Object(),service=new Object(),context=new Object();}
    static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return u==p;}}
    static int principal;static Object manualApp;static Rect logical=new Rect(1216,2688);
    static Map<Object,Token> tokens=new IdentityHashMap<>();
    static boolean side(Object a){return ((App)a).side;}
    static boolean landscape(int req){return req==0 || req==8;}
    static void validSurface(Object o){if(!(o instanceof Surface s) || !s.valid)throw new IllegalStateException("surface invalid");}
    static Object field(Object o,String n){if(o instanceof App a)return a.state;return ((Task)o).user;}
    static Object call(Object o,String n,Object... args){
        if(o==Wm.service){if(n.equals("requestTraversal"))traversals++;return null;}
        if(o instanceof App a)return switch(n){case "getFixedRotationTransformDisplayBounds"->a.bounds;case "getSurfaceControl"->a.surface;case "getSyncTransaction"->a.tx;case "getLastSurfacePosition"->a.at;case "getTask"->a.task;case "getRequestedOrientation"->a.request;default->throw new AssertionError(n);};
        if(o instanceof Task t)return switch(n){case "getDisplayContent"->t.display;case "getRootTask"->t.root;case "getWindowingMode"->t.mode;case "topRunningActivity"->t.top;default->throw new AssertionError(n);};
        if(o instanceof Surface s)return s.valid;
        if(o instanceof Tx t){
            if(n.equals("setMatrix"))t.matrices.put(args[0],new float[]{(Float)args[1],(Float)args[2],(Float)args[3],(Float)args[4]});
            else if(n.equals("setPosition"))t.positions.put(args[0],new float[]{(Float)args[1],(Float)args[2]});
            else throw new AssertionError(n);return null;
        }
        throw new AssertionError(n);
    }
    METHODS
    public static void main(String[] args)throws Exception{
        for(int rotation:new int[]{1,3})for(boolean side:new boolean[]{false,true}){
            App app=new App();new Task(app);app.side=side;Token token=new Token(app.state,rotation);tokens.put(app,token);
            Surface leash=new Surface();fit(app,app.tx,leash);float[] m=app.tx.matrices.get(app.surface);
            near(m[0],m[3],"uniform aspect, no stretching");near(m[1]+m[2],0,"activity surface has no shear");
            float[] lm=app.tx.matrices.get(leash),pos=app.tx.positions.get(leash);
            {
                near(m[0],1,"both roles avoid portrait-fit shrink");near(lm[0]+lm[3],0,"both roles quarter turn");
                float minX=Float.MAX_VALUE,minY=minX,maxX=-minX,maxY=-minX;
                for(float px:new float[]{0,2688})for(float py:new float[]{0,1216}){
                    float x=lm[0]*px+lm[2]*py+pos[0],y=lm[1]*px+lm[3]*py+pos[1];
                    minX=Math.min(minX,x);maxX=Math.max(maxX,x);minY=Math.min(minY,y);maxY=Math.max(maxY,y);
                    float backX=lm[0]*(x-pos[0])+lm[1]*(y-pos[1]),backY=lm[2]*(x-pos[0])+lm[3]*(y-pos[1]);
                    near(backX,px,"native inverse maps landscape touch x");near(backY,py,"native inverse maps landscape touch y");
                }
                near(minX,0,"frame begins at left");near(minY,0,"frame begins at top");near(maxX,1216,"frame uses full width");near(maxY,2688,"frame uses full height");
                app.side=!side;fit(app,app.tx,leash);near(app.tx.matrices.get(app.surface)[0],1,"role change retains full landscape frame");
                float[] changedLeash=app.tx.matrices.get(leash),changedPosition=app.tx.positions.get(leash);
                for(int i=0;i<4;i++)near(changedLeash[i],lm[i],"role change preserves direction");
                for(int i=0;i<2;i++)near(changedPosition[i],pos[i],"role change preserves local origin");
            }
            check(token.surface==app.surface,"exact modified surface retained for rollback");resetSurface(app,token);
            near(app.tx.matrices.get(app.surface)[0],1,"native matrix restored");near(app.tx.positions.get(app.surface)[0],3,"native x restored");near(app.tx.positions.get(app.surface)[1],5,"native y restored");
            check(token.surface==null,"duplicate native/explicit completion cannot reset twice");
        }
        App changed=new App();new Task(changed);Token token=new Token(changed.state,1);tokens.put(changed,token);Surface leash=new Surface();fit(changed,changed.tx,leash);
        changed.side=true;int before=traversals;
        check(refresh(changed,null),"stable owned side orientation remains eligible without a foreground transition");
        check(traversals==before+1,"queued local pose must reach display traversal even when the side app is idle");
        near(changed.tx.positions.get(changed.leash)[1],0,"idle side retains full quarter-turn pose");
        Surface original=changed.surface;changed.surface=new Surface();changed.tx=new Tx();resetSurface(changed,token);
        check(changed.tx.matrices.isEmpty(),"replacement surface never receives old rollback");
        changed.state=new Object();fit(changed,changed.tx,leash);check(changed.tx.matrices.isEmpty(),"foreign fixed rotation untouched");
        App background=new App();new Task(background);check(retained(background),"loss of focus for recents retains live landscape task");
        background.task.top=new App();check(!retained(background),"replaced activity releases old transform");background.task.top=background;
        background.task.display=new Object();check(!retained(background),"another display retains native ownership");background.task.display=Wm.display;
        background.task.mode=5;check(!retained(background),"native freeform releases local rotation");background.task.mode=1;
        background.task.user=10;check(!retained(background),"user scope enforced");
        System.out.println("PASS "+checks+" production landscape ownership/geometry checks");
    }
}
'''.replace('METHODS','\n'.join(method(s) for s in ['static final class Token','static boolean owned(', 'static void resetSurface(', 'static void fit(', 'static boolean retained(', 'static boolean refresh(']))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-landscape-') as tmp:
    folder=Path(tmp);test=folder/'LandscapeCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.LandscapeCases'],check=True)
