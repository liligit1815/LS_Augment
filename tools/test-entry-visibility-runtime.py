"""Execute the production entry visibility callbacks with Android/OEM-shaped host doubles."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"

files = {
    "ls/augment/com/hook/MinorsWorkspaceHook.java": "package ls.augment.com.hook;class MinorsWorkspaceHook {static void install(AugmentModule m,ClassLoader l){}}",
    "android/content/Context.java": """package android.content;
public class Context {private final String pkg;public Context(String p){pkg=p;}
 public String getPackageName(){return pkg;}public Context getApplicationContext(){return this;}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}
""",
    "android/content/pm/PackageManager.java": """package android.content.pm;public class PackageManager {}""",
    "android/content/ComponentName.java": """package android.content;
public class ComponentName {final String pkg,cls;public ComponentName(String p,String c){pkg=p;cls=c;}
 public String getPackageName(){return pkg;}public String getClassName(){return cls;}}
""",
    "android/content/Intent.java": """package android.content;
public class Intent {private ComponentName target;public ComponentName resolved;public boolean failResolve;public Intent(){}public Intent(ComponentName c){target=c;}
 public ComponentName getComponent(){return target;}public Intent setComponent(ComponentName c){target=c;return this;}
 public ComponentName resolveActivity(android.content.pm.PackageManager pm){if(failResolve)throw new IllegalStateException("unreadable resolver");return resolved;}}
""",
    "android/os/Looper.java": """package android.os;
public class Looper {private static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}}
""",
    "android/os/Handler.java": """package android.os;import java.util.*;
public class Handler {private static final ArrayDeque<Runnable> queue=new ArrayDeque<>();public Handler(Looper l){}
 public boolean post(Runnable r){queue.add(r);return true;}public boolean postDelayed(Runnable r,long d){return post(r);}
 public static void drain(){int limit=1000;while(!queue.isEmpty()){if(--limit==0)throw new AssertionError("refresh loop");queue.remove().run();}}
 public static int pending(){return queue.size();}}
""",
    "io/github/libxposed/api/XposedInterface.java": """package io.github.libxposed.api;import java.util.List;
public interface XposedInterface {interface HookHandle {void unhook();}interface Hooker {Object intercept(Chain c)throws Throwable;}
 interface Chain {Object getThisObject();Object getArg(int index);List<Object> getArgs();Object proceed()throws Throwable;}}
""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
public class AugmentModule {public static AugmentModule active;public final Map<Method,Hooker> hooks=new HashMap<>();
 public final List<String> errors=new ArrayList<>();public interface Original {Object run()throws Throwable;}
 static class Call implements Chain {final Object owner;final Object[] args;final Original original;
  Call(Object o,Object[] a,Original n){owner=o;args=a;original=n;}public Object getThisObject(){return owner;}
  public Object getArg(int i){return args[i];}public List<Object> getArgs(){return Arrays.asList(args);}public Object proceed()throws Throwable{return original.run();}}
 class Builder {final Method method;Builder(Method m){method=m;}HookHandle intercept(Hooker h){hooks.put(method,h);return ()->hooks.remove(method);}}
 Builder prepareFeatureHook(Method m,String key,boolean before){return new Builder(m);}void registerFeatureHook(HookHandle h){}
 void logFeatureError(String key,Throwable error){errors.add(key+":"+error);}void logFeatureInfo(String message){}
 public static Object dispatch(Object owner,Class<?> type,String name,Class<?>[] types,Object[] args,Original original){
  try{Method m=type.getDeclaredMethod(name,types);Hooker h=active==null?null:active.hooks.get(m);
   return h==null?original.run():h.intercept(new Call(owner,args,original));
  }catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}}
}
""",
    "ls/augment/com/hook/OemHooks.java": """package ls.augment.com.hook;import java.lang.reflect.*;
class OemHooks {static Object invoke(Object owner,String name,Object...args)throws ReflectiveOperationException{
 Method m=owner.getClass().getMethod(name);try{return m.invoke(owner);}catch(InvocationTargetException e){throw e;}}}
