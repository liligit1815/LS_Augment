"""Run production recents hooks against OEM-shaped draw/visibility calls and real scope policy."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'android/app/src/main/java/ls/augment/com/hook'
grid=(BASE/'StatusBarGridHook.java').read_text(encoding='utf-8')
start=grid.index('    static boolean ownsRecentsContent(')
end=grid.index('    static int install(',start)
ownership=grid[start:end]
files={
 'android/content/Context.java': 'package android.content; public class Context {public boolean master,custom,position;}',
 'android/graphics/Canvas.java': 'package android.graphics; public class Canvas {public int translates;}',
 'android/text/TextPaint.java': 'package android.text; public class TextPaint {}',
 'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long elapsedRealtime(){return 10000;}}',
 'android/view/View.java': '''package android.view;import android.content.Context;
public class View {public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public View parent;public int visibility;public Context context=new Context();
 public Object getParent(){return parent;}public Context getContext(){return context;}}''',
 'android/widget/TextView.java': 'package android.widget;public class TextView extends android.view.View {}',
 'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20360;}',
 'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;
class FeatureSettings {static final String SYSTEMUI_MASTER="master",STATUSBAR_CLOCK_CUSTOM="clock";
 static boolean enabled(Context c,String k){return k.equals(SYSTEMUI_MASTER)?c.master:c.custom;}static void diagnostic(Context c,String k,String v){}}''',
 'ls/augment/com/hook/StatusBarGridHook.java': '''package ls.augment.com.hook;
import android.view.View;import android.content.Context;import java.util.*;
class StatusBarGridHook {
 static class Phone extends View {}static class Keyguard extends View {}
 static class State {Context context;boolean active;State(View v){context=v.context;}boolean positionOnly(){return context.position;}}
 static final Map<View,State> STATES=new IdentityHashMap<>();
 static boolean isBarRoot(View v){return v instanceof Phone||v instanceof Keyguard;}
 static boolean isKeyguard(View v){return v instanceof Keyguard;}
 OWNERSHIP
}'''.replace('OWNERSHIP',ownership),
 'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
 interface Interceptor {Object run(Chain c)throws Throwable;}
 static class Chain {Object owner;Object[] args;Method method;int calls;
  Chain(Method m,Object o,Object[] a){method=m;owner=o;args=a;}Object getArg(int i){return args[i];}Object getThisObject(){return owner;}
  Object proceed()throws Throwable{calls++;return method.invoke(owner,args);}}
 class Prepared {Method method;Prepared(Method m){method=m;}Object intercept(Interceptor i){hooks.put(method,i);return this;}}
 final Map<Method,Interceptor> hooks=new HashMap<>();int errors;public int originalCalls;
 Prepared prepareFeatureHook(Method m,String id,boolean replace){return new Prepared(m);}void registerFeatureHook(Object h){}
 void logFeatureError(String k,Throwable t){errors++;}void logFeatureInfo(String v){}
 public Object invoke(Object owner,String name,Class<?>[] types,Object...args)throws Throwable{
  Method m=owner.getClass().getDeclaredMethod(name,types);Chain c=new Chain(m,owner,args);
  Object value=hooks.get(m).run(c);originalCalls=c.calls;return value;}
}''',
 'com/zte/feature/statusbar/clock/StatusBarClockFeature.java': '''package com.zte.feature.statusbar.clock;
import android.widget.TextView;import android.graphics.Canvas;import android.text.TextPaint;
public class StatusBarClockFeature {public boolean handleOnDraw(TextView v,Canvas c,TextPaint p){c.translates++;return true;}}''',
 'com/zte/feature/statusbar/RedMagicFunctionIconFeature.java': '''package com.zte.feature.statusbar;import android.view.View;
public class RedMagicFunctionIconFeature {public View mIconContainer;public int calls;public void hideView(int visibility,boolean animate){calls++;mIconContainer.visibility=visibility;}}''',
 'com/zte/adapt/mifavor/navbar/LauncherProxyServiceAdapt.java': '''package com.zte.adapt.mifavor.navbar;
import ls.augment.com.hook.AugmentModule;import com.zte.feature.statusbar.RedMagicFunctionIconFeature;
public class LauncherProxyServiceAdapt {public static void hide(AugmentModule m,RedMagicFunctionIconFeature f,int visibility)throws Throwable{
 m.invoke(f,"hideView",new Class<?>[]{int.class,boolean.class},visibility,false);}}''',
 'ls/augment/com/hook/TestRecents.java': '''package ls.augment.com.hook;
import android.view.View;import android.widget.TextView;import android.graphics.Canvas;import android.text.TextPaint;
import com.zte.feature.statusbar.clock.StatusBarClockFeature;import com.zte.feature.statusbar.RedMagicFunctionIconFeature;
import com.zte.adapt.mifavor.navbar.LauncherProxyServiceAdapt;
public class TestRecents {
 static int checks;static void check(boolean ok,String m){checks++;if(!ok)throw new AssertionError(m);}
 public static void main(String[] args)throws Throwable{
  AugmentModule module=new AugmentModule();check(StatusBarRecentsHook.install(module,TestRecents.class.getClassLoader())==2&&module.errors==0,"both exact hooks registered");
  for(boolean lock:new boolean[]{false,true})for(int flags=0;flags<16;flags++){
   View root=lock?new StatusBarGridHook.Keyguard():new StatusBarGridHook.Phone();
   root.context.master=(flags&1)!=0;root.context.custom=(flags&2)!=0;root.context.position=(flags&4)!=0;
   StatusBarGridHook.State state=new StatusBarGridHook.State(root);state.active=(flags&8)!=0;StatusBarGridHook.STATES.put(root,state);
   boolean grid=!lock&&state.active&&root.context.master&&!root.context.position;
   View parent=new View();parent.parent=root;TextView clock=new TextView();clock.parent=parent;
   Canvas canvas=new Canvas();Object result=module.invoke(new StatusBarClockFeature(),"handleOnDraw",new Class<?>[]{TextView.class,Canvas.class,TextPaint.class},clock,canvas,new TextPaint());
   boolean bypass=grid&&root.context.custom;
   check(result.equals(!bypass)&&canvas.translates==(bypass?0:1)&&module.originalCalls==(bypass?0:1),"custom clock leaves canvas untouched; other modes use OEM once");
   RedMagicFunctionIconFeature cooling=new RedMagicFunctionIconFeature();cooling.mIconContainer=parent;
   LauncherProxyServiceAdapt.hide(module,cooling,View.INVISIBLE);
   check(cooling.calls==(grid?0:1)&&parent.visibility==(grid?View.VISIBLE:View.INVISIBLE),"only managed phone grid preserves launcher visibility");
   parent.visibility=View.VISIBLE;int before=cooling.calls;
   module.invoke(cooling,"hideView",new Class<?>[]{int.class,boolean.class},View.INVISIBLE,true);
   check(cooling.calls==before+1&&parent.visibility==View.INVISIBLE,"heads-up/non-launcher hiding preserved");
   before=cooling.calls;LauncherProxyServiceAdapt.hide(module,cooling,View.GONE);
   check(cooling.calls==before+1&&parent.visibility==View.GONE,"unrecognized launcher visibility stays native");
   clock.parent=null;canvas=new Canvas();module.invoke(new StatusBarClockFeature(),"handleOnDraw",new Class<?>[]{TextView.class,Canvas.class,TextPaint.class},clock,canvas,new TextPaint());
   check(canvas.translates==1,"detached/unmanaged clocks stay native");
   StatusBarGridHook.STATES.clear();
  }
  String caller="com.zte.adapt.mifavor.navbar.LauncherProxyServiceAdapt";
  check(StatusBarRecentsHook.fromLauncher(new StackTraceElement[]{new StackTraceElement(caller+"$ExternalSyntheticLambda1","run","",1)}),"synthetic launcher callback supported");
  check(!StatusBarRecentsHook.fromLauncher(new StackTraceElement[]{new StackTraceElement(caller+"Other","run","",1)}),"no prefix false positive");
  System.out.println("PASS recents production hooks: "+checks+" assertions");
 }
}''',
}
files['ls/augment/com/hook/StatusBarRecentsHook.java']=(BASE/'StatusBarRecentsHook.java').read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='lsa-recents-') as temp:
    paths=[]
    for name,source in files.items():
        path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');paths.append(str(path))
    subprocess.run(['javac','-encoding','UTF-8','-d',temp,*paths],check=True)
    subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestRecents'],check=True)
