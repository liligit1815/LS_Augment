package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.*;

/** Uses the original registered producers. Does not invent orders, alter card IDs or bypass service consent. */
final class MagicIslandPersonalCards {
    private static final String PREFIX="com.zte.briefagent.event.scene.";
    private static final String[][] ADAPTERS={
        {"calendar_meeting","meeting.starryisland.Meeting"},{"scenic_guide","electronicguide.starryisland.ElectronicGuide"},
        {"nearby_charging","charge.starryisland.ChargingReminder"},{"cycling","cycling.starryisland.ReturnBike"},
        {"flight","travel.starryisland.Flight"},{"preflight_battery","travel.starryisland.BatteryCharging"},
        {"weather_travel","weather.starryisland.Weather"},{"taxi","taxi.starryisland.Taxi"},
        {"takeout","takeout.notification.Takeout"},{"train_12306","travel.starryisland.Train12306"},
        {"train_travel","travel.starryisland.TravelToolTrain"}};
    private final Map<Class<?>,String> scenes=new LinkedHashMap<>();
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Method nativeSupport,remove;
    private final Field contextField,adapters;
    private Binding binding;
    static void install(AugmentModule module,ClassLoader loader){
        try{new MagicIslandPersonalCards(module,loader);}
        catch(Throwable missing){module.logFeatureError("MAGIC_PERSONAL_CONTRACT",missing);}
    }
    private MagicIslandPersonalCards(AugmentModule module,ClassLoader loader)throws Exception{
        Class<?> environment=Class.forName("com.zte.briefagent.data.config.EnvironmentConfig",false,loader);
        nativeSupport=environment.getDeclaredMethod("isFeatureStarryIslandSupported",Context.class);
        if(nativeSupport.getReturnType()!=boolean.class||!Modifier.isStatic(nativeSupport.getModifiers()))throw new NoSuchMethodException("native_support");
        Class<?> renderer=Class.forName("com.zte.briefagent.event.cards.render.StarryIslandCardRender",false,loader);
        contextField=MagicIslandScenes.typed(renderer,"context",Context.class);
        adapters=MagicIslandScenes.typed(renderer,"cardIdToAdapterMap",Map.class);
        remove=MagicIslandScenes.exact(renderer,"removeCard",void.class,String.class);
        Method init=MagicIslandScenes.exact(renderer,"initCardPusher",void.class);
        Method render=MagicIslandScenes.exact(renderer,"render",void.class,List.class);
        Class<?> cc=Class.forName("com.zte.briefagent.event.cards.CardContext",false,loader);
        Class<?> message=Class.forName("com.zte.toolsdk.common.CardMessage",false,loader);
        for(String[] spec:ADAPTERS)try{
            Class<?> adapter=Class.forName(PREFIX+spec[1]+"StarryIslandAdapter",false,loader);
            Method create=MagicIslandScenes.exact(adapter,"createCardMessage",message,cc);
            scenes.put(adapter,spec[0]);
            module.registerFeatureHook(module.prepareFeatureHook(create,"native_island.magic_source."+spec[0],false).intercept(chain->{
                Binding current=binding;
                if(current!=null&&!current.closed&&denied(current.context,spec[0]))return null;
                return chain.proceed();
            }));
        }catch(Exception missing){module.logFeatureInfo("MAGIC_PERSONAL_SCENE_UNAVAILABLE "+spec[0]+":"+missing);}
        if(scenes.isEmpty())throw new IllegalStateException("no_verified_adapter");
        module.registerFeatureHook(module.prepareFeatureHook(init,"native_island.magic_source_init",false).intercept(chain->{
            Object result=chain.proceed();bindSafely(chain.getThisObject(),module);return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(render,"native_island.magic_source_render",false).intercept(chain->{
            bindSafely(chain.getThisObject(),module);return chain.proceed();
        }));
        Class<?> processor=Class.forName("com.zte.briefagent.event.EventProcessor",false,loader);
        Method end=MagicIslandScenes.exact(processor,"deInit",void.class,Context.class);
        module.registerFeatureHook(module.prepareFeatureHook(end,"native_island.magic_source_close",false).intercept(chain->{
            if(binding!=null){binding.unavailable("personal_service_stopped");binding=null;}return chain.proceed();
        }));
    }
    private boolean nativeMode(Context c){try{return c!=null&&Boolean.TRUE.equals(nativeSupport.invoke(null,c));}catch(Exception missing){return false;}}
    private boolean denied(Context c,String scene){
        return nativeMode(c)&&FeatureSettings.enabled(c,ConfigSchema.NATIVE_ISLAND_SELECTED)
                &&!FeatureSettings.enabled(c,SystemUiOptions.ISLAND)&&NativeIslandMode.enabled(c,NativeIslandMode.MODERN)
                &&FeatureSettings.enabled(c,NativeIslandSceneOptions.ENABLED)&&!FeatureSettings.enabled(c,NativeIslandSceneOptions.key(scene));
    }
    private String scene(Object adapter){for(Map.Entry<Class<?>,String> entry:scenes.entrySet())if(entry.getKey().isInstance(adapter))return entry.getValue();return null;}
    private void bindSafely(Object renderer,AugmentModule module){
        try{bind(renderer);}catch(Exception failure){
            if(binding!=null)binding.unavailable(failure.getClass().getSimpleName());
            module.logFeatureInfo("MAGIC_PERSONAL_BIND_UNAVAILABLE "+failure);
        }
    }
    private void bind(Object renderer)throws Exception{
        Context context=(Context)contextField.get(renderer);
        if(!nativeMode(context)||binding!=null&&!binding.closed&&binding.owner.get()==renderer)return;
        if(binding!=null)binding.close();binding=new Binding(context,renderer);
    }
    private final class Binding {
        final Context context;final WeakReference<Object> owner;boolean closed;
        final Runnable refresh=this::refresh;
        final Runnable changed=()->{main.removeCallbacks(refresh);main.post(refresh);};
        Binding(Context context,Object renderer){
            this.context=context;owner=new WeakReference<>(renderer);
            FeatureSettings.addSnapshotListener(context,changed);
            for(String[] spec:ADAPTERS)FeatureSettings.diagnostic(context,NativeIslandSceneOptions.key(spec[0])+"_magic_source_capability",
                    scenes.containsValue(spec[0])?"ready:"+BuildConfig.VERSION_CODE:"unavailable:missing_adapter");
            changed.run();
        }
        void refresh(){
            if(closed)return;Object renderer=owner.get();if(renderer==null){close();return;}
            try{
                Map<?,?> current=(Map<?,?>)adapters.get(renderer);
                for(Object key:new ArrayList<>(current.keySet())){
                    String id=scene(current.get(key));
                    if(key instanceof String&&id!=null&&denied(context,id))remove.invoke(renderer,key);
                }
                // Enabling waits for a fresh native business update. Never replay expired orders or reset source deadlines.
            }catch(Exception failure){
                unavailable(failure.getClass().getSimpleName());
            }
        }
        void unavailable(String reason){
            for(String id:scenes.values())FeatureSettings.diagnostic(context,NativeIslandSceneOptions.key(id)+"_magic_source_capability","unavailable:"+reason);
            close();
        }
        void close(){closed=true;FeatureSettings.removeSnapshotListener(changed);main.removeCallbacks(refresh);}
    }
}
