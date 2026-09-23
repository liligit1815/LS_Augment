"""Compile real Settings entry hooks/worker/bindings and extracted production filter.

Android/OEM method bodies, Hook dispatch and configuration transports are host
boundaries. No replacement matcher/certificate policy, RootShell, adb or device.
"""
from pathlib import Path
import ast
import hashlib
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STAGE = ROOT / 'audit-output/P1-USER-001/stages/03-settings-entry-binding'
BASE = ROOT / 'tools/test-feature-settings-async.py'
PACKAGE = ROOT / 'android/app/src/main/java/ls/augment/com'


def fixture_sources():
    declarations = []
    for node in ast.parse(BASE.read_text(encoding='utf-8')).body:
        declarations.append(node)
        if isinstance(node, ast.Assign) and any(
                isinstance(target, ast.Name) and target.id == 'SOURCES' for target in node.targets):
            break
    else:
        raise RuntimeError('SOURCES fixture declaration absent')
    namespace = {'__file__': str(BASE), '__name__': 'fixture_definitions_only'}
    exec(compile(ast.Module(body=declarations, type_ignores=[]), str(BASE), 'exec'), namespace)
    result = dict(namespace['SOURCES'])
    # The old suite is not run or compiled; only its boundary fixtures are reused.
    result.pop('ls/augment/com/hook/TestFeatureSettingsAsync.java', None)
    result.pop('ls/augment/com/hook/TestSettingsTargetMatcher.java', None)
    for relative in ['hook/FeatureSettings.java', 'hook/SettingsEntryBindings.java',
                     'hook/SettingsEntryHooks.java', 'hook/SettingsTargetMatcher.java',
                     'HideTargetCodec.java', 'HideUserIdentity.java', 'RemoteConfig.java']:
        path = PACKAGE / relative
        result['ls/augment/com/' + relative] = path.read_text(encoding='utf-8')
        print('SOURCE', path.relative_to(ROOT).as_posix(), hashlib.sha256(path.read_bytes()).hexdigest(), flush=True)
    return result


def block(source, signature):
    """Copy one production member byte-for-text without substituting its decisions."""
    start = source.index(signature)
    opening = source.index('{', start)
    depth, state, escaped = 0, 'code', False
    index = opening
    while index < len(source):
        char, pair = source[index], source[index:index+2]
        if state == 'line':
            if char == '\n': state = 'code'
        elif state == 'comment':
            if pair == '*/': state = 'code'; index += 1
        elif state in ('"', "'"):
            if escaped: escaped = False
            elif char == '\\': escaped = True
            elif char == state: state = 'code'
        elif pair == '//': state = 'line'; index += 1
        elif pair == '/*': state = 'comment'; index += 1
        elif char in ('"', "'"): state = char
        elif char == '{': depth += 1
        elif char == '}':
            depth -= 1
            if depth == 0:
                print('EXTRACT', signature, 'line', source.count('\n', 0, start)+1, flush=True)
                return source[start:index+1]
        index += 1
    raise RuntimeError('Unterminated source member: '+signature)


def extracted_filter():
    path = PACKAGE / 'hook/AugmentModule.java'
    source = path.read_text(encoding='utf-8')
    print('SOURCE', path.relative_to(ROOT).as_posix(), hashlib.sha256(path.read_bytes()).hexdigest(), flush=True)
    return '\n'.join(block(source, signature) for signature in [
        'private Object filterCopy(', 'private Set<HideTargetCodec.Entry> readActiveTargets(',
        'private static EntryIdentity resolveEntryIdentity(', 'private static int userIdFromUid(',
        'private static ApplicationInfo applicationInfoField(', 'private static Integer intField(',
        'private static Object fieldValue(', 'private static final class EntryIdentity {'])


def execute(sources, entry):
    with tempfile.TemporaryDirectory(prefix='lsa-settings-entry-integration-') as directory:
        temporary = Path(directory)
        files = []
        for name, source in sources.items():
            path = temporary / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
            files.append(str(path))
        classes = temporary / 'classes'
        subprocess.run(['javac', '-J-Duser.language=en', '-J-Duser.country=US', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes), *files], check=True)
        return subprocess.run(['java', '-cp', str(classes), entry], timeout=35).returncode


