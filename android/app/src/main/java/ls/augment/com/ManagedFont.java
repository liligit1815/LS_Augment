package ls.augment.com;
import android.content.Context;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;

/** Content-addressed fonts shared through the existing restricted provider. */
public final class ManagedFont {
    public static final int MAX_BYTES=4*1024*1024;
    private static final Map<String,Typeface> CACHE=Collections.synchronizedMap(new LinkedHashMap<>());
    private static final Map<String,Set<Runnable>> PENDING=new HashMap<>();
    private static final Map<String,Long> RETRY_AFTER=new LinkedHashMap<>();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor READER=new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(12),r->{Thread t=new Thread(r,"LSA-font-reader");t.setDaemon(true);return t;});
    private ManagedFont() { }
    public static boolean reference(String value){return value!=null&&value.matches("font:[0-9a-f]{64}");}
    public static File file(Context c,String hash) {
        if(hash==null||!hash.matches("[0-9a-f]{64}"))throw new IllegalArgumentException("Invalid font reference");
        return new File(new File(c.getFilesDir(),"fonts"),hash+".font");
    }
    public static Typeface load(Context c,String value) {
        if(value==null||value.isEmpty())return null;
        Typeface found=CACHE.get(value);if(found!=null)return found;
        try {
            Typeface result;
            if(reference(value)) {
                Uri uri=Uri.parse("content://ls.augment.com.config/font/"+value.substring(5));
                try(ParcelFileDescriptor descriptor=c.getContentResolver().openFileDescriptor(uri,"r")) {
                    if(descriptor==null)return null;result=new Typeface.Builder(descriptor.getFileDescriptor()).build();
                }
            } else if(value.startsWith("/"))result=Typeface.createFromFile(value);
            else return null;
            if(result!=null){synchronized(CACHE){if(CACHE.size()>=12)CACHE.clear();CACHE.put(value,result);}}
            return result;
        } catch(Exception ignored){return null;}
    }
    /** Font-provider startup or a stalled provider must never block a UI frame. */
    public static Typeface loadAsync(Context context,String value,Runnable ready) {
        if(value==null||value.isEmpty()||(!reference(value)&&!value.startsWith("/")))return null;
        Typeface cached=CACHE.get(value);if(cached!=null)return cached;
        synchronized(PENDING){
            Set<Runnable> listeners=PENDING.get(value);
            if(listeners!=null){if(ready!=null&&listeners.size()<32)listeners.add(ready);return null;}
            Long retry=RETRY_AFTER.get(value);if(retry!=null&&SystemClock.uptimeMillis()<retry)return null;
            listeners=new LinkedHashSet<>();if(ready!=null)listeners.add(ready);PENDING.put(value,listeners);
        }
        Context application=context.getApplicationContext();Context readerContext=application==null?context:application;
        try{READER.execute(()->{
            Typeface result=load(readerContext,value);Set<Runnable> listeners;
            synchronized(PENDING){
                listeners=PENDING.remove(value);
                if(result==null){if(RETRY_AFTER.size()>=12)RETRY_AFTER.clear();RETRY_AFTER.put(value,SystemClock.uptimeMillis()+2000);}
                else RETRY_AFTER.remove(value);
            }
            // A failed first boot read is transient. Let visible consumers retry
            // after a short pause; detached or disabled consumers do no work.
            if(listeners!=null)for(Runnable listener:listeners)MAIN.postDelayed(listener,result==null?2000:0);
        });}catch(RejectedExecutionException rejected){synchronized(PENDING){PENDING.remove(value);}}
        return null;
    }
    public static String importFile(Context c,InputStream input)throws Exception {
        ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int n;
        while((n=input.read(buffer))!=-1){out.write(buffer,0,n);if(out.size()>MAX_BYTES)throw new IOException("字体超过 4 MiB");}
        byte[] bytes=out.toByteArray();validate(bytes);String hash=digest(bytes);store(c,hash,bytes);return "font:"+hash;
    }
    private static String digest(byte[] bytes)throws Exception {
        StringBuilder value=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))value.append(String.format(Locale.ROOT,"%02x",b&255));return value.toString();
    }
    public static void validate(byte[] data)throws IOException {
        if(data==null||data.length<12||data.length>MAX_BYTES)throw new IOException("字体文件无效");
        int magic=((data[0]&255)<<24)|((data[1]&255)<<16)|((data[2]&255)<<8)|(data[3]&255);
        if(magic!=0x00010000&&magic!=0x4f54544f&&magic!=0x74746366&&magic!=0x74727565)throw new IOException("请选择 TTF、OTF 或 TTC 字体");
        try {
            if(android.os.Build.VERSION.SDK_INT<29)return;
            java.nio.ByteBuffer buffer=java.nio.ByteBuffer.allocateDirect(data.length);buffer.put(data).flip();
            new android.graphics.fonts.Font.Builder(buffer).build();
        } catch(RuntimeException error) { throw new IOException("字体内容无法读取",error); }
    }
    public static void validate(String hash,byte[] data)throws Exception {
        validate(data);if(!hash.equals(digest(data)))throw new IOException("字体校验失败");
    }
    public static void store(Context c,String hash,byte[] bytes)throws Exception {
        validate(bytes);if(!hash.equals(digest(bytes)))throw new IOException("字体校验失败");
        File target=file(c,hash);if(!target.getParentFile().isDirectory()&&!target.getParentFile().mkdirs())throw new IOException("无法保存字体");
        android.util.AtomicFile atomic=new android.util.AtomicFile(target);FileOutputStream stream=atomic.startWrite();
        try{stream.write(bytes);atomic.finishWrite(stream);}catch(Exception e){atomic.failWrite(stream);throw e;}
    }
}
