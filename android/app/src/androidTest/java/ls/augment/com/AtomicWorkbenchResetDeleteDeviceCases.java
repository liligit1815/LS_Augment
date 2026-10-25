package ls.augment.com;

import android.content.Context;
import android.os.Process;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileLock;
import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: actual Android deletion primitives, not Store/close/reset qualification. */
final class AtomicWorkbenchResetDeleteDeviceCases {
    private static final String PREFIX="atomic-reset-delete-";
    private static final byte[] SENTINEL="isolated-delete-sentinel".getBytes(StandardCharsets.UTF_8);
    private AtomicWorkbenchResetDeleteDeviceCases() { }

    static JSONObject run(Context context) throws Exception {
        JSONObject result=new JSONObject().put("success",false)
                .put("scope","ANDROID_HELD_LOCK_DELETE_PRIMITIVE_ONLY")
                .put("wholeStoreVerified",false).put("businessCloseVerified",false)
                .put("globalResetVerified",false).put("rootStarted",false);
        JSONArray cases=new JSONArray();result.put("cases",cases);
        Sandbox sandbox=null;Throwable failure=null;String stage="sandbox";
        try {
            sandbox=new Sandbox(context);
            result.put("sandboxId",sandbox.root.getName()).put("uid",sandbox.uid);
            stage="held_unlink";
            primitive(sandbox,false,cases);
            stage="permission_failure";
            primitive(sandbox,true,cases);
            sandbox.requireSentinel();
        } catch(Throwable invalid) {
            failure=invalid;
            result.put("failureStage",stage).put("failureType",invalid.getClass().getName());
        } finally {
            // Cleanup is restricted to the freshly created sandbox. It cannot erase a failed assertion.
            if(sandbox!=null) try {
                sandbox.cleanup();result.put("sandboxCleaned",true);
            } catch(Throwable cleanupFailure) {
                result.put("sandboxCleaned",false).put("cleanupFailureType",cleanupFailure.getClass().getName());
                if(failure==null) { failure=cleanupFailure;result.put("failureStage","sandbox_cleanup")
                        .put("failureType",cleanupFailure.getClass().getName()); }
            }
        }
        result.put("success",failure==null&&cases.length()==2);
        return result;
    }

    private static void primitive(Sandbox sandbox,boolean denyDelete,JSONArray cases) throws Exception {
        JSONObject record=new JSONObject().put("case",denyDelete?"permission_failure":"held_unlink")
                .put("success",false);cases.put(record);
        File container=sandbox.mkdir(denyDelete?"permission-case":"unlink-case");
        File files=sandbox.mkdir(new File(container,"files"));
        File directory=sandbox.mkdir(new File(files,"atomic_workbench"));
        File lock=new File(directory,"task-shelf.lock");
        FileDescriptor fd=Os.open(lock.getPath(),OsConstants.O_RDWR|OsConstants.O_CREAT
                |OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW,0600);
        boolean streamOwns=false;
        try {
            FileOutputStream stream=new FileOutputStream(fd);streamOwns=true;
            try(stream) {
                StructStat opened=Os.fstat(fd),named=Os.lstat(lock.getPath());
                require(OsConstants.S_ISREG(opened.st_mode)&&opened.st_uid==sandbox.uid
                        &&opened.st_dev==named.st_dev&&opened.st_ino==named.st_ino,"opened_lock_identity");
                Os.fchown(fd,sandbox.uid,sandbox.uid);Os.fchmod(fd,0600);
                // Same OS/descriptor/channel-lock sequence as the production Store, not a replacement Cleaner.
                try(FileLock held=stream.getChannel().tryLock()) {
                    require(held!=null&&held.isValid(),"exclusive_file_lock");
                    record.put("lockAcquired",true).put("lockDevice",opened.st_dev).put("lockInode",opened.st_ino);
                    if(denyDelete) {
                        Os.chmod(directory.getPath(),0500);
                        boolean refused=false;
                        try { OwnedFileCleaner.clear(files); }
                        catch(IOException expected) { refused=true;record.put("deleteFailureType",expected.getClass().getName()); }
                        require(refused&&lock.isFile()&&directory.isDirectory()&&held.isValid(),"permission_failure_preserved");
                        record.put("actualDeleteRefused",true).put("evidenceStillPresent",true);
                    } else {
                        OwnedFileCleaner.clear(files);
                        require(files.isDirectory()&&!directory.exists(),"owned_directory_not_deleted");
                        requireAbsent(lock);
                        StructStat unlinked=Os.fstat(fd);
                        require(unlinked.st_dev==opened.st_dev&&unlinked.st_ino==opened.st_ino
                                &&unlinked.st_nlink==0&&held.isValid(),"held_unlinked_fd_identity");
                        record.put("directoryDeleted",true).put("heldFdStillValid",true).put("heldFdLinks",unlinked.st_nlink);
                    }
                    sandbox.requireSentinel();
                }
                record.put("lockReleaseCompleted",true);
            }
            record.put("streamCloseCompleted",true).put("success",true);
        } finally {
            if(!streamOwns) Os.close(fd);
        }
    }

