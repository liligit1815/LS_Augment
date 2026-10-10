package ls.augment.com;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

final class AuditLog {
    private static final int MAX_BYTES = 192 * 1024;
    private static final int KEEP_BYTES = 96 * 1024;
    private static LogRepeatPolicy repeats = new LogRepeatPolicy();
    private static long writeFailures,lastWriteErrorAt;
    private static String lastWriteError="";
    private static boolean failureMetadataPersisted=true;

    private AuditLog() { }

    static synchronized void write(Context context, String category, String message) {
        append(context,category,message,false);
    }

    /** Restart commands can destroy this process; record their issue before executing them. */
    static synchronized boolean writeDurable(Context context,String category,String message){
        return append(context,category,message,true);
    }

    private static boolean append(Context context,String category,String message,boolean durable){
        if (context == null || ResetWriteFence.blocked()) return false;
        try {
            File file = new File(context.getFilesDir(), "ls_augment.log");
            String clean = message == null ? "" : message.replace('\r', ' ').replace('\n', ' ');
            if (clean.length() > 2400) clean = clean.substring(0, 2400) + " [TRUNCATED]";
            clean = repeats.record(category, clean, android.os.SystemClock.elapsedRealtime());
            if (clean == null) return true;
            String line = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US).format(new Date())
                    + " [" + category + "] " + clean;
            boolean rotated=BoundedLog.append(file,line,MAX_BYTES,KEEP_BYTES);
            if(durable)try(FileOutputStream synced=new FileOutputStream(file,true)){synced.getFD().sync();}
            if(rotated){
                android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);
                stats.edit().putLong("basic_rotations",stats.getLong("basic_rotations",0)+1).apply();
            }
            return true;
        } catch (Throwable error) {recordWriteFailure(context,error);return false;}
    }

    private static void recordWriteFailure(Context context,Throwable error){
        repeats=new LogRepeatPolicy();
        writeFailures++;lastWriteErrorAt=System.currentTimeMillis();
        lastWriteError=error.getClass().getSimpleName();
        failureMetadataPersisted=false;
        // This path must not call AuditLog again. Keep an in-process fallback
        // even when both the log file and its metadata store are unavailable.
        try{
            android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);
            writeFailures=Math.max(writeFailures,stats.getLong("basic_write_failures",0)+1);
            failureMetadataPersisted=stats.edit().putLong("basic_write_failures",writeFailures)
                    .putLong("basic_last_write_error_at",lastWriteErrorAt).putString("basic_last_write_error",lastWriteError)
                    .putString("basic_last_write_error_version",BuildConfig.VERSION_NAME).commit();
        }catch(Throwable ignored){}
        try{android.util.Log.e("LS_Augment","BASIC_WRITE_FAILED count="+writeFailures+" error="+lastWriteError);}
        catch(Throwable ignored){}
    }

    static synchronized String failureStatus(Context context){
        long count=writeFailures,at=lastWriteErrorAt;String error=lastWriteError,version=count==0?"":BuildConfig.VERSION_NAME;
        String metadata="READ";
        try{
            android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);
            long stored=stats.getLong("basic_write_failures",0);
            if(stored>count||at==0){count=Math.max(count,stored);at=stats.getLong("basic_last_write_error_at",0);
                error=stats.getString("basic_last_write_error","");version=stats.getString("basic_last_write_error_version","");}
        }catch(Throwable unavailable){metadata="UNAVAILABLE";}
        return "writeFailures="+count+";lastWriteErrorAt="+at+";lastWriteError="+error
                +";lastWriteErrorVersion="+version+";failureMetadata="+metadata+";latestFailureMetadataPersisted="+failureMetadataPersisted;
    }

    static synchronized String read(Context context) {
        try {
            File file = new File(context.getFilesDir(), "ls_augment.log");
            if (!file.isFile()) return "";
            return new String(BoundedLog.tail(file,MAX_BYTES),StandardCharsets.UTF_8);
        } catch (Throwable error) { return "log_read_failed:" + error.getClass().getSimpleName(); }
    }

}
