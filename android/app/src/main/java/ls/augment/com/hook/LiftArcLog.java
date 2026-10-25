package ls.augment.com.hook;

import android.content.Context;
import android.os.SystemClock;
import java.util.LinkedHashMap;
import java.util.Map;

/** Content-free runtime events use Duo's bounded, asynchronous persistent log channel. */
final class LiftArcLog {

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile Context context;
    private static final Map<String,Long> recent = new LinkedHashMap<>();
    private static long windowAt,suppressed,pendingSuppressed;
    private static int infoEvents,warnEvents,errorEvents;
    private static final long REPEAT_WINDOW_MS=60_000, RATE_WINDOW_MS=10_000;
    private static final int MAX_MESSAGE_CHARS=1500;

    static void setContext(Context value) { context=value; }
    static Context context() { return context; }
    static void d(String text) { record("INFO",text,null); }
    static void w(String text,Throwable error) { record("WARN",text,error); }
    static boolean e(String text,Throwable error) { return record("ERROR",text,error); }
    static void stageInfo(String message){if(stageMessage(message))d("FEATURE_"+message);}
    static void stageError(String message,Throwable error){if(stageMessage(message))e("FEATURE_"+message,error);}
    private static boolean stageMessage(String message){
        return message!=null&&(message.startsWith("LIFTARC_")||message.equals("SYSTEMUI_INSTALL_liftarc"));
    }
    private static synchronized boolean record(String level,String text,Throwable error) {
        // Callers provide state/geometry identifiers, never hint text or wallpaper pixels.
        String value=(text==null?"":text).replace('\r',' ').replace('\n',' ');
        if(value.length()>MAX_MESSAGE_CHARS)value=value.substring(0,MAX_MESSAGE_CHARS)+" [TRUNCATED]";
        if(error!=null){
            String summary=error.getClass().getName();
            String message=error.getMessage();
            if(message!=null&&!message.isEmpty()){
                message=message.replace('\r',' ').replace('\n',' ');
                summary+=": "+message.substring(0,Math.min(240,message.length()));
            }
            value+=" error="+summary;
        }
        long now=SystemClock.elapsedRealtime();
        String signature=level+":"+value;
        Long previous=recent.get(signature);
        if(previous!=null&&now>=previous&&now-previous<REPEAT_WINDOW_MS){suppress();return false;}
        if(now<windowAt||now-windowAt>=RATE_WINDOW_MS){windowAt=now;infoEvents=warnEvents=errorEvents=0;}
        // Reserve capacity for failures even if normal gesture observations are noisy.
        if("ERROR".equals(level)){if(errorEvents>=4){suppress();return false;}errorEvents++;}
        else if("WARN".equals(level)){if(warnEvents>=4){suppress();return false;}warnEvents++;}
        else{if(infoEvents>=8){suppress();return false;}infoEvents++;}
        if(recent.size()>=64&&!recent.containsKey(signature))recent.remove(recent.keySet().iterator().next());
        recent.put(signature,now);
        if(pendingSuppressed>0){value+=" [suppressedSinceLast="+pendingSuppressed+"]";pendingSuppressed=0;}
        HookTelemetry.liftArc(level,value);
        return true;
    }
    private static void suppress(){suppressed++;pendingSuppressed++;}
    static synchronized long suppressedEvents(){return suppressed;}
    /** Compatibility with upstream flush sites: persistence is handled off the hook thread. */
    static void flush() { }
    private LiftArcLog() { }
}
