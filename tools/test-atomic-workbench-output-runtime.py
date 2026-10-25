"""Actual Platform/Engine output ownership, with OS/VD and native-focus proof boundaries."""
from pathlib import Path
import os
import runpy
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOME = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-runtime.py")))
SUPPORT = HOME["SUPPORT"]

VD = r'''package android.hardware.display;import android.view.*;public class VirtualDisplay {
 public final Display display;public boolean released;public int releases,resizes,sets,failMode;public Surface surface;
 public VirtualDisplay(Display display){this.display=display;}public Display getDisplay(){return display;}
 public void release(){releases++;released=true;}public void resize(int w,int h,int d){resizes++;}
 public void setSurface(Surface surface){sets++;if(failMode==1)throw new IllegalStateException("setter before reply");this.surface=surface;if(failMode==2)throw new IllegalStateException("setter reply lost");}
}'''

MOTION = r'''package android.view;public class MotionEvent extends InputEvent {
 public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;
 public int action;public long down=1000,time=1000;public boolean recycled;
 public static MotionEvent obtain(MotionEvent e){MotionEvent c=new MotionEvent();c.action=e.action;c.down=e.down;c.time=e.time;return c;}
 public int getActionMasked(){return action;}public int getPointerCount(){return 1;}public long getDownTime(){return down;}public long getEventTime(){return time;}
 public float getX(int p){return 10;}public float getY(int p){return 20;}public void setSource(int s){}public void setAction(int a){action=a;}
 public void recycle(){if(recycled)throw new AssertionError("MotionEvent double recycled");recycled=true;}
}'''