HOST = r'''
package host;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public final class Hooks {
 public interface Original {Object call() throws Throwable;}
 public interface Interceptor {Object call(Chain chain) throws Throwable;}
 public static final Map<Method,Interceptor> hooks=new ConcurrentHashMap<>();
 public static final Map<Method,Integer> originals=new ConcurrentHashMap<>();
 public static final class Chain {
  final Object owner;final Object[] args;final Method method;final Original original;int proceeded;
  Chain(Object o,Object[] a,Method m,Original p){owner=o;args=a;method=m;original=p;}
  public Object getThisObject(){return owner;}public Object getArg(int n){return args[n];}
  public Object proceed()throws Throwable{if(++proceeded!=1)throw new AssertionError("original repeated: "+method);originals.merge(method,1,Integer::sum);return original.call();}
 }
 public static final class Builder {
  final Method method;public Builder(Method m){method=m;}
  public Object intercept(Interceptor i){if(hooks.putIfAbsent(method,i)!=null)throw new AssertionError("duplicate hook");return method;}
 }
 public static Object invoke(Class<?> type,String name,Class<?>[] params,Object owner,Object[] args,Original original){
  try{Method m=type.getDeclaredMethod(name,params);Chain c=new Chain(owner,args,m,original);Interceptor h=hooks.get(m);return h==null?c.proceed():h.call(c);}
  catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}
 }
}
'''

USER_MANAGER = r'''
package android.os;
import android.content.pm.UserInfo;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import host.Hooks;
public final class UserManager {
 public static final ConcurrentHashMap<Integer,Long> serials=new ConcurrentHashMap<>();
 public static final AtomicInteger calls=new AtomicInteger(),wrongThread=new AtomicInteger();
 public static volatile boolean unavailable;
 public static volatile CountDownLatch gate=new CountDownLatch(0),entered=new CountDownLatch(1);
 public final List<UserInfo> profiles=new ArrayList<>();
 private void io(){calls.incrementAndGet();if(!Thread.currentThread().getName().equals("LSA-ConfigReader"))wrongThread.incrementAndGet();entered.countDown();try{if(!gate.await(8,TimeUnit.SECONDS))throw new AssertionError("identity gate timeout");}catch(InterruptedException e){throw new AssertionError(e);}if(unavailable)throw new IllegalStateException("unavailable");}
 public long getSerialNumberForUser(UserHandle u){io();return serials.getOrDefault(u.id,-1L);}
 public UserHandle getUserForSerialNumber(long serial){io();for(Map.Entry<Integer,Long>e:serials.entrySet())if(e.getValue()==serial)return UserHandle.getUserHandleForUid(Math.multiplyExact(e.getKey(),100000));return null;}
 public List<UserInfo> getProfiles(int id){return (List<UserInfo>)Hooks.invoke(UserManager.class,"getProfiles",new Class[]{int.class},this,new Object[]{id},()->new ArrayList<>(profiles));}
 public UserInfo getUserInfo(int id){return (UserInfo)Hooks.invoke(UserManager.class,"getUserInfo",new Class[]{int.class},this,new Object[]{id},()->{for(UserInfo u:profiles)if(u.id==id)return u;return null;});}
 public boolean isUserAdmin(int id){return (Boolean)Hooks.invoke(UserManager.class,"isUserAdmin",new Class[]{int.class},this,new Object[]{id},()->getUserInfo(id)!=null);}
}
'''

