"""Run actual broker authentication and Provider fences across a controlled Binder boundary."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-lifecycle.py')))
JAVA = SUPPORT['SUPPORT']
SRC = JAVA['SRC']
AUTH = SRC / 'hook/AtomicWorkbenchSystemRootAuthority.java'
PROVIDER = SRC / 'AtomicWorkbenchProvider.java'
PROTOCOL = SRC / 'AtomicWorkbenchProtocol.java'

STUBS = {
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle {
      public final Map<String,Object> data=new HashMap<>(); public Bundle(){}public Bundle(Bundle b){data.putAll(b.data);}
      public Set<String>keySet(){return data.keySet();} public Object get(String k){return data.get(k);}public void remove(String k){data.remove(k);}
      public void putInt(String k,int v){data.put(k,v);}public int getInt(String k,int d){return data.get(k) instanceof Integer?(Integer)data.get(k):d;}
      public void putLong(String k,long v){data.put(k,v);}public long getLong(String k,long d){return data.get(k) instanceof Long?(Long)data.get(k):d;}
      public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}
      public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k,boolean d){return data.get(k) instanceof Boolean?(Boolean)data.get(k):d;}
      public void putBinder(String k,IBinder v){data.put(k,v);}public IBinder getBinder(String k){return (IBinder)data.get(k);}}
    ''',
    'android/os/IBinder.java': 'package android.os;public interface IBinder {boolean isBinderAlive();}',
    'android/os/Process.java': 'package android.os;public final class Process {public static int uid=1000;public static int myUid(){return uid;}}',
    'android/os/Binder.java': '''package android.os;public class Binder {public static int uid=0,pid=999,clears,restores;
      public static int getCallingUid(){return uid;}public static int getCallingPid(){return pid;}
      public static long clearCallingIdentity(){long old=((long)uid<<32)|(pid&0xffffffffL);uid=Process.myUid();pid=555;clears++;return old;}
      public static void restoreCallingIdentity(long old){uid=(int)(old>>32);pid=(int)old;restores++;}}
    ''',
    'android/app/ActivityManager.java': 'package android.app;public class ActivityManager {public static int user=0;public static int getCurrentUser(){return user;}}',
    'android/net/Uri.java': 'package android.net;public final class Uri {final String value;private Uri(String s){value=s;}public static Uri parse(String s){return new Uri(s);}public String toString(){return value;}}',
    'android/content/Context.java': 'package android.content;public class Context {public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}}',
    'android/content/ContentResolver.java': '''package android.content;import android.os.*;import android.net.*;public class ContentResolver {
      public int calls;public String uri,method,arg;public Bundle last;public java.util.function.Consumer<Bundle> responseChange;
      public Runnable during;public boolean fail;
      public Bundle call(Uri uri,String method,String arg,Bundle extras){calls++;this.uri=uri.toString();this.method=method;this.arg=arg;last=new Bundle(extras);
        if(fail)throw new IllegalStateException("provider unavailable");
        Bundle result=ls.augment.com.AtomicWorkbenchProvider.invoke(arg,extras);
        if(during!=null)during.run();if(responseChange!=null)responseChange.accept(result);return result;}}
    ''',
}

PROVIDER_HEAD = '''package ls.augment.com;import android.os.*;import android.os.Process;import java.util.*;
public final class AtomicWorkbenchProvider {
 public static final class Live implements IBinder {public boolean alive=true;public boolean isBinderAlive(){return alive;}}
 public static final class Pending {public String token="a".repeat(64);public int uid=10515,userId=0,rootPid=999;public long startedAt=876,resetGeneration=7;
  public Live endpoint=new Live(),owner=new Live();}
 public static Pending pending;
 static final class ResetWriteFence {static boolean blocked;static long epoch=7;static boolean blocked(){return blocked;}static long generation(){return epoch;}}
 public static void reset(){pending=new Pending();ResetWriteFence.blocked=false;ResetWriteFence.epoch=7;}
 public static void block(){ResetWriteFence.blocked=true;}public static void epoch(long value){ResetWriteFence.epoch=value;}
 public static Bundle invoke(String arg,Bundle b){int old=Process.uid;Process.uid=pending==null?10515:pending.uid;
  try{return new AtomicWorkbenchProvider().systemRootSession(arg,b);}finally{Process.uid=old;}}
'''

HARNESS = '''package ls.augment.com;import android.os.*;import android.content.*;import android.app.ActivityManager;
import ls.augment.com.hook.AtomicWorkbenchSystemRootAuthority;import ls.augment.com.hook.AtomicWorkbenchSystemRootAuthority.Session;
public final class SystemAuthorityHarness {
 static int cases,checks;static Context context;static Bundle auth;
 interface Case {void run()throws Exception;}
 static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static void test(String name,Case c)throws Exception{AtomicWorkbenchProvider.reset();android.os.Process.uid=1000;Binder.uid=0;Binder.pid=999;
  Binder.clears=Binder.restores=0;ActivityManager.user=0;context=new Context();auth=query();c.run();
  check(Binder.clears==Binder.restores,"Binder identity not restored");cases++;System.out.println("PASS system authority: "+name);}
 static Bundle query(){var p=AtomicWorkbenchProvider.pending;Bundle b=new Bundle();b.putInt("version",1);b.putInt("uid",p.uid);b.putInt("user",p.userId);
  b.putLong("session",p.startedAt);b.putLong("reset_generation",p.resetGeneration);b.putInt("root_pid",p.rootPid);
  b.putBinder("endpoint",p.endpoint);b.putString("token",p.token);b.putString("nonce","b".repeat(32));return b;}
 static Session accept(){return AtomicWorkbenchSystemRootAuthority.authenticate(context,auth,0,999);}
 static void reject(){try{accept();throw new AssertionError("invalid session accepted");}catch(SecurityException expected){checks++;}}
 static void providerReject(String arg,Bundle query){int old=Binder.uid;Binder.uid=1000;try{AtomicWorkbenchProvider.invoke(arg,query);throw new AssertionError("Provider accepted");}
  catch(SecurityException expected){checks++;}finally{Binder.uid=old;}}
 public static void main(String[] args)throws Exception{
  test("actual Provider identity and exact metadata, credentials not returned",()->{
   Session s=accept();check(s.moduleUid==10515&&s.rootPid==999&&s.userId==0&&s.session==876&&s.resetGeneration==7,"metadata changed");
   check(s.endpoint==AtomicWorkbenchProvider.pending.endpoint&&s.owner==AtomicWorkbenchProvider.pending.owner&&s.isAlive(),"Binder identity changed");
   check(context.resolver.calls==1&&context.resolver.uri.equals("content://0@ls.augment.com.workbench"),"wrong user Provider");
   check(context.resolver.method.equals("system_root_session")&&context.resolver.arg==null,"wrong Provider method");
   check(Binder.uid==0&&Binder.pid==999,"original caller identity lost");
   String originalNonce=auth.getString("nonce");auth.putString("token","c".repeat(64));
   check(s.isCurrent(context),"caller Bundle mutation leaked into permit");check(context.resolver.calls==2,"fresh Provider not queried");
   check(!context.resolver.last.getString("nonce").equals(originalNonce),"refresh replayed nonce");});
  test("foreign Binder UID cannot borrow actual Root credentials",()->{Binder.uid=10515;reject();check(context.resolver.calls==0,"foreign caller queried Provider");});
  test("wrong actual Root PID rejected",()->{Binder.pid=998;reject();});
  test("claimed caller differs from Binder caller",()->{try{AtomicWorkbenchSystemRootAuthority.authenticate(context,auth,0,998);throw new AssertionError();}catch(SecurityException expected){checks++;}});
  test("wrong execution process rejected",()->{android.os.Process.uid=0;reject();});
  test("missing context rejected",()->{context=null;reject();});
  test("null auth rejected",()->{auth=null;reject();});
  test("additional auth fields rejected",()->{auth.putString("arbitrary_task","ignored");reject();});
  for(String key:new String[]{"version","uid","user","session","reset_generation","root_pid","endpoint","token","nonce"})
   test("missing "+key,()->{auth.remove(key);reject();});
  test("numeric types not coerced",()->{auth.putInt("session",876);reject();});
  test("wrong schema rejected",()->{auth.putInt("version",2);reject();});
  test("wrong module UID rejected",()->{auth.putInt("uid",10516);reject();});
  test("mismatched UID user rejected",()->{auth.putInt("user",1);reject();});
  test("wrong session rejected",()->{auth.putLong("session",875);reject();});
  test("wrong reset credential rejected",()->{auth.putLong("reset_generation",8);reject();});
  test("wrong Root PID credential rejected",()->{auth.putInt("root_pid",998);reject();});
  test("replaced endpoint rejected",()->{auth.putBinder("endpoint",new AtomicWorkbenchProvider.Live());reject();});
  test("wrong token rejected",()->{auth.putString("token","c".repeat(64));reject();});
  test("uppercase token rejected",()->{auth.putString("token","A".repeat(64));reject();});
  test("invalid nonce rejected",()->{auth.putString("nonce","invalid");reject();});
  test("dead endpoint rejected",()->{AtomicWorkbenchProvider.pending.endpoint.alive=false;reject();});
  test("dead owner rejected",()->{AtomicWorkbenchProvider.pending.owner.alive=false;reject();});
  test("missing pending session rejected",()->{AtomicWorkbenchProvider.pending=null;reject();});
  test("reset start rejects fresh permit and held permit",()->{Session s=accept();AtomicWorkbenchProvider.block();check(!s.isCurrent(context),"reset retained authorization");reject();});
  test("reset completion rejects old held permit",()->{Session s=accept();AtomicWorkbenchProvider.epoch(8);check(!s.isCurrent(context),"reset generation retained authorization");reject();});
  test("owner death invalidates held permit without Provider call",()->{Session s=accept();int calls=context.resolver.calls;AtomicWorkbenchProvider.pending.owner.alive=false;
   check(!s.isAlive()&&!s.isCurrent(context)&&context.resolver.calls==calls,"dead owner used Provider");});
  test("Root death invalidates held permit",()->{Session s=accept();AtomicWorkbenchProvider.pending.endpoint.alive=false;check(!s.isAlive()&&!s.isCurrent(context),"dead Root authorized");});
  test("foreground user must match both sides of Provider IPC",()->{ActivityManager.user=1;reject();check(context.resolver.calls==0,"wrong user queried Provider");});
  test("user switch during Provider IPC rejected",()->{context.resolver.during=()->ActivityManager.user=1;reject();});
  test("secondary user uses its actual Provider",()->{var p=AtomicWorkbenchProvider.pending;p.uid=1010515;p.userId=10;auth=query();ActivityManager.user=10;
   Session s=accept();check(s.userId==10&&context.resolver.uri.equals("content://10@ls.augment.com.workbench"),"secondary user read user 0");});
  test("Provider failure fails closed and restores original caller",()->{context.resolver.fail=true;reject();});
  test("refresh Provider failure does not authorize",()->{Session s=accept();context.resolver.fail=true;check(!s.isCurrent(context),"failed refresh accepted");});
  test("response nonce substitution rejected",()->{context.resolver.responseChange=b->b.putString("nonce","c".repeat(32));reject();});
  test("response extra credentials rejected",()->{context.resolver.responseChange=b->b.putString("token","a".repeat(64));reject();});
  test("response metadata substitution rejected",()->{context.resolver.responseChange=b->b.putInt("uid",10516);reject();});
  test("response type substitution rejected",()->{context.resolver.responseChange=b->b.putInt("session",876);reject();});
  test("refresh owner substitution rejected",()->{Session s=accept();context.resolver.responseChange=b->b.putBinder("owner",new AtomicWorkbenchProvider.Live());check(!s.isCurrent(context),"changed owner accepted");});
  test("direct foreign Provider caller rejected",()->{Binder.uid=0;try{AtomicWorkbenchProvider.invoke(null,auth);throw new AssertionError();}catch(SecurityException expected){checks++;}});
  test("direct Provider extra payload rejected",()->{auth.putString("other","ignored");providerReject(null,auth);});
  test("direct Provider type substitution rejected",()->{auth.putInt("reset_generation",7);providerReject(null,auth);});
  test("direct Provider malformed token rejected",()->{auth.putString("token","private-session-token");providerReject(null,auth);});
  test("direct Provider non-null argument rejected",()->providerReject("read",auth));
  test("cleanup permit cannot authorize new work even while session is current",()->{
   Session s=AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);
   check(s.cleanupOnly&&s.isAlive()&&!s.isCurrent(context),"cleanup permit authorized a new mutation");});
  test("owned cleanup remains authentic after reset begins",()->{
   AtomicWorkbenchProvider.block();Session s=AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);
   check(s.cleanupOnly&&s.owner==AtomicWorkbenchProvider.pending.owner&&!s.isCurrent(context),"reset stranded owned cleanup");reject();});
  test("owned cleanup remains authentic after reset generation changes",()->{
   AtomicWorkbenchProvider.epoch(8);Session s=AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);
   check(s.cleanupOnly&&s.resetGeneration==7&&!s.isCurrent(context),"old owned cleanup lost its identity");reject();});
  test("owned cleanup may release prior user resources after foreground user switch",()->{
   ActivityManager.user=10;Session s=AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);
   check(s.cleanupOnly&&s.userId==0&&context.resolver.uri.equals("content://0@ls.augment.com.workbench"),"cleanup read wrong user");reject();});
  test("cleanup never accepts another Root PID",()->{Binder.pid=998;try{AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);throw new AssertionError();}catch(SecurityException expected){checks++;}});
  test("cleanup never accepts a replaced token",()->{auth.putString("token","c".repeat(64));try{AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);throw new AssertionError();}catch(SecurityException expected){checks++;}});
  test("cleanup never impersonates an owner that already died",()->{AtomicWorkbenchProvider.pending.owner.alive=false;
   try{AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context,auth,0,999);throw new AssertionError();}catch(SecurityException expected){checks++;}});
  System.out.println("SYSTEM ROOT AUTHORITY RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def run(authority, provider, label):
    with tempfile.TemporaryDirectory(prefix='duo-system-root-auth-') as temporary:
        work = Path(temporary)
        files = dict(STUBS)
        files['ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java'] = authority
        files['ls/augment/com/AtomicWorkbenchProvider.java'] = PROVIDER_HEAD + SUPPORT['member'](provider, 'private Bundle systemRootSession(') + SUPPORT['member'](provider, 'private static boolean systemSessionShape(') + '\n}'
        files['ls/augment/com/AtomicWorkbenchProtocol.java'] = 'package ls.augment.com;import java.security.MessageDigest;import java.nio.charset.StandardCharsets;final class AtomicWorkbenchProtocol{static final int VERSION=1;' + SUPPORT['member'](PROTOCOL.read_text(encoding='utf-8'), 'static boolean sameToken(') + '}'
        files['ls/augment/com/SystemAuthorityHarness.java'] = HARNESS
        paths = []
        for name, source in files.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
            paths.append(str(path))
        compiled = subprocess.run([JAVA['JAVAC'], '-encoding', 'UTF-8', '--release', '17', '-d', str(work), *paths], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        if compiled.returncode:
            raise AssertionError(f'{label} failed to compile\n{compiled.stderr}')
        result = subprocess.run([JAVA['JAVA'], '-Dfile.encoding=UTF-8', '-cp', str(work), 'ls.augment.com.SystemAuthorityHarness'], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)
        return result


if __name__ == '__main__':
    authority = AUTH.read_text(encoding='utf-8')
    provider = PROVIDER.read_text(encoding='utf-8')
    positive = run(authority, provider, 'production')
    print(positive.stdout, end='')
    if positive.returncode:
        raise SystemExit(positive.stderr)
    mutations = [
        ('actual Binder PID', authority.replace(' || Binder.getCallingPid() != callerPid', '', 1), provider),
        ('fresh reset fence', authority, provider.replace('result.putBoolean("current", !ResetWriteFence.blocked()\n                    && request.resetGeneration == ResetWriteFence.generation());', 'result.putBoolean("current", !ResetWriteFence.blocked());', 1)),
        ('token proof', authority, provider.replace('!AtomicWorkbenchProtocol.sameToken(request.token, extras.getString("token"))', 'false')),
        ('response nonce', authority.replace('!auth.getString("nonce").equals(response.getString("nonce"))', 'false', 1), provider),
        ('fresh Provider refresh', authority.replace('return owner.equals(verifiedOwner(fresh, query(context, fresh))) && isAlive();', 'return isAlive();', 1), provider),
        ('Provider system caller', authority, provider.replace('Binder.getCallingUid() != 1000', 'false', 1)),
        ('foreground user race', authority.replace('if (requireCurrentUser && currentUser() != auth.getInt("user", -1)) throw rejected();', '', 2), provider),
        ('cleanup permit cannot authorize new work', authority.replace('if (cleanupOnly || Process.myUid() != 1000 || !isAlive())', 'if (Process.myUid() != 1000 || !isAlive())', 1), provider),
    ]
    for label, changed_authority, changed_provider in mutations:
        if changed_authority == authority and changed_provider == provider:
            raise AssertionError('mutation did not apply: ' + label)
        negative = run(changed_authority, changed_provider, label)
        if negative.returncode == 0 or 'AssertionError' not in negative.stderr:
            raise AssertionError(f'negative control not killed by behavior: {label}\n{negative.stdout}\n{negative.stderr}')
        print('PASS negative control: ' + label)
    print('SYSTEM ROOT AUTHORITY NEGATIVE RESULT 8 killed')
