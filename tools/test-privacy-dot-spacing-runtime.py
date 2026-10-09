"""Execute the actual controller adapter and policy on independent Android facades.
No device access; does not prove ROM rendering or real screen cutout coordinates.
"""
from pathlib import Path
import ast
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
tree = ast.parse((ROOT / 'tools/test-notification-media-card-runtime.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
            and any(isinstance(t, ast.Name) and t.id == 'FILES' for t in n.targets))
files = {k: base[k] for k in ['io/github/libxposed/api/XposedInterface.java', 'ls/augment/com/hook/AugmentModule.java']}
files.update({
'android/util/Log.java': 'package android.util;public class Log{public static String getStackTraceString(Throwable t){return t.toString();}}',
'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics{public float density=1;}',
'android/content/Context.java': 'package android.content;public class Context{public String getPackageName(){return "com.android.systemui";}}',
'android/content/res/Configuration.java': 'package android.content.res;public class Configuration{public float fontScale=1;public int direction;public int getLayoutDirection(){return direction;}}',
'android/content/res/Resources.java': 'package android.content.res;public class Resources{public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public final Configuration config=new Configuration();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}public Configuration getConfiguration(){return config;}public int getIdentifier(String n,String t,String p){return n.hashCode();}}',
'android/os/SystemClock.java': 'package android.os;public class SystemClock{public static long now=10000;public static long elapsedRealtime(){return now;}}',
'android/graphics/Point.java': 'package android.graphics;public class Point{public int x,y;public Point(){}public Point(int x,int y){this.x=x;this.y=y;}public String toString(){return x+","+y;}}',
'android/graphics/Rect.java': 'package android.graphics;public class Rect{public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public String toString(){return left+","+top+","+right+","+bottom;}}',
'android/graphics/Insets.java': 'package android.graphics;public class Insets{public static final Insets NONE=new Insets();public int left,top,right,bottom;}',
'android/view/Display.java': 'package android.view;public class Display{public int rotation;public int getRotation(){return rotation;}public int getDisplayId(){return 0;}public void getRealSize(android.graphics.Point p){p.x=400;p.y=800;}}',
'android/view/DisplayCutout.java': 'package android.view;public class DisplayCutout{public final java.util.List<android.graphics.Rect> cuts=new java.util.ArrayList<>();public android.graphics.Insets waterfall=android.graphics.Insets.NONE;public java.util.List<android.graphics.Rect> getBoundingRects(){return cuts;}public android.graphics.Insets getWaterfallInsets(){return waterfall;}public String toString(){return cuts.toString();}}',
'android/view/RoundedCorner.java': 'package android.view;public class RoundedCorner{public final android.graphics.Point centre;public final int radius;public RoundedCorner(int x,int y,int r){centre=new android.graphics.Point(x,y);radius=r;}public android.graphics.Point getCenter(){return centre;}public int getRadius(){return radius;}public String toString(){return centre+":"+radius;}}',
'android/view/WindowInsets.java': 'package android.view;public class WindowInsets{public DisplayCutout cutout;public RoundedCorner[] rounds=new RoundedCorner[4];public DisplayCutout getDisplayCutout(){return cutout;}public RoundedCorner getRoundedCorner(int p){return rounds[p];}public String toString(){return cutout+java.util.Arrays.toString(rounds);}}',
'android/view/Gravity.java': '''package android.view;public class Gravity{public static final int TOP=48,BOTTOM=80,LEFT=3,RIGHT=5,CENTER_HORIZONTAL=1,CENTER_VERTICAL=16,START=0x800003,HORIZONTAL_GRAVITY_MASK=7,VERTICAL_GRAVITY_MASK=112;public static int getAbsoluteGravity(int g,int dir){if((g&0x800000)!=0){int h=g&7;g=(g&~0x800007)|(h==3?(dir==1?5:3):(dir==1?3:5));}return g;}}''',
'android/view/ViewTreeObserver.java': '''package android.view;public class ViewTreeObserver{public interface OnPreDrawListener{boolean onPreDraw();}public final java.util.List<OnPreDrawListener> list=new java.util.ArrayList<>();public boolean isAlive(){return true;}public void addOnPreDrawListener(OnPreDrawListener l){list.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){list.remove(l);}public boolean draw(){boolean ok=true;for(OnPreDrawListener l:new java.util.ArrayList<>(list))ok&=l.onPreDraw();return ok;}}''',
'android/view/View.java': '''package android.view;public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8,LAYOUT_DIRECTION_LTR=0,LAYOUT_DIRECTION_RTL=1;
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
 public int id,visibility=VISIBLE,width=4,height=4,left,top,padLeft,padRight,padTop,padBottom,direction,requests;public boolean attached=true,layoutRequested;public float x,y,scaleX=1,scaleY=1,rotation,alpha=1;
 public Object drawable=new Object();public int color=0xff00aa00;public ViewGroup parent;public ViewGroup.LayoutParams params=new android.widget.FrameLayout.LayoutParams(-2,-2);
 public final android.content.Context context=new android.content.Context();public final android.content.res.Resources resources=new android.content.res.Resources();
 public Display display=new Display();public WindowInsets insets=new WindowInsets();public final ViewTreeObserver tree=new ViewTreeObserver();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}public Object getParent(){return parent;}public ViewGroup.LayoutParams getLayoutParams(){return params;}
 public boolean isAttachedToWindow(){return attached;}public int getVisibility(){return visibility;}public int getLayoutDirection(){return direction;}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
 public void detach(){attached=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}
 public ViewTreeObserver getViewTreeObserver(){return getRootView().tree;}public View getRootView(){return parent==null?this:parent.getRootView();}
 public View findViewById(int key){return key==id?this:null;}public void requestLayout(){requests++;layoutRequested=true;}
 public boolean isLayoutRequested(){return layoutRequested;}public int getWidth(){return width;}public int getHeight(){return height;}
 public int getPaddingLeft(){return padLeft;}public int getPaddingRight(){return padRight;}public int getPaddingTop(){return padTop;}public int getPaddingBottom(){return padBottom;}
 public float getTranslationX(){return x;}public float getTranslationY(){return y;}public float getScaleX(){return scaleX;}public float getScaleY(){return scaleY;}public float getRotation(){return rotation;}
 public Display getDisplay(){return getRootView().display;}public WindowInsets getRootWindowInsets(){return getRootView().insets;}
 public boolean getLocalVisibleRect(android.graphics.Rect r){r.left=0;r.top=0;r.right=width;r.bottom=height;return attached&&visibility==VISIBLE;}
 public void getLocationOnScreen(int[] p){p[0]=left+(int)x;p[1]=top+(int)y;if(parent!=null){int[] q=new int[2];parent.getLocationOnScreen(q);p[0]+=q[0];p[1]+=q[1];}}
}''',
'android/view/ViewGroup.java': '''package android.view;public class ViewGroup extends View{
 public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
 public static class MarginLayoutParams extends LayoutParams{public int leftMargin,topMargin,rightMargin,bottomMargin,start=Integer.MIN_VALUE,end=Integer.MIN_VALUE;public MarginLayoutParams(int w,int h){super(w,h);}public boolean isMarginRelative(){return start!=Integer.MIN_VALUE||end!=Integer.MIN_VALUE;}public int getMarginStart(){return start==Integer.MIN_VALUE?leftMargin:start;}public int getMarginEnd(){return end==Integer.MIN_VALUE?rightMargin:end;}public void setMarginStart(int v){start=v;}public void setMarginEnd(int v){end=v;}public void resolveLayoutDirection(int dir){if(start!=Integer.MIN_VALUE){if(dir==1)rightMargin=start;else leftMargin=start;}if(end!=Integer.MIN_VALUE){if(dir==1)leftMargin=end;else rightMargin=end;}}}
 public final java.util.List<View> children=new java.util.ArrayList<>();public void add(View v){children.add(v);v.parent=this;}@Override public View findViewById(int id){View own=super.findViewById(id);if(own!=null)return own;for(View v:children){View found=v.findViewById(id);if(found!=null)return found;}return null;}
}''',
'android/widget/FrameLayout.java': 'package android.widget;public class FrameLayout extends android.view.ViewGroup{public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams{public int gravity=19;public LayoutParams(int w,int h){super(w,h);}}}',
'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig{public static final int VERSION_CODE=20452;}',
'ls/augment/com/ConfigSchema.java': 'package ls.augment.com;public class ConfigSchema{public static final String SYSTEMUI_MASTER="master";}',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import java.util.*;public class FeatureSettings{
 public static boolean master=true;public static String raw="";public static final Map<String,String> diagnostics=new HashMap<>();public static final List<Runnable> callbacks=new ArrayList<>();
 public static boolean enabled(android.content.Context c,String key){return master;}public static boolean addSnapshotListener(android.content.Context c,Runnable r){callbacks.add(r);return true;}public static void removeSnapshotListener(Runnable r){callbacks.remove(r);}
 public static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}public static android.content.Context from(Object o){return new android.content.Context();}
 public static Map<String,String> snapshot(android.content.Context c){return Map.of(ls.augment.com.StatusBarIconSpacingSpec.KEY,raw);}public static void change(String value){raw=value;for(Runnable r:new ArrayList<>(callbacks))r.run();}
}''',
'com/android/systemui/statusbar/events/ViewState.java': '''package com.android.systemui.statusbar.events;public class ViewState{public android.view.View designatedCorner;public boolean layoutRtl,active=true,shade,qs;public int rotation;public boolean shouldShowDot(){return active&&!shade&&!qs;}}''',
'com/android/systemui/statusbar/events/PrivacyDotViewControllerImpl.java': '''package com.android.systemui.statusbar.events;import android.view.*;import ls.augment.com.hook.AugmentModule;
 public class PrivacyDotViewControllerImpl{
 public View tl,tr,bl,br;public final ViewState currentViewState=new ViewState();public final Controller stateController=new Controller();public static class Controller{public int state;public int getState(){return state;}}
 public final java.util.ArrayDeque<Runnable> queue=new java.util.ArrayDeque<>();public java.util.concurrent.Executor getUiExecutor(){return queue::add;}public ViewState getCurrentViewState(){return currentViewState;}public void drain(){while(!queue.isEmpty())queue.remove().run();}
 public void initialize(View a,View b,View c,View d){AugmentModule.invoke(this,"initialize",new Class<?>[]{View.class,View.class,View.class,View.class},a,b,c,d);}public void native_initialize(View a,View b,View c,View d){tl=a;tr=b;bl=c;br=d;currentViewState.designatedCorner=b;}
 public void showDotView(View v,boolean animate){v.visibility=View.VISIBLE;}public void hideDotView(View v,boolean animate){v.visibility=View.INVISIBLE;}
 public void resolveState(ViewState s){AugmentModule.invoke(this,"resolveState",new Class<?>[]{ViewState.class},s);}public void native_resolveState(ViewState s){}
 public void setCornerSizes(ViewState s){AugmentModule.invoke(this,"setCornerSizes",new Class<?>[]{ViewState.class},s);}public void native_setCornerSizes(ViewState s){for(View v:new View[]{tl,tr,bl,br}){android.widget.FrameLayout.LayoutParams p=(android.widget.FrameLayout.LayoutParams)v.findViewById("privacy_dot".hashCode()).params;p.topMargin=2;}}
 public void updateRotations(int r,int pad){AugmentModule.invoke(this,"updateRotations",new Class<?>[]{int.class,int.class},r,pad);}public void native_updateRotations(int r,int pad){currentViewState.rotation=r;for(View v:new View[]{tl,tr,bl,br})v.getDisplay().rotation=r;}
 public void stop(){AugmentModule.invoke(this,"stop",new Class<?>[]{});}public void native_stop(){}
}''',
'ls/augment/com/hook/TestPrivacyDotRuntime.java': '''package ls.augment.com.hook;import ls.augment.com.*;import android.view.*;import android.widget.*;import com.android.systemui.statusbar.events.*;
public class TestPrivacyDotRuntime{
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static FrameLayout corner(int x,int y){FrameLayout root=new FrameLayout();root.left=x;root.top=y;root.width=20;root.height=30;root.padLeft=7;root.visibility=View.INVISIBLE;View dot=new View();dot.id="privacy_dot".hashCode();root.add(dot);return root;}
 static View dot(View v){return v.findViewById("privacy_dot".hashCode());}static FrameLayout.LayoutParams p(View v){return (FrameLayout.LayoutParams)dot(v).params;}
 static void layout(View root){root.layoutRequested=false;if(root instanceof ViewGroup)for(View v:((ViewGroup)root).children){v.layoutRequested=false;layout(v);}}
 static void draw(View root){for(int i=0;i<4;i++){layout(root);if(root.getViewTreeObserver().draw())return;}throw new AssertionError("preDraw must settle without loop");}
 static String rule(int s,int t,int e,int b){return StatusBarIconSpacingSpec.empty().with("all","privacy.dot",new StatusBarIconSpacingSpec.Insets(s,t,e,b)).serialize();}
 public static void main(String[] args){AugmentModule m=new AugmentModule();AugmentModule.active=m;check(PrivacyDotSpacingHook.install(m,TestPrivacyDotRuntime.class.getClassLoader())==5,"verified controller writers installed");
 FrameLayout window=new FrameLayout();window.width=400;window.height=30;FrameLayout a=corner(0,0),b=corner(380,0),c=corner(0,0),d=corner(380,0);for(FrameLayout v:new FrameLayout[]{a,b,c,d})window.add(v);b.visibility=View.VISIBLE;
 PrivacyDotViewControllerImpl controller=new PrivacyDotViewControllerImpl();controller.initialize(a,b,c,d);draw(window);
 check(window.tree.list.size()==1,"shared decorations tree registers one observer");PrivacyDotSpacingObservation observation=PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+0));check(observation!=null&&observation.available(),"native capacity published with master untouched");
 b.alpha=0;Object glyph=dot(b).drawable;int color=dot(b).color;float alpha=b.alpha;int nativeGravity=p(b).gravity;Object rootParams=b.params;
 FeatureSettings.change(rule(2,1,1,1));check(p(b).leftMargin==0,"config callback must marshal to native decorations executor");controller.drain();draw(window);check(p(b).leftMargin==2&&p(b).rightMargin==1&&p(b).topMargin==1&&p(b).bottomMargin==1,"four bounded margins reach native child");
 for(View v:new View[]{a,c,d})check(p(v).leftMargin==0&&p(v).topMargin==0&&v.visibility==View.INVISIBLE,"non-designated corner untouched");
 a.visibility=View.VISIBLE;a.alpha=.4f;draw(window);check(p(a).leftMargin==0&&a.visibility==View.VISIBLE&&a.alpha==.4f,"fading previous visible corner is restored, not styled or hidden");a.visibility=View.INVISIBLE;
 check(b.params==rootParams&&b.width==20&&b.height==30&&b.padLeft==7&&p(b).gravity==nativeGravity,"native corner/window dimensions padding and anchors unchanged");check(dot(b).drawable==glyph&&dot(b).color==color&&b.alpha==alpha&&dot(b).width==4&&dot(b).height==4,"privacy image colour size and fade preserved");
 int requests=dot(b).requests;for(int i=0;i<30;i++)draw(window);check(dot(b).requests==requests,"steady traversal neither accumulates nor relayouts");
 FeatureSettings.change(rule(24,24,24,24));controller.drain();draw(window);check(p(b).leftMargin==0&&p(b).topMargin==0,"oversized imported config restores original rather than silently clamps");check(FeatureSettings.raw.equals(rule(24,24,24,24)),"fallback keeps user's saved rule");check(PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+0)).status.equals("outside_capacity"),"fallback published to editor");
 FeatureSettings.change(rule(2,1,1,1));controller.drain();draw(window);controller.currentViewState.shade=true;controller.resolveState(controller.currentViewState);draw(window);check(p(b).leftMargin==0&&b.visibility==View.VISIBLE,"native shade condition restores without forcing visibility");controller.currentViewState.shade=false;controller.currentViewState.qs=true;controller.resolveState(controller.currentViewState);draw(window);check(p(b).leftMargin==0,"QS condition keeps margins native");controller.currentViewState.qs=false;controller.resolveState(controller.currentViewState);draw(window);
 controller.setCornerSizes(controller.currentViewState);check(!PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+0)).available(),"native geometry rewrite invalidates old published capacity");draw(window);check(p(b).topMargin==3,"new native top margin gets exactly one addition");check(PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+0)).available(),"designated corner republishes after another corner invalidated shared capability");FeatureSettings.master=false;FeatureSettings.change(FeatureSettings.raw);controller.drain();draw(window);check(p(b).topMargin==2&&p(b).leftMargin==0&&!p(b).isMarginRelative(),"disable restores latest native baseline and absolute margin mode");FeatureSettings.master=true;
 for(int rotation=0;rotation<4;rotation++)for(boolean rtl:new boolean[]{false,true}){
  for(View v:new View[]{a,b,c,d}){v.visibility=View.INVISIBLE;v.direction=rtl?1:0;dot(v).direction=v.direction;p(v).gravity=rtl?Gravity.RIGHT|Gravity.CENTER_VERTICAL:Gravity.LEFT|Gravity.CENTER_VERTICAL;}
  View active=new View[]{a,b,c,d}[rotation];active.visibility=View.VISIBLE;controller.currentViewState.designatedCorner=active;controller.currentViewState.layoutRtl=rtl;controller.updateRotations(rotation,0);controller.resolveState(controller.currentViewState);draw(window);
  check(p(active).getMarginStart()==2&&p(active).getMarginEnd()==1,"all rotations and RTL keep logical margins");
  for(View other:new View[]{a,b,c,d})if(other!=active)check(p(other).leftMargin==0&&p(other).rightMargin==0,"rotated previous corner restores");
 }
 View active=controller.currentViewState.designatedCorner;active.x=5;active.y=3;draw(window);check(p(active).leftMargin==0&&active.x==5&&active.y==3,"native moving-corner animation remains native");active.x=active.y=0;draw(window);
 WindowInsets savedInsets=window.insets;window.insets=null;draw(window);check(p(active).leftMargin==0&&!PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+3)).available(),"lost safe-area evidence restores native and closes stale controls");window.insets=savedInsets;draw(window);check(p(active).getMarginStart()==2,"valid insets restore desired spacing without config rewrite");
 active.width=8;draw(window);check(p(active).leftMargin==0&&p(active).rightMargin==0,"smaller native box cannot retain formerly safe spacing");active.width=20;draw(window);check(p(active).getMarginStart()==2,"native capacity recovery reapplies unchanged valid rule");
 dot(active).direction=0;draw(window);check(p(active).leftMargin==0&&p(active).rightMargin==0,"half-completed RTL transition uses native state");dot(active).direction=1;draw(window);
 p(active).topMargin=9;FeatureSettings.master=false;FeatureSettings.change(FeatureSettings.raw);controller.drain();draw(window);check(p(active).topMargin==9&&p(active).leftMargin==0&&p(active).rightMargin==0,"one OEM edge update is retained while owned other edges restore");
 controller.stop();check(window.tree.list.isEmpty()&&FeatureSettings.callbacks.isEmpty(),"stop releases observers and config callback");
 // Future per-corner roots have nonzero window origin; cutouts are window-local.
 FrameLayout single=corner(380,0);single.visibility=View.VISIBLE;single.insets.cutout=new DisplayCutout();single.insets.cutout.cuts.add(new android.graphics.Rect(10,0,20,30));FrameLayout e=corner(0,0),f=corner(0,0),g=corner(0,0);PrivacyDotViewControllerImpl separate=new PrivacyDotViewControllerImpl();separate.initialize(e,single,f,g);draw(single);
 observation=PrivacyDotSpacingObservation.parse(FeatureSettings.diagnostics.get(PrivacyDotSpacingObservation.KEY+0));check(observation!=null&&!observation.available(),"window-local cutout translated to physical screen catches unsafe native glyph");
 separate.stop();System.out.println("Privacy dot production controller facade: "+checks+" assertions passed (not device evidence)");
}}
'''
})

with tempfile.TemporaryDirectory(prefix='duo-privacy-dot-') as tmp:
    paths=[]
    for name,content in files.items():
        path=Path(tmp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');paths.append(path)
    names=['StatusBarIconSpacingSpec.java','StatusBarSurfaceSpec.java','StatusBarIconCatalog.java','PrivacyDotSpacingPolicy.java','PrivacyDotSpacingObservation.java','hook/SystemUiAdapter.java','hook/SystemUiCompatibility.java','hook/PrivacyDotSpacingHook.java']
    jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    subprocess.run([str(jdk/'javac.exe'),'-encoding','UTF-8','--release','17','-d',tmp,*map(str,paths),*[str(SRC/n) for n in names],str(ROOT/'tools/TestPrivacyDotSpacing.java')],check=True)
    for target in ['ls.augment.com.TestPrivacyDotSpacing','ls.augment.com.hook.TestPrivacyDotRuntime']:
        subprocess.run([str(jdk/'java.exe'),'-cp',tmp,target],check=True,timeout=25)
