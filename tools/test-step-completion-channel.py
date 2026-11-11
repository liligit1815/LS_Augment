"""Execute production IPC admission and atomic finish boundaries with deterministic native fakes."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file, signature):
    source=(STEP/file).read_text(encoding='utf-8'); start=source.index(signature); end=source.index('{',start)+1; depth=1
    while depth: depth+=(source[end]=='{')-(source[end]=='}'); end+=1
    return source[start:end]
harness=r'''
import java.util.*;
public class CompletionCases {
 static int checks,executed,staged,applied,merged;static boolean failStage,previewValid=true;
 static boolean settledSideSnapshot(int[] expected){return previewValid&&expected!=null;}
 static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 interface IBinder {}
 static class Binder implements IBinder {
  static int uid=1020;static int getCallingUid(){return uid;}static long clearCallingIdentity(){return 0;}static void restoreCallingIdentity(long n){}
  protected boolean onTransact(int c,Parcel d,Parcel r,int f)throws RemoteException{return false;}
 }
 static class RemoteException extends Exception {}
 static class Intent {static final Object CREATOR=new Object();IBinder owner;Intent(IBinder b){owner=b;}Intent getExtras(){return this;}IBinder getBinder(String n){return owner;}}
 static class SurfaceControl {static class Transaction implements AutoCloseable {static final Object CREATOR=new Object();boolean closed,sync;public void close(){closed=true;}}}
 static class Parcel {
  IBinder owner;Object value;SurfaceControl.Transaction previews=new SurfaceControl.Transaction();int reads;ArrayList<IBinder> tokens=new ArrayList<>();boolean result,sync;String descriptor="ls.augment.com.step.WorkspaceChannel";
  void enforceInterface(String n){if(!n.equals(descriptor))throw new SecurityException();}IBinder readStrongBinder(){return owner;}
  @SuppressWarnings("unchecked") <T>T readTypedObject(Object creator){return (T)(reads++==0?value:previews);}
  ArrayList<IBinder> createBinderArrayList(){return tokens;}boolean readBoolean(){return sync;}
  int[] createIntArray(){return new int[]{7,-1,-1,-1,-1};}
  void writeNoException(){}void writeBoolean(boolean b){result=b;}
 }
 static class Handler {ArrayDeque<Runnable> work=new ArrayDeque<>();void post(Runnable r){work.add(r);}}
 static class Wm {static Object lock=new Object(),display=new Object(),ownedSpec=new Object();static boolean active=true;static Handler handler=new Handler();}
 static Object actualSpec=Wm.ownedSpec,replayPending=new Object();static int systemUiUid=1020,transitionReplays;
 static IBinder owner=new Binder();static boolean active=true,ending;static String session="test";
 static Object field(Object object,String n){return actualSpec;}
 static Object call(Object object,String n,Object... args){
  if(object instanceof SurfaceControl.Transaction t && n.equals("merge")){check(Thread.holdsLock(Wm.lock)&&staged==1,"side pose follows current main calibration under lease lock");merged++;return t;}
  if(object instanceof SurfaceControl.Transaction t && n.equals("apply")){check(Thread.holdsLock(Wm.lock),"finish apply stays under current-owner lock");t.sync=(Boolean)args[0];applied++;return null;}
  if(object instanceof Token t && n.equals("getToken"))return t.binder;if(n.equals("release"))return null;throw new AssertionError(n);
 }
 static void diagnostic(String stage,String detail){}
 static void execute(Intent intent){if(intent.owner==owner)executed++;}
 static void stageMagnification(Object tx){check(Thread.holdsLock(Wm.lock),"calibration and apply share the lock");if(failStage)throw new IllegalStateException("missing native path");staged++;}
 static class Token {IBinder binder=new Binder();}
 static class Pose {IBinder owner;Object root=new Object();List<Object> tasks=List.of(new Object());Pose(IBinder b){owner=b;}}
 static class NativeTransitionPose {static IdentityHashMap<Object,Pose> poses=new IdentityHashMap<>();static void startIn(Object tx,List<IBinder> tokens){check(Thread.holdsLock(Wm.lock),"start calibration under current lock");} FINISH_IN }
 static class Channel extends Binder {
  static final int COMMAND=1,FINISH=2,START=3;static final String DESCRIPTOR="ls.augment.com.step.WorkspaceChannel";final IBinder expected;
  Channel(IBinder expected){this.expected=expected;} ON_TRANSACT
 }
 STALE
 static void fresh(){owner=new Binder();active=true;ending=false;Wm.active=true;actualSpec=Wm.ownedSpec;replayPending=new Object();
  Binder.uid=systemUiUid;executed=staged=applied=merged=transitionReplays=0;failStage=false;Wm.handler=new Handler();NativeTransitionPose.poses.clear();}
 static Parcel finishData(){Parcel d=new Parcel();d.owner=owner;d.value=new SurfaceControl.Transaction();d.tokens.add(new Binder());return d;}
 public static void main(String[] args)throws Exception{
  for(int combination=0;combination<64;combination++){
   boolean lease=(combination&1)!=0,running=(combination&2)!=0,settled=(combination&4)!=0,recents=(combination&8)!=0,foreground=(combination&16)!=0;
   int display=(combination&32)==0?0:1;
   boolean expected=lease&&running&&settled&&recents&&!foreground&&display==0;
   check(stale(lease,display,running,settled,recents?"RECENTS":"HOME",foreground)==expected,"native recovery boundary "+combination);
  }
  fresh();Channel c=new Channel(owner);Parcel d=finishData(),r=new Parcel();d.sync=true;
  Token match=new Token(),unrelated=new Token();NativeTransitionPose.poses.put(match,new Pose(owner));NativeTransitionPose.poses.put(unrelated,new Pose(owner));d.tokens= new ArrayList<>(List.of(match.binder));
  check(c.onTransact(2,d,r,0)&&r.result&&staged==1&&applied==1,"current finish has one calibrated atomic apply");
  check(((SurfaceControl.Transaction)d.value).sync&&((SurfaceControl.Transaction)d.value).closed,"native sync flag and close retained");
  check(merged==1&&d.previews.closed,"side pose merged atomically and closed");
  check(!NativeTransitionPose.poses.containsKey(match)&&NativeTransitionPose.poses.containsKey(unrelated),"only exact finishing pose relinquishes its task exclusions");
  fresh();c=new Channel(owner);d=finishData();r=new Parcel();match=new Token();NativeTransitionPose.poses.put(match,new Pose(owner));d.tokens=new ArrayList<>(List.of(match.binder));
  c.onTransact(3,d,r,0);check(r.result&&merged==1&&NativeTransitionPose.poses.containsKey(match),"native start merges current panes and retains animation ownership");
  fresh();previewValid=false;c=new Channel(owner);d=finishData();r=new Parcel();c.onTransact(2,d,r,0);
  check(r.result&&merged==0&&applied==1,"role changed in transit: preserve native/main finish without stale side transform");previewValid=true;
  for(int mode=0;mode<8;mode++){
   fresh();c=new Channel(owner);d=finishData();r=new Parcel();switch(mode){case 0:owner=new Binder();break;case 1:active=false;break;case 2:ending=true;break;case 3:Wm.active=false;break;case 4:actualSpec=new Object();break;case 5:replayPending=null;break;case 6:d.tokens.clear();break;case 7:while(d.tokens.size()<17)d.tokens.add(new Binder());break;}
   c.onTransact(2,d,r,0);check(!r.result&&staged==0&&applied==0&&merged==0&&d.previews.closed,"native transaction preserved for closed/foreign/unknown session "+mode);
  }
  for(int mode=0;mode<3;mode++){
   fresh();c=new Channel(owner);d=finishData();r=new Parcel();if(mode==0)Binder.uid=2000;if(mode==1)d.owner=new Binder();if(mode==2)d.descriptor="spoof";
   try{c.onTransact(2,d,r,0);throw new AssertionError("untrusted IPC admitted");}catch(SecurityException expected){checks++;}
   check(staged==0&&applied==0,"untrusted caller makes no surface writes");
  }
  fresh();c=new Channel(owner);d=new Parcel();d.owner=owner;d.value=new Intent(owner);
  c.onTransact(1,d,null,1);check(executed==0&&Wm.handler.work.size()==1,"commands enter existing WM queue, never execute under incoming Binder identity");
  Wm.handler.work.remove().run();check(executed==1,"one command, one dispatch");
  fresh();c=new Channel(owner);d=new Parcel();d.owner=owner;d.value=new Intent(new Binder());
  try{c.onTransact(1,d,null,1);throw new AssertionError("wrong payload owner");}catch(SecurityException expected){checks++;}
  System.out.println("PASS "+checks+" production completion channel and gesture recovery checks");
 }
}
'''.replace('ON_TRANSACT',method('WorkspaceChannel.java','@Override protected boolean onTransact(')).replace('FINISH_IN',method('NativeTransitionPose.java','static void finishIn(')).replace('STALE',method('WorkspaceGestureRecovery.java','static boolean stale('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-channel-') as tmp:
    folder=Path(tmp);source=folder/'CompletionCases.java';source.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,source],check=True)
    subprocess.run([java/'java','-cp',folder,'CompletionCases'],check=True)
