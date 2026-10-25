"""Compile real monitor Hook/Config against deterministic Android/OEM doubles.

Every variant is compiled and run in its own temporary JVM class path. The OEM
methods dispatch through the interception facade themselves, so reflection calls
made inside the production hook exercise the same nested interception path.
This checks contracts and lifecycle logic, not Android layout/GPU or device APIs.
"""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


FIELDS = [
    ("context", "android.content.Context", "j", "mContext"),
    ("content", "android.widget.LinearLayout", "m", "mContentLayout"),
    ("background", "CornerRectangle", "n", "mMonitorBackgroundView"),
    ("shortBackground", "CornerRectangle", "o", "mShortenMonitorBackgroundView"),
    ("fullWidth", "int", "J", "mFixedWidth"),
    ("currentWidth", "int", "L", "mWindowWidth"),
    ("shortWidth", "int", "R", "mShortenViewWidth"),
    ("params", "android.view.WindowManager.LayoutParams", "v", "mLayoutParams"),
    ("shortened", "boolean", "U", "mIsViewGroupShorten"),
    ("selectedIndex", "int", "V", "mLastClickIndex"),
    ("added", "boolean", "h", "mWindowAdd"),
    ("root", "android.view.ViewGroup", "k", "mFloatLayout"),
    ("manager", "cn.nubia.gameassist.utils.WindowManagerUtil", "w", "mWindowManager"),
    ("pointX", "int", "S", "mPointX"),
]
METHODS = [
    ("init", "void", "I", "initView", "", "", "initCore();return null;"),
    ("dimensions", "void", "H", "initSize", "", "", "dimensionsCore();return null;"),
    ("params", "WindowManager.LayoutParams", "G", "initLayoutParams", "", "", "params().width=shortened()?shortWidth():fullWidth();return params();"),
    ("show", "void", "v", "addOpenOrShortenWindow", "boolean value", "boolean.class", "showCore((Boolean)a[0]);return null;"),
    ("add", "void", "addFloatView", "addFloatView", "String value", "String.class", "added(true);showCore(shortened());return null;"),
    ("alpha", "void", "R", "setAlpha", "float value", "float.class", "background().setAlpha((Float)a[0]);shortBackground().setAlpha((Float)a[0]);return null;"),
    ("hit", "int", "A", "getItemIndex", "float value", "float.class", "return stockHit((Float)a[0]);"),
    ("click", "void", "N", "onItemClick", "float value", "float.class", "stockClick((Float)a[0]);return null;"),
    ("clamp", "void", "w", "checkLayoutParams", "", "", "clamps++;params().x=Math.max(0,Math.min(10000-params().width,params().x));return null;"),
    ("save", "void", "Q", "saveFloatingX", "int value", "int.class", "if(shortened())savedShortX=(Integer)a[0];else savedFullX=(Integer)a[0];return null;"),
    ("fade", "void", "y", "fadeLayout", "boolean value", "boolean.class", "fades++;goingToFade=(Boolean)a[0];fadeDelay=goingToFade?5000:0;return null;"),
]

