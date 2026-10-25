"""Exercise actual Platform task-only display allocation and binding with OS adapters; no phone."""
from pathlib import Path
import runpy
import tempfile

LAUNCH = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-launch-runtime.py')))
SUPPORT = LAUNCH['SUPPORT']
MODELS = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-models.py')))
SOURCES = SUPPORT['migration_sources']()
SOURCES.pop('ls/augment/com/TestAtomicWorkbenchMigration.java')
SOURCES.update(LAUNCH['SOURCES'])
# Creation is a real call to the adapter, with a hard assertion for durable ordering.
manager = SOURCES['android/hardware/display/DisplayManager.java']
manager = manager.replace('public VirtualDisplay latest;', 'public int creates,dropDisplayFlags;public boolean throwAfterCreate;public VirtualDisplay latest;')
manager = manager.replace('requestedFlags=flags;', 'creates++;if(ls.augment.com.AllocationJournalProbe.prepared()==false)throw new AssertionError("VD before durable record");requestedFlags=flags;')
manager = manager.replace('public Display getDisplay(int id)', 'public Display[] getDisplays(){return latest!=null&&!latest.released?new Display[]{latest.display}:new Display[0];}public Display getDisplay(int id)')
manager = manager.replace('return latest;}', 'latest.display.flags&=~dropDisplayFlags;if(throwAfterCreate)throw new IllegalStateException("create transport after side effect");return latest;}')
SOURCES['android/hardware/display/DisplayManager.java'] = manager
SOURCES['ls/augment/com/AllocationJournalProbe.java'] = 'package ls.augment.com;public class AllocationJournalProbe{public static boolean prepared(){return AtomicWorkbenchJournal.latest.saved!=null;}}'
TEST = LAUNCH['TEST'].split(' public static void main(String[] args)throws Exception{', 1)[0] + r'''
 public static void main(String[] args)throws Exception{
  test("allocation preserves physical task, creates no app/HOME/focus, and returns retained EMPTY identity",()->{
   Fixture f=new Fixture();Task physical=new Task();f.service.tasks.add(physical);Bundle b=f.platform.allocateTaskDisplay(f.surface,1080,2400,420,9,"a".repeat(32));
   check(b.getBoolean("success")&&b.getBoolean("retained_empty_task_display")&&b.getBoolean("empty_task_display"),"empty allocation not confirmed");
   check(f.service.starts==0&&f.service.recents==0&&f.service.focusCalls==0&&physical.displayId==0&&f.context.displays.creates==1,"allocation launched/migrated/focused a task");
   check(b.getInt("task_count")==0&&!b.getBoolean("native_home")&&b.getInt("home_task_id")==-1&&b.getString("window_session").length()==36,"empty display invented HOME/task identity");
   check(b.getLong("output_generation")==9&&b.getBoolean("output_attached")&&!f.surface.released&&!f.platform.readyForInput(),"surface generation/ownership/input barrier invalid");
   check(AtomicWorkbenchJournal.latest.saved.taskAllocationId.equals("a".repeat(32)),"allocation identity not durable");
  });
  test("repeat allocation consumes only incoming surface without closing/recreating original VD",()->{
   Fixture f=new Fixture();check(f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32)).getBoolean("success"),"setup failed");var vd=f.context.displays.latest;Surface second=new Surface();
   Bundle b=f.platform.allocateTaskDisplay(second,1080,2400,420,2,"b".repeat(32));check(!b.getBoolean("success")&&second.released&&!f.surface.released&&f.context.displays.latest==vd&&!vd.released&&f.context.displays.creates==1,"allocation replay damaged previous session");
  });
  test("invalid inputs have no durable/display side effect and release incoming surface",()->{
   Fixture f=new Fixture();Bundle b=f.platform.allocateTaskDisplay(f.surface,239,2400,420,1,"a".repeat(32));check(!b.getBoolean("success")&&f.surface.released&&f.context.displays.creates==0&&AtomicWorkbenchJournal.latest.saved==null,"bad allocation mutated state");
  });
  test("after-create transport failure retains journal and never silently creates a replacement",()->{
   Fixture f=new Fixture();f.context.displays.throwAfterCreate=true;Bundle b=f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32));check(!b.getBoolean("success")&&b.getBoolean("operation_unconfirmed")&&b.getBoolean("recovery_pending"),"create unknown erased responsibility");
   var actual=f.context.displays.latest;check(!actual.released&&AtomicWorkbenchJournal.latest.saved!=null&&f.service.starts==0,"create unknown rolled back/cleared evidence");Surface retry=new Surface();f.platform.allocateTaskDisplay(retry,1080,2400,420,2,"b".repeat(32));check(retry.released&&f.context.displays.creates==1&&!actual.released,"unknown allocation replayed");check(!f.platform.close().getBoolean("success")&&AtomicWorkbenchJournal.latest.saved!=null&&!actual.released,"missing create handle falsely proved release");actual.release();check(f.platform.close().getBoolean("success")&&AtomicWorkbenchJournal.latest.saved==null,"authoritative display absence did not permit cleanup");
  });
  test("failed phone IME policy keeps same empty VD/surface as unconfirmed",()->{
   Fixture f=new Fixture();WindowManagerGlobal.service.deny=true;Bundle b=f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32));check(!b.getBoolean("success")&&b.getBoolean("operation_unconfirmed")&&f.platform.hasLiveDisplay()&&!f.context.displays.latest.released&&!f.surface.released&&AtomicWorkbenchJournal.latest.saved!=null,"IME configuration failure lost owned display");
  });
  for(int missing:new int[]{Display.FLAG_TRUSTED,Display.FLAG_OWN_FOCUS})test("actual display missing required capability "+missing+" retains recovery responsibility",()->{
   Fixture f=new Fixture();f.context.displays.dropDisplayFlags=missing;
   Bundle b=f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32));
   check(!b.getBoolean("success")&&b.getBoolean("operation_unconfirmed")&&b.getBoolean("recovery_pending"),"requested flags were treated as proof of actual display capabilities");
   check(f.platform.hasLiveDisplay()&&!f.context.displays.latest.released&&!f.surface.released&&AtomicWorkbenchJournal.latest.saved!=null&&f.service.starts==0,"rejected display lost exact recovery identity or launched an app");
  });
  test("restored exact task clears retained-empty and closes by real task migration",()->{
   Fixture f=new Fixture();check(f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32)).getBoolean("success"),"setup failed");var record=AtomicWorkbenchJournal.latest.saved;Task actual=new Task();actual.displayId=record.displayId;f.service.tasks.add(actual);
   var id=new AtomicWorkbenchTaskIdentity("a".repeat(32),"b".repeat(32),77,77,true,10055,0,"sample/sample.Main","sample/sample.Main",record.displayId,record.displayName,record.uniqueId);
   f.platform.synchronizeTaskOperationBinding(id);Bundle state=f.platform.status();check(!state.getBoolean("retained_empty_task_display")&&f.platform.hostedComponent().equals("sample/sample.Main")&&state.getInt("requested_task_id")==77,"real restored task did not bind/clear empty flag");
   check(f.platform.close().getBoolean("success")&&actual.displayId==0&&f.context.displays.latest.released&&f.surface.released,"allocated display skipped actual task return");
  });
  test("committed shelve preserves no-app VD but ordinary self-exit retains old close semantics",()->{
   Fixture f=new Fixture();f.service.createTask=true;check(f.open().getBoolean("success"),"setup failed");f.service.tasks.get(0).displayId=0;f.platform.synchronizeTaskOperationBinding(null);Bundle b=f.platform.status();check(b.getBoolean("retained_empty_task_display")&&f.platform.hasLiveDisplay()&&!f.context.displays.latest.released&&f.platform.hostedComponent().isEmpty(),"shelved source not retained");
   Fixture ordinary=new Fixture();ordinary.service.createTask=true;check(ordinary.open().getBoolean("success"),"ordinary setup failed");ordinary.service.tasks.get(0).displayId=0;check(!ordinary.platform.status().getBoolean("retained_empty_task_display"),"natural app exit globally reclassified as retained");
  });
  test("real app entry clears retained marker only after complete fresh snapshot",()->{
   Fixture f=new Fixture();check(f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32)).getBoolean("success"),"setup failed");Task actual=new Task();actual.displayId=88;f.service.tasks.add(actual);check(!f.platform.status().getBoolean("retained_empty_task_display"),"real app entry retained stale empty flag");
  });
  System.out.println("TASK ALLOCATION RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources, production = SUPPORT['output_support'](dict(SOURCES), ['AtomicWorkbenchPlatform.java', 'AtomicWorkbenchLaunchBridge.java', 'AtomicWorkbenchProtocol.java'])
    sources['ls/augment/com/TestAtomicWorkbenchLaunch.java'] = TEST
    sdk = SUPPORT['ROOT'] / 'audit-output/android-sdk/platforms/android-36/android.jar'
    with tempfile.TemporaryDirectory(prefix='duo-task-allocation-') as directory:
        MODELS['compile_run'](Path(directory) / 'base', sources, production, 'ls.augment.com.TestAtomicWorkbenchLaunch', (), str(sdk))
        # Remove actual reflection targets while leaving creation and ownership
        # adapters intact. An unavailable hidden interface must not grant trust.
        for member in ('FLAG_TRUSTED', 'FLAG_OWN_FOCUS'):
            missing = dict(sources)
            missing['android/view/Display.java'] = missing['android/view/Display.java'].replace(member, 'LEGACY_' + member)
            missing['ls/augment/com/TestAtomicWorkbenchLaunch.java'] = TEST.split(' public static void main(String[] args)throws Exception{', 1)[0] + r'''
 public static void main(String[] args)throws Exception{
  Fixture f=new Fixture();Bundle b=f.platform.allocateTaskDisplay(f.surface,1080,2400,420,1,"a".repeat(32));
  check(!b.getBoolean("success")&&b.getBoolean("operation_unconfirmed")&&b.getBoolean("recovery_pending"),"missing reflected display API certified success");
  check(f.platform.hasLiveDisplay()&&!f.context.displays.latest.released&&!f.surface.released&&AtomicWorkbenchJournal.latest.saved!=null&&f.service.starts==0,"missing display API lost recovery identity or launched an app");
  System.out.println("PASS missing actual display API: 2 ownership/recovery assertions");
 }
}'''
            MODELS['compile_run'](Path(directory) / ('missing-' + member), missing, production,
                                  'ls.augment.com.TestAtomicWorkbenchLaunch', (), str(sdk))
        controls=[
            ('durable creation order','journal.save(record); recoveryPending = true;\n            // Keep close', '/* mutation: no durable pre-create */\n            // Keep close'),
            ('no launcher side effect','launchAttempted = true; createAttempted = true;', 'launchAttempted = true; createAttempted = true; AtomicWorkbenchLaunchBridge.start(tasks(),new Intent(Intent.ACTION_MAIN).setComponent(new ComponentName("sample","sample.Main")),ActivityOptions.makeBasic().setLaunchDisplayId(0).toBundle(),userId);'),
            ('empty marker','record.taskAllocationId = allocationId; record.retainedEmptyTaskDisplay = true;', 'record.taskAllocationId = allocationId; record.retainedEmptyTaskDisplay = false;'),
            ('actual restored task return','launchAttempted = true; createAttempted = true;', 'launchAttempted = false; createAttempted = true;'),
            ('input empty barrier','&& !(record.retainedEmptyTaskDisplay && record.homeTaskId < 0)', ''),
            ('post-shelve source retention','record.retainedEmptyTaskDisplay = live.isEmpty();', 'record.retainedEmptyTaskDisplay = false;'),
            ('unknown create release proof','if (!record.taskAllocationId.isEmpty() && ownedDisplay == null && record.displayId < 0)', 'if (false)'),
            ('actual trusted and own-focus proof','if ((display.getFlags() & required) != required) throw new SecurityException("任务显示缺少可信独立焦点能力");','/* mutation: trust creation request rather than actual capabilities */'),
        ]
        for number,(label,old,new) in enumerate(controls):
            result=MODELS['compile_run'](Path(directory)/f'negative-{number}',sources,production,
                'ls.augment.com.TestAtomicWorkbenchLaunch',(),str(sdk),
                {'ls/augment/com/AtomicWorkbenchPlatform.java':(old,new)},capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr,'allocation negative escaped or failed compilation: '+label
            print('PASS actual allocation production negative:',label)
        print('TASK ALLOCATION NEGATIVE CONTROLS',len(controls),'passed')



if __name__ == '__main__':
    main()