EXTRA = r'''
 static Bundle identity(Bundle b){Bundle e=new Bundle();e.putInt("display_id",b.getInt("display_id"));e.putInt("user_id",b.getInt("user_id"));e.putString("display_name",b.getString("display_name"));e.putString("display_unique_id",b.getString("display_unique_id"));return e;}
 static AtomicWorkbenchPlatform slot(AtomicWorkbenchEngine e,int id)throws Exception{Field f=AtomicWorkbenchEngine.class.getDeclaredField("windows");f.setAccessible(true);return ((AtomicWorkbenchPlatform[])f.get(e))[id];}
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  test("detach and attach preserve exact HOME task VD dimensions and journal bytes",()->{try(Fixture f=new Fixture()){
   Bundle original=f.show();success(original);Bundle expected=identity(original);byte[] journal=Files.readAllBytes(f.file(0));var vd=f.context.displays.latest;Surface old=(Surface)readField(f.platform,"ownedSurface");
   int moves=f.service.encodedMoves,starts=f.service.starts,focused=f.service.focused;Bundle paused=f.platform.updateOutput(expected,1,null);success(paused);
   check(!paused.getBoolean("output_attached")&&paused.getBoolean("output_attached_known")&&!paused.getBoolean("output_transition_pending"),"detach falsely acknowledged output");
   check(old.releases==1&&vd.surface==null&&!vd.released&&vd.resizes==0,"detach leaked or resized/released VD");
   Surface next=new Surface();Bundle attached=f.platform.updateOutput(expected,2,next);success(attached);
   check(vd.surface==next&&!next.released&&attached.getLong("output_generation")==2&&!f.platform.readyForInput()&&attached.getBoolean("input_rebind_pending"),"same VD producer not attached or input rebind skipped");
   check(attached.getInt("display_id")==original.getInt("display_id")&&attached.getInt("home_task_id")==original.getInt("home_task_id")&&attached.getInt("width")==1080&&attached.getInt("height")==2400&&attached.getInt("density")==420,"output changed task identity or buffer geometry");
   check(f.service.encodedMoves==moves&&f.service.starts==starts&&f.service.focused==focused&&Arrays.equals(journal,Files.readAllBytes(f.file(0))),"output changed tasks focus launch or journal");
   success(f.platform.focusWindow());check(f.platform.readyForInput(),"detached output could not regain actual input focus");
  }});
  test("typed complete expected identity is mandatory and rejected incoming handles are released",()->{try(Fixture f=new Fixture()){
   Bundle original=f.show();success(original);var vd=f.context.displays.latest;
   for(String key:new String[]{"display_id","user_id","display_name","display_unique_id","extra","wrong_type","missing"}){
    Bundle e=identity(original);if(key.equals("display_id"))e.putInt(key,999);else if(key.equals("user_id"))e.putInt(key,10);
    else if(key.equals("wrong_type"))e.putString("display_id","88");else if(key.equals("missing"))e=new Bundle();else e.putString(key,"foreign");
    Surface incoming=new Surface();Bundle result=f.platform.updateOutput(e,1,incoming);check(!result.getBoolean("success")&&incoming.releases==1&&vd.sets==0,"incomplete or wrong identity accepted:"+key);
   }
   vd.display.unique="recycled";Surface foreign=new Surface();check(!f.platform.updateOutput(identity(original),2,foreign).getBoolean("success")&&foreign.releases==1&&vd.sets==0,"fresh DMS unique identity ignored");
  }});
  test("late destroy and same generation attach cannot replace the newer producer",()->{try(Fixture f=new Fixture()){
   Bundle original=f.show();success(original);Bundle e=identity(original);success(f.platform.updateOutput(e,1,null));Surface live=new Surface();success(f.platform.updateOutput(e,2,live));var vd=f.context.displays.latest;
   check(!f.platform.updateOutput(e,1,null).getBoolean("success")&&vd.surface==live&&!live.released,"old destroy detached new producer");
   Surface duplicate=new Surface();Bundle rejected=f.platform.updateOutput(e,2,duplicate);check(!rejected.getBoolean("success")&&!rejected.getBoolean("output_request_accepted")&&duplicate.releases==1&&vd.surface==live,"same-gen attach accepted a different producer");
   check(!f.platform.updateOutput(e,2,null).getBoolean("success")&&vd.surface==live,"conflicting same generation detach accepted");
   success(f.platform.updateOutput(e,3,null));int sets=vd.sets;success(f.platform.updateOutput(e,3,null));check(vd.sets==sets&&live.releases==1,"completed detach not idempotent");
  }});
  test("uncertain attach retains both possible handles until a confirmed detach",()->{try(Fixture f=new Fixture()){
   Bundle original=f.show();success(original);Bundle e=identity(original);var vd=f.context.displays.latest;Surface old=(Surface)readField(f.platform,"ownedSurface"),candidate=new Surface();vd.failMode=2;
   Bundle unknown=f.platform.updateOutput(e,1,candidate);check(!unknown.getBoolean("success")&&unknown.getBoolean("output_transition_pending")&&!unknown.getBoolean("output_attached_known"),"setter uncertainty certified attached");
   check(vd.surface==candidate&&old.releases==0&&candidate.releases==0&&!f.platform.readyForInput(),"possibly live handle released or unknown input admitted");
   Surface extra=new Surface();check(!f.platform.updateOutput(e,2,extra).getBoolean("success")&&extra.releases==1&&vd.sets==1,"unknown attach allowed unbounded retained handles");
   vd.failMode=0;Bundle paused=f.platform.updateOutput(e,2,null);success(paused);check(old.releases==1&&candidate.releases==1&&vd.surface==null&&!paused.getBoolean("output_transition_pending")&&paused.getBoolean("output_attached_known"),"confirmed detach did not reconcile retained handles");
  }});
  test("uncertain detach is safely retryable at the same generation",()->{try(Fixture f=new Fixture()){
   Bundle original=f.show();success(original);var vd=f.context.displays.latest;Surface old=(Surface)readField(f.platform,"ownedSurface");vd.failMode=1;
   check(!f.platform.updateOutput(identity(original),1,null).getBoolean("success")&&old.releases==0,"failed detach dropped old handle");
   vd.failMode=0;success(f.platform.updateOutput(identity(original),1,null));check(old.releases==1&&vd.surface==null,"same-gen detach retry did not recover");
  }});
  test("parkInput closes real guard responsibility without selecting any physical task",()->{try(Fixture f=new Fixture()){
   success(f.show());f.platform.suspendInputFocus();int focus=f.service.focused,moves=f.service.encodedMoves;FakeFocusController.failClose=true;
   Bundle parked=f.platform.parkInput();check(!parked.getBoolean("success")&&parked.getBoolean("guard_cleanup_pending")&&f.platform.hasLiveDisplay(),"failed Guard removal lost responsibility or display");
   check(f.service.focused==focus&&f.service.encodedMoves==moves,"parkInput stole task focus or moved tasks");
   FakeFocusController.failClose=false;success(f.platform.parkInput());check(!f.platform.outputStatus().getBoolean("guard_cleanup_pending"),"same Guard responsibility not retried");
  }});
  test("Engine parks every actual slot and resumes without OPEN or losing HOME",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));for(int id=1;id<4;id++)success(f.engine.openWindow(id,new Surface(),1080,2400,420,"sample"+id+"/sample"+id+".Main"));
   ArrayList<byte[]> journals=new ArrayList<>();for(int id=0;id<4;id++)journals.add(Files.readAllBytes(f.file(id)));int starts=f.service.starts,moves=f.service.encodedMoves,focus=f.service.focused;int displays=f.context.displays.all.size();
   AtomicWorkbenchInputFocusProbe.confirmed=true;Bundle parked=f.engine.parkUi(10);success(parked);check(f.engine.uiParked()&&parked.getBoolean("ui_parked")&&!parked.getBoolean("park_focus_pending"),"actual parked mode absent");
   for(int id=0;id<4;id++){Bundle w=window(parked,id);check(!w.getBoolean("output_attached")&&w.getLong("output_generation")==10&&!w.getBoolean("output_transition_pending"),"actual slot not detached");check(Arrays.equals(journals.get(id),Files.readAllBytes(f.file(id))),"park rewrote journal");}
   check(f.service.starts==starts&&f.service.encodedMoves==moves&&f.service.focused==focus&&f.context.displays.all.size()==displays&&f.context.displays.all.stream().noneMatch(v->v.released||v.resizes!=0),"park changed VD/task/physical focus lifetime");
   Surface old=new Surface();check(!f.engine.updateOutput(0,identity(window(parked,0)),9,old).getBoolean("success")&&old.releases==1,"stale producer survived global park fence");
   Surface blocked=new Surface();check(!f.engine.updateOutput(0,identity(window(parked,0)),11,blocked).getBoolean("success")&&blocked.releases==1,"parked UI admitted attach");
   success(f.engine.parkUi(10));success(f.engine.resumeUi(11));check(!f.engine.uiParked()&&!slot(f.engine,0).readyForInput(),"resume pretended detached output was interactive");
   Surface next=new Surface();success(f.engine.updateOutput(0,identity(window(parked,0)),12,next));check(!slot(f.engine,0).readyForInput()&&slot(f.engine,0).outputStatus().getBoolean("input_rebind_pending"),"reattach skipped old editor rebind gate");success(f.engine.focusWindow(0));check(slot(f.engine,0).readyForInput(),"resume could not attach original VD");
   check(!f.engine.resumeUi(11).getBoolean("success")&&!next.released,"old resume reset a newer producer");
  }});
  test("Guard failure leaves parked output owned and never creates global task recovery",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));slot(f.engine,0).suspendInputFocus();FakeFocusController.failClose=true;AtomicWorkbenchInputFocusProbe.confirmed=true;
   Bundle pending=f.engine.parkUi(1);check(!pending.getBoolean("success")&&pending.getBoolean("guard_cleanup_pending")&&!pending.getBoolean("recovery_pending")&&f.engine.uiParked(),"Guard pending became task recovery or false success");
   check(slot(f.engine,0).hasLiveDisplay()&&!f.context.displays.latest.released,"Guard failure released VD");check(!f.engine.resumeUi(2).getBoolean("success")&&f.engine.uiParked(),"resume discarded pending Guard owner");
   FakeFocusController.failClose=false;Bundle resumed=f.engine.resumeUi(2);check(resumed.getBoolean("success")&&!f.engine.uiParked()&&!slot(f.engine,0).outputStatus().getBoolean("guard_cleanup_pending"),"same-generation resume could not discharge original Guard");
  }});
  test("unknown setter can recover by same-session same-generation resume retry",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));var vd=f.context.displays.latest;int display=vd.display.id,task=f.home.taskId,moves=f.service.encodedMoves;AtomicWorkbenchInputFocusProbe.confirmed=true;
   vd.failMode=2;check(!f.engine.parkUi(1).getBoolean("success")&&f.engine.uiParked(),"unknown detach was accepted");
   check(!f.engine.resumeUi(2).getBoolean("success")&&f.engine.uiParked(),"failed resume discarded unknown setter responsibility");
   vd.failMode=0;success(f.engine.resumeUi(2));check(!f.engine.uiParked()&&slot(f.engine,0).hasLiveDisplay()&&vd.display.id==display&&!vd.released&&f.home.taskId==task&&f.service.encodedMoves==moves,"resume replaced or migrated original session");
   Bundle current=slot(f.engine,0).outputStatus();Surface next=new Surface();success(f.engine.updateOutput(0,identity(current),3,next));check(vd.surface==next&&!slot(f.engine,0).readyForInput(),"recovered output bypassed rebind");success(f.engine.focusWindow(0));check(slot(f.engine,0).readyForInput(),"recovered same session could not accept new producer");
  }});
  test("missing native input proof reports pending without selecting host task",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int focus=f.service.focused,moves=f.service.encodedMoves;AtomicWorkbenchInputFocusProbe.confirmed=false;
   Bundle pending=f.engine.parkUi(1);check(!pending.getBoolean("success")&&pending.getBoolean("park_focus_pending")&&!pending.getBoolean("recovery_pending")&&f.service.focused==focus&&f.service.encodedMoves==moves,"missing native proof stole focus or claimed success");
  }});
  test("fresh display identity rejection must not certify detach or resume",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));var vd=f.context.displays.latest;String unique=vd.display.unique;Surface producer=vd.surface;
   vd.display.unique="recycled";AtomicWorkbenchInputFocusProbe.confirmed=true;
   check(!f.engine.parkUi(1).getBoolean("success")&&f.engine.uiParked()&&vd.surface==producer&&vd.sets==0,"identity failure did not preserve original producer");
   check(!f.engine.resumeUi(2).getBoolean("success")&&f.engine.uiParked()&&vd.surface==producer&&vd.sets==0,"resume certified detach after identity rejection");
   vd.display.unique=unique;success(f.engine.resumeUi(2));check(!f.engine.uiParked()&&vd.surface==null&&!vd.released,"identity recovery could not resume original VD");
  }});
  test("foreground uncertain setter can retry detach and resume without another stop or new VD",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));AtomicWorkbenchPlatform p=slot(f.engine,0);Bundle identity=identity(p.outputStatus());var vd=f.context.displays.latest;int starts=f.service.starts,moves=f.service.encodedMoves;byte[] journal=Files.readAllBytes(f.file(0));Surface candidate=new Surface();vd.failMode=2;
   check(!f.engine.updateOutput(0,identity,1,candidate).getBoolean("success")&&!f.engine.uiParked()&&p.outputStatus().getBoolean("output_transition_pending"),"foreground setter did not enter actual uncertainty");
   vd.failMode=0;success(f.engine.resumeUi(2));check(!f.engine.uiParked()&&vd.surface==null&&!p.outputStatus().getBoolean("output_transition_pending")&&candidate.releases==1,"foreground retry never performed confirmed detach");
   Surface replacement=new Surface();success(f.engine.updateOutput(0,identity,3,replacement));success(f.engine.focusWindow(0));
   check(vd.surface==replacement&&p.readyForInput()&&!vd.released&&f.context.displays.all.size()==1&&f.service.starts==starts&&f.service.encodedMoves==moves&&Arrays.equals(journal,Files.readAllBytes(f.file(0))),"foreground retry replaced task VD or journal");
  }});
  test("same completed resume generation discharges newly uncertain Guard without remaining parked",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));success(f.engine.resumeUi(1));success(f.engine.focusWindow(0));AtomicWorkbenchPlatform p=slot(f.engine,0);
   FakeFocusController.failSuspend=true;FakeFocusController.failResume=true;
   try {check(!f.engine.focusInputOnly(-1).getBoolean("success")&&p.outputStatus().getBoolean("guard_cleanup_pending"),"fixture failed to preserve uncertain focus transition");}
   finally {FakeFocusController.failSuspend=false;FakeFocusController.failResume=false;}
   Bundle retried=f.engine.resumeUi(1);check(retried.getBoolean("success")&&!f.engine.uiParked()&&!retried.getBoolean("ui_parked")&&!p.outputStatus().getBoolean("guard_cleanup_pending"),"same-gen resume returned success while still parked");
   check(!p.outputStatus().getBoolean("output_attached")&&p.outputStatus().getBoolean("input_rebind_pending"),"same-gen cleanup failed to detach and fence old editor");
  }});
  test("failed CANCEL keeps the actual stream until acknowledgement",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));AtomicWorkbenchPlatform p=slot(f.engine,0);android.hardware.input.InputManagerGlobal.failCancel=false;
   check(p.inject(new android.view.MotionEvent()),"fixture DOWN did not create real production input stream");
   android.view.MotionEvent retained=(android.view.MotionEvent)readField(p,"lastTouch");android.hardware.input.InputManagerGlobal.failCancel=true;AtomicWorkbenchInputFocusProbe.confirmed=true;
   try {
    check(!f.engine.parkUi(1).getBoolean("success")&&f.engine.uiParked()&&p.outputStatus().getBoolean("input_cancel_pending"),"failed cancel was certified paused");
    check(readField(p,"lastTouch")==retained&&!retained.recycled&&!p.readyForInput(),"failed cancel lost actual stream responsibility");
    check(!f.engine.resumeUi(2).getBoolean("success")&&f.engine.uiParked()&&readField(p,"lastTouch")==retained&&!retained.recycled,"retry cleared input responsibility without CANCEL acknowledgement");
    android.hardware.input.InputManagerGlobal.failCancel=false;success(f.engine.resumeUi(2));
    check(readField(p,"lastTouch")==null&&retained.recycled&&!p.outputStatus().getBoolean("input_cancel_pending"),"CANCEL acknowledgement did not release original stream");
   } finally {android.hardware.input.InputManagerGlobal.failCancel=false;}
  }});
  test("failed cancellation cannot block real task migration and display release",()->{try(Fixture f=new Fixture()){
   success(f.show());check(f.platform.inject(new android.view.MotionEvent()),"fixture DOWN did not start");var retained=(android.view.MotionEvent)readField(f.platform,"lastTouch");var vd=f.context.displays.latest;
   android.hardware.input.InputManagerGlobal.failCancel=true;
   try {success(f.platform.close());check(f.home.displayId==0&&vd.released&&retained.recycled&&readField(f.platform,"lastTouch")==null&&!f.platform.outputStatus().getBoolean("input_cancel_pending"),"failed CANCEL blocked task return or survived released display");}
   finally {android.hardware.input.InputManagerGlobal.failCancel=false;}
  }});
  test("returned OWN_FOCUS editor receives one acknowledged loss gain only after foreground output attaches",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));int id=f.context.displays.latest.display.id;AtomicWorkbenchPlatform p=slot(f.engine,0);AtomicWorkbenchInputFocusProbe.confirmed=true;FakeFocusController.events.clear();int suspends=FakeFocusController.suspends;
   Bundle parked=f.engine.parkUi(1);success(parked);success(f.engine.resumeUi(2));
   check(FakeFocusController.suspends==suspends&&p.outputStatus().getBoolean("input_rebind_pending"),"background park created a new Guard or forgot old editor");
   check(!f.engine.focusWindow(0).getBoolean("success")&&FakeFocusController.suspends==suspends,"detached output created a Guard before foreground attach");
   success(f.engine.updateOutput(0,identity(window(parked,0)),3,new Surface()));FakeFocusController.events.clear();success(f.engine.focusWindow(0));
   check(FakeFocusController.events.equals(List.of("suspend:"+id,"resume","focus:41"))&&p.readyForInput()&&!p.outputStatus().getBoolean("input_rebind_pending"),"resume did not acknowledge exact loss gain before task focus");
   FakeFocusController.events.clear();success(f.engine.focusWindow(0));check(FakeFocusController.events.equals(List.of("focus:41")),"ordinary focus repeated resumed editor cycle");
  }});
  for(String phase:new String[]{"suspend","resume"})test("returned editor "+phase+" failure preserves rebind and lease until real acknowledgement",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.showNativeHome(0,new Surface(),1080,2400,420));AtomicWorkbenchInputFocusProbe.confirmed=true;Bundle parked=f.engine.parkUi(1);success(parked);success(f.engine.resumeUi(2));success(f.engine.updateOutput(0,identity(window(parked,0)),3,new Surface()));AtomicWorkbenchPlatform p=slot(f.engine,0);
   FakeFocusController.failSuspend=phase.equals("suspend");FakeFocusController.failResume=phase.equals("resume");
   try {check(!f.engine.focusWindow(0).getBoolean("success")&&!p.readyForInput()&&p.outputStatus().getBoolean("input_rebind_pending")&&p.outputStatus().getBoolean("guard_cleanup_pending"),"failed resume focus lost original rebind or Guard responsibility");}
   finally {FakeFocusController.failSuspend=false;FakeFocusController.failResume=false;}
   FakeFocusController.events.clear();success(f.engine.focusWindow(0));check(p.readyForInput()&&!p.outputStatus().getBoolean("input_rebind_pending")&&!p.outputStatus().getBoolean("guard_cleanup_pending")&&FakeFocusController.events.indexOf("resume")<FakeFocusController.events.indexOf("focus:41"),"rebind failure could not recover the same editor");
  }});
  test("empty slots retain park generation and unknown targets always consume incoming Surface",()->{try(Fixture f=new Fixture()){
   f.engine();AtomicWorkbenchInputFocusProbe.confirmed=true;Bundle p=f.engine.parkUi(7);success(p);for(Bundle w:p.<Bundle>getParcelableArrayList("windows"))check(w.getLong("output_generation")==7,"empty slot lost generation fence");
   Surface invalid=new Surface();check(!f.engine.updateOutput(9,new Bundle(),8,invalid).getBoolean("success")&&invalid.releases==1,"invalid slot leaked incoming Surface");
  }});
  test("parked recovery maintenance returns tasks without stealing the external physical foreground",()->{try(Fixture f=new Fixture()){
   f.engine();success(f.engine.openWindow(0,new Surface(),1080,2400,420,"sample/sample.Main"));success(f.engine.openWindow(1,new Surface(),1080,2400,420,"sample1/sample1.Main"));
   f.service.failRestore=true;check(!f.engine.closeWindow(0).getBoolean("success"),"fixture did not retain real task recovery");
   AtomicWorkbenchInputFocusProbe.confirmed=true;f.engine.parkUi(10);check(f.engine.uiParked(),"recovering session did not park");
   Task settings=new Task(73,0,0,1,"external/external.Settings");f.service.list.add(0,settings);f.service.focused=73;f.service.failRestore=false;
   f.engine.retryWindowRecovery();check(f.service.focused==73&&f.engine.activeInputWindow()==-1&&f.engine.status().getInt("focused_window_id")==-2,"parked recovery stole external physical task focus");
   check(!slot(f.engine,0).hasLiveDisplay()&&slot(f.engine,1).hasLiveDisplay()&&!f.engine.hasRecoveryPending(),"maintenance dropped other VD or abandoned actual recovery");
  }});
  System.out.println("OUTPUT RUNTIME RESULT "+tests+" cases; "+checks+" assertions");
 }
 static Object readField(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
}'''


