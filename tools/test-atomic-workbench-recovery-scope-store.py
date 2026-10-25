"""Real Store v1/v2 IO, fail-closed reader floor, old final-C9 parser and Reset.

Files, locks, FileDescriptor IO, serialization, CAS and fsync ordering are production paths.
Unix ownership/inode/failure syscalls use the existing explicit desktop adapter. This is not
phone reboot/downgrade evidence, an eight-window implementation or ticket retirement.
"""
from pathlib import Path
import hashlib
import json
import runpy
import tempfile
import zipfile

STORE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-shelf-store.py')))
MODELS = STORE['MODELS']
ROOT = MODELS['ROOT']
ARCHIVE = ROOT / 'audit-output/workbench-completion-20261016/candidate9/candidate9-build-source-snapshot.zip'

HELPERS = r'''
 static JSONObject version2(JSONObject one)throws Exception{return one.put("schema",2).put("store_epoch","b".repeat(32))
  .put("recovery_scope",new JSONObject().put("schema",1).put("pool_limit",4).put("phase","LEGACY_ONLY").put("epoch",""))
  .put("retirement_outbox",new JSONArray());}
 static JSONObject high(JSONObject two,String phase)throws Exception{return two.put("recovery_scope",new JSONObject()
  .put("schema",1).put("pool_limit",8).put("phase",phase).put("epoch","c".repeat(32)));}
 static void header(Fixture f,long revision)throws Exception{var disk=f.disk();check(disk.length()==8&&disk.getInt("schema")==2
  &&disk.getString("store_epoch").equals("b".repeat(32))&&disk.getJSONObject("recovery_scope").getString("phase").equals("LEGACY_ONLY")
  &&disk.getJSONArray("retirement_outbox").length()==0&&disk.getLong("revision")==revision,"writer discarded or changed private header");
  var read=f.store.read();check(read.storageSchema==2&&read.storeEpoch.equals("b".repeat(32))&&read.recoveryScope.poolLimit==4,"header not retained in snapshot");}
 static void scopeReject(Run action)throws Exception{boolean caught=false;try{action.run();}catch(IOException e){caught=true;check(e.getMessage().equals("shelf_scope_unsupported_full_scope"),"reader floor lost precise reason: "+e);}
  check(caught,"four-window reader accepted the full eight-identity scope");}
'''

