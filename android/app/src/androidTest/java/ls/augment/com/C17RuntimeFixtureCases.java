package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Person;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.media.AudioAttributes;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONObject;

/** Temporary native fixtures only. Never writes module configuration or plays audio. */
public final class C17RuntimeFixtureCases {
    private static final int MEDIA_ID=100;
    private static final long ACTIONS=PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE
            |PlaybackState.ACTION_PLAY_PAUSE|PlaybackState.ACTION_SKIP_TO_NEXT;
    private C17RuntimeFixtureCases(){ }

    /**
     * Instrumentation args, in seconds: seconds (1..180, default 90), coverAfter
     * (default duration/3), noCoverAfter (default 2*duration/3), restoreCoverAfter,
     * pauseAfter, resumeAfter, updateAfter, removeAfter (all default -1/off).
     * Initial cover is blue. Timed states are fixture stimuli, never transport callbacks.
     */
    static JSONObject run(Instrumentation test,Bundle args)throws Exception {
        if(Looper.myLooper()==Looper.getMainLooper())throw new IllegalStateException("Fixture must run on instrumentation worker");
        if(args!=null&&args.containsKey("mode")){
            if("recover-expired".equals(String.valueOf(args.get("mode"))))return recoverExpired(test,args);
            if(!"notification-icons".equals(String.valueOf(args.get("mode"))))throw new IllegalArgumentException("Unknown explicit fixture mode");
            return new NotificationIconsFixture(test,args).run();
        }
        Fixture fixture=new Fixture(test,args==null?new Bundle():args);
        return fixture.run();
    }

    /** Recover only a recorded, expired fixture owned by this test package. */
    private static JSONObject recoverExpired(Instrumentation test,Bundle args)throws Exception {
        String id=String.valueOf(args.get("runId"));
        if(!id.matches("[0-9a-f]+_[0-9a-f]{8}"))throw new IllegalArgumentException("Invalid fixture identity");
        Context context=test.getTargetContext();
        File file=new File(new File(context.getCacheDir(),"c17-runtime-fixture"),id+".json");
        JSONObject old=new JSONObject(new String(java.nio.file.Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8));
        String tag="duo_c17_fixture_"+id;
        if(!id.equals(old.getString("runId"))||!tag.equals(old.getString("notificationTag"))
                ||System.currentTimeMillis()<old.getLong("startedWallTimeMs")+old.getInt("seconds")*1000L+35000)
            throw new IllegalStateException("Fixture is not expired or identity changed");
        NotificationManager manager=context.getSystemService(NotificationManager.class);
        for(android.service.notification.StatusBarNotification n:manager.getActiveNotifications())
            if(context.getPackageName().equals(n.getPackageName())&&tag.equals(n.getTag())&&(n.getId()>=0&&n.getId()<6||n.getId()==MEDIA_ID))manager.cancel(tag,n.getId());
        int remaining=NotificationCleanup.await(()->{int count=0;for(android.service.notification.StatusBarNotification n:manager.getActiveNotifications())if(tag.equals(n.getTag()))count++;return count;},SystemClock::elapsedRealtime,()->SystemClock.sleep(50));
        return new JSONObject().put("runId",id).put("recoveryOnly",true).put("cleanupComplete",remaining==0).put("remainingOwnNotifications",remaining);
    }

    /** Test-only opt-in. Its scheduling and identity checks have no Android dependencies. */
    static final class IconTimeline {
        static final int WAIT=0, POST=1, UPDATE=2, REMOVE=3, MISSED=4, EXPIRE=5;
        final int seconds,postAfter,updateAfter,removeAfter;
        IconTimeline(int seconds,int postAfter,int updateAfter,int removeAfter){
            if(seconds<10||seconds>90||postAfter<1||postAfter>=updateAfter
                    ||updateAfter>=removeAfter||removeAfter>seconds-5)
                throw new IllegalArgumentException("Require 10<=seconds<=90 and 1<=postAfter<updateAfter<removeAfter<=seconds-5");
            this.seconds=seconds;this.postAfter=postAfter;this.updateAfter=updateAfter;this.removeAfter=removeAfter;
        }
        static boolean nonce(String value){return value!=null&&value.matches("[0-9a-f]{32}");}
        static int number(String value,int fallback){
            if(value==null)return fallback;
            if(!value.matches("0|[1-9][0-9]*"))throw new IllegalArgumentException("Noncanonical timeline number");
            try{return Integer.parseInt(value);}catch(NumberFormatException failure){throw new IllegalArgumentException("Timeline number too large",failure);}
        }
        int next(long elapsed,int state){
            if(elapsed<0)throw new IllegalArgumentException("Negative elapsed");
            if(elapsed>=seconds*1000L)return EXPIRE;
            if(state==0)return elapsed>=updateAfter*1000L?MISSED:elapsed>=postAfter*1000L?POST:WAIT;
            if(state==1)return elapsed>=removeAfter*1000L?MISSED:elapsed>=updateAfter*1000L?UPDATE:WAIT;
            if(state==2&&elapsed>=removeAfter*1000L)return REMOVE;
            return WAIT;
        }
        static long timeout(long deadline,long now){return Math.max(1,deadline-now);}
        static boolean owns(String expectedRun,String expectedNonce,int expectedId,String run,String nonce,int id,long now,long deadline,boolean closed){
            return !closed&&now<deadline&&expectedRun.equals(run)&&expectedNonce.equals(nonce)&&expectedId==id;
        }
    }