STATE = r'''
package com.android.settingslib.applications;
import android.content.*;import android.content.pm.*;import android.os.*;import android.util.*;import java.util.*;import host.Hooks;
import com.zte.settingslib.DoubleLayUtils;
public class ApplicationsState {
 public final SparseArray<Object> mEntriesMap=new SparseArray<>();public boolean mResumed;
 public Context mContext;public UserManager mUm;public IPackageManager mIpm;
 public final ArrayList<Object> entries=new ArrayList<>();
 public RuntimeException failAfterCapture;public int postCaptureReached;
 public ApplicationsState(Context c,UserManager u){mContext=c;mUm=u;mIpm=new IPackageManager.Stub.Proxy();}
 public void doResumeIfNeededLocked(){Hooks.invoke(ApplicationsState.class,"doResumeIfNeededLocked",new Class[]{},this,new Object[]{},()->{
   if(mResumed)return null;mResumed=true;entries.clear();
   for(UserInfo u:mUm.getProfiles(0))for(Object x:DoubleLayUtils.getInstalledApplicationsInternal(0,u.id).getList())entries.add(new AppEntry(u.id,(ApplicationInfo)x));postCaptureReached++;if(failAfterCapture!=null)throw failAfterCapture;return null;});}
 public void addPackage(String pkg,int user){Hooks.invoke(ApplicationsState.class,"addPackage",new Class[]{String.class,int.class},this,new Object[]{pkg,user},()->{
   if(!mResumed)return null;if(!mUm.isUserAdmin(user))return null;ApplicationInfo info=mIpm.getApplicationInfo(pkg,0L,user);
   if(info!=null){for(Object o:entries){AppEntry e=(AppEntry)o;if(e.userId==user&&e.info.packageName.equals(pkg)){e.info=info;return null;}}entries.add(new AppEntry(user,info));}return null;});}
 public void doPauseLocked(){Hooks.invoke(ApplicationsState.class,"doPauseLocked",new Class[]{},this,new Object[]{},()->{mResumed=false;return null;});}
 public void removeUser(int user){Hooks.invoke(ApplicationsState.class,"removeUser",new Class[]{int.class},this,new Object[]{user},()->{entries.removeIf(o->((AppEntry)o).userId==user);return null;});}
 public class Session {public boolean mResumed=true;}
 public static class AppEntry {public int userId;public ApplicationInfo info;public AppEntry(int u,ApplicationInfo i){userId=u;info=i;}}
}
'''

ADAPTER = r'''
package com.android.settings.applications.manageapplications;
import com.android.settingslib.applications.ApplicationsState;import java.util.*;
import ls.augment.com.hook.TestSettingsEntryIntegration;
public class ManageApplications {
 public int mWorkUserId;
 public static class ApplicationsAdapter {
  public ApplicationsState mState;public ApplicationsState.Session mSession;
  public ManageApplications mManageApplications;public boolean mResumed=true;
  public volatile int rebuilds;public volatile String rebuildThread="";public volatile List<?> last;
  public ApplicationsAdapter(ApplicationsState s,int u){mState=s;mSession=s.new Session();mManageApplications=new ManageApplications();mManageApplications.mWorkUserId=u;}
  public void rebuild(){rebuildThread=Thread.currentThread().getName();last=TestSettingsEntryIntegration.apply(this,new ArrayList<>(mState.entries));rebuilds++;}
 }
}
'''

