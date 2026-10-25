package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.Process;
import android.os.UserHandle;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ls.augment.com.BuildConfig;
import ls.augment.com.CompetitiveKeyOptions;
import ls.augment.com.CompetitiveKeyPolicy;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;

/** Receives the OEM physical switch callback; shoulder-key event codes are never intercepted. */
public final class CompetitiveKeyHook {
    private static final String GAME="com.android.server.redmagic.GameKeysCtrl";
    private static final String SLIDE="com.android.server.redmagic.SlideKeysCtrl";
    private static final CompetitiveKeyPolicy.Edges EDGES=new CompetitiveKeyPolicy.Edges();
    private static final ThreadPoolExecutor ACTIONS=new ThreadPoolExecutor(1,1,0,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16),r->{Thread t=new Thread(r,"LSA-CompetitiveKey");t.setDaemon(true);return t;});

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile Context attached;
    private static volatile Object gameOwner;
    private static int routeCount;private static boolean listenerInstalled,heartbeatInstalled;
    private CompetitiveKeyHook(){}

    public static int install(AugmentModule module,ClassLoader loader){
        int game=route(module,loader,GAME,"notifyGameSwitchChanged",true);
        int slide=route(module,loader,SLIDE,"notifyCameraSlideKeySwitchChanged",false);
        routeCount=game+slide;
        int lifecycle=OemHooks.methods(module,loader,GAME,"systemReady",void.class,0,"",chain->{
            Object result=chain.proceed();gameOwner=chain.getThisObject();attach(FeatureSettings.from(chain.getThisObject()));return result;
        },new Class<?>[0]);
        // Game mode consults physical state again during wake/unlock. Keep its native scene off
        // while the physical switch belongs to this feature, including at boot with slider up.
        int guard=OemHooks.methods(module,loader,"com.android.server.redmagic.game.GameModeController",
                "isGameKeyOn",boolean.class,0,CompetitiveKeyOptions.ENABLED,chain->false,new Class<?>[0]);
        guard+=OemHooks.methods(module,loader,"com.redmagic.game.GameKeysHelper","isSlideKeyStartGameLauncher",
                boolean.class,1,CompetitiveKeyOptions.ENABLED,chain->false,new Class<?>[]{Context.class});
        Handler main=new Handler(Looper.getMainLooper());
        main.post(new Runnable(){int attempts;public void run(){Context c=FeatureSettings.from(null);
            if(c!=null)attach(c);else if(++attempts<60)main.postDelayed(this,1000);}});
        return game+slide+lifecycle+guard;
    }

    private static int route(AugmentModule module,ClassLoader loader,String owner,String method,boolean game){
        return OemHooks.methods(module,loader,owner,method,void.class,3,"",chain->{
            if(game)gameOwner=chain.getThisObject();
            Context context=FeatureSettings.from(chain.getThisObject());attach(context);
            ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
            if(!ConfigSchema.truthy(snapshot.get(CompetitiveKeyOptions.ENABLED))){
                EDGES.accept((Long)chain.getArg(0),(Boolean)chain.getArg(1));return chain.proceed();
            }
            // Framework boot/init uses zero or -1 timestamps. Suppress stock behavior, but
            // only a genuine positive timestamp may launch an app or execute a command.
            long when=(Long)chain.getArg(0);boolean up=(Boolean)chain.getArg(1);
            Object bookkeeping=game?chain.getThisObject():gameOwner;
            if(bookkeeping!=null){OemHooks.set(bookkeeping,up?1:0,"mGameState");
                OemHooks.set(bookkeeping.getClass(),false,"isGameKeyOpend");}
            if(context!=null&&EDGES.accept(when,up)){
                int user=CompetitiveKeyPolicy.integer(String.valueOf(OemHooks.field(chain.getThisObject(),"mCurrentUserId")),0);
                try{ACTIONS.execute(()->execute(context,user,when,up,snapshot));}
                catch(java.util.concurrent.RejectedExecutionException full){record(context,"动作队列已满，此次动作未执行");}
            }
            return null; // Both direction actions, including NONE, own this physical slider.
        },new Class<?>[]{long.class,boolean.class,boolean.class});
    }

    private static synchronized void attach(Context context){
        if(context==null||Process.myUid()!=Process.SYSTEM_UID)return;
        attached=context;
        FeatureSettings.diagnostic(context,CompetitiveKeyOptions.READY,
                BuildConfig.VERSION_CODE+";routes="+routeCount+";pid="+Process.myPid()+";at="+System.currentTimeMillis());
        if(!listenerInstalled){listenerInstalled=FeatureSettings.addSnapshotListener(context,()->{
            record(context,FeatureSettings.enabled(context,CompetitiveKeyOptions.ENABLED)?"已接管竞技键":"已关闭");
        });}
        if(!heartbeatInstalled&&Looper.getMainLooper()!=null){heartbeatInstalled=true;
            Handler main=new Handler(Looper.getMainLooper());main.postDelayed(new Runnable(){public void run(){
                attach(attached);main.postDelayed(this,15000);}},15000);}
    }

    private static void execute(Context context,int user,long when,boolean up,ConfigSnapshot requested){
        // A queued action from a closed or edited page cannot act on a newer configuration.
        long identity=Binder.clearCallingIdentity();
        try{
            // This IPC runs only on the private action worker. The fast input callback consumes
            // stock behavior from the cache, while actions verify the latest committed state.
            Bundle snapshotReply=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"snapshot",null,null);
            ConfigSnapshot current=snapshotReply==null?null:ConfigSnapshot.parse(snapshotReply.getString("snapshot",""));
            if(current==null||!CompetitiveKeyPolicy.sameConfiguration(requested::get,current::get)
                    ||!ConfigSchema.truthy(current.get(CompetitiveKeyOptions.ENABLED)))return;
            int action=CompetitiveKeyPolicy.action(current::get,up);String message;
            switch(action){
                case CompetitiveKeyPolicy.NONE:message="无动作";break;
                case CompetitiveKeyPolicy.APP_OPEN:
                case CompetitiveKeyPolicy.APP_CLOSE:{
                    String pkg=current.get(CompetitiveKeyOptions.APP_PACKAGE);
                    if(pkg.isEmpty()||CompetitiveKeyPolicy.normalizePackage(pkg)==null){message="未选择指定app";break;}
                    Context owner=(Context)OemHooks.invoke(context,"createContextAsUser",handle(user),0);
                    if(action==CompetitiveKeyPolicy.APP_OPEN){
                        Intent launch=owner.getPackageManager().getLaunchIntentForPackage(pkg);
                        if(launch==null)throw new IllegalStateException("指定app未安装或无法打开");
                        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        OemHooks.invoke(context,"startActivityAsUser",launch,handle(user));
                    }else{
                        owner.getPackageManager().getApplicationInfo(pkg,0);
                        Object am=context.getSystemService(Context.ACTIVITY_SERVICE);
                        OemHooks.invoke(am,"forceStopPackageAsUser",pkg,user);
                    }
                    message=action==CompetitiveKeyPolicy.APP_OPEN?"已打开指定app":"已关闭指定app";break;
                }
                case CompetitiveKeyPolicy.SILENT:
                case CompetitiveKeyPolicy.RING:{
                    AudioManager audio=context.getSystemService(AudioManager.class);
                    if(audio==null)throw new IllegalStateException("音频服务不可用");
                    int mode=action==CompetitiveKeyPolicy.SILENT?AudioManager.RINGER_MODE_SILENT:AudioManager.RINGER_MODE_NORMAL;
                    OemHooks.invoke(audio,"setRingerModeInternal",mode);
                    Object actual=OemHooks.invoke(audio,"getRingerModeInternal");
                    if(!(actual instanceof Integer)||(Integer)actual!=mode)throw new IllegalStateException("系统未接受响铃模式");
                    message=mode==0?"已切换静音":"已切换响铃";break;
                }
                case CompetitiveKeyPolicy.POWER_ON:
                case CompetitiveKeyPolicy.POWER_OFF:{
                    PowerManager power=context.getSystemService(PowerManager.class);
                    if(power==null)throw new IllegalStateException("电源服务不可用");
                    boolean on=action==CompetitiveKeyPolicy.POWER_ON;
                    if(power.isPowerSaveMode()!=on)OemHooks.invoke(power,"setPowerSaveModeEnabled",on);
                    if(power.isPowerSaveMode()!=on)throw new IllegalStateException("系统未接受省电模式，充电中可能无法开启");
                    message=on?"已开启省电模式":"已关闭省电模式";break;
                }
                case CompetitiveKeyPolicy.SHELL:{
                    Bundle extras=new Bundle();extras.putBoolean("up",up);extras.putLong("revision",current.revision);
                    extras.putString("eventId",Process.myPid()+":"+when+":"+(up?1:0));
                    Bundle response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),CompetitiveKeyOptions.SHELL_CALL,null,extras);
                    message=response==null?"命令执行桥不可用":response.getString("message","命令未执行，配置可能已变更");break;
                }
                default:message="无动作";
            }
            record(context,(up?"上推：":"下拉：")+message);
        }catch(Throwable error){Throwable cause=error instanceof java.lang.reflect.InvocationTargetException&&error.getCause()!=null?error.getCause():error;
            record(context,(up?"上推：":"下拉：")+"执行失败："+(cause.getMessage()==null?cause.getClass().getSimpleName():cause.getMessage()));
        }finally{Binder.restoreCallingIdentity(identity);}
    }
    private static UserHandle handle(int user)throws ReflectiveOperationException{
        return (UserHandle)UserHandle.class.getMethod("of",int.class).invoke(null,user);
    }
    private static void record(Context context,String message){FeatureSettings.diagnostic(context,CompetitiveKeyOptions.RUNTIME,message);}
}
