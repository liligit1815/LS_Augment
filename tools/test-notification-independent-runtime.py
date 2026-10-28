"""Exercise the actual hook/bridge against notification pipeline doubles, not Android rendering."""
from pathlib import Path
import subprocess, tempfile, zipfile
from notification_view_runtime_facade import FILES

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
B='com/android/systemui/statusbar/notification/collection/'
files={k:FILES[k] for k in ['android/os/Handler.java','android/os/Looper.java',
 'io/github/libxposed/api/XposedInterface.java','ls/augment/com/hook/AugmentModule.java',
 'android/content/res/Configuration.java','android/content/res/Resources.java','android/util/DisplayMetrics.java']}
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace(
 'target.getClass().getDeclaredMethod(name,types)','lookup(target.getClass(),name,types)').replace(
 'public static Object invoke(','''public android.content.pm.ApplicationInfo getModuleApplicationInfo(){return new android.content.pm.ApplicationInfo();}
 static Method lookup(Class<?> c,String n,Class<?>[] p)throws Exception{for(;c!=null;c=c.getSuperclass())try{return c.getDeclaredMethod(n,p);}catch(NoSuchMethodException e){}throw new NoSuchMethodException(n);}
 public static Object invoke(''')
files.update({
'android/content/pm/ApplicationInfo.java':'''package android.content.pm;public class ApplicationInfo{public String packageName="ls.augment.com",sourceDir=System.getProperty("bridge.path");}''',
'android/content/ComponentCallbacks.java':'''package android.content;public interface ComponentCallbacks{void onConfigurationChanged(android.content.res.Configuration c);void onLowMemory();}''',
'android/content/Context.java':'''package android.content;public class Context{
 public final android.content.res.Resources resources=new android.content.res.Resources();public final java.util.List<ComponentCallbacks> callbacks=new java.util.ArrayList<>();
 public Context getApplicationContext(){return this;}public android.content.res.Resources getResources(){return resources;}
 public void registerComponentCallbacks(ComponentCallbacks c){callbacks.add(c);}public void unregisterComponentCallbacks(ComponentCallbacks c){callbacks.remove(c);}
 public void rotate(int orientation){resources.configuration.orientation=orientation;for(var c:callbacks)c.onConfigurationChanged(resources.configuration);}}
''',
'dalvik/system/DexClassLoader.java':'''package dalvik.system;public class DexClassLoader extends java.net.URLClassLoader{
 public DexClassLoader(String path,String o,String n,ClassLoader parent){super(urls(path),parent);}
 static java.net.URL[] urls(String p){try{return new java.net.URL[]{new java.io.File(p).toURI().toURL()};}catch(java.net.MalformedURLException e){throw new IllegalArgumentException(e);}}
 @Override public Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{if(!name.equals("ls.augment.com.IndependentNotificationPromoter"))return super.loadClass(name,resolve);Class<?> c=findLoadedClass(name);if(c==null)c=findClass(name);if(resolve)resolveClass(c);return c;}}
''',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{
 public static final android.content.Context context=new android.content.Context();public static final java.util.Map<String,String> values=new java.util.HashMap<>(),reports=new java.util.HashMap<>();
 public static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();public static android.content.Context from(Object o){return context;}
 public static boolean enabled(android.content.Context c,String k){return enabled(c,k,false);}public static boolean enabled(android.content.Context c,String k,boolean d){return values.containsKey(k)?"1".equals(values.get(k)):d;}
 public static boolean addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);return true;}public static void diagnostic(android.content.Context c,String k,String v){reports.put(k,v);}
 public static void flag(String k,boolean v){values.put(k,v?"1":"0");for(var r:listeners)r.run();}}
''',
'ls/augment/com/SystemUiOptions.java':'''package ls.augment.com;public class SystemUiOptions{public static final String NOTIFICATION_STACK="stack";}''',
'ls/augment/com/NotificationAppearanceOptions.java':'''package ls.augment.com;public class NotificationAppearanceOptions{public static final String STACK_LOCK="lock",STACK_SHADE="shade",STACK_LANDSCAPE="landscape";}''',
'com/android/systemui/plugins/statusbar/StatusBarStateController.java':'''package com.android.systemui.plugins.statusbar;public interface StatusBarStateController{
 int getState();boolean isDozing();interface StateListener{default void onStateChanged(int state){}default void onDozingChanged(boolean state){}}}
''',
'com/android/systemui/State.java':'''package com.android.systemui;public class State implements com.android.systemui.plugins.statusbar.StatusBarStateController{
 public int state;public boolean doze;public final java.util.List<StateListener> listeners=new java.util.ArrayList<>();public int getState(){return state;}public boolean isDozing(){return doze;}
 public void addCallback(StateListener l){listeners.add(l);}public void removeCallback(StateListener l){listeners.remove(l);}
 public void state(int s){state=s;for(var l:listeners)l.onStateChanged(s);}public void doze(boolean d){doze=d;for(var l:listeners)l.onDozingChanged(d);}}