JAVA = r'''
package ls.augment.com.hook;
import android.content.*;import android.content.pm.*;import android.net.Uri;import android.os.*;
import android.database.ContentObserver;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import java.lang.reflect.*;
import ls.augment.com.*;import com.android.settingslib.applications.ApplicationsState;
import com.android.settingslib.applications.ApplicationsState.AppEntry;
import com.android.settings.applications.manageapplications.ManageApplications.ApplicationsAdapter;
import com.zte.settingslib.DoubleLayUtils;
public final class TestSettingsEntryIntegration {
 static final String PKG="com.private.app";static int assertions;
 static AugmentModule module;static Context context;static volatile String hidden="v3:999:42:"+PKG;
 static final AtomicInteger wrongTransportThread=new AtomicInteger();
 static final class Remote implements SharedPreferences {
  public Map<String,?>getAll(){io();return Map.of(RemoteConfig.SNAPSHOT,"3:1",RemoteConfig.HIDDEN,hidden);}
  public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){io();}
 }
 static final class Framework implements io.github.libxposed.api.XposedInterface {
  public long getFrameworkProperties(){io();return PROP_CAP_REMOTE;}public SharedPreferences getRemotePreferences(String n){io();return new Remote();}
 }
 static void io(){if(!Thread.currentThread().getName().equals("LSA-ConfigReader")&&!Thread.currentThread().getName().equals("LSA-ConfigWriter"))wrongTransportThread.incrementAndGet();}
 static final class Resolver extends ContentResolver {
  public Bundle call(Uri uri,String method,String key,Bundle extras){io();Bundle b=new Bundle();
   if(method.equals("snapshot")){ConfigSnapshot s=ConfigSnapshot.parse("3:1");b.putBoolean("ok",true);b.putString("snapshot","3:1");b.putInt("schemaVersion",1);b.putLong("revision",s.revision);b.putLong("updatedAt",s.updatedAt);b.putString("scope","device");b.putString("checksum",s.checksum);}
   else if(method.equals("runtime_snapshot")){b.putBoolean("ok",true);b.putString(RemoteConfig.HIDDEN,hidden);}
   else if(method.equals("diagnostic"))b.putBoolean("ok",true);return b;}
  public String getGlobal(String k){throw new AssertionError("Global read");}public boolean putGlobal(String k,String v){throw new AssertionError("Global write");}
  public void registerContentObserver(Uri u,boolean d,ContentObserver o){io();}
 }
 interface Condition{boolean get()throws Exception;}
 static void until(Condition c)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(7);while(!c.get()){if(System.nanoTime()>end)throw new AssertionError("condition timeout");Thread.sleep(3);}}
 static void check(boolean ok,String label){assertions++;if(!ok)throw new AssertionError(label);System.out.println("PASS "+label);}
 static Object field(String n)throws Exception{Field f=FeatureSettings.class.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
 static void idle()throws Exception{until(()->!((AtomicBoolean)field("refreshPending")).get());}
 static void refresh()throws Exception{FeatureSettings.invalidateSnapshot();idle();}
 static void mainIdle()throws Exception{CountDownLatch done=new CountDownLatch(1);new Handler(Looper.getMainLooper()).post(()->new Handler(Looper.getMainLooper()).post(done::countDown));if(!done.await(5,TimeUnit.SECONDS))throw new AssertionError("main timeout");}
 static CountDownLatch holdWorker()throws Exception{idle();CountDownLatch gate=new CountDownLatch(1),entered=new CountDownLatch(1);((ScheduledExecutorService)field("CONFIG_WORKER")).execute(()->{entered.countDown();try{if(!gate.await(8,TimeUnit.SECONDS))throw new AssertionError("worker hold timeout");}catch(InterruptedException e){throw new AssertionError(e);}});if(!entered.await(5,TimeUnit.SECONDS))throw new AssertionError("worker start timeout");return gate;}
 static ApplicationInfo info(int user,String pkg){ApplicationInfo i=new ApplicationInfo();i.uid=user*100000+12345;i.packageName=pkg;return i;}
 static UserInfo user(int id,int serial){UserInfo u=new UserInfo();u.id=id;u.serialNumber=serial;return u;}
 static ApplicationsState state(int id,int serial,ApplicationInfo i){UserManager um=new UserManager();um.profiles.add(user(id,serial));DoubleLayUtils.infos.put(id,new ArrayList<>(List.of(i)));return new ApplicationsState(context,um);}
 public static List<?> apply(ApplicationsAdapter adapter,List<?>input){return (List<?>)module.apply(context,adapter,input);}
 static List<?> filter(ApplicationsAdapter a,Object...entries){return apply(a,new ArrayList<>(Arrays.asList(entries)));}
 static void originalCount(String name,int count)throws Exception{int n=host.Hooks.originals.entrySet().stream().filter(e->e.getKey().getName().equals(name)).mapToInt(Map.Entry::getValue).sum();check(n==count,"original "+name+" exactly "+count);}
 static void setup()throws Exception{
  UserManager.serials.put(999,42L);UserManager.serials.put(10,70L);UserManager.serials.put(0,0L);
  context=new Context(new Resolver(),"com.android.settings");module=new AugmentModule();module.install();
  check(module.settingsEntryHooks!=null&&host.Hooks.hooks.size()==9,"all nine real source hooks installed");
  FeatureSettings.attachFramework(new Framework());FeatureSettings.hiddenAuthorizations(context);refresh();
  until(()->!FeatureSettings.hiddenAuthorizations(context).isEmpty());mainIdle();
 }
 static void fullFlow()throws Exception{
  ApplicationInfo a=info(999,PKG);ApplicationsState s=state(999,42,a);ApplicationsAdapter adapter=new ApplicationsAdapter(s,999);
  CountDownLatch held=holdWorker();s.doResumeIfNeededLocked();
  ArrayList<Object> input=new ArrayList<>(s.entries);
  check(apply(adapter,input).size()==1,"captured A remains before its real worker verification");
  check(input.size()==1&&((AppEntry)input.get(0)).info==a,"filter preserves original list and exact info");
  int first=adapter.rebuilds;held.countDown();idle();
  until(()->adapter.rebuilds>first&&adapter.last!=null&&adapter.last.isEmpty());
  check(adapter.rebuildThread.equals("TestMain"),"first verification invokes actual Hook rebuild callback on main");
  check(filter(adapter,new AppEntry(999,a)).isEmpty(),"legitimate A wrapper copy remains authorized");
  originalCount("doResumeIfNeededLocked",1);originalCount("getProfiles",1);originalCount("getInstalledApplicationsInternal",1);
  CountDownLatch noIo=holdWorker();int calls=UserManager.calls.get();
  ApplicationInfo clone=new ApplicationInfo(a),b=info(999,PKG);
  check(filter(adapter,new AppEntry(999,b)).size()==1,"uncaptured B entry is retained under valid A selection");
  check(filter(adapter,b).size()==1,"uncaptured direct ApplicationInfo retained");
  check(filter(adapter,new AppEntry(999,clone)).size()==1,"equal UID/package clone cannot borrow A identity");
  AppEntry replaced=new AppEntry(999,a);replaced.info=b;
  check(filter(adapter,replaced).size()==1,"old Entry with replacement info is retained");
  check(filter(adapter,new AppEntry(10,a)).size()==1,"explicit user conflicting with UID retained");
  check(UserManager.calls.get()==calls,"filter performs no identity IPC");noIo.countDown();idle();
  UserManager.serials.put(999,43L);s.mUm.profiles.clear();s.mUm.profiles.add(user(999,43));
  IPackageManager.Stub.Proxy.single.put("999:"+PKG,b);s.addPackage(PKG,999);idle();
  check(filter(adapter,new AppEntry(999,b)).size()==1,"captured current B cannot use old A selection");
  hidden="v3:999:43:"+PKG;int before=adapter.rebuilds;refresh();
  until(()->adapter.rebuilds>before&&adapter.last!=null&&adapter.last.isEmpty());
  check(filter(adapter,new AppEntry(999,b)).isEmpty(),"explicit B selection and worker refresh hide B");
  check(filter(adapter,new AppEntry(999,a)).size()==1,"B authorization never moves to old A info");
  originalCount("addPackage",1);originalCount("isUserAdmin",1);originalCount("getUserInfo",1);originalCount("getApplicationInfo",1);
 }
 static void retireInFlight()throws Exception{
  ApplicationInfo old=info(999,PKG);ApplicationsState s=state(999,43,old);ApplicationsAdapter adapter=new ApplicationsAdapter(s,999);
  CountDownLatch held=holdWorker();s.doResumeIfNeededLocked();filter(adapter,new AppEntry(999,old));
  UserManager.gate=new CountDownLatch(1);UserManager.entered=new CountDownLatch(1);held.countDown();
  check(UserManager.entered.await(5,TimeUnit.SECONDS),"identity verification actually in flight before retire");
  s.removeUser(999);UserManager.gate.countDown();idle();mainIdle();
  check(filter(adapter,new AppEntry(999,old)).size()==1,"retired record cannot be revived by in-flight worker");
  UserManager.serials.put(999,44L);hidden="v3:999:44:"+PKG;refresh();
  ApplicationInfo fresh=info(999,PKG);ApplicationsState newer=state(999,44,fresh);ApplicationsAdapter next=new ApplicationsAdapter(newer,999);
  CountDownLatch nextHold=holdWorker();newer.doResumeIfNeededLocked();filter(next,new AppEntry(999,fresh));int n=next.rebuilds;nextHold.countDown();idle();
  until(()->next.rebuilds>n&&next.last!=null&&next.last.isEmpty());
  check(filter(next,new AppEntry(999,fresh)).isEmpty(),"retire does not disable correctly captured new 999 generation");
 }
 static void ownerInFlight()throws Exception{
  hidden="v3:999:44:"+PKG+";v3:10:70:"+PKG;refresh();
  ApplicationInfo old=info(10,PKG);ApplicationsState s=state(10,70,old);ApplicationsAdapter adapter=new ApplicationsAdapter(s,10);
  CountDownLatch held=holdWorker();s.doResumeIfNeededLocked();filter(adapter,new AppEntry(10,old));
  UserManager.gate=new CountDownLatch(1);UserManager.entered=new CountDownLatch(1);held.countDown();
  check(UserManager.entered.await(5,TimeUnit.SECONDS),"identity verification actually in flight before pause");
  s.doPauseLocked();int before=adapter.rebuilds;UserManager.gate.countDown();idle();mainIdle();
  check(filter(adapter,new AppEntry(10,old)).size()==1,"paused owner cannot regain old authorization");
  check(adapter.rebuilds==before,"late worker callback does not rebuild paused owner");
  ApplicationInfo fresh=info(10,PKG);DoubleLayUtils.infos.put(10,new ArrayList<>(List.of(fresh)));
  CountDownLatch again=holdWorker();s.doResumeIfNeededLocked();filter(adapter,new AppEntry(10,fresh));int n=adapter.rebuilds;again.countDown();idle();
  until(()->adapter.rebuilds>n&&adapter.last!=null&&adapter.last.isEmpty());
  check(filter(adapter,new AppEntry(10,fresh)).isEmpty(),"fresh resume acquisition recovers valid owner functionality");
  check(filter(adapter,new AppEntry(10,old)).size()==1,"owner epoch does not bless pre-pause info");
 }
 static void unsupportedAndOwner()throws Exception{
  hidden="v3:999:44:"+PKG+";v3:10:70:"+PKG+";v3:0:0:"+PKG;refresh();
  ApplicationInfo unknown=info(0,PKG);DoubleLayUtils.infos.put(0,new ArrayList<>(List.of(unknown)));
  DoubleLayUtils.getInstalledApplicationsInternal(0,0); // Real hooked getter outside any acquisition scope.
  ApplicationsState s=state(0,0,unknown);ApplicationsAdapter a=new ApplicationsAdapter(s,0);
  CountDownLatch held=holdWorker();s.doResumeIfNeededLocked();filter(a,new AppEntry(0,unknown));held.countDown();idle();
  check(filter(a,new AppEntry(0,unknown)).size()==1,"previously unsupported original object cannot later receive a source certificate");
  s.doPauseLocked();ApplicationInfo fresh=info(0,PKG);DoubleLayUtils.infos.put(0,new ArrayList<>(List.of(fresh)));
  CountDownLatch next=holdWorker();s.doResumeIfNeededLocked();filter(a,new AppEntry(0,fresh));int n=a.rebuilds;next.countDown();idle();
  until(()->a.rebuilds>n&&a.last!=null&&a.last.isEmpty());
  check(filter(a,new AppEntry(0,fresh)).isEmpty(),"supported fresh user zero acquisition remains functional");
  s.doResumeIfNeededLocked();check(filter(a,new AppEntry(0,fresh)).isEmpty(),"already-resumed no-op does not revoke legitimate source evidence");
  ApplicationsState foreign=state(0,0,info(0,PKG));foreign.mResumed=true;
  ApplicationsAdapter other=new ApplicationsAdapter(foreign,0);
  check(filter(other,new AppEntry(0,fresh)).size()==1,"another active owner cannot borrow exact info certificate");
  ApplicationsState.Session session=a.mSession;a.mSession=foreign.new Session();
  check(filter(a,new AppEntry(0,fresh)).size()==1,"session bound to different owner is retained");a.mSession=session;
  check(filter(a,new AppEntry(0,fresh)).isEmpty(),"restored correct session still filters its valid source");
  CountDownLatch frozen=holdWorker();SystemClock.offset+=11000;
  check(filter(a,new AppEntry(0,fresh)).size()==1,"expired authorization retains next input while worker is blocked");
  SystemClock.offset-=11000;frozen.countDown();idle();
 }
 static void mixedUsers()throws Exception{
  hidden="v3:999:44:"+PKG;refresh();UserManager um=new UserManager();
  ApplicationInfo zero=info(0,PKG),ten=info(10,PKG),clone=info(999,PKG);
  for(UserInfo u:List.of(user(0,0),user(10,70),user(999,44)))um.profiles.add(u);
  DoubleLayUtils.infos.put(0,new ArrayList<>(List.of(zero)));DoubleLayUtils.infos.put(10,new ArrayList<>(List.of(ten)));DoubleLayUtils.infos.put(999,new ArrayList<>(List.of(clone)));
  ApplicationsState s=new ApplicationsState(context,um);ApplicationsAdapter a=new ApplicationsAdapter(s,999);
  CountDownLatch held=holdWorker();s.doResumeIfNeededLocked();apply(a,new ArrayList<>(s.entries));int n=a.rebuilds;held.countDown();idle();
  until(()->a.rebuilds>n&&a.last!=null&&a.last.size()==2);
  check(a.last.stream().anyMatch(e->((AppEntry)e).info==zero)&&a.last.stream().anyMatch(e->((AppEntry)e).info==ten),"same-package profiles 0/10 remain when only 999 is selected");
  check(a.last.stream().noneMatch(e->((AppEntry)e).info==clone),"mixed-profile callback removes only explicitly authorized 999 source");
  hidden+=";v3:10:70:"+PKG;int before=a.rebuilds;refresh();
  until(()->a.rebuilds>before&&a.last!=null&&a.last.size()==1);
  check(((AppEntry)a.last.get(0)).info==zero,"new dynamic-user selection reuses its own verified source without crossing to user zero");
  check(s.entries.size()==3,"mixed-profile filtering never mutates original entries");
 }
 static void unsupportedProfile()throws Exception{
  int registered=host.Hooks.hooks.size();AugmentModule unavailable=new AugmentModule();
  ClassLoader missing=new ClassLoader(TestSettingsEntryIntegration.class.getClassLoader()){
   @Override protected Class<?>loadClass(String name,boolean resolve)throws ClassNotFoundException{
    if(name.equals("com.zte.settingslib.DoubleLayUtils"))throw new ClassNotFoundException("controlled missing OEM source class");return super.loadClass(name,resolve);}
  };
  unavailable.settingsEntryHooks=SettingsEntryHooks.install(unavailable,missing);
  check(unavailable.settingsEntryHooks==null,"missing required profile class rejects source Hook installation");
  check(host.Hooks.hooks.size()==registered,"profile failure does not add partial registrations");
  check("SETTINGS_ENTRY_SOURCES_UNAVAILABLE".equals(unavailable.lastError),"unsupported source profile retains explicit diagnostic");
  ApplicationsState s=state(10,70,info(10,PKG));s.mResumed=true;ApplicationsAdapter a=new ApplicationsAdapter(s,10);
  Object row=new AppEntry(10,info(10,PKG));List<?>input=new ArrayList<>(List.of(row));
  check(unavailable.apply(context,a,input)==input,"missing source profile preserves original list in actual filter");
 }
 static void originalFailure()throws Exception{
  ApplicationInfo bad=info(10,PKG);ApplicationsState s=state(10,70,bad);ApplicationsAdapter a=new ApplicationsAdapter(s,10);
  RuntimeException expected=new RuntimeException("original failed after captured list");s.failAfterCapture=expected;
  int prior=host.Hooks.originals.entrySet().stream().filter(e->e.getKey().getName().equals("doResumeIfNeededLocked")).mapToInt(Map.Entry::getValue).sum();
  CountDownLatch held=holdWorker();RuntimeException received=null;
  try{s.doResumeIfNeededLocked();}catch(RuntimeException e){received=e;}
  check(received==expected&&s.postCaptureReached==1&&s.entries.size()==1,"real scope preserves original exception after raw capture point");
  int after=host.Hooks.originals.entrySet().stream().filter(e->e.getKey().getName().equals("doResumeIfNeededLocked")).mapToInt(Map.Entry::getValue).sum();
  check(after==prior+1,"failing original loader executes exactly once");
  filter(a,new AppEntry(10,bad));held.countDown();idle();mainIdle();
  check(filter(a,new AppEntry(10,bad)).size()==1,"captured record from throwing source scope stays revoked after worker finishes");
  s.doPauseLocked();s.failAfterCapture=null;ApplicationInfo good=info(10,PKG);DoubleLayUtils.infos.put(10,new ArrayList<>(List.of(good)));
  CountDownLatch next=holdWorker();s.doResumeIfNeededLocked();filter(a,new AppEntry(10,good));int n=a.rebuilds;next.countDown();idle();
  until(()->a.rebuilds>n&&a.last!=null&&a.last.isEmpty());
  check(filter(a,new AppEntry(10,good)).isEmpty(),"fresh successful source acquisition still works after prior loader exception");
 }
 public static void main(String[]args)throws Exception{
  try{setup();fullFlow();retireInFlight();ownerInFlight();unsupportedAndOwner();mixedUsers();unsupportedProfile();originalFailure();check(UserManager.wrongThread.get()==0,"identity I/O stays on actual config worker");check(wrongTransportThread.get()==0,"Provider/remote I/O stays off capture/filter main path");System.out.println("PASS "+assertions+" integration assertions; complete real Hooks/Bindings/FeatureSettings plus verbatim actual filter; Android/OEM/Hook dispatcher are host boundaries, not ART runtime.");}
  finally{UserManager.gate.countDown();}
 }
}
'''