def sources():
    values = SUPPORT["migration_sources"]()
    values.pop("ls/augment/com/TestAtomicWorkbenchMigration.java")
    values.update(HOME["BASE"]["SOURCES"])
    values.pop("ls/augment/com/AtomicWorkbenchJournal.java")
    values.update(HOME["SOURCES"])
    values["android/content/Context.java"] = values["android/content/Context.java"].replace(
        'public ContentResolver getContentResolver(){return new ContentResolver();}', '').replace(
        'public Object getSystemService', 'public final android.content.ContentResolver resolver=new android.content.ContentResolver();public android.content.ContentResolver getContentResolver(){return resolver;}public Object getSystemService')
    values["android/view/Surface.java"] = "package android.view;public class Surface {public boolean released;public int releases;public boolean isValid(){return !released;}public void release(){released=true;releases++;}}"
    values["android/view/MotionEvent.java"] = MOTION
    values["android/hardware/input/InputManagerGlobal.java"] = "package android.hardware.input;public class InputManagerGlobal {public static boolean failCancel;public static InputManagerGlobal getInstance(){return new InputManagerGlobal();}public boolean injectInputEvent(android.view.InputEvent e,int mode){return !(failCancel&&e instanceof android.view.MotionEvent&&((android.view.MotionEvent)e).getActionMasked()==3);}}"
    values["android/hardware/display/VirtualDisplay.java"] = VD
    values["android/hardware/display/DisplayManager.java"] = values["android/hardware/display/DisplayManager.java"].replace("return latest;", "latest.surface=surface;return latest;")
    values["ls/augment/com/AtomicWorkbenchInputFocusProbe.java"] = "package ls.augment.com;final class AtomicWorkbenchInputFocusProbe {static boolean confirmed;static boolean primaryConfirmed(){return confirmed;}}"
    values["ls/augment/com/TestAtomicWorkbenchHome.java"] = HOME["TEST"].split(" public static void main(String[] args)", 1)[0] + EXTRA
    return values


