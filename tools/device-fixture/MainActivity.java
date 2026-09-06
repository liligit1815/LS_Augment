package ls.augment.validation;

import android.app.Activity;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.widget.TextView;

/** Isolated target for hide/freeform validation and physical tap cadence capture. */
public final class MainActivity extends Activity {
    private int downs, ups;
    private long first, last;
    private TextView view;
    private volatile boolean playing;
    private android.media.AudioTrack audio;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        String target = getIntent().getStringExtra("component");
        if (target != null) {
            android.content.ComponentName component = android.content.ComponentName.unflattenFromString(target);
            if (component == null) throw new IllegalArgumentException("Invalid validation component");
            android.content.Intent launch = new android.content.Intent(android.content.Intent.ACTION_MAIN)
                    .addCategory(android.content.Intent.CATEGORY_LAUNCHER).setComponent(component)
                    .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            String data=getIntent().getStringExtra("data");if(data!=null)launch.setData(android.net.Uri.parse(data));
            Bundle options = new Bundle();
            options.putInt("android.activity.windowingMode", 5);
            options.putBoolean("WindowReply", true);
            options.putInt("Start_WindowReply_Mode", 0);
            startActivity(launch, options);
            finish();
            return;
        }
        view = new TextView(this);
        view.setTextSize(24);
        view.setGravity(android.view.Gravity.CENTER);
        view.setText("LS 功能验收\n隐藏与小窗测试应用\n点击此处测量输入次数");
        setContentView(view);
        getWindow().getDecorView().setSystemUiVisibility(android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        int notificationCount=getIntent().getIntExtra("notifications",0);
        if(notificationCount>0){
            android.app.NotificationManager manager=getSystemService(android.app.NotificationManager.class);
            manager.createNotificationChannel(new android.app.NotificationChannel("status-test","LS 状态栏验收",android.app.NotificationManager.IMPORTANCE_LOW));
            for(int i=0;i<Math.min(20,notificationCount);i++)manager.notify(7000+i,new android.app.Notification.Builder(this,"status-test")
                    .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("LS 状态栏验收 "+(i+1))
                    .setContentText("退出测试应用后自动清除").setGroup("LS-validation-"+i).build());
            view.setText("状态栏图标验收\n临时通知 "+notificationCount+" 条\n结束后自动清除");
        }
        if (getIntent().getBooleanExtra("audio", false)) {
            audio = new android.media.AudioTrack.Builder()
                    .setAudioAttributes(new android.media.AudioAttributes.Builder()
                            .setUsage(getIntent().getIntExtra("usage",android.media.AudioAttributes.USAGE_MEDIA))
                            .setContentType(android.media.AudioAttributes.CONTENT_TYPE_MUSIC).build())
                    .setAudioFormat(new android.media.AudioFormat.Builder().setSampleRate(48000)
                            .setEncoding(android.media.AudioFormat.ENCODING_PCM_16BIT)
                            .setChannelMask(android.media.AudioFormat.CHANNEL_OUT_MONO).build())
                    .setBufferSizeInBytes(9600).setTransferMode(android.media.AudioTrack.MODE_STREAM).build();
            playing = true;
            view.setText("音频通道验收\n使用静音采样，不发出测试声\n会话 " + audio.getAudioSessionId());
            android.util.Log.i("LSA-Validation", "audio_session=" + audio.getAudioSessionId());
            audio.play();
            new Thread(() -> {
                short[] silence = new short[2400]; long end = SystemClock.elapsedRealtime() + 180_000;
                android.media.AudioTrack track = audio;
                while (playing && SystemClock.elapsedRealtime() < end) {
                    try{if (track.write(silence, 0, silence.length) < 0) break;}catch(IllegalStateException released){break;}
                }
            }, "LS-validation-audio").start();
        }
        view.setOnTouchListener((v, event) -> {
            long now = SystemClock.elapsedRealtime();
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                if (now - last > 3000) { downs = ups = 0; first = now; }
                downs++;
            } else if (event.getActionMasked() == MotionEvent.ACTION_UP) ups++;
            else return true;
            last = now;
            double cps = downs < 2 || now == first ? 0 : (downs - 1) * 1000.0 / (now - first);
            String text = "按下 " + downs + " 次\n松开 " + ups + " 次\n"
                    + String.format(java.util.Locale.US, "%.2f 次/秒", cps);
            view.setText(text);
            android.util.Log.i("LSA-Validation", "t=" + now + ";action=" + event.getActionMasked()
                    + ";down=" + downs + ";up=" + ups + ";cps=" + cps);
            return true;
        });
    }
    @Override public void onDestroy() {
        getSystemService(android.app.NotificationManager.class).cancelAll();
        playing = false;
        if (audio != null) { audio.stop(); audio.release(); audio = null; }
        super.onDestroy();
    }
}
