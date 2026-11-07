"""Exercise the production normalization against native parent/child ownership migration.

The native tree model follows WindowContainer's inspected shouldMagnify/apply/clear
branches. It checks composed surface geometry, including the last-preview transition,
instead of assuming that a task's cached matrix proves its final screen geometry.
"""
import os, subprocess, tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/step/NativeWorkspaceGuard.java').read_text(encoding='utf8')
assert 'else normalizeMagnificationOwner(p.thisObject,p.args[0],p.args[1]);' in source
start=source.index('    static void normalizeMagnificationOwner(')
end=source.index('    static boolean physicalNativeWindow(',start)
method=source[start:end]
start=source.index('    static void resetReturnedTransform(')
end=source.index('    static void traceHandoff(',start)
reset_method=source[start:end]
harness=r'''
import java.util.*;
public class MagnificationHandoffCases {
    static int checks;
    static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static void near(float a,float b,String why){check(Math.abs(a-b)<.0001f,why+": "+a+" != "+b);}
    static class Spec {float s,x,y;Spec(float a,float b,float c){s=a;x=b;y=c;}}
    static class Node {
        Node parent;List<Node> children=new ArrayList<>();Object display;Spec cached;
        float scale=1,x,y;boolean physical;int id=7,mode=1;Object token=new Object();Point position=new Point();
        Node(Node p){parent=p;display=Wm.display;if(p!=null)p.children.add(this);}
        boolean magnifies(){if(physical)return false;for(Node n:children)if(!n.magnifies())return false;return true;}
        void clear(Tx tx){if(cached!=null){tx.set(this,1,0,0);cached=null;}for(Node n:children)n.clear(tx);}
    }
    static class Tx {
        List<Runnable> writes=new ArrayList<>();
        void set(Node n,float s,float x,float y){writes.add(()->{n.scale=s;n.x=x;n.y=y;});}
        void apply(){for(Runnable r:writes)r.run();writes.clear();}
    }
    static class Wm {static boolean active=true;static Object display=new Object();static Spec ownedSpec=new Spec(.75f,0,320),current=ownedSpec;}
    static class Point {int x,y;}
    static class SavedTask {Node task;Object parent,token;int id,layerId;SavedTask(Node n){task=n;parent=n.parent;token=n.token;id=layerId=n.id;}}
    static Node live;
    static Object liveTask(int id,Object token){return live!=null && live.id==id && live.token==token?live:null;}
    static Object field(Object o,String n){if(o==Wm.display && n.equals("mMagnificationSpec"))return Wm.current;if(o instanceof Node node && n.equals("positionInParent"))return node.position;throw new AssertionError(n);}
    static Object call(Object o,String n,Object... a){
        if(o instanceof Tx tx){Node node=(Node)a[0];
            switch(n){case "setMatrix":tx.writes.add(()->node.scale=(Float)a[1]);break;
                case "setPosition":tx.writes.add(()->{node.x=(Float)a[1];node.y=(Float)a[2];});break;
                case "setWindowCrop":break;default:throw new AssertionError(n);}return null;}
        Node node=(Node)o;
        return switch(n){case "getDisplayContent"->node.display;case "shouldMagnify"->node.magnifies();
            case "getParent"->node.parent;case "getWindowingMode"->node.mode;case "getLayerId"->node.id;
            case "getSurfaceControl","getTaskInfo"->node;
            case "clearMagnificationSpec"->{node.clear((Tx)a[0]);yield null;}default->throw new AssertionError(n);};
    }
    METHOD
    RESET_METHOD
    static void applyNative(Node node,Tx tx,Spec spec,boolean normalized){
        if(node.physical)return; // production apply hook's exact/physical task exclusion
        if(normalized)normalizeMagnificationOwner(node,tx,spec);
        if(node.magnifies()){tx.set(node,spec.s,spec.x,spec.y);node.cached=spec;return;}
        node.clear(tx);for(Node child:node.children)applyNative(child,tx,spec,normalized);
    }
    static float[] composed(Node n){
        float s=n.scale,x=n.x,y=n.y;
        for(Node p=n.parent;p!=null;p=p.parent){x=x*p.scale+p.x;y=y*p.scale+p.y;s*=p.scale;}
        return new float[]{s,x,y};
    }
    static void stage(Node n,Spec spec){Tx tx=new Tx();tx.set(n,spec.s,spec.x,spec.y);n.cached=spec;tx.apply();}
    static void assertMain(Node n,String label){float[] p=composed(n);near(p[0],Wm.ownedSpec.s,label+" scale");near(p[1],Wm.ownedSpec.x,label+" x");near(p[2],Wm.ownedSpec.y,label+" y");}
    static void reset(){Wm.active=true;Wm.ownedSpec=new Spec(.75f,0,320);Wm.current=Wm.ownedSpec;}
    static void lastPreview(){
        reset();Node parent=new Node(null),task=new Node(parent);stage(task,Wm.ownedSpec);
        Tx tx=new Tx();applyNative(parent,tx,Wm.ownedSpec,false);tx.apply();
        near(composed(task)[0],.5625f,"old branch reproduces squared scale");near(composed(task)[2],560,"old branch reproduces repeated offset");
        reset();parent=new Node(null);task=new Node(parent);stage(task,Wm.ownedSpec);
        tx=new Tx();applyNative(parent,tx,Wm.ownedSpec,true);
        assertMain(task,"before atomic commit stays at original main pose");
        tx.apply();assertMain(task,"parent takeover");check(task.cached==null,"former task owner cache cleared");
        for(int i=0;i<5;i++){tx=new Tx();applyNative(parent,tx,Wm.ownedSpec,true);tx.apply();assertMain(task,"idempotent replay "+i);}
    }
    static void topology(){
        for(boolean left:new boolean[]{false,true})for(int depth=1;depth<=4;depth++){
            reset();Wm.ownedSpec.x=left?250:0;
            Node root=new Node(null),p=root;for(int i=1;i<depth;i++)p=new Node(p);
            Node main=new Node(p),side=new Node(p);side.physical=true;
            Tx tx=new Tx();applyNative(root,tx,Wm.ownedSpec,true);tx.apply();assertMain(main,"task owner while peer is physical");
            p.children.remove(side);stage(main,Wm.ownedSpec);
            tx=new Tx();applyNative(root,tx,Wm.ownedSpec,true);tx.apply();assertMain(main,"last peer removed depth "+depth);
            p.children.add(side);tx=new Tx();applyNative(root,tx,Wm.ownedSpec,true);tx.apply();assertMain(main,"parent hands scale back to task");
            Wm.ownedSpec=new Spec(.68f,left?280:0,180);Wm.current=Wm.ownedSpec;
            tx=new Tx();applyNative(root,tx,Wm.ownedSpec,true);tx.apply();assertMain(main,"new live geometry");
        }
    }
    static void boundaries(){
        for(int kind=0;kind<4;kind++){
            reset();Node parent=new Node(null),task=new Node(parent);stage(task,Wm.ownedSpec);Spec requested=Wm.ownedSpec;
            switch(kind){case 0:Wm.active=false;break;case 1:requested=new Spec(.75f,0,320);break;
                case 2:Wm.current=new Spec(1,0,0);break;case 3:parent.display=new Object();break;}
            Tx tx=new Tx();normalizeMagnificationOwner(parent,tx,requested);tx.apply();
            check(task.cached==Wm.ownedSpec,"unowned normalization skipped "+kind);near(task.scale,.75f,"unowned child untouched "+kind);
        }
        reset();Node parent=new Node(null),task=new Node(parent);task.physical=true;stage(task,Wm.ownedSpec);
        Tx tx=new Tx();normalizeMagnificationOwner(parent,tx,Wm.ownedSpec);tx.apply();
        check(task.cached==Wm.ownedSpec,"non-magnifying parent does not clear a physical task in normalization hook");
    }
    static void deferredCommit(){
        reset();Node parent=new Node(null),task=new Node(parent);live=task;SavedTask saved=new SavedTask(task);
        stage(parent,Wm.ownedSpec);stage(task,Wm.ownedSpec);task.cached=null; // WM cleared cache before old deferred matrix reached compositor
        Tx tx=new Tx();resetReturnedTransform(saved,tx);applyNative(parent,tx,Wm.ownedSpec,true);tx.apply();
        assertMain(task,"returned task reset even after its cache was lost");
        for(int kind=0;kind<4;kind++){
            reset();parent=new Node(null);task=new Node(parent);live=task;saved=new SavedTask(task);stage(task,Wm.ownedSpec);
            switch(kind){case 0:task.parent=new Node(null);break;case 1:task.mode=5;break;
                case 2:saved.layerId=99;break;case 3:task.display=new Object();break;}
            tx=new Tx();try{resetReturnedTransform(saved,tx);throw new AssertionError("identity accepted "+kind);}catch(IllegalStateException expected){checks++;}
            check(tx.writes.isEmpty(),"changed owner receives no writes "+kind);
        }
        live=null;tx=new Tx();resetReturnedTransform(saved,tx);check(tx.writes.isEmpty(),"vanished task receives no writes");
    }
    public static void main(String[] args){lastPreview();topology();boundaries();deferredCommit();System.out.println("PASS "+checks+" magnification handoff checks");}
}
'''.replace('RESET_METHOD',reset_method).replace('METHOD',method)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-magnification-') as tmp:
    folder=Path(tmp);test=folder/'MagnificationHandoffCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([str(java/'javac'),'-encoding','UTF-8','-d',str(folder),str(test)],check=True)
    subprocess.run([str(java/'java'),'-cp',str(folder),'MagnificationHandoffCases'],check=True)
