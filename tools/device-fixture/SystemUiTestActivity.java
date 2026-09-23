package ls.augment.validation;

import android.Manifest;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.Arrays;

/** Local-only SystemUI fixture. Audio samples are discarded; no files or network access. */
public final class SystemUiTestActivity extends Activity {
    private static final int MICROPHONE_PERMISSION=11,NOTIFICATION_PERMISSION=12,NOTIFICATION_ID=8801;
    private static final String CHANNEL="systemui-audible-v1";
    private TextView status;
    private AudioRecord microphone;
    private volatile boolean recording;

    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(24),dp(36),dp(24),dp(24));content.setBackgroundColor(Color.WHITE);
        TextView title=new TextView(this);title.setText("LS 系统界面验收");title.setTextColor(Color.BLACK);title.setTextSize(24);content.addView(title);
        TextView description=new TextView(this);description.setText("麦克风仅读取并丢弃内存采样，不保存录音。离开此页或满两分钟自动停止。\n测试通知最多保留 30 秒。此应用不联网，也不读取个人数据。");description.setTextSize(16);description.setPadding(0,dp(12),0,dp(12));content.addView(description);
        status=new TextView(this);status.setText("就绪：麦克风未启动");status.setTextSize(18);status.setContentDescription("fixture_status");content.addView(status);
        button(content,"启动麦克风（不保存录音）","fixture_mic_start",v->requestMicrophone());
        button(content,"停止麦克风","fixture_mic_stop",v->stopMicrophone("麦克风已停止，采样未保存"));
        button(content,"发送测试通知（声音与振动）","fixture_notification_send",v->requestNotification());
        button(content,"清除测试通知","fixture_notification_clear",v->{getSystemService(NotificationManager.class).cancel(NOTIFICATION_ID);status.setText("测试通知已清除");});
        button(content,"打开安全截图测试页","fixture_secure_open",v->startActivity(new Intent(this,SecureTestActivity.class)));
        ScrollView scroll=new ScrollView(this);scroll.addView(content);setContentView(scroll);
    }

    private void requestMicrophone(){
        if(checkSelfPermission(Manifest.permission.RECORD_AUDIO)!=PackageManager.PERMISSION_GRANTED){requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO},MICROPHONE_PERMISSION);return;}
        startMicrophone();
    }

    private void startMicrophone(){
        if(microphone!=null){status.setText("麦克风正在使用：未保存录音");return;}
        AudioRecord session=null;
        try{
            int minimum=AudioRecord.getMinBufferSize(16000,AudioFormat.CHANNEL_IN_MONO,AudioFormat.ENCODING_PCM_16BIT);
            if(minimum<=0)throw new IllegalStateException("设备未提供测试采样格式");
            session=new AudioRecord(MediaRecorder.AudioSource.MIC,16000,AudioFormat.CHANNEL_IN_MONO,AudioFormat.ENCODING_PCM_16BIT,Math.max(minimum,6400));
            if(session.getState()!=AudioRecord.STATE_INITIALIZED)throw new IllegalStateException("麦克风初始化失败");
            session.startRecording();
            if(session.getRecordingState()!=AudioRecord.RECORDSTATE_RECORDING)throw new IllegalStateException("麦克风未启动");
            microphone=session;recording=true;status.setText("麦克风正在使用：采样读取后立即丢弃\n请观察状态栏隐私提醒");
            android.util.Log.i("LSA-Validation","microphone_started;stored_audio=false");
            final AudioRecord active=session;
            new Thread(()->{
                short[] samples=new short[1600];long end=SystemClock.elapsedRealtime()+120_000;
                try{
                    while(recording&&SystemClock.elapsedRealtime()<end){
                        int count=active.read(samples,0,samples.length,AudioRecord.READ_BLOCKING);
                        Arrays.fill(samples,(short)0);
                        if(count<0)break;
                    }
                }catch(IllegalStateException released){/* Leaving the page stops the active read. */}
                finally{
                    Arrays.fill(samples,(short)0);
                    runOnUiThread(()->{if(microphone==active)stopMicrophone("麦克风测试已结束，采样未保存");});
                }
            },"LS-validation-microphone").start();
        }catch(RuntimeException failure){
            if(session!=null){try{session.release();}catch(RuntimeException ignored){ }}
            microphone=null;recording=false;status.setText("麦克风未启动："+failure.getClass().getSimpleName());
            android.util.Log.w("LSA-Validation","microphone_start_failed",failure);
        }
    }

    private void stopMicrophone(String message){
        recording=false;AudioRecord active=microphone;microphone=null;
        if(active!=null){try{active.stop();}catch(RuntimeException ignored){ }finally{active.release();}android.util.Log.i("LSA-Validation","microphone_stopped;stored_audio=false");}
        if(status!=null)status.setText(message);
    }

    private void requestNotification(){
        if(Build.VERSION.SDK_INT>=33&&checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)!=PackageManager.PERMISSION_GRANTED){requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS},NOTIFICATION_PERMISSION);return;}
        sendNotification();
    }

    private void sendNotification(){
        NotificationManager manager=getSystemService(NotificationManager.class);
        NotificationChannel channel=new NotificationChannel(CHANNEL,"LS 声音与振动验收",NotificationManager.IMPORTANCE_HIGH);
        channel.enableVibration(true);channel.setVibrationPattern(new long[]{0,120});
        channel.setSound(Settings.System.DEFAULT_NOTIFICATION_URI,new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_NOTIFICATION).build());manager.createNotificationChannel(channel);
        PendingIntent open=PendingIntent.getActivity(this,0,new Intent(this,SystemUiTestActivity.class),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
        manager.notify(NOTIFICATION_ID,new Notification.Builder(this,CHANNEL).setSmallIcon(android.R.drawable.ic_dialog_info)
                .setContentTitle("LS 测试通知").setContentText("用于验证通知图标、声音和振动；30 秒后自动清除")
                .setContentIntent(open).setAutoCancel(true).setTimeoutAfter(30_000).build());
        status.setText(manager.areNotificationsEnabled()?"测试通知已发送；30 秒后自动清除":"系统已关闭此应用的通知，请先开启通知权限");
        android.util.Log.i("LSA-Validation","notification_sent;channel="+CHANNEL+";timeout_ms=30000");
    }

    @Override public void onRequestPermissionsResult(int request,String[] permissions,int[] results){
        super.onRequestPermissionsResult(request,permissions,results);
        if(results.length==0||results[0]!=PackageManager.PERMISSION_GRANTED){status.setText("未授予权限，测试未启动");return;}
        if(request==MICROPHONE_PERMISSION)startMicrophone();else if(request==NOTIFICATION_PERMISSION)sendNotification();
    }
    @Override public void onPause(){stopMicrophone("麦克风已停止：已离开测试页");super.onPause();}
    @Override public void onDestroy(){stopMicrophone("测试已结束");getSystemService(NotificationManager.class).cancel(NOTIFICATION_ID);super.onDestroy();}
    private int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}
    private void button(LinearLayout parent,String label,String identity,View.OnClickListener listener){Button button=new Button(this);button.setText(label);button.setAllCaps(false);button.setContentDescription(identity);button.setOnClickListener(listener);LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.topMargin=dp(10);parent.addView(button,params);}
}