''',
'com/android/systemui/Dependency.java':'''package com.android.systemui;public class Dependency{public static final State state=new State();public static Object get(Class<?> c){return state;}}''',
B+'listbuilder/pluggable/Pluggable.java':'''package com.android.systemui.statusbar.notification.collection.listbuilder.pluggable;public abstract class Pluggable<T>{
 public Runnable listener;public Pluggable(String name){}public final void invalidateList(String reason){if(listener!=null)listener.run();}}
''',
B+'listbuilder/pluggable/NotifPromoter.java':'''package com.android.systemui.statusbar.notification.collection.listbuilder.pluggable;public abstract class NotifPromoter extends Pluggable<NotifPromoter>{
 public NotifPromoter(String name){super(name);}public abstract boolean shouldPromoteToTopLevel(com.android.systemui.statusbar.notification.collection.NotificationEntry entry);}
''',
B+'PipelineEntry.java':'''package com.android.systemui.statusbar.notification.collection;public class PipelineEntry{public PipelineEntry parent;public PipelineEntry getParent(){return parent;}}''',
B+'NotificationEntry.java':'''package com.android.systemui.statusbar.notification.collection;public class NotificationEntry extends PipelineEntry{
 public final String key,group;public final boolean summary;public boolean secret;public int clicked,replied;public Object promotion;
 public NotificationEntry(String k,String g,boolean s){key=k;group=g;summary=s;}public void click(){clicked++;}public void reply(){replied++;}}
''',
B+'GroupEntry.java':'''package com.android.systemui.statusbar.notification.collection;public class GroupEntry extends PipelineEntry{
 public static final GroupEntry ROOT_ENTRY=new GroupEntry("ROOT");public final String key;public NotificationEntry summary;public final java.util.List<NotificationEntry> children=new java.util.ArrayList<>();
 public GroupEntry(String k){key=k;}public NotificationEntry getSummary(){return summary;}public java.util.List<NotificationEntry> getChildren(){return children;}}
