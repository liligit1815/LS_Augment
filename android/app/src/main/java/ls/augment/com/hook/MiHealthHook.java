package ls.augment.com.hook;

import android.app.Application;
import android.content.Context;
import android.os.*;
import android.os.Process;
import android.database.sqlite.SQLiteDatabase;
import org.json.JSONObject;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.*;
import java.util.*;
import ls.augment.com.ConfigSchema;
import ls.augment.com.StepMath;
import ls.augment.com.StepPlan;

/** Changes stored step records through Xiaomi's DAO and normal upload path. */
final class MiHealthHook {
    private static final String BASE="com.xiaomi.fit.fitness.";
    private static final ThreadLocal<Boolean> LOCAL=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Boolean> GENERATED=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Object> PINNED_DB=new ThreadLocal<>();
    private static final ThreadLocal<String> PINNED_ACCOUNT=new ThreadLocal<>();
    private static Controller controller;
    private static boolean installed;

    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        try{
            Class<?> utils=Class.forName(BASE+"persist.db.utils.DailyRecordDaoUtils",false,loader);
            Method local=utils.getDeclaredMethod("recordDailyRecordToDB",String.class,String.class,List.class,boolean.class);
            Method insert=utils.getDeclaredMethod("insertDailyRecordToDb",String.class,List.class,boolean.class);
            Class<?> database=Class.forName(BASE+"persist.db.FitnessDatabase$Companion",false,loader);
            Method instance=database.getDeclaredMethod("getInstance");
            module.registerFeatureHook(module.prepareFeatureHook(instance,"health.account.database",true).intercept(chain->{
                Object pinned=PINNED_DB.get();return pinned==null?chain.proceed():pinned;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(local,"health.local",true).intercept(chain->{
                boolean old=LOCAL.get();LOCAL.set(true);
                try{return chain.proceed();}finally{LOCAL.set(old);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(insert,"health.persist",true).intercept(chain->{
                Controller c=ensure(module,loader);
                if(c==null||!"steps".equals(chain.getArg(0))||GENERATED.get())return chain.proceed();
                StepLedger.Guard guard;
                try{guard=c.ledger.guard();}catch(Exception e){c.error("等待记录写入",e);return chain.proceed();}
                try(guard){
                    Controller.AccountPin pin=null;
                    try{pin=c.pinAccount();c.transform((List<?>)chain.getArg(1),LOCAL.get());}
                    catch(Throwable e){c.error("保存适配失败",e);}
                    try{Object result=chain.proceed();c.request();return result;}
                    finally{if(pin!=null)pin.close();}
                }
            }));
            installed=true;
            Handler main=new Handler(Looper.getMainLooper());
            main.postDelayed(new Runnable(){public void run(){if(ensure(module,loader)==null)main.postDelayed(this,1500);}},1500);
        }catch(Throwable e){module.logFeatureError("MI_HEALTH_INSTALL",e);}
    }
    static synchronized Controller ensure(AugmentModule module,ClassLoader loader){
        if(controller!=null)return controller;
        Context c=FeatureSettings.from(null);
        if(c==null||!c.getPackageName().equals("com.mi.health"))return null;
        controller=new Controller(module,c,loader);return controller;
    }
    static final class Controller {
        final AugmentModule module;final Context context;final ClassLoader loader;
        final Handler worker;final StepLedger ledger;
        volatile boolean compatible;volatile long gap;String account="",lastError="";long lastSync;int pendingUploads;
        Controller(AugmentModule module,Context context,ClassLoader loader){
            this.module=module;this.context=context;this.loader=loader;ledger=new StepLedger(context);
            HandlerThread t=new HandlerThread("LS-health-records",Process.THREAD_PRIORITY_BACKGROUND);t.start();worker=new Handler(t.getLooper());
            FeatureSettings.addSnapshotListener(context,this::request);worker.post(tick);
        }
        final Runnable tick=new Runnable(){public void run(){
            try{refreshIdentity();if(!compatible)checkAdapter();reconcile();}
            catch(Throwable e){error("等待健康应用初始化",e);}
            worker.postDelayed(this,30000);
        }};
        final Runnable requested=()->{try{refreshIdentity();if(!compatible)checkAdapter();reconcile();}catch(Throwable e){error("步数处理失败",e);}};
        void request(){worker.removeCallbacks(requested);worker.postDelayed(requested,1200);}
        Class<?> type(String name)throws ClassNotFoundException{return Class.forName(name,false,loader);}
        Object utils()throws ReflectiveOperationException{return TargetReflection.singleton(type(BASE+"persist.db.utils.DailyRecordDaoUtils"));}
        Object database()throws ReflectiveOperationException{return TargetReflection.call(TargetReflection.singleton(type(BASE+"persist.db.FitnessDatabase")),"getInstance");}
        String currentAccount()throws Exception{
            String pinned=PINNED_ACCOUNT.get();return pinned!=null?pinned:identity().id;
        }
        static final class Identity {final String id;final Object database;Identity(String id,Object database){this.id=id;this.database=database;}}
        Identity identity()throws Exception{
            Class<?> accountClass=type("com.xiaomi.fitness.account.manager.AccountManager");
            Object manager=TargetReflection.call(type("com.xiaomi.fitness.account.extensions.AccountManagerExtKt"),"getInstance",TargetReflection.singleton(accountClass));
            Object id=TargetReflection.call(manager,"getUserId");
            if(!(id instanceof String)||((String)id).isEmpty())return new Identity("",null);
            Object db=database(),helper=TargetReflection.call(db,"getOpenHelper");
            String path=String.valueOf(TargetReflection.call(helper,"getDatabaseName"));
            if(!id.equals(TargetReflection.call(manager,"getUserId")))throw new IllegalStateException("账户正在切换");
            return new Identity(hash((Process.myUid()/100000)+"|"+id+"|"+path),db);
        }
        final class AccountPin implements AutoCloseable {
            final String previousAccount=PINNED_ACCOUNT.get();final Object previousDb=PINNED_DB.get();
            AccountPin()throws Exception{if(previousAccount==null){Identity v=identity();PINNED_ACCOUNT.set(v.id);if(v.database!=null)PINNED_DB.set(v.database);}}
            @Override public void close(){if(previousAccount==null)PINNED_ACCOUNT.remove();else PINNED_ACCOUNT.set(previousAccount);
                if(previousDb==null)PINNED_DB.remove();else PINNED_DB.set(previousDb);}
        }
        AccountPin pinAccount()throws Exception{return new AccountPin();}
        void refreshIdentity()throws Exception{
            account=currentAccount();
            FeatureSettings.diagnostic(context,"ls_augment_health_account_runtime",account);
            FeatureSettings.diagnostic(context,"ls_augment_health_heartbeat",""+System.currentTimeMillis());
            if(account.isEmpty())FeatureSettings.diagnostic(context,"ls_augment_health_runtime","已接入，等待在小米运动健康选择地区并登录账户");
        }
        boolean enabled(String id){return !id.isEmpty()&&id.equals(FeatureSettings.text(context,ConfigSchema.HEALTH_ACCOUNT,""))
                &&FeatureSettings.enabled(context,ConfigSchema.HEALTH_ENABLED);}
        String[] phoneSources()throws Exception{
            Object manager=TargetReflection.call(type("com.xiaomi.fitness.device.manager.export.DeviceManagerExtKt"),"getInstance",
                    TargetReflection.singleton(type("com.xiaomi.fitness.device.manager.export.WearableDeviceManager")));
            String local=(String)TargetReflection.call(manager,"getLocalPhoneSid"),server=(String)TargetReflection.call(manager,"getCurrentPhoneSid");
            if(local==null||local.isEmpty())throw new IllegalStateException("手机记录来源尚未就绪");
            return new String[]{local,server==null||server.isEmpty()?local:server};
        }
        StepLedger.Record savedRecord(String id,String sid,long at,String[] phone){
            StepLedger.Record saved=ledger.get(id,sid,at);
            if(saved==null&&(sid.equals(phone[0])||sid.equals(phone[1]))){
                saved=ledger.get(id,sid.equals(phone[0])?phone[1]:phone[0],at);
                if(saved!=null)ledger.put(id,sid,at,saved);
            }
            return saved;
        }
        Object item(long at,int steps,String sid)throws Exception{
            Object i=type(BASE+"export.data.item.StepItem").getConstructor(long.class,int.class,int.class,float.class).newInstance(at,steps,0,0f);
            TargetReflection.call(i,"setSid",sid);return i;
        }
        int aggregate(List<Object> values,long day)throws Exception{
            Object biz=type("com.xiaomi.fitness.repo.step.StepBiz").getConstructor().newInstance();
            Map<String,List<Object>> map=new HashMap<>();map.put("steps",values);
            Object report=TargetReflection.call(biz,"splitDailyReport",null,"days",day,map);
            return (Integer)TargetReflection.call(report,"getSteps");
        }
        void checkAdapter()throws Exception{
            gap=((Number)TargetReflection.field(type("com.xiaomi.fitness.repo.RepositoryManager"),"GAP_X_MINUTE")).longValue();
            if(gap<60||gap>3600||86400%gap!=0)throw new IllegalStateException("未识别步数合并间隔");
            long day=LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toEpochSecond();
            List<Object> before=new ArrayList<>(Arrays.asList(item(day+60,100,"phone"),item(day+120,200,"watch")));
            if(aggregate(before,day)!=200)throw new IllegalStateException("原厂来源合并方式已变化");
            before.add(item(day+180,223,"phone"));
            if(aggregate(before,day)!=323)throw new IllegalStateException("新增步数合并验证未通过");
            // Exercise the installed Room implementation in memory, with no account database,
            // sync callbacks, or outer recordDailyRecordToDB notifications involved.
            Object builder=TargetReflection.call(type("androidx.room.Room"),"inMemoryDatabaseBuilder",context,type(BASE+"persist.db.FitnessDatabase"));
            Object temporary=TargetReflection.call(builder,"build");
            try{
                Object dao=TargetReflection.call(temporary,"stepRecordItemDao");
                Object row=type(BASE+"persist.db.internal.StepRecordEntity").getConstructor(String.class,String.class,long.class).newInstance("steps","lsa-check",day+60);
                Object model=type(BASE+"DailyRecordItemModel").getConstructor(long.class,int.class,type(BASE+"export.data.item.DailyRecordItem"))
                        .newInstance(day+60,ZoneId.systemDefault().getRules().getOffset(Instant.ofEpochSecond(day+60)).getTotalSeconds(),item(day+60,10,"lsa-check"));
                TargetReflection.call(row,"setFromLocalRecord",model);
                TargetReflection.call(dao,"insertReplaceAll",Collections.singletonList(row));
                JSONObject value=new JSONObject((String)TargetReflection.call(row,"getValue"));value.put("steps",11);
                TargetReflection.call(row,"setRecordValue",value.toString());
                TargetReflection.call(dao,"insertReplaceAll",Collections.singletonList(row));
                Object q=type("androidx.sqlite.db.SimpleSQLiteQuery").getConstructor(String.class,Object[].class)
                        .newInstance("SELECT * FROM step_record WHERE key=? AND sid=? AND time=?",new Object[]{"steps","lsa-check",day+60});
                List<?> saved=(List<?>)TargetReflection.call(dao,"getDailyRecord",q);
                if(saved.size()!=1||new JSONObject((String)TargetReflection.call(saved.get(0),"getValue")).getInt("steps")!=11
                        ||Boolean.TRUE.equals(TargetReflection.call(saved.get(0),"isUpload"))||Boolean.TRUE.equals(TargetReflection.call(saved.get(0),"isDeleted")))
                    throw new IllegalStateException("原厂记录替换或待同步标记校验未通过");
            }finally{TargetReflection.call(temporary,"close");}
            compatible=true;lastError="";
            FeatureSettings.diagnostic(context,"ls_augment_health_compatibility","通过：原厂临时数据库写入、去重、待同步标记与多来源合并校验");
        }
        void transform(List<?> entities,boolean local)throws Exception{
            String id=currentAccount();if(id.isEmpty())return;
            String[] phone=phoneSources();
            int percent=enabled(id)&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_MULTIPLY_ENABLED)?FeatureSettings.integer(context,ConfigSchema.HEALTH_MULTIPLIER,100,100,2000):100;
            if(!compatible)return;
            long since;
            try{since=Long.parseLong(FeatureSettings.text(context,ConfigSchema.HEALTH_SINCE,"0"));}catch(Exception ignored){since=Long.MAX_VALUE;}
            SQLiteDatabase db=ledger.getWritableDatabase();db.beginTransaction();
            List<Object[]> changes=new ArrayList<>();
            try{
                for(Object entity:entities){
                    if(!"steps".equals(TargetReflection.call(entity,"getKey"))||Boolean.TRUE.equals(TargetReflection.call(entity,"isDeleted")))continue;
                    String sid=(String)TargetReflection.call(entity,"getSid");long time=(Long)TargetReflection.call(entity,"getTime");
                    String input=(String)TargetReflection.call(entity,"getValue");JSONObject value=new JSONObject(input);
                    if(!value.has("steps")||value.getLong("steps")<0||value.getLong("steps")>Integer.MAX_VALUE)continue;
                    StepLedger.Record old=savedRecord(id,sid,time,phone);
                    String output=input;
                    if(old!=null&&((old.generated&&!local)||(!local&&sameReading(input,old.output))||old.token.equals(value.optString("_lsAugment"))))output=old.output;
                    else if(old!=null&&!local&&sameReading(input,old.raw))output=old.output;
                    else{
                        int rate=time>=since?percent:100;
                        if(old==null&&rate==100)continue;
                        JSONObject raw=new JSONObject(input);raw.remove("_lsAugment");
                        String token=old==null?UUID.randomUUID().toString():old.token;
                        // Previously generated bonus rows are reconciled separately and never multiplied.
                        int steps=old!=null&&old.generated?raw.getInt("steps"):StepMath.multiply(raw.getInt("steps"),rate);
                        value.put("steps",steps);value.put("_lsAugment",token);output=value.toString();
                        ledger.put(id,sid,time,new StepLedger.Record(raw.toString(),output,token,old!=null&&old.generated));
                    }
                    if(!input.equals(output))changes.add(new Object[]{entity,output,Boolean.TRUE.equals(TargetReflection.call(entity,"isUpload"))&&!sameReading(input,output)});
                }
                db.setTransactionSuccessful();
            }finally{db.endTransaction();}
            // The intent is durable before any entity is changed. Retries reuse the same output.
            for(Object[] change:changes){TargetReflection.call(change[0],"setRecordValue",change[1]);if(Boolean.TRUE.equals(change[2]))TargetReflection.call(change[0],"setUpload",false);}
        }
        void reconcile()throws Exception{
            try(StepLedger.Guard guard=ledger.guard();AccountPin pin=pinAccount()){reconcileLocked();}
        }
        void reconcileLocked()throws Exception{
            String id=currentAccount();if(id.isEmpty()||!compatible)return;
            long now=System.currentTimeMillis()/1000;
            StepPlan p=StepPlan.parse(FeatureSettings.text(context,ConfigSchema.HEALTH_PLAN,""));
            if(enabled(id)&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_PLAN_ENABLED)&&p!=null&&p.account.equals(id))ledger.admit(p,now-60);
            Map<Long,Integer> due=ledger.admitted(id);Map<Long,Integer> buckets=new TreeMap<>();
            ZoneId zone=ZoneId.systemDefault();
            for(Map.Entry<Long,Integer> e:due.entrySet()){
                long day=Instant.ofEpochSecond(e.getKey()).atZone(zone).toLocalDate().atStartOfDay(zone).toEpochSecond();
                long bucket=day+(e.getKey()-day)/gap*gap;buckets.merge(bucket,e.getValue(),Math::addExact);
            }
            int changed=0;pendingUploads=0;
            for(Map.Entry<Long,Integer> bucket:buckets.entrySet())if(reconcileBucket(id,bucket.getKey(),bucket.getValue(),due))changed++;
            if((changed>0||pendingUploads>0)&&now-lastSync>=60&&id.equals(identity().id)){
                Object syncer=TargetReflection.call(utils(),"getServerSyncer");
                Class<?> callback=type(BASE+"export.api.FitnessServerSyncCallback");
                Object result=Proxy.newProxyInstance(loader,new Class<?>[]{callback},(proxy,method,args)->{
                    if(method.getDeclaringClass()==Object.class){if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                        if(method.getName().equals("equals"))return proxy==args[0];return "LS-health-sync";}
                    if(method.getName().equals("onSyncResult"))FeatureSettings.diagnostic(context,"ls_augment_health_sync",
                            (Boolean.TRUE.equals(args[0])?"原厂同步完成":"原厂同步未完成，将按原厂流程重试")+"；ts="+System.currentTimeMillis());
                    return null;
                });
                lastSync=now;TargetReflection.call(syncer,"syncWithServer",false,"manual",result);
            }
            lastError="";
            int admitted=due.values().stream().mapToInt(Integer::intValue).sum();
            FeatureSettings.diagnostic(context,"ls_augment_health_runtime","已接入保存与同步；计划累计已到时 "+admitted+" 步；本轮更新 "+changed+" 个时间段；待同步 "+pendingUploads+" 段；"+(enabled(id)?"配置生效":"已停止新增")+"；ts="+System.currentTimeMillis());
        }
        boolean reconcileBucket(String id,long bucket,int bonus,Map<Long,Integer> due)throws Exception{
            Object db=database(),dao=TargetReflection.call(db,"stepRecordItemDao");
            Class<?> query=type("androidx.sqlite.db.SimpleSQLiteQuery");
            Object q=query.getConstructor(String.class,Object[].class).newInstance(
                    "SELECT * FROM step_record WHERE key=? AND time>=? AND time<? AND isDeleted=0",new Object[]{"steps",bucket,bucket+gap});
            List<?> records=(List<?>)TargetReflection.call(dao,"getDailyRecord",q);
            String[] phoneFamily=phoneSources();String phone=phoneFamily[1];
            Map<String,Long> natural=new LinkedHashMap<>();
            Map<Long,Object> generated=new TreeMap<>();
            Map<Long,StepLedger.Record> generatedLedgers=new TreeMap<>();
            List<Object> obsolete=new ArrayList<>();
            Set<Long> occupied=new HashSet<>();
            for(Object record:records){
                String sid=(String)TargetReflection.call(record,"getSid");long at=(Long)TargetReflection.call(record,"getTime");
                String json=(String)TargetReflection.call(record,"getValue");StepLedger.Record saved=savedRecord(id,sid,at,phoneFamily);
                int count=new JSONObject(json).getInt("steps");
                if(sid.equals(phone))occupied.add(at);
                if(saved!=null&&saved.generated&&(sid.equals(phoneFamily[0])||sid.equals(phoneFamily[1]))){
                    if(!Boolean.TRUE.equals(TargetReflection.call(record,"isUpload")))pendingUploads++;
                    long minute=at/60*60;
                    Object previous=generated.get(minute);
                    if(previous==null||sid.equals(phone)){
                        if(previous!=null)obsolete.add(previous);
                        generated.put(minute,record);generatedLedgers.put(minute,saved);
                    }else obsolete.add(record);
                    if(!sid.equals(phone)&&!obsolete.contains(record))obsolete.add(record);
                    count=new JSONObject(saved.raw).optInt("steps",0);
                }
                natural.merge(sid,(long)count,Math::addExact);
            }
            int compensation=StepMath.phoneAddition(natural,phone,bonus)-bonus;
            List<Object> models=new ArrayList<>();boolean first=true;
            for(Map.Entry<Long,Integer> event:due.entrySet()){
                long minute=event.getKey();if(minute<bucket||minute>=bucket+gap)continue;
                Object existing=generated.get(minute);StepLedger.Record saved=generatedLedgers.get(minute);
                long targetTime=existing==null?-1:(Long)TargetReflection.call(existing,"getTime");
                if(targetTime<0)for(long t=minute+59;t>=minute;t--)if(!occupied.contains(t)){targetTime=t;break;}
                if(targetTime<0)throw new IllegalStateException("目标分钟没有可用记录位置");
                JSONObject raw=saved==null?new JSONObject().put("time",targetTime).put("steps",0).put("distance",0).put("calories",0):new JSONObject(saved.raw);
                int desired=Math.addExact(raw.getInt("steps"),Math.addExact(event.getValue(),first?compensation:0));first=false;
                if(existing!=null&&phone.equals(TargetReflection.call(existing,"getSid"))
                        &&new JSONObject((String)TargetReflection.call(existing,"getValue")).getInt("steps")==desired)continue;
                String token=saved==null?UUID.randomUUID().toString():saved.token;
                JSONObject output=new JSONObject(raw.toString()).put("steps",desired).put("_lsAugment",token);
                ledger.put(id,phone,targetTime,new StepLedger.Record(raw.toString(),output.toString(),token,true));
                Object step=type(BASE+"export.data.item.StepItem").getConstructor(long.class,int.class,int.class,float.class)
                        .newInstance(targetTime,desired,raw.optInt("distance",0),(float)raw.optDouble("calories",0));
                TargetReflection.call(step,"setSid",phone);
                int offset=ZoneId.systemDefault().getRules().getOffset(Instant.ofEpochSecond(targetTime)).getTotalSeconds();
                models.add(type(BASE+"DailyRecordItemModel").getConstructor(long.class,int.class,type(BASE+"export.data.item.DailyRecordItem")).newInstance(targetTime,offset,step));
            }
            if(models.isEmpty()&&obsolete.isEmpty())return false;
            if(!id.equals(identity().id))throw new IllegalStateException("账户已切换，本轮计划暂停");
            boolean prior=GENERATED.get();GENERATED.set(true);
            Object previousDb=PINNED_DB.get();PINNED_DB.set(db);
            try{
                if(!models.isEmpty()&&!Boolean.TRUE.equals(TargetReflection.call(utils(),"recordDailyRecordToDB","steps",phone,models,true)))
                    throw new IllegalStateException("健康应用拒绝保存本段记录");
                // Xiaomi migrates local phone rows to its registered server SID after upload.
                // Remove only ledger-owned duplicate rows, after the canonical row is durable.
                if(!obsolete.isEmpty())TargetReflection.call(utils(),"hardDeleteDailyRecord","steps",obsolete);
            }finally{GENERATED.set(prior);if(previousDb==null)PINNED_DB.remove();else PINNED_DB.set(previousDb);}
            return true;
        }
        void error(String stage,Throwable e){
            Throwable cause=e instanceof InvocationTargetException&&e.getCause()!=null?e.getCause():e;
            String message=stage+"："+cause.getClass().getSimpleName()+" "+Objects.toString(cause.getMessage(),"");
            if(!message.equals(lastError)){lastError=message;FeatureSettings.diagnostic(context,"ls_augment_health_runtime",message);module.logFeatureError("HEALTH",cause);}
        }
    }
    static boolean sameReading(String a,String b){
        try{JSONObject x=new JSONObject(a),y=new JSONObject(b);return x.optLong("time")==y.optLong("time")&&x.getLong("steps")==y.getLong("steps")
                &&x.optLong("distance")==y.optLong("distance")&&Double.compare(x.optDouble("calories",0),y.optDouble("calories",0))==0;}catch(Exception e){return false;}
    }
    static String hash(String value)throws Exception{
        byte[] bytes=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));StringBuilder out=new StringBuilder();
        for(byte b:bytes)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();
    }
}
