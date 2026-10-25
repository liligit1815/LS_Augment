"""Actual Journal IO + extracted actual Platform task handoff methods; syscall/DMS boundary doubles."""
from pathlib import Path
import runpy
import tempfile

STORE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-shelf-store.py')))
ENGINE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-engine.py')))
MODELS = STORE['MODELS']


def method(text, signature):
    start = text.index(signature); opened = text.index('{', start); depth = 1; at = opened + 1
    while depth:
        if text[at] == '{': depth += 1
        if text[at] == '}': depth -= 1
        at += 1
    return text[start:at]


def sources():
    platform = (MODELS['SRC'] / 'AtomicWorkbenchPlatform.java').read_text(encoding='utf-8')
    selected = ['void prepareTaskOperation(', 'void finishTaskOperation(', 'void cancelPreparedTaskOperation(']
    adapter = 'package ls.augment.com;import android.view.Display;final class TaskJournalAdapter {int windowId;AtomicWorkbenchJournal journal;AtomicWorkbenchJournal.Record record;boolean valid=true;void requireDisplayIdentity(){if(!valid)throw new SecurityException();}'
    adapter += '\n'.join(method(platform, name) for name in selected) + '}'
    result = dict(STORE['SYSTEM'])
    result['android/os/Process.java'] = 'package android.os;public class Process{public static final int ROOT_UID=0;public static int myUid(){return 0;}}'
    result['android/os/Bundle.java'] = MODELS['BUNDLE']
    result['android/content/ComponentName.java'] = ENGINE['migration_sources']()['android/content/ComponentName.java']
    result['android/view/Display.java'] = 'package android.view;public class Display{public static final int DEFAULT_DISPLAY=0;}'
    result['ls/augment/com/TaskJournalAdapter.java'] = adapter
    result['ls/augment/com/TestTaskJournal.java'] = TEST
    return result