    private static void requireAbsent(File file) throws Exception {
        try { Os.lstat(file.getPath());throw new AssertionError("deleted_lock_path_exists"); }
        catch(ErrnoException absent) { if(absent.errno!=OsConstants.ENOENT)throw absent; }
    }
    private static void require(boolean value,String reason) {
        if(!value)throw new AssertionError(reason);
    }

    private static final class Sandbox {
        final int uid=Process.myUid();
        final File cache,root,sentinel;
        final long device,inode;
        Sandbox(Context context) throws Exception {
            require(uid>=10000,"app_uid_required");
            cache=context.getCacheDir().getCanonicalFile();
            StructStat base=Os.lstat(cache.getPath());
            require(OsConstants.S_ISDIR(base.st_mode)&&base.st_uid==uid,"cache_owner");
            root=new File(cache,PREFIX+UUID.randomUUID().toString().replace("-",""));
            require(root.mkdir(),"fresh_sandbox_required");Os.chmod(root.getPath(),0700);
            StructStat created=Os.lstat(root.getPath());device=created.st_dev;inode=created.st_ino;
            requireRoot();
            // Outside both deletion targets, still inside this test's removable sandbox.
            sentinel=new File(root,"outside-deletion-tree-sentinel");Files.write(sentinel.toPath(),SENTINEL);
            requireSentinel();
        }
        void requireRoot() throws Exception {
            StructStat current=Os.lstat(root.getPath());
            require(root.getName().matches(PREFIX+"[0-9a-f]{32}")
                    &&root.getParentFile().getCanonicalFile().equals(cache)
                    &&root.getCanonicalFile().equals(root)
                    &&OsConstants.S_ISDIR(current.st_mode)&&current.st_uid==uid
                    &&current.st_dev==device&&current.st_ino==inode,"sandbox_identity_changed");
        }
        File mkdir(String name) throws Exception { return mkdir(new File(root,name)); }
        File mkdir(File child) throws Exception {
            requireRoot();require(child.getCanonicalFile().toPath().startsWith(root.toPath())
                    &&!child.equals(root)&&child.mkdir(),"sandbox_child_required");
            Os.chmod(child.getPath(),0700);return child;
        }
        void requireSentinel() throws Exception {
            requireRoot();StructStat stat=Os.lstat(sentinel.getPath());
            require(OsConstants.S_ISREG(stat.st_mode)&&stat.st_uid==uid
                    &&stat.st_size==SENTINEL.length&&Arrays.equals(Files.readAllBytes(sentinel.toPath()),SENTINEL),"outside_sentinel_changed");
        }
        void cleanup() throws Exception {
            requireRoot();
            File denied=new File(root,"permission-case/files/atomic_workbench");
            if(denied.exists()) {
                StructStat stat=Os.lstat(denied.getPath());
                require(OsConstants.S_ISDIR(stat.st_mode)&&stat.st_uid==uid
                        &&denied.getCanonicalFile().toPath().startsWith(root.toPath()),"cleanup_permission_target");
                Os.chmod(denied.getPath(),0700);
            }
            OwnedFileCleaner.clear(root);require(root.delete(),"sandbox_remove_failed");
        }
    }
}
