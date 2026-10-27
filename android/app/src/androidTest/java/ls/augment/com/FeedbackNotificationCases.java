package ls.augment.com;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import org.json.JSONObject;

/** Bounded, silent notification fixture. Only owns this tag and channel. */
final class FeedbackNotificationCases {
    private static final String TAG="duo_feedback_20261026",CHANNEL="duo_feedback_cascade";
    static JSONObject run(Context context,boolean clear)throws Exception {
        NotificationManager manager=context.getSystemService(NotificationManager.class);
        if(clear){
            for(int i=0;i<8;i++)manager.cancel(TAG,i);
            manager.deleteNotificationChannel(CHANNEL);
        }else{
            if(!manager.areNotificationsEnabled())throw new IllegalStateException("Fixture notification permission unavailable");
            NotificationChannel channel=new NotificationChannel(CHANNEL,"Duo 堆叠临时验证",NotificationManager.IMPORTANCE_LOW);
            channel.setSound(null,null);channel.enableVibration(false);channel.setShowBadge(false);manager.createNotificationChannel(channel);
            for(int i=0;i<8;i++){
                Notification.Builder builder=new Notification.Builder(context,CHANNEL)
                        .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("Duo 堆叠验证 "+(i+1))
                        .setContentText("临时验证通知，测试结束后自动清理")
                        .setGroup(TAG+"_"+i).setOnlyAlertOnce(true).setVisibility(Notification.VISIBILITY_PUBLIC)
                        .setTimeoutAfter(180000);
                if(i==7)builder.setStyle(new Notification.BigTextStyle().bigText("第一张卡片保持原生字号。\n后方卡片逐层缩进和渐变。\n上滑列表可继续查看。"));
                manager.notify(TAG,i,builder.build());
            }
        }
        return new JSONObject().put("cleared",clear).put("tag",TAG).put("maxLifetimeMs",180000);
    }
    private FeedbackNotificationCases(){}
}
