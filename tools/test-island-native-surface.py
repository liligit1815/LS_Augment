"""Run production draw hooks against inherited, missing and incompatible OEM contracts."""
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
'android/graphics/Path.java':'package android.graphics;public class Path{}',
'android/view/View.java':'package android.view;public class View{public android.content.Context getContext(){return new android.content.Context();}}',
'ls/augment/com/IslandVisualSpec.java':(SRC.parent/'IslandVisualSpec.java').read_text('utf-8'),
'ls/augment/com/hook/Native12IslandStyle.java':'package ls.augment.com.hook;class Native12IslandStyle{static int dp(android.content.Context c,float v){return Math.round(v*3.25f);}}',
'ls/augment/com/hook/MagicIslandScenes.java':'package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{'+member(magic,'    static Method exact(')+member(magic,'    static Field typed(')+'}',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;class AugmentModule{
 interface Chain{Object getThisObject();Object proceed()throws Throwable;}interface Hook{Object intercept(Chain c)throws Throwable;}
 Map<String,Hook> callbacks=new HashMap<>();int errors;Builder prepareFeatureHook(Method m,String n,boolean b){return new Builder(m.getDeclaringClass().getSimpleName());}
 class Builder{String name;Builder(String n){name=n;}Builder intercept(Hook h){callbacks.put(name,h);return this;}}
 void registerFeatureHook(Builder b){}void logFeatureError(String s,Throwable t){errors++;}}''',
'ls/augment/com/hook/IslandNativeSurface.java':'''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;import android.view.View;import android.graphics.Canvas;import android.graphics.Path;import ls.augment.com.IslandVisualSpec;
class IslandNativeSurface{static final Map<View,IslandNativeSurface>SURFACES=new IdentityHashMap<>();static final Set<Class<?>>DRAW_CONTRACTS=Collections.newSetFromMap(new IdentityHashMap<>());
boolean selected=true;boolean active(Object target){return selected;}'''+member(surface,'    static int install(')+member(surface,'    private static boolean drawable(')+'''
static class Child extends com.zte.feature.dynamicisland.DynamicIslandBackground{}
static class DualChild extends com.zte.feature.dynamicisland.StickyAnimationView{}
static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
public static void main(String[]args)throws Throwable{
 AugmentModule m=new AugmentModule();int installed=install(m,IslandNativeSurface.class.getClassLoader());
 if(args.length>0){check(installed==0&&m.callbacks.isEmpty()&&m.errors==2,"missing or wrong contracts rejected before hooks");System.out.println("PASS rejected "+args[0]);return;}
 check(installed==2&&m.errors==0,"verified panel and compact draw hooks");
 for(View view:new View[]{new com.zte.feature.dynamicisland.DynamicIslandBackground(),new Child(),new com.zte.feature.dynamicisland.StickyAnimationView(),new DualChild()}){
  var owner=new IslandNativeSurface();boolean panel=view instanceof com.zte.feature.dynamicisland.DynamicIslandBackground;
  Field radius=panel?MagicIslandScenes.typed(view.getClass(),"cornerRadius",float.class):null;
  if(radius!=null)radius.setFloat(view,52f);
  Field glass=MagicIslandScenes.typed(view.getClass(),"mGlassVisual",boolean.class);
  var hook=m.callbacks.get(panel?"DynamicIslandBackground":"StickyAnimationView");check(drawable(view),"subclass capability accepted");
  for(boolean originalGlass:new boolean[]{true,false})for(boolean own:new boolean[]{false,true})for(boolean enabled:new boolean[]{false,true})for(boolean fail:new boolean[]{false,true}){
   glass.setBoolean(view,originalGlass);owner.selected=enabled;if(own)SURFACES.put(view,owner);else SURFACES.remove(view);
   final boolean styled=own&&enabled;final RuntimeException original=new RuntimeException("native draw error");Object result=null;
   try{result=hook.intercept(new AugmentModule.Chain(){public Object getThisObject(){return view;}public Object proceed()throws Throwable{
    if(radius!=null)check(radius.getFloat(view)==(styled?98f:52f),"selected panel radius, native geometry retained");
    check(glass.getBoolean(view)==(styled?false:originalGlass),"opaque only for selected owned single/dual surface");
    if(fail)throw original;return "native-result";}});check(!fail&&result.equals("native-result"),"native return preserved");}
   catch(RuntimeException e){check(fail&&e==original,"native exception preserved");}
   check((radius==null||radius.getFloat(view)==52f)&&glass.getBoolean(view)==originalGlass,"native flags restored even on exception");
  }
 }
 AugmentModule missing=new AugmentModule();ClassLoader absent=new ClassLoader(IslandNativeSurface.class.getClassLoader()){@Override protected Class<?>loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.startsWith("com.zte.feature.dynamicisland."))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
 check(install(missing,absent)==0&&missing.callbacks.isEmpty(),"old host without full-screen contract stays native");
 System.out.println("PASS opaque native surfaces: "+checks+" checks");
}}
'''
}
jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
for variant in ('valid','wrong-glass','wrong-draw','missing-black-fill'):
    native={}
    for name in ('DynamicIslandBackground','StickyAnimationView'):
        fake='package com.zte.feature.dynamicisland;public class '+name+''' extends android.view.View{public float cornerRadius;public boolean mGlassVisual;
protected void onDraw(android.graphics.Canvas c){}private void updatePathWithAnimatedSize(){}
private void drawBlackFill(android.graphics.Canvas c,android.graphics.Path p){}private void drawBlackPath(android.graphics.Canvas c,android.graphics.Path p){}}'''
        if variant=='wrong-glass':fake=fake.replace('boolean mGlassVisual','String mGlassVisual')
        if variant=='wrong-draw':fake=fake.replace('void onDraw(android.graphics.Canvas c){}','int onDraw(android.graphics.Canvas c){return 0;}')
        if variant=='missing-black-fill':fake=fake.replace('void drawBlackFill(', 'void unsupportedFill(')
        native['com/zte/feature/dynamicisland/'+name+'.java']=fake
    with tempfile.TemporaryDirectory(prefix='duo-black-contract-') as temp:
        folder=Path(temp)
        for name,source in {**files,**native}.items():
            p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,'utf-8')
        subprocess.run([str(jdk/'javac'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
        subprocess.run([str(jdk/'java'),'-cp',str(folder),'ls.augment.com.hook.IslandNativeSurface',*([variant] if variant!='valid' else [])],check=True)