STUBS = {
    "ls/augment/com/hook/FloatingPositionLock.java": "package ls.augment.com.hook; final class FloatingPositionLock {static void install(AugmentModule m){}static void monitor(android.view.View v){}static boolean cancelling(){return false;}}",
    "ls/augment/com/hook/MonitorTelemetry.java": """package ls.augment.com.hook;import android.view.*;
final class MonitorTelemetry {MonitorTelemetry(ViewGroup content){for(int i=0;i<4;i++){View cell=new View(content.getContext());cell.layoutParams=new ViewGroup.LayoutParams(76,40);cell.setVisibility(View.GONE);content.addView(cell);}} void configure(boolean on,String selection){}void dispose(){}}""",
    "android/content/Context.java": "package android.content;public class Context {public android.content.res.Resources getResources(){return new android.content.res.Resources();}}",
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}",
    "android/util/DisplayMetrics.java": "package android.util;public class DisplayMetrics {public static int width=10000;public int widthPixels=width;}",
    "android/view/View.java": """package android.view;import android.content.Context;
public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public final Context context;
 public int visibility=VISIBLE,left,right,measuredWidth,requests;public float alpha=1,translationX;
 public ViewGroup.LayoutParams layoutParams=new ViewGroup.LayoutParams(0,0);public Runnable layout;
 public View(Context c){context=c;}public Context getContext(){return context;}
 public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}
 public void setAlpha(float a){alpha=a;}public float getAlpha(){return alpha;}
 public void setTranslationX(float t){translationX=t;}public float getTranslationX(){return translationX;}
 public int getLeft(){return left;}public int getRight(){return right;}public int getWidth(){return right-left;}
 public int getMeasuredWidth(){return measuredWidth;}public ViewGroup.LayoutParams getLayoutParams(){return layoutParams;}
 public void setLayoutParams(ViewGroup.LayoutParams p){layoutParams=p;}
 public void requestLayout(){requests++;if(layout!=null)layout.run();}
 public void measure(int w,int h){measuredWidth=Math.max(0,layoutParams.width);}
 public static class MeasureSpec {public static final int EXACTLY=0x40000000,UNSPECIFIED=0;
  public static int makeMeasureSpec(int size,int mode){return size|mode;}}
}
""",
    "android/view/ViewGroup.java": """package android.view;import android.content.Context;import java.util.*;
public class ViewGroup extends View {
 public final List<View> children=new ArrayList<>();public int paddingLeft,paddingRight;
 public ViewGroup(Context c){super(c);}public int getChildCount(){return children.size();}
 public View getChildAt(int i){return children.get(i);}public void addView(View v){children.add(v);}
 public int getPaddingLeft(){return paddingLeft;}public int getPaddingRight(){return paddingRight;}
 public static class LayoutParams {public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
 public static class MarginLayoutParams extends LayoutParams {public int leftMargin,rightMargin;
  public MarginLayoutParams(int w,int h){super(w,h);}}
}
""",
    "android/widget/LinearLayout.java": """package android.widget;import android.content.Context;import android.view.*;
public class LinearLayout extends ViewGroup {
 public static class LayoutParams extends ViewGroup.MarginLayoutParams {public float weight;public LayoutParams(int w,int h){super(w,h);}}
 public int measurements;public LinearLayout(Context c){super(c);}
  @Override public void measure(int w,int h){measurements++;for(View v:children)if(v.getVisibility()!=GONE)v.measure(w,h);else v.measuredWidth=0;measuredWidth=w&0x3fffffff;}
 public void layoutCells(){int cursor=paddingLeft;for(View v:children)if(v.getVisibility()!=GONE){
  ViewGroup.LayoutParams p=v.getLayoutParams();int l=0,r=0;if(p instanceof MarginLayoutParams){
   l=((MarginLayoutParams)p).leftMargin;r=((MarginLayoutParams)p).rightMargin;}
  v.left=cursor+l;v.right=v.left+v.getMeasuredWidth();cursor=v.right+r;}}
}
""",
    "android/view/WindowManager.java": """package android.view;public interface WindowManager {
 class LayoutParams extends ViewGroup.LayoutParams {public int x,y;public LayoutParams(){super(0,0);}}
}
""",
    "io/github/libxposed/api/XposedInterface.java": """package io.github.libxposed.api;
public interface XposedInterface {interface Chain {Object getThisObject();Object getArg(int i);
 Object proceed()throws Throwable;Object proceed(Object[] args)throws Throwable;}}
""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import android.content.Context;import java.util.*;import ls.augment.com.*;
public class FeatureSettings {
 public static boolean on;public static String selection=GamePerformanceMonitorConfig.DEFAULT_ITEMS;
 public static int transparency=50;public static final List<Runnable> listeners=new ArrayList<>();
 public static final List<String> diagnostics=new ArrayList<>();public static final List<Throwable> errors=new ArrayList<>();
 public static void reset(){on=false;selection=GamePerformanceMonitorConfig.DEFAULT_ITEMS;transparency=50;
  listeners.clear();diagnostics.clear();errors.clear();}
 public static boolean enabled(Context c,String key,boolean fallback){return on;}
 public static int integer(Context c,String key,int fallback,int min,int max){return transparency;}
 public static String text(Context c,String key,String fallback){return selection;}
 public static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
 public static void fire(){for(Runnable r:new ArrayList<>(listeners))r.run();}
 public static void diagnostic(Context c,String key,String value){diagnostics.add(value);}
 public static Context from(Object ignored){return new Context();}
 public static void diagnosticError(Context c,String key,String phase,Throwable error){errors.add(error);}
}
""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.Chain;
public class AugmentModule {
 public interface Original {Object run(Object[] args)throws Throwable;}
 public interface Interceptor {Object run(Chain chain)throws Throwable;}
 public static AugmentModule active;public final Map<Method,Entry> hooks=new LinkedHashMap<>();
 public final List<String> info=new ArrayList<>();public final List<Throwable> errors=new ArrayList<>();
 public AugmentModule(){active=this;}public Entry prepareFeatureHook(Method method,String key,boolean value){return new Entry(method);}
 public void registerFeatureHook(Entry e){if(hooks.put(e.method,e)!=null)throw new AssertionError("duplicate hook");}
 public void logFeatureInfo(String value){info.add(value);}public void logFeatureError(String key,Throwable e){errors.add(e);}
 public static class Entry {public final Method method;public Interceptor interceptor;
  Entry(Method m){method=m;}public Entry intercept(Interceptor i){interceptor=i;return this;}}
 public static Object dispatch(Object owner,Method method,Object[] args,Original original)throws Throwable {
  Entry e=active==null?null:active.hooks.get(method);if(e==null)return original.run(args);
  return e.interceptor.run(new Chain(){public Object getThisObject(){return owner;}
   public Object getArg(int i){return args[i];}public Object proceed()throws Throwable{return original.run(args);}
   public Object proceed(Object[] replacement)throws Throwable{return original.run(replacement);}});
 }
}
""",
    "cn/nubia/gameassist/dessert/policy/performancemonitor/CornerRectangle.java": """package cn.nubia.gameassist.dessert.policy.performancemonitor;
import android.content.Context;import android.view.View;
public class CornerRectangle extends View {public float rectangleLeft,rectangleWidth;public int geometryUpdates;
 public CornerRectangle(Context c){super(c);}public void setRectanglePara(float l,float w){rectangleLeft=l;rectangleWidth=w;geometryUpdates++;}}
""",
    "cn/nubia/gameassist/utils/WindowManagerUtil.java": """package cn.nubia.gameassist.utils;
import android.view.*;public class WindowManagerUtil {public int updates;public View lastRoot;public ViewGroup.LayoutParams lastParams;
 public void c(View v,ViewGroup.LayoutParams p){updateViewLayout(v,p);}
 public void updateViewLayout(View v,ViewGroup.LayoutParams p){updates++;lastRoot=v;lastParams=p;}}
""",
}

