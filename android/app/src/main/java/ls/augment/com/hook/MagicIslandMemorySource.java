package ls.augment.com.hook;

import android.content.Context;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;
import java.util.function.Predicate;
import ls.augment.com.NativeIslandSceneOptions;

/** Completes the OEM collection pipeline's missing calls to its existing card producer. */
final class MagicIslandMemorySource {
    private static final String CARD="com.zte.zmemory.foundation.card.";
    private static final String PIPE="com.zte.zmemory.memorycore.generation.";
    private final Field pendingProducer,resultProducer,context;
    private final Method metadata,instance,init,cardInfo,status,extras,processing,success,failed;
    private final Class<?> raw;
    private final Predicate<Context> selected;
    // Keep only state/identity for de-duplication. Never retain or log collected text or images.
    private final Map<String,Integer> seen=new LinkedHashMap<String,Integer>(){
        @Override protected boolean removeEldestEntry(Map.Entry<String,Integer> e){return size()>128;}
    };
    static void verify(ClassLoader loader)throws Exception{new Contract(loader);}
    private static final class Contract {
        final Class<?> producer,source,operator,raw,info,island;
        final Field pendingProducer,resultProducer,context;
        final Method pending,process,cancel,metadata,instance,init,cardInfo,status,extras,processing,success,failed;
        Contract(ClassLoader l)throws Exception{
            producer=Class.forName(CARD+"ClickFavoriteCardPusher",false,l);
            source=Class.forName(PIPE+"pipeline.source.ClickFavoritePipelineSource",false,l);
            operator=Class.forName(PIPE+"operator.production.ClickFavoriteIslandNotifyOperator",false,l);
            raw=Class.forName(PIPE+"IShortTermToLongTermPipeline$RawData",false,l);
            info=Class.forName(CARD+"CardInfo",false,l);island=Class.forName(CARD+"CardIslandPusher",false,l);
            pendingProducer=MagicIslandScenes.typed(source,"cardPusher",producer);
            resultProducer=MagicIslandScenes.typed(operator,"notifier",producer);
            context=MagicIslandScenes.typed(producer,"mContext",Context.class);
            pending=MagicIslandScenes.exact(source,"getPending",List.class,int.class);
            process=MagicIslandScenes.exact(operator,"process",List.class,List.class);
            cancel=MagicIslandScenes.exact(producer,"pushCancelledCard",void.class,String.class);
            metadata=MagicIslandScenes.exact(raw,"getMetadata",String.class,String.class);
            instance=island.getDeclaredMethod("getInstance",Context.class);
            if(instance.getReturnType()!=island||!Modifier.isStatic(instance.getModifiers()))throw new NoSuchMethodException("memory_getInstance_signature");
            init=MagicIslandScenes.exact(island,"init",boolean.class);
            cardInfo=MagicIslandScenes.exact(island,"getCardInfo",info,String.class);
            status=MagicIslandScenes.exact(info,"getStatus",int.class);extras=MagicIslandScenes.exact(info,"getJumpExtras",Bundle.class);
            processing=MagicIslandScenes.exact(producer,"pushProcessingCard",void.class,String.class,String.class,String.class);
            success=MagicIslandScenes.exact(producer,"pushSuccessCard",void.class,String.class,String.class,String.class,String.class);
            failed=MagicIslandScenes.exact(producer,"pushFailedCard",void.class,String.class,String.class);
        }
    }
    MagicIslandMemorySource(AugmentModule module,ClassLoader loader,Predicate<Context> selected)throws Exception{
        Contract c=new Contract(loader);this.selected=selected;
        pendingProducer=c.pendingProducer;resultProducer=c.resultProducer;context=c.context;raw=c.raw;metadata=c.metadata;
        instance=c.instance;init=c.init;cardInfo=c.cardInfo;status=c.status;extras=c.extras;
        processing=c.processing;success=c.success;failed=c.failed;
        module.registerFeatureHook(module.prepareFeatureHook(c.pending,"native_island.magic_memory_pending",false).intercept(chain->{
            Object result=chain.proceed();
            completeSafely(module,chain.getThisObject(),pendingProducer,result,false);return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(c.process,"native_island.magic_memory_result",false).intercept(chain->{
            Object result=chain.proceed();
            completeSafely(module,chain.getThisObject(),resultProducer,result,true);return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(c.cancel,"native_island.magic_memory_cancel",false).intercept(chain->{
            // Native cancellation remains responsible for its card, operation and 3.6 s expiry.
            Object result=chain.proceed();Object key=chain.getArg(0);
            if(key instanceof String&&validKey((String)key))synchronized(seen){seen.put((String)key,3);}
            return result;
        }));
    }
    private void completeSafely(AugmentModule module,Object owner,Field field,Object result,boolean finished){
        try{
            if(!(result instanceof List)||((List<?>)result).isEmpty())return;
            Object producer=field.get(owner);if(producer==null)return;
            Context c=(Context)context.get(producer);if(c==null||!selected.test(c))return;
            // Connect only when the real collection pipeline runs; do not manufacture a collection.
            Object host=instance.invoke(null,c);if(!Boolean.TRUE.equals(init.invoke(host)))return;
            if(!FeatureSettings.enabled(c,NativeIslandSceneOptions.ENABLED)||!FeatureSettings.enabled(c,NativeIslandSceneOptions.key("ai_memory")))return;
            for(Object row:(List<?>)result){
                if(!raw.isInstance(row))continue;
                String key=(String)metadata.invoke(row,"l1_memory_id");
                if(!validKey(key))key=(String)metadata.invoke(row,"data_id");
                if(!validKey(key))continue;
                String content=finished?(String)metadata.invoke(row,"ai_content"):null;
                int state=!finished?1:content!=null&&!content.isEmpty()?0:2;
                synchronized(seen){
                    Integer before=seen.get(key);
                    if(before!=null&&(before==state||before==3||state==1&&before!=1))continue;
                    // A newer OEM producer may already publish in the original call. Keep its timer.
                    Object current=cardInfo.invoke(host,"aik_island_main_card");
                    Bundle jump=current==null?null:(Bundle)extras.invoke(current);
                    if(jump!=null&&key.equals(jump.getString("guid",""))&&((Integer)status.invoke(current))==state){seen.put(key,state);continue;}
                    if(state==1)processing.invoke(producer,key,null,null);
                    else if(state==0)success.invoke(producer,key,null,null,null);
                    else failed.invoke(producer,key,null);
                    seen.put(key,state);
                }
            }
        }catch(Exception missing){module.logFeatureInfo("MAGIC_MEMORY_SOURCE_UNAVAILABLE "+missing.getClass().getSimpleName());}
    }
    private static boolean validKey(String key){
        if(key==null||key.isEmpty()||key.length()>256)return false;
        for(int i=0;i<key.length();i++)if(Character.isISOControl(key.charAt(i)))return false;
        return true;
    }
}
