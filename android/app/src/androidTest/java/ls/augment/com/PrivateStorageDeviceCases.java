package ls.augment.com;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Process;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/** Real app-UID storage/SELinux tests. Synthetic evidence stays inside this app's cache. */
final class PrivateStorageDeviceCases {
    private int checks;
    private void require(boolean condition,String message) {
        checks++;if(!condition)throw new AssertionError(message);
    }
    static JSONObject run(Context context)throws Exception { return new PrivateStorageDeviceCases().execute(context); }

    private JSONObject execute(Context context)throws Exception {
        require("ls.augment.com".equals(context.getPackageName()),"wrong target application");
        HidePrivateStorage.configure(context.getFilesDir(),Process.myUid()/100000==0);
        RootShell.Result ready=HidePrivateStorage.prepare();
        File actual=new File(context.getFilesDir(),"hide-recovery").getCanonicalFile();
        if(!ready.isSuccess()) {
            String probe="id; ls -ldZ "+RootShell.quote(actual.getPath())+"; fsync "+RootShell.quote(actual.getPath())
                    +"; echo single_sync=$?; find "+RootShell.quote(actual.getPath())+" -type d -exec fsync '{}' ';'; echo tree_sync=$?";
            throw new AssertionError(ready.output+" | private transport: "+local(actual,probe,null).output);
        }
        int files=privateTree(actual);
        HideTargetStore.ReadResult targets=new HideTargetStore().read();
        require(targets.status==HideTargetStore.ReadStatus.OK||targets.status==HideTargetStore.ReadStatus.ABSENT,
                "live private targets unreadable: "+targets.error);
        require(HideRecoveryCatalog.read("").success,"live private catalog unreadable");
        JSONObject result=new JSONObject().put("uid",Process.myUid()).put("privateRecoveryFiles",files)
                .put("targetRecords",targets.snapshot.records.size());
        File legacyArchive=new File(context.getFilesDir(),"legacy-root-v1");
        require(new File(legacyArchive,".complete-v1").isFile(),"legacy Root private archive not complete");
        result.put("privateLegacyRootFiles",privateTree(legacyArchive));

        File fixture=new File(context.getCacheDir(),"private-storage-fixture-"+UUID.randomUUID()).getCanonicalFile();
        require(fixture.mkdir(),"cannot create private fixture");Os.chown(fixture.getPath(),Process.myUid(),Process.myUid());Os.chmod(fixture.getPath(),0700);
        File v2=new File(fixture,"v2");require(v2.mkdir(),"cannot create fixture state");Os.chown(v2.getPath(),Process.myUid(),Process.myUid());Os.chmod(v2.getPath(),0700);
        try {
            File linked=new File(fixture,"hide-recovery");
            Os.symlink(actual.getPath(),linked.getPath());
            try {
                try { HidePrivateStorage.configure(fixture,true);throw new AssertionError("linked private root accepted"); }
                catch(IllegalStateException expected){require(expected.getCause() instanceof java.io.IOException,"link validation did not run");}
                try { HideLegacyStorageMigration.migrate(linked,false);throw new AssertionError("linked import root accepted"); }
                catch(java.io.IOException expected){require(true,"linked import root rejected");}
            } finally { java.nio.file.Files.delete(linked.toPath()); }
            HideTargetStore store=new HideTargetStore(op->local(fixture,op.command(),op.stdin()));
            HideTargetStore.ReadResult initial=store.read();
            require(initial.status==HideTargetStore.ReadStatus.ABSENT,"unexpected initial target document: "+initial.status+":"+initial.error);
            HideTargetStore.Snapshot next=new HideTargetStore.Snapshot(1,Collections.emptyList());
            HideTargetStore.WriteResult saved=store.compareAndSet(0,next);
            require(saved.applied,"app-UID target CAS failed: "+saved.error);
            require(store.read().snapshot.revision==1,"private target reload");
            require(store.compareAndSet(0,next).status==HideTargetStore.WriteStatus.CONFLICT,"stale CAS accepted");
            RootShell.Result archived=local(fixture,HideRecoveryArchive.command(),"");
            require(archived.isSuccess(),"app-UID archive write: "+archived.output);
            require(local(fixture,HideRecoveryArchive.command(),"").isSuccess(),"app-UID archive idempotent write");
            RootShell.Result notice=local(fixture,HideRecoveryEmergency.command(),null);
            require(notice.isSuccess(),"app-UID recovery notice write: "+notice.output);
            String nonce=UUID.randomUUID().toString(),owner=UUID.randomUUID().toString(),pkg="ls.augment.storage.fixture";
            HideRecoveryJournal.Entry entry=new HideRecoveryJournal.Entry(nonce,owner,0,0,0,pkg,"a".repeat(64),
                    System.currentTimeMillis(),HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
            RootShell.Result journal=local(fixture,HideRecoveryJournal.command(),entry.encode()+"\n");
            require(journal.isSuccess(),"app-UID journal write: "+journal.output);
            require(local(fixture,HideRecoveryJournal.command(),entry.encode()+"\n").isSuccess(),"app-UID journal idempotent write");
            HideRootPendingStore pending=new HideRootPendingStore(op->local(fixture,op.command(),null));
            HideRootPendingStore.Snapshot before=pending.read(0,0,pkg);
            require(before.available(),"app-UID pending read: "+before.error);
            List<HideRootPendingStore.Claim> claims=race(()->pending.claim(before,entry));
            require(claims.get(0).acknowledged!=claims.get(1).acknowledged,"app-UID concurrent pending claim needs one winner");
            HideRootPendingStore.Claim claim=claims.get(0).acknowledged?claims.get(0):claims.get(1);
            require(claim.acknowledged,"app-UID pending claim: "+claim.error);
            require(!pending.claim(before,entry).acknowledged,"app-UID duplicate pending claim accepted");
            require(pending.finishNotSent(claim),"app-UID pending terminal");
            require(pending.finishNotSent(claim),"app-UID pending terminal idempotence");
            require(pending.read(0,0,pkg).nextSlot==1,"app-UID pending reload");

            String restoreNonce=UUID.randomUUID().toString();
            HideRestoreGrantLedger.Coordinate coordinate=new HideRestoreGrantLedger.Coordinate(UUID.randomUUID().toString(),
                    nonce,restoreNonce,1,0,0,pkg,UUID.randomUUID().toString());
            HideRestoreGrantLedger.StatusProof proof=new HideRestoreGrantLedger.StatusProof(coordinate,"b".repeat(64));
            HideRecoveryJournal.Entry restore=new HideRecoveryJournal.Entry(restoreNonce,owner,0,0,0,pkg,"a".repeat(64),
                    System.currentTimeMillis(),HideRecoveryJournal.Stage.RESTORE_PREPARED,"HIDDEN",0,false,nonce,proof);
            HideRestoreGrantStore grants=new HideRestoreGrantStore(op->local(fixture,op.command(),null));
            List<HideRestoreGrantStore.Claim> grantClaims=race(()->grants.claim(restore));
            require(grantClaims.get(0).acknowledged!=grantClaims.get(1).acknowledged,"app-UID concurrent grant claim needs one winner");
            HideRestoreGrantStore.Claim granted=grantClaims.get(0).acknowledged?grantClaims.get(0):grantClaims.get(1);
            require(granted.acknowledged,"app-UID grant write: "+granted.error);
            require(!grants.claim(restore).acknowledged,"app-UID duplicate grant claim accepted");
            require(grants.finishNotSent(granted),"app-UID grant terminal");
            require(grants.finishNotSent(granted),"app-UID grant terminal idempotence");
            RootShell.Result catalog=local(fixture,HideRecoveryCatalog.command("",""),null);
            require(catalog.isSuccess()&&HideRecoveryCatalog.parseProtocol(catalog.output).success,"private catalog protocol");
            int generated=privateTree(fixture);
            String failedDirectory=new File(v2,"manual-targets-v1").getPath();
            String failedSync="fsync() { [ \"$1\" != "+RootShell.quote(failedDirectory)
                    +" ] || return 74; command fsync \"$@\"; }\n"
                    +HideLegacyStorageMigration.syncCommand(fixture);
            require(!local(fixture,failedSync,null).isSuccess(),"Android directory sync failure was ignored");
            RootShell.Result stamp=local(fixture,HideResetStorage.command(""),null);
            require(stamp.isSuccess()&&stamp.output.matches("[0-9a-f]{64}"),"app-UID reset inventory: "+stamp.output);
            RootShell.Result cleared=local(fixture,HideResetStorage.command(stamp.output),null);
            require(cleared.isSuccess(),"app-UID exact reset: "+cleared.output);
            require(!new File(v2,"manual-targets-v1/document").exists(),"fixture record survived reset");
            result.put("syntheticPrivateFiles",generated);
        } finally { OwnedFileCleaner.clear(fixture);require(fixture.delete(),"fixture cleanup"); }

        File ledger=context.getDatabasePath(HealthLedgerDatabase.NAME);
        require(ledger.isFile(),"private health ledger missing");
        require(Os.stat(ledger.getPath()).st_uid==Process.myUid(),"health ledger owner");
        try(SQLiteDatabase database=SQLiteDatabase.openDatabase(ledger.getPath(),null,SQLiteDatabase.OPEN_READONLY)) {
            try(Cursor cursor=database.rawQuery("PRAGMA quick_check",null)) {
                require(cursor.moveToFirst()&&"ok".equals(cursor.getString(0))&&!cursor.moveToNext(),"private health integrity");
            }
            try(Cursor cursor=database.rawQuery("SELECT value FROM migration WHERE key='legacy_imported'",null)) {
                require(cursor.moveToFirst()&&"1".equals(cursor.getString(0)),"health import not ready");
            }
        }
        result.put("checks",checks).put("success",true);
        return result;
    }
    private int privateTree(File file)throws Exception {
        StructStat stat=Os.lstat(file.getPath());
        require(stat.st_uid==Process.myUid(),"foreign owner in private storage: "+file.getName());
        require((stat.st_mode&0077)==0,"shared permissions in private storage: "+file.getName());
        require(OsConstants.S_ISDIR(stat.st_mode)||OsConstants.S_ISREG(stat.st_mode),"linked/special private file");
        int count=0;
        if(OsConstants.S_ISDIR(stat.st_mode)) {
            File[] children=file.listFiles();require(children!=null,"private listing failed");
            for(File child:children)count+=privateTree(child);
        } else count++;
        return count;
    }
    private RootShell.Result local(File root,String command,String input) {
        ProcessBuilder process=new ProcessBuilder("/system/bin/sh","-c",command).directory(root).redirectErrorStream(true);
        process.environment().put("LSA_PRIVATE_ROOT",root.getPath());
        return RootShell.runProcess(process,input,30,2*1024*1024,null);
    }
    private <T> List<T> race(Callable<T> action)throws Exception {
        ExecutorService executor=Executors.newFixedThreadPool(2);
        CountDownLatch ready=new CountDownLatch(2),start=new CountDownLatch(1);
        Callable<T> waiting=()->{ready.countDown();if(!start.await(10,TimeUnit.SECONDS))throw new IllegalStateException("race start timeout");return action.call();};
        try {
            Future<T> first=executor.submit(waiting),second=executor.submit(waiting);
            require(ready.await(10,TimeUnit.SECONDS),"private race workers ready");
            start.countDown();
            return java.util.Arrays.asList(first.get(45,TimeUnit.SECONDS),second.get(45,TimeUnit.SECONDS));
        } finally { start.countDown();executor.shutdownNow();require(executor.awaitTermination(10,TimeUnit.SECONDS),"private race workers stopped"); }
    }
}
