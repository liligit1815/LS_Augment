"""Execute actual TaskOps/Store/Journal source binding with existing explicit host adapters."""
from pathlib import Path
import argparse,hashlib,json,runpy,subprocess,tempfile

TEST = r'''package ls.augment.com;
import android.content.Context;import android.os.Bundle;import android.os.SystemClock;import android.system.Os;import java.nio.file.*;import java.util.*;
import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public final class TestSourceBinding {
 static int checks;static void check(boolean b,String reason){checks++;if(!b)throw new AssertionError(reason);}
 static String hex(int n){return String.format("%032x",n);}
 static byte[] journal(Path data,int id)throws Exception{return Files.readAllBytes(data.resolve("files/atomic_workbench/recovery-window-"+id+".json"));}
 public static void main(String[] args)throws Exception{
  Path data=Path.of(args[0]);Context context=new Context();context.pm.info.dataDir=data.toString();Os.chown(data.toString(),10055,10055);SystemClock.now=1000;
  var engine=new AtomicWorkbenchEngine();for(var p:engine.windows)p.initialize(context);
  var store=new AtomicWorkbenchTaskShelfStore(context,10055,0);var authority=new AtomicWorkbenchTaskAuthority(engine,store);var owner=new AtomicWorkbenchTaskOperations(engine,authority,store);
  var source=engine.windows[1];var target=engine.windows[2];
  var task=new AtomicWorkbenchTaskIdentity(hex(1),hex(2),42,42,true,10055,0,"sample/.Base","sample/.Real",source.record.displayId,source.record.displayName,source.record.uniqueId);
  authority.tasks.put(task.taskGeneration,task);source.taskCount=1;
  var shelve=new AtomicWorkbenchTaskOperationRequest(hex(3),SHELVE,task,1,source.record.session,0,"primary","primary-unique",-1,"",hex(4),0,0,1000,6000,"");
  Bundle shelved=owner.change(shelve.toBundle());check(shelved.getBoolean("success"),"genuine initial shelf failed");
  var physical=AtomicWorkbenchTaskIdentity.fromBundle(shelved.getBundle("identity"));
  for(int variant=0;variant<2;variant++){
   byte[] before=Files.readAllBytes(data.resolve("files/atomic_workbench/task-shelf.json"));byte[][] journals={journal(data,0),journal(data,1),journal(data,2)};int prepared=authority.prepares,applied=authority.applies;long revision=engine.revision;
   int slot=variant==0?0:1;String session=engine.windows[0].record.session;
   var forged=new AtomicWorkbenchTaskOperationRequest(hex(10+variant),RESTORE,physical,slot,session,target.record.displayId,target.record.displayName,target.record.uniqueId,2,target.record.session,shelve.shelfId,store.read().revision,revision,1000,6000,"");
   Bundle result=owner.change(forged.toBundle());
   check(!result.getBoolean("success")&&"REJECTED".equals(result.getString("status")),"relabelled durable source was accepted");
   check(authority.prepares==prepared&&authority.applies==applied&&engine.revision==revision,"source rejection began prepare/dispatch/input work");
   check(Arrays.equals(before,Files.readAllBytes(data.resolve("files/atomic_workbench/task-shelf.json"))),"source rejection wrote the shelf");
   for(int id=0;id<3;id++)check(Arrays.equals(journals[id],journal(data,id)),"source rejection changed a Journal owner");
  }
  var genuine=new AtomicWorkbenchTaskOperationRequest(hex(20),RESTORE,physical,1,source.record.session,target.record.displayId,target.record.displayName,target.record.uniqueId,2,target.record.session,shelve.shelfId,store.read().revision,engine.revision,1000,6000,"");
  check(owner.change(genuine.toBundle()).getBoolean("success")&&authority.applies==2,"same-source legitimate restore regressed");
  check(source.journal.read().tasks.get(0).disposition.equals("TRANSFERRED")&&target.journal.read().tasks.get(0).disposition.equals("WORKSPACE_OWNED"),"genuine restore did not acknowledge the two exact owners");
  for(var p:engine.windows)p.journal.releaseLock();Os.cleanup();
  System.out.println("SOURCE BINDING RESULT 3 cases; "+checks+" assertions");
 }
}'''

