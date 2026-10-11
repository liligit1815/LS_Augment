package ls.augment.com;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/** Fixed tag queries only; empty output is not evidence that the buffers are empty. */
final class DiagnosticLogcat {
    static final int TAIL_RECORDS=300,BUFFER_BYTES=8192;
    private static final String BUFFERS="logcat -b main -b system -b crash";
    interface Reader {RootShell.Result read(String command,long timeoutSeconds,int bytes);}
    static final class Collection {
        final long sinceWall;
        final int bytesLimit;
        final RootShell.Result primary,fallback,buffers;
        final String fallbackReason;
        Collection(long since,int limit,RootShell.Result primary,RootShell.Result fallback,
                RootShell.Result buffers,String reason){
            sinceWall=since;bytesLimit=limit;this.primary=primary;this.fallback=fallback;this.buffers=buffers;fallbackReason=reason;
        }
    }
    private DiagnosticLogcat(){}
    static Collection cleanup(long now,Reader reader){
        return collect(now-10*60*1000,768*1024,
                "LS_Augment:I AndroidRuntime:E libc:F DEBUG:F ActivityManager:I WindowManager:W OpenGLRenderer:W SurfaceFlinger:W BufferQueueProducer:E '*:S'",reader);
    }
    static Collection module(long now,boolean ai,boolean shoulder,Reader reader){
        return collect(now-30*60*1000,1024*1024,"LS_Augment:I "
                +(ai?"LS_Augment_AI:I ":"")+(shoulder?"LS_Augment_TGK:I LS_AugmentNative:I ":"")+"'*:S'",reader);
    }
    private static Collection collect(long since,int limit,String tags,Reader reader){
        String timestamp=new SimpleDateFormat("MM-dd HH:mm:ss.SSS",Locale.US).format(new Date(since));
        RootShell.Result primary=reader.read(BUFFERS+" -d -v epoch -T "+RootShell.quote(timestamp)+" "+tags,12,limit);
        String reason=!readable(primary)?"PRIMARY_READ_FAILED_OR_INCOMPLETE"
                :primary.capture!=null&&primary.capture.truncated?"PRIMARY_CAPTURE_LIMIT_REACHED"
                :hasRecords(primary)?"":"PRIMARY_NO_MATCHING_RECORDS";
        if(reason.isEmpty())return new Collection(since,limit,primary,null,null,reason);
        // The same selected tags retain privacy filtering. This single bounded
        // tail may precede the requested window, so it must remain a separate source.
        RootShell.Result buffers=reader.read(BUFFERS+" -g",4,BUFFER_BYTES);
        RootShell.Result fallback=reader.read(BUFFERS+" -d -v epoch -t "+TAIL_RECORDS+" "+tags,6,limit);
        return new Collection(since,limit,primary,fallback,buffers,reason);
    }
    static boolean readable(RootShell.Result result){
        return result.isSuccess()&&(result.capture==null||result.capture.complete&&!result.capture.failed);
    }
    static boolean hasRecords(RootShell.Result result){
        // Logcat's "beginning of ..." banners do not count as diagnostic records.
        for(String line:result.output.split("\\r?\\n"))if(line.matches("\\s*[0-9]+\\.[0-9]+\\s+.*"))return true;
        return false;
    }
    static String recordWindow(RootShell.Result result){
        long oldest=Long.MAX_VALUE,newest=-1;
        for(String line:result.output.split("\\r?\\n")){
            String value=line.trim();int space=value.indexOf(' ');if(space<0)continue;
            String stamp=value.substring(0,space);if(!stamp.matches("[0-9]+\\.[0-9]+"))continue;
            try{int dot=stamp.indexOf('.');String fraction=(stamp.substring(dot+1)+"000").substring(0,3);
                long wall=Math.addExact(Math.multiplyExact(Long.parseLong(stamp.substring(0,dot)),1000),Integer.parseInt(fraction));
                oldest=Math.min(oldest,wall);newest=Math.max(newest,wall);
            }catch(NumberFormatException|ArithmeticException ignored){}
        }
        return "oldestRetainedRecordWall="+(newest<0?"UNKNOWN":String.valueOf(oldest))
                +";newestRetainedRecordWall="+(newest<0?"UNKNOWN":String.valueOf(newest));
    }
}
