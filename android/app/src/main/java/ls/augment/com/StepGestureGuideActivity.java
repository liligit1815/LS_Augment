package ls.augment.com;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import ls.augment.com.step.CornerEntryPolicy;
import ls.augment.com.step.StepRuntime;

/** A real status-bar practice: drawing only, never a second gesture detector. */
public final class StepGestureGuideActivity extends Activity {
    static SharedPreferences prefs(Context c){return c.getSharedPreferences("step_entry_guide",Context.MODE_PRIVATE);}
    static boolean needsOffer(Context c){return !prefs(c).getBoolean("offered",false) && !prefs(c).getBoolean("completed",false);}
    static void offer(Activity owner){
        if(owner.isFinishing() || owner.isDestroyed() || !StepConfig.enabled(owner) || !needsOffer(owner))return;
        if(prefs(owner).edit().putBoolean("offered",true).commit())owner.startActivity(new Intent(owner,StepGestureGuideActivity.class));
    }
    final Handler main=new Handler(Looper.getMainLooper());
    UiKit ui;
    TextView state;
    Hints hints;
    ValueAnimator animator;
    long began,generation;
    boolean resumed,waiting,finished;
    int request;
    final Runnable poll=()->probe();

    @Override public void onCreate(Bundle saved){
        super.onCreate(saved);generation=ResetWriteFence.generation();
        began=saved==null?SystemClock.elapsedRealtime():saved.getLong("began",SystemClock.elapsedRealtime());
        prefs(this).edit().putBoolean("offered",true).apply();
        ui=new UiKit(this);
        LinearLayout body=ui.detailPage("手势引导","device");
        ui.addDetailSectionTitle(body,"试着打开一次");
        LinearLayout card=ui.preferenceCard();body.addView(card,ui.wrap());
        TextView instruction=ui.text("从顶部高亮区域向中间横滑",16,ui.text,true);
        card.addView(instruction,ui.margins(0,12,0,8));
        TextView detail=ui.text("手指放在时钟或电池所在的状态栏角部，向屏幕中间快速横滑。\n\n左上角向右滑，右上角向左滑。不要从状态栏下方起滑，也不要向下拖。",14,ui.muted,false);
        detail.setLineSpacing(ui.dp(3),1.05f);card.addView(detail,ui.wrap());
        TextView arrows=ui.text("左上角  →      ←  右上角",16,ui.accent,true);
        arrows.setGravity(Gravity.CENTER);card.addView(arrows,ui.margins(0,20,0,16));
        state=ui.text("等待你的手势…",13,ui.muted,false);state.setTag("step-entry-guide-state");
        state.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);card.addView(state,ui.margins(0,0,0,12));
        Button later=ui.textButton("稍后练习");later.setOnClickListener(v->finish());body.addView(later,ui.margins(0,8,0,0));
        // The native status-bar window continues receiving all touch events.
        // This drawable has no input channel and uses current window insets.
        getWindow().setStatusBarColor(Color.TRANSPARENT);
        hints=new Hints();View decor=getWindow().getDecorView();decor.getOverlay().add(hints);
        decor.addOnLayoutChangeListener((v,l,t,r,b,oldL,oldT,oldR,oldB)->hints.setBounds(0,0,r-l,b-t));
        decor.post(()->{hints.setBounds(0,0,decor.getWidth(),decor.getHeight());hints.invalidateSelf();});
    }
    @Override protected void onResume(){
        super.onResume();resumed=true;main.post(poll);
        if(ValueAnimator.areAnimatorsEnabled()){
            animator=ValueAnimator.ofFloat(0,1);animator.setDuration(1500);animator.setRepeatCount(ValueAnimator.INFINITE);
            animator.addUpdateListener(a->{hints.phase=(Float)a.getAnimatedValue();hints.invalidateSelf();});animator.start();
        }
    }
    @Override protected void onPause(){
        resumed=false;request++;waiting=false;main.removeCallbacksAndMessages(null);
        if(animator!=null){animator.cancel();animator.removeAllUpdateListeners();animator=null;}
        super.onPause();
    }
    @Override protected void onDestroy(){if(hints!=null)getWindow().getDecorView().getOverlay().remove(hints);super.onDestroy();}
    @Override protected void onSaveInstanceState(Bundle out){out.putLong("began",began);super.onSaveInstanceState(out);}
    void probe(){
        if(!resumed || waiting || finished || isFinishing())return;
        if(!StepConfig.enabled(this)){state.setText("请返回红魔Step设置，先开启工作台。");return;}
        waiting=true;int token=++request;
        main.postDelayed(()->{
            if(request!=token || !resumed || finished)return;
            request++;waiting=false;state.setText("入口暂未响应，请返回红魔Step检查接入。");main.postDelayed(poll,1000);
        },1500);
        StepRuntime.query(this,"com.android.systemui",new ResultReceiver(main){
            @Override protected void onReceiveResult(int code,Bundle answer){
                if(request!=token || !resumed || finished || isFinishing())return;
                request++;waiting=false;
                if(answer==null || answer.getInt("version")!=BuildConfig.VERSION_CODE){state.setText("更新后请重启手机，再来练习手势。");return;}
                if(code!=1 || !answer.getBoolean("entryEnabled")){state.setText("入口尚未就绪，请返回红魔Step检查接入。");main.postDelayed(poll,1000);return;}
                long completed=answer.getLong("entryCompletedAt",0);
                if(CornerEntryPolicy.completedAfter(began,SystemClock.elapsedRealtime(),completed)){
                    finished=true;
                    if(!ResetWriteFence.stale(generation))prefs(StepGestureGuideActivity.this).edit().putBoolean("completed",true).apply();
                    Toast.makeText(StepGestureGuideActivity.this,"已进入红魔Step",Toast.LENGTH_SHORT).show();finish();return;
                }
                String reason=answer.getLong("entryReasonAt",0)>=began?answer.getString("entryReason",""):"";
                switch(reason){
                    case "distance_short":state.setText("再向屏幕中间多滑一点。");break;
                    case "not_inward_horizontal":state.setText("尽量横着滑，不要向下拖。");break;
                    case "stream_cancelled":state.setText("用一根手指快速横滑，不要停留太久。");break;
                    case "recognized":case "launch_submitted":state.setText("正在打开红魔Step…");break;
                    default:state.setText("等待你的手势…");
                }
                main.postDelayed(poll,350);
            }
        });
    }
    final class Hints extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);float phase;
        @Override public void draw(Canvas canvas){
            View decor=getWindow().getDecorView();WindowInsets insets=decor.getRootWindowInsets();
            if(insets==null || !insets.isVisible(WindowInsets.Type.statusBars()))return;
            int width=decor.getWidth(),height=CornerEntryPolicy.height(insets.getInsets(WindowInsets.Type.statusBars()).top,getResources().getDisplayMetrics().density);
            int edge=CornerEntryPolicy.edge(width,getResources().getDisplayMetrics().density);if(height<=0 || edge<=0)return;
            paint.setColor(ui.accent);paint.setStyle(Paint.Style.FILL);paint.setAlpha(42);
            canvas.drawRect(0,0,edge,height,paint);canvas.drawRect(width-edge,0,width,height,paint);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(ui.dp(2));paint.setAlpha(200);
            canvas.drawLine(0,height-2,edge,height-2,paint);canvas.drawLine(width-edge,height-2,width,height-2,paint);
            float distance=ui.dp(CornerEntryPolicy.INWARD_DP),y=height*.5f;
            paint.setStyle(Paint.Style.FILL);paint.setAlpha(180);
            float progress=animator==null?.35f:Math.min(1,phase/.75f);
            canvas.drawCircle(ui.dp(18)+distance*progress,y,ui.dp(3),paint);
            canvas.drawCircle(width-ui.dp(18)-distance*progress,y,ui.dp(3),paint);
        }
        @Override public void setAlpha(int alpha){}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
