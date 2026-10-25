package ls.augment.com;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;

/** Manual health check on the existing third-level page; retained state owns no Activity. */
final class BatteryHealthPanel {
    static final class State {
        BatteryHealthReader.Sample sample;boolean loading;Runnable listener;
        void detect(ExecutorService worker){
            if(loading)return;loading=true;changed();
            worker.execute(()->{
                BatteryHealthReader.Sample next;
                try{next=BatteryHealthReader.read();}
                catch(RuntimeException error){next=new BatteryHealthReader.Sample("","系统接口","电池数据读取失败，请重试。",System.currentTimeMillis());}
                BatteryHealthReader.Sample result=next;
                new Handler(Looper.getMainLooper()).post(()->{sample=result;loading=false;changed();});
            });
        }
        void changed(){if(listener!=null)listener.run();}
        Bundle save(){Bundle bundle=new Bundle();if(sample!=null){bundle.putString("raw",sample.raw);bundle.putString("access",sample.access);bundle.putString("note",sample.note);bundle.putLong("at",sample.at);}return bundle;}
        void restore(Bundle bundle){if(bundle!=null&&bundle.containsKey("at"))sample=new BatteryHealthReader.Sample(bundle.getString("raw",""),bundle.getString("access",""),bundle.getString("note",""),bundle.getLong("at"));}
    }
    private final UiKit ui;private final State state;private final Button detect;private final TextView status;
    private final LinearLayout view,results;private final Runnable changed=this::render;
    BatteryHealthPanel(UiKit ui,State state,ExecutorService worker){
        this.ui=ui;this.state=state;
        view=new LinearLayout(ui.activity);view.setOrientation(LinearLayout.VERTICAL);view.setTag("battery-health-panel");
        LinearLayout action=ui.preferenceCard();action.setTag("battery-health-action-card");
        status=ui.text("",13,ui.muted,false);status.setTag("battery-health-status");action.addView(status,ui.margins(0,8,0,12));
        detect=ui.tonalButton("开始检测");detect.setTag("battery-health-detect");detect.setMinHeight(ui.dp(48));
        detect.setOnClickListener(button->state.detect(worker));action.addView(detect,ui.margins(0,0,0,8));view.addView(action,ui.wrap());
        ui.addDetailSectionTitle(view,"检测结果");results=ui.preferenceCard();results.setTag("battery-health-results");view.addView(results,ui.wrap());
        TextView explanation=ui.text("健康度根据满充容量与设计容量估算，会随电池计量校准变化。各项目以本机可读取的数据为准。",12,ui.muted,false);
        view.addView(explanation,ui.margins(0,12,0,0));state.listener=changed;render();
    }
    View view(){return view;}
    void close(){if(state.listener==changed)state.listener=null;}
    private void render(){
        detect.setEnabled(!state.loading);detect.setText(state.loading?"正在检测…":state.sample==null?"开始检测":"重新检测");
        status.setText(state.loading?"正在读取本机电池数据…":state.sample==null?"检测电池健康度、满充容量、设计容量和循环次数。":"检测时间："+DateFormat.getDateTimeInstance(DateFormat.SHORT,DateFormat.MEDIUM).format(new Date(state.sample.at)));
        results.removeAllViews();
        if(state.sample==null){results.addView(ui.text("尚未检测",14,ui.muted,false),ui.wrap());return;}
        if(!state.sample.note.isEmpty())results.addView(ui.text(state.sample.note,13,ui.muted,false),ui.margins(0,0,0,12));
        List<BatteryHealthData.Reading> readings=BatteryHealthData.parse(state.sample.raw);
        if(readings.isEmpty()){row("估算健康度","无法计算","battery-health-percent");return;}
        for(int i=0;i<readings.size();i++){
            BatteryHealthData.Reading reading=readings.get(i);
            if(readings.size()>1)results.addView(ui.text("电池接口 "+(i+1),14,ui.text,true),ui.margins(0,i==0?0:16,0,8));
            row("估算健康度",reading.percent==null?"无法计算":String.format(Locale.ROOT,"%.1f%%",reading.percent),"battery-health-percent");
            row("满充容量",capacity(reading.full,reading.unit),"battery-health-full");
            row("设计容量",capacity(reading.design,reading.unit),"battery-health-design");
            row("循环次数",reading.cycles==null?"不可读取":reading.cycles+" 次","battery-health-cycles");
            if(!reading.reason.isEmpty())results.addView(ui.text(reading.reason,13,ui.muted,false),ui.margins(0,8,0,0));
            TextView source=ui.text("数据来源："+state.sample.access+"\n"+reading.source,12,ui.muted,false);
            source.setTag("battery-health-source");source.setTextIsSelectable(true);results.addView(source,ui.margins(0,12,0,8));
        }
    }
    private void row(String name,String value,String tag){
        LinearLayout row=new LinearLayout(ui.activity);row.setGravity(android.view.Gravity.CENTER_VERTICAL);row.setMinimumHeight(ui.dp(48));
        TextView title=ui.text(name,14,ui.text,false),content=ui.text(value,15,ui.text,true);content.setGravity(android.view.Gravity.END);content.setTag(tag);
        row.addView(title,new LinearLayout.LayoutParams(0,-2,1));row.addView(content,new LinearLayout.LayoutParams(0,-2,1));results.addView(row,ui.wrap());
    }
    private static String capacity(Long value,String unit){return value==null?"不可读取":String.format(Locale.ROOT,"%.0f %s",value/1000d,unit);}
}
