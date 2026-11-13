"""Execute native compact width negotiation, including inherited and unavailable contracts."""
from pathlib import Path
import os,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
source=(SRC/'hook/MagicIslandScenes.java').read_text('utf-8')
def member(marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
files={
'android/content/Context.java':'package android.content;public class Context{public android.content.res.Resources getResources(){return new android.content.res.Resources();}}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=3.25f;public int widthPixels=1216;}',
'android/view/View.java':'package android.view;public class View{}',
'com/zte/feature/dynamicisland/DynamicPermanentIsland.java':'package com.zte.feature.dynamicisland;public class DynamicPermanentIsland extends android.view.View{public int mIslandWidth=500,mMultiIslandWidth=500;}',
'ls/augment/com/hook/MagicIslandScenes.java':'package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{'+member('    static Method exact(')+member('    static Field typed(')+'}',
'ls/augment/com/hook/TestWidth.java':'''package ls.augment.com.hook;import android.content.*;import com.zte.feature.dynamicisland.*;
public class TestWidth{
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static class Card extends DynamicPermanentIsland{}static class Wrong extends Card{public String mIslandWidth="wrong";}
 static class Manager{int updates;boolean fail;public int getIslandWidth(int desired,boolean single){return Math.max(380,Math.min(single?709:556,desired));}public void updateIslandWidth(DynamicPermanentIsland c){updates++;if(fail)throw new IllegalStateException();}}
 static class Child extends Manager{}static class Missing{public int getIslandWidth(int d,boolean s){return d;}}
 public static void main(String[] args)throws Exception{Card c=new Card();Child m=new Child();IslandCompactWidth w=new IslandCompactWidth(new Context(),m,c);
 w.apply(20,false);check(c.mIslandWidth==380&&c.mMultiIslandWidth==380&&m.updates==0,"minimum before publish");
 w.apply(300,true);check(c.mIslandWidth==456&&m.updates==1,"content-based width");w.apply(2000,true);check(c.mIslandWidth==709&&c.mMultiIslandWidth==556&&m.updates==2,"native single and multi caps");
 w.apply(2000,true);check(m.updates==2,"unchanged width must not restart animation");w.apply(20,true);check(c.mIslandWidth==380,"long to short restores minimum");
 m.fail=true;try{w.apply(2000,true);throw new AssertionError("failure hidden");}catch(java.lang.reflect.InvocationTargetException expected){}check(c.mIslandWidth==380&&c.mMultiIslandWidth==380,"failed update restores fields");
 boolean missing=false;try{new IslandCompactWidth(new Context(),new Missing(),c);}catch(NoSuchMethodException expected){missing=true;}check(missing,"missing native update accepted");
 boolean wrong=false;try{new IslandCompactWidth(new Context(),m,new Wrong());}catch(NoSuchFieldException expected){wrong=true;}check(wrong,"shadowed field type accepted");
 System.out.println("PASS compact width: "+checks+" checks");}}
'''}
for name in ['IslandVisualSpec','hook/IslandCompactWidth']:files['ls/augment/com/'+name+'.java']=(SRC/(name+'.java')).read_text('utf-8')
with tempfile.TemporaryDirectory(prefix='duo-width-') as tmp:
    folder=Path(tmp)
    for name,code in files.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,'utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',tmp,*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',tmp,'ls.augment.com.hook.TestWidth'],check=True)
