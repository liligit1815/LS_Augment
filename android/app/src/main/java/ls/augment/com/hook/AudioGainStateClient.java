package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;
import ls.augment.com.AudioGainState;
import ls.augment.com.BuildConfig;

/** At most one worker read per supported stream; views never transact during drawing. */
final class AudioGainStateClient {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService READ=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"LS-audio-state-read");t.setDaemon(true);return t;});
    private static final Map<Integer,Slot> SLOTS=new HashMap<>();
    private static final Set<Watch> WATCHES=Collections.newSetFromMap(new WeakHashMap<>());
    private static final AtomicLong REQUESTS=new AtomicLong();
    private static IBinder endpoint;
    private static final class Slot {boolean pending;long started=-1000;AudioGainState state;int boot=-1;}
    private AudioGainStateClient(){}
    static final class Watch implements View.OnAttachStateChangeListener,android.view.ViewTreeObserver.OnPreDrawListener,Runnable {
        final WeakReference<View> owner;final Runnable changed;final Runnable settings;final java.util.function.LongConsumer starting;int stream=-1;boolean closed,queued,wasVisible,hadState,listening;long minimumRequest;String configuration="";android.view.ViewTreeObserver observer;
        Watch(View view,Runnable changed){this(view,changed,n->{});}
        Watch(View view,Runnable changed,java.util.function.LongConsumer starting){owner=new WeakReference<>(view);this.changed=changed;this.starting=starting;minimumRequest=REQUESTS.get()+1;
            settings=()->{minimumRequest=REQUESTS.get()+1;changed.run();schedule();};
            view.addOnAttachStateChangeListener(this);WATCHES.add(this);observe(view);listen(view);}
        void bind(int stream){if(closed)return;View v=owner.get();String next=v==null||stream<0?"":AudioGainState.configuration(FeatureSettings.snapshot(v.getContext()),stream);
            boolean visible=visible();if(this.stream!=stream||!next.equals(configuration)||visible&&!wasVisible){minimumRequest=REQUESTS.get()+1;this.stream=stream;configuration=next;}
            wasVisible=visible;if(stream<0){MAIN.removeCallbacks(this);queued=false;}else schedule();}
        boolean visible(){View v=owner.get();if(v==null||!v.isAttachedToWindow()||!v.isShown()||v.getWindowVisibility()!=View.VISIBLE)return false;
            for(View p=v;p!=null;){if(p.getAlpha()<=0)return false;android.view.ViewParent parent=p.getParent();p=parent instanceof View?(View)parent:null;}
            Rect r=new Rect();return v.getGlobalVisibleRect(r)&&r.width()>0&&r.height()>0;}
        void schedule(){if(!closed&&!queued&&stream>=0){queued=true;MAIN.postDelayed(this,500);}}
        AudioGainState state(){View v=owner.get();Slot s=SLOTS.get(stream);if(closed||v==null||!visible()||s==null||s.state==null||s.state.request<minimumRequest)return null;
            String config=AudioGainState.configuration(FeatureSettings.snapshot(v.getContext()),stream);
            return s.state.valid(BuildConfig.VERSION_CODE,s.boot,SystemClock.elapsedRealtime(),stream,config)?s.state:null;}
        @Override public void run(){queued=false;if(closed)return;
            View v=owner.get();if(v==null){close();return;}
            if(visible()&&stream>=0){request(v.getContext(),stream);changed.run();}
            // Poll only a bounded time while invisible. onPreDraw/bind or attachment restarts after visibility returns.
            if(visible())schedule();else wasVisible=false;}
        void listen(View view){if(!listening&&view.isAttachedToWindow()){listening=true;FeatureSettings.addSnapshotListener(view.getContext(),settings);}}
        void stopListening(){if(listening){FeatureSettings.removeSnapshotListener(settings);listening=false;}}
        void requestStarting(int stream,long nonce){if(!closed&&this.stream==stream&&visible())starting.accept(nonce);}
        void observe(View view){stopObserving();if(view.isAttachedToWindow()){observer=view.getViewTreeObserver();observer.addOnPreDrawListener(this);}}
        void stopObserving(){if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;}
        @Override public boolean onPreDraw(){
            if(visible()){boolean resumed=!wasVisible;bind(stream);boolean available=state()!=null;
                if(resumed||available!=hadState){hadState=available;changed.run();}}
            else wasVisible=false;return true;
        }
        void delivered(int stream){if(!closed&&this.stream==stream&&visible())changed.run();}
        @Override public void onViewAttachedToWindow(View v){minimumRequest=REQUESTS.get()+1;wasVisible=false;observe(v);listen(v);schedule();}
        @Override public void onViewDetachedFromWindow(View v){minimumRequest=REQUESTS.get()+1;wasVisible=false;stopObserving();stopListening();MAIN.removeCallbacks(this);queued=false;}
        void close(){closed=true;stopObserving();MAIN.removeCallbacks(this);queued=false;stopListening();WATCHES.remove(this);View v=owner.get();if(v!=null)v.removeOnAttachStateChangeListener(this);}
    }
    private static void request(Context context,int stream){
        Slot slot=SLOTS.computeIfAbsent(stream,k->new Slot());long now=SystemClock.elapsedRealtime();
        if(slot.pending||now-slot.started<400)return;
        slot.pending=true;slot.started=now;
        Context app=context.getApplicationContext();if(app==null)app=context;final Context target=app;
        String configuration=AudioGainState.configuration(FeatureSettings.snapshot(context),stream);long nonce=REQUESTS.incrementAndGet();
        for(Watch w:new ArrayList<>(WATCHES))w.requestStarting(stream,nonce);
        READ.execute(()->{
            AudioGainState result=null;int boot=-1;String status="boot_read";
            try{
                boot=Settings.Global.getInt(target.getContentResolver(),Settings.Global.BOOT_COUNT,-1);
                IBinder binder=endpoint;
                if(binder==null||!binder.isBinderAlive()){
                    status="discovery_call";Bundle found=target.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),AudioGainState.GET,null,null);
                    binder=found!=null&&found.getInt("version",-1)==BuildConfig.VERSION_CODE?found.getBinder("controller"):null;endpoint=binder;
                    status=found==null?"discovery_null":"discovery="+found.getString("state","unspecified")+";version="+found.getInt("version",-1);
                }
                if(binder!=null){
                    status="transact";Parcel data=Parcel.obtain(),reply=Parcel.obtain();
                    try{data.writeInterfaceToken(AudioGainState.DESCRIPTOR);data.writeInt(BuildConfig.VERSION_CODE);data.writeInt(stream);data.writeLong(nonce);data.writeString(configuration);
                        if(binder.transact(IBinder.FIRST_CALL_TRANSACTION,data,reply,0)){reply.readException();Bundle packet=reply.readBundle(AudioGainState.class.getClassLoader());result=AudioGainState.parse(packet);status=result==null?"packet_null_or_shape;size="+(packet==null?-1:packet.size()):"packet_received";}else status="transact_false";}
                    finally{data.recycle();reply.recycle();}
                }
                if(result!=null&&(result.request!=nonce||!result.valid(BuildConfig.VERSION_CODE,boot,SystemClock.elapsedRealtime(),stream,configuration)
                        ||boot!=Settings.Global.getInt(target.getContentResolver(),Settings.Global.BOOT_COUNT,-1))){
                    status="packet_rejected;nonce="+(result.request==nonce)+";boot="+(result.boot==boot)+";version="+(result.version==BuildConfig.VERSION_CODE)+";configuration="+result.configuration.equals(configuration)+";age_ok="+(SystemClock.elapsedRealtime()>=result.sampled&&SystemClock.elapsedRealtime()-result.sampled<=AudioGainState.MAX_AGE_MS);result=null;}
                if(result!=null)status="ready;base="+result.base+";current="+result.current+";total="+result.total+";route="+result.route+";muted="+result.muted;
            }catch(RemoteException|RuntimeException error){endpoint=null;status="exception="+error.getClass().getSimpleName()+";stage="+status;}
            AudioGainState value=result;int expectedBoot=boot;String outcome=status;
            MAIN.post(()->{
                slot.pending=false;
                // The query itself has a deadline even if Binder returned after the view disappeared.
                boolean expired=SystemClock.elapsedRealtime()-slot.started>AudioGainState.MAX_AGE_MS;
                diagnostic(target,"stream="+stream+";"+(expired?"query_deadline;":outcome+";")+"uid="+android.os.Process.myUid()+";package="+target.getPackageName()+";op="+target.getOpPackageName());
                if(expired)valueUnused(slot);
                else{slot.state=value;slot.boot=expectedBoot;}
                for(Watch w:new ArrayList<>(WATCHES))w.delivered(stream);
            });
        });
    }
    private static void diagnostic(Context context,String value){try{FeatureSettings.diagnostic(context,"ls_augment_audio_gain_read_client",value);}catch(RuntimeException ignored){}}
    private static void valueUnused(Slot slot){slot.state=null;}
}