OEM_COMMON = r"""
 public static final int[] CELL_WIDTHS={41,68,35,57,83};
 public static final int CONTENT_LEFT=7,PADDING_LEFT=11,PADDING_RIGHT=13,OUTER_RIGHT=9,BASE_X=500;
 public static final float FULL_ALPHA=.83f,SHORT_ALPHA=.61f;
 public static int originalWidth(){int w=CONTENT_LEFT+PADDING_LEFT+PADDING_RIGHT+OUTER_RIGHT;
  for(int i=0;i<5;i++)w+=CELL_WIDTHS[i]+leftMargin(i)+rightMargin(i);return w;}
 public static int leftMargin(int i){return (i+1)%3;}public static int rightMargin(int i){return i%2;}
 public static int occupied(int i){return CELL_WIDTHS[i]+leftMargin(i)+rightMargin(i);}
 public final Map<String,Integer> nativeCounts=new HashMap<>();public final Map<String,Object[]> lastArgs=new HashMap<>();
 public final List<Integer> initWidths=new ArrayList<>();public int animations,clamps,fades;
 public int savedFullX=Integer.MIN_VALUE,savedShortX=Integer.MIN_VALUE,fadeDelay,nextNativeWidth=Integer.MIN_VALUE;
 public boolean goingToFade;public ViewGroup fullRoot,shortRoot;
 public PerformanceMonitorFloatingWindow(){this(originalWidth());}
 public PerformanceMonitorFloatingWindow(int initialWidth){context(new Context());fullWidth(initialWidth);currentWidth(initialWidth);
  pointX(BASE_X);params(new WindowManager.LayoutParams());params().x=BASE_X;
  manager(new WindowManagerUtil());selectedIndex(-1);initCore();}
 public int count(String name){return nativeCounts.getOrDefault(name,0);}
 private Object nativeCall(String name,Class<?>[] signature,Object[] args,AugmentModule.Original body)throws Throwable {
  Method method=getClass().getDeclaredMethod(name,signature);
  return AugmentModule.dispatch(this,method,args,a->{nativeCounts.merge(name,1,Integer::sum);lastArgs.put(name,a.clone());return body.run(a);});}
 public Object call(String name,Object...args)throws Throwable {
  Class<?>[] signature=new Class<?>[args.length];for(int i=0;i<args.length;i++)signature[i]=
   args[i] instanceof Float?float.class:args[i] instanceof Boolean?boolean.class:args[i] instanceof Integer?int.class:String.class;
  try{return getClass().getDeclaredMethod(name,signature).invoke(this,args);}
  catch(InvocationTargetException e){throw e.getCause();}}
 private void initCore(){initWidths.add(fullWidth());LinearLayout c=new LinearLayout(context());
  c.left=CONTENT_LEFT;c.paddingLeft=PADDING_LEFT;c.paddingRight=PADDING_RIGHT;
  for(int i=0;i<5;i++){View cell=new View(context());ViewGroup.MarginLayoutParams lp=new ViewGroup.MarginLayoutParams(CELL_WIDTHS[i],20);
   lp.leftMargin=leftMargin(i);lp.rightMargin=rightMargin(i);cell.setLayoutParams(lp);c.addView(cell);}
  content(c);background(new CornerRectangle(context()));shortBackground(new CornerRectangle(context()));
  background().setAlpha(FULL_ALPHA);shortBackground().setAlpha(SHORT_ALPHA);
  fullRoot=new ViewGroup(context());fullRoot.addView(background());fullRoot.addView(c);
  shortRoot=new ViewGroup(context());shortRoot.addView(shortBackground());
  fullRoot.layout=()->layout();shortRoot.layout=()->{};root(shortened()?shortRoot:fullRoot);
  c.measure(View.MeasureSpec.makeMeasureSpec(fullWidth(),View.MeasureSpec.EXACTLY),0);layout();}
 public void layout(){content().layoutCells();}
 private void dimensionsCore(){if(nextNativeWidth!=Integer.MIN_VALUE){fullWidth(nextNativeWidth);nextNativeWidth=Integer.MIN_VALUE;}
  currentWidth(fullWidth());}
 private void showCore(boolean value){shortened(value);root(value?shortRoot:fullRoot);
  params().width=value?shortWidth():fullWidth();currentWidth(params().width);if(!value)layout();}
 private int stockHit(float x){int cell=currentWidth()/5;if(x<cell)return 0;if(x<2*cell)return 1;
  if(x<3*cell)return 2;if(x<4*cell)return 3;return 4;}
 private void stockClick(float x){animations++;if(shortened()){
  params().x-=content().getChildAt(selectedIndex()).getLeft();shortened(false);selectedIndex(-1);
  params().width=fullWidth();showCore(false);
 }else{int index=stockHit(x);selectedIndex(index);shortened(true);shortWidth(content().getChildAt(index).getWidth());
  params().x+=content().getChildAt(index).getLeft();params().width=shortWidth();showCore(true);}}
 public void fireFade(String alphaMethod)throws Throwable {if(added()&&root()!=null)call(alphaMethod,goingToFade?.5f:1f);}
"""