EXTRA = r'''
  test("v1 reads preserve original bytes and nested business schema",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.COMMITTED,LeaseState.HELD));byte[] before=f.bytes();var read=f.store.read();
   check(read.storageSchema==1&&read.storeEpoch.isEmpty()&&read.recoveryScope.poolLimit==4,"v1 reader invented an upgrade");
   check(Arrays.equals(before,f.bytes())&&f.disk().length()==5&&f.disk().getJSONArray("records").getJSONObject(0).getJSONObject("metadata").getInt("schema")==1,"read modified v1 or business schema");
  });
  test("v2 legacy save update remove preserve all header fields at empty records",()->{Fixture f=new Fixture();f.store.save(0,List.of());f.write(version2(f.disk()).toString());byte[] before=f.bytes();f.store.read();check(Arrays.equals(before,f.bytes()),"v2 read wrote bytes");
   f.store.save(1,List.of());header(f,2);f.store.update(2,record(1,Phase.TERMINAL,LeaseState.RELEASED));header(f,3);f.store.remove(3,hex(3001));header(f,4);
   check(f.store.read().records.isEmpty(),"safe explicit reference removal failed");
  });
  test("restore rollback retains v2 header and exact original durable identity",()->{Fixture f=new Fixture();var origin=req(1,SHELVE);var id=origin.identity;
   var primary=new AtomicWorkbenchTaskIdentity(id.serverBootGeneration,id.taskGeneration,id.taskId,id.rootTaskId,true,id.uid,id.userId,id.baseComponent,id.realComponent,0,"Built-in Screen","local:0");
   var prior=new Record(DurableMetadata.fromRequest(origin),Phase.COMMITTED,Disposition.SHELVED_REFERENCE,LeaseState.HELD,hex(4444),true,0,"Built-in Screen","local:0",primary);
   f.store.save(0,List.of(prior));f.write(version2(f.disk()).toString());
   var restore=new AtomicWorkbenchTaskOperationRequest(hex(7001),RESTORE,primary,1,SESSION,89,"vd2","unique2",2,SESSION,prior.shelfId,1,0,1000,6000,"");
   var pending=new Record(DurableMetadata.fromRequest(restore),Phase.PREPARED,Disposition.SHELVED_REFERENCE,LeaseState.HELD,prior.leaseId,false,0,"Built-in Screen","local:0",primary,prior);
   f.store.update(1,pending);header(f,2);android.os.Bundle proof=new android.os.Bundle();proof.putString("operation_id",restore.operationId);proof.putBoolean("cancelled",true);proof.putBoolean("mutation_dispatched",false);proof.putBoolean("external",false);
   proof.putBundle("identity",primary.toBundle());proof.putBoolean("inherited_hidden_lease",true);proof.putString("inherited_lease_id",prior.leaseId);
   var rolled=f.store.rollbackPreparedShelfOperation(2,restore.operationId,proof);header(f,3);var actual=rolled.find(prior.shelfId);
   check(actual.operationId.equals(prior.operationId)&&actual.leaseId.equals(prior.leaseId)&&actual.metadata.sameOperation(prior.metadata)&&actual.observedIdentity.equals(primary),"rollback refreshed or rebound original identity");
  });
  test("current high marker admission is impossible before any durable or resource side effect",()->{Fixture f=new Fixture();int syncs=Os.fileSyncs,dirs=Os.directorySyncs,renames=Os.renames;
   scopeReject(()->f.store.requireHighScope(0));check(!Files.exists(f.file)&&Os.fileSyncs==syncs&&Os.directorySyncs==dirs&&Os.renames==renames,"unsupported reader wrote a high permit");
   f.store.save(0,List.of());byte[] v1=f.bytes();scopeReject(()->f.store.requireHighScope(1));check(Arrays.equals(v1,f.bytes()),"rejected high admission changed v1");
   f.write(version2(f.disk()).toString());byte[] v2=f.bytes();scopeReject(()->f.store.requireHighScope(1));check(Arrays.equals(v2,f.bytes()),"rejected high admission changed v2");
  });
  test("high and draining empty envelopes are rejected by every actual writer",()->{for(String phase:new String[]{"HIGH_REQUIRED","DRAINING"}){Fixture f=new Fixture();f.store.save(0,List.of());f.write(high(version2(f.disk()),phase).toString());byte[] before=f.bytes();
   scopeReject(f.store::read);scopeReject(()->f.store.save(1,List.of()));scopeReject(()->f.store.update(1,record(1,Phase.PREPARED,LeaseState.NONE)));scopeReject(()->f.store.remove(1,hex(3001)));
   scopeReject(()->f.store.rollbackPreparedShelfOperation(1,hex(2001),new android.os.Bundle()));scopeReject(()->f.store.requireHighScope(1));check(Arrays.equals(before,f.bytes()),"an unsupported full-scope writer erased responsibility");
  }});
  test("nonempty unimplemented retirement outbox rejects every writer without dropping bytes",()->{Fixture f=new Fixture();f.store.save(0,List.of());f.write(version2(f.disk()).put("retirement_outbox",new JSONArray().put(new JSONObject().put("phase","REMOVAL_COMMITTED"))).toString());byte[] before=f.bytes();
   reject(f.store::read);reject(()->f.store.save(1,List.of()));reject(()->f.store.update(1,record(1,Phase.PREPARED,LeaseState.NONE)));reject(()->f.store.remove(1,hex(3001)));
   reject(()->f.store.rollbackPreparedShelfOperation(1,hex(2001),new android.os.Bundle()));reject(()->f.store.requireHighScope(1));check(Arrays.equals(before,f.bytes()),"unsupported retirement data was erased");
  });
  test("exact v2 envelope scope combinations and strict typed values reject corruption",()->{Fixture f=new Fixture();f.store.save(0,List.of());String original=version2(f.disk()).toString();ArrayList<String> bad=new ArrayList<>();
   for(String key:new String[]{"schema","owner_uid","user_id","revision","store_epoch","recovery_scope","records","retirement_outbox"}){var j=new JSONObject(original);j.remove(key);bad.add(j.toString());}
   bad.add(new JSONObject(original).put("extra",true).toString());bad.add(new JSONObject(original).put("schema",3).toString());bad.add(new JSONObject(original).put("schema","2").toString());
   bad.add(new JSONObject(original).put("store_epoch","B".repeat(32)).toString());bad.add(new JSONObject(original).put("store_epoch",JSONObject.NULL).toString());bad.add(new JSONObject(original).put("retirement_outbox",new JSONObject()).toString());
   for(String key:new String[]{"schema","pool_limit","phase","epoch"}){var j=new JSONObject(original);j.getJSONObject("recovery_scope").remove(key);bad.add(j.toString());}
   for(Object[] change:new Object[][]{{"schema",2},{"schema","1"},{"pool_limit",8},{"pool_limit","4"},{"phase","UNKNOWN"},{"phase","HIGH_REQUIRED"},{"epoch","c".repeat(32)},{"extra",false}}){var j=new JSONObject(original);j.getJSONObject("recovery_scope").put((String)change[0],change[1]);bad.add(j.toString());}
   bad.add(original.replaceFirst("\\{","{\"schema\":2,"));bad.add(original+" junk");
   for(String bytes:bad){f.write(bytes);byte[] before=f.bytes();reject(f.store::read);reject(()->f.store.save(1,List.of()));check(Arrays.equals(before,f.bytes()),"invalid scope was normalized or deleted");}
  });
  test("v2 atomic failure breakpoints retain header and distinguish replacement uncertainty",()->{for(int failure=0;failure<4;failure++){Fixture f=new Fixture();f.store.save(0,List.of());f.write(version2(f.disk()).toString());byte[] before=f.bytes();
   if(failure==0)Os.failWrite=true;if(failure==1)Os.failFileSync=true;if(failure==2)Os.failRename=true;if(failure==3)Os.failDirectorySync=true;
   boolean caught=false;try{f.store.save(1,List.of());}catch(SaveException error){caught=true;check(error.replacementVisible==(failure==3),"IO failure falsely certified rename/durability");}
   check(caught,"atomic failure returned success");if(failure<3)check(Arrays.equals(before,f.bytes()),"pre-rename failure changed old envelope");header(f,failure==3?2:1);
   if(failure==3){byte[] actual=f.bytes();reject(()->f.store.save(1,List.of()));check(Arrays.equals(actual,f.bytes()),"uncertain replacement accepted stale CAS");f.store.save(2,List.of());header(f,3);}
  }});
  test("old final C9 actual parser rejects both v2 families and cannot overwrite either",()->{for(String phase:new String[]{"LEGACY_ONLY","HIGH_REQUIRED","DRAINING"}){Fixture f=new Fixture();f.store.save(0,List.of());var old=new LegacyC9TaskShelfStore(f.context,10055,0);check(old.read().revision==1,"old actual v1 reader broken");
   var j=version2(f.disk());if(!phase.equals("LEGACY_ONLY"))high(j,phase);f.write(j.toString());byte[] before=f.bytes();reject(old::read);reject(()->old.save(1,List.of()));check(Arrays.equals(before,f.bytes()),"old C9 writer overwrote new evidence");
  }});
  test("actual Reset refuses high scope even without any visible or journal records",()->{Fixture f=new Fixture();f.store.save(0,List.of());f.write(high(version2(f.disk()),"HIGH_REQUIRED").toString());byte[] before=f.bytes();
   reject(()->AtomicWorkbenchReset.requireClearSafe(f.context));check(!AtomicWorkbenchReset.restore(f.context).getBoolean("success"),"actual Reset restore certified unknown scope");check(Arrays.equals(before,f.bytes()),"Reset erased unsupported recovery evidence");
   Files.writeString(f.directory.resolve("recovery-window-7.json"),"{}");reject(()->AtomicWorkbenchReset.requireClearSafe(f.context));check(Files.exists(f.directory.resolve("recovery-window-7.json")),"Reset deleted future slot Journal");
  });
  test("actual Reset accepts empty supported v2 but rejects unknown outbox and malformed bytes",()->{Fixture f=new Fixture();f.store.save(0,List.of());f.write(version2(f.disk()).toString());AtomicWorkbenchReset.requireClearSafe(f.context);
   f.write(f.disk().put("retirement_outbox",new JSONArray().put(new JSONObject())).toString());byte[] before=f.bytes();reject(()->AtomicWorkbenchReset.requireClearSafe(f.context));check(Arrays.equals(before,f.bytes()),"Reset treated unknown outbox as cache");
   f.write("{}");reject(()->AtomicWorkbenchReset.requireClearSafe(f.context));
  });
'''


