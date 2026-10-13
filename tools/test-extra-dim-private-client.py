"""Exercise the production async Extra Dim private bridge without device commands."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook/ExtraDimOwnershipClient.java'
java_home = os.environ.get('JAVA_HOME')
JAVAC = str(Path(java_home) / 'bin/javac') if java_home else shutil.which('javac')
JAVA = str(Path(java_home) / 'bin/java') if java_home else shutil.which('java')
assert JAVAC and JAVA, 'Set JAVA_HOME or put the Java development kit on PATH'
files = {
    'android/net/Uri.java': '''package android.net;public final class Uri{public final String value;private Uri(String v){value=v;}public static Uri parse(String s){return new Uri(s);}public String toString(){return value;}}''',
    'android/os/Bundle.java': '''package android.os;public final class Bundle{private final java.util.Map<String,Object> data=new java.util.HashMap<>();public void putInt(String k,int v){data.put(k,v);}public int getInt(String k,int d){Object v=data.get(k);return v instanceof Integer?(Integer)v:d;}public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k,boolean d){Object v=data.get(k);return v instanceof Boolean?(Boolean)v:d;}public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}}''',
    'android/os/Handler.java': '''package android.os;public final class Handler{private final java.util.Queue<Runnable> tasks=new java.util.concurrent.ConcurrentLinkedQueue<>();public boolean post(Runnable r){tasks.add(r);return true;}public void pump(){Runnable r;while((r=tasks.poll())!=null)r.run();}}''',
    'android/database/ContentObserver.java': '''package android.database;public abstract class ContentObserver{public ContentObserver(android.os.Handler h){}public void onChange(boolean selfChange){}}''',
    'android/content/Context.java': '''package android.content;public final class Context{public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}}''',
    'android/content/ContentResolver.java': r'''package android.content;
import android.os.Bundle;import android.net.Uri;import android.database.ContentObserver;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public final class ContentResolver{
 public final java.util.Map<Integer,Boolean> owned=new ConcurrentHashMap<>();public final java.util.Map<String,String> nativeValues=new ConcurrentHashMap<>();
 public final java.util.Map<ContentObserver,java.util.Set<String>> observers=new ConcurrentHashMap<>();
 public final AtomicInteger privateCalls=new AtomicInteger(),nativeCalls=new AtomicInteger(),mainCalls=new AtomicInteger(),registerCalls=new AtomicInteger();
 public volatile boolean fail,failRegistration,wrongUser;public volatile String blockKey;public volatile CountDownLatch entered,release;
 private void background(){if(!Thread.currentThread().getName().equals("LSA-ExtraDimOwnership")){mainCalls.incrementAndGet();throw new IllegalStateException("IPC on callback thread");}}
 public void registerContentObserver(Uri uri,boolean children,ContentObserver observer){background();registerCalls.incrementAndGet();if(failRegistration)throw new IllegalStateException("registration unavailable");observers.computeIfAbsent(observer,k->ConcurrentHashMap.newKeySet()).add(uri.toString());}
 public void unregisterContentObserver(ContentObserver observer){background();observers.remove(observer);}
 public void notifyUser(int user){for(var entry:observers.entrySet())if(entry.getValue().stream().anyMatch(s->s.startsWith("content://"+user+"@")))entry.getKey().onChange(false);}
 public Bundle call(Uri uri,String method,String key,Bundle args){background();Bundle b=new Bundle();if(method.equals("extra_dim_ownership")){privateCalls.incrementAndGet();if(fail)return null;int user=Integer.parseInt(uri.toString().substring("content://".length()).split("@")[0]);b.putBoolean("ok",true);b.putInt("user",wrongUser?user+1:user);b.putBoolean("owned",Boolean.TRUE.equals(owned.get(user)));}
 else if(method.equals("GET_secure")){nativeCalls.incrementAndGet();if(!key.equals("reduce_bright_colors_activated")&&!key.equals("reduce_bright_colors_level"))throw new AssertionError("custom Settings read: "+key);String value=nativeValues.get(args.getInt("_user",-1)+":"+key);if(key.equals(blockKey)){blockKey=null;entered.countDown();try{if(!release.await(3,TimeUnit.SECONDS))throw new AssertionError("barrier timeout");}catch(InterruptedException e){throw new RuntimeException(e);}}b.putString("value",value);}
 else throw new AssertionError(method);return b;}
 public void values(int user,boolean owner,boolean active,int level){owned.put(user,owner);nativeValues.put(user+":reduce_bright_colors_activated",active?"1":"0");nativeValues.put(user+":reduce_bright_colors_level",String.valueOf(level));}
 public void blockLevel(){entered=new CountDownLatch(1);release=new CountDownLatch(1);blockKey="reduce_bright_colors_level";}
}''',
    'ls/augment/com/hook/TestExtraDimPrivateClient.java': r'''package ls.augment.com.hook;
import android.content.*;import android.os.Handler;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public final class TestExtraDimPrivateClient {
 static int checks;static final Context context=new Context();static Handler handler=new Handler();static AtomicInteger changes=new AtomicInteger(),releases=new AtomicInteger();
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static ExtraDimOwnershipClient.State peek(int user){return ExtraDimOwnershipClient.peek(context,user,handler,owned->{changes.incrementAndGet();if(!owned)releases.incrementAndGet();});}
 static void until(java.util.function.BooleanSupplier predicate,String message)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(4);while(System.nanoTime()<end){handler.pump();if(predicate.getAsBoolean()){checks++;return;}Thread.sleep(5);}throw new AssertionError(message);}
 public static void main(String[] args)throws Exception {
  ContentResolver resolver=context.resolver;resolver.values(0,true,true,80);resolver.blockLevel();
  long start=System.nanoTime();check(!peek(0).owned,"first callback returns an empty memory snapshot");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<500,"native callback never waits for provider");
  check(resolver.entered.await(2,TimeUnit.SECONDS),"background worker reaches blocked native query");check(resolver.mainCalls.get()==0,"initial registration and reads stay off callback thread");
  resolver.release.countDown();until(()->peek(0).owned&&peek(0).strength==80,"initial private ownership synchronizes request");until(()->changes.get()==1,"new request posts once to native handler");
  int reads=resolver.privateCalls.get();for(int i=0;i<1000;i++)peek(0);Thread.sleep(80);check(reads==resolver.privateCalls.get(),"steady callback traffic reuses private memory with no polling");
  resolver.blockLevel();resolver.notifyUser(0);check(resolver.entered.await(2,TimeUnit.SECONDS),"refresh begins before concurrent native change");
  resolver.values(0,true,true,91);resolver.notifyUser(0);resolver.release.countDown();until(()->peek(0).strength==91,"notification arriving during IPC is replayed after the old response");
  resolver.blockLevel();resolver.notifyUser(0);check(resolver.entered.await(2,TimeUnit.SECONDS),"old user refresh held in flight");
  resolver.values(10,true,false,20);check(!peek(10).owned,"user switch cannot expose prior user request");resolver.release.countDown();until(()->peek(10).owned&&peek(10).strength==20&&!peek(10).active,"cross-user provider and native requests use target user");
  until(()->resolver.observers.values().stream().allMatch(uris->uris.stream().allMatch(uri->uri.startsWith("content://10@"))),"old user observer removed");
  resolver.wrongUser=true;resolver.notifyUser(10);until(()->!peek(10).owned,"wrong-user provider payload fails closed");resolver.wrongUser=false;resolver.notifyUser(10);until(()->peek(10).owned,"valid notification recovers failed read");
  resolver.values(10,true,true,101);resolver.notifyUser(10);until(()->!peek(10).owned,"invalid native strength never enters pipeline");resolver.values(10,true,true,37);resolver.notifyUser(10);until(()->peek(10).owned&&peek(10).strength==37,"valid native state recovers");
  resolver.fail=true;resolver.notifyUser(10);until(()->!peek(10).owned,"provider failure clears stale ownership");resolver.fail=false;resolver.notifyUser(10);until(()->peek(10).owned,"provider recovery re-applies live request");
  int beforeRelease=releases.get();resolver.owned.put(10,false);resolver.notifyUser(10);until(()->!peek(10).owned,"reset ownership invalidates cached request");until(()->releases.get()==beforeRelease+1,"ownership release requests one native restoration callback");int natives=resolver.nativeCalls.get();resolver.notifyUser(10);Thread.sleep(80);check(natives==resolver.nativeCalls.get(),"unowned features never read native request values");check(releases.get()==beforeRelease+1,"steady unowned notifications never take over native control");
  Handler previous=handler;handler=new Handler();resolver.values(10,true,false,29);resolver.blockLevel();check(!peek(10).owned,"replacement native handler receives a new binding");check(resolver.entered.await(2,TimeUnit.SECONDS),"replacement provider request executes independently");resolver.release.countDown();until(()->peek(10).owned&&peek(10).strength==29,"replacement service reloads private state");int priorChanges=changes.get();previous.pump();check(priorChanges==changes.get(),"stale native handler callbacks cannot act on replacement service");
  handler=new Handler();int registrations=resolver.registerCalls.get();resolver.failRegistration=true;peek(10);until(()->resolver.registerCalls.get()>registrations,"new binding attempts observer registration");resolver.failRegistration=false;until(()->peek(10).owned,"finite background retry repairs unavailable observer registration");
  check(resolver.mainCalls.get()==0,"all private/native reads and observer operations stay on background worker");
  check(!peek(-1).owned,"invalid foreground user never reuses previous ownership");
  System.out.println("PASS ExtraDimOwnershipClient: "+checks+" async/private/user/reset checks; no device commands");
 }
}'''
}
with tempfile.TemporaryDirectory(prefix='duo-extra-dim-private-') as folder:
    work = Path(folder)
    sources = [SRC]
    for name, source in files.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        sources.append(path)
    subprocess.run([JAVAC, '-encoding', 'UTF-8', '--release', '17', '-d', folder, *map(str, sources)], check=True)
    subprocess.run([JAVA, '-cp', folder, 'ls.augment.com.hook.TestExtraDimPrivateClient'], check=True, timeout=30)
