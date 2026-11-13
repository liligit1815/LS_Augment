"""Execute production top boundary and complete-stream ownership against GameAssist races."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SOURCE=(ROOT/'android/app/src/main/java/ls/augment/com/step/GameGestureGate.java').read_text('utf-8')
def method(signature):
    a=SOURCE.index(signature);b=SOURCE.index('{',a)+1;depth=1
    while depth:depth+=(SOURCE[b]=='{')-(SOURCE[b]=='}');b+=1
    return SOURCE[a:b]
code=r'''
import java.util.*;
public class GameGestureCases {
 static int checks;static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 static class MotionEvent{static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;}
 static final WeakHashMap<Object,Boolean> streams=new WeakHashMap<>();
 static final int HIT=1;static final String DESCRIPTOR="test";
 static int gameUid(Object context){return 10364;}
 static class Shell {static Object context=new Object();}
 interface IBinder{}
 static class RemoteException extends Exception{}
 static class Binder implements IBinder {
  static int uid=10364;static int getCallingUid(){return uid;}
  static long clearCallingIdentity(){int old=uid;uid=1000;return old;}static void restoreCallingIdentity(long old){uid=(int)old;}
  protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException{return false;}
 }
 static class Parcel {int display;float x=8,y=320;int reads;boolean result;String descriptor=DESCRIPTOR;
  void enforceInterface(String expected){if(!descriptor.equals(expected))throw new SecurityException();}
  int readInt(){return display;}float readFloat(){return reads++==0?x:y;}void writeNoException(){}void writeBoolean(boolean b){result=b;}}
 static class WorkspaceLayout {int width=1216,contentHeight=684;}
 static class Toolbar {boolean ready=true;boolean usable(){check(Binder.uid==1000,"host probes run with host identity");return ready;}}
 static class WorkspaceQuickBar {Toolbar sideToolbar=new Toolbar();}
 static class LiveWorkspace {static LiveWorkspace current;boolean ready=true,closing,closed;WorkspaceQuickBar quickBar=new WorkspaceQuickBar();WorkspaceLayout geometry=new WorkspaceLayout();}
 static final String STATE="state",QUERY="query";static Object main=new Object();static boolean bound;static IBinder endpoint;static long until;static int failures;
 static void diagnostic(String a,String b){failures++;}static class BuildConfig{static final int VERSION_CODE=20876;}
 static class SystemClock{static long uptimeMillis(){return 10000;}}
 static class Bundle{IBinder gate;IBinder getBinder(String n){return gate;}}
 static class Intent{int version=BuildConfig.VERSION_CODE;long deadline=14000;Bundle extras=new Bundle();Intent(String n){}Intent setPackage(String n){return this;}
  int getIntExtra(String n,int fallback){return version;}long getLongExtra(String n,long fallback){return deadline;}Bundle getExtras(){return extras;}}
 static class IntentFilter{IntentFilter(String n){}}
 static class BroadcastOptions{static BroadcastOptions makeBasic(){return new BroadcastOptions();}BroadcastOptions setShareIdentityEnabled(boolean on){return this;}Bundle toBundle(){return new Bundle();}}
 static abstract class BroadcastReceiver{static int sender=1000;int getSentFromUid(){return sender;}public abstract void onReceive(Context c,Intent i);}
 static class Context{static final int RECEIVER_EXPORTED=2;boolean fail;BroadcastReceiver receiver;
  void registerReceiver(BroadcastReceiver r,IntentFilter f,Object permission,Object handler,int flags){if(fail)throw new SecurityException("missing registration capability");receiver=r;}
  void sendBroadcast(Intent i,Object permission,Bundle b){} }
 TOP SUPPRESS HOST BIND
 static boolean query(IBinder gate,float y)throws Exception{Parcel p=new Parcel(),r=new Parcel();p.y=y;((Binder)gate).onTransact(HIT,p,r,0);check(Binder.uid==10364,"caller identity restored");return r.result;}
 public static void main(String[] args)throws Exception{
  Context context=new Context();context.fail=true;bind(context);check(!bound && endpoint==null && until==0 && failures==1,"missing receiver capability cannot crash native application attach");
  context.fail=false;bind(context);check(bound && context.receiver!=null,"verified context binds once");
  Intent state=new Intent(STATE);state.extras.gate=new Binder();BroadcastReceiver.sender=12345;context.receiver.onReceive(context,state);check(endpoint==null,"forged sender ignored");
  BroadcastReceiver.sender=1000;state.version=0;context.receiver.onReceive(context,state);check(endpoint==null,"mismatched module version ignored");
  state.version=BuildConfig.VERSION_CODE;context.receiver.onReceive(context,state);check(endpoint==state.extras.gate && until==14000,"authenticated bounded lease accepted");
  state.deadline=0;context.receiver.onReceive(context,state);check(endpoint==null && until==0,"workspace exit releases client endpoint");
  state.deadline=16000;context.receiver.onReceive(context,state);check(endpoint==null && until==0,"unbounded stale lease refused");
  LiveWorkspace host=LiveWorkspace.current=new LiveWorkspace();IBinder gate=host(host);
  check(query(gate,320),"live authenticated top hit");check(!query(gate,800),"live main remains native");
  for(int mode=0;mode<7;mode++){
   host=LiveWorkspace.current=new LiveWorkspace();gate=host(host);
   switch(mode){case 0:host.ready=false;break;case 1:host.closing=true;break;case 2:host.closed=true;break;
    case 3:host.quickBar.sideToolbar.ready=false;break;case 4:LiveWorkspace.current=new LiveWorkspace();break;
    case 5:host.geometry=null;break;case 6:host.quickBar=null;break;}
   check(!query(gate,320),"stale, absent or unavailable host retains native gesture "+mode);
  }
  Binder.uid=12345;try{query(gate,320);throw new AssertionError("foreign caller");}catch(SecurityException expected){checks++;}finally{Binder.uid=10364;}
  Parcel bad=new Parcel();bad.descriptor="foreign";try{((Binder)gate).onTransact(HIT,bad,new Parcel(),0);throw new AssertionError("bad protocol");}catch(SecurityException expected){checks++;}
  for(float x:new float[]{0,8,600,1208,1215})for(float y:new float[]{0,120,320,683})check(top(true,0,x,y,1216,684),"entire top belongs to live toolbar");
  for(float[] xy:new float[][]{{8,684},{1208,900},{-1,20},{1216,20},{8,-1},{Float.NaN,20},{20,Float.POSITIVE_INFINITY}})
   check(!top(true,0,xy[0],xy[1],1216,684),"main and invalid coordinates keep original game gesture");
  check(!top(false,0,8,120,1216,684),"absent or busy toolbar keeps native input");
  check(!top(true,1,8,120,1216,684),"other display keeps native input");
  Object a=new Object(),b=new Object();
  check(suppress(a,0,true),"top DOWN never arms GameAssist");
  check(suppress(a,2,false),"moving from top into main retains original stream owner");
  check(!suppress(b,0,false),"concurrent helper main DOWN remains native");
  check(!suppress(b,2,true),"moving from main into top never steals game gesture");
  check(suppress(a,1,false) && !streams.containsKey(a),"top UP suppressed and ownership cleared");
  check(!suppress(b,1,true) && streams.isEmpty(),"main UP forwarded and ownership cleared");
  check(suppress(a,0,true) && suppress(a,3,false) && streams.isEmpty(),"CANCEL clears top ownership");
  check(!suppress(a,2,true),"orphan MOVE never intercepted");
  suppress(a,0,true);check(!suppress(a,0,false),"new native DOWN replaces abandoned old stream");
  check(!suppress(a,1,false),"release returns all subsequent game input");
  System.out.println("PASS "+checks+" GameAssist top/main ownership checks");
 }
}
'''.replace('TOP',method('static boolean top(')).replace('SUPPRESS',method('static boolean suppress(')).replace('HOST',method('static IBinder host(')).replace('BIND',method('static void bind(').replace('ls.augment.com.BuildConfig','BuildConfig'))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-game-gesture-') as tmp:
    p=Path(tmp);f=p/'GameGestureCases.java';f.write_text(code,'utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True)
    subprocess.run([java/'java','-cp',p,'GameGestureCases'],check=True)