HARNESS = r"""package ls.augment.com.hook;
import android.view.*;import android.widget.LinearLayout;import java.util.*;
import ls.augment.com.GamePerformanceMonitorConfig;
import cn.nubia.gameassist.dessert.policy.performancemonitor.PerformanceMonitorFloatingWindow;
public class TestMonitorRuntime {
 static final String VARIANT="@@VARIANT@@",ROUTE="@@ROUTE@@";
 static final String INIT="@@init@@",DIM="@@dimensions@@",PARAMS="@@params@@",SHOW="@@show@@",ADD="@@add@@";
 static final String ALPHA="@@alpha@@",HIT="@@hit@@",CLICK="@@click@@";static int checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(VARIANT+": "+message);}
 static void eq(int expected,int actual,String message){check(expected==actual,message+" expected="+expected+" actual="+actual);}
 static void close(float expected,float actual,String message){check(Math.abs(expected-actual)<.00001f,message+" expected="+expected+" actual="+actual);}
 static String selection(int mask){List<String> out=new ArrayList<>();String[] items=GamePerformanceMonitorConfig.items();
  for(int i=0;i<5;i++)if((mask&(1<<i))!=0)out.add(items[i]);return String.join(",",out);}
 static int expectedWidth(int mask){int width=PerformanceMonitorFloatingWindow.originalWidth();
  for(int i=0;i<5;i++)if((mask&(1<<i))==0)width-=PerformanceMonitorFloatingWindow.occupied(i);return width;}
  static int expectedWidth(int mask,int nativeWidth){return nativeWidth-PerformanceMonitorFloatingWindow.originalWidth()+expectedWidth(mask);}
 static AugmentModule install(){FeatureSettings.reset();AugmentModule module=new AugmentModule();
  GamePerformanceMonitorHook.install(module,TestMonitorRuntime.class.getClassLoader());eq(8,module.hooks.size(),"eight hooks");
  check(module.errors.isEmpty(),"install errors");check(module.info.size()==1&&module.info.get(0).contains("route="+ROUTE+";"),"resolved route diagnostic");
  Set<String> expected=new HashSet<>(Arrays.asList(INIT,DIM,PARAMS,SHOW,ADD,ALPHA,HIT,CLICK));
  Set<String> actual=new HashSet<>();for(java.lang.reflect.Method m:module.hooks.keySet())actual.add(m.getName());
  check(expected.equals(actual),"registered route members "+actual);return module;}
 static PerformanceMonitorFloatingWindow fixture(int mask,boolean on)throws Throwable {
  install();FeatureSettings.on=on;FeatureSettings.selection=selection(mask);
  PerformanceMonitorFloatingWindow owner=new PerformanceMonitorFloatingWindow();owner.call(INIT);
  owner.call(PARAMS);owner.call(ADD,new String("game.package"));owner.layout();return owner;}
 static void healthy(){check(FeatureSettings.errors.isEmpty(),"no swallowed hook errors "+FeatureSettings.errors);}
 static void shape(PerformanceMonitorFloatingWindow o,int mask,boolean on){
  int width=on?expectedWidth(mask):PerformanceMonitorFloatingWindow.originalWidth();
  eq(width,o.fullWidth(),"full width");eq(o.shortened()?o.shortWidth():width,o.currentWidth(),"current width");
  eq(o.currentWidth(),o.params().width,"layout params width");close(width,o.background().rectangleWidth,"background width");
  for(int i=0;i<5;i++){eq(on&&(mask&(1<<i))==0?View.GONE:View.VISIBLE,o.content().getChildAt(i).getVisibility(),"visibility "+i);
   close(1,o.content().getChildAt(i).getAlpha(),"readable text "+i);}
 }
 static float center(PerformanceMonitorFloatingWindow o,int index){View v=o.content().getChildAt(index);
  return o.content().getLeft()+v.getLeft()+v.getWidth()/2f;}
 static void disabledPassthrough()throws Throwable {
  PerformanceMonitorFloatingWindow o=fixture(31,false);
  for(String name:new String[]{INIT,DIM,PARAMS}){int before=o.count(name);Object result=o.call(name);eq(before+1,o.count(name),"disabled native "+name);
   if(name.equals(PARAMS))check(result==o.params(),"native params object preserved");}
  for(boolean value:new boolean[]{false,true}){int before=o.count(SHOW);o.call(SHOW,value);
   eq(before+1,o.count(SHOW),"disabled native show");check(o.lastArgs.get(SHOW)[0].equals(value),"boolean argument preserved");}
  o.call(SHOW,false);
  String packageName=new String("unmodified.game");int adds=o.count(ADD);o.call(ADD,packageName);
  eq(adds+1,o.count(ADD),"disabled native add");check(o.lastArgs.get(ADD)[0]==packageName,"String identity preserved");
  for(int i=0;i<5;i++)o.content().getChildAt(i).setAlpha(.37f);
  int alphas=o.count(ALPHA);o.call(ALPHA,.29f);eq(alphas+1,o.count(ALPHA),"disabled native alpha");
  close(.29f,(Float)o.lastArgs.get(ALPHA)[0],"float alpha argument preserved");
  close(.29f,o.background().getAlpha(),"native alpha preserved");
  for(int i=0;i<5;i++)close(.37f,o.content().getChildAt(i).getAlpha(),"native background alpha leaves text");
  int hits=o.count(HIT);eq(0,(Integer)o.call(HIT,1.25f),"native hit result preserved");
  eq(hits+1,o.count(HIT),"disabled native hit");close(1.25f,(Float)o.lastArgs.get(HIT)[0],"hit argument preserved");
  int clicks=o.count(CLICK);o.call(CLICK,3.75f);eq(clicks+1,o.count(CLICK),"disabled native click");
  close(3.75f,(Float)o.lastArgs.get(CLICK)[0],"click argument preserved");eq(1,o.animations,"native animation path when disabled");healthy();
 }
 static void allSelectionsAndLiveUpdates()throws Throwable {
  PerformanceMonitorFloatingWindow o=fixture(31,true);eq(1,FeatureSettings.listeners.size(),"one snapshot listener");
  LinearLayout original=o.content();int lastUpdates=o.manager().updates;
  for(int mask=1;mask<32;mask++){
   FeatureSettings.selection=selection(mask);FeatureSettings.fire();o.layout();shape(o,mask,true);
   check(o.content()==original,"live update reuses native content");
   if(mask!=31||lastUpdates!=0)check(o.manager().updates>=lastUpdates,"monotonic window updates");lastUpdates=o.manager().updates;
   int before=o.count(HIT),first=-1,last=-1;
   for(int i=0;i<5;i++)if((mask&(1<<i))!=0){if(first<0)first=i;last=i;
    eq(i,(Integer)o.call(HIT,center(o,i)),"unequal-width hit preserves original index "+i+" mask="+mask);}
   eq(first,(Integer)o.call(HIT,-100f),"leftmost selected hit");eq(last,(Integer)o.call(HIT,10000f),"rightmost selected hit");
   eq(before,o.count(HIT),"custom hit bypasses stock equal-width algorithm");
   o.call(DIM);o.call(PARAMS);o.call(SHOW,false);o.call(ADD,"same.game");o.layout();shape(o,mask,true);
  }
  check(o.manager().updates>=30,"live selections updated native window");check(o.clamps>=30,"live selections retain OEM boundary check");
  check(o.manager().lastRoot==o.root()&&o.manager().lastParams==o.params(),"window update receives native objects");
  check(o.root().requests>=30,"live layout requested");healthy();
 }
 static void alphaAndFade()throws Throwable {
  PerformanceMonitorFloatingWindow o=fixture(21,true);for(int i=0;i<5;i++)o.content().getChildAt(i).setAlpha(.71f);
  for(int percent:new int[]{0,50,100}){
   FeatureSettings.transparency=percent;FeatureSettings.fire();float opacity=1-percent/100f;
   o.call(ALPHA,.09f);close(opacity,(Float)o.lastArgs.get(ALPHA)[0],"customized original alpha argument");
   close(opacity,o.background().getAlpha(),"full background opacity");close(opacity,o.shortBackground().getAlpha(),"short background opacity");
   o.call("@@fade@@",true);eq(5000,o.fadeDelay,"OEM five-second fade retained");o.fireFade(ALPHA);
   close(opacity,o.background().getAlpha(),"OEM fade does not overwrite selected opacity");
   o.call("@@fade@@",false);eq(0,o.fadeDelay,"OEM immediate unfade retained");o.fireFade(ALPHA);
   close(opacity,o.shortBackground().getAlpha(),"OEM unfade does not overwrite opacity");
   for(int i=0;i<5;i++)close(.71f,o.content().getChildAt(i).getAlpha(),"alpha route does not change text "+i);
  }healthy();
 }
 static void collapseExpandAndRemoval()throws Throwable {
  PerformanceMonitorFloatingWindow o=fixture(21,true);int beforeX=o.params().x,index=2;
  int offset=o.content().getLeft()+o.content().getChildAt(index).getLeft();int nativeClicks=o.count(CLICK);
  o.call(CLICK,center(o,index));check(o.shortened(),"custom click collapses");eq(index,o.selectedIndex(),"native original selected index");
  eq(beforeX+offset,o.params().x,"collapse includes content offset");eq(o.params().x,o.pointX(),"collapse point X");
  eq(o.params().x,o.savedShortX,"short coordinate key");eq(PerformanceMonitorFloatingWindow.CELL_WIDTHS[index],o.shortWidth(),"actual cell collapse width");
  eq(o.shortWidth(),o.params().width,"short native window width");check(o.root()==o.shortRoot,"OEM owns shortened root");
  eq(5000,o.fadeDelay,"click schedules fade");eq(nativeClicks,o.count(CLICK),"custom click bypasses stock");eq(0,o.animations,"custom transition avoids stock animation");
  o.call(CLICK,0f);check(!o.shortened(),"second click expands");eq(-1,o.selectedIndex(),"expanded index cleared");
  eq(beforeX,o.params().x,"expand restores full anchor");eq(beforeX,o.pointX(),"expand point X");eq(beforeX,o.savedFullX,"full coordinate key");
  check(o.root()==o.fullRoot,"OEM owns full root");shape(o,21,true);
  o.call(CLICK,center(o,index));int updates=o.manager().updates;
  FeatureSettings.selection=selection(17);FeatureSettings.fire();o.layout();
  check(!o.shortened(),"removing current folded item expands");eq(-1,o.selectedIndex(),"removed selected index cleared");
  eq(beforeX,o.params().x,"removed folded item restores old anchor before relayout");eq(beforeX,o.savedFullX,"removed folded item stores full anchor");
  check(o.root()==o.fullRoot,"removed folded item uses OEM full root");check(o.manager().updates>updates,"removed folded item updates live window");shape(o,17,true);healthy();
 }
 static void singleItem()throws Throwable {
  for(int index=0;index<5;index++){
   PerformanceMonitorFloatingWindow o=fixture(1<<index,true);int x=o.params().x,shows=o.count(SHOW),fades=o.fades;
   o.call(CLICK,center(o,index));check(!o.shortened(),"single item remains full");eq(-1,o.selectedIndex(),"single index unchanged");
   eq(x,o.params().x,"single anchor unchanged");eq(0,o.count(CLICK),"single bypasses native click");eq(0,o.animations,"single bypasses division animation");
   eq(shows,o.count(SHOW),"single does not replace native window");eq(fades,o.fades,"single has no collapse fade side effect");shape(o,1<<index,true);healthy();
  }
 }
 static void disableRestores(boolean folded)throws Throwable {
  PerformanceMonitorFloatingWindow o=fixture(21,true);int x=o.params().x;
  if(folded)o.call(CLICK,center(o,2));int updates=o.manager().updates;
  FeatureSettings.on=false;FeatureSettings.fire();o.layout();
  check(!o.shortened(),"disable restores full mode folded="+folded);eq(-1,o.selectedIndex(),"disable clears selected index");
  eq(x,o.params().x,"disable restores full anchor");shape(o,31,false);
  close(PerformanceMonitorFloatingWindow.FULL_ALPHA,o.background().getAlpha(),"disable restores native full alpha");
  close(PerformanceMonitorFloatingWindow.SHORT_ALPHA,o.shortBackground().getAlpha(),"disable restores native short alpha");
  check(o.manager().updates>updates,"disable updates native window");if(folded){
   eq(x,o.savedFullX,"disable stores coordinate under full key");check(o.root()==o.fullRoot,"disable reopens OEM full root");}
  int alphas=o.count(ALPHA);o.call(ALPHA,.42f);eq(alphas+1,o.count(ALPHA),"disabled alpha proceeds");
  close(.42f,o.background().getAlpha(),"disabled alpha no longer overridden");healthy();
 }
 static void originalVisibilityAndInitRebuild()throws Throwable {
  install();FeatureSettings.on=true;FeatureSettings.selection=selection(17);
  PerformanceMonitorFloatingWindow o=new PerformanceMonitorFloatingWindow();o.content().getChildAt(1).setVisibility(View.INVISIBLE);
  o.call(PARAMS);FeatureSettings.on=false;FeatureSettings.fire();
  eq(View.INVISIBLE,o.content().getChildAt(1).getVisibility(),"original invisible visibility restored");
  o=fixture(17,true);LinearLayout previous=o.content();
  for(int pass=0;pass<3;pass++){
   o.call(INIT);check(previous!=o.content(),"init replaces OEM content");previous=o.content();o.layout();shape(o,17,true);
   eq(PerformanceMonitorFloatingWindow.originalWidth(),o.initWidths.get(o.initWidths.size()-1),"init sees original full width before native rebuild");
   eq(1,FeatureSettings.listeners.size(),"init does not duplicate snapshot listener");
  }
  FeatureSettings.on=false;FeatureSettings.fire();o.layout();shape(o,31,false);
  close(PerformanceMonitorFloatingWindow.FULL_ALPHA,o.background().getAlpha(),"new background restores fresh native alpha");healthy();
 }
  static void delayedNativeSizing()throws Throwable {
   for(int initial:new int[]{0,-1,-2})for(int mask:new int[]{31,1,21}){
    install();FeatureSettings.on=true;FeatureSettings.selection=selection(mask);
    PerformanceMonitorFloatingWindow o=new PerformanceMonitorFloatingWindow(initial);o.call(INIT);o.call(PARAMS);
    eq(initial,o.fullWidth(),"unknown native width is preserved before sizing");
    eq(initial,o.params().width,"pending geometry does not fabricate a one-pixel window");
    for(int i=0;i<5;i++)eq(View.VISIBLE,o.content().getChildAt(i).getVisibility(),"pending geometry preserves native item "+i);
    check(FeatureSettings.diagnostics.stream().anyMatch(s->s.contains("phase=pending_native_size")),"pending sizing is explicitly diagnosed");
    o.nextNativeWidth=PerformanceMonitorFloatingWindow.originalWidth();o.call(DIM);o.call(ADD,"delayed.game");o.layout();shape(o,mask,true);
    FeatureSettings.on=false;FeatureSettings.fire();o.layout();shape(o,31,false);healthy();
   }
  }
  static void nativeWidthUpdates()throws Throwable {
   PerformanceMonitorFloatingWindow o=fixture(21,true);int lastNativeWidth=expectedWidth(21,608);
   // A direct native write and a write inside initSize must both become the latest baseline.
   for(int nativeWidth:new int[]{512,608,lastNativeWidth}){
    if(nativeWidth==512){o.fullWidth(nativeWidth);o.call(DIM);}
    else{o.nextNativeWidth=nativeWidth;o.call(DIM);}
    eq(expectedWidth(21,nativeWidth),o.fullWidth(),"latest native size custom width");
    for(int mask=1;mask<32;mask++){
     FeatureSettings.selection=selection(mask);FeatureSettings.fire();o.layout();
     eq(expectedWidth(mask,nativeWidth),o.fullWidth(),"custom width cannot feed back into native cache mask="+mask);
    }
    FeatureSettings.selection=selection(21);FeatureSettings.fire();
    FeatureSettings.on=false;FeatureSettings.fire();eq(nativeWidth,o.fullWidth(),"disable restores latest native width");
    for(int i=0;i<5;i++)eq(View.VISIBLE,o.content().getChildAt(i).getVisibility(),"latest size disable restores item "+i);
    FeatureSettings.on=true;FeatureSettings.fire();eq(expectedWidth(21,nativeWidth),o.fullWidth(),"re-enable retains latest native width");
   }
   o.call(INIT);eq(lastNativeWidth,o.initWidths.get(o.initWidths.size()-1),"reinit sees latest native width");
   eq(expectedWidth(21,lastNativeWidth),o.fullWidth(),"reinit retains native size baseline");
   o.fullWidth(700);o.call(INIT);eq(700,o.initWidths.get(o.initWidths.size()-1),"external native width is preserved before reinit");
   eq(expectedWidth(21,700),o.fullWidth(),"reinit adopts external native width");
   FeatureSettings.on=false;FeatureSettings.fire();eq(700,o.fullWidth(),"reinit native width remains restorable");healthy();
  }
  static void tooSmallNativeSizing()throws Throwable {
   for(int initial:new int[]{1,17,200})for(int mask:new int[]{31,1,21}){
    install();FeatureSettings.on=true;FeatureSettings.selection=selection(mask);
    PerformanceMonitorFloatingWindow o=new PerformanceMonitorFloatingWindow(initial);o.call(INIT);o.call(PARAMS);
    eq(initial,o.fullWidth(),"undersized native width is preserved pending real geometry");
    for(int i=0;i<5;i++)eq(View.VISIBLE,o.content().getChildAt(i).getVisibility(),"undersized geometry keeps all native cells");
    String diagnostic=FeatureSettings.diagnostics.get(FeatureSettings.diagnostics.size()-1);
    check(diagnostic.contains("applied=false")&&diagnostic.contains("phase=native_width_too_small"),"actual cell capacity rejects a too-small native width");
    check(diagnostic.contains("nativeFullWidth="+initial)&&diagnostic.contains("originalWidth=0")
      &&diagnostic.contains("appliedWidth=0")&&diagnostic.contains("shortened=false")&&diagnostic.contains("shortWidth=0"),"sizing sources remain explicit");
    o.nextNativeWidth=PerformanceMonitorFloatingWindow.originalWidth();o.call(DIM);o.call(ADD,"recovered.game");o.layout();shape(o,mask,true);
    FeatureSettings.on=false;FeatureSettings.fire();shape(o,31,false);healthy();
   }
  }
  static void shortWidthReadiness()throws Throwable {
   PerformanceMonitorFloatingWindow o=fixture(21,true);int index=2;
   View item=o.content().getChildAt(index);item.right=item.left;
   o.call(CLICK,(float)(item.getLeft()+o.content().getLeft()));
   check(o.shortened(),"pre-layout click uses the measured native cell");
   eq(PerformanceMonitorFloatingWindow.CELL_WIDTHS[index],o.shortWidth(),"zero laid-out width uses native measurement");
   o.shortWidth(0);o.currentWidth(0);o.params().width=0;FeatureSettings.fire();
   eq(PerformanceMonitorFloatingWindow.CELL_WIDTHS[index],o.shortWidth(),"zero short width repairs from the selected native cell");
   eq(o.shortWidth(),o.params().width,"short repair updates native params");
   o.shortWidth(1);FeatureSettings.fire();eq(PerformanceMonitorFloatingWindow.CELL_WIDTHS[index],o.shortWidth(),"one-pixel short width cannot contain the native cell");
   o.shortWidth(91);FeatureSettings.fire();eq(91,o.shortWidth(),"positive OEM short width is preserved");
   eq(91,o.currentWidth(),"positive OEM short width remains active");
   FeatureSettings.on=false;FeatureSettings.fire();check(!o.shortened(),"disable opens full window after short repair");
   eq(PerformanceMonitorFloatingWindow.originalWidth(),o.fullWidth(),"short repair disable restores native full width");healthy();
  }
  static void delayedCellSizing()throws Throwable {
   install();FeatureSettings.on=true;FeatureSettings.selection=selection(21);
   PerformanceMonitorFloatingWindow o=new PerformanceMonitorFloatingWindow();
   for(int i=0;i<5;i++){View item=o.content().getChildAt(i);item.getLayoutParams().width=0;item.measuredWidth=0;item.right=item.left;}
   o.call(PARAMS);eq(PerformanceMonitorFloatingWindow.originalWidth(),o.fullWidth(),"missing cell measurements retain native full width");
   for(int i=0;i<5;i++)eq(View.VISIBLE,o.content().getChildAt(i).getVisibility(),"missing cell measurements keep native visibility");
   check(FeatureSettings.diagnostics.get(FeatureSettings.diagnostics.size()-1).contains("phase=pending_cell_sizes"),"pending cell measurements diagnosed");
   for(int i=0;i<5;i++)o.content().getChildAt(i).getLayoutParams().width=PerformanceMonitorFloatingWindow.CELL_WIDTHS[i];
   o.call(DIM);o.call(ADD,"measured.game");o.layout();shape(o,21,true);
   FeatureSettings.on=false;FeatureSettings.fire();o.layout();shape(o,31,false);healthy();
  }
  static void disabledNativeSizeUpdate()throws Throwable {
   PerformanceMonitorFloatingWindow o=fixture(31,false);o.nextNativeWidth=450;o.call(DIM);
   eq(450,o.fullWidth(),"disabled native width update proceeds");
   FeatureSettings.selection=selection(21);FeatureSettings.on=true;FeatureSettings.fire();
   eq(expectedWidth(21,450),o.fullWidth(),"enable uses the latest disabled native size");
   FeatureSettings.on=false;FeatureSettings.fire();eq(450,o.fullWidth(),"disabled update remains restorable");healthy();
  }
 static void sensorSelections()throws Throwable {
   PerformanceMonitorFloatingWindow o=fixture(31,true);
   FeatureSettings.selection="battery_temperature,cpu_temperature,gpu_temperature,power";FeatureSettings.fire();o.layout();
   eq(9,o.content().getChildCount(),"four additional cells");
   for(int i=0;i<5;i++)eq(View.GONE,o.content().getChildAt(i).getVisibility(),"native item hidden when unselected");
   for(int i=5;i<9;i++)eq(View.VISIBLE,o.content().getChildAt(i).getVisibility(),"selected sensor visible");
   eq(expectedWidth(0)+4*76,o.fullWidth(),"sensor widths included");
   o.call(CLICK,1000f);check(!o.shortened(),"sensor has no nonexistent OEM compact root");
   FeatureSettings.on=false;FeatureSettings.fire();o.layout();
   for(int i=5;i<9;i++)eq(View.GONE,o.content().getChildAt(i).getVisibility(),"extra cells hidden on disable");
   FeatureSettings.on=true;FeatureSettings.selection=String.join(",",GamePerformanceMonitorConfig.items());
   android.util.DisplayMetrics.width=320;FeatureSettings.fire();o.layout();eq(320,o.fullWidth(),"all nine items fit current display width");
   FeatureSettings.on=false;FeatureSettings.fire();eq(PerformanceMonitorFloatingWindow.originalWidth(),o.fullWidth(),"disabling restores native geometry");
   for(int i=0;i<5;i++)eq(PerformanceMonitorFloatingWindow.CELL_WIDTHS[i],o.content().getChildAt(i).getLayoutParams().width,"native cell width restored");
   android.util.DisplayMetrics.width=10000;healthy();
 }
 public static void main(String[] args)throws Throwable {
  sensorSelections();disabledPassthrough();allSelectionsAndLiveUpdates();alphaAndFade();collapseExpandAndRemoval();singleItem();
   disableRestores(false);disableRestores(true);originalVisibilityAndInitRebuild();
   delayedNativeSizing();delayedCellSizing();tooSmallNativeSizing();nativeWidthUpdates();shortWidthReadiness();disabledNativeSizeUpdate();
  System.out.println("PASS "+VARIANT+" route="+ROUTE+" checks="+checks);
 }
}
"""