    /** One silent owned notification; never constructs a MediaSession or audio source. */
    private static final class NotificationIconsFixture {
        static final int ID=701;
        final Instrumentation test;
        final Context context;
        final NotificationManager manager;
        final String nonce,runId=UUID.randomUUID().toString().replace("-","");
        final String tag="duo_c17_icons_"+runId,channel=tag,action="ls.augment.com.C17_ICONS_ACTION."+runId;
        final IconTimeline timeline;
        final long start=SystemClock.elapsedRealtime(),wallStart=System.currentTimeMillis(),deadline;
        final File progress;
        final List<PendingIntent> pending=new ArrayList<>();
        final JSONArray events=new JSONArray(),cleanupErrors=new JSONArray();
        Bitmap ring,cross;
        boolean createdChannel,registered,closed,missed;
        int state,sequence,clicks,notificationCount=-1,glyph;
        String phase="initializing",error="",progressError="";
        long lastObservationElapsed,notifyStarted=-1,notifyReturned=-1,cancelStarted=-1,cancelReturned=-1;
        JSONArray activeIds=new JSONArray();
        final BroadcastReceiver receiver=new BroadcastReceiver(){
            @Override public void onReceive(Context ignored,Intent intent){
                if(intent==null||!action.equals(intent.getAction())||!"content".equals(intent.getStringExtra("command")))return;
                Uri data=intent.getData();
                if(data==null||!"duo-c17-icons".equals(data.getScheme())||!runId.equals(data.getHost())||!("/"+nonce+"/"+ID+"/opened/"+glyph).equals(data.getPath()))return;
                if(!IconTimeline.owns(runId,nonce,ID,intent.getStringExtra("runId"),intent.getStringExtra("nonce"),intent.getIntExtra("id",-1),SystemClock.elapsedRealtime(),deadline,closed))return;
                if((state!=1&&state!=2)||intent.getIntExtra("glyph",0)!=glyph)return;
                clicks++;record("content_activity_opened");
            }
        };
        NotificationIconsFixture(Instrumentation test,Bundle args){
            this.test=test;context=test.getTargetContext();manager=context.getSystemService(NotificationManager.class);
            nonce=value(args,"nonce");if(!IconTimeline.nonce(nonce))throw new IllegalArgumentException("notification-icons requires a fresh lowercase 32-hex nonce");
            timeline=new IconTimeline(IconTimeline.number(value(args,"seconds"),75),IconTimeline.number(value(args,"postAfter"),10),
                    IconTimeline.number(value(args,"updateAfter"),30),IconTimeline.number(value(args,"removeAfter"),50));
            for(String incompatible:new String[]{"coverAfter","noCoverAfter","restoreCoverAfter","pauseAfter","resumeAfter"})
                if(args.containsKey(incompatible))throw new IllegalArgumentException("Media timeline not allowed in notification-icons: "+incompatible);
            deadline=start+timeline.seconds*1000L;
            progress=new File(new File(context.getCacheDir(),"c17-runtime-fixture"),runId+".json");
        }
        static String value(Bundle args,String key){Object value=args.get(key);return value==null?null:String.valueOf(value);}
        JSONObject run(){
            try{
                onMain(this::start);
                while(!closed&&!Thread.currentThread().isInterrupted()&&SystemClock.elapsedRealtime()<deadline){
                    onMain(this::advance);
                    SystemClock.sleep(Math.min(100,Math.max(1,deadline-SystemClock.elapsedRealtime())));
                }
            }catch(Throwable failure){error=android.util.Log.getStackTraceString(failure);}
            finally{
                try{onMain(this::cleanup);}catch(Throwable failure){cleanupErrors.put("cleanup dispatch: "+failure.getClass().getSimpleName());}
            }
            JSONObject result=snapshot();persist(result);sendStatus("finished");return result;
        }
        void onMain(Runnable task){
            Throwable[] failure=new Throwable[1];test.runOnMainSync(()->{try{task.run();}catch(Throwable x){failure[0]=x;}});
            if(failure[0]!=null)throw new IllegalStateException("Notification icons fixture operation failed",failure[0]);
        }
        void start(){
            if(manager==null||!manager.areNotificationsEnabled())throw new IllegalStateException("Notification permission unavailable; fixture does not change it");
            NotificationChannel c=new NotificationChannel(channel,"Duo 单通知图标验证",NotificationManager.IMPORTANCE_LOW);
            c.setSound(null,null);c.enableVibration(false);c.enableLights(false);c.setShowBadge(false);
            manager.createNotificationChannel(c);createdChannel=true;
            IntentFilter filter=new IntentFilter(action);filter.addDataScheme("duo-c17-icons");filter.addDataAuthority(runId,null);
            if(Build.VERSION.SDK_INT>=33)context.registerReceiver(receiver,filter,Context.RECEIVER_NOT_EXPORTED);else context.registerReceiver(receiver,filter);
            registered=true;ring=icon(false);cross=icon(true);phase="ready";observeOwned();record("ready");
            if(!progressError.isEmpty())throw new IllegalStateException("Ready receipt could not be persisted");
            sendStatus("ready"); // Persistent readiness always precedes the first possible notify.
        }
        void advance(){
            int step=timeline.next(elapsed(),state);
            if(step==IconTimeline.EXPIRE){cleanup();return;}
            if(step==IconTimeline.MISSED){missed=true;phase="missed-window";state=4;record("window_missed");cancelOwned();return;}
            if(step==IconTimeline.POST||step==IconTimeline.UPDATE){post(step==IconTimeline.UPDATE);return;}
            if(step==IconTimeline.REMOVE){cancelOwned();state=3;phase="removed";record("notification_removed");return;}
            if(elapsed()-lastObservationElapsed>=1000){observeOwned();persist(snapshot());lastObservationElapsed=elapsed();}
        }
        void post(boolean updated){
            // A delayed callback must not send two catch-up states or extend the fixed run.
            int wanted=updated?IconTimeline.UPDATE:IconTimeline.POST;
            if(timeline.next(elapsed(),state)!=wanted)return;
            int nextGlyph=updated?2:1;
            String title="Duo 单通知图标 · "+(updated?"十字更新":"圆环到达");
            String body="runId="+runId+"\nnonce="+nonce+"\n图标="+nextGlyph+"；仅本次临时通知。";
            Notification notification=new Notification.Builder(context,channel)
                    .setSmallIcon(android.graphics.drawable.Icon.createWithBitmap(updated?cross:ring))
                    .setContentTitle(title).setContentText("本次单通知图标验证，图标 "+nextGlyph)
                    .setContentIntent(content(title,body,nextGlyph)).setAutoCancel(false).setOnlyAlertOnce(true).setShowWhen(false)
                    .setVisibility(Notification.VISIBILITY_PUBLIC).setCategory(Notification.CATEGORY_STATUS)
                    .setTimeoutAfter(IconTimeline.timeout(deadline,SystemClock.elapsedRealtime())).build();
            if(timeline.next(elapsed(),state)!=wanted)return;
            notifyStarted=elapsed();manager.notify(tag,ID,notification);notifyReturned=elapsed();glyph=nextGlyph;state=updated?2:1;
            if(notifyReturned>=(updated?timeline.removeAfter:timeline.updateAfter)*1000L){
                missed=true;phase="missed-window";state=4;observeOwned();record("notify_returned_outside_window");cancelOwned();return;
            }
            phase=updated?"updated":"arrived";observeOwned();record(updated?"notification_updated":"notification_posted");
        }
        PendingIntent content(String title,String body,int nextGlyph){
            Intent callback=new Intent(action).setPackage(context.getPackageName())
                    .setData(Uri.parse("duo-c17-icons://"+runId+"/"+nonce+"/"+ID+"/opened/"+nextGlyph))
                    .putExtra("command","content").putExtra("runId",runId).putExtra("nonce",nonce).putExtra("id",ID).putExtra("glyph",nextGlyph);
            PendingIntent opened=PendingIntent.getBroadcast(context,nextGlyph,callback,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);pending.add(opened);
            Intent target=new Intent().setComponent(new ComponentName(test.getContext().getPackageName(),ContentActivity.class.getName()))
                    .setData(Uri.parse("duo-c17-icons://"+runId+"/"+nonce+"/"+ID+"/content/"+nextGlyph)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    .putExtra("title",title).putExtra("content",body).putExtra("deadline",deadline).putExtra("opened",opened);
            PendingIntent pi=PendingIntent.getActivity(context,nextGlyph,target,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);pending.add(pi);return pi;
        }
        static Bitmap icon(boolean updated){
            Bitmap b=Bitmap.createBitmap(48,48,Bitmap.Config.ARGB_8888);Canvas c=new Canvas(b);Paint p=new Paint(Paint.ANTI_ALIAS_FLAG);p.setColor(Color.WHITE);
            if(updated){c.drawRect(19,5,29,43,p);c.drawRect(5,19,43,29,p);}
            else{p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(8);c.drawCircle(24,24,15,p);}
            return b;
        }
        void cancelOwned(){
            if(manager==null)return;cancelStarted=elapsed();manager.cancel(tag,ID);cancelReturned=elapsed();observeOwned();
        }
        void observeOwned(){
            activeIds=new JSONArray();notificationCount=0;
            try{for(android.service.notification.StatusBarNotification n:manager.getActiveNotifications())if(tag.equals(n.getTag())){activeIds.put(n.getId());notificationCount++;}}
            catch(Throwable failure){notificationCount=-1;cleanupErrors.put("active own observation: "+failure.getClass().getSimpleName());}
        }
        void cleanup(){
            if(closed)return;closed=true;
            clean("cancel own notification",this::cancelOwned);
            for(PendingIntent pi:pending)clean("pending intent",pi::cancel);
            if(registered)clean("receiver",()->context.unregisterReceiver(receiver));
            if(createdChannel)clean("channel",()->manager.deleteNotificationChannel(channel));
            clean("native own count",this::observeOwned);
            clean("icons",()->{if(ring!=null)ring.recycle();if(cross!=null)cross.recycle();});
            phase="finished";record("fixture_cleanup");
        }
        void clean(String label,Runnable action){try{action.run();}catch(Throwable failure){cleanupErrors.put(label+": "+failure.getClass().getSimpleName());}}
        long elapsed(){return Math.max(0,SystemClock.elapsedRealtime()-start);}
        synchronized void record(String event){
            try{sequence++;events.put(new JSONObject().put("event",event).put("phase",phase).put("seq",sequence).put("elapsedMs",elapsed())
                    .put("notifyStartedMs",notifyStarted).put("notifyReturnedMs",notifyReturned).put("cancelStartedMs",cancelStarted).put("cancelReturnedMs",cancelReturned)
                    .put("ownActiveIds",new JSONArray(activeIds.toString())).put("glyph",glyph));persist(snapshot());}
            catch(Exception failure){throw new IllegalStateException("Fixture event receipt failed",failure);}
        }
        synchronized JSONObject snapshot(){
            try{return new JSONObject().put("mode","notification-icons").put("fixtureOnly",true).put("moduleEffectsValidated",false).put("moduleConfigurationWrites",0)
                    .put("runId",runId).put("echoNonce",nonce).put("package",context.getPackageName()).put("pid",android.os.Process.myPid())
                    .put("notificationTag",tag).put("channel",channel).put("notificationId",ID).put("progressPath",progress.getAbsolutePath())
                    .put("seconds",timeline.seconds).put("startedElapsedRealtimeMs",start).put("startedWallTimeMs",wallStart).put("deadlineElapsedRealtimeMs",deadline)
                    .put("elapsedMs",elapsed()).put("phase",phase).put("seq",sequence).put("missedWindow",missed).put("closed",closed)
                    .put("timeline",new JSONObject().put("postAfter",timeline.postAfter).put("updateAfter",timeline.updateAfter).put("removeAfter",timeline.removeAfter))
                    .put("glyph",glyph==0?"none":glyph==1?"white-ring-48-v1":"white-cross-48-v1").put("smallIconIsActualBitmap",true)
                    .put("ownActiveIds",new JSONArray(activeIds.toString())).put("remainingOwnNotifications",notificationCount).put("regularNotificationCount",1)
                    .put("mediaSessionCreated",false).put("audioOutput",false).put("audioFocusRequested",false).put("contentActivityCallbacks",clicks)
                    .put("events",new JSONArray(events.toString())).put("cleanupErrors",new JSONArray(cleanupErrors.toString()))
                    .put("cleanupComplete",closed&&notificationCount==0&&cleanupErrors.length()==0).put("error",error).put("progressWriteError",progressError)
                    .put("sourceCountIsNotVisibleStatusBarCount",true);
            }catch(Exception failure){throw new IllegalStateException(failure);}
        }
        synchronized void persist(JSONObject report){
            FileOutputStream stream=null;AtomicFile file=new AtomicFile(progress);
            try{File parent=progress.getParentFile();if(!parent.isDirectory()&&!parent.mkdirs())throw new IllegalStateException("Cannot create icon fixture receipt directory");
                stream=file.startWrite();stream.write(report.toString(2).getBytes(StandardCharsets.UTF_8));file.finishWrite(stream);}
            catch(Exception failure){if(stream!=null)file.failWrite(stream);progressError=failure.getClass().getSimpleName()+": "+failure.getMessage();}
        }
        void sendStatus(String phase){Bundle status=new Bundle();status.putString("c17FixturePhase",phase);status.putString("c17Fixture",snapshot().toString());test.sendStatus(0,status);}
    }

