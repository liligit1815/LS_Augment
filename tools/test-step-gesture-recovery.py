"""Exercise production constructor interception against old/new/subclass/missing Quickstep APIs."""
from pathlib import Path
import os,re,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'android/app/src/main/java/ls/augment/com/step/WorkspaceGestureRecovery.java').read_text(encoding='utf-8')
source=re.sub(r'^(package|import) .*?;\s*','',source,flags=re.M).replace('final class WorkspaceGestureRecovery {','static final class WorkspaceGestureRecovery {')
harness=r'''
import java.util.*;import java.lang.reflect.*;
public class GestureCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class Activity {boolean foreground;public boolean hasWindowFocus(){return foreground;}}
 static class SystemClock {static long uptimeMillis(){return 100;}}
 static class WorkspaceGestureGate {static boolean lease=true;static boolean leased(long now){return lease;}}
 static class StepRuntime {static String stage;static void diagnostic(String s,String d){stage=s;}}
 static class OwnershipBridge {
  static Method method(Class<?> c,String n,Class<?>...args)throws NoSuchMethodException{
   for(Class<?> p=c;p!=null;p=p.getSuperclass())try{Method m=p.getDeclaredMethod(n,args);m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}
   throw new NoSuchMethodException(n);
  }
 }
 static class StepMembers {static Field findField(Class<?> c,String n)throws NoSuchFieldException{
  for(Class<?> p=c;p!=null;p=p.getSuperclass())try{Field f=p.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}
  throw new NoSuchFieldException(n);
 }}
 interface Interceptor {Object run(Chain c)throws Throwable;}
 static class Chain {List<Object> args;boolean proceeded;Chain(Object... a){args=Arrays.asList(a);}List<Object> getArgs(){return args;}Object proceed(){proceeded=true;return "native";}}
 static class AugmentModule {Interceptor callback;AugmentModule hook(Constructor<?> c){return this;}void intercept(Interceptor i){callback=i;}}
 static class OldUi {Activity activity=new Activity();Activity getCreatedActivity(){return activity;}}
 static class NewUi {Activity activity=new Activity();Activity getCreatedContainer(){return activity;}}
 static class UiChild extends NewUi {}
 static class State {static int STATE_END_TARGET_ANIMATION_FINISHED=16;int display;boolean settled=true;String target="RECENTS";
  int getDisplayId(){return display;}String getEndTarget(){return target;}boolean hasState(int n){return settled&&n==16;}}
 static class OldState extends State {OldUi ui=new OldUi();OldUi getActivityInterface(){return ui;}}
 static class NewState extends State {NewUi ui=new UiChild();NewUi getContainerInterface(){return ui;}}
 static class Manager {boolean running=true;int ends;boolean toRecents,force;boolean isRecentsAnimationRunning(){return running;}
  void end(boolean r,boolean f){toRecents=r;force=f;running=false;ends++;}}
 static class OldManager extends Manager {OldState mLastGestureState=new OldState();void finishRunningRecentsAnimation(boolean r,boolean f){end(r,f);}}
 static class OldChild extends OldManager {}
 static class NewManager extends Manager {NewState mLastGestureState=new NewState();
  void finishRunningRecentsAnimation(boolean r,boolean f,Runnable callback,com.android.quickstep.util.ActiveGestureLog.CompoundString reason){
   check(callback==null&&reason!=null,"new native completion keeps reason and optional callback");end(r,f);}}
 static class MissingManager extends Manager {NewState mLastGestureState=new NewState();}
 static class OldConsumer {OldConsumer(OldManager m,OldState s){}}
 static class ChildConsumer {ChildConsumer(OldChild m,OldState s){}}
 static class NewConsumer {NewConsumer(NewManager m,NewState s){}}
 static class MissingConsumer {MissingConsumer(MissingManager m,NewState s){}}
 PRODUCTION
 static AugmentModule install(Class<?> consumer,Class<?> manager,Class<?> state){
  AugmentModule module=new AugmentModule();WorkspaceGestureRecovery.install(module,consumer,manager,state,GestureCases.class.getClassLoader());return module;
 }
 public static void main(String[] args)throws Throwable {
  AugmentModule old=install(OldConsumer.class,OldManager.class,OldState.class);OldManager om=new OldManager();Chain chain=new Chain(om,new OldState());
  check(old.callback!=null,"old native API recognized");Object answer=old.callback.run(chain);
  check(om.ends==1&&!om.toRecents&&om.force&&chain.proceeded&&"native".equals(answer),"old stale session finished synchronously before native construction");
  AugmentModule child=install(ChildConsumer.class,OldChild.class,OldState.class);OldChild cm=new OldChild();child.callback.run(new Chain(cm,new OldState()));check(cm.ends==1,"inherited manager fields/methods retained");
  AugmentModule modern=install(NewConsumer.class,NewManager.class,NewState.class);NewManager nm=new NewManager();modern.callback.run(new Chain(nm,new NewState()));check(nm.ends==1,"new signature and UI subclass recognized");
  for(int mode=0;mode<7;mode++){
   nm=new NewManager();NewState incoming=new NewState();WorkspaceGestureGate.lease=true;
   switch(mode){case 0:WorkspaceGestureGate.lease=false;break;case 1:incoming.display=1;break;case 2:nm.running=false;break;case 3:nm.mLastGestureState.settled=false;break;case 4:nm.mLastGestureState.target="HOME";break;case 5:nm.mLastGestureState.ui.activity.foreground=true;break;case 6:nm.mLastGestureState=null;break;}
   chain=new Chain(nm,incoming);modern.callback.run(chain);check(nm.ends==0&&chain.proceeded,"valid native activity remains untouched "+mode);
  }
  WorkspaceGestureGate.lease=true;nm=new NewManager();nm.mLastGestureState.ui=null;chain=new Chain(nm,new NewState());modern.callback.run(chain);check(nm.ends==0&&chain.proceeded,"missing UI instance preserves native path");
  check(install(MissingConsumer.class,MissingManager.class,NewState.class).callback==null&&"GESTURE_RECOVERY_UNAVAILABLE".equals(StepRuntime.stage),"missing completion API records capability and installs no fake fix");
  System.out.println("PASS "+checks+" production old/new/inherited/missing gesture recovery checks");
 }
}
'''.replace('PRODUCTION',source)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-recovery-') as tmp:
    root=Path(tmp);main=root/'GestureCases.java';main.write_text(harness,encoding='utf-8')
    text=root/'com/android/quickstep/util/ActiveGestureLog.java';text.parent.mkdir(parents=True)
    text.write_text('package com.android.quickstep.util;public class ActiveGestureLog {public static class CompoundString {public CompoundString(String s,Object...args){}}}',encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',root,main,text],check=True)
    subprocess.run([java/'java','-cp',root,'GestureCases'],check=True)
