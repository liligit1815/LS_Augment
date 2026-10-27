package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Locale;
import ls.augment.com.GamePerformanceMonitorConfig;

/** Attached-window sampling only. Unavailable sensors are shown as unavailable, never zero. */
final class MonitorTelemetry implements View.OnAttachStateChangeListener {
    private static final String[] LABELS={"电池", "CPU", "GPU", "功耗"};
    private final ViewGroup content;
    private final TextView[] values=new TextView[4];
    private final Handler main=new Handler(Looper.getMainLooper());
    private volatile Handler worker;private HandlerThread thread;private long generation;
    private String selected="";private boolean enabled;
    MonitorTelemetry(ViewGroup content){
        this.content=content;Context context=content.getContext();
        TextView template=findText(content);
        for(int i=0;i<4;i++){
            LinearLayout cell=new LinearLayout(context);cell.setOrientation(LinearLayout.HORIZONTAL);cell.setGravity(Gravity.CENTER);
            TextView value=new TextView(context);values[i]=value;
            for(TextView text:new TextView[]{value}){
                text.setGravity(Gravity.CENTER);text.setSingleLine(true);text.setIncludeFontPadding(false);
                if(template!=null){text.setTextColor(template.getTextColors());text.setTypeface(template.getTypeface());
                    text.setTextSize(TypedValue.COMPLEX_UNIT_PX,template.getTextSize());}
            }
            value.setText(LABELS[i]+" —");
            // Reserve a full single-line reading at the OEM font size. Never
            // shrink the type to make a value fit beside its label.
            int width=(int)Math.ceil(value.getPaint().measureText(LABELS[i]+(i==3?" 000.0 W":" 000.0°C")))
                    +Math.round(8*context.getResources().getDisplayMetrics().density);
            cell.addView(value,new LinearLayout.LayoutParams(-1,-2));
            cell.setTag("duo.monitor."+GamePerformanceMonitorConfig.items()[i+5]);cell.setVisibility(View.GONE);
            content.addView(cell,new LinearLayout.LayoutParams(width,-1));
        }
        content.addOnAttachStateChangeListener(this);
    }
    void configure(boolean on,String selection){
        boolean changed=enabled!=on||!selected.equals(selection);enabled=on;selected=selection;
        if(changed){stop();start();}
    }
    void dispose(){stop();content.removeOnAttachStateChangeListener(this);}
    public void onViewAttachedToWindow(View v){start();}
    public void onViewDetachedFromWindow(View v){stop();}
    private void start(){
        if(worker!=null||!enabled||!content.isAttachedToWindow())return;
        boolean any=false;for(int i=5;i<9;i++)any|=GamePerformanceMonitorConfig.selected(selected,GamePerformanceMonitorConfig.items()[i]);
        if(!any)return;
        thread=new HandlerThread("Duo-game-sensors",android.os.Process.THREAD_PRIORITY_BACKGROUND);thread.start();
        Handler session=new Handler(thread.getLooper());worker=session;long token=++generation;String selection=selected;
        session.post(new Runnable(){public void run(){
            if(worker!=session)return;
            double[] sample=sample(content.getContext(),selection);
            main.post(()->{if(generation!=token||worker!=session)return;
                for(int i=0;i<4;i++)values[i].setText(LABELS[i]+" "+(Double.isFinite(sample[i])?String.format(Locale.ROOT,"%.1f%s",sample[i],i==3?" W":"°C"):"不可用"));});
            if(worker==session)session.postDelayed(this,2000);
        }});
    }
    private void stop(){++generation;Handler old=worker;worker=null;if(old!=null)old.removeCallbacksAndMessages(null);
        if(thread!=null){thread.quitSafely();thread=null;}}
    static double[] sample(Context context,String selection){
        double[] values={Double.NaN,Double.NaN,Double.NaN,Double.NaN};
        try{
            Intent battery=context.registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            if(battery!=null){
                int temperature=battery.getIntExtra(BatteryManager.EXTRA_TEMPERATURE,Integer.MIN_VALUE);
                if(temperature>=-200&&temperature<=1500)values[0]=temperature/10d;
                BatteryManager manager=context.getSystemService(BatteryManager.class);
                int current=manager==null?Integer.MIN_VALUE:manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_NOW);
                int voltage=battery.getIntExtra(BatteryManager.EXTRA_VOLTAGE,-1);
                // Android specifies microamperes and millivolts. Net battery power,
                // not CPU/GPU chip power; while charging it is charging power.
                if(current!=Integer.MIN_VALUE&&voltage>=1000&&voltage<=20000){
                    double watts=Math.abs((double)current*voltage/1e9);
                    if(watts<=500)values[3]=watts;
                }
            }
            if(GamePerformanceMonitorConfig.selected(selection,"cpu_temperature")||GamePerformanceMonitorConfig.selected(selection,"gpu_temperature")){
                Bundle sample=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"hardware_telemetry",null,null);
                if(sample!=null&&Math.abs(SystemClock.elapsedRealtime()-sample.getLong("sampledAt",-100000))<10000){
                    values[1]=sample.getDouble("cpu",Double.NaN);values[2]=sample.getDouble("gpu",Double.NaN);
                }
            }
        }catch(RuntimeException unavailable){/* Preserve unavailable readings; never substitute unrelated sensors. */}
        return values;
    }
    private static TextView findText(View view){if(view instanceof TextView)return (TextView)view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=findText(((ViewGroup)view).getChildAt(i));if(found!=null)return found;}
        return null;}
}