def oem_source(variant):
    positive = variant in ("16", "17", "both", "fallback16")
    active = 16 if variant in ("16", "fallback16") else 17
    routes = (16, 17) if variant in ("both", "fallback16", "mixed") else (active,)
    if variant == "incomplete16":
        routes = (16,)
    declarations = []
    names = {}
    for i, (key, kind, modern, legacy) in enumerate(FIELDS):
        names[key] = legacy if active == 16 else modern
        for route in routes:
            name = legacy if route == 16 else modern
            if variant == "incomplete16" and key == "pointX":
                continue
            if variant == "mixed" and route != (16 if i % 2 else 17):
                continue
            declarations.append(f" public {kind} {name};")
    wrappers = []
    used = set()
    method_names = {}
    for i, (key, result, modern, legacy, parameters, signature, body) in enumerate(METHODS):
        method_names[key] = legacy if active == 16 else modern
        for route in routes:
            name = legacy if route == 16 else modern
            if name in used:
                continue
            if variant in ("incomplete17", "fallback16") and route == 17 and key == "fade":
                continue
            if variant == "mixed" and modern != legacy and route != (16 if i % 2 else 17):
                continue
            used.add(name)
            if not positive:
                fallback = "" if result == "void" else "return 0;" if result == "int" else "return null;"
                wrappers.append(f" public {result} {name}({parameters}){{{fallback}}}")
                continue
            expression = f'nativeCall("{name}",new Class<?>[]{{{signature}}},new Object[]{{{"value" if parameters else ""}}},a->{{{body}}})'
            statement = expression + ";" if result == "void" else f"return ({'Integer' if result == 'int' else result})" + expression + ";"
            wrappers.append(f" public {result} {name}({parameters})throws Throwable{{{statement}}}")
    helpers = []
    if positive:
        for key, kind, _, _ in FIELDS:
            helpers.append(f" public {kind} {key}(){{return {names[key]};}}")
            helpers.append(f" public void {key}({kind} value){{{names[key]}=value;}}")
    return """package cn.nubia.gameassist.dessert.policy.performancemonitor;
import android.content.Context;import android.view.*;import android.widget.LinearLayout;
import java.util.*;import java.lang.reflect.*;import ls.augment.com.hook.AugmentModule;
import cn.nubia.gameassist.utils.WindowManagerUtil;
public class PerformanceMonitorFloatingWindow {
""" + "\n".join(declarations + helpers + wrappers) + (OEM_COMMON if positive else "") + "\n}\n", method_names, positive, active


