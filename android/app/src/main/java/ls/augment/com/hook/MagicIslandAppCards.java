package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.*;
import java.util.*;
import ls.augment.com.*;

/** Original app producer -> original SDK -> original SystemUI views/actions. No message reconstruction. */
final class MagicIslandAppCards {
    private static final String SDK="com.zte.toolsdk.";
    private final Map<String,String> contracts=new LinkedHashMap<>();
    private final String source;
    private final Field contextField,targetField;
    private final Method cardId,connected;
    private final Map<String,String> lastReport=new HashMap<>();
    static void install(AugmentModule module,ClassLoader loader,String source){
        try{new MagicIslandAppCards(module,loader,source);}
        catch(Throwable missing){module.logFeatureError("MAGIC_APP_CONTRACT "+source,missing);}
    }
    private MagicIslandAppCards(AugmentModule module,ClassLoader loader,String source)throws Exception{
        this.source=source;
        Class<?> pusher=Class.forName(SDK+"producer.CardPusher",false,loader);
        Class<?> message=Class.forName(SDK+"common.CardMessage",false,loader);
        contextField=MagicIslandScenes.typed(pusher,"mContext",Context.class);
        targetField=MagicIslandScenes.typed(pusher,"mTargetPackage",String.class);
        cardId=MagicIslandScenes.exact(message,"getCardId",String.class);
        Method connect=MagicIslandScenes.exact(pusher,"connect",boolean.class);
        connected=MagicIslandScenes.exact(pusher,"isConnected",boolean.class);
        Method disconnect=MagicIslandScenes.exact(pusher,"disconnect",void.class);
        // Validate both transport directions before installing any mutation hook.
        Method push=MagicIslandScenes.exact(pusher,"pushCard",boolean.class,message);
        Method update=MagicIslandScenes.exact(pusher,"updateCard",boolean.class,message);
        MagicIslandScenes.exact(pusher,"removeCard",boolean.class,String.class);
        MagicIslandScenes.exact(pusher,"setOnCardMessageActionListener",void.class,
                Class.forName(SDK+"producer.CardPusher$OnCardMessageActionListener",false,loader));
        for(String scene:new String[]{"record","call","meeting","ai","nfc_transfer","ai_memory"}){
            if(!source.equals(MagicIslandPolicy.source(scene)))continue;
            try{verify(loader,scene);contracts.put(scene,"");}
            catch(Exception missing){contracts.put(scene,missing.getClass().getSimpleName()+":"+missing.getMessage());
                module.logFeatureInfo("MAGIC_APP_SCENE_UNAVAILABLE "+scene+":"+missing);}
        }
        if(contracts.isEmpty())return;
        if("".equals(contracts.get("ai_memory")))new MagicIslandMemorySource(module,loader,this::selected);
        module.registerFeatureHook(module.prepareFeatureHook(connect,"native_island.magic_app_connect",false).intercept(chain->{
            Object result=chain.proceed();report(chain.getThisObject(),Boolean.TRUE.equals(result)?"ready":"disconnected",module);return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(disconnect,"native_island.magic_app_disconnect",false).intercept(chain->{
            Object result=chain.proceed();report(chain.getThisObject(),"disconnected",module);return result;
        }));
        for(Method publish:new Method[]{push,update})
            module.registerFeatureHook(module.prepareFeatureHook(publish,"native_island.magic_app_"+publish.getName(),false).intercept(chain->{
                boolean denied=false;
                try{
                    Context context=context(chain.getThisObject());Object card=chain.getArg(0);
                    String scene=card==null?null:scene(source,(String)cardId.invoke(card));
                    report(chain.getThisObject(),Boolean.TRUE.equals(connected.invoke(chain.getThisObject()))?"ready":"disconnected",module);
                    // Unknown sources/versions/receivers keep their original behavior.
                    denied=context!=null&&"".equals(contracts.get(scene))&&selected(context)
                            &&FeatureSettings.enabled(context,NativeIslandSceneOptions.ENABLED)
                            &&!FeatureSettings.enabled(context,NativeIslandSceneOptions.key(scene));
                }catch(Exception failure){module.logFeatureInfo("MAGIC_APP_PUBLISH_UNAVAILABLE "+failure.getClass().getSimpleName());}
                if(denied)return false;
                // Keep the exact message, source actions, expiry, heartbeat and native eligibility checks.
                return chain.proceed();
            }));
    }
    static String scene(String source,String id){
        if(source==null||id==null)return null;
        String full=id.startsWith(source+"_")?id:source+"_"+id;
        if("com.zte.ai.knowledge".equals(source))return MagicIslandPolicy.scene(full);
        return NativeIslandCardProtocol.scene(source,full);
    }
    private Context context(Object pusher)throws Exception{
        if(!"com.android.systemui".equals(targetField.get(pusher)))return null;
        Context c=(Context)contextField.get(pusher);
        return c!=null&&source.equals(c.getPackageName())?c:null;
    }
    private boolean modern(Context c){
        // Foreign app preferences are not Duo's preferences. Read the live SystemUI publication via the provider.
        String published=FeatureSettings.diagnosticValue(c,NativeIslandMode.DIAGNOSTIC);
        String stamp=NativeIslandMode.stamp(c,NativeIslandMode.MODERN);
        return !stamp.isEmpty()&&stamp.equals(published)
                ||published.isEmpty()&&NativeIslandMode.MODERN.equals(NativeIslandMode.detect(c));
    }
    private boolean selected(Context c){return modern(c)
            &&NativeIslandMode.enabled(c,NativeIslandMode.MODERN)&&FeatureSettings.enabled(c,ConfigSchema.NATIVE_ISLAND_SELECTED)
            &&!FeatureSettings.enabled(c,SystemUiOptions.ISLAND);}
    private void report(Object pusher,String state,AugmentModule module){
        try{Context c=context(pusher);if(c==null||!modern(c))return;
            long sourceVersion=c.getPackageManager().getPackageInfo(source,0).lastUpdateTime;
            for(Map.Entry<String,String> item:contracts.entrySet()){
                String value=!item.getValue().isEmpty()?"unavailable:"+item.getValue():"ready".equals(state)?"ready:"+BuildConfig.VERSION_CODE+":"+sourceVersion:"unavailable:"+state;
                synchronized(lastReport){if(value.equals(lastReport.get(item.getKey())))continue;lastReport.put(item.getKey(),value);}
                FeatureSettings.diagnostic(c,NativeIslandSceneOptions.key(item.getKey())+"_magic_source_capability",value);
            }
        }catch(Exception failure){module.logFeatureInfo("MAGIC_APP_CAPABILITY_UNAVAILABLE "+failure.getClass().getSimpleName());}
    }
    private static Class<?> type(ClassLoader l,String name)throws ClassNotFoundException{return Class.forName(name,false,l);}
    private static void method(ClassLoader l,String owner,String name,Class<?> result,boolean isStatic,Class<?>...args)throws Exception{
        Class<?> c=type(l,owner);Method m;
        if(!isStatic){MagicIslandScenes.exact(c,name,result,args);return;}
        m=c.getDeclaredMethod(name,args);
        if(m.getReturnType()!=result||!Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(owner+"."+name+":signature");
    }
    static void verify(ClassLoader l,String scene)throws Exception{
        Class<?> message=type(l,SDK+"common.CardMessage"),remote=type(l,SDK+"widget.RemoteViews");
        if("record".equals(scene)){
            String owner="cn.zte.recorder.common.helper.CardPusherHelper";
            Class<?> card=type(l,owner+"$CardType"),state=type(l,owner+"$RecordState"),action=type(l,owner+"$CardActionListener");
            method(l,owner,"updateCard",void.class,true,card,state,long.class,boolean.class,boolean.class);
            method(l,owner,"removeCard",void.class,true,card);
            method(l,owner,"setCardActionListener",void.class,true,action);
            method(l,"cn.zte.recorder.common.config.CommonConfig","supportFullScreenLiveIsland",boolean.class,true);
        }else if("call".equals(scene)){
            String owner="com.android.incallui.zte.island.IslandCardManager";
            for(String name:new String[]{"createSmallRemoteViews","createLargeRemoteViews","createMiniRemoteViews"})method(l,owner,name,remote,false);
            method(l,owner,"handleLargeIslandClick",void.class,false,int.class);
            method(l,owner,"handleSmallIslandClick",void.class,false);
            method(l,owner,"removeAllCards",void.class,false);
        }else if("meeting".equals(scene)||"ai".equals(scene)){
            Class<?> continuation=type(l,"kotlin.coroutines.Continuation");String owner="com.zte.nebulatranslation.";
            method(l,owner+"ui.IslandManager","notify",Object.class,false,String.class,message,continuation);
            method(l,owner+"ui.IslandManager","cancel",Object.class,false,String.class,continuation);
            method(l,owner+"ui.IslandManager","setCardMessageActionListener",void.class,false,type(l,SDK+"producer.CardPusher$OnCardMessageActionListener"));
            method(l,owner+"domain."+("meeting".equals(scene)?"Transcription":"CallAssistant")+"IslandCardMessageFactory",
                    "create",Object.class,false,type(l,owner+"data.entity.IsLandCardData"),continuation);
        }else if("nfc_transfer".equals(scene)){
            String owner="com.zte.multscr.nfc.NfcFileTransCardMgr";
            method(l,owner,"pushOrUpdateCard",void.class,false,Context.class,message);
            method(l,owner,"handleCardAction",void.class,false,Context.class,int.class);
            method(l,owner,"removeCard",void.class,false,String.class,List.class);
            method(l,owner,"showProgressCard",void.class,false,Context.class,Integer.class,boolean.class,boolean.class);
            method(l,owner,"showSucceedCard",void.class,false,Context.class,String.class,boolean.class);
            method(l,owner,"showFailedCard",void.class,false,Context.class,String.class,boolean.class);
            method(l,owner,"showWaitReceiveCard",void.class,false,Context.class,boolean.class);
            method(l,owner,"showRefusedCanceledCard",void.class,false,Context.class,boolean.class,boolean.class,boolean.class);
            method(l,owner,"showAcceptOrNotCard",void.class,false,Context.class);
            method(l,owner,"showIosConnectingCard",void.class,false,Context.class);
        }else if("ai_memory".equals(scene)){
            MagicIslandMemorySource.verify(l);
            String prefix="com.zte.zmemory.foundation.card.";Class<?> info=type(l,prefix+"CardInfo");
            method(l,prefix+"BaseCardPusher","pushCard",boolean.class,false,info);
            method(l,prefix+"BaseCardPusher","removeCardImmediately",info,false,String.class);
            method(l,prefix+"BaseCardPusher","handleCardClickInternal",void.class,false,String.class,int.class);
            for(String name:new String[]{"createLargeCard","createSmallCard","createMiniCard"})method(l,prefix+"CardIslandPusher",name,remote,false,info);
            method(l,prefix+"CardIslandPusher","onCardClick",boolean.class,false,info);
            method(l,prefix+"ClickFavoriteCardPusher","pushProcessingCard",void.class,false,String.class,String.class,String.class);
            method(l,prefix+"ClickFavoriteCardPusher","pushSuccessCard",void.class,false,String.class,String.class,String.class,String.class);
            method(l,prefix+"ClickFavoriteCardPusher","pushFailedCard",void.class,false,String.class,String.class);
            method(l,prefix+"ClickFavoriteCardPusher","pushCancelledCard",void.class,false,String.class);
            Field id=type(l,prefix+"BaseCardPusher").getDeclaredField("FIXED_ISLAND_CARD_ID");
            if(id.getType()!=String.class||!Modifier.isStatic(id.getModifiers()))throw new NoSuchFieldException("memory_card_id_type");
            id.setAccessible(true);if(!"aik_island_main_card".equals(id.get(null)))throw new IllegalStateException("memory_card_id_changed");
        }else throw new IllegalArgumentException("unknown_scene:"+scene);
    }
}
