package ls.augment.com;

import android.content.pm.ApplicationInfo;
import android.os.Process;
import android.os.SystemClock;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.io.FileDescriptor;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

/** SystemUI-owned DE journal. The fatal path uses a preopened descriptor, without IPC or Root. */
public final class SystemUiCrashJournal {
    public static final String PACKAGE="com.android.systemui",DIRECTORY="duo-crash-v1";
    private static volatile Sink sink;
    private static volatile String state="NOT_PREPARED",phase="module_entry",hook="unavailable";
    private SystemUiCrashJournal() { }
    public static String status(){return state+";hook="+hook;}
    public static void hook(String value){hook=CrashStackTrace.symbol(value,80);}
    public static void stage(String value){phase=CrashStackTrace.symbol(value,100);}
    public static synchronized void prepare(ApplicationInfo info) {
        if(sink!=null)return;
        FileDescriptor fd=null;
        String preparing="host_identity";
        try {
            int uid=Process.myUid();
            if(info==null||!PACKAGE.equals(info.packageName)||info.uid!=uid||info.deviceProtectedDataDir==null)
                throw new SecurityException("host_identity");
            File data=new File(info.deviceProtectedDataDir);
            preparing="data_path";
            if(!data.getCanonicalFile().equals(data.getAbsoluteFile()))throw new SecurityException("data_path");
            preparing="data_directory";
            ownedDirectory(data,uid,false);
            preparing="files_directory";
            File files=new File(data,"files");ownedDirectory(files,uid,true);
            preparing="journal_directory";
            File directory=new File(files,DIRECTORY);ownedDirectory(directory,uid,true);
            File target=new File(directory,"duo-"+Process.myPid()+"-"+UUID.randomUUID()+".txt");
            preparing="open_descriptor";
            fd=Os.open(target.getPath(),OsConstants.O_RDWR|OsConstants.O_CREAT|OsConstants.O_EXCL
                    |OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW|OsConstants.O_NONBLOCK,0600);
            preparing="file_identity";if(!ownedFile(Os.fstat(fd),uid))throw new SecurityException("file_identity");
            preparing="initial_fsync";
            Sink prepared=new Sink(fd,uid,bootId());prepared.write(null);sink=prepared;fd=null;state="ARMED";
            File[] old=directory.listFiles(file->file.getName().matches("duo-[0-9]+-[a-f0-9-]{36}\\.txt"));
            try{if(old!=null&&old.length>32){Arrays.sort(old,Comparator.comparingLong(File::lastModified));
                for(int i=0;i<old.length-32;i++)if(!old[i].equals(target)&&ownedFile(Os.lstat(old[i].getPath()),uid))old[i].delete();}}
            catch(Exception ignored){/* An old-file retention failure cannot disarm the live descriptor. */}
        } catch(Throwable failure){state="UNAVAILABLE:"+preparing+":"+failure.getClass().getSimpleName();}
        finally {if(fd!=null)try{Os.close(fd);}catch(Throwable ignored){}}
    }
    private static void ownedDirectory(File file,int uid,boolean create)throws Exception {
        if(create&&!file.exists())Os.mkdir(file.getPath(),0700);
        StructStat stat=Os.lstat(file.getPath());
        if(!OsConstants.S_ISDIR(stat.st_mode)||stat.st_uid!=uid)throw new SecurityException("directory_identity");
    }
    private static boolean ownedFile(StructStat stat,int uid){return OsConstants.S_ISREG(stat.st_mode)&&stat.st_uid==uid&&stat.st_nlink==1;}
    static String bootId(){try{return CrashStackTrace.symbol(new String(Files.readAllBytes(new File("/proc/sys/kernel/random/boot_id").toPath()),StandardCharsets.UTF_8).trim(),64);}catch(Throwable ignored){return "unknown";}}
    public static void capture(Throwable failure) {
        try{Sink current=sink;if(current!=null&&failure!=null&&current.captured.compareAndSet(false,true))current.write(failure);}
        catch(Throwable ignored){/* The original exception must always continue through the OEM handlers. */}
    }
    private static final class Sink {
        final FileDescriptor fd;final int uid,pid=Process.myPid();final String boot;
        final long armedWall=System.currentTimeMillis(),armedElapsed=SystemClock.elapsedRealtime();
        final AtomicBoolean captured=new AtomicBoolean();
        final StringBuilder text=new StringBuilder(CrashStackTrace.LIMIT+2048);
        final byte[] bytes=new byte[CrashStackTrace.LIMIT+4096];
        Sink(FileDescriptor fd,int uid,String boot){this.fd=fd;this.uid=uid;this.boot=boot;}
        void write(Throwable failure)throws Exception {
            text.setLength(0);
            text.append("DUO_SYSTEMUI_JOURNAL schema=1 version=").append(BuildConfig.VERSION_NAME)
                .append(" boot=").append(boot).append(" uid=").append(uid).append(" pid=").append(pid)
                .append(" armedWall=").append(armedWall).append(" armedElapsed=").append(armedElapsed).append('\n')
                .append("capture=").append(failure==null?"ARMED":"FATAL").append(" hook=").append(hook)
                .append(" phase=").append(phase).append(" phase_semantics=last_observed messages=omitted\n");
            if(failure!=null){text.append("fatalWall=").append(System.currentTimeMillis()).append(" fatalElapsed=").append(SystemClock.elapsedRealtime()).append('\n');CrashStackTrace.append(text,failure);}
            text.append("END_DUO_SYSTEMUI_JOURNAL\n");
            int length=Math.min(bytes.length,text.length());for(int i=0;i<length;i++)bytes[i]=(byte)text.charAt(i);
            if(Process.myUid()!=uid||!ownedFile(Os.fstat(fd),uid))return;
            Os.ftruncate(fd,0);Os.lseek(fd,0,OsConstants.SEEK_SET);
            int offset=0;while(offset<length){int count=Os.write(fd,bytes,offset,length-offset);if(count<=0)return;offset+=count;}
            Os.fsync(fd);
        }
    }
}