""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import java.util.*;import android.content.Context;import android.os.*;
class FeatureSettings {static Context current;static final Map<String,Boolean> values=new HashMap<>();
 static final List<Runnable> listeners=new ArrayList<>();static final Map<String,String> diagnostics=new HashMap<>();
 static boolean enabled(Context c,String key){return values.getOrDefault(key,false);}
 static boolean addSnapshotListener(Context c,Runnable r){if(!listeners.contains(r))listeners.add(r);new Handler(Looper.getMainLooper()).post(r);return true;}
 static void diagnostic(Context c,String key,String value){diagnostics.put(key,value);}static Context from(Object o){return current;}
 static void change(String key,boolean enabled){values.put(key,enabled);for(Runnable r:new ArrayList<>(listeners))r.run();Handler.drain();}
}
""",
    "android/view/View.java": """package android.view;import android.content.Context;import ls.augment.com.hook.AugmentModule;
public class View {public static final int VISIBLE=0,INVISIBLE=4,GONE=8;private int visibility;private final Context context;
 public int nativeVisibilityCalls;public View(Context c){context=c;}public Context getContext(){return context;}
 public int getVisibility(){return visibility;}public void setVisibility(int value){
 AugmentModule.dispatch(this,View.class,"setVisibility",new Class[]{int.class},new Object[]{value},()->{nativeVisibilityCalls++;visibility=value;return null;});}}
""",
    "android/app/Activity.java": """package android.app;import ls.augment.com.hook.AugmentModule;
public class Activity extends android.content.Context {public int resumes;public Activity(String p){super(p);}
 protected void onResume(){AugmentModule.dispatch(this,Activity.class,"onResume",new Class[]{},new Object[]{},()->{resumes++;return null;});}
 public void resume(){onResume();}}
""",
    "androidx/preference/Preference.java": """package androidx.preference;
import android.content.*;import ls.augment.com.hook.AugmentModule;
public class Preference {private final Context context;private Intent intent;public String title;public PreferenceGroup parent;public boolean nativeVisible=true,failIntent,lastVisible;
 public int refreshes,visibleCalls;public Preference(Context c,Intent i,String t){context=c;intent=i;title=t;}
 public Context getContext(){return context;}public Intent getIntent(){if(failIntent)throw new IllegalStateException("unreadable intent");return intent;}
 public CharSequence getTitle(){return title;}public PreferenceGroup getParent(){return parent;}
 public void setIntent(Intent i){intent=i;}public boolean isVisible(){return (Boolean)AugmentModule.dispatch(this,Preference.class,"isVisible",new Class[]{},new Object[]{},()->{visibleCalls++;return nativeVisible;});}
 protected void notifyHierarchyChanged(){refreshes++;lastVisible=isVisible();}}
""",
    "androidx/preference/PreferenceGroup.java": """package androidx.preference;
import android.content.Context;import java.util.*;
public class PreferenceGroup extends Preference {public final List<Preference> children=new ArrayList<>();
 public PreferenceGroup(Context c){super(c,null,"category");}public void add(Preference p){children.add(p);p.parent=this;}
 public int getPreferenceCount(){return children.size();}public Preference getPreference(int i){return children.get(i);}}
""",
    "androidx/preference/PreferenceScreen.java": """package androidx.preference;
public class PreferenceScreen extends PreferenceGroup {public PreferenceScreen(android.content.Context c){super(c);}}
""",
    "androidx/preference/PreferenceCategory.java": """package androidx.preference;
public class PreferenceCategory extends PreferenceGroup {public PreferenceCategory(android.content.Context c){super(c);}}
""",
    "com/android/launcher3/model/data/y.java": """package com.android.launcher3.model.data;
import android.content.ComponentName;public class y {public final ComponentName target;public boolean failIdentity;
 public y(ComponentName c){target=c;}public ComponentName getTargetComponent(){if(failIdentity)throw new IllegalStateException("unreadable identity");return target;}}
""",
    "com/android/launcher3/model/data/d.java": """package com.android.launcher3.model.data;
