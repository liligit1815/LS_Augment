package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.*;

/** Controls the OEM receiver, preserving RemoteViews, actions, removal, expiry and native user gates. */
final class MagicIslandScenes {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static MagicIslandScenes active;
    private static boolean installed;
    private final Context context;
    private final Object host;
    private final Method remove;
    private final Field cards;
    private boolean closed;
    private final Runnable changed=()->MAIN.post(this::refresh);
    static Method exact(Class<?> type,String name,Class<?> result,Class<?>...args)throws Exception{
        for(Class<?> c=type;c!=null;c=c.getSuperclass()){
            Method m;try{m=c.getDeclaredMethod(name,args);}catch(NoSuchMethodException missing){continue;}
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+":signature");
            m.setAccessible(true);return m;
        }
        throw new NoSuchMethodException(name);
    }
    static Field typed(Class<?> type,String name,Class<?> value)throws Exception{
        for(Class<?> c=type;c!=null;c=c.getSuperclass()){
            Field f;try{f=c.getDeclaredField(name);}catch(NoSuchFieldException missing){continue;}
            if(!value.isAssignableFrom(f.getType())||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+":type");
            f.setAccessible(true);return f;
        }
        throw new NoSuchFieldException(name);
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> app=Class.forName("com.zte.tools.AppTools",false,loader);
            Field flag=app.getField("ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN");
            if(flag.getType()!=boolean.class||!Modifier.isStatic(flag.getModifiers())||!flag.getBoolean(null))return 0;
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method disabled=exact(type,"isDynamicIslandDisabled",boolean.class,String.class);
            exact(type,"handleRemoveIsland",void.class,String.class);typed(type,"mAppIslandList",Map.class);
            Class<?> message=Class.forName("com.zte.toolsdk.common.CardMessage",false,loader);
            Method receive=exact(type,"handleCardMessage",void.class,message,boolean.class);
            Method id=exact(message,"getCardId",String.class);
            module.registerFeatureHook(module.prepareFeatureHook(disabled,"native_island.magic_scene_gate",false).intercept(chain->{
                String key=(String)chain.getArg(0);Object result=chain.proceed();MagicIslandScenes current=active;
                // MultiScreen's SDK prefixes its already package-qualified raw ID. The native settings
                // gate recognizes the raw alias; preserve the wire ID for views, actions and removal.
                if(Boolean.FALSE.equals(result)&&current!=null&&current.host==chain.getThisObject()
                        &&current.selected()&&FeatureSettings.enabled(current.context,NativeIslandSceneOptions.ENABLED)
                        &&"com.zte.multscr_com.zte.multscr.share_transfer".equals(key))
                    result=chain.proceed(new Object[]{"com.zte.multscr.share_transfer"});
                if(Boolean.FALSE.equals(result)&&current!=null&&current.host==chain.getThisObject()&&current.denied(key))return true;
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(receive,"native_island.magic_live_update",false).intercept(chain->{
                MagicIslandScenes current=active;Object messageValue=chain.getArg(0);
                if(current==null||current.host!=chain.getThisObject()||messageValue==null)return chain.proceed();
                boolean recreate=false;
                try{
                    String key=(String)id.invoke(messageValue);
                    if(current.denied(key))return null;
                    // A fresh UPDATE after withdrawal may recreate the card; never replay saved messages.
                    recreate=current.selected()&&FeatureSettings.enabled(current.context,NativeIslandSceneOptions.ENABLED)
                            &&MagicIslandPolicy.scene(key)!=null&&!((Map<?,?>)current.cards.get(current.host)).containsKey(key);
                }catch(Exception failure){current.unavailable(failure);}
                if(recreate)return chain.proceed(new Object[]{messageValue,true});
                return chain.proceed();
            }));
            installed=true;return 2;
        }catch(Throwable missing){module.logFeatureError("MAGIC_ISLAND_SCENE_CONTRACT",missing);return 0;}
    }
    MagicIslandScenes(Context context,Object host)throws Exception{
        if(!installed)throw new IllegalStateException("magic_scene_hooks_missing");
        this.context=context;this.host=host;
        remove=exact(host.getClass(),"handleRemoveIsland",void.class,String.class);
        cards=typed(host.getClass(),"mAppIslandList",Map.class);
    }
    void start(){active=this;FeatureSettings.addSnapshotListener(context,changed);refresh();}
    private boolean selected(){return !closed&&FeatureSettings.enabled(context,ConfigSchema.NATIVE_ISLAND_SELECTED)
            &&!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)&&NativeIslandMode.enabled(context,NativeIslandMode.MODERN);}
    private boolean denied(String key){String scene=MagicIslandPolicy.scene(key);
        return selected()&&scene!=null&&FeatureSettings.enabled(context,NativeIslandSceneOptions.ENABLED)
                &&!FeatureSettings.enabled(context,NativeIslandSceneOptions.key(scene));}
    void refresh(){
        if(closed)return;
        try{
            for(Object key:new ArrayList<>(((Map<?,?>)cards.get(host)).keySet()))
                if(key instanceof String&&denied((String)key))remove.invoke(host,key);
            FeatureSettings.diagnostic(context,MagicIslandPolicy.CAPABILITY,"ready:"+BuildConfig.VERSION_CODE);
        }catch(Exception failure){unavailable(failure);}
    }
    private void unavailable(Exception failure){FeatureSettings.diagnostic(context,MagicIslandPolicy.CAPABILITY,"unavailable:"+failure.getClass().getSimpleName());close();}
    void close(){closed=true;FeatureSettings.removeSnapshotListener(changed);if(active==this)active=null;}
}
