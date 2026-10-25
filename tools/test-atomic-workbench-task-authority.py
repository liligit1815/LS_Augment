"""Actual TaskAuthority Parcel protocol -> actual Hook.handle -> actual broker against WM adapters.

Shared SystemRootAuthority is an explicit authentication boundary double here; its real Provider
cross-Binder behavior has an independent suite. No phone or real Binder driver is accessed.
"""
from pathlib import Path
import runpy
import tempfile

BROKER = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-broker.py')))
MODELS = BROKER['MODELS']
SOURCES = dict(BROKER['SOURCES'])
SOURCES['ls/augment/com/hook/TestTaskBroker.java'] = BROKER['TEST']
SOURCES['android/os/IBinder.java'] = SOURCES['android/os/IBinder.java'].replace('boolean isBinderAlive();', 'boolean isBinderAlive();default boolean transact(int code,Parcel data,Parcel reply,int flags)throws Exception{return false;}')
SOURCES['android/os/Parcel.java'] = r'''package android.os;import java.util.*;public class Parcel{
 public final ArrayList<Object> values=new ArrayList<>();public int read,sizeOverride;public boolean recycled;public static int obtains,recycles;
 public static Parcel obtain(){obtains++;return new Parcel();}public void recycle(){recycled=true;recycles++;}
 public void writeInterfaceToken(String s){writeString(s);}public void enforceInterface(String s){if(!s.equals(readString()))throw new SecurityException();}
 public void writeInt(int n){values.add(n);}public int readInt(){return (Integer)values.get(read++);}public void writeString(String s){values.add(s);}public String readString(){return (String)values.get(read++);}
 public void writeBundle(Bundle b){values.add(new Bundle(b));}public Bundle readBundle(ClassLoader l){return (Bundle)values.get(read++);}
 public int dataAvail(){return values.size()-read;}public int dataSize(){return sizeOverride>0?sizeOverride:values.size()*8;}
 public void writeNoException(){writeInt(0);}public void readException(){if(readInt()!=0)throw new SecurityException();}
}'''
SOURCES['android/os/ServiceManager.java'] = 'package android.os;public class ServiceManager{public static IBinder service;public static IBinder getService(String name){if(!name.equals("window"))throw new AssertionError("wrong service");return service;}}'
SOURCES['ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java'] = r'''package ls.augment.com.hook;import android.os.*;import android.content.Context;
public class AtomicWorkbenchSystemRootAuthority{
 public static Session current;public static Object wmLock;public static int fresh,clean;public static boolean currentAllowed=true;
 public static class Session{public int rootPid=123,moduleUid=10055,userId;public long session=7,resetGeneration=2;public IBinder endpoint,owner;public boolean cleanupOnly;public boolean isAlive(){return endpoint.isBinderAlive()&&owner.isBinderAlive();}public boolean isCurrent(Context c){if(Thread.holdsLock(wmLock))throw new AssertionError("Provider under WMS lock");return !cleanupOnly&&currentAllowed&&isAlive();}}
 public static Session authenticate(Context c,Bundle b,int u,int p){if(Thread.holdsLock(wmLock))throw new AssertionError("auth under WMS lock");fresh++;if(u!=0||p!=current.rootPid||!currentAllowed)throw new SecurityException();return current;}
 public static Session authenticateCleanup(Context c,Bundle b,int u,int p){if(Thread.holdsLock(wmLock))throw new AssertionError("cleanup auth under WMS lock");clean++;if(u!=0||p!=current.rootPid)throw new SecurityException();return current;}
public static Session authenticateRetainedCleanup(Session cached,Bundle b,int u,int p){throw new AssertionError("retained auth outside original authority fixture");}}'''
SOURCES['ls/augment/com/hook/TaskBrokerBridge.java'] = r'''package ls.augment.com.hook;import android.os.*;import ls.augment.com.*;
public class TaskBrokerBridge{
 final TestTaskBroker.Fixture fixture;public TaskBrokerBridge()throws Exception{fixture=new TestTaskBroker.Fixture();AtomicWorkbenchSystemRootAuthority.current=fixture.owner;AtomicWorkbenchSystemRootAuthority.wmLock=fixture.s.mGlobalLock;AtomicWorkbenchSystemRootAuthority.currentAllowed=true;}
 public Bundle window(){return fixture.window(fixture.one,0,TestTaskBroker.SESSION);}
 public AtomicWorkbenchTaskOperationRequest request(AtomicWorkbenchTaskOperationRequest.Action action)throws Throwable{return fixture.request(fixture.a,action);}
 public void handle(Parcel in,Parcel out)throws Throwable{TestTaskBroker.invoke("handle",new Class<?>[]{Object.class,Parcel.class,Parcel.class},fixture.s,in,out);}
 public void replaceOwner(){fixture.endpoint.die();var owner=new AtomicWorkbenchSystemRootAuthority.Session();owner.endpoint=new TestTaskBroker.Live();owner.owner=fixture.app;owner.session=8;fixture.owner=owner;AtomicWorkbenchSystemRootAuthority.current=owner;}
 public int moves(){return fixture.a.moves;}public int display(){return fixture.a.content.mDisplay.id;}public int hidden(){return fixture.a.mForceHiddenFlags;}
}'''
TEST = r'''package ls.augment.com;import android.os.*;import android.content.Context;import java.util.*;import ls.augment.com.hook.*;import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public class TestTaskAuthority{
 static int cases,checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}interface Case{void run()throws Throwable;}static void test(String n,Case c)throws Throwable{c.run();cases++;System.out.println("PASS real task IPC chain: "+n);}
 static final class Remote implements IBinder{final TaskBrokerBridge bridge;String mode="";int calls;boolean alive=true;Remote(TaskBrokerBridge b){bridge=b;}public boolean isBinderAlive(){return alive;}public void linkToDeath(DeathRecipient r,int flags){}
 public boolean transact(int code,Parcel in,Parcel out,int flags)throws Exception{calls++;check(code==AtomicWorkbenchTaskAuthority.TRANSACTION&&flags==0,"wrong IPC route");if(mode.equals("false"))return false;if(mode.equals("throw"))throw new Exception("transport");
  try{bridge.handle(in,out);}catch(Throwable failure){throw new Exception(failure);}Bundle b=(Bundle)out.values.get(3);
  if(mode.equals("echo"))out.values.set(2,"0".repeat(32));if(mode.equals("trailing"))out.writeInt(4);if(mode.equals("oversize"))out.sizeOverride=128*1024+1;
  if(mode.equals("schema"))b.putString("schema","1");if(mode.equals("missing"))b.remove("mutation_dispatched");if(mode.equals("contradictory")){b.putBoolean("success",true);b.putBoolean("cleanup_pending",true);}if(mode.equals("after"))throw new Exception("reply lost after dispatch");return true;}
 }
 static final class Fixture{final TaskBrokerBridge bridge=new TaskBrokerBridge();final Remote remote=new Remote(bridge);final AtomicWorkbenchTaskAuthority authority;int nonces;
 Fixture()throws Exception{Binder.uid=0;Binder.pid=123;ServiceManager.service=remote;authority=new AtomicWorkbenchTaskAuthority(new Context(),this::auth);}
 Bundle auth(){Bundle b=new Bundle();b.putInt("version",1);b.putInt("uid",10055);b.putInt("user",0);b.putLong("session",AtomicWorkbenchSystemRootAuthority.current.session);b.putLong("reset_generation",AtomicWorkbenchSystemRootAuthority.current.resetGeneration);b.putInt("root_pid",123);b.putBinder("endpoint",AtomicWorkbenchSystemRootAuthority.current.endpoint);b.putString("token","a".repeat(64));b.putString("nonce",String.format("%032x",++nonces));return b;}
 }
 static void unknown(Case call,boolean attempted)throws Throwable{boolean seen=false;try{call.run();}catch(AtomicWorkbenchTaskAuthority.Unconfirmed expected){seen=expected.mutationAttempted==attempted;}check(seen,"unknown did not retain correct mutation attempt responsibility");}
 public static void main(String[]args)throws Throwable{
  test("actual describe and primary metadata arrive through authenticated Parcel route",()->{Fixture f=new Fixture();Bundle d=f.authority.describe(f.bridge.window());check(d.getBoolean("success")&&d.<Bundle>getParcelableArrayList("tasks").size()==2,"describe not actual eligible leaves");Bundle p=f.authority.primaryDisplay().getBundle("primary_display");check(p.getInt("display_id")==0&&p.getString("display_unique").equals("local:0"),"primary identity guessed");check(Binder.uid==0&&f.nonces==2,"identity not restored/fresh nonce missing");});
  test("prepare/apply/query real chain moves exact leaf once without replay",()->{Fixture f=new Fixture();var r=f.bridge.request(SHELVE);Bundle p=f.authority.prepare(r);Bundle b=f.authority.apply(r.operationId,p.getString("ticket"));check(b.getBoolean("success")&&f.bridge.moves()==1&&f.bridge.display()==0&&f.bridge.hidden()==2,"mutation chain failed");f.authority.query(r.operationId);check(f.bridge.moves()==1,"query replayed");var ids=new ArrayList<String>();ids.add(r.operationId);Bundle proof=f.authority.inspect(ids).<Bundle>getParcelableArrayList("operations").get(0);check(proof.getBoolean("scope_current")&&proof.getBoolean("hidden_lease"),"batch inspection lost exact lease");});
  test("lost real reply after mutation remains unknown then read confirms exact task",()->{Fixture f=new Fixture();var r=f.bridge.request(SHELVE);var p=f.authority.prepare(r);f.remote.mode="after";unknown(()->f.authority.apply(r.operationId,p.getString("ticket")),true);check(f.bridge.moves()==1&&f.bridge.hidden()==2,"transport error erased real side effect");f.remote.mode="";check(f.authority.query(r.operationId).getBoolean("success")&&f.bridge.moves()==1,"read confirmation repeated mutation");});
  for(String mode:new String[]{"false","throw","echo","trailing","oversize","schema"})test("malformed/unavailable response is explicit unknown: "+mode,()->{Fixture f=new Fixture();f.remote.mode=mode;unknown(()->f.authority.describe(f.bridge.window()),false);check(Binder.uid==0,"rejection leaked Binder identity");});
  for(String mode:new String[]{"missing","contradictory"})test("apply proof cannot downgrade malformed acknowledgement: "+mode,()->{Fixture f=new Fixture();var r=f.bridge.request(SHELVE);var p=f.authority.prepare(r);f.remote.mode=mode;unknown(()->f.authority.apply(r.operationId,p.getString("ticket")),true);check(f.bridge.moves()==1,"proof failure replayed/lost action");});
  test("stale normal authentication cannot mutate but exact cleanup still un-hides",()->{Fixture f=new Fixture();var r=f.bridge.request(SHELVE);var p=f.authority.prepare(r);f.authority.apply(r.operationId,p.getString("ticket"));AtomicWorkbenchSystemRootAuthority.currentAllowed=false;Bundle rejected=f.authority.primaryDisplay();check(!rejected.getBoolean("success"),"stale principal admitted new work");Bundle cleaned=f.authority.release(r.operationId);check(cleaned.getBoolean("cleanup_complete")&&f.bridge.hidden()==0&&f.bridge.display()==0,"cleanup depends on current config");check(AtomicWorkbenchSystemRootAuthority.clean>0,"cleanup used normal authentication");});
  test("new principal may clean exact old dead-owner lease without replay",()->{Fixture f=new Fixture();var r=f.bridge.request(SHELVE);var p=f.authority.prepare(r);f.authority.apply(r.operationId,p.getString("ticket"));check(f.bridge.hidden()==2,"setup lease absent");f.bridge.replaceOwner();Bundle released=f.authority.release(r.operationId);check(released.getBoolean("cleanup_complete")&&f.bridge.hidden()==0&&f.bridge.moves()==1&&f.bridge.display()==0,"dead owner exact cleanup rejected or replayed");});
  test("all obtained parcels are recycled including transport/malformed errors",()->{check(Parcel.obtains==Parcel.recycles,"Parcel ownership leaked");});
  System.out.println("TASK AUTHORITY RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources = dict(SOURCES)
    sources['ls/augment/com/TestTaskAuthority.java'] = TEST
    production = ['AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskOperationRequest.java', 'AtomicWorkbenchTaskAuthority.java', 'hook/AtomicWorkbenchTaskOperationHook.java']
    with tempfile.TemporaryDirectory(prefix='duo-task-ipc-') as directory:
        MODELS['compile_run'](Path(directory) / 'base', sources, production, 'ls.augment.com.TestTaskAuthority')
        controls=[
            ('nonce echo','!nonce.equals(reply.readString())','(reply.readString()==null && false)'),
            ('trailing parcel','reply.dataAvail() != 0 ||',''),
            ('bounded reply','reply.dataSize() > 128 * 1024 ||',''),
            ('typed schema','!(result.get("schema") instanceof Integer)\n                    || result.getInt("schema") != 1','false'),
            ('dispatch uncertainty ownership','attempted = mutation;','attempted = false;'),
            ('success contradiction','|| result.getBoolean("cleanup_pending") || result.getBoolean("operation_unconfirmed")','|| result.getBoolean("operation_unconfirmed")'),
            ('reply parcel ownership','data.recycle(); reply.recycle();','data.recycle();'),
        ]
        for number,(label,old,new) in enumerate(controls):
            result=MODELS['compile_run'](Path(directory)/f'negative-{number}',sources,production,
                'ls.augment.com.TestTaskAuthority',replacements={'ls/augment/com/AtomicWorkbenchTaskAuthority.java':(old,new)},capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr,'authority negative escaped or failed compilation: '+label
            print('PASS real task IPC production negative:',label)
        print('TASK AUTHORITY NEGATIVE CONTROLS',len(controls),'passed')



if __name__ == '__main__':
    main()
