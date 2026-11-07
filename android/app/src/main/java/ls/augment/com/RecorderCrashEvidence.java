package ls.augment.com;

import android.content.Context;
import android.os.DropBoxManager;
import java.util.regex.Pattern;

/** Phone-side, UID-0 reader for this recorder only. Never exports crash messages or payloads. */
public final class RecorderCrashEvidence {
    public static final String PACKAGE="com.android.ztescreenshot";
    private RecorderCrashEvidence(){}
    public static void main(String[] args){
        int result=run(args);System.out.flush();System.exit(result);
    }
    static int run(String[] args){
        try{
            if(android.os.Process.myUid()!=0||args.length!=2)throw new SecurityException("root_required");
            int uid=Integer.parseInt(args[0]);long cutoff=Long.parseLong(args[1]);
            if(uid<1000||cutoff<0)throw new SecurityException("identity_or_history");
            System.out.println("RECORDER_CRASH_EVIDENCE protocol=1 uid="+uid+" collectedWall="+System.currentTimeMillis());
            if(android.os.Looper.myLooper()==null)android.os.Looper.prepare();
            Object thread=Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
            Context context=(Context)thread.getClass().getMethod("getSystemContext").invoke(thread);
            if(context.checkSelfPermission(android.Manifest.permission.READ_DROPBOX_DATA)!=android.content.pm.PackageManager.PERMISSION_GRANTED)
                throw new SecurityException("READ_DROPBOX_DATA");
            DropBoxManager manager=context.getSystemService(DropBoxManager.class);
            if(manager==null)throw new IllegalStateException("dropbox_service");
            int budget=96*1024;
            for(String tag:new String[]{"system_app_crash","data_app_crash","system_app_native_crash","data_app_native_crash","system_app_anr"}){
                long since=Math.max(cutoff,System.currentTimeMillis()-48L*60*60*1000);int examined=0,matched=0,rejected=0;
                for(;examined<64&&budget>2048;examined++){
                    DropBoxManager.Entry entry=manager.getNextEntry(tag,since);if(entry==null)break;
                    try{
                        long stamp=entry.getTimeMillis();if(stamp<=since)break;since=stamp;
                        String text=entry.getText(128*1024);
                        if(!matches(text,uid)){rejected++;continue;}
                        matched++;String safe=CrashStackTrace.fromText(text,false)+nativeSummary(text);
                        if(safe.length()>budget-1024)safe=safe.substring(0,budget-1024)+"\nSTACK_TRUNCATED\n";
                        budget-=safe.length()+256;
                        System.out.println("tag="+tag+" eventWall="+stamp+" inputLimitPossiblyReached="+(text.length()>=128*1024));
                        System.out.print(safe);
                    }finally{entry.close();}
                }
                System.out.println("tag="+tag+" examined="+examined+" matched="+matched+" identityRejected="+rejected+" entryCapReached="+(examined==64)+" outputCapReached="+(budget<=2048));
            }
            System.out.println("END_RECORDER_CRASH_EVIDENCE absence_not_no_crash=true");return 0;
        }catch(Throwable failure){System.out.println("status=UNAVAILABLE error="+failure.getClass().getSimpleName());return 1;}
    }
    static boolean matches(String text,int uid){
        return text!=null&&Pattern.compile("(?m)^Process: "+Pattern.quote(PACKAGE)+"\\s*$").matcher(text).find()
                &&Pattern.compile("(?m)^UID: "+uid+"\\s*$").matcher(text).find();
    }
    static String nativeSummary(String text){
        StringBuilder out=new StringBuilder();int frames=0;
        for(String raw:text.split("\\r?\\n")){
            String line=raw.trim();
            java.util.regex.Matcher signal=Pattern.compile("^signal ([0-9]+) \\((SIG[A-Z0-9]+)\\).*").matcher(line);
            if(signal.matches())out.append("native_signal=").append(signal.group(1)).append(':').append(signal.group(2)).append('\n');
            java.util.regex.Matcher frame=Pattern.compile("^(#[0-9]+) pc [a-fA-F0-9]+ ((?:/system/|/vendor/|/apex/)[A-Za-z0-9_./@+:-]+).*").matcher(line);
            if(frame.matches()&&frames++<128)out.append("native_frame=").append(frame.group(1)).append(" image=").append(frame.group(2)).append('\n');
        }
        return out.toString();
    }
}