def fixture(root,ops,journal):
    source=dict(ops['SOURCES'])
    # Only the existing Engine/broker/syscall boundaries are doubles. Handoff bodies are real.
    platform=(root/'android/app/src/main/java/ls/augment/com/AtomicWorkbenchPlatform.java').read_text(encoding='utf-8')
    body='''package ls.augment.com;import android.os.*;import android.view.Display;import java.util.*;
final class AtomicWorkbenchPlatform{
 final int windowId;AtomicWorkbenchJournal journal;AtomicWorkbenchJournal.Record record;boolean live=true,retained;int taskCount,syncs;
 AtomicWorkbenchPlatform(int id){windowId=id;}
 void initialize(android.content.Context context)throws Exception{journal=new AtomicWorkbenchJournal(context,10055,0,windowId);journal.acquireLock();record=new AtomicWorkbenchJournal.Record(10055,0,windowId);record.displayId=88+windowId;record.uniqueId="unique"+windowId;record.width=800;record.height=600;record.density=320;journal.save(record);}
 void requireDisplayIdentity(){if(record==null)throw new SecurityException();}
 boolean hasLiveDisplay(){return live&&record!=null;}boolean hasTaskJournalSession(String session){return record!=null&&record.session.equals(session);}
 Bundle taskWindowIdentity(){requireDisplayIdentity();Bundle b=new Bundle();b.putInt("window_id",windowId);b.putString("window_session",record.session);b.putInt("display_id",record.displayId);b.putString("display_name",record.displayName);b.putString("display_unique",record.uniqueId);return b;}
 void synchronizeTaskOperationBinding(AtomicWorkbenchTaskIdentity restored){syncs++;retained=taskCount==0;}
'''
    body+='\n'.join(journal['method'](platform,name) for name in ['void prepareTaskOperation(','void finishTaskOperation(','void cancelPreparedTaskOperation('])+'}'
    source['ls/augment/com/AtomicWorkbenchPlatform.java']=body
    old='engine.windows[slot].phases.get(id)'
    new='engine.windows[slot].record.taskOperations.stream().filter(x->x.operationId.equals(id)).findFirst().map(x->x.phase).orElse("")'
    authority=source['ls/augment/com/AtomicWorkbenchTaskAuthority.java'];assert authority.count(old)==1
    source['ls/augment/com/AtomicWorkbenchTaskAuthority.java']=authority.replace(old,new)
    source['android/os/Process.java']='package android.os;public class Process{public static final int ROOT_UID=0;public static int myUid(){return 0;}}'
    source['android/content/ComponentName.java']=journal['ENGINE']['migration_sources']()['android/content/ComponentName.java']
    source['android/view/Display.java']='package android.view;public class Display{public static final int DEFAULT_DISPLAY=0;}'
    source['ls/augment/com/TestSourceBinding.java']=TEST
    return source

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--root',type=Path,default=Path(__file__).resolve().parents[1]);parser.add_argument('--taskops-source',type=Path)
    parser.add_argument('--baseline-source',type=Path);parser.add_argument('--out',type=Path);parser.add_argument('--negative-controls',action='store_true');a=parser.parse_args()
    root=a.root.resolve();task=a.taskops_source or root/'android/app/src/main/java/ls/augment/com/AtomicWorkbenchTaskOperations.java'
    ops=runpy.run_path(str(root/'tools/test-atomic-workbench-task-operations.py'));journal=runpy.run_path(str(root/'tools/test-atomic-workbench-task-journal.py'));models=ops['MODELS']
    production=models['PRODUCTION']+['AtomicWorkbenchTaskShelfStore.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchJournal.java',
        'AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']
    jar=next((root/'audit-output').rglob('json-*.jar'));source=fixture(root,ops,journal);text=task.read_text(encoding='utf-8')
    temporary=None
    if a.out:out=a.out.resolve();out.mkdir(parents=True,exist_ok=False)
    else:temporary=tempfile.TemporaryDirectory(prefix='duo-task-source-binding-');out=Path(temporary.name)
    def execute(label,taskops):
        work=out/label;work.mkdir();data=work/'data';data.mkdir();code=dict(source);code['ls/augment/com/AtomicWorkbenchTaskOperations.java']=taskops
        try:run=models['compile_run'](work,code,production,'ls.augment.com.TestSourceBinding',(data,),str(jar),capture=True)
        except subprocess.CalledProcessError as failed:
            (work/'compile.stdout').write_bytes(failed.stdout or b'');(work/'compile.stderr').write_bytes(failed.stderr or b'');raise
        (work/'stdout.txt').write_bytes(run.stdout);(work/'stderr.txt').write_bytes(run.stderr)
        return run
    positive=execute('positive',text);assert positive.returncode==0,positive.stderr.decode('utf-8','replace')
    negative=None
    if a.negative_controls:
        if a.baseline_source:baseline=a.baseline_source.read_text(encoding='utf-8')
        else:
            removed='                        || prior.metadata.sourceSlot != request.sourceSlot\n                        || !prior.metadata.sourceWindowSession.equals(request.sourceWindowSession)\n'
            assert text.count(removed)==1,'source binding gates not found';baseline=text.replace(removed,'')
        negative=execute('negative-original-source-binding',baseline)
        assert negative.returncode!=0 and b'AssertionError: relabelled durable source was accepted' in negative.stderr,'original source binding failure not detected at runtime'
    result=dict(status='PASS_TASK_SOURCE_BINDING',cases=3,assertions=15,source=str(task.resolve()),sourceSha256=hashlib.sha256(task.read_bytes()).hexdigest().upper(),
                positiveExit=positive.returncode,negativeExit=None if negative is None else negative.returncode,
                boundary='Actual TaskOps/Store/Journal and extracted Platform ack. Controlled Engine/broker/Unix syscalls; no Android SDK, phone or full-system proof.')
    (out/'summary.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');print(json.dumps(result));
    if temporary:temporary.cleanup()

if __name__=='__main__':main()
