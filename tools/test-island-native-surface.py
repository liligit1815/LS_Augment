"""Exercise the real draw hook and capability checks without replacing OEM glass state."""
from pathlib import Path
import os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook'
def member(source,marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
surface=(SRC/'IslandNativeSurface.java').read_text('utf-8')
magic=(SRC/'MagicIslandScenes.java').read_text('utf-8')
files={
'android/content/Context.java':'package android.content;public class Context{}',
'android/graphics/Canvas.java':'package android.graphics;public class Canvas{}',
'android/view/View.java':'package android.view;public class View{public android.content.Context getContext(){return new android.content.Context();}}',
'ls/augment/com/IslandVisualSpec.java':(SRC.parent/'IslandVisualSpec.java').read_text('utf-8'),
'ls/augment/com/hook/Native12IslandStyle.java':'package ls.augment.com.hook;class Native12IslandStyle{static int dp(android.content.Context c,float v){return Math.round(v*3.25f);}}',
'ls/augment/com/hook/MagicIslandScenes.java':'package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{'+member(magic,'    static Method exact(')+member(magic,'    static Field typed(')+'}',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;class AugmentModule{
 interface Chain{Object getThisObject();Object proceed()throws Throwable;}interface Hook{Object intercept(Chain c)throws Throwable;}
 Hook callback;int errors;Builder prepareFeatureHook(Method m,String n,boolean b){return new Builder();}class Builder{Builder intercept(Hook h){callback=h;return this;}}
 void registerFeatureHook(Builder b){}void logFeatureError(String s,Throwable t){errors++;}}''',
'ls/augment/com/hook/IslandNativeSurface.java':'''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;import android.view.View;import android.graphics.Canvas;import ls.augment.com.IslandVisualSpec;
class IslandNativeSurface{static final Map<View,IslandNativeSurface>SURFACES=new IdentityHashMap<>();static final Set<Class<?>>DRAW_CONTRACTS=Collections.newSetFromMap(new IdentityHashMap<>());
boolean selected=true;boolean active(Object target){return selected;}'''+member(surface,'    static int install(')+member(surface,'    private static boolean drawable(')+'''
static class Child extends com.zte.feature.dynamicisland.DynamicIslandBackground{}
static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
public static void main(String[]args)throws Throwable{
 AugmentModule m=new AugmentModule();int installed=install(m,IslandNativeSurface.class.getClassLoader());
 if(args.length>0){check(installed==0&&m.callback==null&&m.errors==1,"missing or wrong draw contract is rejected before hooks");System.out.println("PASS rejected "+args[0]);return;}
 check(installed==1&&m.errors==0,"verified draw hook");
 for(var view:new com.zte.feature.dynamicisland.DynamicIslandBackground[]{new com.zte.feature.dynamicisland.DynamicIslandBackground(),new Child()}){
  var owner=new IslandNativeSurface();var radius=MagicIslandScenes.typed(view.getClass(),"cornerRadius",float.class);radius.setFloat(view,52f);
  for(boolean glass:new boolean[]{true,false})for(boolean own:new boolean[]{false,true})for(boolean enabled:new boolean[]{false,true})for(boolean fail:new boolean[]{false,true}){
   view.mGlassVisual=glass;owner.selected=enabled;if(own)SURFACES.put(view,owner);else SURFACES.remove(view);
   final boolean styled=own&&enabled;final RuntimeException original=new RuntimeException("native draw error");Object result=null;
   try{result=m.callback.intercept(new AugmentModule.Chain(){public Object getThisObject(){return view;}public Object proceed()throws Throwable{
    check(radius.getFloat(view)==(styled?98f:52f),"only selected owned panel radius changes");check(view.mGlassVisual==glass,"native material flag stays unchanged");
    if(fail)throw original;return "native-result";}});check(!fail&&result.equals("native-result"),"native return preserved");}
   catch(RuntimeException e){check(fail&&e==original,"native exception preserved");}
   check(radius.getFloat(view)==52f&&view.mGlassVisual==glass,"draw state restored even on exception");
  }
 }
 AugmentModule missing=new AugmentModule();ClassLoader absent=new ClassLoader(IslandNativeSurface.class.getClassLoader()){@Override protected Class<?>loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.endsWith("DynamicIslandBackground"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
 check(install(missing,absent)==0&&missing.callback==null,"old host missing fullscreen material remains native");
 System.out.println("PASS native liquid surface: "+checks+" checks (owned/unowned, enabled/disabled, inherited, native material, exception restoration)");
}}
'''
}
jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
for variant in ('valid','wrong-radius','wrong-draw'):
    fake='package com.zte.feature.dynamicisland;public class DynamicIslandBackground extends android.view.View{public float cornerRadius;public boolean mGlassVisual;protected void onDraw(android.graphics.Canvas c){}private void updatePathWithAnimatedSize(){}}'
    if variant=='wrong-radius':fake=fake.replace('float cornerRadius','String cornerRadius')
    if variant=='wrong-draw':fake=fake.replace('void onDraw(android.graphics.Canvas c){}','int onDraw(android.graphics.Canvas c){return 0;}')
    with tempfile.TemporaryDirectory(prefix='duo-glass-contract-') as temp:
        folder=Path(temp)
        for name,source in {**files,'com/zte/feature/dynamicisland/DynamicIslandBackground.java':fake}.items():
            p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,'utf-8')
        subprocess.run([str(jdk/'javac'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
        subprocess.run([str(jdk/'java'),'-cp',str(folder),'ls.augment.com.hook.IslandNativeSurface',*([variant] if variant!='valid' else [])],check=True)
