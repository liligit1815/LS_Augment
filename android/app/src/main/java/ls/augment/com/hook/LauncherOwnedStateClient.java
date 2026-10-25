package ls.augment.com.hook;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.UserManager;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import ls.augment.com.BuildConfig;
import ls.augment.com.LauncherOwnedStateData;
import ls.augment.com.LauncherResetPolicy;

/** In-memory launcher view; every durable byte belongs to the module provider. */
final class LauncherOwnedStateClient {
    private static final Uri PROVIDER=Uri.parse("content://ls.augment.com.config");
    private static final Map<String,Record> RECORDS=new HashMap<>();
    private static final long[] LOAD_RETRY_DELAYS_MS={250L,1000L,3000L,10000L,30000L};
    private static volatile Thread worker;
    private static final ScheduledExecutorService IO=Executors.newSingleThreadScheduledExecutor(task->{
        Thread t=new Thread(task,"LSA-LauncherPrivateState");t.setDaemon(true);worker=t;return t;
    });
    private LauncherOwnedStateClient(){ }
    static void preload(Context supplied){
        if(supplied==null)return;
        Context app=supplied.getApplicationContext();if(app==null)app=supplied;
        if(!LauncherResetPolicy.PACKAGE.equals(app.getPackageName()))return;
        record(app,"grid");record(app,"pages");
    }
    private static synchronized Record record(Context context,String kind){
        Record value=RECORDS.get(kind);
        if(value==null){value=new Record(context,kind);RECORDS.put(kind,value);Record loading=value;IO.execute(loading::load);}
        return value;
    }
    private static synchronized boolean current(Record record){return RECORDS.get(record.kind)==record;}
    /** Narrow constructor safety barrier; ordinary page reads and saves never wait. */
    static SharedPreferences preferences(Context context,String kind){
        Record value=record(context,kind);
        try{if(!value.ready.await(1200L,TimeUnit.MILLISECONDS)||value.failed)
                throw new IllegalStateException("桌面恢复信息尚未就绪，未启动新的布局迁移");}
        catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new IllegalStateException("桌面恢复读取被中断");}
        return value;
    }
    /** Later UI lifecycles only inspect memory; retry and provider work stay on IO. */
    static SharedPreferences readyPreferences(Context context,String kind){
        Record value=record(context,kind);
        return value.failed?null:value;
    }
    /** One-shot readiness delivery; callers post UI work to their owning thread. */
    static boolean addReadyListener(Context context,String kind,Runnable listener){
        if(context==null||listener==null||!("pages".equals(kind)||"grid".equals(kind)))return false;
        Context app=context.getApplicationContext();if(app==null)app=context;
        if(!LauncherResetPolicy.PACKAGE.equals(app.getPackageName()))return false;
        record(app,kind).addReadyListener(listener);
        return true;
    }
    static boolean needsSave(SharedPreferences prefs){return prefs instanceof Record&&((Record)prefs).dirty;}
    static boolean clearPagesForReset(Context context,LauncherResetPolicy.Request request){
        try{return await(()->{
            Record pages=record(context,"pages");if(pages.ready.getCount()!=0)pages.load();
            if(pages.failed)return false;
            synchronized(pages){pages.epoch++;}
            Bundle extras=new Bundle();extras.putString("nonce",request.nonce);
            Bundle result=context.getContentResolver().call(PROVIDER,"launcher_reset_pages_clear",null,extras);
            if(result==null||!result.getBoolean("ok",false))return false;
            synchronized(pages){pages.confirmed="{}";pages.memory=Collections.emptyMap();pages.sequence++;pages.dirty=false;}
            return true;
        });}catch(Exception failure){return false;}
    }
    private static <T>T await(Callable<T> task)throws Exception{
        if(Thread.currentThread()==worker)return task.call();
        Future<T> work=IO.submit(task);return work.get(1200L,TimeUnit.MILLISECONDS);
    }
    private static Bundle request(Context context,String method,Bundle extras)throws Exception{
        if(Thread.currentThread()!=worker)throw new IllegalStateException("launcher_private_io_thread");
        extras.putInt("version",BuildConfig.VERSION_CODE);Bundle result=null;
        for(int i=0;i<2;i++){
            try{result=context.getContentResolver().call(PROVIDER,method,null,extras);}
            catch(SecurityException denied){throw denied;}
            catch(RuntimeException unavailable){if(i==1)throw new TemporarilyUnavailable("provider_call",unavailable);}
            if(result!=null)break;
        }
        if(result==null)throw new TemporarilyUnavailable("provider_unavailable",null);
        if(!result.getBoolean("ok",false)){
            String reason=result.getString("reason","launcher_private_rejected");
            if("state_unavailable".equals(reason)||"storage_failed".equals(reason)||"reset_in_progress".equals(reason))
                throw new TemporarilyUnavailable(reason,null);
            throw new IllegalStateException(reason);
        }
        if(!(result.get("payload") instanceof String))throw new IllegalStateException("launcher_private_payload");
        return result;
    }
    private static final class TemporarilyUnavailable extends Exception {
        final String code;
        TemporarilyUnavailable(String code,Throwable cause){super(code,cause);this.code=code;}
    }
    private static void throwIfFatal(Throwable failure){
        if(failure instanceof VirtualMachineError)throw (VirtualMachineError)failure;
        if(failure instanceof ThreadDeath)throw (ThreadDeath)failure;
    }
    private static String failureCode(Throwable failure){
        if(failure instanceof TemporarilyUnavailable)return ((TemporarilyUnavailable)failure).code;
        String message=failure.getMessage();
        if(message!=null&&Set.of("launcher_legacy_conflict","launcher_legacy_changed","launcher_legacy_clear",
                "launcher_legacy_delete","launcher_legacy_remains","launcher_private_ack","launcher_private_payload",
                "caller_identity","state_contract","read_contract","legacy_conflict","storage_invalid").contains(message))return message;
        return failure.getClass().getSimpleName();
    }
    private static String read(Context context,String kind)throws Exception{
        Bundle extras=new Bundle();extras.putString("kind",kind);
        return request(context,"launcher_owned_read",extras).getString("payload");
    }
    private static String write(Context context,String kind,String expected,String next,long revision,boolean importing)throws Exception{
        Bundle extras=new Bundle();extras.putString("kind",kind);extras.putString("expected",expected);extras.putString("payload",next);
        if(!importing)extras.putLong("revision",revision);
        String accepted=request(context,importing?"launcher_owned_import":"launcher_owned_write",extras).getString("payload");
        if(!LauncherOwnedStateData.decode(kind,accepted).equals(LauncherOwnedStateData.decode(kind,next)))throw new IllegalStateException("launcher_private_ack");
        return accepted;
    }
    private static final class Legacy {
        final Context context;final SharedPreferences prefs;final Map<String,?> values;final String name;
        Legacy(Context context,String name,SharedPreferences prefs){this.context=context;this.name=name;this.prefs=prefs;values=new LinkedHashMap<>(prefs.getAll());}
    }
    private static String migrate(Context context,String kind,String saved,Record record)throws Exception{
        String name="grid".equals(kind)?"ls_augment_launcher_grid_state":"ls_augment_launcher_pages";
        List<Legacy> sources=new ArrayList<>();Map<String,Object> merged=LauncherOwnedStateData.decode(kind,saved);
        record.phase="legacy_contexts";
        Context credential=(Context)Context.class.getDeclaredMethod("createCredentialProtectedStorageContext").invoke(context);
        for(Context storage:new Context[]{credential,context.createDeviceProtectedStorageContext()}){
            record.phase=storage==credential?"legacy_ce_validate":"legacy_de_validate";
            if(!storage.getDataDir().exists())continue;
            LauncherResetHook.validateStorage(storage,android.os.Process.myUid()/100000,android.os.Process.myUid(),name);
            File folder=new File(storage.getDataDir(),"shared_prefs");
            if(!new File(folder,name+".xml").exists()&&!new File(folder,name+".xml.bak").exists())continue;
            SharedPreferences prefs=storage.getSharedPreferences(name,Context.MODE_PRIVATE);
            Legacy legacy=new Legacy(storage,name,prefs);sources.add(legacy);
            Map<String,Object> values=LauncherOwnedStateData.decode(kind,LauncherOwnedStateData.encode(kind,legacy.values));
            if(!values.isEmpty()){
                if(!merged.isEmpty()&&!merged.equals(values))throw new IllegalStateException("launcher_legacy_conflict");
                merged=values;
            }
        }
        record.phase="private_import";
        if(!merged.equals(LauncherOwnedStateData.decode(kind,saved)))
            saved=write(context,kind,saved,LauncherOwnedStateData.encode(kind,merged),0,true);
        // Every nonempty source is now durably acknowledged in the module process.
        for(Legacy legacy:sources){
            record.phase="legacy_delete";
            LauncherResetHook.validateStorage(legacy.context,android.os.Process.myUid()/100000,android.os.Process.myUid(),name);
            if(!legacy.values.equals(legacy.prefs.getAll()))throw new IllegalStateException("launcher_legacy_changed");
            if(!legacy.prefs.edit().clear().commit()||!legacy.prefs.getAll().isEmpty())throw new IllegalStateException("launcher_legacy_clear");
            if(!legacy.context.deleteSharedPreferences(name))throw new IllegalStateException("launcher_legacy_delete");
            File folder=new File(legacy.context.getDataDir(),"shared_prefs");
            if(new File(folder,name+".xml").exists()||new File(folder,name+".xml.bak").exists())throw new IllegalStateException("launcher_legacy_remains");
        }
        return saved;
    }
    private static final class Record implements SharedPreferences {
        final Context context;final String kind;final CountDownLatch ready=new CountDownLatch(1);
        final List<Runnable> readyListeners=new ArrayList<>();
        volatile Map<String,Object> memory=Collections.emptyMap();volatile boolean failed=true,dirty;
        String phase="queued";int attempts;
        String confirmed="{}";long sequence,epoch;
        Record(Context context,String kind){this.context=context;this.kind=kind;}
        void addReadyListener(Runnable listener){
            synchronized(this){if(failed){readyListeners.add(listener);return;}}
            dispatchReady(listener);
        }
        void dispatchReady(Runnable listener){
            IO.execute(()->{
                if(!current(this)||failed)return;
                try{listener.run();}
                catch(Throwable failure){throwIfFatal(failure);
                    android.util.Log.i("LS_Augment","LauncherPrivateState ready_listener_failed:"+failure.getClass().getSimpleName());}
            });
        }
        void load(){
            if(!current(this)||!failed)return;
            attempts++;
            try{
                phase="user_unlock";
                UserManager users=context.getSystemService(UserManager.class);
                if(users==null||!users.isUserUnlocked())throw new TemporarilyUnavailable("user_locked",null);
                phase="private_read";publish("loading","");
                String value=read(context,kind);
                value=migrate(context,kind,value,this);
                phase="ready";
                List<Runnable> listeners;
                synchronized(this){confirmed=value;memory=LauncherOwnedStateData.decode(kind,value);failed=false;
                    listeners=new ArrayList<>(readyListeners);readyListeners.clear();}
                publish("ready","");
                for(Runnable listener:listeners)dispatchReady(listener);
            }catch(Throwable failure){
                failed=true;throwIfFatal(failure);
                // Backoff is bounded, not the lifetime of a locked user's wait.
                // A long lock screen must not permanently disable migration.
                boolean retry=failure instanceof TemporarilyUnavailable;
                publish(retry?"waiting_retry":"blocked",failureCode(failure));
                if(retry)IO.schedule(this::load,LOAD_RETRY_DELAYS_MS[Math.min(attempts-1,LOAD_RETRY_DELAYS_MS.length-1)],TimeUnit.MILLISECONDS);
            }
            finally{ready.countDown();}
        }
        private void publish(String state,String reason){
            String value="kind="+kind+"|state="+state+"|phase="+phase+"|attempt="+attempts
                    +"|version="+BuildConfig.VERSION_CODE+"|reason="+reason;
            try{
                FeatureSettings.diagnostic(context,"ls_augment_launcher_private_state_"+kind,value);
                FeatureSettings.diagnostic(context,"ls_augment_launcher_private_state",value);
            }catch(Throwable unavailable){throwIfFatal(unavailable);}
            android.util.Log.i("LS_Augment","LauncherPrivateState "+value);
        }
        public Map<String,?> getAll(){return new LinkedHashMap<>(memory);}
        public String getString(String key,String fallback){Object v=memory.get(key);return v instanceof String?(String)v:fallback;}
        public int getInt(String key,int fallback){Object v=memory.get(key);return v instanceof Integer?(Integer)v:fallback;}
        public boolean getBoolean(String key,boolean fallback){Object v=memory.get(key);return v instanceof Boolean?(Boolean)v:fallback;}
        public long getLong(String key,long fallback){Object v=memory.get(key);return v instanceof Long?(Long)v:fallback;}
        public float getFloat(String key,float fallback){Object v=memory.get(key);return v instanceof Float?(Float)v:fallback;}
        public Set<String> getStringSet(String key,Set<String> fallback){return fallback;}
        public boolean contains(String key){return memory.containsKey(key);}
        public Editor edit(){return new Edit();}
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener){throw new UnsupportedOperationException();}
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener){ }
        final class Edit implements Editor {
            final Map<String,Object> next=new LinkedHashMap<>(memory);
            public Editor putString(String k,String v){if(v==null)next.remove(k);else next.put(k,v);return this;}
            public Editor putInt(String k,int v){next.put(k,v);return this;}public Editor putBoolean(String k,boolean v){next.put(k,v);return this;}
            public Editor putLong(String k,long v){next.put(k,v);return this;}public Editor putFloat(String k,float v){next.put(k,v);return this;}
            public Editor putStringSet(String k,Set<String> v){next.put(k,v==null?null:new HashSet<>(v));return this;}
            public Editor remove(String key){next.remove(key);return this;}public Editor clear(){next.clear();return this;}
            private boolean save(long serial,long savedEpoch,long revision){
                try{
                    synchronized(Record.this){if(savedEpoch!=epoch)return false;}
                    String value=LauncherOwnedStateData.encode(kind,next);
                    String accepted=write(context,kind,confirmed,value,revision,false);
                    synchronized(Record.this){confirmed=accepted;if(serial==sequence){memory=Collections.unmodifiableMap(new LinkedHashMap<>(next));dirty=false;}}
                    return true;
                }catch(Exception failure){FeatureSettings.diagnostic(context,"ls_augment_launcher_private_state","save_failed:"+failure.getClass().getSimpleName());return false;}
            }
            public boolean commit(){
                final long serial,savedEpoch,revision=FeatureSettings.snapshot(context).revision;
                synchronized(Record.this){serial=++sequence;savedEpoch=epoch;}
                try{return await(()->save(serial,savedEpoch,revision));}catch(Exception timeout){return false;}
            }
            public void apply(){
                final long serial,savedEpoch,revision=FeatureSettings.snapshot(context).revision;
                synchronized(Record.this){serial=++sequence;savedEpoch=epoch;memory=Collections.unmodifiableMap(new LinkedHashMap<>(next));dirty=true;}
                IO.execute(()->{if(!save(serial,savedEpoch,revision))IO.schedule(()->{
                    synchronized(Record.this){if(sequence!=serial||epoch!=savedEpoch)return;}
                    save(serial,savedEpoch,revision);
                },300L,TimeUnit.MILLISECONDS);});
            }
        }
    }
}
