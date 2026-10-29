"""Run production Duo acquisition/cards against old, new, inherited and malformed OEM contracts."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
host = (SRC / 'NativeIslandHost.java').read_text(encoding='utf-8')

def member(marker):
    start = host.index(marker)
    end = host.index('{', start) + 1
    depth = 1
    while depth:
        depth += (host[end] == '{') - (host[end] == '}')
        end += 1
    return host[start:end]

FILES = {
'android/util/AttributeSet.java': 'package android.util;public interface AttributeSet{}',
'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics{public float density=1;}',
'android/util/Log.java': 'package android.util;public class Log{public static void i(String a,String b){}public static void e(String a,String b,Throwable t){}}',
'android/graphics/Color.java': 'package android.graphics;public class Color{public static final int WHITE=-1;}',
'android/text/TextUtils.java': 'package android.text;public class TextUtils{public enum TruncateAt{END}}',
'android/content/res/Resources.java': '''package android.content.res;import java.util.*;public class Resources{
 public final Set<String> layouts=new HashSet<>(List.of("dynamic_island_layout","media_island_layout","charging_island_layout"));
 public int getIdentifier(String n,String t,String p){return layouts.contains(n)?1:0;}
 public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}''',
'android/content/Context.java': '''package android.content;public class Context{public final android.content.res.Resources resources=new android.content.res.Resources();
 public android.content.res.Resources getResources(){return resources;}public <T>T getSystemService(Class<T> type){try{return type.getConstructor().newInstance();}catch(Exception e){throw new AssertionError(e);}}}''',
'android/os/PowerManager.java': 'package android.os;public class PowerManager{public boolean isInteractive(){return true;}}',
'android/app/KeyguardManager.java': 'package android.app;public class KeyguardManager{public boolean isKeyguardLocked(){return false;}}',
'android/view/Gravity.java': 'package android.view;public class Gravity{public static final int START=1,TOP=2,CENTER_VERTICAL=4;}',
'android/view/View.java': '''package android.view;public class View{
 public static final int VISIBLE=0,INVISIBLE=4;public int visibility;public float alpha=1;public boolean attached=true;
 public ViewGroup.LayoutParams params;public android.content.Context context;public View(android.content.Context c){context=c;}
 public boolean isAttachedToWindow(){return attached;}public void setVisibility(int v){visibility=v;}public void setAlpha(float a){alpha=a;}
 public android.content.Context getContext(){return context;}public void setLayoutParams(ViewGroup.LayoutParams p){params=p;}public ViewGroup.LayoutParams getLayoutParams(){return params;}}''',
'android/view/ViewGroup.java': '''package android.view;import java.util.*;public class ViewGroup extends View{
 public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
 public final List<View> children=new ArrayList<>();public ViewGroup(android.content.Context c){super(c);}
 public void addView(View v,LayoutParams p){v.setLayoutParams(p);children.add(v);}}''',
'android/view/WindowManager.java': '''package android.view;public class WindowManager{public static class LayoutParams extends ViewGroup.LayoutParams{
 public int x,y;public LayoutParams(){super(100,32);}}}''',
'android/widget/FrameLayout.java': '''package android.widget;public class FrameLayout extends android.view.ViewGroup{
 public FrameLayout(android.content.Context c){super(c);}public static class LayoutParams extends android.view.ViewGroup.LayoutParams{
 public int gravity,topMargin,start,end;public LayoutParams(int w,int h){super(w,h);}public void setMarginStart(int n){start=n;}public void setMarginEnd(int n){end=n;}}}''',
'android/widget/ImageView.java': '''package android.widget;public class ImageView extends android.view.View{
 public enum ScaleType{CENTER_CROP}public ImageView(android.content.Context c){super(c);}public void setScaleType(ScaleType t){}}''',
'android/widget/TextView.java': '''package android.widget;public class TextView extends android.view.View{
 public int lines;public TextView(android.content.Context c){super(c);}public void setTextSize(int s){}public void setTextColor(int c){}
 public void setMaxLines(int n){lines=n;}public void setEllipsize(android.text.TextUtils.TruncateAt t){}}''',
'com/zte/base/Feature.java': '''package com.zte.base;public class Feature{public static Feature current;
 public Object mDynamicIslandManager;public boolean mEnabled;public boolean enabled(){return mEnabled;}public static Feature get(String n){return current;}}''',
'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;class SystemUiAdapter{
 static Object field(Object o,String n){if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(NoSuchFieldException e){}catch(Exception e){throw new RuntimeException(e);}return null;}
 static boolean set(Object o,String n,Object v){if(o==null)return false;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(o,v);return true;}catch(NoSuchFieldException e){}catch(Exception e){return false;}return false;}
 static Object call(Object o,String n,Object... args)throws Exception{for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(n)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(n);}}''',
}
ISLAND = '''package com.zte.feature.dynamicisland;import android.content.Context;import android.util.AttributeSet;import android.view.View;
public class DynamicPermanentIsland extends android.widget.FrameLayout{
 public java.util.List<View> mViewList=new java.util.ArrayList<>();public boolean mKeyguardIsland;
 public DynamicPermanentIsland(Context c,AttributeSet a){super(c);}public DynamicPermanentIsland getPanelIsland(){return null;}
 public int getPanelType(){return 1;}public void updateViewVisibility(boolean a,boolean b){}public void updatePanelVisibility(boolean a,boolean b,boolean c){}
 public void updateViewAlpha(View v,boolean animate,boolean show){v.setVisibility(show?0:4);v.setAlpha(show?1:0);}
 // MODERN
}'''
MODERN = '''public void initAppIsland(String a,String b,String c,byte[] d,byte[] e,String f,byte[] g,String h){}
public void initPanelIsland(String a,String b){}public void setPanelIsland(DynamicPermanentIsland panel){}'''
HARNESS = '''package ls.augment.com.hook;
import android.content.Context;import android.view.*;import android.widget.*;import com.zte.feature.dynamicisland.DynamicPermanentIsland;
import com.zte.base.Feature;import static ls.augment.com.hook.SystemUiAdapter.*;
public class NativeIslandHost {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static final ClassLoader loader=NativeIslandHost.class.getClassLoader();static NativeIslandHost active;static Object initializedManager,failedDuoInitialization;
 static boolean initializedByDuo,legacyCardHooksInstalled=true;static java.lang.ref.WeakReference<View> keyguardView=new java.lang.ref.WeakReference<>(null);
 Object feature,manager,permanent,disposable;Context context=new Context();View phone=new View(context),root,container,notice,noticePanel,charge,chargePanel;
 static final String N="com.zte.feature.dynamicisland.";static final Object PASS=new Object();
 interface Before{Object run(Object o,Object[] a,Object r)throws Exception;}
 static final java.util.Map<String,Before> hooks=new java.util.HashMap<>();
 static int hookNamed(Object module,ClassLoader l,String tag,String type,String name,int argc,Before before,Object after){hooks.put(name,before);return 1;}
 static void installLegacy(){Object module=new Object(); // HOOKS
 }
 boolean acquired,originalFeature,originalEnabled,flagsOverridden;int nativeX,nativeY,nativeWidth,nativeHeight,nativeContainerWidth,nativeContainerHeight;
 DuoIslandCompatibility duoCompatibility;DuoIslandLegacyCards legacyCards;String diagnostic;
 static Object invokeStatic(String name,String method,Class<?>[] types,Object...args)throws Exception{return Class.forName(name).getMethod(method,types).invoke(null,args);}
 static void rememberBaseline(Object f,boolean e){}void geometry(){}void report(String s){diagnostic=s;}static String cause(Throwable e){while(e.getCause()!=null)e=e.getCause();return e.getClass().getSimpleName()+":"+e.getMessage();}
 // ACQUIRE
 static class Permanent {
  public ViewGroup mDynamicIslandRoot,mDynamicIslandContainer,mDynamicPanelContainer,mDynamicPermanentContainer;
  public WindowManager.LayoutParams mParams=new WindowManager.LayoutParams();public WindowManager mWindowManager=new WindowManager();
  public boolean mIsDynamicIslandEnable,mAODVisibility,mPayJoyControlled;public int mCurRotation,wakes;public boolean failWake;
  public void addPermanentIslandInner(DynamicPermanentIsland v){}public void removePermanentIslandInner(DynamicPermanentIsland v){}
  public DynamicPermanentIsland getPermanentIsland(){return null;}public void showPermanentPanelIsland(){}public void onKeyguardStateChanged(boolean b){}
  public void setAODVisibility(boolean b){}public void updateRooterVisibility(){if(failWake)throw new IllegalStateException("wake failure");wakes++;}
  public void updateDynamicWindowHeightParams(boolean expanded){}public void updateResources(){}public void updateDynamicWindowParams(){}
 }
 static class Child extends Permanent{}
 static class ModernPermanent extends Permanent{public boolean mInteractive;public void onStartedWakingUp(){wakes++;}}
 static class Unknown extends Permanent{public ViewGroup mDynamicIslandPanelRoot;}
 static class WrongField extends Permanent{public String mParams;}
 static class Manager{
  public Context mContext;public Permanent mPermanentIslandManager;public Object mDisposableIslandManager=new Object();public int inits,registered;
  public boolean failInit,failRegistration;Manager(Context c,Permanent p){mContext=c;mPermanentIslandManager=p;}
  public void initDynamicIsland(){inits++;if(failInit)throw new IllegalStateException("init failure");Permanent p=mPermanentIslandManager;
   p.mDynamicIslandRoot=new ViewGroup(mContext);p.mDynamicIslandContainer=new FrameLayout(mContext);p.mDynamicIslandContainer.setLayoutParams(new ViewGroup.LayoutParams(100,32));}
  public void initSystemIconContainer(View v){}public void initKeyguardSystemIconContainer(View v){}
 }
 static class ModernManager extends Manager{ModernManager(Context c,Permanent p){super(c,p);}public void registerConfigChangeListener(){registered++;if(failRegistration)throw new IllegalStateException("register failure");}}
 static class ChildManager extends ModernManager{ChildManager(Context c,Permanent p){super(c,p);}}
 static Manager setup(NativeIslandHost h,Permanent p,boolean modern){active=null;initializedManager=null;failedDuoInitialization=null;initializedByDuo=false;legacyCardHooksInstalled=true;
  Manager m=modern?new ChildManager(h.context,p):new Manager(h.context,p);Feature.current=new Feature();Feature.current.mDynamicIslandManager=m;
  if(MODERN){h.context.resources.layouts.add("app_island_layout");h.context.resources.layouts.add("app_island_panel_layout");}return m;}
 static void rejected(String reason,Permanent p,boolean modern,String remove){NativeIslandHost h=new NativeIslandHost();Manager m=setup(h,p,modern);if(remove!=null)h.context.resources.layouts.remove(remove);
  check(!h.acquire(),reason+" accepted");check(m.inits==0&&!Feature.current.mEnabled&&!p.mIsDynamicIslandEnable&&active==null,reason+" mutated native host");}
 static final boolean MODERN=MODERN_VALUE;
 public static void main(String[] args)throws Exception{
  String variant=args[0];installLegacy();
  if(variant.equals("full")||variant.equals("badflag")||variant.equals("missing_modern")){
   rejected(variant,MODERN?new ModernPermanent():new Permanent(),MODERN,null);System.out.println("PASS "+variant+": "+checks);return;}
  NativeIslandHost h=new NativeIslandHost();Permanent p=MODERN?new ModernPermanent():new Child();Manager m=setup(h,p,MODERN);
  DuoIslandCompatibility c=DuoIslandCompatibility.resolve(loader,m,p,h.context);
  check(p.wakes==0&&m.inits==0&&m.registered==0,"preflight changed lifecycle");check(c.legacyCards!=MODERN,"wrong card route");
  check(h.acquire(),"acquire failed: "+h.diagnostic);check(p.wakes==1&&Feature.current.mEnabled&&p.mIsDynamicIslandEnable,"wake or gates not applied");
  check(m.inits==1&&m.registered==(MODERN?1:0),"initialization contract");check(h.diagnostic.contains("mode=duo"),"ambiguous diagnostic");
  check(h.acquire()&&m.inits==1&&p.wakes==1,"duplicate acquisition");
  NativeIslandHost second=new NativeIslandHost();check(!second.acquire(),"duplicate Duo owner");
  if(!MODERN){DuoIslandLegacyCards cards=h.legacyCards;View card=cards.create(false),panel=cards.create(true),foreign=new View(h.context);
   check(cards.owns(card)&&cards.owns(panel)&&!cards.owns(foreign),"ownership leaked");
   h.notice=card;h.noticePanel=panel;
   check(hooks.get("getPanelIsland").run(card,new Object[0],null)==panel,"Duo notification panel not linked");
   h.charge=cards.create(false);h.chargePanel=cards.create(true);
   check(hooks.get("getPanelIsland").run(h.charge,new Object[0],null)==h.chargePanel,"Duo charging panel not linked");
   check(hooks.get("getPanelIsland").run(foreign,new Object[0],null)==PASS,"OEM panel intercepted");
   check(hooks.get("updateViewVisibility").run(foreign,new Object[]{true,false},null)==PASS,"OEM visibility intercepted");
   check(((FrameLayout)card).children.size()==2&&((FrameLayout)panel).children.size()==3,"legacy content absent");
   check(cards.member(card,"mDisplayIcon") instanceof ImageView&&cards.member(card,"mDisplayText") instanceof TextView,"compact mapping");
   check(((TextView)cards.member(panel,"mDisplaySecondText")).lines==2,"expanded text missing");
   check(cards.member(foreign,"mDisplayText")==null,"foreign view mapped");
   hooks.get("updateViewVisibility").run(card,new Object[]{false,false},null);for(View v:((DynamicPermanentIsland)card).mViewList)check(v.visibility==4&&v.alpha==0,"hide ignored");
   cards.visibility(card,true,true);for(View v:((DynamicPermanentIsland)card).mViewList)check(v.visibility==0&&v.alpha==1,"show ignored");
   // Charging replaces the compact children; visibility must use the current native list, not stale text/icon references.
   DynamicPermanentIsland charging=(DynamicPermanentIsland)cards.create(false);View chargeContent=new View(h.context);charging.mViewList.clear();charging.mViewList.add(chargeContent);
   cards.visibility(charging,false,false);check(chargeContent.visibility==4,"charge hide ignored");cards.visibility(charging,true,true);check(chargeContent.visibility==0,"charge show ignored");
  }
  rejected("missing media layout",MODERN?new ModernPermanent():new Permanent(),MODERN,"media_island_layout");
  rejected("wrong params type",new WrongField(),MODERN,null);
  if(MODERN){rejected("partial templates",new ModernPermanent(),true,"app_island_panel_layout");rejected("missing config listener",new ModernPermanent(),false,null);
   h=new NativeIslandHost();p=new ModernPermanent();m=setup(h,p,true);m.failRegistration=true;
   check(!h.acquire()&&m.inits==1&&m.registered==1,"registration failure accepted");m.failRegistration=false;
   check(!h.acquire()&&m.inits==1&&m.registered==1&&!Feature.current.mEnabled,"partial initialization silently accepted on retry");}
  else{rejected("unknown missing flag host",new Unknown(),false,null);
   h=new NativeIslandHost();p=new Permanent();m=setup(h,p,false);legacyCardHooksInstalled=false;check(!h.acquire()&&m.inits==0,"missing legacy hooks mutated host");
   h=new NativeIslandHost();p=new Permanent();m=setup(h,p,false);p.failWake=true;
   check(!h.acquire()&&!Feature.current.mEnabled&&!p.mIsDynamicIslandEnable&&active==null,"failed wake did not roll back");
   p.failWake=false;check(h.acquire()&&m.inits==1,"retry duplicated already initialized engine");}
  h=new NativeIslandHost();p=MODERN?new ModernPermanent():new Permanent();m=setup(h,p,MODERN);m.failInit=true;
  check(!h.acquire()&&m.inits==1,"init failure");check(!h.acquire()&&m.inits==1,"partial init retried");
  System.out.println("PASS "+variant+": "+checks);
 }
}'''.replace('// ACQUIRE', member('    boolean acquire(){')).replace('// HOOKS', host[host.index('        int legacyPanel='):host.index('        int panelVisibility=')])

for name in ('NativeIslandWake', 'DuoIslandCompatibility', 'DuoIslandLegacyCards'):
    FILES[f'ls/augment/com/hook/{name}.java'] = (SRC / f'{name}.java').read_text(encoding='utf-8')

def main():
    variants = [('legacy', False, ''), ('modern', True, 'public static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=false;'),
                ('full', True, 'public static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=true;'),
                ('badflag', False, 'public static int ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=0;'), ('missing_modern', True, ''),
                ('privateflag', True, 'private static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=false;'),
                ('inheritedflag', True, '')]
    for label, modern, flag in variants:
        files = dict(FILES)
        files['com/zte/tools/AppTools.java'] = 'package com.zte.tools;public class AppTools{' + flag + '}'
        if label == 'inheritedflag':
            files['com/zte/tools/AppTools.java'] = 'package com.zte.tools;class Parent{private static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=false;}public class AppTools extends Parent{}'
        files['com/zte/feature/dynamicisland/DynamicPermanentIsland.java'] = ISLAND.replace('// MODERN', MODERN if modern else '')
        files['ls/augment/com/hook/NativeIslandHost.java'] = HARNESS.replace('MODERN_VALUE', str(modern).lower())
        with tempfile.TemporaryDirectory(prefix='duo-host-') as d:
            folder = Path(d)
            for name, content in files.items():
                path = folder / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content, encoding='utf-8')
            subprocess.run([str(JDK / 'javac'), '-encoding', 'UTF-8', '-d', str(folder), *map(str, folder.rglob('*.java'))], check=True)
            subprocess.run([str(JDK / 'java'), '-cp', str(folder), 'ls.augment.com.hook.NativeIslandHost', label], check=True)

if __name__ == '__main__':
    main()