MUTATIONS = [
    ("EXACT_DISPLAY_IDENTITY", "AtomicWorkbenchPlatform.java", "identity.matches(record.displayId, record.displayName, record.uniqueId, userId)", "identity.matches(identity.displayId, identity.name, identity.unique, identity.userId)", "incomplete or wrong identity accepted:"),
    ("STALE_PRODUCER_FENCE", "AtomicWorkbenchOutputProtocol.java", "next <= 0 || next < generation", "next <= 0", "old destroy detached new producer"),
    ("UNCERTAIN_HANDLE_OWNERSHIP", "AtomicWorkbenchPlatform.java", "uncertainOutputSurface = surface; surface = null;", "release(surface); surface = null;", "possibly live handle released or unknown input admitted"),
    ("PARKED_ATTACH_REJECTED", "AtomicWorkbenchEngine.java", "|| uiParked && surface != null ||", "||", "parked UI admitted attach"),
    ("RESUME_RETRIES_REAL_PARK_CLEANUP", "AtomicWorkbenchEngine.java", "boolean parkConfirmed = !cleanupNeeded || retryParkedOutputs(generation);", "boolean parkConfirmed = true;", "same-generation resume could not discharge original Guard"),
    ("PARK_NEVER_SELECTS_HOST_TASK", "AtomicWorkbenchEngine.java", "Bundle cancelled = parkInput();", "Bundle cancelled = parkInput(); legacy.focusDefault();", "park changed VD/task/physical focus lifetime"),
    ("PARKED_RECOVERY_CANNOT_STEAL_TASK", "AtomicWorkbenchEngine.java", "if (!recovering[id] && uiParked)", "if (!recovering[id] && false)", "parked recovery stole external physical task focus"),
    ("LIVE_DMS_CHECK_PRECEDES_SETTER", "AtomicWorkbenchPlatform.java", "requireDisplayIdentity();\n            if (!identity.matches", "if (!identity.matches", "fresh DMS unique identity ignored"),
    ("FAILED_CANCEL_RETAINS_STREAM", "AtomicWorkbenchPlatform.java", "lastTouch = cancel; cancel = null; inputCancelPending = true;", "inputCancelPending = true;", "failed cancel was certified paused"),
    ("RESUME_EDITOR_REBINDS", "AtomicWorkbenchPlatform.java", "if (inputFocusLease == null) suspendInputFocus();", "if (false) suspendInputFocus();", "resume did not acknowledge exact loss gain before task focus"),
    ("FOREGROUND_UNKNOWN_RETRIES_DETACH", "AtomicWorkbenchEngine.java", "boolean cleanupNeeded = uiParked || hasOutputCleanupPending();", "boolean cleanupNeeded = uiParked;", "原画面或输入清理尚未确认"),
    ("SAME_GEN_NEW_CLEANUP_REALLY_RESUMES", "AtomicWorkbenchEngine.java", "if (alreadyResumed && !cleanupNeeded)", "if (alreadyResumed)", "same-gen resume returned success while still parked"),
]


