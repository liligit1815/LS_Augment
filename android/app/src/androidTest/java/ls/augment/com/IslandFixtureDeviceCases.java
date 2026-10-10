package ls.augment.com;

import android.app.Instrumentation;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;

/** Temporary local media/notification fixture; never shipped in the release APK. */
final class IslandFixtureDeviceCases {
    static JSONObject run(Instrumentation test,Bundle args)throws Exception{
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(),values=new LinkedHashMap<>();
        values.put(SystemUiOptions.ISLAND,"1");
        values.put(SystemUiOptions.NOTIFICATION_MEDIA_HIDE,args.getString("hide","0"));
        values.put("ls_augment_rm_island_music",args.getString("music","1"));values.put("ls_augment_rm_island_notifications","1");
        values.put("ls_augment_rm_island_charging","1");values.put("ls_augment_rm_island_notice_seconds","10");
        values.put(SystemUiOptions.ISLAND_OFFSET_Y,args.getString("offsetY",config.get(SystemUiOptions.ISLAND_OFFSET_Y)));
        values.put(SystemUiOptions.ISLAND_TRANSPARENT,args.getString("transparent",config.get(SystemUiOptions.ISLAND_TRANSPARENT)));
        values.put(SystemUiOptions.ISLAND_APP_STYLE,args.getString("appStyle",config.get(SystemUiOptions.ISLAND_APP_STYLE)));
        values.put("ls_augment_rm_statusbar_hide",config.get("ls_augment_rm_statusbar_hide"));
        for(String key:values.keySet())before.put(key,config.get(key));
        NotificationManager notifications=context.getSystemService(NotificationManager.class);
        final String channel="duo_island_regression";
        NotificationChannel previous=notifications.getNotificationChannel(channel);
        if(previous==null){NotificationChannel c=new NotificationChannel(channel,"灵动岛临时验证",NotificationManager.IMPORTANCE_DEFAULT);c.setSound(null,null);c.enableVibration(false);notifications.createNotificationChannel(c);}
        MediaSession session=new MediaSession(context,"DuoIslandRegression");AtomicInteger pauses=new AtomicInteger(),plays=new AtomicInteger(),skips=new AtomicInteger();
        long actions=PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_PLAY_PAUSE|PlaybackState.ACTION_SKIP_TO_NEXT|PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        Handler main=new Handler(Looper.getMainLooper());
        session.setCallback(new MediaSession.Callback(){
            @Override public void onPause(){pauses.incrementAndGet();session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(PlaybackState.STATE_PAUSED,12000,0).build());}
            @Override public void onPlay(){plays.incrementAndGet();session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(PlaybackState.STATE_PLAYING,12000,1).build());}
            @Override public void onSkipToNext(){skips.incrementAndGet();session.setMetadata(new MediaMetadata.Builder().putString(MediaMetadata.METADATA_KEY_TITLE,"第二首 · 切歌成功").putString(MediaMetadata.METADATA_KEY_ARTIST,"红魔Duo测试").build());}
            @Override public void onSkipToPrevious(){skips.incrementAndGet();}
        },main);
        Bitmap cover=Bitmap.createBitmap(96,96,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(cover);canvas.drawColor(0xff008e83);Paint paint=new Paint(3);paint.setColor(Color.WHITE);paint.setTextSize(64);canvas.drawText("♪",20,72,paint);
        session.setMetadata(new MediaMetadata.Builder().putString(MediaMetadata.METADATA_KEY_TITLE,"红魔Duo · 音乐测试")
                .putString(MediaMetadata.METADATA_KEY_ARTIST,"手机端实时活动").putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART,cover).putLong(MediaMetadata.METADATA_KEY_DURATION,180000).build());
        PendingIntent open=PendingIntent.getActivity(context,20443,new Intent(context,SettingsActivity.class),PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_UPDATE_CURRENT);
        JSONObject report=new JSONObject();
        try{
            if(!config.save(values).success)throw new AssertionError("Cannot enable fixture configuration");
            int initialState=Integer.parseInt(args.getString("initialState",String.valueOf(PlaybackState.STATE_PLAYING)));
            session.setSessionActivity(open);session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(initialState,10000,initialState==PlaybackState.STATE_PLAYING?1:0).build());session.setActive(true);
            notifications.notify(204430,new Notification.Builder(context,channel).setSmallIcon(android.R.drawable.ic_media_play).setContentTitle("红魔Duo · 音乐测试")
                    .setContentText("手机端实时活动").setLargeIcon(cover).setContentIntent(open).setStyle(new Notification.MediaStyle().setMediaSession(session.getSessionToken())).build());
            long start=SystemClock.elapsedRealtime();int seconds=Math.max(20,Math.min(180,Integer.parseInt(args.getString("seconds","90"))));
            boolean posted=false,removed=false,hidden=false,restored=false,paused=false,resumed=false,stopped=false,statusHidden=false,statusShown=false,offsetChanged=false,styleChanged=false,appStyleChanged=false;
            int offsetAfter=Integer.parseInt(args.getString("offsetAfter","-1"));
            int styleAfter=Integer.parseInt(args.getString("styleAfter","-1"));
            int appStyleAfter=Integer.parseInt(args.getString("appStyleAfter","-1"));
            int pauseAfter=Integer.parseInt(args.getString("pauseAfter","-1"));
            int resumeAfter=Integer.parseInt(args.getString("resumeAfter","-1"));
            int stopAfter=Integer.parseInt(args.getString("stopAfter","-1"));
            int statusHideAfter=Integer.parseInt(args.getString("statusHideAfter","-1"));
            int statusShowAfter=Integer.parseInt(args.getString("statusShowAfter","-1"));
            int hideAfter=Integer.parseInt(args.getString("hideAfter","-1"));
            int restoreAfter=Integer.parseInt(args.getString("restoreAfter","-1"));
            int noticeAfter=Integer.parseInt(args.getString("noticeAfter","45"));
            int noticeRemoveAfter=Integer.parseInt(args.getString("noticeRemoveAfter","60"));
            while(SystemClock.elapsedRealtime()-start<seconds*1000L){long elapsed=SystemClock.elapsedRealtime()-start;
                if(offsetAfter>=0&&elapsed>offsetAfter*1000L&&!offsetChanged){offsetChanged=true;
                    if(!config.save(java.util.Collections.singletonMap(SystemUiOptions.ISLAND_OFFSET_Y,args.getString("offsetTo","0"))).success)throw new AssertionError("Island vertical offset hot update failed");}
                if(styleAfter>=0&&elapsed>styleAfter*1000L&&!styleChanged){styleChanged=true;
                    if(!config.save(java.util.Collections.singletonMap(SystemUiOptions.ISLAND_TRANSPARENT,args.getString("transparentTo","0"))).success)throw new AssertionError("Island style hot update failed");}
                if(appStyleAfter>=0&&elapsed>appStyleAfter*1000L&&!appStyleChanged){appStyleChanged=true;
                    if(!config.save(java.util.Collections.singletonMap(SystemUiOptions.ISLAND_APP_STYLE,args.getString("appStyleTo","0"))).success)throw new AssertionError("Island app style hot update failed");}
                if(statusHideAfter>=0&&elapsed>statusHideAfter*1000L&&!statusHidden){statusHidden=true;if(!config.save(java.util.Collections.singletonMap("ls_augment_rm_statusbar_hide","1")).success)throw new AssertionError("Status hide failed");}
                if(statusShowAfter>=0&&elapsed>statusShowAfter*1000L&&!statusShown){statusShown=true;if(!config.save(java.util.Collections.singletonMap("ls_augment_rm_statusbar_hide","0")).success)throw new AssertionError("Status show failed");}
                if(pauseAfter>=0&&elapsed>pauseAfter*1000L&&!paused){paused=true;session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(PlaybackState.STATE_PAUSED,12000,0).build());}
                if(resumeAfter>=0&&elapsed>resumeAfter*1000L&&!resumed){resumed=true;session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(PlaybackState.STATE_PLAYING,12000,1).build());}
                if(stopAfter>=0&&elapsed>stopAfter*1000L&&!stopped){stopped=true;session.setPlaybackState(new PlaybackState.Builder().setActions(actions).setState(PlaybackState.STATE_STOPPED,12000,0).build());session.setActive(false);}
                if(hideAfter>=0&&elapsed>hideAfter*1000L&&!hidden){hidden=true;
                    if(!config.save(java.util.Collections.singletonMap(SystemUiOptions.NOTIFICATION_MEDIA_HIDE,"1")).success)throw new AssertionError("Hide save failed");}
                if(restoreAfter>=0&&elapsed>restoreAfter*1000L&&!restored){restored=true;
                    if(!config.save(java.util.Collections.singletonMap(SystemUiOptions.NOTIFICATION_MEDIA_HIDE,"0")).success)throw new AssertionError("Restore save failed");}
                if(elapsed>noticeAfter*1000L&&!posted){posted=true;notifications.notify(204431,new Notification.Builder(context,channel).setSmallIcon(android.R.drawable.ic_dialog_info)
                        .setContentTitle("灵动岛通知验证").setContentText("通知结束后自动恢复音乐活动").setContentIntent(open).build());}
                if(elapsed>noticeRemoveAfter*1000L&&!removed){removed=true;notifications.cancel(204431);}
                SystemClock.sleep(100);
            }
            report.put("pauseCallbacks",pauses.get()).put("playCallbacks",plays.get()).put("skipCallbacks",skips.get())
                    .put("pauseTransition",paused).put("resumeTransition",resumed).put("stopTransition",stopped).put("initialState",initialState)
                    .put("initialOffsetY",values.get(SystemUiOptions.ISLAND_OFFSET_Y)).put("initialTransparent",values.get(SystemUiOptions.ISLAND_TRANSPARENT))
                    .put("initialAppStyle",values.get(SystemUiOptions.ISLAND_APP_STYLE))
                    .put("offsetHotUpdate",offsetChanged).put("styleHotUpdate",styleChanged)
                    .put("appStyleHotUpdate",appStyleChanged).put("finalAppStyle",config.get(SystemUiOptions.ISLAND_APP_STYLE));
        }finally{
            session.setActive(false);session.release();notifications.cancel(204430);notifications.cancel(204431);
            if(previous==null)notifications.deleteNotificationChannel(channel);
            if(!config.save(before).success)throw new AssertionError("Fixture failed to restore configuration");
            cover.recycle();
        }
        for(Map.Entry<String,String> entry:before.entrySet())if(!entry.getValue().equals(config.get(entry.getKey())))throw new AssertionError("Config not restored: "+entry.getKey());
        return report.put("configurationRestored",true);
    }
}
