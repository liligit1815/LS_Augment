package ls.augment.com.hook;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.function.IntSupplier;
import ls.augment.com.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Fullscreen replacements fed by real OEM callbacks; ordinary firmware retains its native adapters. */
final class IslandBuiltinEvents {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static WeakReference<Object> torchSource=new WeakReference<>(null);
    private static IslandBuiltinEvents active;
    private static final Set<String> contracts=new HashSet<>();
    private final Context context;private final ClassLoader loader;private final Runnable changed;private final IntSupplier currentUser;
    private final Map<String,Timed> transientEvents=new LinkedHashMap<>();
    private final Runnable expire;
    private Object torch,torchCallback,torchInstance;private Method torchEnabled,torchAvailable,torchOff,torchRemove;
    private WeakReference<Object> bluetooth=new WeakReference<>(null);private String bluetoothName;private int bluetoothLevel=-1,user=-1;
    private boolean closed;
    private String torchState="";
    private static final class Timed {final IslandEvent event;final long until;Timed(IslandEvent e,long t){event=e;until=t;}}
    IslandBuiltinEvents(Context c,ClassLoader l,Runnable changed,IntSupplier currentUser){this.context=c;loader=l;this.changed=changed;this.currentUser=currentUser;expire=()->{prune();changed.run();};}
    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.policy.FlashlightControllerImpl",false,loader);
            Class<?> callback=Class.forName("com.android.systemui.statusbar.policy.FlashlightController$FlashlightListener",false,loader);
            MagicIslandScenes.exact(type,"isAvailable",boolean.class);MagicIslandScenes.exact(type,"setFlashlight",void.class,boolean.class);
            MagicIslandScenes.exact(type,"removeCallback",void.class,callback);
            for(Method m:new Method[]{MagicIslandScenes.exact(type,"isEnabled",boolean.class),MagicIslandScenes.exact(type,"addCallback",void.class,callback)}){
                module.registerFeatureHook(module.prepareFeatureHook(m,"island.source.torch."+m.getName(),false).intercept(chain->{
                    Object result=chain.proceed(),source=chain.getThisObject();
                    if(torchSource.get()!=source){torchSource=new WeakReference<>(source);MAIN.post(()->{if(active!=null&&active.torch==null)active.bindTorch();});}
                    return result;
                }));count++;
            }
            contracts.add("torch");
        }catch(Exception missing){module.logFeatureInfo("ISLAND_BUILTIN_MISSING torch:"+missing.getMessage());}
        try{
            Class<?> manager=Class.forName("com.zte.feature.dynamicisland.DisposableIslandManager",false,loader);
            Method low=MagicIslandScenes.exact(manager,"showLowBatteryIsland",boolean.class,boolean.class,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(low,"island.source.low_power",false).intercept(chain->{
                Object result=chain.proceed();if(Boolean.TRUE.equals(result)){int level=(Integer)chain.getArg(1);
                    MAIN.post(()->{IslandBuiltinEvents owner=active;if(owner!=null&&level>=0&&level<=100)owner.transientEvent("low_power","电量不足",level+"%","ic_battery_alert",new Object());});}
                return result;
            }));contracts.add("low_power");count++;
            Method headset=MagicIslandScenes.exact(manager,"handleHeadsetIsland",void.class,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(headset,"island.source.headset",false).intercept(chain->{
                Object result=chain.proceed();int kind=(Integer)chain.getArg(0);MAIN.post(()->{IslandBuiltinEvents owner=active;
                    if(owner!=null&&kind>=0&&kind<=2){String resource=kind==1?"dynamic_island_double_earphone_conected":kind==2?"dynamic_island_single_earphone_conected":"dynamic_island_earphone_conected";
                        int id=owner.context.getResources().getIdentifier(resource,"string","com.android.systemui");
                        if(id!=0)owner.transientEvent("headset","耳机",owner.context.getString(id),"dynamic_bluetooth_normal",new Object());}
                });return result;
            }));contracts.add("headset");count++;
            Class<?> device=Class.forName("com.android.settingslib.bluetooth.CachedBluetoothDevice",false,loader);
            Method connected=MagicIslandScenes.exact(device,"isConnected",boolean.class),name=MagicIslandScenes.exact(device,"getName",String.class);
            Method change=MagicIslandScenes.exact(manager,"handleBluetoothActiveDeviceChanged",void.class,device,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(change,"island.source.bluetooth",false).intercept(chain->{
                Object value=chain.getArg(0);Object result=chain.proceed();
                // Copy the OEM source result before returning; do not keep its callback Chain.
                boolean on=value!=null&&Boolean.TRUE.equals(connected.invoke(value));String label=on?(String)name.invoke(value):null;
                MAIN.post(()->{IslandBuiltinEvents owner=active;if(owner!=null)owner.bluetoothChanged(value,on,label);});return result;
            }));count++;
            Method level=MagicIslandScenes.exact(manager,"handleBluetoothBatteryLevelChange",void.class,device,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(level,"island.source.bluetooth_battery",false).intercept(chain->{
                Object value=chain.getArg(0);int percent=(Integer)chain.getArg(1);Object result=chain.proceed();
                MAIN.post(()->{IslandBuiltinEvents owner=active;if(owner!=null&&owner.bluetooth.get()==value&&percent>=0&&percent<=100){
                    owner.bluetoothLevel=percent;Timed old=owner.transientEvents.get("bluetooth");
                    if(old!=null&&old.until>SystemClock.elapsedRealtime())owner.replaceBluetooth(old.until,old.event.instance);
                }});return result;
            }));contracts.add("bluetooth");count++;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_BUILTIN_MISSING disposable:"+missing.getMessage());}
        return count;
    }
    void start(){active=this;user=currentUser.getAsInt();bindTorch();}
    private void bindTorch(){
        if(closed||torch!=null)return;
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.policy.FlashlightController",false,loader);
            Object candidate=torchSource.get();
            if(!type.isInstance(candidate))candidate=Class.forName("com.android.systemui.Dependency",false,loader).getMethod("get",Class.class).invoke(null,type);
            if(!type.isInstance(candidate))throw new IllegalStateException("torch_instance");
            Class<?> callback=Class.forName(type.getName()+"$FlashlightListener",false,loader);
            torchEnabled=MagicIslandScenes.exact(candidate.getClass(),"isEnabled",boolean.class);
            torchAvailable=MagicIslandScenes.exact(candidate.getClass(),"isAvailable",boolean.class);
            torchOff=MagicIslandScenes.exact(candidate.getClass(),"setFlashlight",void.class,boolean.class);
            torchRemove=MagicIslandScenes.exact(candidate.getClass(),"removeCallback",void.class,callback);
            Method add=MagicIslandScenes.exact(candidate.getClass(),"addCallback",void.class,callback);
            torchCallback=Proxy.newProxyInstance(loader,new Class<?>[]{callback},(proxy,method,args)->{
                if(method.getDeclaringClass()==Object.class){if("equals".equals(method.getName()))return proxy==args[0];if("hashCode".equals(method.getName()))return System.identityHashCode(proxy);return "Duo torch source";}
                MAIN.post(changed);return null;
            });torch=candidate;add.invoke(torch,torchCallback);changed.run();
        }catch(Exception missing){torch=null;FeatureRuntimeLog.event("ISLAND_BUILTIN_SOURCE","torch:"+missing.getClass().getSimpleName());}
    }
    boolean capable(String scene){return "torch".equals(scene)?torch!=null:contracts.contains(scene);}
    Map<String,IslandEvent> snapshot(int current){
        if(user!=current){reset();user=current;}
        prune();Map<String,IslandEvent> result=new LinkedHashMap<>();
        for(Timed timed:transientEvents.values())if(IslandSceneSelection.enabled(context,timed.event.scene))result.put(timed.event.key,timed.event);
        if(torch!=null&&IslandSceneSelection.enabled(context,"torch"))try{
            boolean enabled=Boolean.TRUE.equals(torchEnabled.invoke(torch)),available=Boolean.TRUE.equals(torchAvailable.invoke(torch));
            String state=enabled+":"+available;
            if(!state.equals(torchState)){torchState=state;FeatureRuntimeLog.event("ISLAND_BUILTIN_STATE","torch="+state);}
            if(enabled&&available){
                if(torchInstance==null)torchInstance=new Object();
                Runnable off=()->{try{torchOff.invoke(torch,false);}catch(Exception e){FeatureRuntimeLog.event("ISLAND_LIVE_ACTION","torch:"+e.getClass().getSimpleName());}};
                result.put("torch",new IslandEvent("torch","torch",current,android.os.Process.myUid(),torchInstance,Boolean.TRUE,"手电筒","已开启","手电筒",icon("ic_eqs_flashlight_on"),null,List.of(new IslandEvent.Action("关闭手电筒",off))));
            }else torchInstance=null;
        }catch(Exception unavailable){torchInstance=null;}
        return result;
    }
    private boolean accept(String scene){return !closed&&user>=0&&user==currentUser.getAsInt()&&IslandSceneSelection.enabled(context,scene);}
    private void transientEvent(String scene,String title,String detail,String image,Object instance){
        if(!accept(scene))return;
        IslandEvent event=new IslandEvent(scene,scene,user,android.os.Process.myUid(),instance,detail,title,detail,detail,icon(image),null,List.of());
        transientEvents.put(scene,new Timed(event,SystemClock.elapsedRealtime()+2600));prune();changed.run();
    }
    private void bluetoothChanged(Object source,boolean connected,String name){
        if(!accept("bluetooth"))return;
        if(connected&&name!=null&&!name.isBlank()){
            if(bluetooth.get()==source&&name.equals(bluetoothName))return;
            bluetooth=new WeakReference<>(source);bluetoothName=name;bluetoothLevel=-1;replaceBluetooth(SystemClock.elapsedRealtime()+2600,new Object());
        }else if(bluetoothName!=null){String previous=bluetoothName;bluetooth.clear();bluetoothName=null;bluetoothLevel=-1;transientEvent("bluetooth",previous,"已断开","dynamic_bluetooth_normal",new Object());}
    }
    private void replaceBluetooth(long until,Object instance){
        if(!accept("bluetooth")||bluetoothName==null)return;
        String status=bluetoothLevel<0?"已连接":"已连接 · "+bluetoothLevel+"%";
        IslandEvent event=new IslandEvent("bluetooth","bluetooth",user,android.os.Process.myUid(),instance,status,bluetoothName,status,bluetoothName,icon("dynamic_bluetooth_normal"),null,List.of());
        transientEvents.put("bluetooth",new Timed(event,until));prune();changed.run();
    }
    private Drawable icon(String name){int id=context.getResources().getIdentifier(name,"drawable","com.android.systemui");return id==0?null:context.getDrawable(id);}
    private void prune(){
        MAIN.removeCallbacks(expire);long now=SystemClock.elapsedRealtime(),next=Long.MAX_VALUE;
        for(String key:new ArrayList<>(transientEvents.keySet())){Timed event=transientEvents.get(key);if(event.until<=now||!IslandSceneSelection.enabled(context,event.event.scene))transientEvents.remove(key);else next=Math.min(next,event.until);}
        if(!closed&&next!=Long.MAX_VALUE)MAIN.postDelayed(expire,Math.max(1,next-now));
    }
    void reset(){transientEvents.clear();MAIN.removeCallbacks(expire);bluetooth.clear();bluetoothName=null;bluetoothLevel=-1;torchInstance=null;}
    void close(){closed=true;reset();if(torch!=null&&torchRemove!=null&&torchCallback!=null)try{torchRemove.invoke(torch,torchCallback);}catch(Exception ignored){}if(active==this)active=null;}
}
