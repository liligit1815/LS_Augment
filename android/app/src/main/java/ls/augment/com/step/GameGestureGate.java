package ls.augment.com.step;

import android.app.Application;
import android.app.BroadcastOptions;
import android.content.*;
import android.os.*;
import android.view.MotionEvent;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.WeakHashMap;
import ls.augment.com.hook.AugmentModule;
import static ls.augment.com.step.StepRuntime.*;

/** Give only live Step top-origin streams to Step, before GameAssist arms its global monitor. */
public final class GameGestureGate {
    static final String GAME="cn.nubia.gameassist",STATE=PACKAGE+".STEP_GAME_STATE",QUERY=PACKAGE+".STEP_GAME_QUERY";
    static final String DESCRIPTOR=PACKAGE+".StepTopGesture";
    static final int HIT=IBinder.FIRST_CALL_TRANSACTION;
    static final Handler main=new Handler(Looper.getMainLooper());
    static final WeakHashMap<Object,Boolean> streams=new WeakHashMap<>();
    static volatile IBinder endpoint;
    static volatile long until;
    static boolean bound;
    private GameGestureGate(){}
    static int gameUid(Context context){
        try{return context.getPackageManager().getApplicationInfo(GAME,0).uid;}
        catch(android.content.pm.PackageManager.NameNotFoundException missing){return -1;}
    }
    static boolean top(boolean ready,int display,float x,float y,int width,int height){
        return ready && display==0 && Float.isFinite(x) && Float.isFinite(y)
                && x>=0 && x<width && y>=0 && y<height;
    }
    static IBinder host(LiveWorkspace host){
        final int trusted=gameUid(Shell.context);
        return new Binder(){@Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException{
            if(code!=HIT)return super.onTransact(code,data,reply,flags);
            if(trusted<0 || Binder.getCallingUid()!=trusted)throw new SecurityException("game gesture caller");
            data.enforceInterface(DESCRIPTOR);
            int display=data.readInt();float x=data.readFloat(),y=data.readFloat();
            boolean hit=false;long identity=Binder.clearCallingIdentity();
            try{
                WorkspaceQuickBar bar=host.quickBar;
                WorkspaceLayout geometry=host.geometry;
                boolean ready=host.ready && host==LiveWorkspace.current && !host.closing && !host.closed
                        && geometry!=null && bar!=null && bar.sideToolbar!=null && bar.sideToolbar.usable();
                if(ready)hit=top(true,display,x,y,geometry.width,geometry.contentHeight);
            }finally{Binder.restoreCallingIdentity(identity);}
            reply.writeNoException();reply.writeBoolean(hit);return true;
        }};
    }
    static boolean hit(MotionEvent event){
        IBinder gate=endpoint;
        if(gate==null || until<=SystemClock.uptimeMillis())return false;
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeInt((Integer)call(event,"getDisplayId"));
            data.writeFloat(event.getRawX());data.writeFloat(event.getRawY());
            if(!gate.transact(HIT,data,reply,0))return false;
            reply.readException();return reply.readBoolean();
        }catch(RemoteException|RuntimeException failure){return false;}
        finally{data.recycle();reply.recycle();}
    }
    static boolean suppress(Object helper,int action,boolean topDown){
        synchronized(streams){
            if(action==MotionEvent.ACTION_DOWN)streams.put(helper,topDown);
            boolean owned=Boolean.TRUE.equals(streams.get(helper));
            if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL)streams.remove(helper);
            return owned;
        }
    }
    public static void install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> helper=Class.forName("cn.nubia.gameassist.panel.TouchHelper",false,loader);
            Method events=OwnershipBridge.method(helper,"onPointerEvent",MotionEvent.class);
            if(events.getReturnType()!=void.class || Modifier.isStatic(events.getModifiers()))throw new NoSuchMethodException("GameAssist pointer contract");
            module.deoptimize(events);
            module.hook(events).intercept(chain->{
                MotionEvent event=(MotionEvent)chain.getArgs().get(0);
                int action=event.getActionMasked();
                boolean topDown=action==MotionEvent.ACTION_DOWN && event.isFromSource(android.view.InputDevice.SOURCE_TOUCHSCREEN) && hit(event);
                if(suppress(chain.getThisObject(),action,topDown)){
                    if(action==MotionEvent.ACTION_DOWN)diagnostic("GAME_GESTURE","step_top_stream;native_main_unchanged");
                    return null;
                }
                return chain.proceed();
            });
            Method attach=Application.class.getDeclaredMethod("attach",Context.class);
            module.hook(attach).intercept(chain->{Object result=chain.proceed();bind((Context)chain.getThisObject());return result;});
            Method application=Class.forName("android.app.ActivityThread").getMethod("currentApplication");
            main.post(()->{try{Object context=application.invoke(null);if(context instanceof Context)bind((Context)context);}catch(ReflectiveOperationException ignored){}});
            diagnostic("GAME_GESTURE_CAPABILITY",events.toGenericString());
        }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){diagnostic("GAME_GESTURE_UNAVAILABLE",missing.toString());}
    }
    static void bind(Context context){
        if(bound)return;
        try{
            context.registerReceiver(new BroadcastReceiver(){public void onReceive(Context c,Intent i){
                if(getSentFromUid()!=1000 || i.getIntExtra("version",0)!=ls.augment.com.BuildConfig.VERSION_CODE)return;
                long deadline=i.getLongExtra("until",0),now=SystemClock.uptimeMillis();
                boolean valid=deadline>now && deadline-now<=5000;
                endpoint=valid && i.getExtras()!=null?i.getExtras().getBinder("gate"):null;
                until=valid?deadline:0;
            }},new IntentFilter(STATE),null,main,Context.RECEIVER_EXPORTED);
            bound=true;
            context.sendBroadcast(new Intent(QUERY).setPackage("android"),null,BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
        }catch(RuntimeException|LinkageError missing){
            endpoint=null;until=0;diagnostic("GAME_GESTURE_BIND_FAILED",missing.toString());
        }
    }
    static void installServer(){
        Wm.context.registerReceiver(new BroadcastReceiver(){public void onReceive(Context c,Intent i){
            int trusted=gameUid(c);if(trusted>=0 && getSentFromUid()==trusted)publish();
        }},new IntentFilter(QUERY),null,Wm.handler,Context.RECEIVER_EXPORTED);
    }
    static void publish(){
        try{
            boolean owned=NativeWorkspaceGuard.active && !NativeWorkspaceGuard.ending && Wm.active;
            Bundle data=new Bundle();data.putBinder("gate",owned?NativeWorkspaceGuard.gameGestureGate:null);
            data.putLong("until",owned?SystemClock.uptimeMillis()+4500:0);data.putInt("version",ls.augment.com.BuildConfig.VERSION_CODE);
            Wm.context.sendBroadcast(new Intent(STATE).setPackage(GAME).putExtras(data),null,
                    BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
        }catch(RuntimeException failure){diagnostic("GAME_GESTURE_STATE_FAILED",failure.toString());}
    }
}