def harness_source(variant, names, positive, active):
    if not positive:
        return """package ls.augment.com.hook;
public class TestMonitorRuntime {public static void main(String[] args){
 FeatureSettings.reset();AugmentModule module=new AugmentModule();
 GamePerformanceMonitorHook.install(module,TestMonitorRuntime.class.getClassLoader());
 if(!module.hooks.isEmpty())throw new AssertionError("partial or mixed contract registered hooks");
 if(module.errors.size()!=1||!module.info.isEmpty())throw new AssertionError("missing failure diagnostic");
 if(!FeatureSettings.listeners.isEmpty())throw new AssertionError("invalid contract created runtime listener");
 System.out.println("PASS @@VARIANT@@ rejected with zero hooks");}}
""".replace("@@VARIANT@@", variant)
    result = HARNESS.replace("@@VARIANT@@", variant).replace("@@ROUTE@@", f"GameAssist{active}")
    for key, name in names.items():
        result = result.replace(f"@@{key}@@", name)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", help="JDK bin directory (or JDK installation directory)")
    parser.add_argument("--hook-source", type=Path, help="Alternative Hook source for a temporary regression control")
    parser.add_argument("--variant", nargs="+", choices=("16", "17", "both", "fallback16", "incomplete16", "incomplete17", "mixed"),
                        help="Run selected variants; defaults to the complete contract/lifecycle suite")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    configured = args.jdk or os.environ.get("JAVA_HOME")
    javac = shutil.which("javac")
    if configured:
        jdk = Path(configured)
        if (jdk / "bin").is_dir():
            jdk = jdk / "bin"
    elif javac:
        jdk = Path(javac).resolve().parent
    else:
        parser.error("Set JAVA_HOME, put javac on PATH, or pass --jdk <JDK directory>")
    suffix = ".exe" if (jdk / "javac.exe").exists() else ""
    game_options = (root / "android/app/src/main/java/ls/augment/com/GameOptions.java").read_text(encoding="utf-8")
    constants = []
    for name in ("PERFORMANCE_MONITOR", "MONITOR_ITEMS", "MONITOR_TRANSPARENCY"):
        match = re.search(rf'public static final String {name}\s*=\s*"([^"\n]+)";', game_options)
        if match is None:
            raise RuntimeError(f"Cannot find real GameOptions key: {name}")
        constants.append(f'public static final String {name}="{match.group(1)}";')
    with tempfile.TemporaryDirectory(prefix="ls-monitor-runtime-") as temp:
        for variant in args.variant or ("16", "17", "both", "fallback16", "incomplete16", "incomplete17", "mixed"):
            target = Path(temp) / variant
            source, names, positive, active = oem_source(variant)
            generated = dict(STUBS)
            generated["ls/augment/com/GameOptions.java"] = "package ls.augment.com;public class GameOptions {" + "".join(constants) + "}"
            generated["cn/nubia/gameassist/dessert/policy/performancemonitor/PerformanceMonitorFloatingWindow.java"] = source
            generated["ls/augment/com/hook/TestMonitorRuntime.java"] = harness_source(variant, names, positive, active)
            sources = []
            for relative, content in generated.items():
                path = target / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content, encoding="utf-8")
                sources.append(str(path))
            sources.append(str(args.hook_source.resolve() if args.hook_source else root / "android/app/src/main/java/ls/augment/com/hook/GamePerformanceMonitorHook.java"))
            sources.append(str(root / "android/app/src/main/java/ls/augment/com/GamePerformanceMonitorConfig.java"))
            subprocess.run([str(jdk / ("javac" + suffix)), "-encoding", "UTF-8", "-d", str(target / "classes"), *sources], check=True)
            subprocess.run([str(jdk / ("java" + suffix)), "-cp", str(target / "classes"), "ls.augment.com.hook.TestMonitorRuntime"], check=True)
    print("Production monitor runtime contract/lifecycle tests passed; device rendering remains separate.")


if __name__ == "__main__":
    main()