def main(mutation=None):
    sdk = ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"
    json_jar = next((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    with tempfile.TemporaryDirectory(prefix="duo-output-runtime-") as temporary:
        work = Path(temporary); data = work / "cases"; data.mkdir()
        values = sources()
        production = ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchEngine.java", "AtomicWorkbenchProtocol.java",
                      "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchJournal.java", "AtomicWorkbenchOutputIdentity.java", "AtomicWorkbenchOutputProtocol.java"]
        values, production = SUPPORT["output_support"](values, production)
        if mutation is not None:
            _, filename, old, new, _ = MUTATIONS[mutation]
            text = (SUPPORT["SRC"] / filename).read_text(encoding="utf-8")
            assert old in text, "output mutation source changed"
            values["ls/augment/com/" + filename] = text.replace(old, new)
            production.remove(filename)
        # JVM console streams have their own encoding on Windows; file.encoding
        # alone does not make a Chinese assertion on stderr UTF-8.
        files = []
        for name, content in values.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(str(path))
        classes = work / "classes"
        classpath = os.pathsep.join((str(json_jar), str(sdk)))
        subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(classes),
                        "-cp", classpath, *[str(SUPPORT["SRC"] / name) for name in production], *files],
                       check=True, timeout=90, env=SUPPORT["ENV"])
        subprocess.run([SUPPORT["JAVA"], "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8",
                        "-Dstderr.encoding=UTF-8", "-cp", str(classes) + os.pathsep + classpath,
                        "ls.augment.com.TestAtomicWorkbenchHome", str(data)],
                       check=True, timeout=180, env=SUPPORT["ENV"])


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--mutate":
        main(int(sys.argv[2]))
    else:
        main()
        for index, (label, _, _, _, expected) in enumerate(MUTATIONS):
            run = subprocess.run([sys.executable, __file__, "--mutate", str(index)], capture_output=True,
                                 encoding="utf-8", errors="replace",
                                 timeout=150, env=SUPPORT["ENV"])
            assert run.returncode != 0 and expected in run.stdout + run.stderr, "uncaught output source mutation: " + label
            print("PASS rejected output negative:", label)