def sources():
    values = dict(STORE['SYSTEM'])
    values['android/os/Bundle.java'] = MODELS['BUNDLE'] + ''
    values['android/os/Bundle.java'] = values['android/os/Bundle.java'].replace('public class Bundle {', 'public class Bundle {public static final Object CREATOR=new Object();')
    values['android/content/Context.java'] = values['android/content/Context.java'].replace('public class Context {', 'public class Context {public java.io.File getFilesDir(){return new java.io.File(pm.info.dataDir,"files");}')
    values['android/os/Process.java'] = 'package android.os;public class Process{public static int myUid(){return 10055;}}'
    values['android/os/IBinder.java'] = 'package android.os;public interface IBinder{boolean isBinderAlive();boolean transact(int c,Parcel d,Parcel r,int f)throws Exception;}'
    values['android/os/Parcel.java'] = 'package android.os;public class Parcel{public static Parcel obtain(){return new Parcel();}public void writeInterfaceToken(String s){}public void writeInt(int i){}public void writeString(String s){}public void readException(){}public Bundle readTypedObject(Object c){throw new AssertionError("unexpected live endpoint");}public void recycle(){}}'
    values['ls/augment/com/AtomicWorkbenchProvider.java'] = 'package ls.augment.com;final class AtomicWorkbenchProvider{static class Pending{android.os.IBinder endpoint;String token;}static Pending existingForReset(){return null;}static boolean hasLiveEndpoint(){return false;}static void remove(Pending p){throw new AssertionError("unexpected provider removal");}}'
    values['ls/augment/com/ResetWriteFence.java'] = 'package ls.augment.com;final class ResetWriteFence{static boolean owns(){return true;}}'
    values['ls/augment/com/AtomicWorkbenchProtocol.java'] = 'package ls.augment.com;final class AtomicWorkbenchProtocol{static final String DESCRIPTOR="fixed";static final int VERSION=1,TX_CLOSE=1;static android.os.Bundle failure(String m){android.os.Bundle b=new android.os.Bundle();b.putBoolean("success",false);b.putString("message",m);return b;}}'
    values['ls/augment/com/AtomicWorkbenchClient.java'] = 'package ls.augment.com;final class AtomicWorkbenchClient{static AtomicWorkbenchClient connect(android.content.Context c){return new AtomicWorkbenchClient();}android.os.Bundle close(){android.os.Bundle b=new android.os.Bundle();b.putBoolean("success",false);b.putBoolean("recovery_pending",true);return b;}}'
    with zipfile.ZipFile(ARCHIVE) as archive:
        name = 'android/app/src/main/java/ls/augment/com/AtomicWorkbenchTaskShelfStore.java'
        original = archive.read(name)
        if hashlib.sha256(original).hexdigest() != 'c19e632b0ffc7950768c14ffd3c2dd7dd27eb294c2ab44b3c11ea13dab7d625d':
            raise AssertionError('final-C9 real parser identity changed')
        old = original.decode('utf-8')
    values['ls/augment/com/LegacyC9TaskShelfStore.java'] = old.replace('AtomicWorkbenchTaskShelfStore', 'LegacyC9TaskShelfStore')
    test = STORE['TEST'].replace('TestTaskShelfStore', 'TestRecoveryScopeStore')
    test = test.replace(' public static void main(String[] args)', HELPERS + '\n public static void main(String[] args)')
    test = test.replace('  System.out.println("TASK SHELF STORE RESULT', EXTRA + '\n  System.out.println("RECOVERY SCOPE STORE RESULT')
    values['ls/augment/com/TestRecoveryScopeStore.java'] = test
    return values