public class d extends y {public d(android.content.ComponentName c){super(c);}}
""",
    "com/android/launcher3/BubbleTextView.java": """package com.android.launcher3;
import android.content.Context;import com.android.launcher3.model.data.y;import ls.augment.com.hook.AugmentModule;
public class BubbleTextView extends android.view.View {public y bound;public int binds,seenBeforeBind;public Integer nativeBindVisibility;public boolean failBind;
 public BubbleTextView(Context c){super(c);}public void B(y item){AugmentModule.dispatch(this,BubbleTextView.class,"B",new Class[]{y.class},new Object[]{item},()->{
  binds++;seenBeforeBind=getVisibility();if(failBind)throw new IllegalStateException("native bind failed");bound=item;
  if(nativeBindVisibility!=null)setVisibility(nativeBindVisibility);return null;});}}
""",
    "com/android/launcher3/allapps/D.java": """package com.android.launcher3.allapps;
import com.android.launcher3.model.data.d;import ls.augment.com.hook.AugmentModule;
public class D {public d[] c,lastDisplayed;public int refreshes,reads;public boolean failRead;public D(d[] values){c=values;}
 public d[] o(){return (d[])AugmentModule.dispatch(this,D.class,"o",new Class[]{},new Object[]{},()->{reads++;if(failRead)throw new IllegalStateException("native read failed");return c;});}
 public void t(){refreshes++;lastDisplayed=o();}}
""",
    "ls/augment/com/hook/TestEntryVisibilityRuntime.java": """package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import android.view.View;import java.lang.reflect.*;import java.util.*;