''',
B+'BundleEntry.java':'''package com.android.systemui.statusbar.notification.collection;public class BundleEntry extends PipelineEntry{public final java.util.List<PipelineEntry> children=new java.util.ArrayList<>();public java.util.List<PipelineEntry> getChildren(){return children;}}''',
B+'ShadeListBuilder.java':'''package com.android.systemui.statusbar.notification.collection;
import java.util.*;import ls.augment.com.hook.AugmentModule;import com.android.systemui.statusbar.notification.collection.listbuilder.pluggable.NotifPromoter;
public class ShadeListBuilder{
 public final List<NotificationEntry> all=new ArrayList<>();public final List<PipelineEntry> shown=new ArrayList<>();public final List<NotifPromoter> promoters=new ArrayList<>();
 public int invalidations,builds;public boolean idle=true,blocked,failNative;public final BundleEntry bundle=new BundleEntry();
 public void addPromoter(NotifPromoter p){if(!idle)throw new IllegalStateException("registration must be idle");promoters.add(p);p.listener=()->{invalidations++;buildList();};}
 public void buildList(){AugmentModule.invoke(this,"buildList",new Class<?>[]{});}
 public void native_buildList(){if(blocked)return;if(failNative)throw new IllegalArgumentException("native failure");idle=false;builds++;shown.clear();bundle.children.clear();
  Map<String,GroupEntry> groups=new LinkedHashMap<>();for(NotificationEntry n:all){n.promotion=null;n.parent=GroupEntry.ROOT_ENTRY;if(n.group==null){shown.add(n);continue;}GroupEntry g=groups.computeIfAbsent(n.group,GroupEntry::new);n.parent=g;if(n.summary)g.summary=n;else g.children.add(n);}
  for(GroupEntry g:groups.values()){g.parent=GroupEntry.ROOT_ENTRY;if(g.children.isEmpty()){if(g.summary!=null){g.summary.parent=GroupEntry.ROOT_ENTRY;shown.add(g.summary);}}else if(g.summary==null||g.children.size()<2){for(var n:g.children){n.parent=GroupEntry.ROOT_ENTRY;shown.add(n);}}else shown.add(g);}
  bundleStage();promoteNotifs(shown);pruneIncompleteGroups(shown);shown.removeIf(n->n instanceof NotificationEntry&&((NotificationEntry)n).secret);idle=true;}
 public void bundleStage(){} // MODERN
 public void promoteNotifs(List list){for(PipelineEntry p:new ArrayList<>(shown))if(p instanceof GroupEntry){GroupEntry g=(GroupEntry)p;for(NotificationEntry n:new ArrayList<>(g.children))if(applyTopLevelPromoters(n)){g.children.remove(n);n.parent=GroupEntry.ROOT_ENTRY;shown.add(n);}}}
 public boolean applyTopLevelPromoters(NotificationEntry e){e.promotion=findPromoter(e);return e.promotion!=null;}
 public NotifPromoter findPromoter(NotificationEntry e){for(NotifPromoter p:promoters)if(p.shouldPromoteToTopLevel(e))return p;return null;}
 public void addGroupsWithChildrenLostToPromotion(List list,Set keys){for(Object item:list)if(item instanceof NotificationEntry&&((NotificationEntry)item).promotion!=null)keys.add(((NotificationEntry)item).group);}
 public void pruneIncompleteGroups(List list){Set<String> promoted=new HashSet<>();addGroupsWithChildrenLostToPromotion(list,promoted);list.removeIf(e->e instanceof GroupEntry&&((GroupEntry)e).children.isEmpty()&&promoted.contains(((GroupEntry)e).key));}
 public void dismiss(NotificationEntry e){all.remove(e);buildList();}
}
''',
'ls/augment/com/hook/TestIndependent.java':'''package ls.augment.com.hook;
import com.android.systemui.*;import com.android.systemui.statusbar.notification.collection.*;import ls.augment.com.*;import android.os.Handler;
public class TestIndependent{
 static int checks;static void check(boolean v,String message){checks++;if(!v)throw new AssertionError(message);}
 static void flag(String key,boolean value){FeatureSettings.flag(key,value);Handler.drain();}
 public static class SubBuilder extends ShadeListBuilder{}
 public static class SubEntry extends NotificationEntry{SubEntry(String k,String g,boolean s){super(k,g,s);}}
 public static void main(String[] args){AugmentModule m=new AugmentModule();AugmentModule.active=m;
  boolean modern=args[0].equals("modern"),partial=args[0].equals("partial");if(partial)m.failAt=2;
  int hooks=NotificationIndependentHook.install(m,TestIndependent.class.getClassLoader());
  if(args[0].equals("missing")||args[0].equals("wrong")||partial){check(hooks==0,"reject incomplete interface");check(m.hooks.isEmpty(),"partial registration rolled back");System.out.println(args[0]+" "+checks+" checks");return;}
  check(hooks==(modern?3:1),"capability route");ShadeListBuilder b=new SubBuilder();
  NotificationEntry summary=new NotificationEntry("summary","u0:appA:g",true),a=new SubEntry("A1","u0:appA:g",false),a2=new NotificationEntry("A2","u0:appA:g",false),secret=new NotificationEntry("A3","u0:appA:g",false);
  secret.secret=true;NotificationEntry only=new NotificationEntry("only-summary","u1:appA:g",true),plain=new NotificationEntry("plain",null,false);
  b.all.addAll(java.util.List.of(summary,a,a2,secret,only,plain));b.buildList();check(b.promoters.size()==1,"register once");check(b.shown.stream().anyMatch(n->n instanceof GroupEntry||n instanceof BundleEntry),"off remains native");
  flag(SystemUiOptions.NOTIFICATION_STACK,true);check(b.shown.contains(a)&&b.shown.contains(a2),"real children independent");check(!b.shown.contains(summary),"no duplicate summary");check(!b.shown.contains(secret),"late privacy filter still applies");check(b.shown.contains(only),"summary without children retained");check(b.shown.contains(plain),"ungrouped entry retained");
  check(a.getParent()==GroupEntry.ROOT_ENTRY&&a2.getParent()==GroupEntry.ROOT_ENTRY,"native parent bookkeeping");check(b.all.size()==6&&a.group.equals("u0:appA:g"),"source records unchanged");check(a.promotion!=null,"native promotion provenance");check(b.bundle.children.isEmpty(),"no secondary bundle");
  a.click();a.reply();check(a.clicked==1&&a.replied==1&&a2.clicked==0,"original actions stay on original entry");
  for(int i=0;i<10;i++)b.buildList();check(b.promoters.size()==1,"no duplicate registration");check(b.shown.size()==4,"no duplicate entries");
  NotificationEntry updated=new NotificationEntry("A2","u0:appA:g",false);b.all.set(b.all.indexOf(a2),updated);b.buildList();check(b.shown.contains(updated)&&!b.shown.contains(a2),"update replaces exact entry");
  b.dismiss(a);check(!b.all.contains(a)&&b.all.contains(updated)&&b.all.contains(summary),"single dismissal never cancels group");
  b.all.add(a);b.buildList();flag(SystemUiOptions.NOTIFICATION_STACK,false);check(b.shown.stream().anyMatch(n->n instanceof GroupEntry||n instanceof BundleEntry),"off restores native grouping");check(b.all.size()==6,"restore loses no notification");
  flag(SystemUiOptions.NOTIFICATION_STACK,true);flag(NotificationAppearanceOptions.STACK_LOCK,false);Dependency.state.state(1);Handler.drain();check(b.shown.stream().anyMatch(n->n instanceof GroupEntry||n instanceof BundleEntry),"lock off independent of shade");
  Dependency.state.state(2);Handler.drain();check(b.shown.contains(a),"shade locked matches AmbientState shade semantics");Dependency.state.state(0);Handler.drain();check(b.shown.contains(a),"shade restored");Dependency.state.doze(true);Handler.drain();check(!b.shown.contains(a),"doze native");Dependency.state.doze(false);Handler.drain();check(b.shown.contains(a),"wake independent");
  FeatureSettings.context.rotate(2);Handler.drain();check(!b.shown.contains(a),"landscape disabled");flag(NotificationAppearanceOptions.STACK_LANDSCAPE,true);check(b.shown.contains(a),"landscape enabled");
  flag(NotificationAppearanceOptions.STACK_SHADE,false);check(!b.shown.contains(a),"shade switch native");flag(NotificationAppearanceOptions.STACK_SHADE,true);check(b.shown.contains(a),"shade switch restores children");
  b.blocked=true;flag(SystemUiOptions.NOTIFICATION_STACK,false);check(b.shown.contains(a),"native stability delay respected");b.blocked=false;b.buildList();check(!b.shown.contains(a),"native rebuild restores after stability");
  b.failNative=true;try{b.buildList();throw new AssertionError("expected native exception");}catch(IllegalArgumentException expected){}b.failNative=false;flag(SystemUiOptions.NOTIFICATION_STACK,true);b.buildList();check(b.shown.contains(a),"native exception does not leak active frame");
  check(FeatureSettings.context.callbacks.size()==1&&Dependency.state.listeners.size()==1,"one lifecycle listener");check(m.errors==0,"no callback errors");
  System.out.println(args[0]+" "+checks+" checks; "+FeatureSettings.reports);
 }
}
'''})
modern='''public void bundleStage(){java.util.List<PipelineEntry> out=new java.util.ArrayList<>();bundleNotifs(shown,out);shown.clear();shown.addAll(out);}
 public void bundleNotifs(java.util.List a,java.util.List b){AugmentModule.invoke(this,"bundleNotifs",new Class<?>[]{java.util.List.class,java.util.List.class},a,b);}
 public void native_bundleNotifs(java.util.List a,java.util.List b){for(Object raw:a){PipelineEntry e=(PipelineEntry)raw;BundleEntry target=getBundleEntry("social");if(target==null)b.add(e);else{target.children.add(e);e.parent=target;}}if(!bundle.children.isEmpty())b.add(bundle);}
 public BundleEntry getBundleEntry(String id){return (BundleEntry)AugmentModule.invoke(this,"getBundleEntry",new Class<?>[]{String.class},id);}public BundleEntry native_getBundleEntry(String id){return bundle;}
