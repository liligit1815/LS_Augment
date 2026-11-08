"""Run the actual exit-direction handoff, including cached portrait and absent APIs."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/step/LocalLandscape.java').read_text(encoding='utf8')
start=source.index('static void restoreOrientation(');end=source.index('{',start)+1;depth=1
while depth:
    depth+=(source[end]=='{')-(source[end]=='}');end+=1
harness=r'''
import java.lang.reflect.Method;
public class OrientationReturnCases {
    static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    public static class Rotation {int requested=-1;boolean force,changed=true;public boolean updateOrientation(int request,boolean force){requested=request;this.force=force;return changed;}}
    public static class Display {int current,configurations;Rotation rotation=new Rotation();public Rotation getDisplayRotation(){return rotation;}public int getOrientation(){return current;}public boolean sendNewConfiguration(){configurations++;return true;}}
    static class Wm {static Display display=new Display();}
    static Method displayRotation,displayOrientation,nativeOrientation,sendConfiguration;
    static Object entryOwner;static long entryDeadline;
    METHOD
    public static void main(String[] args)throws Exception{
        displayRotation=Display.class.getMethod("getDisplayRotation");displayOrientation=Display.class.getMethod("getOrientation");
        nativeOrientation=Rotation.class.getMethod("updateOrientation",int.class,boolean.class);sendConfiguration=Display.class.getMethod("sendNewConfiguration");
        for(int request:new int[]{0,8,1,-1}){
            Wm.display=new Display();Wm.display.current=request;entryOwner=new Object();entryDeadline=5000;restoreOrientation();
            check(Wm.display.rotation.requested==request,"native foreground request recomputed, never fixed to portrait");
            check(Wm.display.rotation.force && Wm.display.configurations==1,"native rotation result dispatches configuration");
            check(entryOwner==null && entryDeadline==0,"temporary entry hold cannot outlive exit");
        }
        Wm.display=new Display();Wm.display.rotation.changed=false;restoreOrientation();check(Wm.display.configurations==0,"unchanged native orientation creates no redundant configuration");
        nativeOrientation=null;entryOwner=new Object();entryDeadline=5000;restoreOrientation();
        check(entryOwner==null && entryDeadline==0 && Wm.display.configurations==0,"missing capability clears only module lease and preserves native behavior");
        System.out.println("PASS "+checks+" production native orientation return checks");
    }
}
'''.replace('METHOD',source[start:end])
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-native-orientation-') as tmp:
    folder=Path(tmp);test=folder/'OrientationReturnCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test],check=True)
    subprocess.run([java/'java','-cp',folder,'OrientationReturnCases'],check=True)