import androidx.preference.*;import com.android.launcher3.BubbleTextView;import com.android.launcher3.allapps.D;
import com.android.launcher3.model.data.*;import ls.augment.com.*;
public class TestEntryVisibilityRuntime {
 static int checks;static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static final String L=EntryVisibilityPolicy.LAUNCHER_HOST,S=EntryVisibilityPolicy.SETTINGS_HOST,P=EntryVisibilityPolicy.TARGET_PACKAGE;
 static final String LK=EntryVisibilityOptions.HIDE_MINORS_ICON,SK=EntryVisibilityOptions.HIDE_HEALTHY_USE_ENTRY;
 static ComponentName minors(){return new ComponentName(P,EntryVisibilityPolicy.MINORS_ACTIVITY);}
 static ComponentName health(){return new ComponentName(P,EntryVisibilityPolicy.HEALTHY_USE_ACTIVITY);}
 static AugmentModule start(String pkg){FeatureSettings.current=new Context(pkg);AugmentModule m=new AugmentModule();AugmentModule.active=m;
  check(EntryVisibilityHook.install(m,TestEntryVisibilityRuntime.class.getClassLoader(),"example.other")==0,"unrelated process untouched");
  check(EntryVisibilityHook.install(m,TestEntryVisibilityRuntime.class.getClassLoader(),pkg)==(L.equals(pkg)?3:2),"exact adapter set installs");
  check(m.errors.isEmpty(),"no install errors");return m;}
 static int iconCount()throws Exception {Field field=EntryVisibilityHook.class.getDeclaredField("launcher");field.setAccessible(true);Object hook=field.get(null);
  Field icons=EntryVisibilityHook.class.getDeclaredField("icons");icons.setAccessible(true);return ((Map<?,?>)icons.get(hook)).size();}
 static void launcher()throws Exception {
  AugmentModule m=start(L);Context c=FeatureSettings.current;d a=new d(health()),b=new d(minors()),other=new d(new ComponentName("example.app","example.app.Main"));
  d fake=new d(new ComponentName("example.app",EntryVisibilityPolicy.MINORS_ACTIVITY));d sibling=new d(new ComponentName(P,"com.zte.usebalance.SettingsActivity"));
  d unknown=new d(minors());unknown.failIdentity=true;d[] source={a,b,other,b,null,fake,sibling,unknown};d[] saved=source.clone();D store=new D(source);
  check(store.o()==source,"disabled callback returns same original array");Handler.drain();
  FeatureSettings.change(LK,true);d[] filtered=store.o();
  check(filtered.getClass()==d[].class&&filtered!=source,"production callback preserves runtime array component type");
  check(Arrays.equals(filtered,new d[]{a,other,null,fake,sibling,unknown}),"exact components filtered, duplicates removed, others and unknown retained");
  check(Arrays.equals(source,saved)&&store.c==source,"original backing array and entries unchanged");
  check(store.lastDisplayed.length==6,"turn on notifies already observed app store");
  check(FeatureSettings.diagnostics.get("ls_augment_entry_visibility_launcher").startsWith("已匹配"),"app list match diagnosed before any icon view is bound");
  int afterOn=store.refreshes;FeatureSettings.change(LK,false);
  check(store.refreshes==afterOn+1&&store.lastDisplayed==source,"turn off refreshes and restores original presentation");
  check(store.o()==source,"off getter transparent");
  D empty=new D(null);check(empty.o()==null,"null native list remains null");
  store.failRead=true;int reads=store.reads;try{store.o();throw new AssertionError("missing original failure");}catch(IllegalStateException expected){}
  check(store.reads==reads+1,"native getter failure preserved without retry");store.failRead=false;
  for(int initial:new int[]{View.VISIBLE,View.INVISIBLE,View.GONE}){
   BubbleTextView v=new BubbleTextView(c);v.setVisibility(initial);v.B(b);Handler.drain();
   check(v.getVisibility()==initial,"off binding preserves initial native visibility "+initial);
   FeatureSettings.change(LK,true);check(v.getVisibility()==View.GONE,"enable hides an existing bound view "+initial);
   FeatureSettings.change(LK,false);check(v.getVisibility()==initial,"disable restores exact native visibility "+initial);
  }
  BubbleTextView recycled=new BubbleTextView(c);recycled.setVisibility(View.INVISIBLE);recycled.B(b);Handler.drain();FeatureSettings.change(LK,true);
  check(recycled.getVisibility()==View.GONE,"target hidden before recycling");
  recycled.B(other);check(recycled.seenBeforeBind==View.INVISIBLE&&recycled.getVisibility()==View.INVISIBLE,"recycle restores previous state before unrelated native bind");
  recycled.setVisibility(View.VISIBLE);check(recycled.getVisibility()==View.VISIBLE,"recycled unrelated view not constrained by old target");
  recycled.nativeBindVisibility=View.VISIBLE;recycled.B(b);check(recycled.getVisibility()==View.GONE,"new target evaluated after native binding");
  int tracked=iconCount(),listeners=FeatureSettings.listeners.size(),binds=recycled.binds;
  for(int i=0;i<50;i++)recycled.B(b);
  check(recycled.binds==binds+50&&iconCount()==tracked&&FeatureSettings.listeners.size()==listeners&&listeners==1,"repeat binding no duplicate listener or tracked view growth");
  recycled.setVisibility(View.INVISIBLE);check(recycled.getVisibility()==View.GONE,"native later visibility cannot reveal hidden target");
  FeatureSettings.change(LK,false);check(recycled.getVisibility()==View.INVISIBLE,"disable restores latest native requested visibility");
  recycled.setVisibility(View.GONE);FeatureSettings.change(LK,true);FeatureSettings.change(LK,false);
  check(recycled.getVisibility()==View.GONE,"pre-existing native GONE remains GONE after another toggle");
  recycled.nativeBindVisibility=null;recycled.setVisibility(View.VISIBLE);recycled.B(b);FeatureSettings.change(LK,true);
  recycled.failBind=true;try{recycled.B(other);throw new AssertionError("missing bind failure");}catch(IllegalStateException expected){}
  check(recycled.getVisibility()==View.VISIBLE,"failed rebind releases previous override instead of stranding GONE");recycled.failBind=false;
  recycled.B(sibling);check(recycled.getVisibility()==View.VISIBLE,"same-package other activity remains visible");
  recycled.B(unknown);check(recycled.getVisibility()==View.VISIBLE,"unreadable bound item remains visible");
  int refresh=store.refreshes;FeatureSettings.change(SK,true);check(store.refreshes==refresh,"other switch does not refresh launcher");
  FeatureSettings.change(LK,false);Handler.drain();check(Handler.pending()==0&&m.errors.isEmpty(),"launcher refresh drains without errors or loops");
 }
 static void settings(){
  AugmentModule m=start(S);Context c=FeatureSettings.current;
  Preference exact=new Preference(c,new Intent(health()),"different localized label");
  Preference renamed=new Preference(c,new Intent(new ComponentName(P,"com.zte.usebalance.activity.home.HealthyUsePhoneActivityV2")),"健康使用手机");
  Preference implicit=new Preference(c,new Intent(),"健康使用手机");Preference noIntent=new Preference(c,null,"健康使用手机");
  Preference minor=new Preference(c,new Intent(minors()),"健康使用手机");
  Preference wrongPkg=new Preference(c,new Intent(new ComponentName("example.other",EntryVisibilityPolicy.HEALTHY_USE_ACTIVITY)),"健康使用手机");
  Preference originalHidden=new Preference(c,new Intent(health()),"native hidden");originalHidden.nativeVisible=false;
  Preference broken=new Preference(c,new Intent(health()),"unreadable");broken.failIntent=true;
  check(exact.isVisible(),"default off native visible");Handler.drain();check(FeatureSettings.listeners.size()==1,"one settings listener");
  FeatureSettings.change(SK,true);check(!exact.isVisible()&&!exact.lastVisible&&exact.refreshes>0,"enable refreshes already observed exact Preference");
  for(Preference retained:new Preference[]{renamed,implicit,noIntent,minor,wrongPkg,broken})check(retained.isVisible(),"unverified entry retained regardless of displayed label");
  check(!originalHidden.isVisible(),"native hidden entry stays hidden");
  int refresh=exact.refreshes;FeatureSettings.change(SK,false);
  check(exact.refreshes==refresh+1&&exact.lastVisible&&exact.isVisible(),"disable refreshes and restores native result");
  check(!originalHidden.isVisible()&&!originalHidden.nativeVisible,"native false result never overwritten");
  for(int i=0;i<50;i++)exact.isVisible();check(FeatureSettings.listeners.size()==1,"repeat visibility probes do not duplicate listener");
  FeatureSettings.change(SK,true);exact.setIntent(new Intent(minors()));check(exact.isVisible(),"Preference retargeted to another activity is not hidden");
  exact.setIntent(new Intent(health()));check(!exact.isVisible(),"same Preference re-evaluates its current explicit component");
  refresh=exact.refreshes;FeatureSettings.change(LK,true);check(exact.refreshes==refresh,"launcher switch independent of settings");
  android.app.Activity activity=new android.app.Activity(S);activity.resume();Handler.drain();check(activity.resumes==1,"native resume runs once");
  check(!FeatureSettings.diagnostics.isEmpty(),"runtime state diagnosed");
  FeatureSettings.change(SK,false);check(exact.isVisible()&&m.errors.isEmpty()&&Handler.pending()==0,"settings restores cleanly");
  PreferenceScreen home=new PreferenceScreen(c);home.add(new Preference(c,null,"魔方AI+"));
  home.add(new Preference(c,null,"散热风扇"));home.add(new Preference(c,null,"炫彩灯效"));home.add(new Preference(c,null,"实用辅助"));
  Preference listenerRow=new Preference(c,null,"健康使用手机");home.add(listenerRow);
  Preference unresolved=new Preference(c,new Intent(),"健康使用手机");home.add(unresolved);
  Preference differentTarget=new Preference(c,new Intent(minors()),"健康使用手机");home.add(differentTarget);
  Preference hiddenHome=new Preference(c,null,"健康使用手机");hiddenHome.nativeVisible=false;home.add(hiddenHome);
  Preference substring=new Preference(c,null,"健康使用手机设置");home.add(substring);
  Preference foreign=new Preference(new Context("example.other"),null,"健康使用手机");home.add(foreign);
  check(listenerRow.isVisible()&&unresolved.isVisible(),"new homepage rows transparent when off");Handler.drain();
  FeatureSettings.change(SK,true);
  check(!listenerRow.isVisible()&&!listenerRow.lastVisible&&listenerRow.refreshes>0,"no-Intent listener/fragment homepage row hidden and refreshed");
  check(!unresolved.isVisible(),"unresolved implicit row can use verified homepage structure");
  check(differentTarget.isVisible(),"explicit non-target component wins over exact homepage title");
  check(substring.isVisible()&&foreign.isVisible(),"substring title and foreign context preserved");
  check(!hiddenHome.isVisible(),"already hidden homepage remains hidden");
  Preference sameTitleSubpage=new Preference(c,null,"健康使用手机");PreferenceScreen subpage=new PreferenceScreen(c);
  subpage.add(sameTitleSubpage);subpage.add(new Preference(c,null,"使用时间"));
  check(sameTitleSubpage.isVisible(),"same-title subpage lacks homepage anchors and remains visible");
  PreferenceCategory nested=new PreferenceCategory(c);home.add(nested);Preference nestedRow=new Preference(c,null,"健康使用手机");nested.add(nestedRow);
  check(!nestedRow.isVisible(),"ordinary category can reach its containing homepage's anchors");
  home.add(subpage);
  check(sameTitleSubpage.isVisible(),"connected nested screen cannot borrow outer homepage anchors");
  PreferenceCategory subcategory=new PreferenceCategory(c);subpage.add(subcategory);Preference insideCategory=new Preference(c,null,"健康使用手机");subcategory.add(insideCategory);
  check(insideCategory.isVisible(),"nested category stops at its own screen boundary before homepage anchors");
  PreferenceScreen derivedScreen=new PreferenceScreen(c){};home.add(derivedScreen);Preference derivedChild=new Preference(c,null,"健康使用手机");derivedScreen.add(derivedChild);
  check(derivedChild.isVisible(),"OEM subclass of PreferenceScreen preserves the same page boundary");
  subpage.add(new Preference(c,null,"散热风扇"));
  check(sameTitleSubpage.isVisible(),"one local anchor cannot combine with anchors beyond screen boundary");
  subpage.add(new Preference(c,null,"炫彩灯效"));
  check(!sameTitleSubpage.isVisible(),"nearest screen may qualify only with its own independent anchor set");
  subpage.children.remove(subpage.children.size()-1);subpage.children.remove(subpage.children.size()-1);
  Intent implicitTarget=new Intent();implicitTarget.resolved=health();Preference resolvedHealth=new Preference(c,implicitTarget,"健康使用手机");
  check(!resolvedHealth.isVisible(),"implicit Intent resolving to verified target works independently of homepage");
  Intent implicitWrong=new Intent();implicitWrong.resolved=minors();Preference resolvedOther=new Preference(c,implicitWrong,"健康使用手机");home.add(resolvedOther);
  check(resolvedOther.isVisible(),"resolved non-target component wins over homepage title");
  Intent brokenResolve=new Intent();brokenResolve.failResolve=true;Preference unavailable=new Preference(c,brokenResolve,"健康使用手机");
  check(unavailable.isVisible(),"resolution failure without confirmed scope stays visible");home.add(unavailable);
  check(!unavailable.isVisible(),"resolution failure can still use independently confirmed homepage scope");
  listenerRow.title="其他入口";check(listenerRow.isVisible(),"retitled Preference no longer hidden");listenerRow.title="健康使用手机";
  check(!listenerRow.isVisible(),"restored exact title evaluated again");listenerRow.setIntent(new Intent(minors()));
  check(listenerRow.isVisible(),"listener row retargeted to non-target stops filtering");listenerRow.setIntent(null);
  FeatureSettings.change(SK,false);
  check(listenerRow.isVisible()&&listenerRow.lastVisible&&unresolved.isVisible(),"disable restores homepage row without changing native visibility");
  check(!hiddenHome.isVisible()&&!hiddenHome.nativeVisible,"off retains native false for homepage row");
  FeatureSettings.change(SK,true);listenerRow.parent=subpage;
  check(listenerRow.isVisible(),"moving a previously matched row into a subpage releases filtering immediately");listenerRow.parent=home;
  check(!listenerRow.isVisible(),"moving back into verified homepage reevaluates structural evidence");
  listenerRow.nativeVisible=false;FeatureSettings.change(SK,false);
  check(!listenerRow.isVisible()&&!listenerRow.lastVisible,"disable respects a later native visibility change");listenerRow.nativeVisible=true;
  PreferenceGroup duplicateGroup=new PreferenceGroup(c);Preference duplicateRow=new Preference(c,null,"健康使用手机");
  duplicateGroup.add(duplicateRow);duplicateGroup.add(new Preference(c,null,"散热风扇"));duplicateGroup.add(new Preference(c,null,"散热风扇"));
  FeatureSettings.change(SK,true);check(duplicateRow.isVisible(),"duplicate labels do not prove homepage scope");
  PreferenceGroup cycle=new PreferenceGroup(c);Preference cyclicRow=new Preference(c,null,"健康使用手机");cycle.add(cyclicRow);cycle.parent=cycle;
  check(cyclicRow.isVisible(),"malformed cyclic hierarchy fails open without looping");
  PreferenceGroup huge=new PreferenceGroup(c);Preference hugeRow=new Preference(c,null,"健康使用手机");huge.add(hugeRow);
  for(int i=0;i<130;i++)huge.add(new Preference(c,null,i==0?"散热风扇":"炫彩灯效"));
  check(hugeRow.isVisible(),"unbounded unexpected group is not traversed on UI thread");
  FeatureSettings.change(SK,false);check(listenerRow.isVisible(),"native row restores after repeated structural and visibility changes");
  check(m.errors.isEmpty()&&Handler.pending()==0,"homepage refresh drained without errors");
 }
 static void settingsUnknownScreen(){
  FeatureSettings.current=new Context(S);Context c=FeatureSettings.current;AugmentModule m=new AugmentModule();AugmentModule.active=m;
  ClassLoader unknownFramework=new ClassLoader(TestEntryVisibilityRuntime.class.getClassLoader()){
   protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{
    if(name.equals("androidx.preference.PreferenceScreen"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
  check(EntryVisibilityHook.install(m,unknownFramework,S)==2,"explicit adapter still installs when page boundary class is unavailable");
  PreferenceGroup home=new PreferenceGroup(c);Preference titleOnly=new Preference(c,null,"健康使用手机");home.add(titleOnly);
  home.add(new Preference(c,null,"散热风扇"));home.add(new Preference(c,null,"炫彩灯效"));
  Preference exact=new Preference(c,new Intent(health()),"localized target");check(exact.isVisible(),"unknown screen shape keeps default-off native result");Handler.drain();
  FeatureSettings.change(SK,true);check(!exact.isVisible(),"exact component does not depend on optional homepage shape");
  check(titleOnly.isVisible(),"unknown screen boundary disables title fallback conservatively");
  check(m.errors.size()==1&&m.errors.get(0).startsWith("ENTRY_SETTINGS_HOME_SHAPE_UNAVAILABLE"),"unsupported screen shape diagnosed once");
  FeatureSettings.change(SK,false);check(exact.isVisible()&&Handler.pending()==0,"explicit component restores without pending loop");
 }
 public static void main(String[] args)throws Exception {if(args[0].equals("launcher"))launcher();else if(args[0].equals("settings"))settings();else settingsUnknownScreen();
  System.out.println("PASS production entry visibility "+args[0]+": "+checks+" checks");}
}
""",
}

for name in ("EnhancementOption.java", "EntryVisibilityOptions.java", "EntryVisibilityPolicy.java",
             "hook/EntryVisibilityHook.java"):
    files["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")

with tempfile.TemporaryDirectory(prefix="lsa-entry-visibility-") as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        sources.append(str(path))
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", temp, *sources], check=True)
    for target in ("launcher", "settings", "settings-unknown-screen"):
        subprocess.run(["java", "-cp", temp, "ls.augment.com.hook.TestEntryVisibilityRuntime", target], check=True)