'''
for variant in ['legacy','modern','missing','wrong','partial']:
 current=dict(files)
 if variant in ['modern','wrong','partial']:
  current[B+'ShadeListBuilder.java']=current[B+'ShadeListBuilder.java'].replace('public void bundleStage(){} // MODERN',modern)
 if variant=='missing':current[B+'ShadeListBuilder.java']=current[B+'ShadeListBuilder.java'].replace('addGroupsWithChildrenLostToPromotion','unrelatedPromotion')
 if variant=='wrong':current[B+'ShadeListBuilder.java']=current[B+'ShadeListBuilder.java'].replace('public BundleEntry getBundleEntry','public PipelineEntry getBundleEntry').replace('BundleEntry target=getBundleEntry','BundleEntry target=(BundleEntry)getBundleEntry')
 with tempfile.TemporaryDirectory(prefix='duo-independent-') as folder:
  work=Path(folder);paths=[]
  for name,source in current.items():
   p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');paths.append(p)
  paths += [SRC/name for name in ['IndependentNotificationPromoter.java','hook/NotificationIndependentHook.java','hook/NotificationStackGate.java','hook/HookCompatibility.java']]
  subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',folder,*map(str,paths)],check=True)
  bridge=work/'bridge.jar'
  with zipfile.ZipFile(bridge,'w') as z:z.write(work/'ls/augment/com/IndependentNotificationPromoter.class','ls/augment/com/IndependentNotificationPromoter.class')
  subprocess.run([str(JAVA/'java.exe'),'-Dbridge.path='+str(bridge),'-cp',folder,'ls.augment.com.hook.TestIndependent',variant],check=True)
