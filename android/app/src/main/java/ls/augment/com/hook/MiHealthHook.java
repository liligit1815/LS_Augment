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
import ls.augment.com.StepDailyLimit;
import ls.augment.com.StepRecordSelection;

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
                    try{pin=c.pinAccount();c.transform((List<?>)chain.getArg(1),LOCAL.get(),Boolean.TRUE.equals(chain.getArg(2)));}
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
        int dailyLimit(String id){
            return !id.isEmpty()&&id.equals(FeatureSettings.text(context,ConfigSchema.HEALTH_ACCOUNT,""))
                    &&FeatureSettings.enabled(context,ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED)
                    ?FeatureSettings.integer(context,ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,10000,1,1000000):0;
        }
        List<?> records(long start,long end)throws Exception{
            return records(start,end,false);
        }
        List<?> records(long start,long end,boolean includeDeleted)throws Exception{
            Object dao=TargetReflection.call(database(),"stepRecordItemDao");
            Object query=type("androidx.sqlite.db.SimpleSQLiteQuery").getConstructor(String.class,Object[].class).newInstance(
                    "SELECT * FROM step_record WHERE key=? AND time>=? AND time<?"+(includeDeleted?"":" AND isDeleted=0"),new Object[]{"steps",start,end});
            return (List<?>)TargetReflection.call(dao,"getDailyRecord",query);
        }
        static String recordKey(String sid,long time){return sid+"\n"+time;}
        static final class Budget {
            final StepDailyLimit.Day day;boolean complete=true;
            Budget(long start,long end,long gap,int limit){day=new StepDailyLimit.Day(start,end,gap,limit);}
            void incomplete(){complete=false;day.setComplete(false);}
        }
        Budget budget(String id,long time,int limit,Map<Long,Budget> days)throws Exception{
            if(limit==0)return null;
            ZoneId zone=ZoneId.systemDefault();LocalDate date=Instant.ofEpochSecond(time).atZone(zone).toLocalDate();
            long start=date.atStartOfDay(zone).toEpochSecond(),end=date.plusDays(1).atStartOfDay(zone).toEpochSecond();
            Budget cached=days.get(start);if(cached!=null)return cached;
            Budget result=new Budget(start,end,gap,limit);Set<String> nativeKeys=new HashSet<>();
            try{
                if(!id.equals(identity().id))throw new IllegalStateException("账户正在切换");
                List<Object> items=new ArrayList<>();
                for(Object row:records(start,end)){
                    String sid=(String)TargetReflection.call(row,"getSid");long at=(Long)TargetReflection.call(row,"getTime");
                    int count=new JSONObject((String)TargetReflection.call(row,"getValue")).getInt("steps");
                    result.day.put(sid,at,count);nativeKeys.add(recordKey(sid,at));items.add(item(at,count,sid));
                }
                long detail=result.day.total();
                Object proxy=TargetReflection.singleton(type("com.xiaomi.fitness.aggregation.health.dao.FitnessDailyReportDaoProxy"));
                Object stepType=TargetReflection.field(type(BASE+"export.data.annotation.HomeDataType"),"STEP");
                Object report=TargetReflection.call(proxy,"queryDailyReportEntitySync",stepType,start);
                long summary=report==null?0:((Number)TargetReflection.call(report,"getSteps")).longValue();
                // A summary can arrive before its source records. Wait for those records:
                // a fresh allowance based on that same summary would spend the cap repeatedly.
                if(summary>detail||aggregate(items,start)!=detail)result.incomplete();
            }catch(Exception e){result.incomplete();error("等待当日步数同步，暂停额外增加",e);}
            if(!id.equals(identity().id))throw new IllegalStateException("账户已切换，本轮处理暂停");
            String[] phone=phoneSources();
            // Reserve durable intents even if the native write failed. SID migration must
            // reserve a phone record once, against the native alias actually present.
            for(StepLedger.SavedRecord saved:ledger.records(id,start,end)){
                String sid=saved.sid;
                if(sid.equals(phone[0])||sid.equals(phone[1]))sid=nativeKeys.contains(recordKey(phone[1],saved.time))?phone[1]
                        :nativeKeys.contains(recordKey(phone[0],saved.time))?phone[0]:phone[1];
                int count=new JSONObject(saved.record.output).getInt("steps");
                result.day.put(sid,saved.time,Math.max(count,result.day.get(sid,saved.time)));
            }
            days.put(start,result);return result;
        }
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
        void transform(List<?> entities,boolean local,boolean replaceAll)throws Exception{
            String id=currentAccount();if(id.isEmpty())return;
            String[] phone=phoneSources();
            int percent=enabled(id)&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_MULTIPLY_ENABLED)?FeatureSettings.integer(context,ConfigSchema.HEALTH_MULTIPLIER,100,100,1000):100;
            if(!compatible)return;
            long since;
            try{since=Long.parseLong(FeatureSettings.text(context,ConfigSchema.HEALTH_SINCE,"0"));}catch(Exception ignored){since=Long.MAX_VALUE;}
            int limit=dailyLimit(id);Map<Long,Budget> days=new HashMap<>();
            SQLiteDatabase db=ledger.getWritableDatabase();db.beginTransaction();
            List<Object[]> changes=new ArrayList<>();
            try{
                // Match the native DAO's replace-first-five / insert-ignore path as
                // well as full replacement. Only durable final rows may spend allowance.
                List<String> keys=new ArrayList<>();long firstTime=Long.MAX_VALUE,lastTime=Long.MIN_VALUE;
                for(Object entity:entities){
                    String sid=(String)TargetReflection.call(entity,"getSid");long time=(Long)TargetReflection.call(entity,"getTime");
                    keys.add(recordKey(sid,time));firstTime=Math.min(firstTime,time);lastTime=Math.max(lastTime,time);
                }
                Set<String> existing=new HashSet<>();
                if(!replaceAll&&entities.size()>5)for(Object row:records(firstTime,Math.addExact(lastTime,1),true)){
                    existing.add(recordKey((String)TargetReflection.call(row,"getSid"),(Long)TargetReflection.call(row,"getTime")));
                }
                List<Reading> readings=new ArrayList<>();
                for(int index:StepRecordSelection.effective(keys,replaceAll,existing)){
                    Object entity=entities.get(index);
                    String sid=(String)TargetReflection.call(entity,"getSid");long time=(Long)TargetReflection.call(entity,"getTime");
                    if(!"steps".equals(TargetReflection.call(entity,"getKey")))continue;
                    // A tombstone must not release an intent that a later retry can restore.
                    if(Boolean.TRUE.equals(TargetReflection.call(entity,"isDeleted")))continue;
                    String input=(String)TargetReflection.call(entity,"getValue");JSONObject value=new JSONObject(input);
                    if(!value.has("steps")||value.getLong("steps")<0||value.getLong("steps")>Integer.MAX_VALUE)continue;
                    StepLedger.Record old=savedRecord(id,sid,time,phone);
                    Reading reading=new Reading();reading.entity=entity;reading.sid=sid;reading.time=time;reading.input=input;
                    reading.old=old;reading.budget=budget(id,time,limit,days);
                    int rate=time>=since?percent:100;
                    if(old!=null&&((old.generated&&!local)||(!local&&sameReading(input,old.output))||sameReading(input,old.raw)||old.token.equals(value.optString("_lsAugment")))){
                        reading.output=old.output;reading.floor=reading.desired=new JSONObject(old.output).getInt("steps");
                    }else{
                        JSONObject raw=new JSONObject(input);raw.remove("_lsAugment");reading.raw=raw.toString();
                        int oldRaw=old==null?0:new JSONObject(old.raw).getInt("steps"),oldOutput=old==null?0:new JSONObject(old.output).getInt("steps");
                        reading.floor=StepDailyLimit.naturalOutput(raw.getInt("steps"),oldRaw,oldOutput);
                        reading.desired=old!=null&&old.generated?reading.floor:StepDailyLimit.requestedOutput(raw.getInt("steps"),oldRaw,oldOutput,rate);
                        reading.persist=old!=null||rate!=100||limit!=0;
                    }
                    if(reading.budget!=null)reading.budget.day.put(sid,time,reading.floor);
                    readings.add(reading);
                }
                for(Reading reading:readings){
                    String output=reading.output==null?reading.input:reading.output;
                    if(reading.persist){
                        int steps=reading.budget==null?reading.desired:reading.budget.day.cap(reading.sid,reading.time,reading.floor,reading.desired);
                        String token=reading.old==null?UUID.randomUUID().toString():reading.old.token;
                        output=new JSONObject(reading.raw).put("steps",steps).put("_lsAugment",token).toString();
                        ledger.put(id,reading.sid,reading.time,new StepLedger.Record(reading.raw,output,token,reading.old!=null&&reading.old.generated));
                    }
                    if(!reading.input.equals(output))changes.add(new Object[]{reading.entity,output,Boolean.TRUE.equals(TargetReflection.call(reading.entity,"isUpload"))&&!sameReading(reading.input,output)});
                }
                db.setTransactionSuccessful();
            }finally{db.endTransaction();}
            // The intent is durable before any entity is changed. Retries reuse the same output.
            for(Object[] change:changes){TargetReflection.call(change[0],"setRecordValue",change[1]);if(Boolean.TRUE.equals(change[2]))TargetReflection.call(change[0],"setUpload",false);}
        }
        static final class Reading {
            Object entity;String sid,input,raw,output;long time;int floor,desired;boolean persist;
            StepLedger.Record old;Budget budget;
        }
        void reconcile()throws Exception{
            try(StepLedger.Guard guard=ledger.guard();AccountPin pin=pinAccount()){reconcileLocked();}
        }
        void reconcileLocked()throws Exception{
            String id=currentAccount();if(id.isEmpty()||!compatible)return;
            long now=System.currentTimeMillis()/1000;
            // Snapshot version-1 awards before admitting any newly scheduled requests.
            // Otherwise a new plan sharing an old minute would inherit unlimited credit.
            Map<Long,Integer> priorDue=ledger.admitted(id);
            if(!priorDue.isEmpty()){
                Set<Long> legacyMinutes=new HashSet<>();
                long start=Collections.min(priorDue.keySet()),end=Math.addExact(Collections.max(priorDue.keySet()),60);
                for(StepLedger.SavedRecord saved:ledger.records(id,start,end))if(saved.record.generated)legacyMinutes.add(saved.time/60*60);
                for(Map.Entry<Long,Integer> event:priorDue.entrySet())if(legacyMinutes.contains(event.getKey())&&ledger.award(id,event.getKey())==null)
                    ledger.award(id,event.getKey(),event.getValue(),event.getValue());
            }
            StepPlan p=StepPlan.parse(FeatureSettings.text(context,ConfigSchema.HEALTH_PLAN,""));
            if(enabled(id)&&FeatureSettings.enabled(context,ConfigSchema.HEALTH_PLAN_ENABLED)&&p!=null&&p.account.equals(id))ledger.admit(p,now-60);
            Map<Long,Integer> due=ledger.admitted(id);Map<Long,Integer> buckets=new TreeMap<>();
            ZoneId zone=ZoneId.systemDefault();
            for(Map.Entry<Long,Integer> e:due.entrySet()){
                long day=Instant.ofEpochSecond(e.getKey()).atZone(zone).toLocalDate().atStartOfDay(zone).toEpochSecond();
                long bucket=day+(e.getKey()-day)/gap*gap;buckets.merge(bucket,e.getValue(),Math::addExact);
            }
            int changed=0;pendingUploads=0;int limit=dailyLimit(id);Map<Long,Budget> days=new HashMap<>();
            for(Map.Entry<Long,Integer> bucket:buckets.entrySet())if(reconcileBucket(id,bucket.getKey(),bucket.getValue(),due,budget(id,bucket.getKey(),limit,days)))changed++;
            if((changed>0||pendingUploads>0)&&now-lastSync>=60&&id.equals(identity().id)){
                Object syncer=TargetReflection.call(utils(),"getServerSyncer");
                Class<?> callback=type(BASE+"export.api.FitnessServerSyncCallback");
                Object result=Proxy.newProxyInstance(loader,new Class<?>[]{callback},(proxy,method,args)->{
                    if(method.getDeclaringClass()==Object.class){if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                        if(method.getName().equals("equals"))return proxy==args[0];return "LS-health-sync";}
                    if(method.getName().equals("onSyncResult"))FeatureSettings.diagnostic(context,"ls_augment_health_sync",
                            (Boolean.TRUE.equals(args[0])?"已收到同步响应，完成情况以待同步记录为准":"原厂同步未完成，将按原厂流程重试")+"；ts="+System.currentTimeMillis());
                    return null;
                });
                // Xiaomi applies a 24-hour interval to manual requests made in
                // the background. Use its normal automatic-sync route, which
                // retains account, network, cloud-switch and interval checks.
                lastSync=now;TargetReflection.call(syncer,"syncWithServer",false,"auto_sync",result);
            }
            lastError="";
            int admitted=due.values().stream().mapToInt(Integer::intValue).sum();
            boolean incomplete=days.values().stream().anyMatch(day->!day.complete);
            FeatureSettings.diagnostic(context,"ls_augment_health_runtime","已接入保存与同步；计划累计已到时 "+admitted+" 步；本轮更新 "+changed+" 个时间段；待同步 "+(changed>0?"核对中":pendingUploads+" 段")+"；"+(enabled(id)?"配置生效":"已停止新增")+(limit>0?"；当日上限 "+limit+(incomplete?"，等待详细步数同步":""):"")+"；ts="+System.currentTimeMillis());
        }
        boolean reconcileBucket(String id,long bucket,int bonus,Map<Long,Integer> due,Budget budget)throws Exception{
            Object db=database(),dao=TargetReflection.call(db,"stepRecordItemDao");
            Class<?> query=type("androidx.sqlite.db.SimpleSQLiteQuery");
            Object q=query.getConstructor(String.class,Object[].class).newInstance(
                    "SELECT * FROM step_record WHERE key=? AND time>=? AND time<? AND isDeleted=0",new Object[]{"steps",bucket,bucket+gap});
            List<?> records=(List<?>)TargetReflection.call(dao,"getDailyRecord",q);
            String[] phoneFamily=phoneSources();String phone=phoneFamily[1];
            Map<String,Long> natural=new LinkedHashMap<>();
            Map<Long,Object> generated=new TreeMap<>();
            Map<Long,StepLedger.Record> generatedLedgers=new TreeMap<>();
            Map<Long,Long> generatedTimes=new TreeMap<>();
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
                        generated.put(minute,record);generatedLedgers.put(minute,saved);generatedTimes.put(minute,at);
                    }else obsolete.add(record);
                    if(!sid.equals(phone)&&!obsolete.contains(record))obsolete.add(record);
                    count=new JSONObject(saved.raw).optInt("steps",0);
                }
                natural.merge(sid,(long)count,Math::addExact);
            }
            // A committed intent can outlive a failed native write. Reuse its timestamp,
            // token and allowance on retry instead of creating a second bonus record.
            for(StepLedger.SavedRecord pending:ledger.records(id,bucket,bucket+gap)){
                if(!pending.record.generated||(!pending.sid.equals(phoneFamily[0])&&!pending.sid.equals(phone)))continue;
                long minute=pending.time/60*60;
                if(!generatedLedgers.containsKey(minute)){
                    generatedLedgers.put(minute,pending.record);generatedTimes.put(minute,pending.time);
                    natural.merge(phone,(long)new JSONObject(pending.record.raw).getInt("steps"),Math::addExact);
                }
                occupied.add(pending.time);
            }
            int compensation=StepMath.phoneAddition(natural,phone,bonus)-bonus;
            List<Object> models=new ArrayList<>();boolean first=true;
            SQLiteDatabase intents=ledger.getWritableDatabase();intents.beginTransaction();
            try{for(Map.Entry<Long,Integer> event:due.entrySet()){
                long minute=event.getKey();if(minute<bucket||minute>=bucket+gap)continue;
                Object existing=generated.get(minute);StepLedger.Record saved=generatedLedgers.get(minute);
                StepLedger.Award award=ledger.award(id,minute);
                int previouslyRequested=award==null?0:award.requested;
                int allowed=award==null?0:award.allowed;
                int additional=Math.max(0,event.getValue()-previouslyRequested);
                boolean decide=budget==null||budget.complete;
                // Retry already reserved writes while details catch up, but leave new
                // requests undecided so temporary sync gaps do not discard the plan.
                if(!decide)additional=0;
                if(allowed==0&&additional==0&&saved==null)continue;
                long targetTime=generatedTimes.getOrDefault(minute,-1L);
                if(targetTime<0)for(long t=minute+59;t>=minute;t--)if(!occupied.contains(t)){targetTime=t;break;}
                if(targetTime<0)throw new IllegalStateException("目标分钟没有可用记录位置");
                JSONObject raw=saved==null?new JSONObject().put("time",targetTime).put("steps",0).put("distance",0).put("calories",0):new JSONObject(saved.raw);
                int floor=saved==null?raw.getInt("steps"):new JSONObject(saved.output).getInt("steps");
                if(existing!=null)floor=Math.max(floor,new JSONObject((String)TargetReflection.call(existing,"getValue")).getInt("steps"));
                long base=(long)raw.getInt("steps")+allowed+(first?compensation:0);
                int withoutNew=(int)Math.max(floor,Math.min(Integer.MAX_VALUE,base));
                int desired=(int)Math.max(floor,Math.min(Integer.MAX_VALUE,base+additional));
                if(budget!=null)desired=budget.day.cap(phone,targetTime,floor,desired);
                int approved=Math.min(additional,Math.max(0,desired-withoutNew));
                if(decide)ledger.award(id,minute,Math.max(event.getValue(),previouslyRequested),Math.addExact(allowed,approved));
                if(desired==0&&existing==null&&saved==null)continue;
                first=false;occupied.add(targetTime);
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
            }intents.setTransactionSuccessful();}finally{intents.endTransaction();}
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
