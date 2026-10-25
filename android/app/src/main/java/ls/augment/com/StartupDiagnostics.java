package ls.augment.com;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import io.github.libxposed.api.XposedInterface;
import org.json.JSONObject;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.RejectedExecutionException;

/** Small, independent startup channel. Hook threads never access providers or private files. */
public final class StartupDiagnostics {
    public static final String CALL = "startup_diagnostic";
    public static final String FILE = "startup-diagnostics.log";
    private static final String TAG = "DuoStartup";
    private static final int MAX_EVENTS = 96, MAX_QUEUED_CHARS = 512 * 1024;
    private static final Object LOCK = new Object();
    private static final ArrayDeque<Event> QUEUE = new ArrayDeque<>();
    private static final String SESSION = UUID.randomUUID().toString();
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "Duo-StartupDiagnostics"); thread.setDaemon(true); return thread;
    });
    private static final ExecutorService FRAMEWORK_WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread=new Thread(task,"Duo-StartupFrameworkLog");thread.setDaemon(true);return thread;
    });
    // At most one bounded copy can be in flight; slow framework logging cannot
    // block provider delivery or build an unbounded executor backlog.
    private static final AtomicBoolean FORWARDING = new AtomicBoolean();
    private static XposedInterface framework;
    private static String process = "unknown", engine = "unknown";
    private static long sequence, dropped, attempts, failures;
    private static volatile long retryAt;
    private static int queuedChars;
    private static String outage = "";
    private static boolean waitingContext;
    private static final AtomicBoolean LOGCAT_FAILED = new AtomicBoolean(), FRAMEWORK_FAILED = new AtomicBoolean();
    private static ScheduledFuture<?> scheduled;
    private static long scheduledAt;
    private static void scheduleDrain(long delay) {
        synchronized(LOCK) {
            delay=Math.max(delay,retryAt-SystemClock.elapsedRealtime());
            long at=SystemClock.elapsedRealtime()+Math.max(0,delay);
            if(scheduled!=null&&!scheduled.isDone()&&scheduledAt<=at)return;
            if(scheduled!=null)scheduled.cancel(false);
            scheduledAt=at;
            try{scheduled=WORKER.schedule(StartupDiagnostics::drainAndReschedule,Math.max(0,delay),TimeUnit.MILLISECONDS);}
            catch(RejectedExecutionException stopped){scheduled=null;}
        }
    }
    private static void drainAndReschedule(){
        synchronized(LOCK){scheduled=null;}
        drain();
        synchronized(LOCK){if(!QUEUE.isEmpty())scheduleDrain(Math.max(1000,retryAt-SystemClock.elapsedRealtime()));}
    }
    private StartupDiagnostics() { }

    public static void initialize(XposedInterface source, String processName) {
        try {
            framework = source;
            process = processName == null ? "unknown" : processName;
            record("MODULE_ENTRY", "sdk=" + android.os.Build.VERSION.SDK_INT, null);
            engine = source.getFrameworkName() + "/" + source.getFrameworkVersion() + "/" + source.getFrameworkVersionCode()
                    + ";api=" + source.getApiVersion();
            record("MODULE_IDENTITY", "", null);
        } catch (Throwable error) { record("MODULE_IDENTITY_FAILED", "", error); }
    }

    public static void record(String stage, String detail, Throwable error) {
        try {
            Event event;
            synchronized (LOCK) {
                JSONObject value = new JSONObject().put("protocol", 1).put("session", SESSION).put("sequence", ++sequence)
                        .put("stage", stage).put("detail", detail == null ? "" : detail)
                        .put("pid", Process.myPid()).put("uid", Process.myUid()).put("process", process)
                        .put("processStartedElapsed", Process.getStartElapsedRealtime())
                        .put("version", BuildConfig.VERSION_NAME).put("framework", engine)
                        .put("wall", System.currentTimeMillis()).put("elapsed", SystemClock.elapsedRealtime())
                        .put("thread", Thread.currentThread().getName()).put("queueDropped", dropped)
                        .put("exception", DiagnosticException.render(error));
                String encoded = boundedEvent(value);
                while (!QUEUE.isEmpty() && (QUEUE.size() >= MAX_EVENTS || queuedChars + encoded.length() > MAX_QUEUED_CHARS - 256)) {
                    Event removed = QUEUE.removeFirst(); queuedChars -= removed.text.length(); dropped++;
                }
                value.put("queueDropped",dropped);
                event = new Event(value.toString(), stage, sequence, error != null);
                QUEUE.addLast(event); queuedChars += event.text.length();
            }
            // Every chunk identifies its event and position; logcat never silently cuts a large trace.
            emit(event, false);
            scheduleDrain(1000);
        } catch (Throwable failure) {
            try { Log.e(TAG, "STARTUP_RECORD_FAILED pid=" + Process.myPid(), failure); } catch (Throwable ignored) { }
        }
    }

    private static String boundedEvent(JSONObject value) throws org.json.JSONException {
        String encoded=value.toString();
        // Escaping a long exception can double its wire size. Never let one event
        // become an oversized head that prevents every later event being delivered.
        while(encoded.length()>180*1024){
            String field=value.optString("exception").length()>value.optString("detail").length()?"exception":"detail";
            String text=value.optString(field);
            if(text.length()<128)throw new IllegalArgumentException("startup metadata exceeds event budget");
            value.put("eventTruncated",true).put(field,text.substring(0,text.length()/2)+"\n[TRUNCATED event budgetChars=184320]");
            encoded=value.toString();
        }
        return encoded;
    }

    private static void emit(Event event, boolean toFramework) {
        ArrayList<String> pieces=new ArrayList<>();
        for(int start=0;start<event.text.length();){
            int end=Math.min(event.text.length(),start+1000);
            if(end<event.text.length()&&Character.isHighSurrogate(event.text.charAt(end-1)))end--;
            pieces.add(event.text.substring(start,end));start=end;
        }
        int count = pieces.size();
        for (int i = 0; i < count; i++) {
            String text = "DUO_STARTUP session=" + SESSION + " sequence=" + event.sequence + " stage=" + event.stage + " part=" + (i + 1) + "/" + count
                    + " " + pieces.get(i);
            try {
                if (toFramework) { if (framework != null) framework.log(event.error ? Log.ERROR : Log.INFO, TAG, text); }
                else Log.println(event.error ? Log.ERROR : Log.INFO, TAG, text);
            } catch (Throwable failure) {
                AtomicBoolean reported=toFramework?FRAMEWORK_FAILED:LOGCAT_FAILED;
                // Set before recording: a failed sink must never recursively log its own failure.
                if(reported.compareAndSet(false,true))record(toFramework?"FRAMEWORK_LOG_FAILED":"LOGCAT_LOG_FAILED",
                        "independent queue retained; first sink failure",failure);
            }
        }
    }

    private static void drain() {
        try {
            Event head;
            synchronized (LOCK) { head = QUEUE.peekFirst(); }
            if (head == null) return;
            // Framework forwarding also works before an Application/Provider exists.
            if(FORWARDING.compareAndSet(false,true)){
                ArrayList<Event> forwarding = new ArrayList<>();
                synchronized (LOCK) { for (Event event : QUEUE) if (!event.forwarded) { event.forwarded = true; forwarding.add(event); } }
                if(forwarding.isEmpty())FORWARDING.set(false);
                else FRAMEWORK_WORKER.execute(()->{
                    try{for(Event event:forwarding)emit(event,true);}finally{FORWARDING.set(false);}
                });
            }
            if (SystemClock.elapsedRealtime() < retryAt) return;
            Context context = context();
            if (context == null) {
                retryAt=SystemClock.elapsedRealtime()+15000;
                if (!waitingContext) { waitingContext = true; record("WAITING_CONTEXT", "provider not attempted", null); }
                return;
            }
            waitingContext = false;
            for (int i = 0; i < 8; i++) {
                synchronized (LOCK) { head = QUEUE.peekFirst(); }
                if (head == null) return;
                attempts++;
                Bundle extras = new Bundle(); extras.putString("event", head.text);
                Bundle reply;
                try { reply = context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"), CALL, null, extras); }
                catch (Throwable error) { deliveryFailed("CALL_EXCEPTION", error); return; }
                if (reply == null || !reply.getBoolean("ok", false)) {
                    String reason = reply == null ? "REPLY_MISSING" : reply.getString("reason", "REPLY_NOT_ACCEPTED");
                    deliveryFailed(reason, null, reply == null ? "" : reply.getString("exception", ""));
                    return;
                }
                synchronized (LOCK) {
                    if (QUEUE.peekFirst() == head) { QUEUE.removeFirst(); queuedChars -= head.text.length(); }
                }
                if (!outage.isEmpty()) {
                    record("DELIVERY_RECOVERED", "previous=" + outage + ";attempts=" + attempts + ";failures=" + failures + ";dropped=" + dropped, null);
                    outage = "";
                }
                retryAt = 0;
            }
        } catch (Throwable error) { deliveryFailed("WORKER_EXCEPTION", error); }
    }

    private static void deliveryFailed(String reason, Throwable error) {
        deliveryFailed(reason, error, "");
    }
    private static void deliveryFailed(String reason, Throwable error, String providerException) {
        failures++;
        String key = reason + (error == null ? "" : ":" + error.getClass().getName());
        retryAt = SystemClock.elapsedRealtime() + Math.min(30_000L, 1000L << Math.min(5L, failures - 1));
        if (!key.equals(outage)) {
            outage = key;
            record("DELIVERY_FAILED", "reason=" + reason + ";attempts=" + attempts + ";failures=" + failures + ";dropped=" + dropped
                    + (providerException.isEmpty() ? "" : ";providerException=" + providerException), error);
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static Context context() throws Exception {
        Class<?> type = Class.forName("android.app.ActivityThread");
        Object app = type.getMethod("currentApplication").invoke(null);
        if (app instanceof Context) return (Context) app;
        if (Process.myUid() != Process.SYSTEM_UID) return null;
        Object thread = type.getMethod("currentActivityThread").invoke(null);
        if (thread == null) return null;
        java.lang.reflect.Method method = type.getMethod("getSystemContext");
        return (Context) method.invoke(thread);
    }
    private static final class Event {
        final String text, stage;
        final long sequence;
        final boolean error;
        boolean forwarded;
        Event(String text, String stage, long sequence, boolean error) { this.text = text; this.stage = stage; this.sequence = sequence; this.error = error; }
    }
}