def main():
    jars = list((Path.home() / '.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
    production = MODELS['PRODUCTION'] + ['AtomicWorkbenchTaskShelfStore.java', 'AtomicWorkbenchRecoveryScope.java', 'AtomicWorkbenchReset.java']
    values = sources()
    with tempfile.TemporaryDirectory(prefix='duo-recovery-scope-store-') as tmp:
        work = Path(tmp); data = work / 'data'; data.mkdir()
        MODELS['compile_run'](work / 'base', values, production, 'ls.augment.com.TestRecoveryScopeStore', (data,), str(jars[0]))
        controls = [
            ('required full reader gate', 'AtomicWorkbenchRecoveryScope.java', 'if (requiresHighScopeReader()) throw new IOException("shelf_scope_unsupported_full_scope");', ''),
            ('preserve header for ordinary writers', 'AtomicWorkbenchTaskShelfStore.java', 'return new Snapshot(revision,records,previous.storageSchema,previous.storeEpoch,previous.recoveryScope);', 'return new Snapshot(revision,records);'),
            ('preserve header for rollback', 'AtomicWorkbenchTaskShelfStore.java', 'writeSnapshot(derive(current,expectedRevision+1,records))', 'writeSnapshot(new Snapshot(expectedRevision+1,records))'),
            ('reject unknown retirement outbox', 'AtomicWorkbenchTaskShelfStore.java', 'if(((JSONArray)outbox).length()!=0) throw new IOException("shelf_retirement_reader_required");', ''),
            ('exact v2 family', 'AtomicWorkbenchTaskShelfStore.java', 'jsonKeys(json,"schema","owner_uid","user_id","revision","store_epoch","recovery_scope","records","retirement_outbox");', ''),
            ('exact scope keys', 'AtomicWorkbenchRecoveryScope.java', '!keys.equals(new HashSet<>(Arrays.asList("schema", "pool_limit", "phase", "epoch")))', 'false'),
            ('v2 envelope durability never skips directory sync', 'AtomicWorkbenchTaskShelfStore.java', 'checkDirectory(); syncDirectory();', 'checkDirectory();'),
            ('v2 envelope durability never skips file sync', 'AtomicWorkbenchTaskShelfStore.java', 'output.flush(); Os.fsync(fd);', 'output.flush();'),
            ('current-disk revision CAS', 'AtomicWorkbenchTaskShelfStore.java', 'expected!=previous.revision', 'false'),
            ('Reset cannot discard unreadable scope', 'AtomicWorkbenchReset.java', 'throw new IOException("任务暂存恢复责任尚未核对，不能清除记录", unavailable);', 'return false;'),
        ]
        for index, (label, name, old, new) in enumerate(controls):
            target = work / ('negative-data-' + str(index)); target.mkdir()
            result = MODELS['compile_run'](work / ('negative-' + str(index)), values, production,
                'ls.augment.com.TestRecoveryScopeStore', (target,), str(jars[0]), {'ls/augment/com/' + name: (old, new)}, capture=True)
            if result.returncode == 0 or b'AssertionError' not in result.stderr:
                raise AssertionError('scope negative escaped or failed compilation: ' + label + '\n' + result.stderr.decode(errors='replace'))
            print('PASS recovery scope Store production negative:', label)
        print('RECOVERY SCOPE STORE NEGATIVE CONTROLS', len(controls), 'passed')


if __name__ == '__main__':
    main()