    /** Notification cancellation is asynchronous in system_server. Never wait on the UI thread. */
    static final class NotificationCleanup {
        static int await(java.util.function.IntSupplier remaining,java.util.function.LongSupplier clock,Runnable pause){
            long deadline=clock.getAsLong()+2000;int count=remaining.getAsInt();
            while(count>0&&clock.getAsLong()<deadline){pause.run();count=remaining.getAsInt();}
            return count;
        }
    }

    private static final class Fixture {
        final Instrumentation test;
        final Context context;
        final Bundle args;
        final Handler main=new Handler(Looper.getMainLooper());
        final NotificationManager manager;
        final String runId=Long.toHexString(SystemClock.elapsedRealtime())+"_"+UUID.randomUUID().toString().substring(0,8);
        final String tag="duo_c17_fixture_"+runId, channel=tag;
        final String action="ls.augment.com.C17_FIXTURE_ACTION."+runId;
        final int seconds;
        final long start=SystemClock.elapsedRealtime(), wallStart=System.currentTimeMillis();
        final long deadline;
        final JSONArray events=new JSONArray(), cleanupErrors=new JSONArray();
        final List<PendingIntent> pending=new ArrayList<>();
        final File progress;
        MediaSession session;
        Bitmap blue,orange,picture;
        PendingIntent mediaOpen;
        boolean createdChannel,receiverRegistered,closed,playing=true;
        boolean changedCover,removedCover,restoredCover,scheduledPause,scheduledResume,updated,removed;
        int cover=0,track=1,plays,pauses,nexts,clicks,receiverActions;
        long playbackPosition,playbackStartedAt=start;
        String error="",activeSessionObservation="not_checked",progressError="";
        int activeNotifications=-1;
        final BroadcastReceiver receiver=new BroadcastReceiver(){
            @Override public void onReceive(Context ignored,Intent intent){
                if(closed||!action.equals(intent.getAction()))return;
                String command=intent.getStringExtra("command");
                if("content".equals(command)){clicks++;event("content_activity_opened","notification",intent.getIntExtra("notification",-1));return;}
                if(session==null)return;
                receiverActions++;event("notification_action","command",command);
                if("play".equals(command))session.getController().getTransportControls().play();
                else if("pause".equals(command))session.getController().getTransportControls().pause();
                else if("next".equals(command))session.getController().getTransportControls().skipToNext();
            }
        };
        Fixture(Instrumentation test,Bundle args){
            this.test=test;this.args=args;context=test.getTargetContext();manager=context.getSystemService(NotificationManager.class);
            seconds=Math.max(1,Math.min(180,integer("seconds",90)));deadline=start+seconds*1000L;
            progress=new File(new File(context.getCacheDir(),"c17-runtime-fixture"),runId+".json");
        }
        int integer(String key,int fallback){Object raw=args.get(key);if(raw==null)return fallback;try{return Integer.parseInt(String.valueOf(raw));}catch(NumberFormatException e){return fallback;}}
        int phase(String key,int fallback){int value=integer(key,fallback);return value<0?-1:Math.min(seconds,value);}
        JSONObject run()throws Exception {
            try {
                onMain(this::start);
                if(!"true".equals(String.valueOf(args.get("skipActiveSession"))))observeActiveSession();
                while(SystemClock.elapsedRealtime()<deadline&&!Thread.currentThread().isInterrupted()){
                    onMain(this::advance);
                    SystemClock.sleep(Math.min(100,Math.max(1,deadline-SystemClock.elapsedRealtime())));
                }
                boolean interrupted=Thread.currentThread().isInterrupted();
                onMain(()->event("observation_window_ended","interrupted",interrupted));
            }catch(Throwable failure){
                error=android.util.Log.getStackTraceString(failure);
                event("fixture_error","error",error);
            }finally{
                onMain(this::cleanup);
                if(manager!=null)try{
                    activeNotifications=NotificationCleanup.await(()->{int count=0;for(android.service.notification.StatusBarNotification n:manager.getActiveNotifications())if(tag.equals(n.getTag()))count++;return count;},SystemClock::elapsedRealtime,()->SystemClock.sleep(50));
                    event("fixture_cleanup_observed","ownNotificationsRemaining",activeNotifications);
                }catch(Throwable failure){cleanupErrors.put("cleanup observation: "+failure.getClass().getSimpleName());}
                sendStatus("finished");
            }
            JSONObject report=snapshot();persist(report);
            return report;
        }
        void onMain(Runnable task){
            Throwable[] failure=new Throwable[1];
            test.runOnMainSync(()->{try{task.run();}catch(Throwable problem){failure[0]=problem;}});
            if(failure[0]!=null)throw new IllegalStateException("Fixture main-thread operation failed",failure[0]);
        }
        void start(){
            if(manager==null)throw new IllegalStateException("NotificationManager unavailable");
            if(!manager.areNotificationsEnabled())throw new IllegalStateException("Notification permission disabled; fixture does not change permission");
            NotificationChannel c=new NotificationChannel(channel,"红魔Duo 临时原生验证",NotificationManager.IMPORTANCE_LOW);
            c.setSound(null,null);c.enableVibration(false);c.enableLights(false);c.setShowBadge(false);
            manager.createNotificationChannel(c);createdChannel=true;
            // Each PendingIntent has a data URI so play/pause/next cannot replace
            // one another. An action-only filter rejects these URI-bearing broadcasts.
            IntentFilter callbacks=new IntentFilter(action);
            callbacks.addDataScheme("duo-c17-fixture");
            callbacks.addDataAuthority(runId,null);
            verifyCallbackFilter(callbacks);
            // The test APK inherits minSdk 35; every supported system accepts
            // explicit non-exported registration for our own PendingIntents.
            context.registerReceiver(receiver,callbacks,Context.RECEIVER_NOT_EXPORTED);
            receiverRegistered=true;
            blue=art(0xff236cc0,"A");orange=art(0xffdf8d34,"B");picture=art(0xff478e7a,"6");
            for(int i=0;i<6;i++)postNotification(i,false);
            session=new MediaSession(context,"DuoC17Fixture-"+runId);
            session.setFlags(MediaSession.FLAG_HANDLES_MEDIA_BUTTONS|MediaSession.FLAG_HANDLES_TRANSPORT_CONTROLS);
            session.setPlaybackToLocal(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA).setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build());
            mediaOpen=contentIntent(MEDIA_ID,"无声媒体夹具","这里只提供原生 MediaSession 状态和封面，没有音频输出。请返回通知或控制中心操作播放、暂停与下一首。");
            session.setSessionActivity(mediaOpen);
            session.setCallback(new MediaSession.Callback(){
                @Override public void onPlay(){if(closed)return;plays++;playback(true);event("transport_play_callback","count",plays);publishMedia();}
                @Override public void onPause(){if(closed)return;pauses++;playback(false);event("transport_pause_callback","count",pauses);publishMedia();}
                @Override public void onSkipToNext(){if(closed)return;nexts++;track++;playbackPosition=0;playbackStartedAt=SystemClock.elapsedRealtime();event("transport_next_callback","count",nexts);publishMedia();}
            },main);
            publishMedia();session.setActive(true);
            event("fixtures_posted","regularNotifications",6);
            event("media_session_active","audioOutput",false);
            sendStatus("ready");
        }
        void verifyCallbackFilter(IntentFilter filter){
            int assertions=0;
            for(String command:new String[]{"content","play","pause","next"}){
                Uri uri=Uri.parse("duo-c17-fixture://"+runId+"/command/"+command+"/0");
                if(filter.match(action,null,uri.getScheme(),uri,null,"DuoC17Fixture")<0)
                    throw new IllegalStateException("Own callback URI rejected: "+command);
                assertions++;
            }
            Uri own=Uri.parse("duo-c17-fixture://"+runId+"/command/content/0");
            Uri other=Uri.parse("duo-c17-fixture://other-"+runId+"/command/content/0");
            Uri wrongScheme=Uri.parse("duo-c17-other://"+runId+"/command/content/0");
            if(filter.match(action,null,other.getScheme(),other,null,"DuoC17Fixture")>=0
                    ||filter.match(action+".other",null,own.getScheme(),own,null,"DuoC17Fixture")>=0
                    ||filter.match(action,null,wrongScheme.getScheme(),wrongScheme,null,"DuoC17Fixture")>=0
                    ||filter.match(action,null,null,null,null,"DuoC17Fixture")>=0)
                throw new IllegalStateException("Callback filter admitted an unrelated run or URI");
            assertions+=4;
            event("callback_filter_verified","assertions",assertions);
        }
        Notification.Builder base(int id,String title,String body,PendingIntent open){
            return new Notification.Builder(context,channel).setSmallIcon(android.R.drawable.ic_dialog_info)
                    .setContentTitle(title).setContentText(body).setContentIntent(open).setOnlyAlertOnce(true)
                    .setShowWhen(true).setWhen(wallStart+id).setAutoCancel(false)
                    .setGroup(tag+".independent."+id).setGroupSummary(false)
                    .setVisibility(Notification.VISIBILITY_PUBLIC).setCategory(Notification.CATEGORY_STATUS);
        }
        void postNotification(int i,boolean changed){
            String title="原生通知 "+(i+1)+" · "+new String[]{"短内容","长文字","收件列表","图片","更新内容","对话"}[i];
            String body=changed?"内容已按时间线更新，可再次展开查看。":"临时夹具，点击查看本条真实内容。";
            String detail="第 "+(i+1)+" 条独立通知。\n\n这条通知属于本次临时验证；结束时只移除本夹具创建的通知。\n\n请检查通知的展开、折叠、侧滑、点击与滚动；本页不判断模块功能是否通过。";
            Notification.Builder b=base(i,title,body,contentIntent(i,title,detail));
            switch(i){
                case 1:b.setStyle(new Notification.BigTextStyle().bigText(detail+"\n\n长文字的最后一段，用于确认展开后的原生高度和完整内容。"));break;
                case 2:Notification.InboxStyle inbox=new Notification.InboxStyle().setBigContentTitle("六行原生收件列表");for(int line=1;line<=6;line++)inbox.addLine("内容 "+line+"：独立通知列表滚动验证");b.setStyle(inbox);break;
                case 3:b.setStyle(new Notification.BigPictureStyle().bigPicture(picture).setSummaryText("本地生成的绿色测试图片"));break;
                case 4:b.setStyle(new Notification.BigTextStyle().bigText(changed?detail+"\n\n更新阶段增加的新内容，展开后应使用最新原生高度。":"两行测试内容。\n稍后可通过 updateAfter 更新本通知。"));break;
                case 5:Person person=new Person.Builder().setName("本机测试").build();Notification.MessagingStyle messages=new Notification.MessagingStyle(person).setConversationTitle("临时对话夹具");for(int m=0;m<4;m++)messages.addMessage("消息 "+(m+1)+"：检验多行内容与真实通知展开。",wallStart+m,person);b.setStyle(messages);break;
                default:break;
            }
            manager.notify(tag,i,b.build());
        }
        PendingIntent commandIntent(String command,int notification){
            Intent intent=new Intent(action).setPackage(context.getPackageName()).setData(Uri.parse("duo-c17-fixture://"+runId+"/command/"+command+"/"+notification))
                    .putExtra("command",command).putExtra("notification",notification);
            PendingIntent p=PendingIntent.getBroadcast(context,notification,intent,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);pending.add(p);return p;
        }
        PendingIntent contentIntent(int id,String title,String content){
            Intent intent=new Intent().setComponent(new ComponentName(test.getContext().getPackageName(),ContentActivity.class.getName()))
                    .setData(Uri.parse("duo-c17-fixture://"+runId+"/content/"+id)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    .putExtra("title",title).putExtra("content",content).putExtra("deadline",deadline)
                    .putExtra("opened",commandIntent("content",id));
            PendingIntent p=PendingIntent.getActivity(context,id,intent,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);pending.add(p);return p;
        }
        void publishMedia(){
            if(closed||session==null)return;
            Bitmap bitmap=cover==0?blue:cover==1?orange:null;
            MediaMetadata.Builder metadata=new MediaMetadata.Builder()
                    .putString(MediaMetadata.METADATA_KEY_MEDIA_ID,runId+":"+track)
                    .putString(MediaMetadata.METADATA_KEY_TITLE,"无声测试 · 第 "+track+" 首")
                    .putString(MediaMetadata.METADATA_KEY_ARTIST,"红魔Duo 原生夹具")
                    .putString(MediaMetadata.METADATA_KEY_ALBUM,cover==2?"无封面阶段":cover==1?"橙色封面阶段":"蓝色封面阶段")
                    .putLong(MediaMetadata.METADATA_KEY_DURATION,seconds*1000L);
            if(bitmap!=null)metadata.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART,bitmap).putBitmap(MediaMetadata.METADATA_KEY_ART,bitmap).putBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON,bitmap);
            session.setMetadata(metadata.build());
            session.setPlaybackState(new PlaybackState.Builder().setActions(ACTIONS)
                    .setState(playing?PlaybackState.STATE_PLAYING:PlaybackState.STATE_PAUSED,position(),playing?1:0,SystemClock.elapsedRealtime()).build());
            Notification.Builder b=base(MEDIA_ID,"无声测试 · 第 "+track+" 首",cover==2?"当前无封面":"原生媒体播放 / 暂停 / 下一首",mediaOpen)
                    .setCategory(Notification.CATEGORY_TRANSPORT).setOngoing(playing).setSmallIcon(android.R.drawable.ic_media_play)
                    .addAction(new Notification.Action.Builder(android.R.drawable.ic_media_play,"播放",commandIntent("play",MEDIA_ID)).build())
                    .addAction(new Notification.Action.Builder(android.R.drawable.ic_media_pause,"暂停",commandIntent("pause",MEDIA_ID)).build())
                    .addAction(new Notification.Action.Builder(android.R.drawable.ic_media_next,"下一首",commandIntent("next",MEDIA_ID)).build())
                    .setStyle(new Notification.MediaStyle().setMediaSession(session.getSessionToken()).setShowActionsInCompactView(0,1,2));
            if(bitmap!=null)b.setLargeIcon(bitmap);
            manager.notify(tag,MEDIA_ID,b.build());
        }
        void advance(){
            long t=elapsed();
            if(!changedCover&&due("coverAfter",Math.max(1,seconds/3),t)){changedCover=true;cover=1;publishMedia();event("cover_changed","cover","orange");sendStatus("orange-cover");}
            if(!removedCover&&due("noCoverAfter",Math.max(1,seconds*2/3),t)){removedCover=true;cover=2;publishMedia();event("cover_removed","cover","none");sendStatus("no-cover");}
            if(!restoredCover&&due("restoreCoverAfter",-1,t)){restoredCover=true;cover=0;publishMedia();event("cover_restored","cover","blue");}
            if(!scheduledPause&&due("pauseAfter",-1,t)){scheduledPause=true;playback(false);publishMedia();event("scheduled_pause","callback",false);}
            if(!scheduledResume&&due("resumeAfter",-1,t)){scheduledResume=true;playback(true);publishMedia();event("scheduled_resume","callback",false);}
            if(!updated&&due("updateAfter",-1,t)){updated=true;postNotification(4,true);event("notification_updated","id",4);}
            if(!removed&&due("removeAfter",-1,t)){removed=true;manager.cancel(tag,0);event("notification_removed","id",0);}
        }
        boolean due(String key,int fallback,long elapsed){int value=phase(key,fallback);return value>=0&&elapsed>=value*1000L;}
        long position(){return Math.min(seconds*1000L,playbackPosition+(playing?Math.max(0,SystemClock.elapsedRealtime()-playbackStartedAt):0));}
        void playback(boolean next){playbackPosition=position();playbackStartedAt=SystemClock.elapsedRealtime();playing=next;}
        long elapsed(){return Math.max(0,SystemClock.elapsedRealtime()-start);}
        synchronized void event(String name,String key,Object value){
            try{if(events.length()<512)events.put(new JSONObject().put("event",name).put("elapsedMs",elapsed()).put("wallTimeMs",System.currentTimeMillis()).put(key,value));persist(snapshot());}catch(Exception ignored){ }
        }
        synchronized JSONObject snapshot(){
            try{return new JSONObject().put("fixtureOnly",true).put("moduleEffectsValidated",false).put("moduleConfigurationWrites",0)
                    .put("runId",runId).put("channel",channel).put("notificationTag",tag).put("progressPath",progress.getAbsolutePath())
                    .put("seconds",seconds).put("startedElapsedRealtimeMs",start).put("startedWallTimeMs",wallStart).put("deadlineElapsedRealtimeMs",deadline)
                    .put("elapsedMs",elapsed()).put("events",new JSONArray(events.toString())).put("playCallbacks",plays).put("pauseCallbacks",pauses)
                    .put("nextCallbacks",nexts).put("contentActivityCallbacks",clicks).put("notificationActionRequests",receiverActions)
                    .put("activeSessionObservation",activeSessionObservation).put("oemPlayerAdoption","external-observer-required")
                    .put("audioOutput",false).put("audioFocusRequested",false).put("regularNotificationCount",6)
                    .put("lastPlaying",playing).put("lastTrack",track).put("lastCover",cover==2?"none":cover==1?"orange":"blue")
                    .put("cleanupComplete",closed&&cleanupErrors.length()==0&&activeNotifications==0).put("cleanupErrors",new JSONArray(cleanupErrors.toString()))
                    .put("remainingOwnNotifications",activeNotifications).put("error",error).put("progressWriteError",progressError)
                    .put("timeline",new JSONObject().put("coverAfter",phase("coverAfter",Math.max(1,seconds/3)))
                            .put("noCoverAfter",phase("noCoverAfter",Math.max(1,seconds*2/3))).put("restoreCoverAfter",phase("restoreCoverAfter",-1))
                            .put("pauseAfter",phase("pauseAfter",-1)).put("resumeAfter",phase("resumeAfter",-1)).put("updateAfter",phase("updateAfter",-1)).put("removeAfter",phase("removeAfter",-1)));
            }catch(Exception e){throw new IllegalStateException(e);}
        }
        void observeActiveSession(){
            // Read only. If the caller has no permission, an external observer can inspect
            // this token through dumpsys; do not change listener access or app permissions.
            try{
                MediaSessionManager sessions=context.getSystemService(MediaSessionManager.class);boolean found=false;
                if(sessions!=null)for(MediaController controller:sessions.getActiveSessions(null))if(session.getSessionToken().equals(controller.getSessionToken())){found=true;break;}
                activeSessionObservation=found?"listed-active":"not-listed";
            }catch(SecurityException denied){activeSessionObservation="permission-unavailable; own active="+(session!=null&&session.isActive());}
            catch(Throwable failure){activeSessionObservation="read-failed: "+failure.getClass().getSimpleName();}
            event("active_session_observation","result",activeSessionObservation);
        }
        void sendStatus(String phase){Bundle status=new Bundle();status.putString("c17FixturePhase",phase);status.putString("c17Fixture",snapshot().toString());test.sendStatus(0,status);}
        synchronized void persist(JSONObject report){
            FileOutputStream stream=null;AtomicFile file=new AtomicFile(progress);
            try{File parent=progress.getParentFile();if(!parent.isDirectory()&&!parent.mkdirs())throw new IllegalStateException("Cannot create fixture evidence directory");stream=file.startWrite();stream.write(report.toString(2).getBytes(StandardCharsets.UTF_8));file.finishWrite(stream);}
            catch(Exception failure){if(stream!=null)file.failWrite(stream);progressError=failure.getClass().getSimpleName()+": "+failure.getMessage();}
        }
        void cleanup(){
            closed=true;
            if(session!=null){clean("session callback",()->session.setCallback(null));clean("session inactive",()->session.setActive(false));clean("session release",()->session.release());}
            if(manager!=null){for(int i=0;i<6;i++){final int id=i;clean("notification "+id,()->manager.cancel(tag,id));}clean("media notification",()->manager.cancel(tag,MEDIA_ID));}
            if(receiverRegistered)clean("receiver",()->context.unregisterReceiver(receiver));
            for(PendingIntent intent:pending)clean("pending intent",intent::cancel);
            if(createdChannel&&manager!=null)clean("channel",()->manager.deleteNotificationChannel(channel));
            if(manager!=null)clean("remaining own notifications",()->{activeNotifications=0;for(android.service.notification.StatusBarNotification n:manager.getActiveNotifications())if(tag.equals(n.getTag()))activeNotifications++;});
            clean("artwork",()->{if(blue!=null)blue.recycle();if(orange!=null)orange.recycle();if(picture!=null)picture.recycle();});
            event("fixture_cleanup","ownNotificationsRemaining",activeNotifications);
        }
        void clean(String stage,Runnable task){try{task.run();}catch(Throwable failure){cleanupErrors.put(stage+": "+failure.getClass().getSimpleName()+": "+failure.getMessage());}}
    }

    private static Bitmap art(int color,String letter){
        Bitmap bitmap=Bitmap.createBitmap(256,192,Bitmap.Config.ARGB_8888);Canvas c=new Canvas(bitmap);c.drawColor(color);
        Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);paint.setColor(Color.WHITE);paint.setTextSize(104);paint.setTextAlign(Paint.Align.CENTER);c.drawText(letter,128,132,paint);return bitmap;
    }

    /** Test APK only: a plain native content destination, with no module settings code. */
    public static final class ContentActivity extends Activity {
        final Handler handler=new Handler(Looper.getMainLooper());
        final Runnable close=this::finish;
        @Override public void onCreate(Bundle state){
            super.onCreate(state);Intent intent=getIntent();long deadline=intent.getLongExtra("deadline",0);
            String title=intent.getStringExtra("title"),content=intent.getStringExtra("content");
            setTitle(title==null?"临时通知内容":title);
            ScrollView scroll=new ScrollView(this);TextView text=new TextView(this);int padding=Math.round(16*getResources().getDisplayMetrics().density);
            text.setPadding(padding,padding,padding,padding);text.setTextSize(18);text.setTextIsSelectable(true);
            text.setText(deadline>SystemClock.elapsedRealtime()?(title==null?"":title)+"\n\n"+(content==null?"":content):"本次测试夹具已结束。\n本页不更改模块配置。");
            scroll.addView(text);setContentView(scroll);
            if(state==null&&deadline>SystemClock.elapsedRealtime()){
                PendingIntent opened=intent.getParcelableExtra("opened",PendingIntent.class);
                if(opened!=null)try{opened.send();}catch(PendingIntent.CanceledException ignored){ }
            }
            handler.postDelayed(close,Math.max(1000,Math.min(180_000,deadline-SystemClock.elapsedRealtime())));
        }
        @Override protected void onDestroy(){handler.removeCallbacks(close);super.onDestroy();}
    }
}
