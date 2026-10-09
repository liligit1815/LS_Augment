package ls.augment.com.hook;

import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.provider.Settings;
import ls.augment.com.AudioGainState;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSnapshot;
import android.database.ContentObserver;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.audiofx.LoudnessEnhancer;
import android.net.Uri;
import android.os.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import ls.augment.com.AudioGainPolicy;
import ls.augment.com.ConfigSchema;

/** Per-session DSP gain above native maximum. All native permission and mute paths still run. */
final class AudioGainHook {
    private static boolean installed;
    private static final ThreadLocal<Boolean> INTERNAL = ThreadLocal.withInitial(() -> false);
    private static final ThreadLocal<Adjustment> PENDING = new ThreadLocal<>();
    private static Controller controller;
    private static final java.util.concurrent.ExecutorService READ_REGISTRATION=java.util.concurrent.Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"LS-audio-state-register");t.setDaemon(true);return t;});
    private static final class Adjustment { int stream, requested; boolean authorized, dndAllowed; String route; }

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Class<?> service = Class.forName("com.android.server.audio.AudioService", false, loader);
            int count = 0;
            for (Method m : service.getDeclaredMethods()) {
                String name = m.getName(); int argc = m.getParameterCount();
                boolean adjust = name.equals("adjustStreamVolume") && argc == 10;
                boolean set = name.equals("setStreamVolume") && argc == 10;
                boolean getter = (name.equals("getStreamVolume") || name.equals("getStreamMaxVolume")
                        || name.equals("getLastAudibleStreamVolume")) && argc == 1;
                boolean permission = name.equals("checkNoteAppOp") && m.getReturnType() == boolean.class;
                boolean dnd = name.equals("volumeAdjustmentAllowedByDnd") && argc == 2;
                boolean playback = name.equals("onPlaybackConfigChange") && argc == 1;
                if (!adjust && !set && !getter && !permission && !dnd && !playback) continue;
                m.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(m, "audio.gain." + name + "." + argc, false).intercept(chain -> {
                    if (permission || dnd) {
                        Object result = chain.proceed(); Adjustment a = PENDING.get();
                        if (a != null) { if (permission) a.authorized = Boolean.TRUE.equals(result); else a.dndAllowed = Boolean.TRUE.equals(result); }
                        return result;
                    }
                    Object owner = chain.getThisObject(); Controller c = ensure(owner);
                    if (c == null || INTERNAL.get() || (getter && PENDING.get() != null)) return chain.proceed();
                    if (playback) {
                        Object result = chain.proceed(); Object list = chain.getArg(0);
                        if (list instanceof List) c.playback(new ArrayList<>((List<?>) list));
                        return result;
                    }
                    int stream = (Integer) chain.getArg(0);
                    if (AudioGainPolicy.stream(stream).isEmpty() || !c.enabled() || !trusted(c.context)) return chain.proceed();
                    String route = c.route(stream);
                    int nativeMax = c.nativeVolume("getStreamMaxVolume", stream);
                    if (nativeMax <= 0 || route.isEmpty()) return chain.proceed();
                    int maximum = c.maxSteps(route, stream);
                    c.publishScale(route, stream, nativeMax);
                    if (getter) {
                        Object result = chain.proceed(); int base = (Integer) result;
                        if (name.equals("getStreamMaxVolume")) return base + maximum;
                        if (base == 0) return result;
                        return base + Math.min(maximum, c.extra(route, stream));
                    }
                    int nativeVolume = c.nativeVolume("getStreamVolume", stream);
                    int requested = (Integer) chain.getArg(1);
                    Adjustment a = new Adjustment(); a.stream = stream; a.route = route;
                    int extra = c.extra(route, stream); Object[] args = chain.getArgs().toArray();
                    if (adjust) {
                        if (requested != AudioManager.ADJUST_RAISE && requested != AudioManager.ADJUST_LOWER) return chain.proceed();
                        if (nativeVolume < nativeMax || (requested < 0 && extra == 0)) {
                            c.setExtra(route, stream, 0); return chain.proceed();
                        }
                        a.requested = Math.max(0, Math.min(maximum, extra + requested));
                        // ADJUST_SAME runs the ROM's policy and UI update without reducing the hardware index.
                        args[1] = AudioManager.ADJUST_SAME;
                    } else {
                        a.requested = Math.max(0, Math.min(maximum, requested - nativeMax));
                        args[1] = Math.min(requested, nativeMax);
                    }
                    Adjustment prior = PENDING.get(); PENDING.set(a);
                    try {
                        Object result = chain.proceed(args);
                        if (a.authorized && a.dndAllowed && c.nativeVolume("getStreamVolume", stream) == nativeMax
                                && route.equals(c.route(stream))) c.setExtra(route, stream, a.requested);
                        else if (!adjust && a.authorized && a.dndAllowed && requested <= nativeMax) c.setExtra(route, stream, 0);
                        c.notifyPanel(stream, (Integer) chain.getArg(2));
                        return result;
                    } finally { if (prior == null) PENDING.remove(); else PENDING.set(prior); }
                })); count++;
            }
            installed = count >= 6;
            module.logFeatureInfo("AUDIO_GAIN_READY hooks=" + count);
        } catch (Throwable e) { module.logFeatureError("AUDIO_GAIN_INSTALL", e); }
    }
    private static synchronized Controller ensure(Object owner) {
        if (controller != null) return controller;
        Object context = field(owner, "mContext");
        if (!(context instanceof Context)) return null;
        controller = new Controller(owner, (Context) context); return controller;
    }
    private static boolean trusted(Context context) {
        int uid = Binder.getCallingUid(); if (uid == 0 || uid == 1000) return true;
        String[] names = context.getPackageManager().getPackagesForUid(uid);
        return names != null && (Arrays.asList(names).contains("ls.augment.com") || Arrays.asList(names).contains("com.android.systemui"));
    }
    private static Object field(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) try {
            Field f = c.getDeclaredField(name); f.setAccessible(true); return f.get(owner);
        } catch (Throwable ignored) { } return null;
    }
    private static Object invoke(Object owner, String name, Object... args) throws ReflectiveOperationException {
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) for (Method method : c.getDeclaredMethods())
            if (method.getName().equals(name) && method.getParameterCount() == args.length) {
                try { method.setAccessible(true); return method.invoke(owner, args); }
                catch (IllegalArgumentException wrongOverload) { }
            }
        throw new NoSuchMethodException(name);
    }
    private static final class Controller {
        final Object service; final Context context; final Handler handler;
        final Map<String, Integer> extras = new ConcurrentHashMap<>();
        final Map<Integer, LoudnessEnhancer> effects = new HashMap<>();
        final Map<Integer, String> publishedScales = new ConcurrentHashMap<>();
        List<?> players = Collections.emptyList(); String lastError = "", lastDiagnostic = "";
        final Binder readEndpoint=new Binder(){
            @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException{
                if(code!=IBinder.FIRST_CALL_TRANSACTION)return super.onTransact(code,data,reply,flags);
                if(reply==null||(flags&IBinder.FLAG_ONEWAY)!=0)return false;
                data.enforceInterface(AudioGainState.DESCRIPTOR);
                int uid=Binder.getCallingUid();String[] packages=context.getPackageManager().getPackagesForUid(uid);
                boolean actualSystemUi=false;
                try{actualSystemUi=uid==context.getPackageManager().getApplicationInfo("com.android.systemui",0).uid;}
                catch(android.content.pm.PackageManager.NameNotFoundException unavailable){}
                if(!actualSystemUi||uid/100000!=android.os.Process.myUid()/100000||packages==null||!Arrays.asList(packages).contains("com.android.systemui"))throw new SecurityException("SystemUI readback only");
                int version=data.readInt(),stream=data.readInt();long request=data.readLong();String token=data.readString();data.enforceNoDataAvail();
                if(version!=BuildConfig.VERSION_CODE||AudioGainPolicy.stream(stream).isEmpty()||request<1)throw new IllegalArgumentException("invalid audio readback request");
                long identity=Binder.clearCallingIdentity();AudioGainState state;
                try{state=readState(stream,request,token);}finally{Binder.restoreCallingIdentity(identity);}
                reply.writeNoException();reply.writeBundle(state==null?null:state.bundle());return true;
            }
        };
        long lastRegistration=-10_000;final Runnable registerAgain=this::registerReadEndpoint;
        final java.util.concurrent.atomic.AtomicBoolean registrationPending=new java.util.concurrent.atomic.AtomicBoolean();
        void registerReadEndpoint(){
            long now=SystemClock.elapsedRealtime();handler.removeCallbacks(registerAgain);if(now-lastRegistration<1000){handler.postDelayed(registerAgain,1000-(now-lastRegistration));return;}lastRegistration=now;
            if(!registrationPending.compareAndSet(false,true))return;
            // Provider acquisition must never block the existing DSP/notifyPanel handler.
            READ_REGISTRATION.execute(()->{Bundle b=new Bundle();b.putBinder("controller",readEndpoint);b.putInt("version",BuildConfig.VERSION_CODE);
                try{Bundle reply=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),AudioGainState.REGISTER,null,b);
                    readDiagnostic("register",reply==null?"null_reply":"ok="+reply.getBoolean("ok")+";state="+reply.getString("state","unspecified"));}
                catch(RuntimeException error){readDiagnostic("register","exception="+error.getClass().getSimpleName());}
                finally{registrationPending.set(false);}});
        }
        void readDiagnostic(String stage,String value){try{FeatureSettings.diagnostic(context,"ls_augment_audio_gain_read_"+stage,value);}catch(RuntimeException ignored){}}
        AudioGainState rejectState(int stream,String reason){readDiagnostic("server","stream="+stream+";reject="+reason);return null;}
        AudioGainState readState(int stream,long request,String requestedToken){
            if(!FeatureSettings.hasVerifiedSnapshot(context))return rejectState(stream,"unverified_snapshot");
            ConfigSnapshot before=FeatureSettings.snapshot(context);String token=AudioGainState.configuration(before,stream);
            if(!token.equals(requestedToken))return rejectState(stream,"configuration_changed");
            try{
                int boot=Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT,-1);
                int device=(Integer)invoke(service,"getDeviceForStream",stream);String route=route(stream);
                int base=nativeVolume("getStreamMaxVolume",stream),nativeLevel=nativeVolume("getStreamVolume",stream);
                boolean muted=(Boolean)invoke(service,"isStreamMute",stream),enabled=ls.augment.com.ConfigSchema.truthy(before.get(ConfigSchema.AUDIO_GAIN_ENABLED));
                int step=AudioGainState.number(before.get(ConfigSchema.AUDIO_GAIN_STEP),5,1,20);
                int limit=route.isEmpty()?100:AudioGainState.number(before.get(AudioGainPolicy.key(route,stream)),100,100,300);
                int extraRaw=extras.getOrDefault(id(route,stream),0),extra=enabled&&!route.isEmpty()?Math.min(extraRaw,AudioGainPolicy.extraSteps(limit,step)):0;
                int total=base+(enabled&&!route.isEmpty()?AudioGainPolicy.extraSteps(limit,step):0);
                int current=nativeLevel==0?0:nativeLevel+extra;
                // Bracket the selected raw output device type as well as its gain-policy category.
                if(nativeLevel!=nativeVolume("getStreamVolume",stream)||base!=nativeVolume("getStreamMaxVolume",stream)
                        ||muted!=(Boolean)invoke(service,"isStreamMute",stream)||extraRaw!=extras.getOrDefault(id(route,stream),0)
                        ||device!=(Integer)invoke(service,"getDeviceForStream",stream)||!route.equals(route(stream))
                        ||!token.equals(AudioGainState.configuration(FeatureSettings.snapshot(context),stream))
                        ||boot!=Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT,-1))return rejectState(stream,"source_changed");
                AudioGainState state=new AudioGainState(BuildConfig.VERSION_CODE,boot,SystemClock.elapsedRealtime(),request,stream,device,route,token,enabled,muted,base,nativeLevel,current,total,step,limit);
                if(!state.valid(BuildConfig.VERSION_CODE,boot,SystemClock.elapsedRealtime(),stream,token))return rejectState(stream,"packet_contract;boot="+boot+";base="+base+";native="+nativeLevel+";current="+current+";total="+total+";muted="+muted+";route="+route);
                readDiagnostic("server","stream="+stream+";ready;base="+base+";native="+nativeLevel+";current="+current+";total="+total+";muted="+muted+";route="+route);return state;
            }catch(ReflectiveOperationException|RuntimeException error){return rejectState(stream,"exception="+error.getClass().getSimpleName());}
        }
        Controller(Object service, Context context) {
            this.service = service; this.context = context;
            HandlerThread t = new HandlerThread("LS-audio-gain", android.os.Process.THREAD_PRIORITY_BACKGROUND); t.start(); handler = new Handler(t.getLooper());
            handler.post(() -> { try { context.getContentResolver().registerContentObserver(Uri.parse("content://ls.augment.com.config/config"), true, new ContentObserver(handler) {
                @Override public void onChange(boolean selfChange) { FeatureSettings.invalidateSnapshot(); if (!enabled()) extras.clear(); apply(); for(int s:new int[]{3,2,4}) notifyPanel(s,0); }
            }); } catch (RuntimeException unavailable) { /* The periodic worker still refreshes. */ } });
            handler.post(()->{
                // A wake-only discovery cannot query audio or change it; the provider authenticates registration.
                try{context.registerReceiver(new BroadcastReceiver(){@Override public void onReceive(Context c,Intent i){registerReadEndpoint();}},
                        new IntentFilter(AudioGainState.REDISCOVER),null,handler,Context.RECEIVER_EXPORTED);}catch(RuntimeException ignored){}
                registerReadEndpoint();
            });
            handler.postDelayed(tick, 1000);
        }
        final Runnable tick = new Runnable() { public void run() { apply(); handler.postDelayed(this, 1000); } };
        boolean enabled() { return FeatureSettings.enabled(context, ConfigSchema.AUDIO_GAIN_ENABLED); }
        int step() { return FeatureSettings.integer(context, ConfigSchema.AUDIO_GAIN_STEP, 5, 1, 20); }
        int limit(String route, int stream) { return FeatureSettings.integer(context, AudioGainPolicy.key(route, stream), 100, 100, 300); }
        int maxSteps(String route, int stream) { return AudioGainPolicy.extraSteps(limit(route,stream),step()); }
        void publishScale(String route, int stream, int base) {
            String scale=base+","+step()+","+limit(route,stream);
            if(!scale.equals(publishedScales.put(stream,scale)))
                FeatureSettings.diagnostic(context,"ls_augment_audio_scale_"+stream,scale);
        }
        String id(String route, int stream) { return route + ":" + stream; }
        int extra(String route, int stream) { return Math.min(extras.getOrDefault(id(route,stream),0),maxSteps(route,stream)); }
        void setExtra(String route,int stream,int value) { extras.put(id(route,stream),value); handler.post(this::apply); }
        int nativeVolume(String method,int stream) {
            boolean old=INTERNAL.get(); INTERNAL.set(true);
            try { return (Integer)invoke(service,method,stream); }catch(Throwable e){return -1;}finally{INTERNAL.set(old);}
        }
        String route(int stream) {
            try {
                int device=(Integer)invoke(service,"getDeviceForStream",stream);
                Class<?> audio=Class.forName("android.media.AudioSystem");
                for(String setName:new String[]{"DEVICE_OUT_ALL_A2DP_SET","DEVICE_OUT_ALL_BLE_SET","DEVICE_OUT_ALL_SCO_SET"}) {
                    Field f=audio.getDeclaredField(setName); f.setAccessible(true);Object set=f.get(null);
                    if(set instanceof Set && ((Set<?>)set).contains(device))return "bluetooth";
                }
                if(device==2)return "speaker";
                // Android audio device constants, not a model or firmware whitelist.
                if(device==4||device==8||device==16384||device==8192||device==67108864)return "wired";
            }catch(Throwable ignored){}return "";
        }
        void notifyPanel(int stream,int flags) {
            handler.post(()->{try {Object c=field(service,"mVolumeController");if(c!=null)invoke(c,"postVolumeChanged",stream,flags);}catch(Throwable ignored){}});
        }
        void playback(List<?> configs) { handler.post(()->{players=configs;apply();}); }
        void apply() {
            lastError = "";
            Set<Integer> wanted=new HashSet<>(); int applied=0;
            if(enabled())for(Object player:players)try {
                if(!Boolean.TRUE.equals(invoke(player,"isActive")))continue;
                AudioAttributes attributes=(AudioAttributes)invoke(player,"getAudioAttributes");
                int usage=attributes.getUsage();int stream=usage==AudioAttributes.USAGE_ALARM?4:usage==AudioAttributes.USAGE_NOTIFICATION_RINGTONE?2:
                        usage==AudioAttributes.USAGE_MEDIA||usage==AudioAttributes.USAGE_GAME||usage==AudioAttributes.USAGE_UNKNOWN?3:-1;
                if(stream<0)continue;
                String route=route(stream); if(route.isEmpty())continue;
                int current=nativeVolume("getStreamVolume",stream), maximum=nativeVolume("getStreamMaxVolume",stream);
                if(current>0&&current<maximum)extras.remove(id(route,stream));
                int extra=extra(route,stream);if(extra==0||current<=0)continue;
                int session=(Integer)invoke(player,"getSessionId");if(session<=0)continue;
                int gain=AudioGainPolicy.milliBel(AudioGainPolicy.percent(extra,step(),limit(route,stream)));
                LoudnessEnhancer effect=effects.get(session);
                if(effect==null){effect=new LoudnessEnhancer(session);effects.put(session,effect);}
                if(!effect.hasControl())throw new IllegalStateException("音效被其他应用占用");
                effect.setTargetGain(gain);effect.setEnabled(true);
                if(!effect.getEnabled()||Math.abs(effect.getTargetGain()-gain)>1)throw new IllegalStateException("音频通道未接受增益");
                wanted.add(session);applied++;
            }catch(Throwable e){lastError=e.getClass().getSimpleName()+":"+e.getMessage();}
            for(Iterator<Map.Entry<Integer,LoudnessEnhancer>> it=effects.entrySet().iterator();it.hasNext();){Map.Entry<Integer,LoudnessEnhancer> e=it.next();if(!wanted.contains(e.getKey())){e.getValue().release();it.remove();}}
            String diagnostic="enabled="+enabled()+";active_sessions="+applied+";extra="+extras+";error="+lastError;
            if(!diagnostic.equals(lastDiagnostic)){lastDiagnostic=diagnostic;
                FeatureSettings.diagnostic(context,"ls_augment_audio_gain_runtime",diagnostic);}
        }
    }
}
