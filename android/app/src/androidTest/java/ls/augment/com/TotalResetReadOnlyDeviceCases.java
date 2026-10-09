package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.inspector.WindowInspector;
import android.widget.Button;
import android.widget.TextView;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/** Inspects and cancels confirmation; never confirms or seeds the user's reset. */
final class TotalResetReadOnlyDeviceCases {
    static JSONObject run(Instrumentation test) throws Exception {
        Map<String,?> before=test.getTargetContext().getSharedPreferences(AppConfig.PREFS,0).getAll();
        Activity activity=test.startActivitySync(new Intent(test.getTargetContext(),ConfigTransferActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK).putExtra("action","reset"));
        try {
            SystemClock.sleep(450);test.waitForIdleSync();
            AtomicBoolean words=new AtomicBoolean(),cancelled=new AtomicBoolean();
            test.runOnMainSync(()->{
                StringBuilder content=new StringBuilder();for(View root:WindowInspector.getGlobalWindowViews())text(root,content);
                String copy=content.toString();
                words.set(copy.contains("恢复显示")&&copy.contains("全部应用名单")&&copy.contains("健康绑定凭证")
                        &&copy.contains("恢复失败时保留")&&copy.contains("无法可靠还原")
                        &&!copy.contains("当前隐藏状态与诊断日志保留"));
                for(View root:WindowInspector.getGlobalWindowViews())if(cancel(root)){cancelled.set(true);break;}
            });
            if(!words.get()||!cancelled.get())throw new AssertionError("Total reset confirmation scope or Cancel missing");
            SystemClock.sleep(250);test.waitForIdleSync();
            if(!before.equals(test.getTargetContext().getSharedPreferences(AppConfig.PREFS,0).getAll()))
                throw new AssertionError("Opening/cancelling changed personal settings");
            return new JSONObject().put("success",true).put("confirmationExplainsRestorationAndCleanup",true)
                    .put("historicalLimitsVisible",true).put("cancelLeavesConfigurationUnchanged",true)
                    .put("actualResetExecuted",false);
        } finally {test.runOnMainSync(()->{if(!activity.isDestroyed())activity.finish();});}
    }
    private static void text(View view,StringBuilder content){
        if(view instanceof TextView)content.append(((TextView)view).getText()).append('\n');
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)text(((ViewGroup)view).getChildAt(i),content);
    }
    private static boolean cancel(View view){
        if(view instanceof Button&&"取消".contentEquals(((Button)view).getText()))return view.performClick();
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(cancel(((ViewGroup)view).getChildAt(i)))return true;
        return false;
    }
}
