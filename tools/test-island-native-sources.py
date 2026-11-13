"""Execute native source lifecycle and stale-action rejection against framework doubles."""
import ast, os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-native-island-takeover.py').read_text(encoding='utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets))
F={'ls/augment/com/hook/AugmentModule.java':base['ls/augment/com/hook/AugmentModule.java']}
F.update({
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}',
'android/os/Process.java':'package android.os;public class Process{public static int myUid(){return 1000;}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler{public static Map<Runnable,Long> tasks=new LinkedHashMap<>();public Handler(Looper l){}public void post(Runnable r){tasks.put(r,SystemClock.now);}public void postDelayed(Runnable r,long d){tasks.put(r,SystemClock.now+d);}public void removeCallbacks(Runnable r){tasks.remove(r);}public static void drain(){int count=0;while(true){Runnable ready=null;for(var e:tasks.entrySet())if(e.getValue()<=SystemClock.now){ready=e.getKey();break;}if(ready==null)return;if(count++>100)throw new AssertionError("loop");tasks.remove(ready);ready.run();}}}''',
'android/content/Context.java':'''package android.content;public class Context{public android.content.res.Resources r=new android.content.res.Resources();public android.content.pm.PackageManager pm=new android.content.pm.PackageManager(r);public android.content.res.Resources getResources(){return r;}public String getString(int id){return "Native headset";}public android.graphics.drawable.Drawable getDrawable(int id){return new android.graphics.drawable.Drawable();}public android.content.pm.PackageManager getPackageManager(){return pm;}public Object getContentResolver(){return this;}}''',
'android/content/res/Resources.java':'''package android.content.res;import java.util.*;public class Resources{public Map<String,Integer> ids=new HashMap<>();public int getIdentifier(String n,String t,String p){return ids.getOrDefault(n,0);}}''',
'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager{public boolean missing;public android.content.res.Resources r;public PackageManager(android.content.res.Resources r){this.r=r;}public android.content.res.Resources getResourcesForApplication(String p)throws Exception{if(missing)throw new Exception("missing");return r;}public android.graphics.drawable.Drawable getApplicationIcon(String p){return new android.graphics.drawable.Drawable();}}''',
'android/graphics/drawable/Drawable.java':'package android.graphics.drawable;public class Drawable{}',
'android/provider/Settings.java':'package android.provider;public class Settings{public static class Global{public static int state;public static int getInt(Object r,String k,int d){return state;}}}',
'android/view/ViewParent.java':'package android.view;public interface ViewParent{}',
'android/view/View.java':'''package android.view;import java.util.*;public class View implements ViewParent{public static final int VISIBLE=0;public int visibility,clicks;public boolean enabled=true,clickable=true;public ViewParent parent;public Map<Integer,View> children=new HashMap<>();public View findViewById(int id){return children.get(id);}public int getVisibility(){return visibility;}public ViewParent getParent(){return parent;}public boolean isEnabled(){return enabled;}public boolean hasOnClickListeners(){return clickable;}public boolean performClick(){clicks++;return true;}}''',
'android/widget/FrameLayout.java':'package android.widget;public class FrameLayout extends android.view.View{public FrameLayout(android.content.Context c){}}',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View{public String text="";public CharSequence getText(){return text;}}',
'android/widget/RemoteViews.java':'''package android.widget;public class RemoteViews{public String pkg="com.android.ztescreenshot";public int layout=5;public android.view.View root=new android.view.View();public String getPackage(){return pkg;}public int getLayoutId(){return layout;}public android.view.View apply(android.content.Context c,FrameLayout p){return root;}}''',
'android/app/Notification.java':'package android.app;public class Notification{public static final int FLAG_FOREGROUND_SERVICE=64;public int flags=64;public String channel="record";public android.widget.RemoteViews contentView=new android.widget.RemoteViews();public String getChannelId(){return channel;}}',
'android/app/NotificationManager.java':'package android.app;public class NotificationManager{public static final int IMPORTANCE_LOW=2;}',
'android/service/notification/StatusBarNotification.java':'''package android.service.notification;public class StatusBarNotification{public String pkg="com.android.ztescreenshot",key="record";public int user,uid=1000,revision=1;public android.app.Notification n=new android.app.Notification();public String getPackageName(){return pkg;}public int getUserId(){return user;}public int getUid(){return uid;}public String getKey(){return key;}public android.app.Notification getNotification(){return n;}}''',
'android/service/notification/NotificationListenerService.java':'''package android.service.notification;public class NotificationListenerService{public StatusBarNotification[] active;public RankingMap ranking=new RankingMap();public StatusBarNotification[] getActiveNotifications(){return active;}public StatusBarNotification[] getActiveNotifications(String[] keys){return active;}public RankingMap getCurrentRanking(){return ranking;}public static class Ranking{public boolean suspended,filter=true;public int importance=2;public boolean isSuspended(){return suspended;}public boolean matchesInterruptionFilter(){return filter;}public int getImportance(){return importance;}}public static class RankingMap{public boolean exists=true,suspended,filter=true;public int importance=2;public boolean getRanking(String key,Ranking r){r.suspended=suspended;r.filter=filter;r.importance=importance;return exists;}}}''',
'ls/augment/com/SourceTestMarker.java':'package ls.augment.com;public class SourceTestMarker{}',
'ls/augment/com/hook/SystemUiAdapter.java':'package ls.augment.com.hook;class SystemUiAdapter{}',
'ls/augment/com/hook/FeatureRuntimeLog.java':'package ls.augment.com.hook;class FeatureRuntimeLog{static void event(String a,String b){}}',
'ls/augment/com/hook/IslandSceneSelection.java':'package ls.augment.com.hook;import java.util.*;class IslandSceneSelection{static Set<String> disabled=new HashSet<>();static boolean enabled(android.content.Context c,String s){return !disabled.contains(s);}}',
'ls/augment/com/hook/IslandHeadsUpBridge.java':'package ls.augment.com.hook;class IslandHeadsUpBridge{static Object revision(android.service.notification.StatusBarNotification n){return n.key+":"+n.revision;}static boolean same(android.service.notification.StatusBarNotification a,android.service.notification.StatusBarNotification b){return revision(a).equals(revision(b));}}',
'ls/augment/com/hook/MagicIslandScenes.java':'''package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{static Method exact(Class<?> type,String n,Class<?> r,Class<?>...a)throws Exception{for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(n,a);if(m.getReturnType()!=r)throw new NoSuchMethodException(n);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(n);}}''',
'com/android/systemui/statusbar/policy/FlashlightController.java':'''package com.android.systemui.statusbar.policy;public interface FlashlightController{interface FlashlightListener{void onFlashlightChanged(boolean on);}}''',
'com/android/systemui/statusbar/policy/FlashlightControllerImpl.java':'''package com.android.systemui.statusbar.policy;import java.util.*;public class FlashlightControllerImpl implements FlashlightController{public boolean enabled,available=true;public int off;public List<FlashlightListener> listeners=new ArrayList<>();public boolean isEnabled(){return enabled;}public boolean isAvailable(){return available;}public void setFlashlight(boolean on){enabled=on;off++;for(var l:listeners)l.onFlashlightChanged(on);}public void addCallback(FlashlightListener l){listeners.add(l);}public void removeCallback(FlashlightListener l){listeners.remove(l);}}''',
'com/android/systemui/Dependency.java':'package com.android.systemui;public class Dependency{public static Object torch;public static Object get(Class<?> c){return torch;}}',
'com/android/settingslib/bluetooth/CachedBluetoothDevice.java':'package com.android.settingslib.bluetooth;public class CachedBluetoothDevice{public boolean isConnected(){return true;}public String getName(){return "Headset";}}',
'com/zte/feature/dynamicisland/DisposableIslandManager.java':'''package com.zte.feature.dynamicisland;import com.android.settingslib.bluetooth.CachedBluetoothDevice;public class DisposableIslandManager{public boolean showLowBatteryIsland(boolean plugged,int level){return !plugged&&(level==10||level==20);}public void handleHeadsetIsland(int type){}public void handleBluetoothActiveDeviceChanged(CachedBluetoothDevice d,int p){}public void handleBluetoothBatteryLevelChange(CachedBluetoothDevice d,int level){}}''',
})
F['ls/augment/com/hook/TestNativeSources.java']=r'''package ls.augment.com.hook;
import android.content.*;import android.os.*;import android.view.*;import android.widget.*;import android.provider.Settings;import android.service.notification.*;import java.util.*;import java.lang.reflect.*;import com.android.systemui.statusbar.policy.*;
public class TestNativeSources{
 static int checks,user,changed;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static Object invoke(Object o,String n,Class<?>[] t,Object...args)throws Exception{Method m=o.getClass().getDeclaredMethod(n,t);m.setAccessible(true);return m.invoke(o,args);}
 static class TorchChild extends FlashlightControllerImpl{}
 public static void main(String[]args)throws Exception{
 Context c=new Context();TorchChild torch=new TorchChild();com.android.systemui.Dependency.torch=torch;
 IslandBuiltinEvents built=new IslandBuiltinEvents(c,TestNativeSources.class.getClassLoader(),()->changed++,()->user);
 check(IslandBuiltinEvents.install(new AugmentModule(),TestNativeSources.class.getClassLoader())==6,"all exact source hook contracts resolved");
 built.start();check(built.capable("torch")&&torch.listeners.size()==1,"inherited controller binds real callback");
 check(built.snapshot(0).isEmpty(),"no fabricated initial activity");torch.enabled=true;
 IslandEvent first=built.snapshot(0).get("torch");check(first!=null&&first.actions.size()==1,"actual torch enabled creates source action");
 check(built.snapshot(0).get("torch").instance==first.instance,"ongoing source instance stable");
 first.actions.get(0).run.run();Handler.drain();check(!torch.enabled&&torch.off==1&&built.snapshot(0).isEmpty(),"native off action and withdrawal");
 torch.enabled=true;torch.available=false;check(built.snapshot(0).isEmpty(),"unavailable camera torch keeps native path");torch.available=true;
 IslandSceneSelection.disabled.add("torch");check(built.snapshot(0).isEmpty(),"disabled scene emits nothing");IslandSceneSelection.disabled.clear();torch.enabled=false;
 Class<?>[] transientArgs={String.class,String.class,String.class,String.class,Object.class};
 invoke(built,"transientEvent",transientArgs,"low_power","Battery","10%","icon",new Object());
 check(built.snapshot(0).size()==1,"real threshold callback creates bounded transient");
 SystemClock.now=2599;check(built.snapshot(0).size()==1,"native transient retained within 2600ms");SystemClock.now=2600;Handler.drain();check(built.snapshot(0).isEmpty(),"transient expires without permanent polling");
 invoke(built,"transientEvent",transientArgs,"headset","Headset","Connected","icon",new Object());IslandSceneSelection.disabled.add("headset");check(built.snapshot(0).isEmpty(),"disable releases live transient");IslandSceneSelection.disabled.clear();check(built.snapshot(0).isEmpty(),"reenabling cannot revive discarded event");
 invoke(built,"transientEvent",transientArgs,"low_power","Battery","10%","icon",new Object());user=10;check(built.snapshot(10).isEmpty(),"user change releases old activity");
 built.close();check(torch.listeners.isEmpty()&&Handler.tasks.isEmpty(),"close removes source callback and expiry");
 com.android.systemui.Dependency.torch=new Object();IslandBuiltinEvents missing=new IslandBuiltinEvents(c,TestNativeSources.class.getClassLoader(),()->{},()->0);missing.start();check(!missing.capable("torch")&&missing.snapshot(0).isEmpty(),"unknown controller remains native");missing.close();
 String[] names={"notification_text","record_notification_time","start_pause_click","stop_click","notification_layout"};for(int i=0;i<names.length;i++)c.r.ids.put(names[i],i+1);
 check(NativeScreenRecordingNotice.capable(c),"exact named recorder resources accepted");c.r.ids.remove("stop_click");check(!NativeScreenRecordingNotice.capable(c),"missing source resource rejects capability");c.r.ids.put("stop_click",4);c.pm.missing=true;check(!NativeScreenRecordingNotice.capable(c),"missing source package rejected");c.pm.missing=false;
 StatusBarNotification s=new StatusBarNotification();View root=s.n.contentView.root;TextView label=new TextView(),counter=new TextView();label.text="Recording";counter.text="00:07";View pause=new View(),stop=new View();root.children.put(1,label);root.children.put(2,counter);root.children.put(3,pause);root.children.put(4,stop);pause.parent=stop.parent=root;
 NotificationListenerService listener=new NotificationListenerService();listener.active=new StatusBarNotification[]{s};Settings.Global.state=0;
 check(NativeScreenRecordingNotice.read(c,listener,0,null)==null,"stopped recording has no island");Settings.Global.state=1;
 IslandEvent record=NativeScreenRecordingNotice.read(c,listener,0,null);check(record!=null&&record.compact.equals("00:07")&&record.actions.size()==2,"original counter and actionable controls retained");
 record.actions.get(0).run.run();check(pause.clicks==1,"dispatches original RemoteViews control");
 listener.active=new StatusBarNotification[0];record.actions.get(1).run.run();check(stop.clicks==0,"removed notification invalidates old action");
 StatusBarNotification replacement=new StatusBarNotification();replacement.revision=2;listener.active=new StatusBarNotification[]{replacement};record.actions.get(1).run.run();check(stop.clicks==0,"new revision invalidates stale action");
 listener.active=new StatusBarNotification[]{s};Settings.Global.state=0;record.actions.get(0).run.run();check(pause.clicks==1,"stopped service rejects old source control");Settings.Global.state=2;
 for(int i=0;i<11;i++){
  s.user=0;s.pkg="com.android.ztescreenshot";s.n.flags=64;s.n.channel="record";s.n.contentView.pkg=s.pkg;s.n.contentView.layout=5;listener.ranking.exists=true;listener.ranking.suspended=false;listener.ranking.filter=true;listener.ranking.importance=2;label.text="Recording";
  switch(i){case 0:s.user=10;break;case 1:s.pkg="other";break;case 2:s.n.flags=0;break;case 3:s.n.channel="other";break;case 4:s.n.contentView.pkg="other";break;case 5:s.n.contentView.layout=9;break;case 6:listener.ranking.exists=false;break;case 7:listener.ranking.suspended=true;break;case 8:listener.ranking.filter=false;break;case 9:listener.ranking.importance=0;break;case 10:label.text="";}
  check(NativeScreenRecordingNotice.read(c,listener,0,null)==null,"unknown/private source rejected "+i);
 }
 label.text="Paused";counter.visibility=8;pause.enabled=false;stop.clickable=false;check(NativeScreenRecordingNotice.read(c,listener,0,null)==null,"no original actionable control falls back");
 stop.clickable=true;IslandEvent paused=NativeScreenRecordingNotice.read(c,listener,0,record);check(paused!=null&&paused.compact.equals("Paused")&&paused.actions.size()==1,"hidden count not fabricated, unavailable pause omitted");
 check(paused.instance==record.instance,"ongoing recording preserves instance across pause");root.visibility=8;check(NativeScreenRecordingNotice.read(c,listener,0,record)==null,"hidden source controls are not recreated");
 System.out.println("PASS production native source lifecycle/actions: "+checks+" checks (framework doubles)");
 }}'''
for name in ('IslandBuiltinEvents','NativeScreenRecordingNotice','IslandEvent'):
    F['ls/augment/com/hook/'+name+'.java']=(ROOT/'android/app/src/main/java/ls/augment/com/hook'/f'{name}.java').read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='duo-source-') as tmp:
    folder=Path(tmp)
    for name,source in F.items():
        p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8')
    j=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(j/'javac.exe'),'-encoding','UTF-8','-d',tmp,*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(j/'java.exe'),'-cp',tmp,'ls.augment.com.hook.TestNativeSources'],check=True)
