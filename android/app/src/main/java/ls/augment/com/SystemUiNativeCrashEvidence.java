package ls.augment.com;

import android.content.Context;
import android.os.DropBoxManager;
import android.os.Process;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Comparator;

/** Root-only fixed-source reader. Never prints native buffer payloads or exception messages. */
public final class SystemUiNativeCrashEvidence {
    private static final int FILE_LIMIT=256*1024;
    private SystemUiNativeCrashEvidence() { }

    // Root cross-user operation: these are validated target-package CE paths, not this module's own storage directory.
    //noinspection SdCardPath
    public static void main(String[] args) {
        try {
            if(Process.myUid()!=0||(args.length!=2&&args.length!=3))throw new SecurityException("root_required");
            int user=Integer.parseInt(args[0]),uid=Integer.parseInt(args[1]);
            long since=args.length==3?Long.parseLong(args[2]):0;if(since<0)throw new SecurityException("history_boundary");
            if(user<0||uid<1000||uid/100000!=user)throw new SecurityException("user_identity");
            System.out.println("BOOT_CRASH_EVIDENCE protocol=1 user="+user+" systemUiUid="+uid+" collectedWall="+System.currentTimeMillis());
            collectSystemUi(System.out::print,new File("/data/user_de/"+user+"/com.android.systemui"),uid,"DE",since);
            collectSystemUi(System.out::print,new File("/data/user/"+user+"/com.android.systemui"),uid,"CE",since);
            if(since==0){
            collectFramework(System.out::print,new File("/data/adb/lspd/log"),"current");
            collectFramework(System.out::print,new File("/data/adb/lspd/log.old"),"previous");
            collectFrameworkLogcat(System.out::print);
            collectDropBox(System.out::print,uid);
            }else System.out.println("shared_history=OMITTED_AFTER_DUO_LOG_CLEAR;since="+since+";new_events=SEE_SCOPED_LOGCAT");
            System.out.println("END_BOOT_CRASH_EVIDENCE");
        }catch(Throwable failure){System.out.println("status=UNAVAILABLE;error="+failure.getClass().getSimpleName());}
    }
    interface Output {void write(String value);}
    static void collectSystemUi(Output out,File data,int uid,String storage) {
        collectSystemUi(out,data,uid,storage,0);
    }
    static void collectSystemUi(Output out,File data,int uid,String storage,long since) {
        out.write("\n--- SYSTEMUI_PERSISTED storage="+storage+";history_only=true;absence_not_no_crash=true ---\n");
        try {
            if(!ownedDirectory(data,uid)){out.write("status=MISSING_OR_INACCESSIBLE;stage=data_directory\n");return;}
            File files=new File(data,"files");
            if(!ownedDirectory(files,uid)){out.write("status=MISSING_OR_INACCESSIBLE;stage=files_directory\n");return;}
            Read nativeLog=read(new File(files,"log_buffers.txt"),uid,FILE_LIMIT,false);
            out.write("source=rom_log_buffers;"+nativeLog.metadata()+"\n");
            if(nativeLog.ok&&since==0)out.write(CrashStackTrace.fromText(nativeLog.text,true));
            File directory=new File(files,SystemUiCrashJournal.DIRECTORY);
            if(!ownedDirectory(directory,uid)){out.write("source=duo_systemui_journal;status=MISSING_OR_INACCESSIBLE\n");return;}
            File[] entries=directory.listFiles(file->file.getName().matches("duo-[0-9]+-[a-f0-9-]{36}\\.txt"));
            if(entries==null){out.write("source=duo_systemui_journal;status=LIST_FAILED\n");return;}
            Arrays.sort(entries,Comparator.comparingLong(File::lastModified).reversed());
            out.write("source=duo_systemui_journal;available="+entries.length+";exportLimit=12;omitted="+Math.max(0,entries.length-12)+"\n");
            for(int i=0;i<Math.min(12,entries.length);i++) {
                Read value=read(entries[i],uid,96*1024,false);
                out.write("journal="+entries[i].getName()+";"+value.metadata()+"\n");
                if(value.ok){
                    java.util.regex.Matcher at=java.util.regex.Pattern.compile("(?m)^fatalWall=([0-9]+) ").matcher(value.text);
                    if(since==0||at.find()&&Long.parseLong(at.group(1))>since)out.write(safeJournal(value.text,uid));
                    else out.write("record=OMITTED_AFTER_LOG_CLEAR\n");
                }
            }
        }catch(Exception | LinkageError failure){out.write("status=UNAVAILABLE;error="+failure.getClass().getSimpleName()+"\n");}
    }
    static String safeJournal(String value,int uid) {
        if(!value.endsWith("END_DUO_SYSTEMUI_JOURNAL\n")||value.length()>96*1024)return "status=INCOMPLETE_JOURNAL\n";
        String[] lines=value.split("\n");
        if(lines.length<3||!lines[0].matches("DUO_SYSTEMUI_JOURNAL schema=1 version=[A-Za-z0-9_.-]{1,100} boot=[A-Za-z0-9_-]{1,64} uid="+uid+" pid=[0-9]+ armedWall=[0-9]+ armedElapsed=[0-9]+"))return "status=INVALID_JOURNAL_IDENTITY\n";
        for(int i=1;i<lines.length-1;i++)if(!lines[i].matches("capture=(ARMED|FATAL) hook=[A-Za-z0-9_.$<>:-]{1,80} phase=[A-Za-z0-9_.$<>:-]{1,100} phase_semantics=last_observed messages=omitted")
                &&!lines[i].matches("fatalWall=[0-9]+ fatalElapsed=[0-9]+")
                &&!lines[i].matches("exception=[A-Za-z0-9_.$<>:-]{1,200} relation=(root|cause|suppressed)")
                &&!lines[i].matches(" at [A-Za-z0-9_.$<>:-]{1,200}#[A-Za-z0-9_.$<>:-]{1,160}\\([A-Za-z0-9_.$<>:-]{1,160}:-?[0-9]+\\)")
                &&!lines[i].matches("(STACK_TRUNCATED|CAUSE_CYCLE|FRAMES_TRUNCATED|SUPPRESSED_TRUNCATED)"))return "status=INVALID_JOURNAL_FORMAT\n";
        return value;
    }
    static void collectFramework(Output out,File directory,String generation) {
        out.write("\n--- LSPOSED_SAFETY generation="+generation+";history_only=true;absence_not_no_safe_mode=true ---\n");
        try {
            if(!ownedDirectory(directory,0)){out.write("status=MISSING_OR_INACCESSIBLE\n");return;}
            File[] entries=directory.listFiles(file->file.getName().matches("[A-Za-z0-9_.:-]+\\.log"));
            if(entries==null){out.write("status=LIST_FAILED\n");return;}
            Arrays.sort(entries,Comparator.comparingLong(File::lastModified).reversed());
            out.write("files="+entries.length+";attemptLimit=6;omitted="+Math.max(0,entries.length-6)+"\n");
            for(int i=0;i<Math.min(6,entries.length);i++) {
                Read value=read(entries[i],0,512*1024,true);
                out.write("file="+entries[i].getName()+";"+value.metadata()+"\n");
                if(value.ok){String selected=FrameworkDiagnosticFilter.safety(value.text);out.write(selected.isEmpty()?"matched=0;meaning=not_proof_of_no_safe_mode\n":selected);}
            }
        }catch(Exception | LinkageError failure){out.write("status=UNAVAILABLE;error="+failure.getClass().getSimpleName()+"\n");}
    }
    private static boolean ownedDirectory(File folder,int uid)throws Exception {
        if(!folder.exists())return false;
        StructStat stat=Os.lstat(folder.getPath());
        return folder.getCanonicalFile().equals(folder.getAbsoluteFile())&&OsConstants.S_ISDIR(stat.st_mode)&&stat.st_uid==uid;
    }
    static final class Read {
        boolean ok,truncated;long size,modified;int bytes;String text="",error="";
        String metadata(){return "status="+(ok?"READ":"UNAVAILABLE")+";fileBytes="+size+";capturedBytes="+bytes+";modifiedWall="+modified+";truncated="+truncated+";error="+error;}
    }
    static Read read(File file,int uid,int limit,boolean tail) {
        Read result=new Read();FileDescriptor fd=null;
        try {
            fd=Os.open(file.getPath(),OsConstants.O_RDONLY|OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW|OsConstants.O_NONBLOCK,0);
            StructStat stat=Os.fstat(fd);
            if(!OsConstants.S_ISREG(stat.st_mode)||stat.st_uid!=uid||stat.st_nlink!=1)throw new SecurityException("file_identity");
            result.size=stat.st_size;result.modified=file.lastModified();result.truncated=stat.st_size>limit;
            if(tail&&result.truncated)Os.lseek(fd,stat.st_size-limit,OsConstants.SEEK_SET);
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] block=new byte[4096];
            int count;while(bytes.size()<limit&&(count=Os.read(fd,block,0,Math.min(block.length,limit-bytes.size())))>0)bytes.write(block,0,count);
            result.bytes=bytes.size();result.text=bytes.toString(StandardCharsets.UTF_8.name());result.ok=true;
            if(tail&&result.truncated){int newline=result.text.indexOf('\n');result.text=newline<0?"":result.text.substring(newline+1);}
        }catch(Exception | LinkageError failure){result.error=failure.getClass().getSimpleName();}
        finally{if(fd!=null)try{Os.close(fd);}catch(Exception ignored){}}
        return result;
    }
    private static void collectFrameworkLogcat(Output out) {
        out.write("\n--- LSPOSED_SAFETY_LOGCAT history_only=true;lastRecords=500;absence_not_no_safe_mode=true ---\n");
        java.lang.Process process=null;
        try {
            process=new ProcessBuilder("/system/bin/logcat","-b","main","-b","system","-b","crash","-d","-v","epoch","-t","500",
                    "LSPosed:I","LSPosed-Service:I","LSPosed-Bridge:I","LSPosedContext:I","LSPosedBridge:I","*:S")
                    .redirectErrorStream(true).start();
            java.lang.Process child=process;ByteArrayOutputStream bytes=new ByteArrayOutputStream();
            java.util.concurrent.atomic.AtomicBoolean limited=new java.util.concurrent.atomic.AtomicBoolean(),failed=new java.util.concurrent.atomic.AtomicBoolean();
            Thread reader=new Thread(()->{try(java.io.InputStream input=child.getInputStream()) {
                byte[] block=new byte[4096];int count;
                while((count=input.read(block))>0){if(bytes.size()+count>512*1024){limited.set(true);break;}bytes.write(block,0,count);}
            }catch(Exception unavailable){failed.set(true);}},"Duo-SafetyLogcat");
            reader.setDaemon(true);reader.start();boolean exited=process.waitFor(2,java.util.concurrent.TimeUnit.SECONDS);
            if(!exited)process.destroy();reader.join(500);
            out.write("exit="+(exited?process.exitValue():-1)+";timeout="+!exited+";readerComplete="+!reader.isAlive()
                    +";truncated="+limited.get()+";readFailed="+failed.get()+"\n");
            if(!reader.isAlive()) {
                String selected=FrameworkDiagnosticFilter.safety(bytes.toString(StandardCharsets.UTF_8.name()));
                out.write(selected.isEmpty()?"matched=0;meaning=not_proof_of_no_safe_mode\n":selected);
            }
        }catch(Exception | LinkageError failure){out.write("status=UNAVAILABLE;error="+failure.getClass().getSimpleName()+"\n");}
        finally{if(process!=null)process.destroy();}
    }
    // Invoked only by the UID-0 app_process entry above, not by the APK process.
    // The caller's real permission is checked below; denial/revocation is reported.

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @android.annotation.SuppressLint({"MissingPermission", "PrivateApi"})
    private static void collectDropBox(Output out,int uid) {
        out.write("\n--- SYSTEMUI_DROPBOX history_only=true;windowHours=48;entryLimitPerTag=64 ---\n");
        try {
            if(android.os.Looper.myLooper()==null)android.os.Looper.prepare();
            Object thread=Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
            Context context=(Context)thread.getClass().getMethod("getSystemContext").invoke(thread);
            if(context.checkSelfPermission(android.Manifest.permission.READ_DROPBOX_DATA)
                    !=android.content.pm.PackageManager.PERMISSION_GRANTED){
                out.write("status=PERMISSION_MISSING;permission=READ_DROPBOX_DATA\n");return;
            }
            DropBoxManager manager=context.getSystemService(DropBoxManager.class);
            if(manager==null){out.write("status=SERVICE_MISSING\n");return;}
            for(String tag:new String[]{"system_app_crash","data_app_crash"}) {
                long since=System.currentTimeMillis()-48L*60*60*1000;int examined=0,matched=0,uidRejected=0;
                for(;examined<64;examined++) {
                    DropBoxManager.Entry entry=manager.getNextEntry(tag,since);if(entry==null)break;
                    try {
                        long stamp=entry.getTimeMillis();if(stamp<=since){out.write("status=NON_ADVANCING_ENTRY\n");break;}since=stamp;
                        String text=entry.getText(128*1024);
                        if(text!=null&&java.util.regex.Pattern.compile("(?m)^Process: com\\.android\\.systemui\\s*$").matcher(text).find()) {
                            if(!java.util.regex.Pattern.compile("(?m)^UID: "+uid+"\\s*$").matcher(text).find()){uidRejected++;continue;}
                            matched++;out.write("tag="+tag+";eventWall="+stamp+";captureChars="+text.length()+";limitPossiblyReached="+(text.length()>=128*1024)+"\n");
                            out.write(CrashStackTrace.fromText(text,false));
                        }
                    }finally{entry.close();}
                }
                out.write("tag="+tag+";examined="+examined+";matched="+matched+";uidMissingOrDifferent="+uidRejected+";entryCapReached="+(examined==64)+";absence_not_no_crash=true\n");
            }
        }catch(Throwable failure){out.write("status=UNAVAILABLE;error="+failure.getClass().getSimpleName()+"\n");}
    }
}
