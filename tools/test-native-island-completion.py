"""Run the production countdown bridge and scene gates without a phone or timer side effects."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/net/Uri.java': '''package android.net;public final class Uri {
 private final String value;private Uri(String s){value=s;}public static Uri parse(String s){return new Uri(s);}
 public String toString(){return value;}}''',
    'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
 public final List<Runnable> queue=new ArrayList<>();public void post(Runnable r){queue.add(r);}
 public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);}public void drain(){int guard=0;
 while(!queue.isEmpty()){if(++guard>30)throw new AssertionError("callback loop");queue.remove(0).run();}}}''',
    'android/os/UserManager.java': '''package android.os;public class UserManager {public boolean unlocked=true;public boolean isUserUnlocked(){return unlocked;}}''',
    'android/database/ContentObserver.java': '''package android.database;import android.os.Handler;public class ContentObserver {
 public ContentObserver(Handler h){}public void onChange(boolean selfChange){}}''',
    'android/database/Cursor.java': '''package android.database;public class Cursor implements AutoCloseable {
 public String value;public boolean row=true,column=true,closed;public Cursor(String v){value=v;}
 public boolean moveToFirst(){return row;}public int getColumnIndex(String s){return column?0:-1;}
 public boolean isNull(int c){return value==null;}public String getString(int c){return value;}public void close(){closed=true;}}''',
    'android/content/ComponentName.java': '''package android.content;public class ComponentName {
 public final String pkg,name;public ComponentName(String p,String n){pkg=p;name=n;}}''',
    'android/content/Intent.java': '''package android.content;public class Intent {public String action,pkg;
 public Intent(String s){action=s;}public Intent setPackage(String p){pkg=p;return this;}}''',
    'android/content/pm/ApplicationInfo.java': '''package android.content.pm;public class ApplicationInfo {public boolean enabled=true;}''',
    'android/content/pm/ServiceInfo.java': '''package android.content.pm;public class ServiceInfo {
 public boolean enabled=true,exported=true;public String packageName="zte.com.cn.alarmclock",name="zte.com.cn.timer.CountdownNotificationService",permission;
 public ApplicationInfo applicationInfo=new ApplicationInfo();}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;import android.content.ComponentName;public class PackageManager {
 public static final int PERMISSION_GRANTED=0;public boolean missing;public ServiceInfo info=new ServiceInfo();
 public ServiceInfo getServiceInfo(ComponentName c,int flags)throws Exception {
 if(!"zte.com.cn.alarmclock".equals(c.pkg)||!"zte.com.cn.timer.CountdownNotificationService".equals(c.name))throw new AssertionError("wrong service");
 if(missing)throw new Exception("missing");return info;}}''',
    'android/content/ContentResolver.java': '''package android.content;import android.net.Uri;import android.database.*;import java.util.*;
 public class ContentResolver {public String status="1",duration="02:00";public int registrations,queries;public boolean failSecond,missingColumn;
 public final List<ContentObserver> observers=new ArrayList<>();public Cursor last;
 public void registerContentObserver(Uri u,boolean descendants,ContentObserver o){registrations++;
 if(failSecond&&registrations%2==0)throw new IllegalStateException("second URI");observers.add(o);}
 public void unregisterContentObserver(ContentObserver o){observers.removeIf(x->x==o);}
 public Cursor query(Uri u,String[] p,String s,String[] a,String sort){queries++;
 last=new Cursor(u.toString().endsWith("visible_status")?status:duration);last.column=!missingColumn;return last;}
 public void changed(){for(ContentObserver o:new ArrayList<>(observers))o.onChange(false);}}''',
    'android/content/Context.java': '''package android.content;import android.os.*;import android.content.pm.*;public class Context {
 public final UserManager users=new UserManager();public final PackageManager pm=new PackageManager();public final ContentResolver resolver=new ContentResolver();
 public int permission,user;public int getUserId(){return user;}public <T>T getSystemService(Class<T> t){return t.cast(users);}
 public int requests;public boolean rejectSend;public Intent lastRequest;public void sendBroadcast(Intent i){
 if(rejectSend)throw new IllegalStateException("send unavailable");requests++;lastRequest=i;}
 public PackageManager getPackageManager(){return pm;}public int checkSelfPermission(String p){return permission;}
 public ContentResolver getContentResolver(){return resolver;}}''',
    'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;import java.lang.reflect.*;final class SystemUiAdapter {
 static Object field(Object o,String name){if(o==null)return null;for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{
 Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception ignored){}return null;}}''',
    'ls/augment/com/hook/TestNativeIslandCompletion.java': '''package ls.augment.com.hook;
 import android.content.*;import android.database.*;import android.net.*;import android.os.*;import java.util.*;
 public class TestNativeIslandCompletion {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class LegacyScene {private Context mCurrentUserContext=new Context();private int mCurrentUser;int updates,panelState;
 public void updatePanelStatus(int s){panelState=s;}public void updateCountDownTimeCount(){updates++;}}
 static class NewScene extends LegacyScene {public void updatePanelStatus(String wrong){throw new AssertionError("wrong overload");}}
 static class MissingScene {public int mCurrentUserContext;}
 static class Manager {private String mPkgName="launcher";}
 static class Permanent {Object mTempIsland;boolean present;int adds,removes;
 public boolean isIslandExist(LegacyScene s){return present;}
 public void addPermanentIslandInner(LegacyScene s){adds++;present=true;}
 public void removePermanentIsland(LegacyScene s){removes++;present=false;mTempIsland=null;}}
 static class NewPermanent extends Permanent {public void addPermanentIslandInner(String wrong){throw new AssertionError("wrong overload");}}
 static class MissingPermanent {public boolean isIslandExist(LegacyScene s){return false;}}
 static class Provider {public static final Uri COUNT_DOWN_VISIBLE_URI=Uri.parse("content://com.android.systemui.zte/count_down_visible_status");
 public static final Uri COUNT_DOWN_VALUE_URI=Uri.parse("content://com.android.systemui.zte/count_down_value_status");}
 static class WrongProvider {public static final Uri COUNT_DOWN_VISIBLE_URI=Uri.parse("content://untrusted/count_down_visible_status");
 public static final Uri COUNT_DOWN_VALUE_URI=Provider.COUNT_DOWN_VALUE_URI;}
 static class Fixture {final LegacyScene scene;final Manager manager=new Manager();final Permanent permanent;final Handler handler=new Handler();
 final List<String> reports=new ArrayList<>();boolean master,option,ready=true;int currentUser,changed;NativeIslandCountdown bridge;
 Fixture(boolean modern)throws Exception{scene=modern?new NewScene():new LegacyScene();permanent=modern?new NewPermanent():new Permanent();
 bridge=create(permanent,scene,Provider.class);}
 NativeIslandCountdown create(Object p,Object s,Class<?> provider)throws Exception{return new NativeIslandCountdown(manager,p,s,provider,handler,
 ()->NativeIslandScenePolicy.enhance(master,option,ready),()->currentUser,reports::add,()->changed++);}
 Context context(){return scene.mCurrentUserContext;}void sync(){bridge.request();handler.drain();}
 void enable(){master=option=true;sync();}void notifyState(String state){context().resolver.status=state;context().resolver.changed();handler.drain();}}
 interface Attempt{void run()throws Exception;}static void rejects(Attempt a,String label)throws Exception{
 boolean failed=false;try{a.run();}catch(Exception expected){failed=true;}check(failed,label);}
 public static void main(String[] args)throws Exception{
 for(int mask=0;mask<8;mask++)check(NativeIslandScenePolicy.enhance((mask&1)!=0,(mask&2)!=0,(mask&4)!=0)==(mask==7),"master, scene and capability all required");
 for(String value:new String[]{null,"","4","-1","01"," 1","paused"})check(NativeIslandScenePolicy.countdownState(value)==-1,"unknown/broadcast status rejected");
 for(boolean modern:new boolean[]{false,true}){
 Fixture f=new Fixture(modern);f.sync();check(f.context().resolver.registrations==0&&f.permanent.adds==0,"OFF has no observers or mutations");
 f.option=true;f.sync();check(f.permanent.adds==0,"child alone does not enable");
 f.enable();check(f.permanent.adds==1&&f.context().resolver.observers.size()==2,"enable reconciles running timer");
 check(f.context().requests==1&&"zte.com.cn.alarmclock".equals(f.context().lastRequest.pkg)
 &&NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION.equals(f.context().lastRequest.action),"rebind asks only existing clock for genuine state");
 f.sync();check(f.permanent.adds==1&&f.context().resolver.registrations==2,"no duplicate queue entry or observers");
 check(f.context().requests==1,"ordinary refresh does not spam source requests");
 f.notifyState("2");check(f.scene.panelState==2&&f.permanent.present,"pause preserves active scene and updates native panel");
 f.option=false;f.bridge.request();f.handler.drain();check(f.context().resolver.observers.isEmpty(),"disable drains observers and pending callback");
 f.permanent.present=false;f.option=true;f.sync();check(f.permanent.adds==2&&f.scene.panelState==2,"enabling while paused restores paused timer");
 f.manager.mPkgName="zte.com.cn.alarmclock";f.sync();check(!f.permanent.present,"foreground clock retracts background island");
 f.manager.mPkgName="launcher";f.sync();check(f.permanent.present,"leaving clock restores genuine active timer");
 f.notifyState("0");check(!f.permanent.present,"cancel/end removes island");
 f.permanent.mTempIsland=f.scene;f.sync();check(f.permanent.mTempIsland==null,"end clears queued scene too");
 int adds=f.permanent.adds;f.context().resolver.status="4";f.sync();check(f.permanent.adds==adds,"Nubia pause 4 is never mistaken for provider pause");
 f.context().resolver.status="1";f.manager.mPkgName=null;f.sync();check(f.permanent.adds==adds,"unknown foreground cannot publish");
 f.manager.mPkgName="launcher";f.context().resolver.duration=null;f.sync();check(f.permanent.adds==adds,"missing duration cannot fabricate timer");
 f.context().resolver.duration="0";f.sync();check(f.permanent.adds==adds,"expired value cannot revive timer");
 f.context().resolver.duration="00:10";f.context().resolver.missingColumn=true;f.sync();check(f.permanent.adds==adds,"missing provider column stays native");
 f.context().resolver.missingColumn=false;f.currentUser=10;f.sync();check(f.context().resolver.observers.isEmpty()&&f.permanent.adds==adds,"user switch detaches old source");
 Context old=f.context();Context next=new Context();next.user=10;f.scene.mCurrentUser=10;f.scene.mCurrentUserContext=next;f.sync();
 check(old.resolver.observers.isEmpty()&&next.resolver.observers.size()==2&&f.permanent.present,"new user's context revalidated and rebound");
 next.user=0;f.sync();check(next.resolver.observers.isEmpty(),"context and scene user mismatch rejected");next.user=10;
 f.permanent.present=false;f.permanent.mTempIsland=f.scene;f.sync();check(f.permanent.adds==adds+1,"pending native entry not duplicated");
 f.bridge.request();f.master=false;f.handler.drain();check(next.resolver.observers.isEmpty(),"master disabled before queued callback cannot write");
 f.master=true;f.bridge.close();f.sync();check(next.resolver.observers.isEmpty()&&f.handler.queue.isEmpty(),"closed host cannot resume");
 check(old.resolver.last.closed,"provider cursors closed");
 }
 Fixture f=new Fixture(false);f.context().resolver.failSecond=true;f.enable();check(f.context().resolver.observers.isEmpty(),"partial registration rolled back");
 f.context().resolver.failSecond=false;f.sync();check(f.context().resolver.observers.size()==2,"observer registration can recover");f.bridge.close();
 rejects(()->f.create(new MissingPermanent(),f.scene,Provider.class),"missing add/remove contract rejected");
 rejects(()->f.create(f.permanent,new MissingScene(),Provider.class),"wrong scene field type rejected");
 rejects(()->f.create(f.permanent,f.scene,WrongProvider.class),"untrusted URI rejected");
 f.context().users.unlocked=false;rejects(()->f.create(f.permanent,f.scene,Provider.class),"locked service not exposed");f.context().users.unlocked=true;
 f.context().pm.info.exported=false;rejects(()->f.create(f.permanent,f.scene,Provider.class),"nonexported timer service rejected");f.context().pm.info.exported=true;
 f.context().pm.info.permission="vendor.permission";f.context().permission=-1;rejects(()->f.create(f.permanent,f.scene,Provider.class),"service permission required");
 f.context().permission=0;f.context().pm.info.applicationInfo.enabled=false;rejects(()->f.create(f.permanent,f.scene,Provider.class),"disabled clock application rejected");
 f.context().pm.info.applicationInfo.enabled=true;f.context().pm.missing=true;rejects(()->f.create(f.permanent,f.scene,Provider.class),"absent clock service rejected");
 Fixture denied=new Fixture(false);denied.context().permission=-1;denied.enable();
 check(denied.context().requests==0&&denied.context().resolver.observers.size()==2,"missing sync permission keeps original provider path");
 Fixture rejected=new Fixture(false);rejected.context().rejectSend=true;rejected.enable();
 check(rejected.context().resolver.observers.size()==2&&rejected.permanent.present,"broadcast failure cannot detach working provider observers");
 System.out.println("PASS native island completion: "+checks+" checks (legacy, inherited, missing contracts, toggles, lifecycle and users)");
 }}'''
}

with tempfile.TemporaryDirectory(prefix='duo-island-completion-') as directory:
    base = Path(directory)
    files = []
    for name, text in SOURCES.items():
        path = base / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        files.append(str(path))
    for name in ('NativeIslandScenePolicy', 'NativeIslandSceneContract', 'NativeIslandCountdown'):
        files.append(str(ROOT / f'android/app/src/main/java/ls/augment/com/hook/{name}.java'))
    files.append(str(ROOT / 'tools/tests/NativeIslandSceneContractTest.java'))
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', directory, *files], check=True)
    for name in ('TestNativeIslandCompletion', 'NativeIslandSceneContractTest'):
        subprocess.run([str(java / ('java' + suffix)), '-cp', directory, 'ls.augment.com.hook.' + name], check=True)
