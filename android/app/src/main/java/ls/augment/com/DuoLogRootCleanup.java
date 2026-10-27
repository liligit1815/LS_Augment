package ls.augment.com;

import android.os.Process;
import android.system.*;
import java.io.File;
import java.io.FileDescriptor;

/** Phone-side cleanup of Duo's own crash journals; no ROM or framework logs. */
public final class DuoLogRootCleanup {
    public static void main(String[] args) {
        try {
            if(Process.myUid()!=0||args.length!=2)throw new SecurityException("root_required");
            int user=Integer.parseInt(args[0]),uid=Integer.parseInt(args[1]);
            if(user<0||uid<1000||uid/100000!=user)throw new SecurityException("user_identity");
            long bytes=0;
            for(String storage:new String[]{"user","user_de"}){
                File data=new File("/data/"+storage+"/"+user+"/com.android.systemui");
                if(!data.exists())continue;directory(data,uid);
                File files=new File(data,"files");if(!files.exists())continue;directory(files,uid);
                File journals=new File(files,SystemUiCrashJournal.DIRECTORY);if(!journals.exists())continue;directory(journals,uid);
                bytes+=clearJournals(journals,uid);
            }
            System.out.println("DUO_LOG_CLEAR_OK bytes="+bytes);
        }catch(Throwable error){System.out.println("DUO_LOG_CLEAR_FAILED "+error.getClass().getSimpleName());}
    }
    static long clearJournals(File journals,int uid)throws Exception {
                directory(journals,uid);long bytes=0;
                File[] entries=journals.listFiles(file->file.getName().matches("duo-[0-9]+-[a-f0-9-]{36}\\.txt"));
                if(entries==null)throw new java.io.IOException("journal_list");
                for(File file:entries){
                    FileDescriptor fd=Os.open(file.getPath(),OsConstants.O_WRONLY|OsConstants.O_NOFOLLOW|OsConstants.O_CLOEXEC|OsConstants.O_NONBLOCK,0);
                    try{StructStat stat=Os.fstat(fd);
                        if(!OsConstants.S_ISREG(stat.st_mode)||stat.st_uid!=uid||stat.st_nlink!=1)throw new SecurityException("journal_owner");
                        bytes+=stat.st_size;Os.ftruncate(fd,0);Os.fsync(fd);
                    }finally{Os.close(fd);}
                }
                return bytes;
    }
    private static void directory(File file,int uid)throws Exception {
        StructStat stat=Os.lstat(file.getPath());
        if(!OsConstants.S_ISDIR(stat.st_mode)||stat.st_uid!=uid||!file.getCanonicalFile().equals(file.getAbsoluteFile()))
            throw new SecurityException("journal_directory");
    }
}
