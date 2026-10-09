package ls.augment.regression.island;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.media.AudioManager;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.view.WindowManager;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

/** Independent, no-sound event source. Never reads or writes Duo configuration. */
public final class IslandFixtureRunner extends Instrumentation {
    public static final String PACKAGE="ls.augment.regression.island";
    public static final String ACTION=PACKAGE+".COMMAND";
    private static volatile IslandFixtureRunner active;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final JSONArray events=new JSONArray();
    private Bundle arguments;private Context context;private NotificationManager notifications;
    private AudioManager audio;private MediaSession session;private Bitmap cover;private AtomicFile progress;
    private String runId,secret,channel,tag,phase="starting",error="";
    private long started,deadline;private int sequence,playback=PlaybackState.STATE_PAUSED,clicks;
    private volatile boolean finished;private boolean closed,receiverRegistered,released=true,channelCreated;
    private BackgroundActivity background;private ContentActivity content;
    private final BroadcastReceiver commands=new BroadcastReceiver(){
        @Override public void onReceive(Context c,Intent i){
            if(!ACTION.equals(i.getAction()))return;
            int next=i.getIntExtra("sequence",-1);String command=i.getStringExtra("command");
            int admission=IslandFixtureProtocol.admit(runId,secret,sequence,deadline,closed,i.getStringExtra("runId"),i.getStringExtra("secret"),next,command,SystemClock.elapsedRealtime());
            if(admission==IslandFixtureProtocol.REJECT)return;
            try{if(admission==IslandFixtureProtocol.EXPIRED){cleanup("timeout");return;}
                if(audio.isMusicActive()){error="External audible media became active";cleanup("external_audio");return;}
                sequence=next;execute(command);
            }catch(Throwable failure){error=failure.toString();cleanup("command_error");}
        }
    };
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        Bundle result=new Bundle();int status=0;
        try{
            runId=arguments.getString("runId","");secret=arguments.getString("secret","");
            if(!IslandFixtureProtocol.identity(runId)||!IslandFixtureProtocol.identity(secret))throw new IllegalArgumentException("Invalid run identity");
            context=getTargetContext();started=SystemClock.elapsedRealtime();deadline=started+175000;
            channel="island-"+runId;tag="island-"+runId;
            progress=new AtomicFile(new File(context.getCacheDir(),"island-"+runId+".json"));
            onMain(this::initialize);
            while(!finished&&SystemClock.elapsedRealtime()<deadline+1000)SystemClock.sleep(100);
            if(!finished)onMain(()->cleanup("deadline"));
            result.putString("status",error.isEmpty()?"pass":"fail");result.putString("error",error);
            result.putString("runId",runId);status=error.isEmpty()?-1:0;
        }catch(Throwable failure){error=failure.toString();try{onMain(()->cleanup("runner_error"));}catch(Throwable ignored){}
            result.putString("status","fail");result.putString("error",error);
        }finally{active=null;finish(status,result);}
    }
    private void onMain(Runnable task){final Throwable[] failure={null};runOnMainSync(()->{try{task.run();}catch(Throwable t){failure[0]=t;}});
        if(failure[0]!=null)throw new IllegalStateException(failure[0]);}
    private void initialize(){
        if(!PACKAGE.equals(context.getPackageName()))throw new IllegalStateException("Wrong fixture target");
        notifications=context.getSystemService(NotificationManager.class);audio=context.getSystemService(AudioManager.class);
        if(notifications==null||!notifications.areNotificationsEnabled())throw new IllegalStateException("Fixture notification permission unavailable");
        if(audio==null||audio.isMusicActive())throw new IllegalStateException("User audio must be idle before fixture starts");
        KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
        if(keyguard==null||keyguard.isKeyguardLocked())throw new IllegalStateException("Unlocked foreground required; never unlock user credentials");
        NotificationChannel nc=new NotificationChannel(channel,"Duo 灵动岛临时事件",NotificationManager.IMPORTANCE_DEFAULT);
        nc.setSound(null,null);nc.enableVibration(false);nc.enableLights(false);nc.setShowBadge(false);
        notifications.createNotificationChannel(nc);channelCreated=true;
        // Only shell/system with DUMP may drive this private, nonce-scoped test receiver.
        context.registerReceiver(commands,new IntentFilter(ACTION),"android.permission.DUMP",main,Context.RECEIVER_EXPORTED);receiverRegistered=true;
        cover=Bitmap.createBitmap(96,96,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(cover);canvas.drawColor(0xff007f75);
        Paint p=new Paint(3);p.setColor(Color.WHITE);p.setTextSize(55);canvas.drawText("D",27,68,p);
        session=new MediaSession(context,"DuoIsland-"+runId);released=false;
        session.setSessionActivity(sourceIntent("media"));
        session.setMetadata(new MediaMetadata.Builder().putString(MediaMetadata.METADATA_KEY_MEDIA_ID,runId)
                .putString(MediaMetadata.METADATA_KEY_TITLE,"DuoIsland "+runId)
                .putString(MediaMetadata.METADATA_KEY_ARTIST,"自有无声测试事件")
                .putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART,cover).build());
        playback(PlaybackState.STATE_PAUSED);session.setActive(true);
        active=this;
        context.startActivity(new Intent(context,BackgroundActivity.class).putExtra("runId",runId).putExtra("secret",secret).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        phase="initial-paused";event("ready");
        main.postDelayed(()->cleanup("timeout"),Math.max(1,deadline-SystemClock.elapsedRealtime()));
    }
    private void execute(String command){
        switch(command){
            case "play":requireSession();playback(PlaybackState.STATE_PLAYING);phase="playing";break;
            case "pause":requireSession();playback(PlaybackState.STATE_PAUSED);phase="paused";break;
            case "stop":requireSession();playback(PlaybackState.STATE_STOPPED);phase="stopped";break;
            case "release":if(session!=null){session.setActive(false);session.release();session=null;}released=true;phase="released";break;
            case "notice-expiry":requireReleased();post(1,"EXPIRY");phase="notice-expiry";break;
            case "notice-click":requireReleased();post(2,"CLICK");phase="notice-click";break;
            case "finish":cleanup("command_finish");return;
            case "observe":break;
            default:throw new IllegalArgumentException("Unknown command");
        }
        event(command);
    }
    private void requireSession(){if(session==null||released)throw new IllegalStateException("Session released");}
    private void requireReleased(){if(!released)throw new IllegalStateException("Notification proof requires released fixture media");}
    private void playback(int state){playback=state;session.setPlaybackState(new PlaybackState.Builder().setActions(0)
            .setState(state,0,state==PlaybackState.STATE_PLAYING?1:0,SystemClock.elapsedRealtime()).build());}
    private PendingIntent sourceIntent(String kind){
        Intent i=new Intent(context,ContentActivity.class).setData(Uri.parse("duo-island://"+runId+"/"+kind))
                .putExtra("runId",runId).putExtra("secret",secret).putExtra("kind",kind).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return PendingIntent.getActivity(context,kind.hashCode(),i,PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);
    }
    private void post(int id,String kind){notifications.notify(tag,id,new Notification.Builder(context,channel)
            .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("DuoIsland "+runId+" "+kind)
            .setContentText("自有普通通知：到期只收起灵动岛，不撤回此通知。")
            .setContentIntent(sourceIntent(kind)).setVisibility(Notification.VISIBILITY_PUBLIC)
            .setAutoCancel(false).setTimeoutAfter(IslandFixtureProtocol.notificationTimeout(deadline,SystemClock.elapsedRealtime())).build());}
    private boolean valid(Intent i){return runId!=null&&runId.equals(i.getStringExtra("runId"))&&secret.equals(i.getStringExtra("secret"))&&!closed;}
    private void sourceOpened(ContentActivity activity){
        if(!valid(activity.getIntent())){activity.finish();return;}
        content=activity;clicks++;event("content_opened");
    }
    private void event(String name){
        try{events.put(new JSONObject().put("event",name).put("sequence",sequence).put("atElapsed",SystemClock.elapsedRealtime()).put("phase",phase));persist();}
        catch(Exception e){error="Evidence write failed: "+e;}
    }
    private void persist()throws Exception{
        if(progress==null)return;JSONArray ids=new JSONArray();
        if(notifications!=null)for(android.service.notification.StatusBarNotification n:notifications.getActiveNotifications())if(tag.equals(n.getTag()))ids.put(n.getId());
        JSONObject report=new JSONObject().put("schema",1).put("fixtureRevision","island-lifecycle-r1").put("package",PACKAGE)
                .put("runId",runId).put("pid",android.os.Process.myPid()).put("startedElapsed",started).put("deadlineElapsed",deadline)
                .put("observedElapsed",SystemClock.elapsedRealtime()).put("phase",phase).put("sequence",sequence)
                .put("playbackState",playback).put("sessionReleased",released).put("sessionToken",session==null?JSONObject.NULL:session.getSessionToken().toString())
                .put("channel",channel).put("notificationTag",tag).put("ownNotificationIds",ids).put("contentCallbacks",clicks)
                .put("contentKind",content==null?JSONObject.NULL:content.getIntent().getStringExtra("kind"))
                .put("receiverRegistered",receiverRegistered).put("channelPresent",notifications!=null&&channel!=null&&notifications.getNotificationChannel(channel)!=null)
                .put("activitiesFinishing",(background==null||background.isFinishing())&&(content==null||content.isFinishing()))
                .put("closed",closed).put("error",error).put("audioOutput",false).put("audioFocusRequested",false)
                .put("musicActive",audio!=null&&audio.isMusicActive()).put("events",events);
        FileOutputStream stream=null;try{stream=progress.startWrite();stream.write(report.toString().getBytes(StandardCharsets.UTF_8));progress.finishWrite(stream);}
        catch(Throwable failure){progress.failWrite(stream);throw failure;}
    }
    private void cleanup(String reason){
        if(closed)return;closed=true;phase="closed";
        try{if(session!=null){session.setActive(false);session.release();session=null;}released=true;}catch(Throwable t){error+=";release:"+t;}
        try{if(notifications!=null&&tag!=null){notifications.cancel(tag,1);notifications.cancel(tag,2);if(channelCreated)notifications.deleteNotificationChannel(channel);}}catch(Throwable t){error+=";notifications:"+t;}
        try{if(receiverRegistered){context.unregisterReceiver(commands);receiverRegistered=false;}}catch(Throwable t){error+=";receiver:"+t;}
        if(background!=null)background.finish();if(content!=null)content.finish();if(cover!=null){cover.recycle();cover=null;}
        event(reason);finished=true;
    }
    public static final class BackgroundActivity extends Activity {
        @Override public void onCreate(Bundle state){super.onCreate(state);IslandFixtureRunner r=active;
            if(r==null||!r.valid(getIntent())){finish();return;}r.background=this;
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            TextView v=new TextView(this);v.setTextSize(20);v.setTextColor(Color.DKGRAY);v.setBackgroundColor(0xffeeeeee);v.setPadding(24,160,24,24);
            v.setText("Duo 灵动岛事件验证\n"+r.runId+"\n\n无声媒体与自有通知；最长175秒后自动结束。");setContentView(v);}
    }
    public static final class ContentActivity extends Activity {
        @Override public void onCreate(Bundle state){super.onCreate(state);IslandFixtureRunner r=active;
            if(r==null||!r.valid(getIntent())){finish();return;}r.sourceOpened(this);
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            TextView v=new TextView(this);v.setTextSize(20);v.setTextColor(Color.DKGRAY);v.setBackgroundColor(Color.WHITE);v.setPadding(24,160,24,24);
            v.setText("Duo 已打开自有来源\n"+r.runId+"\n"+getIntent().getStringExtra("kind"));setContentView(v);}
    }
}