TEST = r'''package ls.augment.com;import android.content.*;import android.system.*;import java.nio.file.*;import java.util.*;import org.json.*;import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public class TestTaskJournal{
 static Path root;static int cases,checks,seq;static String hex(int n){return String.format("%032x",n);}static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}interface Case{void run()throws Exception;}static void test(String n,Case c)throws Exception{try{c.run();cases++;System.out.println("PASS actual task journal: "+n);}finally{Os.cleanup();}}static void reject(Case c)throws Exception{boolean bad=false;try{c.run();}catch(Exception e){bad=true;}check(bad,"invalid journal handoff accepted");}
 static final class Fixture{final TaskJournalAdapter owner=new TaskJournalAdapter();final Context c=new Context();final Path file;
 Fixture(int slot)throws Exception{Path data=Files.createDirectory(root.resolve("case"+(++seq)));Os.chown(data.toString(),10055,10055);c.pm.info.dataDir=data.toString();owner.windowId=slot;owner.journal=new AtomicWorkbenchJournal(c,10055,0,slot);owner.journal.acquireLock();owner.record=new AtomicWorkbenchJournal.Record(10055,0,slot);owner.record.displayId=88+slot;owner.record.uniqueId="unique"+slot;owner.record.width=1080;owner.record.height=2400;owner.record.density=420;owner.record.state="active";owner.journal.save(owner.record);file=data.resolve("files/atomic_workbench/recovery-window-"+slot+".json");}
 AtomicWorkbenchTaskIdentity identity(int uid,String generation){return new AtomicWorkbenchTaskIdentity("a".repeat(32),generation,42,99,true,uid,0,"sample/.Base","sample/.Real",owner.record.displayId,owner.record.displayName,owner.record.uniqueId);}
 AtomicWorkbenchTaskOperationRequest request(AtomicWorkbenchTaskIdentity id){return new AtomicWorkbenchTaskOperationRequest(hex(++seq),SHELVE,id,owner.windowId,owner.record.session,0,"primary","primary-unique",-1,"",hex(1000+seq),0,0,1000,6000,"");}
 }
 public static void main(String[]args)throws Exception{root=Path.of(args[0]);
 test("actual private journal preserves authenticated uid1000 and pending operation before WM",()->{Fixture f=new Fixture(0);var r=f.request(f.identity(1000,hex(400)));f.owner.prepareTaskOperation(r,false,"MUTATING","");var read=f.owner.journal.read();check(read.tasks.size()==1&&read.tasks.get(0).uid==1000&&read.tasks.get(0).taskGeneration.equals(hex(400)),"actual task UID/generation not durable");check(read.taskOperations.size()==1&&read.taskOperations.get(0).operationId.equals(r.operationId),"pending operation not durable");check(!Files.readString(f.file).contains("confirmation_nonce")&&!Files.readString(f.file).contains("token"),"authorization stored");});
 test("cross-slot receiver owns durable origin before source disposition becomes TRANSFERRED",()->{Fixture source=new Fixture(0),target=new Fixture(1);var original=source.identity(10055,hex(401));var r=source.request(original);source.owner.prepareTaskOperation(r,false,"MUTATING","");source.owner.finishTaskOperation(r.operationId,original.serverBootGeneration,original.taskGeneration,"SHELVED_REFERENCE","");var shelf=new AtomicWorkbenchTaskIdentity(original.serverBootGeneration,original.taskGeneration,42,42,true,original.uid,0,original.baseComponent,original.realComponent,0,"primary","primary-unique");
 var restore=new AtomicWorkbenchTaskOperationRequest(hex(++seq),RESTORE,shelf,0,source.owner.record.session,target.owner.record.displayId,target.owner.record.displayName,target.owner.record.uniqueId,1,target.owner.record.session,r.shelfId,1,1,1000,6000,"");target.owner.prepareTaskOperation(restore,true,"MUTATING",hex(900));source.owner.prepareTaskOperation(restore,false,"MUTATING",hex(900));
 check(target.owner.journal.read().tasks.get(0).disposition.equals("WORKSPACE_OWNED")&&source.owner.journal.read().tasks.get(0).disposition.equals("SHELVED_REFERENCE"),"prepare retired source before receiving owner persisted");target.owner.finishTaskOperation(restore.operationId,shelf.serverBootGeneration,shelf.taskGeneration,"WORKSPACE_OWNED","");source.owner.finishTaskOperation(restore.operationId,shelf.serverBootGeneration,shelf.taskGeneration,"TRANSFERRED",target.owner.record.session);
 check(source.owner.journal.read().tasks.get(0).successorSession.equals(target.owner.record.session)&&source.owner.journal.read().taskOperations.isEmpty()&&target.owner.journal.read().taskOperations.isEmpty(),"durable cross-slot acknowledgement incomplete");});
 test("same task ID and component with new actual generation replaces stale origin",()->{Fixture f=new Fixture(0);var old=f.identity(10055,hex(410));var r=f.request(old);f.owner.prepareTaskOperation(r,false,"MUTATING","");f.owner.finishTaskOperation(r.operationId,old.serverBootGeneration,old.taskGeneration,"ENDED","");var current=f.identity(1000,hex(411));var next=f.request(current);f.owner.prepareTaskOperation(next,false,"MUTATING","");var read=f.owner.journal.read();check(read.tasks.size()==1&&read.tasks.get(0).taskGeneration.equals(hex(411))&&read.tasks.get(0).uid==1000,"new actual generation inherited stale task ownership");f.owner.finishTaskOperation(next.operationId,current.serverBootGeneration,current.taskGeneration,"SHELVED_REFERENCE","");check(f.owner.journal.read().tasks.get(0).disposition.equals("SHELVED_REFERENCE"),"new generation cannot finish");});
 test("fresh display or window mismatch rejects before changing durable evidence",()->{Fixture f=new Fixture(0);var r=f.request(f.identity(10055,hex(420)));byte[] before=Files.readAllBytes(f.file);f.owner.valid=false;reject(()->f.owner.prepareTaskOperation(r,false,"MUTATING",""));check(Arrays.equals(before,Files.readAllBytes(f.file)),"foreign DMS identity wrote journal");f.owner.valid=true;f.owner.windowId=1;reject(()->f.owner.prepareTaskOperation(r,false,"MUTATING",""));check(Arrays.equals(before,Files.readAllBytes(f.file)),"wrong slot wrote journal");});
 test("never-prepared authoritative cancellation is a no-op, dispatched finish is not",()->{Fixture f=new Fixture(0);var id=f.identity(10055,hex(430));byte[] before=Files.readAllBytes(f.file);f.owner.cancelPreparedTaskOperation(hex(99),id.serverBootGeneration,id.taskGeneration,"WORKSPACE_OWNED","");check(Arrays.equals(before,Files.readAllBytes(f.file)),"unprepared cancel rewrote journal");reject(()->f.owner.finishTaskOperation(hex(99),id.serverBootGeneration,id.taskGeneration,"WORKSPACE_OWNED",""));});
 test("retained EMPTY allocation metadata round-trips and malformed types fail closed",()->{Fixture f=new Fixture(0);f.owner.record.taskAllocationId=hex(440);f.owner.record.retainedEmptyTaskDisplay=true;f.owner.journal.save(f.owner.record);var read=f.owner.journal.read();check(read.taskAllocationId.equals(hex(440))&&read.retainedEmptyTaskDisplay,"empty marker not durable");JSONObject bad=read.json();bad.put("retained_empty_task_display","true");JSONObject firstBad=bad;reject(()->AtomicWorkbenchJournal.Record.fromJson(firstBad));bad=read.json();bad.put("task_allocation_id",123);JSONObject finalBad=bad;reject(()->AtomicWorkbenchJournal.Record.fromJson(finalBad));});
 test("legacy origin stays readable and authenticated transfer keeps other tasks/HOME intact",()->{Fixture f=new Fixture(0);f.owner.record.tasks.add(new AtomicWorkbenchJournal.TaskOrigin(9,0,0,"legacy/.Main"));f.owner.record.homeTaskId=7;f.owner.record.homeComponent="launcher/.Home";var id=f.identity(10055,hex(450));var r=f.request(id);f.owner.prepareTaskOperation(r,false,"MUTATING","");f.owner.finishTaskOperation(r.operationId,id.serverBootGeneration,id.taskGeneration,"TRANSFERRED","22222222-2222-2222-2222-222222222222");var read=f.owner.journal.read();check(read.tasks.size()==2&&read.tasks.get(0).taskGeneration.isEmpty()&&read.homeTaskId==7&&read.homeComponent.equals("launcher/.Home"),"transfer changed legacy sibling/HOME");});
 test("new authorization-shaped journal metadata rejects coerced types and extra fields",()->{Fixture f=new Fixture(0);var id=f.identity(1000,hex(460));var origin=new AtomicWorkbenchJournal.TaskOrigin(42,0,0,id.baseComponent,id.uid,id.serverBootGeneration,id.taskGeneration,"WORKSPACE_OWNED","");JSONObject uid=origin.json();uid.put("uid","1000");reject(()->AtomicWorkbenchJournal.TaskOrigin.read(uid));JSONObject extra=origin.json();extra.put("token","not-allowed");reject(()->AtomicWorkbenchJournal.TaskOrigin.read(extra));var r=f.request(id);f.owner.prepareTaskOperation(r,false,"MUTATING","");JSONObject op=f.owner.record.taskOperations.get(0).json();op.put("target_window","-1");reject(()->AtomicWorkbenchJournal.TaskOperation.read(op));check(f.owner.journal.read().taskOperations.size()==1,"invalid parse rewrote original metadata");});
 System.out.println("TASK JOURNAL RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    jars = list((MODELS['ROOT'] / 'audit-output').rglob('json-*.jar'))
    production = ['AtomicWorkbenchJournal.java', 'AtomicWorkbenchTaskIdentity.java', 'AtomicWorkbenchTaskOperationRequest.java']
    with tempfile.TemporaryDirectory(prefix='duo-task-journal-') as directory:
        work = Path(directory); data = work / 'data'; data.mkdir()
        MODELS['compile_run'](work / 'base', sources(), production, 'ls.augment.com.TestTaskJournal', (data,), str(jars[0]))
        controls=[
            ('pre-WM journal fsync','ls/augment/com/TaskJournalAdapter.java','journal.save(record);','/* mutation: no durable prepare */'),
            ('fresh DMS identity','ls/augment/com/TaskJournalAdapter.java','requireDisplayIdentity();','/* mutation: no fresh DMS */'),
            ('actual new generation','ls/augment/com/TaskJournalAdapter.java','id.serverBootGeneration.equals(saved.serverBootGeneration)\n                        && id.taskGeneration.equals(saved.taskGeneration) && id.uid == saved.uid','true'),
            ('finish exact operation retirement','ls/augment/com/TaskJournalAdapter.java','record.taskOperations.removeIf(p -> p.operationId.equals(operationId));','/* mutation: keep stale pending operation */'),
            ('strict new UID metadata','ls/augment/com/AtomicWorkbenchJournal.java','int uid = strictTaskInt(json, "uid");','int uid = json.getInt("uid");'),
            ('exact new origin fields','ls/augment/com/AtomicWorkbenchJournal.java','if (!hasTaskKeys(json, "task_id", "origin_display", "user_id", "component", "uid",\n                    "server_boot_generation", "task_generation", "disposition", "successor_session"))','if (false)'),
        ]
        for number,(label,path,old,new) in enumerate(controls):
            negative_data=work/f'data-{number}';negative_data.mkdir()
            result=MODELS['compile_run'](work/f'negative-{number}',sources(),production,'ls.augment.com.TestTaskJournal',(negative_data,),str(jars[0]),{path:(old,new)},capture=True)
            assert result.returncode != 0 and b'AssertionError' in result.stderr,'journal negative escaped or failed compilation: '+label
            print('PASS actual task journal production negative:',label)
        print('TASK JOURNAL NEGATIVE CONTROLS',len(controls),'passed')



if __name__ == '__main__':
    main()