def main():
    sources = fixture_sources()
    sources['ls/augment/com/ConfigSchema.java'] = sources['ls/augment/com/ConfigSchema.java'].replace(
        'return "flag".equals(key);', 'return "flag".equals(key)||HIDE_MASTER.equals(key);')
    sources.update({
        'host/Hooks.java': HOST,
        'android/os/UserManager.java': USER_MANAGER,
        'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo {public int uid;public String packageName;public ApplicationInfo(){}public ApplicationInfo(ApplicationInfo i){uid=i.uid;packageName=i.packageName;}}',
        'android/content/pm/UserInfo.java': 'package android.content.pm;public class UserInfo {public int id,serialNumber,flags;public boolean partial,preCreated;}',
        'android/util/SparseArray.java': 'package android.util;public class SparseArray<T> {}',
        'android/content/pm/BaseParceledListSlice.java': 'package android.content.pm;public class BaseParceledListSlice {final java.util.List<?> list;public BaseParceledListSlice(java.util.List<?>v){list=v;}public java.util.List<?> getList(){return list;}}',
        'android/content/pm/ParceledListSlice.java': 'package android.content.pm;public class ParceledListSlice extends BaseParceledListSlice {public ParceledListSlice(java.util.List<?>v){super(v);}}',
        'android/content/pm/IPackageManager.java': r'''package android.content.pm;import java.util.*;import java.util.concurrent.*;import host.Hooks;public interface IPackageManager {ApplicationInfo getApplicationInfo(String p,long f,int u);class Stub {public static class Proxy implements IPackageManager {public static final Map<String,ApplicationInfo> single=new ConcurrentHashMap<>();public ApplicationInfo getApplicationInfo(String p,long f,int u){return (ApplicationInfo)Hooks.invoke(Proxy.class,"getApplicationInfo",new Class[]{String.class,long.class,int.class},this,new Object[]{p,f,u},()->single.get(u+":"+p));}}}}''',
        'com/zte/settingslib/DoubleLayUtils.java': r'''package com.zte.settingslib;import android.content.pm.*;import java.util.*;import java.util.concurrent.*;import host.Hooks;public final class DoubleLayUtils {public static final Map<Integer,List<ApplicationInfo>> infos=new ConcurrentHashMap<>();public static ParceledListSlice getInstalledApplicationsInternal(int flags,int user){return (ParceledListSlice)Hooks.invoke(DoubleLayUtils.class,"getInstalledApplicationsInternal",new Class[]{int.class,int.class},null,new Object[]{flags,user},()->new ParceledListSlice(new ArrayList<>(infos.getOrDefault(user,List.of()))));}}''',
        'com/android/settingslib/applications/ApplicationsState.java': STATE,
        'com/android/settings/applications/manageapplications/ManageApplications.java': ADAPTER,
        'ls/augment/com/hook/TestSettingsEntryIntegration.java': JAVA,
    })
    sources['ls/augment/com/hook/AugmentModule.java'] = '''
package ls.augment.com.hook;
import android.content.Context;import android.content.pm.ApplicationInfo;
import java.lang.reflect.*;import java.util.*;import ls.augment.com.HideTargetCodec;
final class AugmentModule {
 SettingsEntryHooks settingsEntryHooks;boolean filterCalled;String lastError;static final String PROBE_FILTER_CALLED_KEY="probe";
 void install(){settingsEntryHooks=SettingsEntryHooks.install(this,getClass().getClassLoader());}
 Object apply(Context c,Object adapter,List<?>input){return filterCopy(c,adapter,input,"integration");}
 host.Hooks.Builder prepareFeatureHook(Method m,String id,boolean deopt){return new host.Hooks.Builder(m);}
 void registerFeatureHook(Object handle){}void logFeatureInfo(String s){}void logFeatureError(String s,Throwable t){lastError=s;}
 void writeProbe(Context c,String k,String v){}void writeDiagnostics(Context c,String s,long t,int b,int r,int a,int n,Throwable e){}
 void logInfo(String s){}void logError(String s,Throwable t){t.printStackTrace();}
''' + extracted_filter() + '\n}'
    print('REAL SETTINGS INTEGRATION: no fabricated certificates or replacement filter policy.', flush=True)
    return execute(sources, 'ls.augment.com.hook.TestSettingsEntryIntegration')


if __name__ == '__main__':
    raise SystemExit(main())
