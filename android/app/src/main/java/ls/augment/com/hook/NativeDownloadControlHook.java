package ls.augment.com.hook;

import android.app.*;
import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import org.json.*;
import ls.augment.com.IslandDownloadConfig;
import ls.augment.com.IslandDownloadTasks;
import ls.augment.com.IslandDownloadTasks.Task;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Android DownloadProvider adapter. Its native grouping function defines the action's exact tasks. */
final class NativeDownloadControlHook {
    static final String PACKAGE=IslandDownloadConfig.PROVIDER_PACKAGE;
    static final String PAUSED=IslandDownloadConfig.PAUSED_RECOVERY;
    private static final String ACTION="ls.augment.download.CONTROL",TOKEN="ls.augment.download.token";
    private static final String PREF="ls_augment_download_recovery_v1",KEY="groups";
    private static final int RECOVERY_ID=0x4c534450,MAX_GROUPS=16;
    private static final Uri ALL=Uri.parse("content://downloads/all_downloads");
    private static final String[] COLUMNS={"_id","uid","notificationpackage","uri","title","status","control","current_bytes","total_bytes","deleted"};
    private static final ThreadLocal<Frame> FRAME=new ThreadLocal<>();
    private static volatile Controller controller;
    private static boolean installed;
    private static Method grouping,refresh;private static Field notifierContext;private static String[] projection;
    private static ComponentName receiverComponent;private static String listAction;

    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        try{
            Class<?> notifier=Class.forName(PACKAGE+".DownloadNotifier",false,loader);
            Class<?> provider=Class.forName(PACKAGE+".DownloadProvider",false,loader);
            Class<?> receiver=Class.forName(PACKAGE+".DownloadReceiver",false,loader);
            Class<?> constants=Class.forName(PACKAGE+".Constants",false,loader);
            Class<?> query=Class.forName(PACKAGE+".DownloadNotifier$UpdateQuery",false,loader);
            Class<?> impl=Class.forName("android.provider.Downloads$Impl",false,loader);
            NativeDownloadContract contract=new NativeDownloadContract(notifier,provider,receiver,constants,query,impl,
                    Context.class,Cursor.class,Uri.class,ContentProvider.class,BroadcastReceiver.class,ALL);
            Method update=contract.update,created=contract.created;
            grouping=contract.grouping;refresh=contract.refresh;notifierContext=contract.context;projection=contract.projection;listAction=contract.listAction;
            receiverComponent=new ComponentName(PACKAGE,receiver.getName());
            Method notify=NotificationManager.class.getDeclaredMethod("notify",String.class,int.class,Notification.class);
            module.registerFeatureHook(module.prepareFeatureHook(created,"download_controls.provider",false).intercept(chain->{
                Object result=chain.proceed();if(Boolean.TRUE.equals(result))start(module,((ContentProvider)chain.getThisObject()).getContext());return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(update,"download_controls.grouping",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                Frame previous=FRAME.get();
                try{
                    try{
                        Context context=(Context)notifierContext.get(chain.getThisObject());Controller c=start(module,context);
                        if(c!=null){c.notifier=new java.lang.ref.WeakReference<>(chain.getThisObject());FRAME.set(new Frame(c,groups((Cursor)chain.getArg(0))));}
                    }catch(Exception error){report(module,"native_grouping_unavailable",error);FRAME.remove();}
                    Frame current=FRAME.get();Object result=chain.proceed();
                    if(current!=null)current.owner.pruneActive(current.groups.keySet());
                    return result;
                }finally{if(previous==null)FRAME.remove();else FRAME.set(previous);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(notify,"download_controls.notification",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                Frame frame=FRAME.get();String tag=(String)chain.getArg(0);int id=(Integer)chain.getArg(1);Notification original=(Notification)chain.getArg(2);
                Notification next=original;
                if(frame!=null)try{next=frame.owner.decorate(tag,id,original,frame.groups.get(tag));}
                catch(Exception error){report(module,"source_decoration_unavailable",error);}
                return next==original?chain.proceed():chain.proceed(new Object[]{tag,id,next});
            }));
            installed=true;module.logFeatureInfo("DOWNLOAD_CONTROLS_CAPABILITY native_grouping_and_provider_controls");
        }catch(ReflectiveOperationException|RuntimeException error){
            report(module,"missing_runtime_contract",error);
            module.logFeatureInfo("COMPATIBILITY_MISS download_controls:"+error.getClass().getSimpleName()+":"+error.getMessage());
        }
    }
    private static synchronized Controller start(AugmentModule module,Context context){
        if(!installed||context==null||!PACKAGE.equals(context.getPackageName()))return null;
        if(controller==null)try{controller=new Controller(module,context);}catch(Exception error){report(module,"controller_unavailable",error);}
        return controller;
    }
    private static void report(AugmentModule module,String reason,Exception error){
        // Paths, download names, URIs and source tokens never enter diagnostics.
        module.logFeatureInfo("DOWNLOAD_CONTROLS_UNAVAILABLE "+reason+";"+error.getClass().getSimpleName());
    }
    private static Map<String,List<Long>> groups(Cursor cursor)throws ReflectiveOperationException{
        if(cursor==null||cursor.isClosed())throw new IllegalStateException("missing source cursor");
        for(int i=0;i<projection.length;i++)if(cursor.getColumnIndex(projection[i])!=i)throw new IllegalStateException("changed source projection");
        Map<String,List<Long>> result=new HashMap<>();int position=cursor.getPosition();
        try{cursor.moveToPosition(-1);while(cursor.moveToNext()){
            String tag=(String)grouping.invoke(null,cursor);if(tag==null)continue;
            List<Long> ids=result.computeIfAbsent(tag,k->new ArrayList<>());ids.add(cursor.getLong(0));
            if(ids.size()>IslandDownloadTasks.LIMIT||result.size()>64)throw new IllegalStateException("source group limit");
        }}finally{cursor.moveToPosition(position);}return result;
    }
    private static final class Frame {
        final Controller owner;final Map<String,List<Long>> groups;
        Frame(Controller owner,Map<String,List<Long>> groups){this.owner=owner;this.groups=groups;}
    }
    private static final class Row {
        final Task task;final String uri;
        Row(Task task,String uri){this.task=task;this.uri=uri;}
    }
    private static final class Group {
        final String token,tag,channel;final int id;final List<Task> tasks;
        Group(String token,String tag,int id,String channel,List<Task> tasks){this.token=token;this.tag=tag;this.id=id;this.channel=channel;this.tasks=List.copyOf(tasks);}
        String recoveryTag(){return "ls.augment.download.paused/"+token;}
    }
    private static final class Controller {
        final AugmentModule module;final Context context;final NotificationManager notifications;final int user;
        final Handler worker;final SharedPreferences preferences;
        final Map<String,Group> active=new HashMap<>(),paused=new LinkedHashMap<>();
        final Map<String,String> shown=new HashMap<>();
        java.lang.ref.WeakReference<Object> notifier=new java.lang.ref.WeakReference<>(null);
        Controller(AugmentModule module,Context context)throws Exception{
            this.module=module;this.context=context.getApplicationContext()==null?context:context.getApplicationContext();user=android.os.Process.myUid()/100000;
            notifications=context.getSystemService(NotificationManager.class);if(notifications==null)throw new IllegalStateException("notification manager");
            preferences=context.getSharedPreferences(PREF,Context.MODE_PRIVATE);
            HandlerThread thread=new HandlerThread("DuoDownloadRecovery");thread.start();worker=new Handler(thread.getLooper());
            IntentFilter filter=new IntentFilter(ACTION);filter.addDataScheme("duo-download");
            BroadcastReceiver commands=new BroadcastReceiver(){@Override public void onReceive(Context c,Intent intent){
                String token=intent.getStringExtra(TOKEN),command=intent.getStringExtra("command");
                if(token==null||!token.matches("[a-f0-9-]{36}")||!("pause".equals(command)||"resume".equals(command)||"cancel".equals(command)))return;
                actionState("received:"+command);
                try{execute(token,command);}catch(Exception error){report(module,"action_failed",error);reconcile();}
            }};
            ContentObserver observer=new ContentObserver(worker){@Override public void onChange(boolean self){schedule();}};
            Runnable configuration=()->worker.post(()->{synchronized(this){active.clear();}refreshNative();reconcile();});
            boolean receiverReady=false,observerReady=false;
            try{
                if(Build.VERSION.SDK_INT>=33)context.registerReceiver(commands,filter,null,worker,Context.RECEIVER_NOT_EXPORTED);
                else context.registerReceiver(commands,filter,null,worker);
                receiverReady=true;
                context.getContentResolver().registerContentObserver(ALL,true,observer);observerReady=true;
                if(!FeatureSettings.addSnapshotListener(context,configuration))throw new IllegalStateException("configuration observer");
            }catch(RuntimeException failure){
                FeatureSettings.removeSnapshotListener(configuration);
                if(observerReady)context.getContentResolver().unregisterContentObserver(observer);
                if(receiverReady)context.unregisterReceiver(commands);
                thread.quitSafely();throw failure;
            }
            worker.post(()->{load();reconcile();});
            FeatureSettings.diagnostic(context,"ls_augment_download_control_capability","ready:native_grouping;provider_control;owned_recovery");
        }
        boolean enabled(String channel){return FeatureSettings.hasVerifiedSnapshot(context)
                &&FeatureSettings.enabled(context,"ls_augment_rm_island_enabled")&&FeatureSettings.enabled(context,IslandDownloadConfig.ENABLED)
                &&IslandDownloadConfig.selected(FeatureSettings.text(context,IslandDownloadConfig.CHANNELS,""))
                    .contains(IslandDownloadConfig.channel(user,PACKAGE,channel));}
        synchronized Notification decorate(String tag,int id,Notification original,List<Long> ids)throws Exception{
            String key=tag+"#"+id;
            if(original==null||original.extras==null||!enabled(original.getChannelId())||ids==null||ids.isEmpty()
                    ||(original.flags&Notification.FLAG_ONGOING_EVENT)==0||original.extras.getBoolean(PAUSED,false)
                    ||original.actions!=null&&original.actions.length>=3){active.remove(key);return original;}
            List<Row> rows=query(ids);List<Task> tasks=tasks(rows);
            if(!IslandDownloadTasks.ready(tasks,tasks,user,false)){active.remove(key);return original;}
            Group previous=active.get(key);String token=previous!=null&&previous.channel.equals(original.getChannelId())
                    &&IslandDownloadTasks.sameRequests(previous.tasks,tasks)?previous.token:UUID.randomUUID().toString();
            Group group=new Group(token,tag,id,original.getChannelId(),tasks);
            if(previous==null&&active.size()>=32)return original;
            Notification.Builder builder=Notification.Builder.recoverBuilder(context,original);
            builder.addAction(new Notification.Action.Builder(android.graphics.drawable.Icon.createWithResource("android",android.R.drawable.ic_media_pause),"暂停",intent(group,"pause")).build());
            Bundle extras=new Bundle();extras.putString(TOKEN,token);builder.addExtras(extras);
            Notification result=builder.build();active.put(key,group);return result;
        }
        synchronized void pruneActive(Set<String> tags){active.values().removeIf(group->!tags.contains(group.tag));}
        PendingIntent intent(Group group,String command){
            Intent intent=new Intent(ACTION).setPackage(PACKAGE).setData(Uri.parse("duo-download://control/"+group.token+"/"+command))
                    .putExtra(TOKEN,group.token).putExtra("command",command);
            return PendingIntent.getBroadcast(context,0,intent,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);
        }
        void execute(String token,String command)throws Exception{
            boolean isPause="pause".equals(command);Group group=null;
            if(isPause){synchronized(this){for(Group candidate:active.values())if(candidate.token.equals(token)){group=candidate;break;}}}
            else group=paused.get(token);
            if(group==null||isPause&&!enabled(group.channel)){actionState("rejected:expired_or_disabled");return;}
            List<Row> rows=query(ids(group.tasks));List<Task> current=tasks(rows);
            if(!IslandDownloadTasks.ready(group.tasks,current,user,!isPause)){actionState("rejected:task_identity_or_state");reconcile();return;}
            if(isPause){
                boolean notice=false;
                for(StatusBarNotification source:notifications.getActiveNotifications())if(source.getId()==group.id&&Objects.equals(source.getTag(),group.tag)
                        &&token.equals(source.getNotification().extras.getString(TOKEN))){notice=true;break;}
                if(!notice){actionState("rejected:notification_withdrawn");return;}
                // Re-run the provider's grouping on fresh rows before accepting an old displayed button.
                List<Long> latest;
                try(Cursor cursor=context.getContentResolver().query(ALL,projection,"deleted = 0",null,null)){latest=groups(cursor).get(group.tag);}
                if(latest==null||!new HashSet<>(latest).equals(new HashSet<>(ids(group.tasks)))){actionState("rejected:group_changed");return;}
                if(paused.size()>=MAX_GROUPS){actionState("rejected:recovery_capacity");return;}
                paused.put(token,new Group(token,group.tag,group.id,group.channel,current));
                if(!save()){paused.remove(token);actionState("rejected:persistence_unavailable");return;}
            }
            int changed=0;
            for(Row row:rows){
                String where=IslandDownloadTasks.condition(row.task.control==0);
                String[] args={Long.toString(row.task.id),Integer.toString(row.task.uid),row.task.owner,row.uri,Integer.toString(row.task.control),Integer.toString(row.task.status)};
                if("cancel".equals(command))changed+=context.getContentResolver().delete(ALL,where,args);
                else{ContentValues values=new ContentValues();values.put("control",isPause?1:0);values.put("status",isPause?193:190);
                    int updated=context.getContentResolver().update(ALL,values,where,args);changed+=updated;
                    if(!isPause&&updated==1){
                        // This provider re-queries the selection after updating it to schedule work.
                        // The transition CAS no longer matches then. Repeat the same values against
                        // the exact post-state; a completed/replaced/already-running row cannot match.
                        String[] pending={Long.toString(row.task.id),Integer.toString(row.task.uid),row.task.owner,row.uri,"0","190"};
                        context.getContentResolver().update(ALL,values,IslandDownloadTasks.condition(true),pending);
                    }
                }
            }
            if(isPause)synchronized(this){active.values().removeIf(candidate->candidate.token.equals(token));}
            reconcile();refreshNative();
            actionState("provider_rows:"+command+":"+changed+"/"+rows.size());
        }
        void actionState(String value){FeatureSettings.diagnostic(context,"ls_augment_download_control_action",value+";at="+SystemClock.elapsedRealtime());}
        List<Row> query(List<Long> ids)throws Exception{
            if(ids.isEmpty()||ids.size()>IslandDownloadTasks.LIMIT||new HashSet<>(ids).size()!=ids.size())throw new IllegalArgumentException("task ids");
            String where="_id IN ("+String.join(",",Collections.nCopies(ids.size(),"?"))+") AND deleted = 0";
            String[] args=ids.stream().map(String::valueOf).toArray(String[]::new);List<Row> result=new ArrayList<>();
            try(Cursor cursor=context.getContentResolver().query(ALL,COLUMNS,where,args,null)){
                if(cursor==null)throw new IllegalStateException("no provider cursor");
                while(cursor.moveToNext()){
                    String uri=cursor.getString(3);if(uri==null)throw new IllegalStateException("missing request identity");
                    result.add(new Row(new Task(cursor.getLong(0),cursor.getInt(1),cursor.getString(2),digest(uri),cursor.getString(4),
                            cursor.getInt(5),cursor.getInt(6),cursor.getLong(7),cursor.getLong(8)),uri));
                }
            }
            return result;
        }
        private final Runnable pending=this::reconcile;
        void schedule(){worker.removeCallbacks(pending);worker.postDelayed(pending,250);}
        void reconcile(){
            boolean changed=false;
            for(Group group:new ArrayList<>(paused.values()))try{
                List<Task> current=tasks(query(ids(group.tasks)));List<Task> retained=new ArrayList<>();
                for(Task task:current)if(task.status==193&&task.control==1&&group.tasks.stream().anyMatch(task::sameRequest))retained.add(task);
                if(retained.isEmpty()){
                    notifications.cancel(group.recoveryTag(),RECOVERY_ID);paused.remove(group.token);shown.remove(group.token);changed=true;continue;
                }
                Group fresh=new Group(group.token,group.tag,group.id,group.channel,retained);
                if(!IslandDownloadTasks.sameRequests(group.tasks,retained))changed=true;
                paused.put(group.token,fresh);
                publish(fresh,false);
            }catch(Exception error){report(module,"recovery_refresh_unavailable",error);try{publish(group,true);}catch(Exception ignored){}}
            if(changed)save();
        }
        void publish(Group group,boolean unknown)throws Exception{
            StringBuilder parts=new StringBuilder(unknown?"unknown":"paused");
            for(Task task:group.tasks)parts.append('|').append(task.id).append(':').append(task.title).append(':').append(task.bytes).append(':').append(task.total);
            String signature=parts.toString();
            if(signature.equals(shown.get(group.token)))return;
            String title=group.tasks.size()==1?safeTitle(group.tasks.get(0).title):group.tasks.size()+" 个下载";
            Notification.Builder builder=new Notification.Builder(context,group.channel)
                    .setSmallIcon(android.R.drawable.stat_sys_download).setContentTitle(title)
                    .setContentText(unknown?"暂时无法读取下载状态":"下载已暂停")
                    .setOnlyAlertOnce(true).setOngoing(true).setShowWhen(false).setVisibility(Notification.VISIBILITY_PRIVATE);
            Notification.InboxStyle style=new Notification.InboxStyle();for(Task task:group.tasks)style.addLine(safeTitle(task.title));builder.setStyle(style);
            Bundle extras=new Bundle();extras.putBoolean(PAUSED,true);extras.putString(TOKEN,group.token);builder.addExtras(extras);
            int percent=IslandDownloadTasks.percent(group.tasks);if(!unknown)builder.setProgress(100,Math.max(0,percent),percent<0);
            if(!unknown){
                builder.addAction(new Notification.Action.Builder(android.graphics.drawable.Icon.createWithResource("android",android.R.drawable.ic_media_play),"继续",intent(group,"resume")).build());
                builder.addAction(new Notification.Action.Builder(android.graphics.drawable.Icon.createWithResource("android",android.R.drawable.ic_menu_close_clear_cancel),"取消",intent(group,"cancel")).build());
                Intent open=new Intent(listAction).setComponent(receiverComponent).setData(Uri.parse("active-dl://duo/"+group.token))
                        .putExtra(DownloadManager.EXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS,ids(group.tasks).stream().mapToLong(Long::longValue).toArray());
                builder.setContentIntent(PendingIntent.getBroadcast(context,0,open,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT));
            }
            notifications.notify(group.recoveryTag(),RECOVERY_ID,builder.build());shown.put(group.token,signature);
        }
        void refreshNative(){Object target=notifier.get();if(target!=null)try{refresh.invoke(target);}catch(Exception error){report(module,"native_refresh_unavailable",error);}}
        boolean save(){
            try{JSONArray groups=new JSONArray();for(Group group:paused.values()){
                JSONArray tasks=new JSONArray();for(Task task:group.tasks)tasks.put(new JSONObject().put("id",task.id).put("uid",task.uid).put("owner",task.owner).put("identity",task.identity));
                groups.put(new JSONObject().put("token",group.token).put("tag",group.tag).put("id",group.id).put("channel",group.channel).put("tasks",tasks));
            }return preferences.edit().putString(KEY,groups.toString()).commit();}
            catch(JSONException|RuntimeException error){report(module,"recovery_persistence_unavailable",error);return false;}
        }
        void load(){
            try{String raw=preferences.getString(KEY,"[]");if(raw.length()>131072)throw new IllegalArgumentException("recovery size");JSONArray groups=new JSONArray(raw);
                if(groups.length()>MAX_GROUPS)throw new IllegalArgumentException("recovery groups");
                for(int i=0;i<groups.length();i++){
                    JSONObject item=groups.getJSONObject(i);String token=item.getString("token"),channel=item.getString("channel");
                    if(!token.matches("[a-f0-9-]{36}")||IslandDownloadConfig.channel(user,PACKAGE,channel).isEmpty())continue;
                    JSONArray rows=item.getJSONArray("tasks");List<Task> tasks=new ArrayList<>();
                    if(rows.length()>IslandDownloadTasks.LIMIT)continue;
                    for(int j=0;j<rows.length();j++){JSONObject row=rows.getJSONObject(j);tasks.add(new Task(row.getLong("id"),row.getInt("uid"),row.getString("owner"),row.getString("identity"),"",193,1,-1,-1));}
                    if(IslandDownloadTasks.valid(tasks,user))paused.put(token,new Group(token,item.getString("tag"),item.getInt("id"),channel,tasks));
                }
            }catch(JSONException|RuntimeException error){report(module,"recovery_ledger_unavailable",error);}
        }
    }
    private static String safeTitle(String title){return title==null||title.isEmpty()?"下载任务":title.length()>1024?title.substring(0,1024):title;}
    private static String digest(String value)throws Exception{
        byte[] hash=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));StringBuilder result=new StringBuilder(64);
        for(byte b:hash)result.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return result.toString();
    }
    private static List<Task> tasks(List<Row> rows){List<Task> result=new ArrayList<>();for(Row row:rows)result.add(row.task);return result;}
    private static List<Long> ids(List<Task> tasks){List<Long> result=new ArrayList<>();for(Task task:tasks)result.add(task.id);return result;}
    private NativeDownloadControlHook(){}
}
